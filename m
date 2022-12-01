Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0F9C4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 19:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiLAT3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiLAT3r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:29:47 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A627C7D27
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:29:45 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id fy37so6578089ejc.11
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qJrq6T31sJxCZwbEqlMuOvpG+K/8IjspbhkPV4Km1Q=;
        b=SW4hPI2FWGG5GORQJIKeGvk2XQDV1l97gRAeUy/zp0bPfQG+7YaA27wepYjA1VUz4r
         1Fs5VsvuJXwBT8zLILOuVuMwRBdW62A0rYGCA0xRUNHUpLY0vM+ZqL6mh/jedm2YLJKs
         EALqED0lwsJ3sPhN6JzokkOkIKOjce1luQW+M0cr1orEKw5BQSqF33AWQvuHI2Y0BYyL
         xd2DG7nAxySWAe5Vgh3Vl6Ps4EGSnPZuFnmDjSTVfFtSJKY8K56yQXdDOpyYnppsmect
         Q0wQK7MotT6N6mitUJBeKqgBf/gGlRno7q7ty6IPzihc2i9TL3kmU+lk6WVerTBObG9v
         ti0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qJrq6T31sJxCZwbEqlMuOvpG+K/8IjspbhkPV4Km1Q=;
        b=mA9RrToeJLeLItZSkMPrhqweNmkXgzLpG0m7oYYkZ8TPFaV14NWAcmxa5WW1DyYBT4
         xsVgG+LADLTP0veP/svKOQJ+HsoE6xrzdnIzBO1zRebwbOnQ7heKKJ1ehfxZuCVyG48A
         hBeYJhzUp/6tcGiAEuHr6EJB+nZBYmlXMYE44U5xrWBwWtsjCL/l/gDTmlQx7nyfDluA
         sE/i878nC7m/niM7r6JAm7ljOWJM231BqFWfzfCvTNi6XWa0CjUMlF2r7Euo+oeuQ8YF
         LZvxPnaP4VVhsU9N1mbjT3P+6iRBdiih9wHLxglQow/KXuL4FZEt0wTJ5ulbUsEqER8P
         nmkw==
X-Gm-Message-State: ANoB5pl49rnT9dOLImVo7TIejEd9RVQRS31GkNYgsIM51Ag+alZU1riK
        PBdGmAW2MPPOnmgUpYlfdhrafQ==
X-Google-Smtp-Source: AA0mqf7EwjwgFhq93o7jjqG184PyjylC2BYPAldcbmB9lhs2VJLvcPjq0Ietj3jPFwiFUjW5sX68Hw==
X-Received: by 2002:a17:906:ee1:b0:78a:efde:b84a with SMTP id x1-20020a1709060ee100b0078aefdeb84amr57442318eji.744.1669922983691;
        Thu, 01 Dec 2022 11:29:43 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090639cd00b0073022b796a7sm2141380eje.93.2022.12.01.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:29:43 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v4 1/5] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Thu,  1 Dec 2022 20:29:35 +0100
Message-Id: <20221201192940.1584012-1-Naresh.Solanki@9elements.com>
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
 drivers/hwmon/pmbus/pmbus_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 95e95783972a..7a23794c0b93 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -81,6 +81,7 @@ struct pmbus_label {
 struct pmbus_data {
 	struct device *dev;
 	struct device *hwmon_dev;
+	struct regulator_dev **rdevs;
 
 	u32 flags;		/* from platform data */
 
@@ -3053,6 +3054,11 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 	struct regulator_dev *rdev;
 	int i;
 
+	data->rdevs = devm_kzalloc(dev, sizeof(struct regulator_dev *) * info->num_regulators,
+				  GFP_KERNEL);
+	if (!data->rdevs)
+		return -ENOMEM;
+
 	for (i = 0; i < info->num_regulators; i++) {
 		struct regulator_config config = { };
 
@@ -3062,7 +3068,7 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 		if (pdata && pdata->reg_init_data)
 			config.init_data = &pdata->reg_init_data[i];
 
-		rdev = devm_regulator_register(dev, &info->reg_desc[i],
+		data->rdevs[i] = devm_regulator_register(dev, &info->reg_desc[i],
 					       &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(dev, PTR_ERR(rdev),

base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
-- 
2.37.3

