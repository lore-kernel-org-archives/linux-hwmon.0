Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6A0C4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiLATbP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbiLATak (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:30:40 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44627C8D20
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:30:32 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id td2so6625997ejc.5
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fKvZImztyAGYKm8N5WHEv0DzFDUrZgSaslqn8pXCp4=;
        b=EnlxFW2of+UDwHxryW+kMpzqGXuxTDwAoNmcTHslWecr9SBkZJdHuMHWFI08pKCaug
         1vntP/acflKa9IY5WkpTy7G5Mcv2izHZGHe6BPpGPSxCG/+eyzE8f3wJEoXjNZ/QsSr+
         VEtbfeSCQYFJwxPkqbb8gOICofHTknEtCusDwm6YpYDoy48e/MInC2BPOF4oNQ8dSvzw
         SG+q4W/qWaSoqaadUcg51bK6Ba1y6+PtskkmmZ1ujxihHD8Q42mMektfENTMx9PrMyUk
         cBgMwyLOauec7NlPc7jnpoUJQr7RUytiE+/uaBM0AN1VRsjJfzqgeW2qj0SSd8xBePRn
         pv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fKvZImztyAGYKm8N5WHEv0DzFDUrZgSaslqn8pXCp4=;
        b=r8ZQes3fjfUky0fkvwN+N0b1zn89vgV7AcySm72QRtW2vx1YJy7YK2R8Rk1qNCuQ7D
         I6YRHCRJfjbxohE5MZMbmDtnRNjAVlVlJXBHxKCNZFjRouwZLxt42FyeG0dP8ymI/4tj
         bDO62QDG9S1CzDTsUEduWyOIsbtYZ6gbAiugXzvpfirLTKdUijWZjeSd3XLd6EeXy6dz
         p3KlZJ+p+fGZecKjxyU86f0N3vOP8fI3k9lNNGsNrc8omOF7nSro9qGmHpK72LRcOtK6
         5MK7X0O2+WskDkyw5yj0LJWm267XMZS1M7MutcAOkZ3Scw0qTfgUymV9yDsCFhqSCT/d
         e8/g==
X-Gm-Message-State: ANoB5pkMB1WxGVhOmPdv5y1lupQdCdkzIRskakFZh4joH/3UsRPE2fL2
        XXueDTqWdFO4A31UR4cJNr+2cA==
X-Google-Smtp-Source: AA0mqf4koTAajDL3O33f8A2i615xXP/JTt7Jmfrroko8lEHAPS5WgC+T5WvGS6IO0M31Ogsh1ZKGWg==
X-Received: by 2002:a17:906:f8cc:b0:7ad:92fa:589e with SMTP id lh12-20020a170906f8cc00b007ad92fa589emr40140822ejb.668.1669923030836;
        Thu, 01 Dec 2022 11:30:30 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7c84f000000b004619f024864sm2054110edt.81.2022.12.01.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:30 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v5 1/5] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Thu,  1 Dec 2022 20:30:20 +0100
Message-Id: <20221201193025.1584365-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator device in pmbus_data & initialize the same during PMBus
regulator register.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

---
Change in V5:
- Fix error check for rdev
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 95e95783972a..a95f998ca247 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -81,6 +81,7 @@ struct pmbus_label {
 struct pmbus_data {
 	struct device *dev;
 	struct device *hwmon_dev;
+	struct regulator_dev **rdevs;
 
 	u32 flags;		/* from platform data */
 
@@ -3050,9 +3051,13 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	struct device *dev = data->dev;
 	const struct pmbus_driver_info *info = data->info;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
-	struct regulator_dev *rdev;
 	int i;
 
+	data->rdevs = devm_kzalloc(dev, sizeof(struct regulator_dev *) * info->num_regulators,
+				  GFP_KERNEL);
+	if (!data->rdevs)
+		return -ENOMEM;
+
 	for (i = 0; i < info->num_regulators; i++) {
 		struct regulator_config config = { };
 
@@ -3062,10 +3067,10 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 		if (pdata && pdata->reg_init_data)
 			config.init_data = &pdata->reg_init_data[i];
 
-		rdev = devm_regulator_register(dev, &info->reg_desc[i],
+		data->rdevs[i] = devm_regulator_register(dev, &info->reg_desc[i],
 					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(dev, PTR_ERR(rdev),
+		if (IS_ERR(data->rdevs[i]))
+			return dev_err_probe(dev, PTR_ERR(data->rdevs[i]),
 					     "Failed to register %s regulator\n",
 					     info->reg_desc[i].name);
 	}

base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
-- 
2.37.3

