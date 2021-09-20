Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367C2C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2137C613D3
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352466AbhITSZM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:25:12 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46866
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378098AbhITSWu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 14:22:50 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CEACB3F4BE
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632162082;
        bh=Cxz9XNLiZBvDtvCTKib75WNAZDO78vuIdh/0383Lpu8=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=oOYG33hC2A1Qwct5vxm5GimKWPLzh8sel6YszTN116fF4KM+hOXaKOY/g9JqmEk4I
         emAaR7pmuQKOCHvlPtE6/Bo3zNH9wzqa8/RU2TJvJ9znN3E1qEXQjrqDqpl3d0RfES
         TKsgqStJIOHmJ6bD5ZDn8iXeYf7rHMR6cifFN7bQnSLjN/Q5vmVG/3Q8cRDyDuOAcS
         0VaZKB4VfKt02z5k/KreUQjPAC7Ys91ODepfUukuZt53K2l7NNNZgWzb34mdfeObnr
         HBPi/YYLo7G/JVnUq3RtuuBKpu2zgu+RSEXEmrTE8KHhmqgkXsKj8s6kWATIrZGVN6
         utCcYhpvL0i2Q==
Received: by mail-wr1-f70.google.com with SMTP id x2-20020a5d54c2000000b0015dfd2b4e34so6798880wrv.6
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 11:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cxz9XNLiZBvDtvCTKib75WNAZDO78vuIdh/0383Lpu8=;
        b=7hIEyRiOSVoPRLhDdRjQAKhRi3uLZCjRzneOsDGGLuUvl+N09voYjBPALhceVQVwWQ
         c2a3+LRH3AI0V7Yqh1cgsU2xTJd9eLw8Ol7TkstdUAq6pl4aWnNL19aIz8UGUFq8emtz
         dKoSMdcm3YD6LgV2XZhQr6E5HWhKwQoJKUYBipj5MrR/w5vOy5PxBW3cnA4j0hG0iXfk
         242n1SKF8ZhLgzycrzx20ZBtCb1/75suK2lYLbVqMkKZx/PZjfkWPNXBE88xV5NTFPab
         rJdVF3DV5Y+uWVTPUW2Budve7CejF8McamQIG4wWquLO01/0UHFvd+JIzrE30DgzH+zV
         TPBg==
X-Gm-Message-State: AOAM530RIuTD7kFNgkK+dI2Rve17/E5N9C6ZXydauMJ1YIxORfzhQR8T
        VJYy4YX08xjqs2Y8TyB+zV2byp8wL5W8QOLSdchq6T5xS5OwtHSbIfEuc1Fwo9rnHeFbZFDd6Xk
        4OMpiK/y66LBXbSiajbzGeZyDU5eaySId0Bp/82P2
X-Received: by 2002:adf:ed82:: with SMTP id c2mr30275864wro.203.1632162081847;
        Mon, 20 Sep 2021 11:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzELV5uA5seM8s/r/eb66galmlF6aoBqXG9V1pCKVCZIf7ksmuHTRXS8RRndkFc2QGLnN2HSQ==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr30275848wro.203.1632162081729;
        Mon, 20 Sep 2021 11:21:21 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id e5sm10515285wrd.1.2021.09.20.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:21:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: hwmon: lm75: remove gmt,g751 from trivial devices
Date:   Mon, 20 Sep 2021 20:21:10 +0200
Message-Id: <20210920182114.339419-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
References: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

gmt,g751 is covered by LM75 sensor bindings.  This fixes warning:

  arch/arm/boot/dts/gemini-dlink-dns-313.dt.yaml: temperature-sensor@48:
    '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 183ee0da22c6..1bbfa98a85d8 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -109,8 +109,6 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
-            # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
-          - gmt,g751
             # Infineon IR36021 digital POL buck controller
           - infineon,ir36021
             # Infineon IR38064 Voltage Regulator
-- 
2.30.2

