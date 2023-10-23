Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00D5CDB474
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Oct 2023 13:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjJWN5d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Oct 2023 09:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjJWN5c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2023 09:57:32 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183CDC2;
        Mon, 23 Oct 2023 06:57:30 -0700 (PDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NDeDPp029795;
        Mon, 23 Oct 2023 13:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LpNYIUd51nsevlo8Yp9Gqjgnj0MVktMbftZIM9tiiGs=;
 b=sxlVayQ+FopdMQlEDCsSY2IJicXVt+QuH45bM3wpQlr2pkx7QFQMgz5cGLHSaYx1kRqF
 cY6kROxx3P9QECxO53x6bSUtj9eMv02Enfq86ArLJEqgGY/Jbj0eyIRdjrn4AANWGxgI
 3xe90FsDxZ5PRxVqoDxnZ+7IakR5Se1pi1B6xe/1H8J850GLyAZbTjwlDEVcS4KG4Ehn
 1R3x4agVAza0vWTlSEvOh+QGikd26iiDSc526SmvwOEYaNhatEndLnSqFySBMeWxLmEN
 zXCUMm8fTlbGo9SW5vVFf1G8p2Zdr+ZL19r1O/mYrMR/M7udp20iLEkpv3xDLwCEVY1Z mA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3twswv8n8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 13:57:09 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39NCGXHN023800;
        Mon, 23 Oct 2023 13:57:08 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvryss9dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 13:57:08 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
        by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39NDv7kP21299938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Oct 2023 13:57:07 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9C89D58068;
        Mon, 23 Oct 2023 13:57:07 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7C49158067;
        Mon, 23 Oct 2023 13:57:07 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
        by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
        Mon, 23 Oct 2023 13:57:07 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
        id 2444F740051; Mon, 23 Oct 2023 08:57:06 -0500 (CDT)
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     joel@jms.id.au, andrew@aj.id.au, eajames@linux.ibm.com,
        ninad@linux.ibm.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
        linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/max31785) Add delay between bus accesses
Date:   Mon, 23 Oct 2023 08:56:55 -0500
Message-Id: <20231023135655.2964972-1-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AHcmZCTGHLfEJ6eea-Q8wendvW5VnrAZ
X-Proofpoint-ORIG-GUID: AHcmZCTGHLfEJ6eea-Q8wendvW5VnrAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_12,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230121
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MAX31785 has shown erratic behaviour across multiple system
designs, unexpectedly clock stretching and NAKing transactions.

Experimentation shows that this seems to be triggered by a register access
directly back to back with a previous register write. Experimentation also
shows that inserting a small delay after register writes makes the issue go
away.

Use a similar solution to what the max15301 driver does to solve the same
problem. Create a custom set of bus read and write functions that make sure
that the delay is added.

Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
---
 drivers/hwmon/pmbus/max31785.c | 167 ++++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index f9aa576495a5..40fafb3b1867 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 IBM Corp.
  */
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -23,19 +24,98 @@ enum max31785_regs {
 
 #define MAX31785_NR_PAGES		23
 #define MAX31785_NR_FAN_PAGES		6
+#define MAX31785_WAIT_DELAY_US		250
 
-static int max31785_read_byte_data(struct i2c_client *client, int page,
-				   int reg)
+struct max31785_data {
+	ktime_t access;			/* Chip access time */
+	struct pmbus_driver_info info;
+};
+
+#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
+
+/*
+ * MAX31785 Driver Workaround
+ *
+ * The MAX31785 fan controller occasionally exhibits communication issues.
+ * These issues are not indicated by the device itself, except for occasional
+ * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
+ *
+ * To address this, we introduce a delay of 250us between consecutive accesses
+ * to the fan controller. This delay helps mitigate communication problems by
+ * allowing sufficient time between accesses.
+ */
+
+#define max31785_wait(_func, _driver_data, ...)	({			\
+	int _ret;							\
+	s64 delta = ktime_us_delta(ktime_get(), driver_data->access);	\
+	if (delta < MAX31785_WAIT_DELAY_US)				\
+		udelay(MAX31785_WAIT_DELAY_US - delta);			\
+	/* All relevant functions return int */				\
+	_ret = _func(__VA_ARGS__);					\
+	_driver_data->access = ktime_get();				\
+	_ret;								\
+})
+
+static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
+					      struct max31785_data *driver_data,
+					      int command, u16 data)
 {
-	if (page < MAX31785_NR_PAGES)
-		return -ENODATA;
+	return max31785_wait(i2c_smbus_write_byte_data, driver_data, client,
+			     command, data);
+}
+
+static int max31785_i2c_smbus_read_word_data(struct i2c_client *client,
+					     struct max31785_data *driver_data,
+					     int command)
+{
+	return max31785_wait(i2c_smbus_read_word_data, driver_data, client,
+			     command);
+}
+
+static int max31785_pmbus_read_byte_data(struct i2c_client *client,
+					 struct max31785_data *driver_data,
+					 int page, int command)
+{
+	return max31785_wait(pmbus_read_byte_data, driver_data, client, page,
+			     command);
+}
+
+static int max31785_pmbus_write_byte_data(struct i2c_client *client,
+					  struct max31785_data *driver_data,
+					  int page, int command, u16 data)
+{
+	return max31785_wait(pmbus_write_byte_data, driver_data, client, page,
+			     command, data);
+}
+
+static int max31785_pmbus_read_word_data(struct i2c_client *client,
+					 struct max31785_data *driver_data,
+					 int page, int phase, int command)
+{
+	return max31785_wait(pmbus_read_word_data, driver_data, client, page,
+			     phase, command);
+}
+
+static int max31785_pmbus_write_word_data(struct i2c_client *client,
+					  struct max31785_data *driver_data,
+					  int page, int command, u16 data)
+{
+	return max31785_wait(pmbus_write_word_data, driver_data, client, page,
+			     command, data);
+}
+
+static int max31785_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max31785_data *driver_data = to_max31785_data(info);
 
 	switch (reg) {
 	case PMBUS_VOUT_MODE:
 		return -ENOTSUPP;
 	case PMBUS_FAN_CONFIG_12:
-		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
-					    reg);
+		return max31785_pmbus_read_byte_data(client, driver_data,
+						     page - MAX31785_NR_PAGES,
+						     reg);
 	}
 
 	return -ENODATA;
