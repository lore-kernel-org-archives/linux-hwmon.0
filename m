Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD99EC636F8
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiLATbU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiLATao (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:30:44 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48944CAB43
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:30:35 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id d20so3804206edn.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyxbmFSxj/AXTjphRUVPQX24S9JjJw2tXi7TXeZi100=;
        b=UzwyrrYptELQKDXnQO+KEb6NKg7boJ3UHfqukBvz6WtDqK66R+BhnXI+ppaZSHmWKv
         fe4rZ2+N02mGkWsRN+4Q5CeT3mgVcK48TV2VICSygn9FU1iHMM1x97BAwsUCK7wpJ1Bp
         MwaHF3aP/F5UDpTv+uwACOf33TZ27CcDMUi7hK+yo+dhQTawl2s+x91ZohtRWklZ80Ql
         JWHeCNpqFn7GojHIHRwb8N7C1j3779hiwywc0rAO/k0UMPo+4x1JpveEa07I5W1d09tD
         ZDmH+CTA2pe/ZF4e2BtF+DG8pvFI5WqeVnrrAH3GWmS7qMLW+VG4UhdGUsI1DFC0jEJp
         2uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyxbmFSxj/AXTjphRUVPQX24S9JjJw2tXi7TXeZi100=;
        b=j2w32l6VmWCaRCHLpL52J9KsxszIWXIoHe/ZzX2OVI+bemKjteGFCREP4vDefiSGvZ
         yOG/hD00QPTgIv7J4Ptq3oJqAuekSNzc/O5Cv4fNQhXylqtVCguAyJ9oPbeIoKpcYdxL
         fMcCWHgxV1p726F6ff/p9DYG+6FhN2ZOQdqQcEczKj/c8clCtSEueNpRuxnD+bHKoMRT
         HAJ8JEN9qptucgFFmW/xBwCk9HLMV86SRLC25v2Y6TkMw7lOU6gFwixG/JNRTLWTm5za
         rDx4iUM11clYtt4vpUGmc/sC+hZw7R9wXALJrYZWgunobjDxts+TVtH5m0cGHR2x6otp
         SE5Q==
X-Gm-Message-State: ANoB5pmBaQ075mPR3n4uyRozUIqG1NplYHqe+XCRuGadSS4yhFdQLLVs
        a8fzbPo+d0VLq8VIl2f1ghKcY0brXlRwVITJ
X-Google-Smtp-Source: AA0mqf4od7pCm3HHhVqlovUxwxz14Y99mK3tuKUsqvC7OGS8un6l5OMt6z0VQ8MS28YEp9BgOd+GiA==
X-Received: by 2002:aa7:c756:0:b0:46b:7038:b1f9 with SMTP id c22-20020aa7c756000000b0046b7038b1f9mr13754809eds.306.1669923033839;
        Thu, 01 Dec 2022 11:30:33 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7c84f000000b004619f024864sm2054110edt.81.2022.12.01.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:33 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v5 4/5] hwmon: (pmbus/core): Add regulator event support
Date:   Thu,  1 Dec 2022 20:30:23 +0100
Message-Id: <20221201193025.1584365-4-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221201193025.1584365-1-Naresh.Solanki@9elements.com>
References: <20221201193025.1584365-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add regulator events corresponding to regulator error in regulator flag
map.
Also capture the same in pmbus_regulator_get_flags.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 85 ++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ad3c0cc884a4..caefcb99aadf 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2739,9 +2739,9 @@ static int pmbus_regulator_disable(struct regulator_dev *rdev)
 	return _pmbus_regulator_on_off(rdev, 0);
 }
 
-/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
+/* A PMBus status flag and the corresponding REGULATOR_ERROR_* and REGULATOR_EVENTS_* flag */
 struct pmbus_regulator_status_assoc {
-	int pflag, rflag;
+	int pflag, rflag, eflag;
 };
 
 /* PMBus->regulator bit mappings for a PMBus status register */
@@ -2756,27 +2756,36 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 		.func = PMBUS_HAVE_STATUS_VOUT,
 		.reg = PMBUS_STATUS_VOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
-			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN,
+			REGULATOR_EVENT_UNDER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE,
+			REGULATOR_EVENT_UNDER_VOLTAGE },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_IOUT,
 		.reg = PMBUS_STATUS_IOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
-			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IOUT_OC_WARNING,   REGULATOR_ERROR_OVER_CURRENT_WARN,
+			REGULATOR_EVENT_OVER_CURRENT_WARN },
+			{ PB_IOUT_OC_FAULT,     REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_IOUT_OC_LV_FAULT,  REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_TEMP,
 		.reg = PMBUS_STATUS_TEMPERATURE,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
-			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
+			{ PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN,
+			REGULATOR_EVENT_OVER_TEMP_WARN },
+			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP,
+			REGULATOR_EVENT_OVER_TEMP },
 			{ },
 		},
 	},
