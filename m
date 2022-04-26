Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EF2C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 14:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347465AbiDZOtZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 10:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiDZOtY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 10:49:24 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4971EEFE
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 07:46:16 -0700 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QEXtD0032346;
        Tue, 26 Apr 2022 14:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jBNw/fprdtI3t584F8F/kiSN+5f6rFsUcEseyP1/LLc=;
 b=WGzx0hI/9oy5NPRkdpJ0RdlEl8RbWbB6BSb6Vu553mIYZID83ndifZLw77ZTuyhKp/ta
 Rwq+YrsIuksNPIZLGAELLHAl61/kKY4dDN93nU9zqh85QooqPAMbY6PX+BpiiXSRDVjc
 cMoTSc8KX1mHRMlZaNTd1WMghZAfqRs6oz9GtcaXpGGIQLa3il9U1ttic+WWI925+j+V
 G+3NmLk79kdSXm8b08zfA4Q5HxHxP4YH/HoW+ivucYD0sMaNqs7gvhd5KHsCZNLI/MkO
 j3I7u7X4HZIkACzzPVlg7zoxNGaXF01i34bYLNxQhqaADwnILDE7Xs5YeqNW71floT4a xg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpg48v6b4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Apr 2022 14:46:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23QEgSNg011567;
        Tue, 26 Apr 2022 14:46:00 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma03wdc.us.ibm.com with ESMTP id 3fm939dkqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Apr 2022 14:46:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23QEk0rg61079852
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Apr 2022 14:46:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 21E1C112069;
        Tue, 26 Apr 2022 14:46:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 88D68112061;
        Tue, 26 Apr 2022 14:45:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.82.59])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 26 Apr 2022 14:45:59 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, joel@jms.id.au,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] hwmon (occ): Avoid polling OCC during probe
Date:   Tue, 26 Apr 2022 09:45:55 -0500
Message-Id: <20220426144555.12120-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oie8uqKDB4QjWRFbPwcb4niu60I7XNf5
X-Proofpoint-ORIG-GUID: oie8uqKDB4QjWRFbPwcb4niu60I7XNf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260092
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of polling the OCC during the probe, use the "occ_active"
sysfs file to control when the driver polls the OCC for sensor data.
The reason for this change is that the SBE, which is the device by
which the driver communicates with the OCC, cannot handle communications
during certain system state transitions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 100 +++++++++++++++++++--------
 drivers/hwmon/occ/common.h |   5 +-
 drivers/hwmon/occ/p8_i2c.c |   2 +-
 drivers/hwmon/occ/p9_sbe.c |   2 +-
 drivers/hwmon/occ/sysfs.c  | 137 ++++++++++++++++++++++---------------
 5 files changed, 156 insertions(+), 90 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index f00cd59f1d19..d78f4bebc718 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1149,44 +1149,75 @@ static void occ_parse_poll_response(struct occ *occ)
 		sizeof(*header), size + sizeof(*header));
 }
 
-int occ_setup(struct occ *occ, const char *name)
+int occ_active(struct occ *occ, bool active)
 {
-	int rc;
-
-	mutex_init(&occ->lock);
-	occ->groups[0] = &occ->group;
+	int rc = mutex_lock_interruptible(&occ->lock);
 
-	/* no need to lock */
-	rc = occ_poll(occ);
-	if (rc == -ESHUTDOWN) {
-		dev_info(occ->bus_dev, "host is not ready\n");
-		return rc;
-	} else if (rc < 0) {
-		dev_err(occ->bus_dev,
-			"failed to get OCC poll response=%02x: %d\n",
-			occ->resp.return_status, rc);
+	if (rc)
 		return rc;
-	}
 
-	occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
-	occ_parse_poll_response(occ);
+	if (active) {
+		if (occ->active) {
+			rc = -EALREADY;
+			goto unlock;
+		}
 
-	rc = occ_setup_sensor_attrs(occ);
-	if (rc) {
-		dev_err(occ->bus_dev, "failed to setup sensor attrs: %d\n",
-			rc);
-		return rc;
-	}
+		occ->error_count = 0;
+		occ->last_safe = 0;
 
-	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev, name,
-							    occ, occ->groups);
-	if (IS_ERR(occ->hwmon)) {
-		rc = PTR_ERR(occ->hwmon);
-		dev_err(occ->bus_dev, "failed to register hwmon device: %d\n",
-			rc);
-		return rc;
+		rc = occ_poll(occ);
+		if (rc < 0) {
+			dev_err(occ->bus_dev,
+				"failed to get OCC poll response=%02x: %d\n",
+				occ->resp.return_status, rc);
+			goto unlock;
+		}
+
+		occ->active = true;
+		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
+		occ_parse_poll_response(occ);
+
+		rc = occ_setup_sensor_attrs(occ);
+		if (rc) {
+			dev_err(occ->bus_dev,
+				"failed to setup sensor attrs: %d\n", rc);
+			goto unlock;
+		}
+
+		occ->hwmon = hwmon_device_register_with_groups(occ->bus_dev,
+							       "occ", occ,
+							       occ->groups);
+		if (IS_ERR(occ->hwmon)) {
+			rc = PTR_ERR(occ->hwmon);
+			occ->hwmon = NULL;
+			dev_err(occ->bus_dev,
+				"failed to register hwmon device: %d\n", rc);
+			goto unlock;
+		}
+	} else {
+		if (!occ->active) {
+			rc = -EALREADY;
+			goto unlock;
+		}
+
+		if (occ->hwmon)
+			hwmon_device_unregister(occ->hwmon);
+		occ->active = false;
+		occ->hwmon = NULL;
 	}
 
+unlock:
+	mutex_unlock(&occ->lock);
+	return rc;
+}
+
+int occ_setup(struct occ *occ)
+{
+	int rc;
+
+	mutex_init(&occ->lock);
+	occ->groups[0] = &occ->group;
+
 	rc = occ_setup_sysfs(occ);
 	if (rc)
 		dev_err(occ->bus_dev, "failed to setup sysfs: %d\n", rc);
@@ -1195,6 +1226,15 @@ int occ_setup(struct occ *occ, const char *name)
 }
 EXPORT_SYMBOL_GPL(occ_setup);
 
