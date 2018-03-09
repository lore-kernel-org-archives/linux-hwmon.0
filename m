Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36370 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751192AbeCITUJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Mar 2018 14:20:09 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w29JIjmp116312
        for <linux-hwmon@vger.kernel.org>; Fri, 9 Mar 2018 14:20:08 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gku4fdn5s-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Mar 2018 14:20:08 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Fri, 9 Mar 2018 14:20:06 -0500
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux@roeck-us.net, joel@jms.id.au,
        Christopher Bostic <cbostic@linux.vnet.ibm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 2/2] hwmon: (ucd9000) Add debugfs attributes to provide mfr_status
Date: Fri,  9 Mar 2018 13:19:56 -0600
In-Reply-To: <1520623196-9534-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520623196-9534-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1520623196-9534-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Expose the gpiN_fault fields of mfr_status as individual debugfs
attributes. This provides a way for users to be easily notified of gpi
faults. Also provide the whole mfr_status register in debugfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 172 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index e3a507f..297da0e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -36,6 +37,7 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_MFR_STATUS		0xf3
 #define UCD9000_GPIO_SELECT		0xfa
 #define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
@@ -63,13 +65,22 @@
 #define UCD901XX_NUM_GPIOS	26
 #define UCD90910_NUM_GPIOS	26
 
+#define UCD9000_DEBUGFS_NAME_LEN	24
+#define UCD9000_GPI_COUNT		8
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
 	struct gpio_chip gpio;
+	struct dentry *debugfs;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
+struct ucd9000_debugfs_entry {
+	struct i2c_client *client;
+	u8 index;
+};
+
 static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
 {
 	int fan_config = 0;
@@ -328,6 +339,156 @@ static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
 					  val);
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int ucd9000_get_mfr_status(struct i2c_client *client, u8 *buffer)
+{
+	int ret = pmbus_set_page(client, 0);
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * With the ucd90120 and ucd90124 devices, this command [MFR_STATUS]
+	 * is 2 bytes long (bits 0-15).  With the ucd90240 this command is 5
+	 * bytes long.  With all other devices, it is 4 bytes long.
+	 */
+	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS, buffer);
+}
+
+static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
+{
+	struct ucd9000_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	u8 buffer[4];
+	int ret;
+
+	/*
+	 * This attribute is only created for devices that return 4 bytes for
+	 * status_mfr, so it's safe to call with 4-byte buffer.
+	 */
+	ret = ucd9000_get_mfr_status(client, buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
+			ret);
+
+		return ret;
+	}
+
+	/*
+	 * Attribute only created for devices with gpi fault bits at bits
+	 * 16-23, which is the second byte of the response.
+	 */
+	*val = !!(buffer[1] & BIT(entry->index));
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_bit,
+			 ucd9000_debugfs_show_mfr_status_bit, NULL, "%1lld\n");
+
+static int ucd9000_debugfs_show_mfr_status_word2(void *data, u64 *val)
+{
+	struct i2c_client *client = data;
+	__be16 buffer;
+	int ret;
+
+	ret = ucd9000_get_mfr_status(client, (u8 *)&buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
+			ret);
+
+		return ret;
+	}
+
+	*val = be16_to_cpu(buffer);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_word2,
+			 ucd9000_debugfs_show_mfr_status_word2, NULL,
+			 "%04llx\n");
+
+static int ucd9000_debugfs_show_mfr_status_word4(void *data, u64 *val)
+{
+	struct i2c_client *client = data;
+	__be32 buffer;
+	int ret;
+
+	ret = ucd9000_get_mfr_status(client, (u8 *)&buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
+			ret);
+
+		return ret;
+	}
+
+	*val = be32_to_cpu(buffer);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_word4,
+			 ucd9000_debugfs_show_mfr_status_word4, NULL,
+			 "%08llx\n");
+
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				const struct i2c_device_id *mid,
+				struct ucd9000_data *data)
+{
+	struct dentry *debugfs;
+	struct ucd9000_debugfs_entry *entries;
+	int i;
+	char name[UCD9000_DEBUGFS_NAME_LEN];
+
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return -ENOENT;
+
+	data->debugfs = debugfs_create_dir(client->name, debugfs);
+	if (!data->debugfs)
+		return -ENOENT;
+
+	/*
+	 * Of the chips this driver supports, only the UCD9090, UCD90160,
+	 * and UCD90910 report GPI faults in their MFR_STATUS register, so only
+	 * create the GPI fault debugfs attributes for those chips.
+	 */
+	if (mid->driver_data == ucd9090 || mid->driver_data == ucd90160 ||
+	    mid->driver_data == ucd90910) {
+		entries = devm_kzalloc(&client->dev,
+				       sizeof(*entries) * UCD9000_GPI_COUNT,
+				       GFP_KERNEL);
+		if (!entries)
+			return -ENOMEM;
+
+		for (i = 0; i < UCD9000_GPI_COUNT; i++) {
+			entries[i].client = client;
+			entries[i].index = i;
+			scnprintf(name, UCD9000_DEBUGFS_NAME_LEN,
+				  "gpi%d_alarm", i + 1);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[i],
+					    &ucd9000_debugfs_mfr_status_bit);
+		}
+
+		scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
+		debugfs_create_file(name, 0444, data->debugfs, client,
+				    &ucd9000_debugfs_mfr_status_word4);
+	} else if (mid->driver_data == ucd90120 ||
+		   mid->driver_data == ucd90124) {
+		scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
+		debugfs_create_file(name, 0444, data->debugfs, client,
+				    &ucd9000_debugfs_mfr_status_word2);
+	}
+
+	return 0;
+}
+#else
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				struct ucd9000_data *data)
+{
+	return 0;
+}
+#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -483,7 +644,16 @@ static int ucd9000_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	ret = pmbus_do_probe(client, mid, info);
+	if (ret)
+		return ret;
+
+	ret = ucd9000_init_debugfs(client, mid, data);
+	if (ret)
+		dev_warn(&client->dev, "Failed to register debugfs: %d\n",
+			 ret);
+
+	return 0;
 }
 
 /* This is the driver that will be inserted */
-- 
1.8.3.1

