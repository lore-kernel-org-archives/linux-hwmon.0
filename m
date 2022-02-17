Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9668FC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Feb 2022 16:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243417AbiBQQr6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:47:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237545AbiBQQr5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 11:47:57 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310F717A9A;
        Thu, 17 Feb 2022 08:47:43 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b13so10832464edn.0;
        Thu, 17 Feb 2022 08:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeuvKoehGrSv8Jauy6SYk/NCsqlFTTT1oBI6H7zeNo8=;
        b=l1DbVEaH+KthRs8CvsPIcnVPPP4dsrm5S2SyePbHliTKc/QSNu43lat+nm05idU7l8
         kKzfGI9Ms12s8ATh1EOHItw3I/15uD4DWFRpz2Dlc1tJ6nOqY188Dku2SiBiDlNg6r8l
         +Php8UYnqmraXNrTTgVN00lJhCwz6ahbqFg9PPsTFVKZ7C91UL5seMGJ7dmqqtGYCO22
         vzfVyhuy/mlFfE/sFuoqV2SSAsQiUTn2sp5p9XlohROaUWK3ic5HJJN/A6BqwZMg7YIp
         7ddz0nCJTdv2etdYgmRGBE6tsLolvWG095V6GmKGM90jJZyWXOTVWou2jk77PGj/h5z8
         j8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeuvKoehGrSv8Jauy6SYk/NCsqlFTTT1oBI6H7zeNo8=;
        b=I/xe5UumYfJOxFi3yUjqdCqohXvaIcAuiGO8WLOMfjxzIouUCs+ZPCjW6Oblvp+TD5
         srwnsj1Ossr1empCUr7h4dpRpoDVk8ULdJxMs8r0oraXdvuWsMJrpDs5wr5O67BW39GO
         m6yerPjs4MEQAkl1YbIm3tmylD9Fc0FSaYNW8ymnwcvi6i9mrDvyMcox0VKYmIrqCqvv
         xQW8EweB0Opj+4B5Bkz0tF6ai1tPwoEQUloAfDnSZGyrllwIlkgeLSp9uA+vWCcko0rE
         QnBphwZMg1imJpqfoT9pUXx5tpg+AS3KC1EYLY8QNaa98z31Ig02IlFxbQiJWZgrLlJQ
         2yoA==
X-Gm-Message-State: AOAM532wvC/vyS28Y9LFW+deLuCPlTzkfdnPzbtKrVVCIUugL1HZCHdl
        i0vymuw3+RfJusBT0ejwCgvW9jGNkMw=
X-Google-Smtp-Source: ABdhPJwZywjW4faQol2TWu85/e+3Grwtd8dnwUSQgVBeZOXyes4e2XKO4OWFM/LpFW5AzKahDliHxg==
X-Received: by 2002:a05:6402:358f:b0:410:e245:f665 with SMTP id y15-20020a056402358f00b00410e245f665mr3527794edc.212.1645116461776;
        Thu, 17 Feb 2022 08:47:41 -0800 (PST)
Received: from debian64.daheim (pd9e29561.dip0.t-ipconnect.de. [217.226.149.97])
        by smtp.gmail.com with ESMTPSA id j13sm3682701edw.24.2022.02.17.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:47:41 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nKjwS-001hyw-Pq;
        Thu, 17 Feb 2022 17:47:40 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: add TI TMP125 temperature sensor binding
Date:   Thu, 17 Feb 2022 17:47:39 +0100
Message-Id: <524e85e640a4fccdf68b0a1c18b516378a581d35.1645116431.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From the Datasheet:

"The TMP125 is an SPI-compatible temperature sensor available
in the tiny SOT23-6 package. Requiring no external components,
the TMP125 is capable of measuring temperatures within
2 degree C of accuracy over a temperature range of −25 °C to
+85 °C and 2.5 °C of accuracy over −40°C to +125°C."

This chip can be supported by the current hwmon's lm70 module.
(lm70 already has support for the TMP124 and friends)

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 091792ba993e..09b98bf97c8d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -337,6 +337,7 @@ properties:
             # Thermometer with SPI interface
           - ti,tmp121
           - ti,tmp122
+          - ti,tmp125
             # Digital Temperature Sensor
           - ti,tmp275
             # TI DC-DC converter on PMBus
-- 
2.35.1