@@ -2810,7 +2819,7 @@ static void pmbus_notify(struct pmbus_data *data, int page, int reg, int flags)
 }
 
 static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *error,
-				    bool notify)
+				    unsigned int *event, bool notify)
 {
 	int i, status;
 	const struct pmbus_regulator_status_category *cat;
@@ -2821,7 +2830,8 @@ static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *e
 	u8 page = rdev_get_id(rdev);
 	int func = data->info->func[page];
 
-	*flags = 0;
+	*error = 0;
+	*event = 0;
 
 	mutex_lock(&data->update_lock);
 
@@ -2836,10 +2846,11 @@ static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *e
 			return status;
 		}
 
-		for (bit = cat->bits; bit->pflag; bit++) {
-			if (status & bit->pflag)
-				*flags |= bit->rflag;
-		}
+		for (bit = cat->bits; bit->pflag; bit++)
+			if (status & bit->pflag) {
+				*error |= bit->rflag;
+				*event |= bit->eflag;
+			}
 
 		if (notify && status)
 			pmbus_notify(data, page, cat->reg, status);
@@ -2860,36 +2871,48 @@ static int pmbus_regulator_get_flags(struct regulator_dev *rdev, unsigned int *e
 		return status;
 
 	if (pmbus_regulator_is_enabled(rdev)) {
-		if (status & PB_STATUS_OFF)
-			*flags |= REGULATOR_ERROR_FAIL;
+		if (status & PB_STATUS_OFF) {
+			*error |= REGULATOR_ERROR_FAIL;
+			*event |= REGULATOR_EVENT_FAIL;
+		}
 
-		if (status & PB_STATUS_POWER_GOOD_N)
-			*flags |= REGULATOR_ERROR_REGULATION_OUT;
+		if (status & PB_STATUS_POWER_GOOD_N) {
+			*error |= REGULATOR_ERROR_REGULATION_OUT;
+			*event |= REGULATOR_EVENT_REGULATION_OUT;
+		}
 	}
 	/*
 	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
 	 * defined strictly as fault indicators (not warnings).
 	 */
-	if (status & PB_STATUS_IOUT_OC)
-		*flags |= REGULATOR_ERROR_OVER_CURRENT;
-	if (status & PB_STATUS_VOUT_OV)
-		*flags |= REGULATOR_ERROR_REGULATION_OUT;
+	if (status & PB_STATUS_IOUT_OC) {
+		*error |= REGULATOR_ERROR_OVER_CURRENT;
+		*event |= REGULATOR_EVENT_OVER_CURRENT;
+	}
+	if (status & PB_STATUS_VOUT_OV) {
+		*error |= REGULATOR_ERROR_REGULATION_OUT;
+		*event |= REGULATOR_EVENT_FAIL;
+	}
 
 	/*
 	 * If we haven't discovered any thermal faults or warnings via
 	 * PMBUS_STATUS_TEMPERATURE, map PB_STATUS_TEMPERATURE to a warning as
 	 * a (conservative) best-effort interpretation.
 	 */
-	if (!(*flags & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
-	    (status & PB_STATUS_TEMPERATURE))
-		*flags |= REGULATOR_ERROR_OVER_TEMP_WARN;
+	if (!(*error & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
+	    (status & PB_STATUS_TEMPERATURE)) {
+		*error |= REGULATOR_ERROR_OVER_TEMP_WARN;
+		*event |= REGULATOR_EVENT_OVER_TEMP_WARN;
+	}
 
 	return 0;
 }
 
 static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
 {
-	return pmbus_regulator_get_flags(rdev, flags, false);
+	int event;
+
+	return pmbus_regulator_get_flags(rdev, flags, &event, false);
 }
 
 static int pmbus_regulator_get_status(struct regulator_dev *rdev)
@@ -3123,7 +3146,7 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 {
 	struct pmbus_data *data = pdata;
 	struct i2c_client *client = to_i2c_client(data->dev);
-	int i, ret = IRQ_NONE, status;
+	int i, ret = IRQ_NONE, status, event;
 	u8 page;
 
 	for (i = 0; i < data->info->num_regulators; i++) {
@@ -3131,7 +3154,7 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (!data->rdevs[i])
 			continue;
 
-		ret = pmbus_regulator_get_flags(data->rdevs[i], &status, true);
+		ret = pmbus_regulator_get_flags(data->rdevs[i], &status, &event, true);
 		if (ret)
 			return ret;
 
-- 
2.37.3

