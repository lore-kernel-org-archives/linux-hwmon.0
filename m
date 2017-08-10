Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56583 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753395AbdHJV6H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 17:58:07 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7ALnUtV146960
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:58:07 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c8ssk19kp-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:58:07 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 10 Aug 2017 17:58:06 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 4/4] hwmon: (pmbus): Add debugfs for status registers
Date: Thu, 10 Aug 2017 16:57:50 -0500
In-Reply-To: <1502402270-15328-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502402270-15328-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502402270-15328-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Export all the available status registers through debugfs, if the client
driver wants them.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus.h      |   6 ++
 drivers/hwmon/pmbus/pmbus_core.c | 201 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index bfcb13b..5f91a19 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -383,6 +383,12 @@ struct pmbus_driver_info {
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
+
+	/*
+	 * Controls whether or not to create debugfs entries for this driver's
+	 * devices.
+	 */
+	bool debugfs;
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ef135d8..b11ebec 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -101,6 +102,7 @@ struct pmbus_data {
 	int num_attributes;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+	struct dentry *debugfs;		/* debugfs device directory */
 
 	struct pmbus_sensor *sensors;
 
@@ -120,6 +122,12 @@ struct pmbus_data {
 	u8 currpage;
 };
 
+struct pmbus_debugfs_entry {
+	struct i2c_client *client;
+	u8 page;
+	u8 reg;
+};
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -1893,6 +1901,184 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 }
 #endif
 
+static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int pmbus_debugfs_get(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+
+	*val = _pmbus_read_byte_data(entry->client, entry->page, entry->reg);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
+			 "0x%02llx\n");
+
+static int pmbus_debugfs_get_status(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
+
+	*val = pdata->read_status(entry->client, entry->page);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
+			 NULL, "0x%04llx\n");
+
+static int pmbus_init_debugfs(struct i2c_client *client,
+			      struct pmbus_data *data)
+{
+	int i, idx = 0;
+	char name[PMBUS_NAME_SIZE];
+	struct pmbus_debugfs_entry *entries;
+
+	/* Check if client driver requested debugfs support. */
+	if (!data->info->debugfs)
+		return 0;
+
+	/* Create the root pmbus debugfs directory if it's not created yet. */
+	if (!pmbus_debugfs_dir) {
+		pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
+		if (IS_ERR_OR_NULL(pmbus_debugfs_dir)) {
+			pmbus_debugfs_dir = NULL;
+			return -ENODEV;
+		}
+	}
+
+	/*
+	 * Create the debugfs directory for this device. Use the hwmon device
+	 * name to avoid conflicts (hwmon numbers are globally unique).
+	 */
+	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
+					   pmbus_debugfs_dir);
+	if (IS_ERR_OR_NULL(data->debugfs)) {
+		data->debugfs = NULL;
+		return -ENODEV;
+	}
+
+	/* Allocate the max possible entries we need. */
+	entries = devm_kzalloc(data->dev,
+			       sizeof(*entries) * (data->info->pages * 10),
+			       GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	for (i = 0; i < data->info->pages; ++i) {
+		/* Check accessibility of status register if it's not page 0 */
+		if (!i || pmbus_check_status_register(client, i)) {
+			/* No need to set reg as we have special read op. */
+			entries[idx].client = client;
+			entries[idx].page = i;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_status);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_VOUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_IOUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_INPUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_CML;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_OTHER;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i,
+					      PMBUS_STATUS_MFR_SPECIFIC)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_MFR_SPECIFIC;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_12;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_34;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+	}
+
+	return 0;
+}
+#else
+static int pmbus_init_debugfs(struct i2c_client *client,
+			      struct pmbus_data *data)
+{
+	return 0;
+}
+#endif	/* IS_ENABLED(CONFIG_DEBUG_FS) */
+
 int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 		   struct pmbus_driver_info *info)
 {
@@ -1952,6 +2138,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (ret)
 		goto out_unregister;
 
+	ret = pmbus_init_debugfs(client, data);
+	if (ret)
+		dev_warn(dev, "Failed to register debugfs\n");
+
 	return 0;
 
 out_unregister:
@@ -1965,6 +2155,17 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	debugfs_remove_recursive(data->debugfs);
+	if (pmbus_debugfs_dir && simple_empty(pmbus_debugfs_dir)) {
+		/*
+		 * Remove the root pmbus debugfs directory if we've removed
+		 * all the device directories underneath already.
+		 */
+		debugfs_remove(pmbus_debugfs_dir);
+		pmbus_debugfs_dir = NULL;
+	}
+
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
 	return 0;
-- 
1.8.3.1

