Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C771C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 19:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjGST3N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGST3N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 15:29:13 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC791FD9
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:29:08 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qMCrB-003DVh-GF; Wed, 19 Jul 2023 19:29:05 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH] hwmon: (nct6775) Fix IN scaling factors for 6798/6799
Date:   Wed, 19 Jul 2023 20:28:48 +0100
Message-Id: <20230719192848.337508-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Scaling for VTT/VIN5/VIN6 registers were based on prior chips
* Split scaling factors for 6798/6799 and assign at probe()
* Pass them through driver data to sysfs functions

Tested on nct6799 with old/new input/min/max

Fixes: 0599682b826f ("hwmon: (nct6775) Add support for NCT6798D")
Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---

Notes:
    Parked remaining 2 registers in the comments as
    setting them would be an "add" patch rather than a fix
    
    diff of affected sensors:
    - 9 VTT:         1.64 V  (min =  +0.00 V, max =  +1.80 V)
    -10 VIN5:      552.00 mV (min =  +0.45 V, max =  +0.60 V)
    -11 VIN6:      544.00 mV (min =  +0.45 V, max =  +0.60 V)
    + 9 VTT:         3.30 V  (min =  +0.00 V, max =  +3.60 V)
    +10 VIN5:        1.10 V  (min =  +0.90 V, max =  +1.20 V)
    +11 VIN6:        1.10 V  (min =  +0.90 V, max =  +1.20 V)

 drivers/hwmon/nct6775-core.c | 28 ++++++++++++++++++++++------
 drivers/hwmon/nct6775.h      |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 1664d2a1e6c3..fa0b7551ebf5 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -935,14 +935,25 @@ static const u16 scale_in[15] = {
 	800, 800
 };
 
-static inline long in_from_reg(u8 reg, u8 nr)
+/*
+ * NCT6798 scaling:
+ *    CPUVC, IN1, AVSB, 3VCC, IN0, IN8, IN4, 3VSB, VBAT,  VTT,  IN5,  IN6, IN2,
+ *      IN3, IN7
+ * Additional scales to be added later: IN9 (800), VHIF (1600)
+ */
+static const u16 scale_in_6798[15] = {
+	800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 1600, 1600, 1600, 800,
+	800, 800
+};
+
+static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 {
-	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
+	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
 }
 
-static inline u8 in_to_reg(u32 val, u8 nr)
+static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scales)
 {
-	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);
+	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scales[nr]), 0, 255);
 }
 
 /* TSI temperatures are in 8.3 format */
@@ -1653,7 +1664,8 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%ld\n", in_from_reg(data->in[nr][index], nr));
+	return sprintf(buf, "%ld\n",
+		       in_from_reg(data->in[nr][index], nr, data->scale_in));
 }
 
 static ssize_t
@@ -1671,7 +1683,7 @@ store_in_reg(struct device *dev, struct device_attribute *attr, const char *buf,
 	if (err < 0)
 		return err;
 	mutex_lock(&data->update_lock);
-	data->in[nr][index] = in_to_reg(val, nr);
+	data->in[nr][index] = in_to_reg(val, nr, data->scale_in);
 	err = nct6775_write_value(data, data->REG_IN_MINMAX[index - 1][nr], data->in[nr][index]);
 	mutex_unlock(&data->update_lock);
 	return err ? : count;
@@ -3442,6 +3454,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	mutex_init(&data->update_lock);
 	data->name = nct6775_device_names[data->kind];
 	data->bank = 0xff;		/* Force initial bank selection */
+	data->scale_in = scale_in;
 
 	switch (data->kind) {
 	case nct6106:
@@ -3957,6 +3970,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 			break;
 		}
 
+		if (data->kind == nct6798 || data->kind == nct6799)
+			data->scale_in = scale_in_6798;
+
 		reg_temp = NCT6779_REG_TEMP;
 		num_reg_temp = ARRAY_SIZE(NCT6779_REG_TEMP);
 		if (data->kind == nct6791) {
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index e8cc4f0544b8..c752bc7bbe72 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -98,6 +98,7 @@ struct nct6775_data {
 	u8 bank;		/* current register bank */
 	u8 in_num;		/* number of in inputs we have */
 	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
+	const u16 *scale_in;	/* internal scaling factors */
 	unsigned int rpm[NUM_FAN];
 	u16 fan_min[NUM_FAN];
 	u8 fan_pulses[NUM_FAN];

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
prerequisite-patch-id: 716ba83170c6c7a969faead5189f4b336097fcb5
prerequisite-patch-id: 57e03c9561d046b45ce1fd2cafa4061add8c68a0
-- 
2.39.2

