Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36EEC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 17:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiK3RDU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiK3RCg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 12:02:36 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E725900E7
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:59:05 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v1so28084352wrt.11
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm/vpmwhJgDMht8f1OqkuJQbgIo2XHirTX9u59ErmCw=;
        b=JczN02E2zUniQkFSyinTgUEgZkWxCQCQSlzEMSi7CUA4UKbNvxpK6XTXLRb+e9Es6L
         T9kO4KLNbSPTgabKho0R11ejZjEQ3DiHnow9x5n832MbzEpejgflvfFsYd4u9+Le5rZb
         WA5teiVt2J4tLcHokkfz1geKUkExaZe+BmRIFdEu9b0tWIavvo0SMJdhGGdu7j59DGjG
         SzflNFalp1RZ09Ln6FDQaI1UOV2IgDGIbaPqpa9RjqhVKohecpAFdE69uHGYpaHDA517
         lx7ILYaN6RbWkyjiunk1HcLktKKQCJCSp0x5o2Mr3OdzJT+nHw8PVPIizB4zTLo8TCUe
         JUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm/vpmwhJgDMht8f1OqkuJQbgIo2XHirTX9u59ErmCw=;
        b=BYQRadxHnqDo9GZDWy64amGEhNnqTMgDobrfr6z2j6VFsPVL+Nc2q2GaX+7G5H5dEJ
         ibZihutOz7pFUz7c3AKbM1cgmoFEj99uQlaZ27V8G4f+WGRuIell9NjPXGIJsVyp1eBC
         gebqDdzCWY8+psxRoEDaSYW6K30vEKZOPmFvCY9QSrArRikC2a/h6FBhh3p7IstAKJzn
         Ob28h7FXS+/28aTo/7gVjQRmUbn0PWaAuv+z8xEx6fmD6oiT9DwiPilcqyJgXtZv77xV
         ncAnzj4S+AHot6HcxxJPFX9+Qmxt78bk1PiZPzu/KsvBliYzswmgsFRF9sDoRu2yYyWr
         lkrw==
X-Gm-Message-State: ANoB5pk2XTUSSW1nG1qf+1IZ+Gta8MiHxd4k7MSJYvYP90XDNR2l3k4x
        WH6A48ZTyMmHvW7r2CqYNLh06A==
X-Google-Smtp-Source: AA0mqf5VYMIGBkoe+9W0ftAz/MRPnbbwFxCHlxVcjBQ7amTWdrP924+2qGdvj3bOQD6mp8ZQZfJs1A==
X-Received: by 2002:a05:6000:702:b0:241:b881:22af with SMTP id bs2-20020a056000070200b00241b88122afmr28683544wrb.652.1669827534436;
        Wed, 30 Nov 2022 08:58:54 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003cfa622a18asm6066895wma.3.2022.11.30.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:58:54 -0800 (PST)
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
Date:   Wed, 30 Nov 2022 17:58:28 +0100
Message-Id: <20221130165833.3478555-1-Naresh.Solanki@9elements.com>
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