+void occ_shutdown(struct occ *occ)
+{
+	occ_shutdown_sysfs(occ);
+
+	if (occ->hwmon)
+		hwmon_device_unregister(occ->hwmon);
+}
+EXPORT_SYMBOL_GPL(occ_shutdown);
+
 MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
 MODULE_DESCRIPTION("Common OCC hwmon code");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 2dd4a4d240c0..64d5ec7e169b 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -106,6 +106,7 @@ struct occ {
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 
+	bool active;
 	int error;                      /* final transfer error after retry */
 	int last_error;			/* latest transfer error */
 	unsigned int error_count;       /* number of xfr errors observed */
@@ -123,9 +124,11 @@ struct occ {
 	u8 prev_mode;
 };
 
-int occ_setup(struct occ *occ, const char *name);
+int occ_active(struct occ *occ, bool active);
+int occ_setup(struct occ *occ);
 int occ_setup_sysfs(struct occ *occ);
 void occ_shutdown(struct occ *occ);
+void occ_shutdown_sysfs(struct occ *occ);
 void occ_sysfs_poll_done(struct occ *occ);
 int occ_update_response(struct occ *occ);
 
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 9e61e1fb5142..da39ea28df31 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -223,7 +223,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client)
 	occ->poll_cmd_data = 0x10;		/* P8 OCC poll data */
 	occ->send_cmd = p8_i2c_occ_send_cmd;
 
-	return occ_setup(occ, "p8_occ");
+	return occ_setup(occ);
 }
 
 static int p8_i2c_occ_remove(struct i2c_client *client)
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 49b13cc01073..42fc7b97bb34 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -145,7 +145,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	occ->poll_cmd_data = 0x20;		/* P9 OCC poll data */
 	occ->send_cmd = p9_sbe_occ_send_cmd;
 
-	rc = occ_setup(occ, "p9_occ");
+	rc = occ_setup(occ);
 	if (rc == -ESHUTDOWN)
 		rc = -ENODEV;	/* Host is shutdown, don't spew errors */
 
diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
index b2f788a77746..2317301fc1e9 100644
--- a/drivers/hwmon/occ/sysfs.c
+++ b/drivers/hwmon/occ/sysfs.c
@@ -6,13 +6,13 @@
 #include <linux/export.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
+#include <linux/kstrtox.h>
 #include <linux/sysfs.h>
 
 #include "common.h"
 
 /* OCC status register */
 #define OCC_STAT_MASTER			BIT(7)
-#define OCC_STAT_ACTIVE			BIT(0)
 
 /* OCC extended status register */
 #define OCC_EXT_STAT_DVFS_OT		BIT(7)
@@ -22,6 +22,25 @@
 #define OCC_EXT_STAT_DVFS_VDD		BIT(3)
 #define OCC_EXT_STAT_GPU_THROTTLE	GENMASK(2, 0)
 
+static ssize_t occ_active_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	bool active;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	rc = kstrtobool(buf, &active);
+	if (rc)
+		return rc;
+
+	rc = occ_active(occ, active);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
 static ssize_t occ_sysfs_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
