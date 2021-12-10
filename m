Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE14C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243101AbhLJUFW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:21 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102DEC061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:46 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bj13so14725177oib.4
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kA+VDgLXqZ1omHVz2/EDZQ5F4N/5S0G6z3LKduTvXUE=;
        b=ZMNKtEnPu40dUg7DHFpTYrgw3+UlPpUY/tYWfxcWhHsHtwTDft7yanwHghtQ87lHSI
         rKmlAWRZ3lJuGWUp2+6SkCNyDvEFR5r4mb6qbNedkH/6RzHUkpLdR91aPeFEqYpzR+L/
         4Ii7bBfJkG/AmPoyEGQkUd4hi1km6fjYQUEAwEtbAXcKwczPcTUo+biuwT1dZ3YBkuf1
         g8upnyFp7Wn3EmKvX9mYA8u2LIL44vEhL9XQyYI+PyH3KyWMBeNmwp03pZM25l03jEmB
         BxzY8lWLOlAZ7RbZOvZaj8Lr9u3UqCPVxhCbQWlXKbpj4zUHEJ2ZOH2gEtXBXTHexw8D
         vp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kA+VDgLXqZ1omHVz2/EDZQ5F4N/5S0G6z3LKduTvXUE=;
        b=eFYigJsMxpk0eRMyt6McYzmISqQY3Iyu87OvLG1WFCQFQ021KKQMZVxx11RDDU4dh7
         CKMJpPy8zvOlgiQhJyAxH0aJYe3WCs73ZGp80KerI3KnVF7wpDHwMlF3PjlqC/i6lRfQ
         Gu7vbamzzvK8n/p3nK50v8c+dTd1WjEwYIt+znFCwhVjoyZhLL8FYFwOBohACUgMPK0r
         j4JJVvbdwE1qjcvs8YnraQidgQbaVcwMqLOqWAty76RKl3Gr1Kv8edazDwXEPoP/XL+x
         boz5DCJmvYF7bi5P3zhchGhiNzZx2fGAqcCKunuqYsrOkQGuPcL995pKnOZrYUMQhx0e
         uZSQ==
X-Gm-Message-State: AOAM532MykSFOUnfv5NVqMxL7Tm11PuYHZhSfh49Z3v6rL+ks+dC0VzK
        EOpp1iWbcMLoSahnZpMggmbTvxsHsVA=
X-Google-Smtp-Source: ABdhPJzuZzS0Wz+AQ9CGRfYYxNAFTq4mSx2asVnQVxNPB5ZPGbdpTr2AcbfTHd12Hi43TFcYvHVBpQ==
X-Received: by 2002:a05:6808:1a83:: with SMTP id bm3mr14689095oib.173.1639166505179;
        Fri, 10 Dec 2021 12:01:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g4sm700351oof.40.2021.12.10.12.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Lehan <krellan@google.com>
Subject: [PATCH 3/5] hwmon: (lm90) Drop critical attribute support for MAX6654
Date:   Fri, 10 Dec 2021 12:01:34 -0800
Message-Id: <20211210200136.1662127-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210200136.1662127-1-linux@roeck-us.net>
References: <20211210200136.1662127-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tests with a real chip and a closer look into the datasheet show that
MAX6654 does not support CRIT/THERM/OVERTEMP limits, so drop support
of the respective attributes for this chip.

Introduce LM90_HAVE_CRIT flag and use it to instantiate critical limit
attributes to solve the problem.

Cc: Josh Lehan <krellan@google.com>
Fixes: 229d495d8189 ("hwmon: (lm90) Add max6654 support to lm90 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 86 +++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 72969ea83d82..6597d055e09d 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -35,13 +35,14 @@
  * explicitly as max6659, or if its address is not 0x4c.
  * These chips lack the remote temperature offset feature.
  *
- * This driver also supports the MAX6654 chip made by Maxim. This chip can
- * be at 9 different addresses, similar to MAX6680/MAX6681. The MAX6654 is
- * otherwise similar to MAX6657/MAX6658/MAX6659. Extended range is available
- * by setting the configuration register accordingly, and is done during
- * initialization. Extended precision is only available at conversion rates
- * of 1 Hz and slower. Note that extended precision is not enabled by
- * default, as this driver initializes all chips to 2 Hz by design.
+ * This driver also supports the MAX6654 chip made by Maxim. This chip can be
+ * at 9 different addresses, similar to MAX6680/MAX6681. The MAX6654 is similar
+ * to MAX6657/MAX6658/MAX6659, but does not support critical temperature
+ * limits. Extended range is available by setting the configuration register
+ * accordingly, and is done during initialization. Extended precision is only
+ * available at conversion rates of 1 Hz and slower. Note that extended
+ * precision is not enabled by default, as this driver initializes all chips
+ * to 2 Hz by design.
  *
  * This driver also supports the MAX6646, MAX6647, MAX6648, MAX6649 and
  * MAX6692 chips made by Maxim.  These are again similar to the LM86,
@@ -188,6 +189,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 #define LM90_HAVE_BROKEN_ALERT	(1 << 7) /* Broken alert		*/
 #define LM90_HAVE_EXTENDED_TEMP	(1 << 8) /* extended temperature support*/
 #define LM90_PAUSE_FOR_CONFIG	(1 << 9) /* Pause conversion for config	*/
+#define LM90_HAVE_CRIT		(1 << 10)/* Chip supports CRIT/OVERT register	*/
 
 /* LM90 status */
 #define LM90_STATUS_LTHRM	(1 << 0) /* local THERM limit tripped */
@@ -354,38 +356,43 @@ struct lm90_params {
 static const struct lm90_params lm90_params[] = {
 	[adm1032] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 10,
 	},
 	[adt7461] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP
+		  | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 10,
 	},
 	[g781] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 8,
 	},
 	[lm86] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
