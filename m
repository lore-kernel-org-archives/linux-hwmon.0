Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45584 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756685AbeAHVKQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 8 Jan 2018 16:10:16 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.21) with SMTP id w08L9QjW047203
        for <linux-hwmon@vger.kernel.org>; Mon, 8 Jan 2018 16:10:16 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2fcf5hjr4m-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jan 2018 16:10:15 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 8 Jan 2018 14:10:14 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, linux-kernel@vger.kernel.org, joel@jms.id.au,
        eajames@linux.vnet.ibm.com
Subject: [PATCH] hwmon (pmbus): cffps: Add PMBUS_SKIP_STATUS_CHECK
Date: Mon,  8 Jan 2018 15:10:09 -0600
Message-Id: <1515445809-19856-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This power supply device regularly fails to read VOUT_MODE due to the
CML bit going high. This results in an incorrect exponent used for the
voltage data, and therefore the power supply reports incorrect voltage.
Work around this by setting the pmbus flag to skip the CML check.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index de254747..2d6f4f4 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pmbus.h>
 
 #include "pmbus.h"
 
@@ -268,6 +269,10 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 	.read_word_data = ibm_cffps_read_word_data,
 };
 
+static struct pmbus_platform_data ibm_cffps_pdata = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
+
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
@@ -276,6 +281,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	struct dentry *ibm_cffps_dir;
 	struct ibm_cffps *psu;
 
+	client->dev.platform_data = &ibm_cffps_pdata;
 	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
 	if (rc)
 		return rc;
-- 
1.8.3.1

