Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145DAC47089
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 19:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbiLETYx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbiLETYX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 14:24:23 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA8027CCE
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 11:19:43 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bj12so820861ejb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 11:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPKbqc0ak5V4UJgzOj7j3ooXS6vGnBnkbq2OKYA/WT4=;
        b=DIi5u4t6g9JgH5XoC4drvV8Izbr9aVvc4hCrSjc3S11Chs7ShVAECZJ3qrDFTtPPgm
         lahrxw56tiHndSBVtvsjtLuoMulsicVgzsL8jREK7k9JDx2V4JG33oiU1ofiL/UP2LEz
         hi8RWX4EN7Zn3KtA96dd+6jOVMPvCmKiwDTyQBGhkdK1sm2it8wjSaCxnS7vRe7t51dK
         dqUj0HCRP8J6NUaCfEPORe+xiEAOVaCXBISAQVZnO8Y6SZHfGQdESr9mhtEUWC5N3J+d
         CZuX/KprWZPIw1p9v0BDB+dS05zvKq5BDw002KAPZCM1EbyexUSmnAfpxFuLdC917PoG
         KC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPKbqc0ak5V4UJgzOj7j3ooXS6vGnBnkbq2OKYA/WT4=;
        b=5kuWGQEcpclIzp5eCbxv3vHX1haY0l+MlBKlEEnUFedcXWosZfCH1fUfriLi0mx0kh
         qT7BKnJmVGlHkIp2E0E14LVnYy7wRsJ6OER9wcePkYyA/FYIcBLDjSNdRXj/pD7oa2d0
         7wd+4qtTz+FewcWEsKp8X9Un0LU7OgoOxrqL2g5r/uWT2WMtvIL5Ty6an7RAygDlAavE
         tNAwrgj+SGNXjr72mQ6vsgwiJypIGaZeK0zgpAC0wMw4a9BSWZHsPpSfwtQHCPsKQZnU
         /+j8RmSNSUUYp8usFVjJr2YL3Vd63nJ20HuKX5jQfnu8WQdD6malDHeLPKQDSwpuWRO9
         vVfg==
X-Gm-Message-State: ANoB5pnEtYc8G6J6ZeLMhj5xMXkyp25pQE+wfHyWPhGEEvqRxf/JDS/1
        i1sIF+yeh7xQC6zYqD6BLNy55sqQhQ5YFnv+qy4=
X-Google-Smtp-Source: AA0mqf7u7VnY3Ni45y0AxJmuFN08d/uOHDX0qADbA2dYsG9Zjl6nCXFSiG0DUzYmpaNDKZK/7vTPJQ==
X-Received: by 2002:a17:906:7852:b0:7b7:718d:22c with SMTP id p18-20020a170906785200b007b7718d022cmr56888823ejm.507.1670267982697;
        Mon, 05 Dec 2022 11:19:42 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7db10000000b0045cf4f72b04sm112739eds.94.2022.12.05.11.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 11:19:42 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v6 3/5] hwmon: (pmbus/core): Add rdev in pmbus_data struct
Date:   Mon,  5 Dec 2022 20:19:14 +0100
Message-Id: <20221205191917.2614603-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221205191917.2614603-1-Naresh.Solanki@9elements.com>
References: <20221205191917.2614603-1-Naresh.Solanki@9elements.com>
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