@@ -102,16 +182,19 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
 	return rv;
 }
 
-static int max31785_get_pwm_mode(struct i2c_client *client, int page)
+static int max31785_get_pwm_mode(struct i2c_client *client,
+                                 struct max31785_data *driver_data, int page)
 {
 	int config;
 	int command;
 
-	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	config = max31785_pmbus_read_byte_data(client, driver_data, page,
+                                               PMBUS_FAN_CONFIG_12);
 	if (config < 0)
 		return config;
 
-	command = pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1);
+	command = max31785_pmbus_read_word_data(client, driver_data, page, 0xff,
+                                                PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -129,6 +212,8 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 static int max31785_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max31785_data *driver_data = to_max31785_data(info);
 	u32 val;
 	int rv;
 
@@ -157,7 +242,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		rv = max31785_get_pwm(client, page);
 		break;
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		rv = max31785_get_pwm_mode(client, page);
+		rv = max31785_get_pwm_mode(client, driver_data, page);
 		break;
 	default:
 		rv = -ENODATA;
@@ -188,8 +273,36 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
 	return (sensor_val * 100) / 255;
 }
 
-static int max31785_pwm_enable(struct i2c_client *client, int page,
-				    u16 word)
+static int max31785_update_fan(struct i2c_client *client,
+			       struct max31785_data *driver_data, int page,
+			       u8 config, u8 mask, u16 command)
+{
+	int from, rv;
+	u8 to;
+
+	from = max31785_pmbus_read_byte_data(client, driver_data, page,
+					     PMBUS_FAN_CONFIG_12);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+
+	if (to != from) {
+		rv = max31785_pmbus_write_byte_data(client, driver_data, page,
+						    PMBUS_FAN_CONFIG_12, to);
+		if (rv < 0)
+			return rv;
+	}
+
+	rv = max31785_pmbus_write_word_data(client, driver_data, page,
+					    PMBUS_FAN_COMMAND_1, command);
+
+	return rv;
+}
+
+static int max31785_pwm_enable(struct i2c_client *client,
+			       struct max31785_data *driver_data, int page,
+			       u16 word)
 {
 	int config = 0;
 	int rate;
@@ -217,18 +330,23 @@ static int max31785_pwm_enable(struct i2c_client *client, int page,
 		return -EINVAL;
 	}
 
-	return pmbus_update_fan(client, page, 0, config, PB_FAN_1_RPM, rate);
+	return max31785_update_fan(client, driver_data, page, config,
+                                   PB_FAN_1_RPM, rate);
 }
 
 static int max31785_write_word_data(struct i2c_client *client, int page,
 				    int reg, u16 word)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max31785_data *driver_data = to_max31785_data(info);
+
 	switch (reg) {
 	case PMBUS_VIRT_PWM_1:
-		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
-					max31785_scale_pwm(word));
+		return max31785_update_fan(client, driver_data, page, 0,
+					   PB_FAN_1_RPM,
+					   max31785_scale_pwm(word));
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		return max31785_pwm_enable(client, page, word);
+		return max31785_pwm_enable(client, driver_data, page, word);
 	default:
 		break;
 	}
@@ -303,13 +421,16 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
 {
 	int ret;
 	int i;
+	struct max31785_data *driver_data = to_max31785_data(info);
 
 	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_i2c_smbus_write_byte_data(client, driver_data,
+							 PMBUS_PAGE, i);
 		if (ret < 0)
 			return ret;
 
-		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
+		ret = max31785_i2c_smbus_read_word_data(client, driver_data,
+                                                        MFR_FAN_CONFIG);
 		if (ret < 0)
 			return ret;
 
@@ -329,6 +450,7 @@ static int max31785_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	struct max31785_data *driver_data;
 	bool dual_tach = false;
 	int ret;
 
@@ -337,13 +459,16 @@ static int max31785_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
-	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
-	if (!info)
+	driver_data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
+	if (!driver_data)
 		return -ENOMEM;
 
+	info = &driver_data->info;
+	driver_data->access = ktime_get();
 	*info = max31785_info;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_i2c_smbus_write_byte_data(client,driver_data,
+						 PMBUS_PAGE, 255);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

