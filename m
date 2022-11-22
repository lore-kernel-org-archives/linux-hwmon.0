Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496A6C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 11:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbiKVLie (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 06:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbiKVLiP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 06:38:15 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF605F86E
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:12 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id g12so24221872wrs.10
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdIBdMp3AF8wTlK3ZbNuetiQCTdvpib+4RwLHSff3bA=;
        b=Ko3D6qq0X/Q9S/oaND9aZ47sWgBSPYistB0gEGIxAs/CITTsPTijNT5eFpmpcZh4eA
         pIM9Bk8JxxtYD+gOVdVVLbdzHy89VYPtXmir/Uyg+4Wpv37+9mF2Eyr52kQIgDM6UCSk
         Suk0CAcq3wf/QwbLXtmZixKOrsTBNBugslp13Ntbds/78RoMSDpm+UQOaDJz2M0smEYx
         GIibFqnzGWZ/lEXt88+mz4wFbB4L0ypw0M0BIptL/B2OfZHMHwvKaOYerEsTqq2gwLh2
         Yx/xDiZOE4prNsky7/lWH+Zvny4jLbOVuFgs+56VeNO8NNuOWWE0B53D8v9NlqDXd4UU
         Y9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdIBdMp3AF8wTlK3ZbNuetiQCTdvpib+4RwLHSff3bA=;
        b=IOoPeQqSkfGhJEe8NSccjXA7m4OCUmTlCLR5WvVFN1YSICPDIGY5oPr++S+3z9KtC3
         tVV0oTqmARXBa6I0Tm1lW3Kzp3Ccz2AMVD8b9BcT1C1hLkbdgxoga3RgDR8n/EoxpvmW
         53RsOJXGmpyozGonDPxnq97eRzsIUwkX1FNcXy4MsCjA4yOEjoXnyQJRbQbbmUXmPfkR
         tTngtNxDw101lncitD8eR1MG5h8SdlR/X/3CEjeXVWxarCcr6nWUKuR0jlbc8n5L4WoP
         XypULF8Ic9wVwWEnRzNsDmTfPruXCuJK+meScCyG8PYEvrRUmPyVrmGiONYzwoPXrlTJ
         pxfQ==
X-Gm-Message-State: ANoB5pmeJsywoFvxb+/hYDvNqx37pecwOzSQxFhNxBIgYr/+v7k92hX+
        1BwehSizpaj/QdLfhq26C3TDVQ==
X-Google-Smtp-Source: AA0mqf4aBa3FK/8gagbzzeR11M3kkvWcGOOe/+bUocyUfgCqYwH5jPzY4hnTutCkv+H1xzXXipNR6w==
X-Received: by 2002:adf:fec7:0:b0:236:8d39:6f84 with SMTP id q7-20020adffec7000000b002368d396f84mr13166871wrs.152.1669116791291;
        Tue, 22 Nov 2022 03:33:11 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b00241bc4880fesm12914086wrt.111.2022.11.22.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 03:33:10 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org, Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (pmbus/core): Update regulator flag map
Date:   Tue, 22 Nov 2022 12:32:55 +0100
Message-Id: <20221122113257.3213700-1-Naresh.Solanki@9elements.com>
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

