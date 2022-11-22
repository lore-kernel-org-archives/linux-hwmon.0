Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8F6C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 11:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiKVLic (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 06:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbiKVLiN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 06:38:13 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BC3606AB
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b12so10456518wrn.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2zr/3LnDgZvKq+c4XGc3H/8wNdt4pUTOlQ5WTUoXqY=;
        b=RW5GjrPQStt/3N3wqzjmvb75Xed84o1+oHhxvHAmUMk4kdKH5Js+45eAVEzTJa/MoJ
         WHbR9YMfwyL11SK1dBBD2CfJHg/SRWRDxz26P9/uAlEeev3jRSzgTSQkc0ntjAN59QG5
         fUXwt6dlFo7zPX6HPRslBtwqTbfThHvhfOcRsEZ2qn4FFlrq1dwIjgMZuxSvtb50hEYu
         tX9kXMlw3pdCdzeHGB0sOlPSxAbXcGDIx7e4C9a+SsI5Vwvk0bGWXqMbEGfg1SREz5r2
         Wej3n9C5A1I73QrpK0mUiTi5UI5T6Hygct/QndPtuIiu/5Z6lGegQ6exQ89mt3QJaFb+
         NByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2zr/3LnDgZvKq+c4XGc3H/8wNdt4pUTOlQ5WTUoXqY=;
        b=sZ2dPTgjvTvT4uNs/dxBXYI+RqNCEE6zLNRl8AsSLg6SCdPveqqJ7SJFTTYoof/YZu
         Ka1PDcrYSv0xPyNYE9ZEL2PKnmAawbu4pVCqDckXy4FrpipgLV9APUgQceFXKbNGCjo+
         4BSEyvxKWdo0NLJM2ortnZK/i9lLqCnDkkWtuBDQB1MxRMNU/b39j6t0V+ttzIoPrkZh
         rkvdq224u43qSbvBRWOqKx+om76T3RMOY/gM9YN3BrlPxqN9G3qlnWB5snNpzSPRMoZs
         K5socpizojFrUZRNQx7yOZnY6p5/7xvZJkyfN6wbttyZZ2xpwdOEIL56O2NDBt1jUlHi
         T+qw==
X-Gm-Message-State: ANoB5pmB9Jykg9X+vEqUV0MuTCI0e+4dmyBkuseg93uliHFMwtbH5M1K
        caIZE15HNpBK2HG64c6GyAqfVg==
X-Google-Smtp-Source: AA0mqf4CrIPLr/j50ifVlKk7DcR6q7icqtILjB+Y0z5gNVZ2mixNP6S+Ru8dACI0XSNFDe7yBf6ypQ==
X-Received: by 2002:adf:dd8c:0:b0:236:63d4:fbbe with SMTP id x12-20020adfdd8c000000b0023663d4fbbemr14008361wrl.574.1669116792346;
        Tue, 22 Nov 2022 03:33:12 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b00241bc4880fesm12914086wrt.111.2022.11.22.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 03:33:12 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (pmbus/core): Add events to regulator flag map
Date:   Tue, 22 Nov 2022 12:32:56 +0100
Message-Id: <20221122113257.3213700-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221122113257.3213700-1-Naresh.Solanki@9elements.com>
References: <20221122113257.3213700-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add regulator events corresponding to regulator error in regulator flag
map.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 68 ++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 08f96e2b4837..7d7d10039987 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2738,9 +2738,9 @@ static int pmbus_regulator_disable(struct regulator_dev *rdev)
 	return _pmbus_regulator_on_off(rdev, 0);
 }
 
-/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
+/* A PMBus status flag and the corresponding REGULATOR_ERROR_* and REGULATOR_EVENTS_* flag */
 struct pmbus_regulator_status_assoc {
-	int pflag, rflag;
+	int pflag, rflag, eflag;
 };
 
 /* PMBus->regulator bit mappings for a PMBus status register */
@@ -2755,48 +2755,76 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 		.func = PMBUS_HAVE_STATUS_VOUT,
 		.reg = PMBUS_STATUS_VOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE },
-			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN,
+			REGULATOR_EVENT_UNDER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE,
+			REGULATOR_EVENT_UNDER_VOLTAGE },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_REGULATION_OUT,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_IOUT,
 		.reg = PMBUS_STATUS_IOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_IOUT_OC_WARNING,	 REGULATOR_ERROR_OVER_CURRENT_WARN },
-			{ PB_IOUT_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_IOUT_OC_LV_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_POUT_OP_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IOUT_OC_WARNING,	 REGULATOR_ERROR_OVER_CURRENT_WARN,
+			REGULATOR_EVENT_OVER_CURRENT_WARN },
+			{ PB_IOUT_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_IOUT_OC_LV_FAULT,	 REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_POUT_OP_FAULT,	 REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_TEMP,
 		.reg = PMBUS_STATUS_TEMPERATURE,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_TEMP_OT_WARNING,	 REGULATOR_ERROR_OVER_TEMP_WARN },
-			{ PB_TEMP_OT_FAULT,	 REGULATOR_ERROR_OVER_TEMP },
+			{ PB_TEMP_OT_WARNING,	 REGULATOR_ERROR_OVER_TEMP_WARN,
+			REGULATOR_EVENT_OVER_TEMP_WARN },
+			{ PB_TEMP_OT_FAULT,	 REGULATOR_ERROR_OVER_TEMP,
+			REGULATOR_EVENT_OVER_TEMP },
 			{ },
 		},
 	}, {
 		.func = -1,
 		.reg = PMBUS_STATUS_BYTE,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_STATUS_IOUT_OC,	 REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_STATUS_VOUT_OV,	 REGULATOR_ERROR_REGULATION_OUT },
-			{ PB_STATUS_VIN_UV,	 REGULATOR_ERROR_UNDER_VOLTAGE },
-			{ PB_STATUS_NONE_ABOVE,  REGULATOR_ERROR_FAIL },
+			{ PB_STATUS_IOUT_OC,	 REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_STATUS_VOUT_OV,	 REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_STATUS_VIN_UV,	 REGULATOR_ERROR_UNDER_VOLTAGE,
+			REGULATOR_EVENT_UNDER_VOLTAGE },
+			{ PB_STATUS_OFF,	 0,
+			REGULATOR_EVENT_DISABLE },
+			{ PB_STATUS_NONE_ABOVE,  REGULATOR_ERROR_FAIL,
+			REGULATOR_EVENT_FAIL },
+			{ },
+		},
+	}, {
+		.func = -1,
+		.reg = PMBUS_STATUS_WORD,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_STATUS_POWER_GOOD_N, 0,
+			REGULATOR_EVENT_REGULATION_OUT },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_INPUT,
 		.reg = PMBUS_STATUS_INPUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_IIN_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_OVER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_IIN_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE,
+			REGULATOR_EVENT_UNDER_VOLTAGE },
 			{ },
 		},
 	},
-- 
2.37.3

