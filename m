Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35398 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752228AbdKTXyK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:54:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNnRtM120380
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:08 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ec7bw43bf-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:54:08 -0500
Received: from localhost
        by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:54:07 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 12/12] hwmon (occ): Add sysfs notification for errors and throttling
Date: Mon, 20 Nov 2017 17:53:41 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-13-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

In order to aid application usage of the error, throttling, and
presence count properties, use sysfs_notify to notify users of change on
these attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 53 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/hwmon/occ/common.h |  5 +++++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 7a0606d..7c97a4c 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -146,6 +146,8 @@ static ssize_t occ_show_error(struct device *dev,
 
 static DEVICE_ATTR(occ_error, 0444, occ_show_error, NULL);
 
+static void occ_sysfs_notify(struct occ *occ);
+
 static int occ_poll(struct occ *occ)
 {
 	struct occ_poll_response_header *header;
@@ -169,7 +171,7 @@ static int occ_poll(struct occ *occ)
 		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
 			occ->error = rc;
 
-		return rc;
+		goto done;
 	}
 
 	/* clear error since communication was successful */
@@ -190,7 +192,9 @@ static int occ_poll(struct occ *occ)
 		occ->last_safe = 0;
 	}
 
-	return 0;
+done:
+	occ_sysfs_notify(occ);
+	return rc;
 }
 
 static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
@@ -1244,6 +1248,51 @@ static ssize_t occ_show_status(struct device *dev,
 	.attrs = occ_attributes,
 };
 
+static void occ_sysfs_notify(struct occ *occ)
+{
+	const char *name;
+	struct occ_poll_response_header *header =
+		(struct occ_poll_response_header *)occ->resp.data;
+
+	/* sysfs attributes aren't loaded yet; don't proceed */
+	if (!occ->hwmon)
+		goto done;
+
+	if (header->occs_present != occ->previous_occs_present &&
+	    (header->status & OCC_STAT_MASTER)) {
+		name = sensor_dev_attr_occs_present.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+	if ((header->ext_status & OCC_EXT_STAT_DVFS_OT) !=
+	    (occ->previous_ext_status & OCC_EXT_STAT_DVFS_OT)) {
+		name = sensor_dev_attr_occ_dvfs_ot.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+	if ((header->ext_status & OCC_EXT_STAT_DVFS_POWER) !=
+	    (occ->previous_ext_status & OCC_EXT_STAT_DVFS_POWER)) {
+		name = sensor_dev_attr_occ_dvfs_power.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+	if ((header->ext_status & OCC_EXT_STAT_MEM_THROTTLE) !=
+	    (occ->previous_ext_status & OCC_EXT_STAT_MEM_THROTTLE)) {
+		name = sensor_dev_attr_occ_mem_throttle.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+	if (occ->error && occ->error != occ->previous_error) {
+		name = dev_attr_occ_error.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+done:
+	occ->previous_error = occ->error;
+	occ->previous_ext_status = header->ext_status;
+	occ->previous_occs_present = header->occs_present;
+}
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index cef2174..ffc809f 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -111,6 +111,11 @@ struct occ {
 	int error;
 	unsigned int error_count;	/* number of errors observed */
 	unsigned long last_safe;	/* time OCC entered safe state */
+
+	/* store previous poll state to compare; notify sysfs on change */
+	int previous_error;
+	u8 previous_ext_status;
+	u8 previous_occs_present;
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1

