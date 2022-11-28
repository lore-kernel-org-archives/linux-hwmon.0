Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F17FC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Nov 2022 18:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiK1SAh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Nov 2022 13:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbiK1SAV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2022 13:00:21 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18C02DAA2
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 09:47:28 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z4so18170876wrr.3
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+WyB3ufPbqxDphL9azoYblwx5btpnokUgFLuY6XL+Nc=;
        b=dMbVg9JARbt2JJdz12kaQow7lhKPRkk09nFubCF5pe25fLvB8LlgIbkHu4xuQqKnVX
         XpaFsah9nlbecFE+y1V7DyEdLGTP/9YpnXeKQP2fdVRFi9mX7KXDegAu6sVPQ67psgul
         j9Wy0DNaJxH0H+IGfSbPsSOskdA4iGqeKqXqiHI8uisFKKXxYzjeHgU+eh/gSZrOyX+n
         1UU8osBlSB7zIY11NZJK60KwBweXfKe6hhI6vyze8UuoOpmRKvb8V7yoXxnf0bXJjb8e
         z5O4CGQ69R1avXysbS/k2A/ni+ULOOtA0o96bJ0s99xI+Nar9RzePaH89tAnlj7txSAQ
         4OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WyB3ufPbqxDphL9azoYblwx5btpnokUgFLuY6XL+Nc=;
        b=ELgPhDuca9JAsBgVWSnozCJld9beldCZPu8zT2bGtZ4TLEIkedySqxvKKL/j0BVe2L
         mHXeTqvSWDWJ0IoC/LNamuJTlEkzHeA8suyLBulEP5335ZdiK4RsvYw2JaxLD03Bcng9
         bcCWUsVmhsIQFXgLqnHWF2UPgDf3NtAhgU2ZupMqrb7YDAr6iPDZvcs1nKXkPqVSZ0sY
         xDzrvNj6WhiYBUb+m28Mq03hZCxoKrdJkbIdxkiidm/oNAIB/+3fRD2TvLXbt0jbAgvK
         Bb33I3WT2i6WxTJObw/IrsGX1LNtAD6bprEwUrTtw5khQ9otmjjcEiDf2QnYzmaMLMoI
         m1WA==
X-Gm-Message-State: ANoB5pnvs3/YiC9Q/GIKanNMfqLw76GBciGS+6z2tgTiP67YJ6ZTY0Yz
        XKQN8DS55Csm5/m1cp85biGO7Q==
X-Google-Smtp-Source: AA0mqf4H7lK4Nah+YYgElGJ2Z+tCqcJOcvWq/YOR5+mI+LATCsTnZE6DbHZfwKlS7pQn9MJ/9h+aXg==
X-Received: by 2002:adf:f843:0:b0:241:bcae:987f with SMTP id d3-20020adff843000000b00241bcae987fmr21883976wrq.619.1669657641824;
        Mon, 28 Nov 2022 09:47:21 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b003c6b9749505sm21090045wmq.30.2022.11.28.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:47:21 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: (pmbus/core): Update regulator flag map
Date:   Mon, 28 Nov 2022 18:47:12 +0100
Message-Id: <20221128174715.1969957-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator flag map for PMBUS status byte & status input.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 95e95783972a..f5caceaaef2a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2752,6 +2752,15 @@ struct pmbus_regulator_status_category {
 
 static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
 	{
+		.func = -1,
+		.reg = PMBUS_STATUS_BYTE,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_STATUS_IOUT_OC,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_STATUS_VOUT_OV,   REGULATOR_ERROR_REGULATION_OUT },
+			{ PB_STATUS_VIN_UV,    REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ },
+		},
+	}, {
 		.func = PMBUS_HAVE_STATUS_VOUT,
 		.reg = PMBUS_STATUS_VOUT,
 		.bits = (const struct pmbus_regulator_status_assoc[]) {
@@ -2768,6 +2777,7 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
 			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
 			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_POUT_OP_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
 			{ },
 		},
 	}, {
@@ -2778,6 +2788,18 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
 			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
 			{ },
 		},
+	}, {
+		.func = PMBUS_HAVE_STATUS_INPUT,
+		.reg = PMBUS_STATUS_INPUT,
+		.bits = (const struct pmbus_regulator_status_assoc[]) {
+			{ PB_IIN_OC_FAULT,       REGULATOR_ERROR_OVER_CURRENT },
+			{ PB_IIN_OC_WARNING,     REGULATOR_ERROR_OVER_CURRENT_WARN },
+			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
+			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_OVER_VOLTAGE_WARN },
+			{ },
+		},
 	},
 };
 
@@ -2834,14 +2856,6 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
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
 
 	/*
 	 * If we haven't discovered any thermal faults or warnings via

base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
-- 
2.37.3

