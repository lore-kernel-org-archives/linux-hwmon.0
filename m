Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059F1C76195
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Mar 2023 12:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjC1MRS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Mar 2023 08:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjC1MRR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Mar 2023 08:17:17 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DEA8A6A
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 05:17:16 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id l27so11980011wrb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1680005834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpixAugXoZaAwUVYpLsM7+hqMka5O+Qfwz+XpgeRjTs=;
        b=DdfEr+id/MsD4EX/KXTGF7dom2NnWml6VBX2ms3hp9tl13YcQyka7TRbrQ8kgwm98+
         n9dglToiVSIkx7BTzyKAtydVhxOlKocYd75G0KCdl4BpnEuQq7Eku0vu+onGqGsUarvI
         uDCxVMif68sVanItPLIYH9Xe6SkJzXfokDa8u7+2+gDNS6KvXXkd+KDmmUo+/r9yeDuu
         W1S1+uUTovHL7LdVpoa9S2fX3EkyLJl45TezoDDNzt2CcIAf37tNBmFPUGobldCUd1Gx
         qs5nvEkiuEJyJPcIOwKPJsQl/qcOiOMGm29n6E0Nmjm9EvgUM9Dw0/L/k93Bd3rfvpZH
         yPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680005834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpixAugXoZaAwUVYpLsM7+hqMka5O+Qfwz+XpgeRjTs=;
        b=sUvtsK+d2WcMg6jcfmkxxJhmbHGqYsojWrBHmZJtWpol+wqEriAzSjpwbRdIbql/HN
         WUslfuAap6NrTd5/XkbGU2newNbeBYolgIK9NiauqnFSRf+BZgO2u3kQfbvtiosXoc3D
         1rPJJuyRHlknQ/qlfM1raRTeDFpicif26T4EyLhzYNJYnCFBJ/c9/s7+36WO+4jN3/DY
         wSW4VXatqA/odF9NCPXnwcXOjenGhllaK7BmOqO8f2K1A9L4nCZnGAjtJ7Db8V4t6pZT
         j2sb97hk+KrV7zbruKeo/hPsWQtbeDdbJLsOgcFV7fa0/hEx7E2J0NtZWfoXh6eK/K9O
         IQDw==
X-Gm-Message-State: AAQBX9cj/i5ocHnriyXgmHCXeqXkdWby2ygnYEDV4ZmgLX+TNRZkkyo9
        HYI2nIIzkSVxIluyrWEOQlNrCzrxGDVoc45PLL3lbg==
X-Google-Smtp-Source: AKy350Z4U/haF9SCuRslvAh7oWJBrD/bo6ZTNjsaoe00bHp+ERY97BdOBWKdeYJ4z5nRervvH+cR3w==
X-Received: by 2002:adf:f089:0:b0:2cf:e849:e13c with SMTP id n9-20020adff089000000b002cfe849e13cmr12706092wro.61.1680005834541;
        Tue, 28 Mar 2023 05:17:14 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c9-20020a5d4cc9000000b002d21379bcabsm27503187wrt.110.2023.03.28.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 05:17:13 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Tue, 28 Mar 2023 14:17:09 +0200
Message-Id: <20230328121712.4057359-1-Naresh.Solanki@9elements.com>
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

