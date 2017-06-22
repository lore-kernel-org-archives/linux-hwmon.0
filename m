Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43748 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754022AbdFVWtA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 18:49:00 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5MMhn4W020264
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:59 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2b8n9ekg6d-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:48:59 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 22 Jun 2017 16:48:58 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 6/7] drivers/hwmon/occ: Add non-hwmon attributes
Date: Thu, 22 Jun 2017 17:48:35 -0500
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1498171716-26620-7-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Create device attributes for additional OCC properties that do not
belong as hwmon sensors. These provide additional information as to the
state of the processor and system.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-occ-hwmon |  65 +++++++++++++
 drivers/hwmon/occ/common.c                       | 114 +++++++++++++++++++++++
 drivers/hwmon/occ/common.h                       |  14 +++
 drivers/hwmon/occ/p8_i2c.c                       |   8 ++
 drivers/hwmon/occ/p9_sbe.c                       |   8 ++
 5 files changed, 209 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
new file mode 100644
index 0000000..ddf6cd7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
@@ -0,0 +1,65 @@
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_active
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is in the "active" state.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_ot
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_dvfs_power
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has limited the processor
+		frequency due to power usage.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC is the "master" OCC.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_mem_throttle
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not the OCC has throttled memory due
+		to over-temperature.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_quick_drop
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates (with a "1" or a "0",
+		respectively) whether or not this OCC has asserted the "quick
+		power drop" signal.
+
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_status
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates the current OCC state. The
+		value of the attribute will be one of the following states:
+		0: Reserved
+		1: Standby
+		2: Observation
+		3: Active
+		4: Safe
+		5: Characterization
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index eb1f1a1..1645776 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -993,6 +993,102 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	return 0;
 }
 
+static ssize_t occ_show_status(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	int val;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_poll_response_header *header;
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+
+	switch (sattr->index) {
+	case 0:
+		val = (header->status & OCC_STAT_MASTER) ? 1 : 0;
+		break;
+	case 1:
+		val = (header->status & OCC_STAT_ACTIVE) ? 1 : 0;
+		break;
+	case 2:
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_OT) ? 1 : 0;
+		break;
+	case 3:
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_POWER) ? 1 : 0;
+		break;
+	case 4:
+		val = (header->ext_status & OCC_EXT_STAT_MEM_THROTTLE) ? 1 : 0;
+		break;
+	case 5:
+		val = (header->ext_status & OCC_EXT_STAT_QUICK_DROP) ? 1 : 0;
+		break;
+	case 6:
+		val = header->occ_state;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static int occ_create_status_attrs(struct occ *occ)
+{
+	int rc, i;
+	struct device *dev = occ->bus_dev;
+
+	occ->status_attrs = devm_kzalloc(dev, sizeof(*occ->status_attrs) *
+					 OCC_NUM_STATUS_ATTRS, GFP_KERNEL);
+	if (!occ->status_attrs)
+		return -ENOMEM;
+
+	occ->status_attrs[0] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_master, 0444,
+							    occ_show_status,
+							    NULL, 0);
+	occ->status_attrs[1] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
+							    occ_show_status,
+							    NULL, 1);
+	occ->status_attrs[2] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_ot, 0444,
+							    occ_show_status,
+							    NULL, 2);
+	occ->status_attrs[3] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_power,
+							    0444,
+							    occ_show_status,
+							    NULL, 3);
+	occ->status_attrs[4] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_mem_throttle,
+							    0444,
+							    occ_show_status,
+							    NULL, 4);
+	occ->status_attrs[5] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_quick_drop,
+							    0444,
+							    occ_show_status,
+							    NULL, 5);
+	occ->status_attrs[6] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
+							    occ_show_status,
+							    NULL, 6);
+
+	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
+		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
+		if (rc)
+			dev_warn(dev, "error %d creating status attr %d\n", rc,
+				 i);
+	}
+
+	return 0;
+}
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
@@ -1073,5 +1169,23 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	rc = occ_create_status_attrs(occ);
+	if (rc) {
+		dev_err(occ->bus_dev, "failed to setup status attrs: %d\n",
+			rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int occ_shutdown(struct occ *occ)
+{
+	int i;
+
+	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i)
+		device_remove_file(occ->bus_dev,
+				   &occ->status_attrs[i].dev_attr);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 4bcf3ca..dd23eac 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,6 +13,8 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
+#define OCC_NUM_STATUS_ATTRS		7
+
 #define OCC_RESP_DATA_BYTES		4089
 
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
@@ -29,6 +31,14 @@
 #define RESP_RETURN_OCC_ERR		0x15
 #define RESP_RETURN_STATE		0x16
 
+/* OCC status bits */
+#define OCC_STAT_MASTER			0x80
+#define OCC_STAT_ACTIVE			0x01
+#define OCC_EXT_STAT_DVFS_OT		0x80
+#define OCC_EXT_STAT_DVFS_POWER		0x40
+#define OCC_EXT_STAT_MEM_THROTTLE	0x20
+#define OCC_EXT_STAT_QUICK_DROP		0x10
+
 /* Same response format for all OCC versions.
  * Allocate the largest possible response.
  */
@@ -119,8 +129,12 @@ struct occ {
 	struct occ_attribute *attrs;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+
+	/* non-hwmon attributes for more OCC properties */
+	struct sensor_device_attribute *status_attrs;
 };
 
 int occ_setup(struct occ *occ, const char *name);
+int occ_shutdown(struct occ *occ);
 
 #endif /* OCC_COMMON_H */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index d6d70ce..cab4448 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -209,6 +209,13 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 	return occ_setup(occ, "p8_occ");
 }
 
+static int p8_i2c_occ_remove(struct i2c_client *client)
+{
+	struct occ *occ = dev_get_drvdata(&client->dev);
+
+	return occ_shutdown(occ);
+}
+
 static const struct of_device_id p8_i2c_occ_of_match[] = {
 	{ .compatible = "ibm,p8-occ-hwmon" },
 	{}
@@ -224,6 +231,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		.of_match_table = p8_i2c_occ_of_match,
 	},
 	.probe = p8_i2c_occ_probe,
+	.remove = p8_i2c_occ_remove,
 	.address_list = p8_i2c_occ_addr,
 };
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 981c53f..72ee9b4 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -109,6 +109,13 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return occ_setup(occ, "p9_occ");
 }
 
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+
+	return occ_shutdown(occ);
+}
+
 static const struct of_device_id p9_sbe_occ_of_match[] = {
 	{ .compatible = "ibm,p9-occ-hwmon" },
 	{ },
@@ -120,6 +127,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1

