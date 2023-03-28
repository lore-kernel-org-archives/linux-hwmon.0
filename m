Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A0DC76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Mar 2023 15:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjC1PFC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Mar 2023 11:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbjC1PFA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Mar 2023 11:05:00 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9876EB41
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 08:03:44 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso9644230wms.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1680015818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpixAugXoZaAwUVYpLsM7+hqMka5O+Qfwz+XpgeRjTs=;
        b=SwYO599zCOMIb+ah0SxNIpjnaqvUaPRoqNOQOnLbI/08m5dkKLq0vxapCVvHBMfYp3
         y2wPQeJbC9lJ/Xz7WFhvhsJZJvPHgGA7b7fPNOroAu3qVuXFxPYaKiM66TjUbm+DKV2O
         RUDkUkOqJDW+Da43id/Jcrf6ijm5Rz4bvNbQFkguPhq3lXCqduLRCLNC72JfRpgrqm9e
         hj/jMh2PT+ZrDMGa5NXqAg8lb5/vg4pdDNnR/oZIc5ZlB51dx/1GCVrASzZ85bIoYce4
         vqb4y0bjWCN8mi/X6/4EDlXkASNlKIgXFZB+jTo+K45BhB07FJ0OR/v4+Ku3jLH/J8uk
         F6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680015818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpixAugXoZaAwUVYpLsM7+hqMka5O+Qfwz+XpgeRjTs=;
        b=z9ricK5M6R7Xln4Um/mX6lgnoS//2N1r4MP/PkL0hbbDxo0oL72RG+Nm/PUcJQ84+o
         Dmc7AMiAIejx3zGD9d7NbC0TmiR7um7Zpb/M8v0Ul8u2q2YaQQcFob2RkGx4SdT/SotW
         K0jhpXse3CGQc/Gtig/qrRSgqL+e2kxjhEcOS0T6puYBKsdaGHG4vUjvzDYFAuVOfNLZ
         ZeUX3+UeoGCK99QACy8RjQ7UCue+Ea9D5CLP3C84AJmHcF+y3THLOsCm+QguMDBk5pXJ
         DDXduCwBiQlgEYBp0d1a1s6xml1VXDPfTCdCf2AgoMSlMzfeRT3g4UEBSRAuZmUvl2nT
         4Xmg==
X-Gm-Message-State: AO0yUKWMyhBHYxYwzyAs+6Y6b3F241hnEJN3jrRC5tx4aEZQQzqz+JRB
        k75Cpi1yYqKzuyFnO4EaB+O4SA==
X-Google-Smtp-Source: AK7set/bN893UfIkzTqJL0r2e1oMezo/ssoDSEOpOtBuDCXyf3mu4WIawWcjgm5d3NzpFN2m3luumA==
X-Received: by 2002:a7b:c7c5:0:b0:3ed:809b:79ac with SMTP id z5-20020a7bc7c5000000b003ed809b79acmr12587433wmk.19.1680015817802;
        Tue, 28 Mar 2023 08:03:37 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm17429293wmm.36.2023.03.28.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 08:03:37 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Tue, 28 Mar 2023 17:03:33 +0200
Message-Id: <20230328150335.90238-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator device in pmbus_data & initialize the same during PMBus
regulator register.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 0ddef2c9ba9b..d93405f1a495 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -81,6 +81,7 @@ struct pmbus_label {
 struct pmbus_data {
 	struct device *dev;
 	struct device *hwmon_dev;
+	struct regulator_dev **rdevs;
 
 	u32 flags;		/* from platform data */
 
@@ -3109,9 +3110,13 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	struct device *dev = data->dev;
 	const struct pmbus_driver_info *info = data->info;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
-	struct regulator_dev *rdev;
 	int i;
 
+	data->rdevs = devm_kzalloc(dev, sizeof(struct regulator_dev *) * info->num_regulators,
+				   GFP_KERNEL);
+	if (!data->rdevs)
+		return -ENOMEM;
+
 	for (i = 0; i < info->num_regulators; i++) {
 		struct regulator_config config = { };
 
@@ -3121,10 +3126,10 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 		if (pdata && pdata->reg_init_data)
 			config.init_data = &pdata->reg_init_data[i];
 
-		rdev = devm_regulator_register(dev, &info->reg_desc[i],
-					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(dev, PTR_ERR(rdev),
+		data->rdevs[i] = devm_regulator_register(dev, &info->reg_desc[i],
+							 &config);
+		if (IS_ERR(data->rdevs[i]))
+			return dev_err_probe(dev, PTR_ERR(data->rdevs[i]),
 					     "Failed to register %s regulator\n",
 					     info->reg_desc[i].name);
 	}

base-commit: 8a863eb1b1162653d133856702e13560f3596b85
-- 
2.39.1

