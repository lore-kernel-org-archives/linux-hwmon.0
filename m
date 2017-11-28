Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33787 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753351AbdK1A3u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 19:29:50 -0500
From: Robert Lippert <roblip@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, xow@google.com,
        Robert Lippert <rlippert@google.com>
Subject: [PATCH] hwmon: (pmbus/lm25066) Default coefficients for low current limit
Date: Mon, 27 Nov 2017 16:28:58 -0800
Message-Id: <20171128002858.1821-1-rlippert@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

There seems to be no way to detect the value of the CL/GAIN pin
from the device using PMBus.

Low current mode seems to be recommended (from LM5066 datasheet) for
improved current reporting accuracy in a typical design.

Assume the device is in low current mode unless the register override
bit is set and indicates high current limit mode.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 drivers/hwmon/pmbus/lm25066.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index aa052f4449a9..f6ae7b4cf705 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -43,6 +43,7 @@ enum chips { lm25056, lm25063, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_IIN		0xde
 #define LM25066_READ_AVG_PIN		0xdf
 
+#define LM25066_DEV_SETUP_CL_CONFIG	BIT(2)	/* Use pin or SMBus values */
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
 
 /* LM25056 only */
@@ -526,16 +527,22 @@ static int lm25066_probe(struct i2c_client *client,
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
 	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
 	info->R[PSC_POWER] = coeff[PSC_POWER].R;
-	if (config & LM25066_DEV_SETUP_CL) {
-		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
-		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
-		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
-		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
-	} else {
+
+	/*
+	 * Assume chip is in low current limit/gain mode by default unless
+	 * the register override is asserted AND indicates high limit mode.
+	 */
+	if ((config & LM25066_DEV_SETUP_CL_CONFIG) &&
+		(config & LM25066_DEV_SETUP_CL)) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
+	} else {
+		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
+		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
+		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
+		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
 	}
 
 	return pmbus_do_probe(client, id, info);
-- 
2.15.0.417.g466bffb3ac-goog

