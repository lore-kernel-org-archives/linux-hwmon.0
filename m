Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60266 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752150AbdKTXyK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:54:10 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNnOK4066157
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:09 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ec65mywkd-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:09 -0500
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:54:07 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 11/12] hwmon (occ): Add error handling
Date: Mon, 20 Nov 2017 17:53:40 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-12-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add logic to detect a number of error scenarios on the OCC. Export any
errors through an additional non-hwmon device attribute. The error
counting and state verification are required by the OCC hardware
specification.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/common.h |  4 ++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 53e3592..7a0606d 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -18,6 +18,11 @@
 
 #include "common.h"
 
+#define OCC_ERROR_COUNT_THRESHOLD	2	/* OCC HW defined */
+
+#define OCC_STATE_SAFE			4
+#define OCC_SAFE_TIMEOUT		msecs_to_jiffies(60000) /* 1 min */
+
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 
 #define OCC_TEMP_SENSOR_FAULT		0xFF
@@ -131,10 +136,22 @@ struct extended_sensor {
 	u8 data[6];
 } __packed;
 
+static ssize_t occ_show_error(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct occ *occ = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
+}
+
+static DEVICE_ATTR(occ_error, 0444, occ_show_error, NULL);
+
 static int occ_poll(struct occ *occ)
 {
+	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
+	int rc;
 
 	/* big endian */
 	cmd[0] = 0;			/* sequence number */
@@ -147,7 +164,33 @@ static int occ_poll(struct occ *occ)
 	cmd[7] = 0;
 
 	/* mutex should already be locked if necessary */
-	return occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd);
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+
+		return rc;
+	}
+
+	/* clear error since communication was successful */
+	occ->error_count = 0;
+	occ->error = 0;
+
+	/* check for safe state */
+	header = (struct occ_poll_response_header *)occ->resp.data;
+	if (header->occ_state == OCC_STATE_SAFE) {
+		if (occ->last_safe) {
+			if (time_after(jiffies,
+				       occ->last_safe + OCC_SAFE_TIMEOUT))
+				occ->error = -EHOSTDOWN;
+		} else {
+			occ->last_safe = jiffies;
+		}
+	} else {
+		occ->last_safe = 0;
+	}
+
+	return 0;
 }
 
 static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
@@ -176,6 +219,15 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 
 	mutex_unlock(&occ->lock);
 
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+	} else {
+		/* successful communication so clear the error */
+		occ->error_count = 0;
+		occ->error = 0;
+	}
+
 	return rc;
 }
 
@@ -1184,6 +1236,7 @@ static ssize_t occ_show_status(struct device *dev,
 	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
 	&sensor_dev_attr_occ_status.dev_attr.attr,
 	&sensor_dev_attr_occs_present.dev_attr.attr,
+	&dev_attr_occ_error.attr,
 	NULL
 };
 
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dc9e06d..cef2174 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -107,6 +107,10 @@ struct occ {
 	struct occ_attribute *attrs;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+
+	int error;
+	unsigned int error_count;	/* number of errors observed */
+	unsigned long last_safe;	/* time OCC entered safe state */
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1

