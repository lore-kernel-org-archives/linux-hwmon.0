Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35302 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752195AbdKTXyH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:54:07 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNnRkC120448
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:07 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ec7bw43au-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:06 -0500
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:54:06 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 10/12] hwmon (occ): Add non-hwmon attributes
Date: Mon, 20 Nov 2017 17:53:39 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-11-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Create device attributes for additional OCC properties that do not
belong as hwmon sensors. These provide additional information as to the
state of the processor and system.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h |  1 +
 drivers/hwmon/occ/p8_i2c.c | 10 +++++
 drivers/hwmon/occ/p9_sbe.c |  2 +
 4 files changed, 106 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 337f286b..53e3592 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -24,6 +24,14 @@
 
 #define OCC_FRU_TYPE_VRM		0x3
 
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
@@ -1108,6 +1116,81 @@ static int occ_setup_sensor_attrs(struct occ *occ)
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
+	case 7:
+		if (header->status & OCC_STAT_MASTER)
+			val = hweight8(header->occs_present);
+		else
+			val = 1;
+		break;
+	default:
+		return -EINVAL;
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
+static SENSOR_DEVICE_ATTR(occs_present, 0444, occ_show_status, NULL, 7);
+
+static struct attribute *occ_attributes[] = {
+	&sensor_dev_attr_occ_master.dev_attr.attr,
+	&sensor_dev_attr_occ_active.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_ot.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_power.dev_attr.attr,
+	&sensor_dev_attr_occ_mem_throttle.dev_attr.attr,
+	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
+	&sensor_dev_attr_occ_status.dev_attr.attr,
+	&sensor_dev_attr_occs_present.dev_attr.attr,
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
@@ -1188,5 +1271,15 @@ int occ_setup(struct occ *occ, const char *name)
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
index 8032c0b..d719632 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -230,6 +230,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
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
@@ -243,6 +252,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		.of_match_table = p8_i2c_occ_of_match,
 	},
 	.probe = p8_i2c_occ_probe,
+	.remove = p8_i2c_occ_remove,
 };
 
 module_i2c_driver(p8_i2c_occ_driver);
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index be3a469..7dbe4d5 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -135,6 +135,8 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 	p9_sbe_occ->sbe = NULL;
 	p9_sbe_occ_close_client(p9_sbe_occ);
 
+	occ_shutdown(occ);
+
 	return 0;
 }
 
-- 
1.8.3.1

