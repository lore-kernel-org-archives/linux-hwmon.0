Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB457C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:25:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8CA461284
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 18:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378533AbhITS0x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:26:53 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51188
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378512AbhITSYu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 14:24:50 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FDEA402D4
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632162085;
        bh=aMSiOms6prdZ099C0szw2vjYvnbIcB4EP4lQR9/7bd4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lIPg5hjO7jzgSsMgBd5qiL+NMygFBVM2JnTHkSfq5V12YBKF1zlh4hjAmVTbS75BQ
         nKm53E6Dys814TvPH3rVJvTC3CxuTqQ/rGU4fhAkGBXrVAr7Zlavi/pjgmiFvYD45m
         2n7g6oFsPPqOiyI+kV06gzLLVpBReFZizPlvfm8vEg9W2787VDisvBWiGXHYD4XE1n
         nTxMjC8pcEet26IC87/XbHqc8NXNPjItFEBMot34UQMJIPLrASTOMAZzJ7tKMwjw6f
         Pt8t64HMbBj7kG36ArgEKI0xGkKql18QYMhOGULUm0bs42IIKBb8laI9RuZQy/WJoj
         /N9Dd4bdamhoA==
Received: by mail-wr1-f70.google.com with SMTP id h5-20020a5d6885000000b0015e21e37523so6795485wru.10
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 11:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMSiOms6prdZ099C0szw2vjYvnbIcB4EP4lQR9/7bd4=;
        b=1OsD/DcLyr0Qj4CAt/z2cSX9tawqueSyg9hJA34zkfBfnlv977eGYbI3o0qCmZR4EC
         Y7ZAx6oO8Or9GNJyENfiL5L5renrsjwnBHOXE4pGaRgYJ45VTwTwChW+qN5FsJMvySi7
         4gKJrTbHaSscG/go1ZrHLjPRn6/7cfBP6iwzthM6NjeyuYwsj56fKWBY65b+CWkIyu7W
         CraNJZRGDRkTSY54ggfUDIw0fWVD5LtSY4FTLaSGZf+4NXrZhJJlrDA7UQ+dVXmd9kz3
         HrQx/7uBy8/YVKonCdkE9B939ronJjbeyuyXCagg6PYHLLGE1M6FlK1SbIN0cA4yPFDt
         gSvw==
X-Gm-Message-State: AOAM532gQYwMWiOIws8KWu8aCI61aAIGDfdjjiAj3nBoiVFgzgr0J+7m
        laOhcpm5xRPE9il/pKPmziovhSVqHxvh3903fTs32De5WymsjT2tj2mWxyRTVlVDAouYjIGPpF2
        NuACRylnQoDKWoRsmlABXAzbhueu/vl73queWsssJ
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr4098025wrd.181.1632162085200;
        Mon, 20 Sep 2021 11:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw774b/B1NbEVUkHVEbXU9WEty43J69NGTEEI3VR3a+6pwFjffJn/aWJcn7R38bDYtguu4aNA==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr4098013wrd.181.1632162085016;
        Mon, 20 Sep 2021 11:21:25 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id e5sm10515285wrd.1.2021.09.20.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:21:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: hwmon: hih6130: move to trivial devices
Date:   Mon, 20 Sep 2021 20:21:12 +0200
Message-Id: <20210920182114.339419-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
References: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The hih6130 bindings are trivial, so it can be integrated into trivial
devices bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/hwmon/hih6130.txt  | 12 ------------
 .../devicetree/bindings/trivial-devices.yaml         |  2 ++
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt

diff --git a/Documentation/devicetree/bindings/hwmon/hih6130.txt b/Documentation/devicetree/bindings/hwmon/hih6130.txt
deleted file mode 100644
index 2c43837af4c2..000000000000
--- a/Documentation/devicetree/bindings/hwmon/hih6130.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Honeywell Humidicon HIH-6130 humidity/temperature sensor
---------------------------------------------------------
-
-Requires node properties:
-- compatible : "honeywell,hi6130"
-- reg : the I2C address of the device. This is 0x27.
-
-Example:
-	hih6130@27 {
-		compatible = "honeywell,hih6130";
-		reg = <0x27>;
-	};
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index b1bad299ec66..c9333fb81fdf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -111,6 +111,8 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
+            # Honeywell Humidicon HIH-6130 humidity/temperature sensor
+          - honeywell,hi6130
             # Infineon IR36021 digital POL buck controller
           - infineon,ir36021
             # Infineon IR38064 Voltage Regulator
-- 
2.30.2

