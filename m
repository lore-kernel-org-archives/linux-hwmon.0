Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0851C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 13:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiKVNuY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 08:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbiKVNuX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 08:50:23 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FAF5E3FE
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 05:50:22 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id b12so11001248wrn.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 05:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2zr/3LnDgZvKq+c4XGc3H/8wNdt4pUTOlQ5WTUoXqY=;
        b=T7dOFALULTJ7RCXwLpoc1ogo/zlyXJl7R9/WAcrl+IfjgWx1F8u61ctPcVbDoRJ3QA
         FuP+WQYnARMSSKbzN5/VPyK9acoyqr9JvKIS4Dkvc/ChB8EZW/csYzC+KOsI0Z8po1hB
         0v7A8uljgjn/SkY8n4ZkcUIvwgl1Glp+xJkutNjjckyuGfHZoVgIE9KUnagMtYJMzV8X
         D7fSNeFNIpOW078i568ez0JJujhFkMmnJY9NEpioN7GQrdBtsh3nFGMV68ifDqDM2uqJ
         FCv1UjucOER1x+qZK+awD438DbM5symYMP5QW6fFIlEU2MY0aepVYk71l3M7JdyiXrnq
         M0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2zr/3LnDgZvKq+c4XGc3H/8wNdt4pUTOlQ5WTUoXqY=;
        b=etfxvMU3TrWQ9VW/zYN57CM2GlYa+xVZtdmtKKd0MYVJ/BvY0d79zWp8R12eJM6S88
         B8IolqQdf6bxw0b94qn4N8KPKE4CWBTDgkIzDEiJLnvqbkdXDJPeB+h+n/DP9xGxit7x
         Umq1IZh1aq8wRXXgt0/vra8ulQGdhOZMyFWTMTedoeOQGB7+4KAuKXqrw8x3DARgBZTp
         pGxgcwUiSg96urZpbNHGE4Jb7VCXNzI1W4tHv4C2HFGsChNbpmeVREiIM6jWtBK0Jbzu
         RTefnr3Spv764pyIcKMF1BuUKfMS9+UwkYdHdhCeVrMxRx+uViSjGAGqhcsr1BOFcEw/
         YrSQ==
X-Gm-Message-State: ANoB5pk1my/vZTiQaQYAGT54KSArmQyQ63kYgykRlY2G/b74S6UKH5QL
        68w4EnxsXiuSwEc+UAe8EXcCAA==
X-Google-Smtp-Source: AA0mqf6lQPt/i+3odPWP2zou3RvQNsS2BWvswv9MEZx4vP37nOD/xdg/HxUauSPvaeLgS8p/NbIlxQ==
X-Received: by 2002:adf:d0ca:0:b0:236:8ead:4871 with SMTP id z10-20020adfd0ca000000b002368ead4871mr14371511wrh.498.1669125020593;
        Tue, 22 Nov 2022 05:50:20 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c465100b003cf483ee8e0sm19947254wmo.24.2022.11.22.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 05:50:20 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (pmbus/core): Add events to regulator flag map
Date:   Tue, 22 Nov 2022 14:50:12 +0100
Message-Id: <20221122135014.3504094-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221122135014.3504094-1-Naresh.Solanki@9elements.com>
References: <20221122135014.3504094-1-Naresh.Solanki@9elements.com>
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

