Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39360 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753840AbdFVWt2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 18:49:28 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5MMnHKo172879
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:49:18 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2b8kjhqqs5-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:49:17 -0400
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 22 Jun 2017 16:49:10 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 7/7] drivers/hwmon/occ: Add error handling
Date: Thu, 22 Jun 2017 17:48:36 -0500
In-Reply-To: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1498171716-26620-8-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add logic to detect a number of error scenarios on the OCC. Export any
error through an additional non-hwmon device attribute.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/ABI/testing/sysfs-driver-occ-hwmon | 12 ++++++
 drivers/hwmon/occ/common.c                       | 53 +++++++++++++++++++++++-
 drivers/hwmon/occ/common.h                       | 13 +++++-
 drivers/hwmon/occ/p8_i2c.c                       | 10 ++++-
 drivers/hwmon/occ/p9_sbe.c                       |  9 +++-
 5 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-occ-hwmon b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
index ddf6cd7..9e2be27 100644
--- a/Documentation/ABI/testing/sysfs-driver-occ-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-occ-hwmon
@@ -24,6 +24,18 @@ Description:
 		respectively) whether or not this OCC has limited the processor
 		frequency due to power usage.
 
+What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_error
+Date:		June 2017
+KernelVersion:	4.14
+Contact:	eajames@us.ibm.com
+Description:
+		A read-only attribute that indicates any error condition
+		observed by the OCC or detected by the driver. Reading the
+		attribute will return an integer. A positive integer indicates
+		an error response from the OCC. A negative integer indicates a
+		possible bus error or other error condition detected by the
+		driver. A "0" indicates no error.
+
 What:		/sys/bus/platform/drivers/occ-hwmon/<dev>/occ_master
 Date:		June 2017
 KernelVersion:	4.14
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 1645776..f124f87 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -11,6 +11,9 @@
 #include "common.h"
 #include <linux/hwmon.h>
 
+/* counter so we can verify against count from OCC response */
+static atomic_t occ_num_occs = ATOMIC_INIT(0);
+
 /* OCC sensor type and version definitions */
 
 struct temp_sensor_1 {
@@ -112,6 +115,9 @@ struct extended_sensor {
 
 static int occ_poll(struct occ *occ)
 {
+	int rc;
+	struct occ_poll_response_header *header =
+		(struct occ_poll_response_header *)occ->resp.data;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
 
@@ -126,7 +132,32 @@ static int occ_poll(struct occ *occ)
 	cmd[7] = 0;
 
 	/* mutex should already be locked if necessary */
-	return occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd);
+	if (rc < 0)
+		return rc;
+
+	/* check for "safe" state */
+	if (header->occ_state == OCC_STATE_SAFE) {
+		if (occ->last_safe) {
+			if (time_after(jiffies,
+				       occ->last_safe + OCC_SAFE_TIMEOUT))
+				occ->error = -EHOSTDOWN;
+		} else
+			occ->last_safe = jiffies;
+	} else
+		occ->last_safe = 0;
+
+	/* verify number of present OCCs */
+	if (header->status & OCC_STAT_MASTER) {
+		if (hweight8(header->occs_present) !=
+		    atomic_read(&occ_num_occs)) {
+			occ->error = -EXDEV;
+			occ->bad_present_count++;
+		} else
+			occ->bad_present_count = 0;
+	}
+
+	return rc;
 }
 
 static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
@@ -993,6 +1024,19 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	return 0;
 }
 
+static ssize_t occ_show_error(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int error = 0;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
+	    occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
+		error = occ->error;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
+}
+
 static ssize_t occ_show_status(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -1078,6 +1122,10 @@ static int occ_create_status_attrs(struct occ *occ)
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
 							    occ_show_status,
 							    NULL, 6);
+	occ->status_attrs[7] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
+							    occ_show_error,
+							    NULL, 0);
 
 	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
 		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
@@ -1140,6 +1188,7 @@ int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
 
+	atomic_inc(&occ_num_occs);
 	mutex_init(&occ->lock);
 	occ->groups[0] = &occ->group;
 
@@ -1187,5 +1236,7 @@ int occ_shutdown(struct occ *occ)
 		device_remove_file(occ->bus_dev,
 				   &occ->status_attrs[i].dev_attr);
 
+	atomic_dec(&occ_num_occs);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dd23eac..cd04ee0 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,10 +13,13 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
-#define OCC_NUM_STATUS_ATTRS		7
+#define OCC_ERROR_COUNT_THRESHOLD	2
+
+#define OCC_NUM_STATUS_ATTRS		8
 
 #define OCC_RESP_DATA_BYTES		4089
 
+#define OCC_SAFE_TIMEOUT		msecs_to_jiffies(60000) /* 1 min */
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_TIMEOUT_MS			5000
 #define OCC_CMD_IN_PRG_MS		100
@@ -39,6 +42,9 @@
 #define OCC_EXT_STAT_MEM_THROTTLE	0x20
 #define OCC_EXT_STAT_QUICK_DROP		0x10
 
+/* OCC state enumeration */
+#define OCC_STATE_SAFE			4
+
 /* Same response format for all OCC versions.
  * Allocate the largest possible response.
  */
@@ -132,6 +138,11 @@ struct occ {
 
 	/* non-hwmon attributes for more OCC properties */
 	struct sensor_device_attribute *status_attrs;
+
+	int error;
+	unsigned int error_count;		/* num errors observed */
+	unsigned int bad_present_count;		/* num polls w/bad num occs */
+	unsigned long last_safe;		/* time entered safe state */
 };
 
 int occ_setup(struct occ *occ, const char *name);
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index cab4448..a915b79 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -161,7 +161,10 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
+	occ->error = resp->return_status;
+
 	if (rc < 0) {
+		occ->error_count++;
 		dev_warn(&client->dev, "occ bad response: %d\n",
 			 resp->return_status);
 		return rc;
@@ -169,9 +172,11 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 	data_length = get_unaligned_be16(&resp->data_length_be);
 	if (data_length > OCC_RESP_DATA_BYTES) {
+		occ->error_count++;
+		occ->error = -EDOM;
 		dev_warn(&client->dev, "occ bad data length: %d\n",
 			 data_length);
-		return -EDOM;
+		return occ->error;
 	}
 
 	/* read remaining response */
@@ -181,9 +186,12 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 			goto err;
 	}
 
+	occ->error_count = 0;
 	return data_length + 7;
 
 err:
+	occ->error_count++;
+	occ->error = rc;
 	dev_err(&client->dev, "i2c scom op failed rc: %d\n", rc);
 	return rc;
 }
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 72ee9b4..5b5885e 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -9,6 +9,7 @@
 
 #include "common.h"
 #include <linux/init.h>
+#include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/occ.h>
@@ -33,7 +34,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 retry:
 	client = occ_drv_open(p9_sbe_occ->sbe, 0);
 	if (!client)
-		return -ENODEV;
+		return -ENODEV;		/* don't increment error counter */
 
 	/* skip first byte (sequence number), OCC driver handles it */
 	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
@@ -75,15 +76,21 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
+	occ->error = resp->return_status;
+
 	if (rc < 0) {
+		occ->error_count++;
 		dev_warn(occ->bus_dev, "occ bad response: %d\n",
 			 resp->return_status);
 		return rc;
 	}
 
+	occ->error_count = 0;
 	return 0;
 
 err:
+	occ->error_count++;
+	occ->error = rc;
 	occ_drv_release(client);
 	dev_err(occ->bus_dev, "occ bus op failed rc: %d\n", rc);
 	return rc;
-- 
1.8.3.1

