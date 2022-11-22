Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BB1C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 13:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbiKVNuW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 08:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233879AbiKVNuW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 08:50:22 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0749557B66
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 05:50:21 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bs21so24816438wrb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdIBdMp3AF8wTlK3ZbNuetiQCTdvpib+4RwLHSff3bA=;
        b=GN/GT8YILFMtDw5idbTOaq2XJbwgf6oXfIo2soaWOry1aPf21P6EDi9ZwKuq37Md8q
         fXZWjBqFPGIoHQCgLx3D6g7uvZgBsyAwPqaA8EcegQe0selfqywQK3anBFfTIrIXSjPn
         phay0RKVim38t/PhkOC4FTtp1FjHen6wo3/0XchM3teFVKRmyjsaWIBxRIcfN2ZuhWFK
         Q8S0ydBjRYfO/XogKok8ci/5BKfcIJOgyL195jvEsbMkUrUoPDhTfGDf4l8TH5lxszTK
         wo063b0zsp1+rZVB3G8B/E8ORIua4lonZHpMASho2r2SfwMDFwfFtEcbkDkEwTjrMsaG
         9NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdIBdMp3AF8wTlK3ZbNuetiQCTdvpib+4RwLHSff3bA=;
        b=Vvx/Wy4Y65fKk7KmNyAbdLRWW4UOGHshf+A02vZmL9LAY8uJTDnigqsNI9yCUA9/kD
         DC8FBRJObcWqcAC3PxXpTw9Zh9DVe9VCnJWPRDE5OuzsEiRnglOds8I7FmUiGK7/dRsm
         Ags50gdP7LvsjCXEU0OomGOvVki3a80Xi7l8yrOF4WCXWG6faONpkqVecOwzB4ZQG89Q
         S2uUPRvIfHkn55SZjRpM+iYfK2S+J87EIx5hjvlMvnjsIHroBIPgN+jCoRsrOiQI13yB
         4KmXsvxOnqQnow3DVRl2DfHsmnrINJ8DYz3aV0xyspDYF3ihh1wLOdbi4UixqWmbl6uM
         3sIg==
X-Gm-Message-State: ANoB5ploP0J2JnqxwktDLC3ttKPSNswPKx5/yWEBYvnbvR1JpAg1xZmc
        xcV2xdlAmbHOu3+cmxSviN2x8QdyVj5t5hMI
X-Google-Smtp-Source: AA0mqf6JLUQ/IaYfn1Zp1h227gXTlYdBHzAamG7BuVwGW+EeB1vmBKG5jK/srUats+9tIvhW6WCzZQ==
X-Received: by 2002:a05:6000:12c3:b0:236:8130:56e7 with SMTP id l3-20020a05600012c300b00236813056e7mr13930808wrx.309.1669125019603;
        Tue, 22 Nov 2022 05:50:19 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c465100b003cf483ee8e0sm19947254wmo.24.2022.11.22.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 05:50:19 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org, Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (pmbus/core): Update regulator flag map
Date:   Tue, 22 Nov 2022 14:50:11 +0100
Message-Id: <20221122135014.3504094-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator flag map for PMBUS status byte & status input.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 52 +++++++++++++++++---------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 20ca26e19db7..08f96e2b4837 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2756,26 +2756,47 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 		.reg = PMBUS_STATUS_VOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
 			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE },
 			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
-			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_REGULATION_OUT },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_IOUT,
 		.reg = PMBUS_STATUS_IOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
-			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
-			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IOUT_OC_WARNING,	 REGULATOR_ERROR_OVER_CURRENT_WARN },
+			{ PB_IOUT_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IOUT_OC_LV_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_POUT_OP_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
 			{ },
 		},
 	}, {
 		.func = PMBUS_HAVE_STATUS_TEMP,
 		.reg = PMBUS_STATUS_TEMPERATURE,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
-			{ PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
-			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
+			{ PB_TEMP_OT_WARNING,	 REGULATOR_ERROR_OVER_TEMP_WARN },
+			{ PB_TEMP_OT_FAULT,	 REGULATOR_ERROR_OVER_TEMP },
+			{ },
+		},
+	}, {
+		.func = -1,
+		.reg = PMBUS_STATUS_BYTE,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_STATUS_IOUT_OC,	 REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_STATUS_VOUT_OV,	 REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_STATUS_VIN_UV,	 REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_STATUS_NONE_ABOVE,  REGULATOR_ERROR_FAIL },
+			{ },
+		},
+	}, {
+		.func = PMBUS_HAVE_STATUS_INPUT,
+		.reg = PMBUS_STATUS_INPUT,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_IIN_OC_FAULT,	 REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_VOLTAGE_OV_FAULT,	 REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_UV_FAULT,	 REGULATOR_ERROR_UNDER_VOLTAGE },
 			{ },
 		},
 	},
@@ -2834,23 +2855,6 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 		if (status & PB_STATUS_POWER_GOOD_N)
 			*flags |= REGULATOR_ERROR_REGULATION_OUT;
 	}
-	/*
-	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
-	 * defined strictly as fault indicators (not warnings).
-	 */
-	if (status & PB_STATUS_IOUT_OC)
-		*flags |= REGULATOR_ERROR_OVER_CURRENT;
-	if (status & PB_STATUS_VOUT_OV)
-		*flags |= REGULATOR_ERROR_REGULATION_OUT;
-
-	/*
-	 * If we haven't discovered any thermal faults or warnings via
-	 * PMBUS_STATUS_TEMPERATURE, map PB_STATUS_TEMPERATURE to a warning as
-	 * a (conservative) best-effort interpretation.
-	 */
-	if (!(*flags & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
-	    (status & PB_STATUS_TEMPERATURE))
-		*flags |= REGULATOR_ERROR_OVER_TEMP_WARN;
 
 	return 0;
 }

base-commit: 2c71b3246ec3246522e8cb7c8191dc7a5d62cc70
-- 
2.37.3