+		  | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7b,
 		.max_convrate = 9,
 	},
 	[lm90] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
+		  | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7b,
 		.max_convrate = 9,
 	},
 	[lm99] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
+		  | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7b,
 		.max_convrate = 9,
 	},
 	[max6646] = {
+		.flags = LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 6,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
@@ -396,50 +403,50 @@ static const struct lm90_params lm90_params[] = {
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6657] = {
-		.flags = LM90_PAUSE_FOR_CONFIG,
+		.flags = LM90_PAUSE_FOR_CONFIG | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 8,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6659] = {
-		.flags = LM90_HAVE_EMERGENCY,
+		.flags = LM90_HAVE_EMERGENCY | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 8,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[max6680] = {
-		.flags = LM90_HAVE_OFFSET,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 7,
 	},
 	[max6696] = {
 		.flags = LM90_HAVE_EMERGENCY
-		  | LM90_HAVE_EMERGENCY_ALARM | LM90_HAVE_TEMP3,
+		  | LM90_HAVE_EMERGENCY_ALARM | LM90_HAVE_TEMP3 | LM90_HAVE_CRIT,
 		.alert_alarms = 0x1c7c,
 		.max_convrate = 6,
 		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
 	},
 	[w83l771] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 8,
 	},
 	[sa56004] = {
-		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT,
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7b,
 		.max_convrate = 9,
 		.reg_local_ext = SA56004_REG_R_LOCAL_TEMPL,
 	},
 	[tmp451] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 9,
 		.reg_local_ext = TMP451_REG_R_LOCAL_TEMPL,
 	},
 	[tmp461] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT
-		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP,
+		  | LM90_HAVE_BROKEN_ALERT | LM90_HAVE_EXTENDED_TEMP | LM90_HAVE_CRIT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 9,
 		.reg_local_ext = TMP451_REG_R_LOCAL_TEMPL,
@@ -668,20 +675,22 @@ static int lm90_update_limits(struct device *dev)
 	struct i2c_client *client = data->client;
 	int val;
 
-	val = lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT);
-	if (val < 0)
-		return val;
-	data->temp8[LOCAL_CRIT] = val;
+	if (data->flags & LM90_HAVE_CRIT) {
+		val = lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT);
+		if (val < 0)
+			return val;
+		data->temp8[LOCAL_CRIT] = val;
 
-	val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
-	if (val < 0)
-		return val;
-	data->temp8[REMOTE_CRIT] = val;
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
+		if (val < 0)
+			return val;
+		data->temp8[REMOTE_CRIT] = val;
 
-	val = lm90_read_reg(client, LM90_REG_R_TCRIT_HYST);
-	if (val < 0)
-		return val;
-	data->temp_hyst = val;
+		val = lm90_read_reg(client, LM90_REG_R_TCRIT_HYST);
+		if (val < 0)
+			return val;
+		data->temp_hyst = val;
+	}
 
 	val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
 	if (val < 0)
@@ -1902,11 +1911,14 @@ static int lm90_probe(struct i2c_client *client)
 	info->config = data->channel_config;
 
 	data->channel_config[0] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
+		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM;
 	data->channel_config[1] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
+		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_FAULT;
+
+	if (data->flags & LM90_HAVE_CRIT) {
+		data->channel_config[0] |= HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_CRIT_HYST;
+		data->channel_config[1] |= HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_CRIT_HYST;
+	}
 
 	if (data->flags & LM90_HAVE_OFFSET)
 		data->channel_config[1] |= HWMON_T_OFFSET;
-- 
2.33.0

