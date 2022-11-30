Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CD7C352A1
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 17:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiK3RFm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiK3RFF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 12:05:05 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4156F70628
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:04 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so1924916wma.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 09:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm/vpmwhJgDMht8f1OqkuJQbgIo2XHirTX9u59ErmCw=;
        b=YRIWNKwOKtKOAVADiQlwkkGbVDhFN7bL0mUA71LmY+JBSjuKhPOxzeLxkgQFb6m3rM
         Pu60RTcJEOLceyYrS6ugloVBqiNKuUzY5HPYruWg0jSoMi7Z+8TPrT/o2jYkvRB2Tqq0
         YTxs3ZIO2YNYJ9UerVamih6zqCzRT5qwSSuWzmrjrQmFsZZ5QC/dseAn1rd36uUQMwCZ
         qJfIPiQhoxCZJi/9QuxwY9P/847Vm8Xl+6w7qG3z1ZGuapVsXynsTngIbVRtir3LNXyD
         aG08Js6Ilnmj3PA9PjK6Uh1YNJC7MJP7HQXTCuslXY3ALapPSN/w0qLvLNAGHTMIhDUH
         IY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm/vpmwhJgDMht8f1OqkuJQbgIo2XHirTX9u59ErmCw=;
        b=ZsLJPdH4cN85G25BkJSnkatmn99q/t9G+Efjo7Iu5AX34Fn8WBK/QgiVa69FukIW+9
         lGc6Kr5t5rrSpf2zVfA2IBqWjxkRqGFyr2PK2oB7JV/LrZHoxfJJPwF5dnL8AaPljZU8
         YAjy+o8jivHruLSvxG+W6Jju7+YdTrlBo9zVWEQdngoZZPl11IGVqX22Ly7kzRBaXR5x
         HCfGOoMEHExl53zv+hA4L1XMetU09mce5B5jli9hXDzeInXBKrRo5H7W1b4FzX0mbALl
         3psNlRMVMSKLUJe7i6sp1G2xfxzXzZom1U6ibmBqjjJ0Bidan45lrdsKgtD1Eyv1Dz4B
         ZsdA==
X-Gm-Message-State: ANoB5plscHiX8S3mhl/u15i4v3niKRdAQDpz3PmSMDJZkjE+LwysBYDJ
        8MYARnDhNj+O6b8naoV7qrgMhkqjzKalI8aw
X-Google-Smtp-Source: AA0mqf7bZVp+Eg6fmULlxyfV3Om/6addnJlUPeBJpAiuNlvTfk1CTvzGSCZBLoPHeRpyKTtf8sNTiA==
X-Received: by 2002:a1c:6a04:0:b0:3cf:77cc:5f65 with SMTP id f4-20020a1c6a04000000b003cf77cc5f65mr39421824wmc.25.1669827602880;
        Wed, 30 Nov 2022 09:00:02 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id fn7-20020a05600c688700b003c6b70a4d69sm2457159wmb.42.2022.11.30.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 09:00:02 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 1/4] hwmon: (pmbus/core): Add status byte to regulator flag map
Date:   Wed, 30 Nov 2022 17:59:51 +0100
Message-Id: <20221130165955.3479143-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add PMBus status byte to regulator flag map.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

---
Changes:
- Remove status input
- Add comment for PMBUS status byte.
---
 drivers/hwmon/pmbus/pmbus_core.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 95e95783972a..a7b4ae0f1f3b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2751,7 +2751,16 @@ struct pmbus_regulator_status_category {
 };
 
 static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
-	{
+	{	/* STATUS byte is always present. */
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
+			{ PB_POUT_OP_FAULT,      REGULATOR_ERROR_FAIL },
 			{ },
 		},
 	}, {
@@ -2834,14 +2844,6 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
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

