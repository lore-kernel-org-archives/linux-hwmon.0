Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBAAC04E69
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 19:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjHBTcO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 15:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjHBTcM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 15:32:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979CC26B0
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 12:32:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so1992025e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2023 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1691004729; x=1691609529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=edwj5ZoJK2mDlEgtJqkJ/LdE4dco1cDR22RFFEgaEqH2xEWa3vDgeZwwqHuKfynDWd
         CZMBcVzj5hq3971PzjjYTe5iENmfw2OIvTTDTG/GH/u5iRxOj1lxrK2ncXbUXt1AjBZ7
         plKxrLw4l5wbr9CNds67+T2rgRLlDNGkonef3XHU6Ipn02jIheM4hPU1cV0B5Kzp4kAj
         BG+fMx+7e7Lliiw425s8H4zC4cXN98DNhlfe7oeZqyiRUrUesc8Y37ercCaGEYSVHmwy
         zOdSoNNnxxXROw1SZ4QI2SAQGJDS1sTh554bVaWFKbyN5DrlqfcqqDuLTPGaaJ/k6MML
         kHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691004729; x=1691609529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=cKuguog8LX09ne9xU6lv7tAGy8xcHPsZ2eKtbQyTE7A2pdgX3mwQH8YYeggu+qfGSY
         WZrWGzXnB8KyrsWpcB4vHZ4d5RQqHH+7FpREL3oRVvWYyxeKilyXEoiGpYb9TUGuuzJ8
         +SVYCCYbIE2815pynVyDw8m8XsAVkQfWOSG/1XoWX8wLxkOhOAHlcCAfcSTmzMYQcHS9
         YvSeOX7rqo2ii3WAmm2jkRY4zgn3ykOrWFN+phiALNKCFGra4kuW9L3iOwD87h+Fe19y
         xWugo0Ei0PvaifOuVkQ6t1eAWL3WOXsfTAL7ffVmDobnKoQwgp0+aZJ4wutKxu1FFr2e
         /6KA==
X-Gm-Message-State: ABy/qLbF6soCs5dn0/mQ4RhM08crCG8gpeqRaXlRc2rCBzRgTwRR13lR
        JQAUk8Li4ghiToj3N0lukbuJQw==
X-Google-Smtp-Source: APBJJlFrzwhE0MkELPlXRviUaVTxXRhZlYtI8u2+lwHL+P64bvSFC3r5bDcFmn24dcR1JFVEtCF0GA==
X-Received: by 2002:a7b:cc8c:0:b0:3fe:159d:422b with SMTP id p12-20020a7bcc8c000000b003fe159d422bmr5475260wma.32.1691004729038;
        Wed, 02 Aug 2023 12:32:09 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b003177074f830sm19666773wrr.59.2023.08.02.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:32:08 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] hwmon: (pmbus) Add ON_OFF_CONFIG register bits
Date:   Wed,  2 Aug 2023 21:31:52 +0200
Message-ID: <20230802193155.2170935-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802193155.2170935-1-Naresh.Solanki@9elements.com>
References: <20230802193155.2170935-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add bits found in the ON_OFF_CONFIG register.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b0832a4c690d..7a28bac7f171 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -243,6 +243,15 @@ enum pmbus_regs {
  */
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
+/*
+ * ON_OFF_CONFIG
+ */
+#define PB_ON_OFF_CONFIG_POWERUP_CONTROL	BIT(4)
+#define PB_ON_OFF_CONFIG_OPERATION_REQ		BIT(3)
+#define PB_ON_OFF_CONFIG_EN_PIN_REQ		BIT(2)
+#define PB_ON_OFF_CONFIG_POLARITY_HIGH		BIT(1)
+#define PB_ON_OFF_CONFIG_TURN_OFF_FAST		BIT(0)
+
 /*
  * WRITE_PROTECT
  */
-- 
2.41.0

