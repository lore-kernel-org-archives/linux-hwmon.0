Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE1C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Dec 2021 17:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbhLORos (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Dec 2021 12:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbhLORor (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Dec 2021 12:44:47 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5011C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Dec 2021 09:44:46 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id i63so34479932lji.3
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Dec 2021 09:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69DJNWe/D3Mca4RZyKuYAP8sNs3B4wyCI9D7posoa6o=;
        b=RShYZ6NK2Bn8nx7jVK0kLb7s7GE/oSmhOAOxFKJY0o4HYVX3tpCIp3ebRus6pb7tUX
         Gw8CNQnfboSV9FiZJ5i4M9w/LySzWavg4+5XSoxMp30xIDFR33rT4XagvxZ9SoBzsJSf
         JddESGBaKaRIdStubZAbkBv54lxkK1oY8Re+zgyQfxXqBp1v03YJIGLOHa9TyD8wy5ys
         NlJbBtIdOjxURidNJhezkzkBEoKkQQ/ZAi2fI9HycPFPF1tKVztNE6eGkxxxgrAe1jXW
         e6W/IW1Ckmq5rAZpjgm2LJvtZvRfLMnSo9LC+9yPS3IlqWCMJn+sdp7m/dE4o/gMY0J/
         r4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69DJNWe/D3Mca4RZyKuYAP8sNs3B4wyCI9D7posoa6o=;
        b=bOpmoCQ7xTXHRdQOmN9aM+Mm1cc5nGGE1VD9PXRvOGIuC+fHigjh4uCYmFKqOAyYEo
         1gDvtOzyo8nCHsa4WWxzgBf5qfEj/dXKjqxq9Jtvtmnew4Jso+EYX7krowuchIOL3bvQ
         Pe5uQUv+8iwz0x71zbBMyz/YfcwKky+GXao14z7llGA+ZYRlYQqB3qgc0/JgeknHnrBM
         GHAW8vnqm1MoZdCrl7FYtlUpvIHKI0HKAECNShgtkEQMphKXoY6cuNGtZ0wIByRUKzml
         CjX8ejnFsqenOrWPiBjA4qO7HW6XLU3tvsu7swGntwYntJ87yNb/7/CZ4NfIFxAg+laA
         gYLg==
X-Gm-Message-State: AOAM530cNhOg8hzlS1CaBK+L75pdWA4WDliBOeoQLq4QUOAYYEgy7zFm
        FmOeB6RrblzMkaU1WwlOfTKlZQ==
X-Google-Smtp-Source: ABdhPJz3xqzy1eAarWGUTG1XyKWi4mqhi7cm7xjUQNoFRGjdkLIpTKITMqZZvE609tNuJrNXsPsGxw==
X-Received: by 2002:a2e:a3ce:: with SMTP id w14mr11495799lje.21.1639590285100;
        Wed, 15 Dec 2021 09:44:45 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v9sm543534lja.109.2021.12.15.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 09:44:44 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] hwmon: (ntc_thermistor): Add Samsung 1404-001221 NTC
Date:   Wed, 15 Dec 2021 18:42:41 +0100
Message-Id: <20211215174241.1496169-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds the Samsung 1404-001221 NTC thermistor to the
NTC thermistor driver. As far as I can tell it is electrically
compatible with the Murata 47K NTC thermistor.

This thermistor is mounted in a variety of Samsung products.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
The DT binding oneline is included, I see no point in splitting
that into a separate patch.
---
 Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml | 1 +
 drivers/hwmon/ntc_thermistor.c                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
index 9e77cee07dbc..3d3b139a91a2 100644
--- a/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
@@ -76,6 +76,7 @@ properties:
       - const: murata,ncp15wl333
       - const: murata,ncp03wf104
       - const: murata,ncp15xh103
+      - const: samsung,1404-001221
       # Deprecated "ntp," compatible strings
       - const: ntc,ncp15wb473
         deprecated: true
diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 00356c28e8c8..414204f5704c 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -45,6 +45,7 @@ enum {
 	NTC_NCP15XH103,
 	NTC_NCP18WB473,
 	NTC_NCP21WB473,
+	NTC_SSG1404001221,
 	NTC_LAST,
 };
 
@@ -58,6 +59,7 @@ static const struct platform_device_id ntc_thermistor_id[] = {
 	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
 	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
 	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
+	[NTC_SSG1404001221]   = { "ssg1404-001221",  TYPE_NCPXXWB473 },
 	[NTC_LAST]            = { },
 };
 
@@ -671,6 +673,8 @@ static const struct of_device_id ntc_match[] = {
 		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
 	{ .compatible = "murata,ncp21wb473",
 		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
+	{ .compatible = "samsung,1404-001221",
+		.data = &ntc_thermistor_id[NTC_SSG1404001221] },
 
 	/* Usage of vendor name "ntc" is deprecated */
 	{ .compatible = "ntc,ncp03wb473",
-- 
2.31.1

