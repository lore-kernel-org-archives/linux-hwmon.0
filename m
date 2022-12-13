Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C11C10F1B
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Dec 2022 09:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbiLMJ1O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Dec 2022 04:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbiLMJ05 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Dec 2022 04:26:57 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CCD1009
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Dec 2022 01:26:54 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id f16so2678495ljc.8
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Dec 2022 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yd9Ohkfyh2xnDoKrBMnzcv2od769HEaPH+/o49HG4DM=;
        b=Y4C4VT9jAhKXlY5Lilc+DPjrsLSEoCUerAugtCSkZeLxfa2rxmmNdWz6ueabweVAss
         3aKgdFgacWPkUzGjivLVEejcQUZ1n4j6QHNhl4CFC81ZAbYY8nkuiZ0bOFFoO+K5jsCY
         WqrAfjRCZURzA/xHOZsNs5x9Uz0DL6VcDfsSRlxX+k2Usa5Qs1zXx/yY6ctQXa6vz1O/
         zqH3oREI4R7Z7CEOklqz73EGNZ4mG1Sd8E8eiHbFLA3VokSXT1pNO8piGnvLABSYdjbg
         QxkuHH1wUO9KCcCa7We8ZSuTsNVxRpA8wodc7oytCQUFhdnC8yyd4jELuHMAkhqFnxfT
         OfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yd9Ohkfyh2xnDoKrBMnzcv2od769HEaPH+/o49HG4DM=;
        b=S7Bnn/Q3tGxjr+ph7+nvjSD9LV8JI3dxE0Dts0aQ3byFLfDSwVfyhJ9x9PYCMD8pZy
         nEheDmhUwY2Ix+PHQ5PKTKTMuZdBXjEDyFAdg2H7lFNsoCXOJ5r5qiRrucsjqDxd0B8u
         XpyLVJH/9N2HZ+2QD7EZ2vVJQE4vNpO0j2jsR6CDHpRaFYbkE391uxq2+6f4brWAjn96
         uEt3Yoit20Ty3KqOtVptU5PH2xN3btHS3DDtTf1xdLRW2V19d3o+LR8ajEkp4afJgWes
         7N86lGTGiqmC2FqYCisRVGUO075Bj+v8XSzQ5stpF5+73jtN5HV35QAOhRjOgimjFEvr
         WR4w==
X-Gm-Message-State: ANoB5pkxQ2ERFwOI9W/DVIEM4Ltc/aTI2G8bIDrjE0hvQEmIuqVQb0D9
        okaeEs1EgAcVO3uKGMGpBpLavQ==
X-Google-Smtp-Source: AA0mqf4a2E7yNyKAeCWN1bcpP7nDgemfxFjcA9atZypB4Pd2G3mJfMX8I6uy2s6E3XroL2T6ddNx2A==
X-Received: by 2002:a2e:9a87:0:b0:279:e300:8f91 with SMTP id p7-20020a2e9a87000000b00279e3008f91mr6563368lji.43.1670923612425;
        Tue, 13 Dec 2022 01:26:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k20-20020a2ea274000000b0027a00aab48fsm188958ljm.66.2022.12.13.01.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 01:26:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: hwmon: adi,ltc2992: correct unit address in example
Date:   Tue, 13 Dec 2022 10:26:42 +0100
Message-Id: <20221213092643.20404-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213092643.20404-1-krzysztof.kozlowski@linaro.org>
References: <20221213092643.20404-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

lower-case hex is expected for unit addresses:

  adi,ltc2992.example.dts:22.24-38.15: Warning (i2c_bus_reg): /example-0/i2c/ltc2992@6F: I2C bus unit address format error, expected "6f"

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
index ff208ab97f96..dba74f400bc2 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
@@ -59,12 +59,12 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        ltc2992@6F {
+        ltc2992@6f {
             #address-cells = <1>;
             #size-cells = <0>;
 
             compatible = "adi,ltc2992";
-            reg = <0x6F>;
+            reg = <0x6f>;
 
             channel@0 {
                 reg = <0x0>;
-- 
2.34.1