@@ -31,54 +50,64 @@ static ssize_t occ_sysfs_show(struct device *dev,
 	struct occ_poll_response_header *header;
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
-	rc = occ_update_response(occ);
-	if (rc)
-		return rc;
+	if (occ->active) {
+		rc = occ_update_response(occ);
+		if (rc)
+			return rc;
 
-	header = (struct occ_poll_response_header *)occ->resp.data;
-
-	switch (sattr->index) {
-	case 0:
-		val = !!(header->status & OCC_STAT_MASTER);
-		break;
-	case 1:
-		val = !!(header->status & OCC_STAT_ACTIVE);
-		break;
-	case 2:
-		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_OT);
-		break;
-	case 3:
-		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_POWER);
-		break;
-	case 4:
-		val = !!(header->ext_status & OCC_EXT_STAT_MEM_THROTTLE);
-		break;
-	case 5:
-		val = !!(header->ext_status & OCC_EXT_STAT_QUICK_DROP);
-		break;
-	case 6:
-		val = header->occ_state;
-		break;
-	case 7:
-		if (header->status & OCC_STAT_MASTER)
-			val = hweight8(header->occs_present);
-		else
+		header = (struct occ_poll_response_header *)occ->resp.data;
+
+		switch (sattr->index) {
+		case 0:
+			val = !!(header->status & OCC_STAT_MASTER);
+			break;
+		case 1:
 			val = 1;
-		break;
-	case 8:
-		val = header->ips_status;
-		break;
-	case 9:
-		val = header->mode;
-		break;
-	case 10:
-		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_VDD);
-		break;
-	case 11:
-		val = header->ext_status & OCC_EXT_STAT_GPU_THROTTLE;
-		break;
-	default:
-		return -EINVAL;
+			break;
+		case 2:
+			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_OT);
+			break;
+		case 3:
+			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_POWER);
+			break;
+		case 4:
+			val = !!(header->ext_status &
+				 OCC_EXT_STAT_MEM_THROTTLE);
+			break;
+		case 5:
+			val = !!(header->ext_status & OCC_EXT_STAT_QUICK_DROP);
+			break;
+		case 6:
+			val = header->occ_state;
+			break;
+		case 7:
+			if (header->status & OCC_STAT_MASTER)
+				val = hweight8(header->occs_present);
+			else
+				val = 1;
+			break;
+		case 8:
+			val = header->ips_status;
+			break;
+		case 9:
+			val = header->mode;
+			break;
+		case 10:
+			val = !!(header->ext_status & OCC_EXT_STAT_DVFS_VDD);
+			break;
+		case 11:
+			val = header->ext_status & OCC_EXT_STAT_GPU_THROTTLE;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		if (sattr->index == 1)
+			val = 0;
+		else if (sattr->index <= 11)
+			val = -ENODATA;
+		else
+			return -EINVAL;
 	}
 
 	return sysfs_emit(buf, "%d\n", val);
@@ -95,7 +124,8 @@ static ssize_t occ_error_show(struct device *dev,
 }
 
 static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_sysfs_show, NULL, 0);
-static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_sysfs_show, NULL, 1);
+static SENSOR_DEVICE_ATTR(occ_active, 0644, occ_sysfs_show, occ_active_store,
+			  1);
 static SENSOR_DEVICE_ATTR(occ_dvfs_overtemp, 0444, occ_sysfs_show, NULL, 2);
 static SENSOR_DEVICE_ATTR(occ_dvfs_power, 0444, occ_sysfs_show, NULL, 3);
 static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, occ_sysfs_show, NULL, 4);
@@ -139,7 +169,7 @@ void occ_sysfs_poll_done(struct occ *occ)
 	 * On the first poll response, we haven't yet created the sysfs
 	 * attributes, so don't make any notify calls.
 	 */
-	if (!occ->hwmon)
+	if (!occ->active)
 		goto done;
 
 	if ((header->status & OCC_STAT_MASTER) !=
@@ -148,12 +178,6 @@ void occ_sysfs_poll_done(struct occ *occ)
 		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
 	}
 
-	if ((header->status & OCC_STAT_ACTIVE) !=
-	    (occ->prev_stat & OCC_STAT_ACTIVE)) {
-		name = sensor_dev_attr_occ_active.dev_attr.attr.name;
-		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
-	}
-
 	if ((header->ext_status & OCC_EXT_STAT_DVFS_OT) !=
 	    (occ->prev_ext_stat & OCC_EXT_STAT_DVFS_OT)) {
 		name = sensor_dev_attr_occ_dvfs_overtemp.dev_attr.attr.name;
@@ -227,8 +251,7 @@ int occ_setup_sysfs(struct occ *occ)
 	return sysfs_create_group(&occ->bus_dev->kobj, &occ_sysfs);
 }
 
-void occ_shutdown(struct occ *occ)
+void occ_shutdown_sysfs(struct occ *occ)
 {
 	sysfs_remove_group(&occ->bus_dev->kobj, &occ_sysfs);
 }
-EXPORT_SYMBOL_GPL(occ_shutdown);
-- 
2.27.0

