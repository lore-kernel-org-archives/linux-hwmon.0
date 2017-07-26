Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38218 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750911AbdGZF4t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2017 01:56:49 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6Q5ra4P005725
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2017 01:56:49 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2bxj3b71j8-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2017 01:56:49 -0400
Received: from localhost
        by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <shilpa.bhat@linux.vnet.ibm.com>;
        Wed, 26 Jul 2017 15:56:46 +1000
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: clg@kaod.org, linux@roeck-us.net
Cc: jdelvare@suse.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, linux-hwmon@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        ego@linux.vnet.ibm.com, svaidy@linux.vnet.ibm.com,
        stewart@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [RFC] hwmon: (ibmpowernv) Add support for reset-history sensors
Date: Wed, 26 Jul 2017 11:25:38 +0530
Message-Id: <1501048538-23160-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

In P9, OCC allows for clearing the sensor min-max history. This patch
exports attribute to reset history when set will clear the history of
all the sensors owned by CSM and belonging to the chip.

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
This patch is on top of this patchset:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1453891.html

This patch creates a non-standard attribute called as reset_historyX
which clears the lowest and highest of all the sensors like power,
temperature, voltage belonging to the chip.

 drivers/hwmon/ibmpowernv.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 5ccdd0b..611e472 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -51,6 +51,7 @@ enum sensors {
 	POWER_SUPPLY,
 	POWER_INPUT,
 	CURRENT,
+	RESET_HISTORY,
 	MAX_SENSOR_TYPE,
 };
 
@@ -78,6 +79,7 @@ enum sensors {
 	{ "in"    },
 	{ "power" },
 	{ "curr"  },
+	{ "reset_history" },
 };
 
 struct sensor_data {
@@ -126,6 +128,25 @@ static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%s\n", sdata->label);
 }
 
+static ssize_t store_reset_history(struct device *dev,
+				   struct device_attribute *devattr,
+				   const char *buf, size_t count)
+{
+	struct sensor_data *sdata = container_of(devattr, struct sensor_data,
+						 dev_attr);
+	int rc;
+	int reset;
+
+	rc = kstrtoint(buf, 0, &reset);
+	if (rc)
+		return rc;
+
+	if (reset == 1)
+		rc = opal_sensor_groups_clear_history(sdata->id);
+
+	return rc ? rc : count;
+}
+
 static int __init get_logical_cpu(int hwcpu)
 {
 	int cpu;
@@ -458,6 +479,16 @@ static int create_device_attrs(struct platform_device *pdev)
 
 		create_hwmon_attr(&sdata[count], attr_name, show_sensor);
 
+		if (type == RESET_HISTORY) {
+			snprintf(sdata[count].name, MAX_ATTR_LEN, "%s%d",
+				 sensor_groups[type].name,
+				 sdata[count].hwmon_index);
+
+			sdata[count].dev_attr.attr.mode = 0220;
+			sdata[count].dev_attr.store = store_reset_history;
+			sdata[count].dev_attr.show = NULL;
+		}
+
 		pgroups[type]->attrs[sensor_groups[type].attr_count++] =
 				&sdata[count++].dev_attr.attr;
 
-- 
1.8.3.1

