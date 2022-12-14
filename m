Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39395C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 08:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237631AbiLNIHc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 03:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237592AbiLNIH0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 03:07:26 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3ED1EEC7
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 00:07:25 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h12so18393017wrv.10
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 00:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPKbqc0ak5V4UJgzOj7j3ooXS6vGnBnkbq2OKYA/WT4=;
        b=GKMFGf7uTwbrGxI72tbBYjGVoIHtTjvHBLWSUmjOvGwhKnjG1sd1NNkSsecFPljB5r
         lg4ycYrz/8FSi/Ai9o9t2R5Bm26ByJEKc2jeKMSywKSSMzsocU8Rmx18GjSXxnxofumH
         pV1u8y2fyS6V3BIYWr3Kej7OcY67raaFmiuwQN0IymI8mIWzsZRGTTOsWplLnu6mZXN4
         HQAyAQa3zUFAoN9rnDDjdfKxmRxfSBJc9+EZkzdbubpCPbrh84SXui/oRRJc2XXcdEic
         gd/VnYDd8PoaypUf8V134FPEvEf/KbMTmLoJ/BeR+5GJdO2B3ZeaYOsaH/qTUAlwkSMn
         1krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPKbqc0ak5V4UJgzOj7j3ooXS6vGnBnkbq2OKYA/WT4=;
        b=278kecE5Do9YG8EGFV7lp/6MaYQy0MbBJNocA3CiBThQek/WrGY9i3xXP65DukchgH
         8XHNyIiH8QxN3U4dFhp57qLnVYuhL+4d7mBCLxVhFKAt4yQ1hXs+1qSZ2BJnN6w5SVdS
         Y0EPguswOqUNBzNWcmmajHF+FUCptrxNsKt6f8xCcD+NsguQG7TFTrcdBIwqf+OENVdo
         5+vn9Ep3jiwocv0+Q243j5C98wOy67Bk+VNY7OeXSG5SwqE8aN8zsBxfEgP1pCHBuSQS
         PnuDVbyC2YYn8wg0Qj1Jv+h1qQB31JUJl0W6HLMCVF3DBQB3MSCOnYcx1Iqe2Lg3WBr4
         fFPA==
X-Gm-Message-State: ANoB5pnxuAIe2TTza1mr6OKCINNjXw0IQTvyAAA8xF5ESEVGNZ0qE7yU
        UBs+03LBWokP7CW/KqrKPzSW3g==
X-Google-Smtp-Source: AA0mqf7UtxNoaFBj73SD2lWLqolQ01D/5JfjnxsBZ67/H+DBrzDzvRHvJdoB1ZaFnM4TSoqX4AJJAA==
X-Received: by 2002:adf:fc8a:0:b0:242:14bb:439d with SMTP id g10-20020adffc8a000000b0024214bb439dmr13317808wrr.43.1671005244192;
        Wed, 14 Dec 2022 00:07:24 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d5183000000b002422bc69111sm2500781wrv.9.2022.12.14.00.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 00:07:23 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH RESEND v6 3/5] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Wed, 14 Dec 2022 09:07:13 +0100
Message-Id: <20221214080715.2700442-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221214080715.2700442-1-Naresh.Solanki@9elements.com>
References: <20221214080715.2700442-1-Naresh.Solanki@9elements.com>
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
index b005a1c8ad7e..afd98e639b4f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -81,6 +81,7 @@ struct pmbus_label {
 struct pmbus_data {
 	struct device *dev;
 	struct device *hwmon_dev;
+	struct regulator_dev **rdevs;
 
 	u32 flags;		/* from platform data */
 
@@ -3095,9 +3096,13 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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
 
@@ -3107,10 +3112,10 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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
-- 
2.37.3

