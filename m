Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26130C46467
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 17:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiK3RFr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbiK3RFJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 12:05:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1B693A55
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:10 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w15so14917200wrl.9
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsjaiNcbOnAPHJfNdou87+1m3ymlwlqqUN1bnFhs+to=;
        b=VXKfm9GT2RJzMcTd5Yh71vxzbz1fYLOCc5qdLGU/SCeTHAiHg5CzxhCRCxz0399dlt
         d3JBLqRT7mMJnCi/YBGBD+kpG6e5RbkBmbIwgBcerkD4k/EYvS8dDLOOUxWsc40Shup4
         cWoUfZsx/kCnGrxvwlMe5Va4xahmmvb+jFI6kDHi8dIUJROqaNGEPoDSOVb8lz/O3hC4
         PE6kzym7tFV72p0mrSUnUOINR6+dBO67gi4JSwpRl73a2ZbdXnaoVrvxQqvJXVU/Ux7x
         7BJfXerl4jeuIniDS2pDCaUmZippD0w/H8Lh+5ZKTAyA/HN49ic6eX4wQ0nsWaKJO+LK
         kAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsjaiNcbOnAPHJfNdou87+1m3ymlwlqqUN1bnFhs+to=;
        b=X5yThsUafzsgdJkDhjJ1FLHKWkm2MQUr59MSYWWd6bUWghXq4ipnJJTiGQtRKwyHNz
         ug0wBqQVmt7+c3nsNpTrhqPsb523xJUpIq5EACRu0nbuMkn4pv4nXoQw0L/nEqeizH5u
         bPyJysH+AOP9ZngYNx5PUn5h1Rn7k7KeL/A5S7MUUdMErw5FwqZz+eJ9y7DavaCocIME
         Enuq70lDrd/enDHQbfZt99yEOgFE16albLUtkvg9OxRwZSR8IUjRn/P7frjVlQRpSxHU
         AWmemFnaLNMUUf8vlQ45uYpddUTOkQ/kjFQcX6yPUkfCvBztfyW++cP5w3kaqQfO93uO
         M00A==
X-Gm-Message-State: ANoB5pmKTZYHiUWdSRjTsTV/TR8JsZcwdTgYMeslzEuu/xFbCzIs+Ja7
        glAdx3bBRp5S3k6MSIQkRZT3Wg==
X-Google-Smtp-Source: AA0mqf7hsbed8fdlaMvutAG6fj2UMzC3RSLVjvhGTrpz0IR6PizokXEPfp6sm+wqMEEvQu+J75wIJw==
X-Received: by 2002:a05:6000:70f:b0:22e:41c5:7ef7 with SMTP id bs15-20020a056000070f00b0022e41c57ef7mr1079565wrb.332.1669827609089;
        Wed, 30 Nov 2022 09:00:09 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id fn7-20020a05600c688700b003c6b70a4d69sm2457159wmb.42.2022.11.30.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 09:00:08 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 2/4] hwmon: (pmbus/core): Add events to regulator flag map
Date:   Wed, 30 Nov 2022 17:59:52 +0100
Message-Id: <20221130165955.3479143-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221130165955.3479143-1-Naresh.Solanki@9elements.com>
References: <20221130165955.3479143-1-Naresh.Solanki@9elements.com>
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
 drivers/hwmon/pmbus/pmbus_core.c | 43 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index a7b4ae0f1f3b..9a9e380acc23 100644
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
@@ -2755,37 +2755,50 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 		.func = -1,
 		.reg = PMBUS_STATUS_BYTE,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_STATUS_IOUT_OC,   REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_STATUS_VOUT_OV,   REGULATOR_ERROR_REGULATION_OUT },
-			{ PB_STATUS_VIN_UV,    REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_STATUS_IOUT_OC,   REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_STATUS_VOUT_OV,   REGULATOR_ERROR_REGULATION_OUT,
+			REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+			{ PB_STATUS_VIN_UV,    REGULATOR_ERROR_UNDER_VOLTAGE,
+			REGULATOR_EVENT_UNDER_VOLTAGE },
 			{ },
 		},
 	}, {
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
-			{ PB_POUT_OP_FAULT,      REGULATOR_ERROR_FAIL },
+			{ PB_IOUT_OC_WARNING,   REGULATOR_ERROR_OVER_CURRENT_WARN,
+			REGULATOR_EVENT_OVER_CURRENT_WARN },
+			{ PB_IOUT_OC_FAULT,     REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_IOUT_OC_LV_FAULT,  REGULATOR_ERROR_OVER_CURRENT,
+			REGULATOR_EVENT_OVER_CURRENT },
+			{ PB_POUT_OP_FAULT,     REGULATOR_ERROR_FAIL,
+			REGULATOR_EVENT_FAIL },
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
-- 
2.37.3

