Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 06/10] drivers/hwmon/occ: Add non-hwmon attributes
Date: Thu, 27 Jul 2017 09:30:25 -0500
In-Reply-To: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1501165829-12395-7-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Create device attributes for additional OCC properties that do not
belong as hwmon sensors. These provide additional information as to the
state of the processor and system.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h |  1 +
 drivers/hwmon/occ/p8_i2c.c | 10 ++++++
 drivers/hwmon/occ/p9_sbe.c | 10 ++++++
 4 files changed, 104 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index bad7f4b..2459e12 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -19,6 +19,14 @@
 
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 
+/* OCC status bits */
+#define OCC_STAT_MASTER			0x80
+#define OCC_STAT_ACTIVE			0x01
+#define OCC_EXT_STAT_DVFS_OT		0x80
+#define OCC_EXT_STAT_DVFS_POWER		0x40
+#define OCC_EXT_STAT_MEM_THROTTLE	0x20
+#define OCC_EXT_STAT_QUICK_DROP		0x10
+
 /* OCC sensor type and version definitions */
 
 struct temp_sensor_1 {
@@ -1044,6 +1052,71 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	return 0;
 }
 
+static ssize_t occ_show_status(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	int val = 0;
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
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_show_status, NULL, 0);
+static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_show_status, NULL, 1);
+static SENSOR_DEVICE_ATTR(occ_dvfs_ot, 0444, occ_show_status, NULL, 2);
+static SENSOR_DEVICE_ATTR(occ_dvfs_power, 0444, occ_show_status, NULL, 3);
+static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, occ_show_status, NULL, 4);
+static SENSOR_DEVICE_ATTR(occ_quick_drop, 0444, occ_show_status, NULL, 5);
+static SENSOR_DEVICE_ATTR(occ_status, 0444, occ_show_status, NULL, 6);
+
+static struct attribute *occ_attributes[] = {
+	&sensor_dev_attr_occ_master.dev_attr.attr,
+	&sensor_dev_attr_occ_active.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_ot.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_power.dev_attr.attr,
+	&sensor_dev_attr_occ_mem_throttle.dev_attr.attr,
+	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
+	&sensor_dev_attr_occ_status.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group occ_attr_group = {
+	.attrs = occ_attributes,
+};
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
@@ -1124,5 +1197,15 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	rc = sysfs_create_group(&occ->bus_dev->kobj, &occ_attr_group);
+	if (rc)
+		dev_warn(occ->bus_dev, "failed to create status attrs: %d\n",
+			 rc);
+
 	return 0;
 }
+
+void occ_shutdown(struct occ *occ)
+{
+	sysfs_remove_group(&occ->bus_dev->kobj, &occ_attr_group);
+}
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 049c3b4..dc9e06d 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -110,5 +110,6 @@ struct occ {
 };
 
 int occ_setup(struct occ *occ, const char *name);
+void occ_shutdown(struct occ *occ);
 
 #endif /* OCC_COMMON_H */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 745fb52..ee9cef7 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -229,6 +229,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 	return occ_setup(occ, "p8_occ");
 }
 
+static int p8_i2c_occ_remove(struct i2c_client *client)
+{
+	struct occ *occ = dev_get_drvdata(&client->dev);
+
+	occ_shutdown(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p8_i2c_occ_of_match[] = {
 	{ .compatible = "ibm,p8-occ-hwmon" },
 	{}
@@ -242,6 +251,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		.of_match_table = p8_i2c_occ_of_match,
 	},
 	.probe = p8_i2c_occ_probe,
+	.remove = p8_i2c_occ_remove,
 };
 
 module_i2c_driver(p8_i2c_occ_driver);
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 667d190..d36ce0b 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -94,6 +94,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return occ_setup(occ, "p9_occ");
 }
 
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+
+	occ_shutdown(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p9_sbe_occ_of_match[] = {
 	{ .compatible = "ibm,p9-occ-hwmon" },
 	{ },
@@ -105,6 +114,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1
