Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE2EC4320E
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Aug 2021 18:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E58E9601FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Aug 2021 18:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbhHSS0a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Aug 2021 14:26:30 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:51210
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234045AbhHSS03 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Aug 2021 14:26:29 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 65B79411F3
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Aug 2021 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629397552;
        bh=18gxinZ2DJ3ZX3sOmqcOCSJNbRAwMTizB8l2gxtZoPE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=SZk6KOD5V9YTN0Cw/Thp0y2Q0l1GUMflznCj0lSG51CTcN3jyyCl8C1Yst5CPiJoD
         zFgOD3iZAp5AMgz7X1XMfeVCIlriK05eoS4l7VNNqaoPLhGHYeUJhAFfL67HspGP0T
         jWJWYbdgQBJgBZZCaM4abW3a2otkIBFBWXriudvk5RcAobPsL0sfG/b8JktevavCzW
         psRD0JHPev9muFlTxsarqdjdu2xW1larPXcCoHCXa2mJ8HopO5DbSp2AY8w1qiFY55
         38ciRvA5fUP28LGF/aHVUjCmNqXEBjqQYUZYm1uKX3haVyUX2K2sUiafCzRwfcExlD
         n1iVT2LM8Efrg==
Received: by mail-ej1-f70.google.com with SMTP id ja25-20020a1709079899b02905b2a2bf1a62so2596860ejc.4
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Aug 2021 11:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=18gxinZ2DJ3ZX3sOmqcOCSJNbRAwMTizB8l2gxtZoPE=;
        b=SeZ9EJ8nhiCRtAC92edICyDafLQ2rMzMkO61ooJzeAFJB6cSvRa1dyRwlL0/C3iWox
         Pm5mRwddHW2GMoZ8KK099N3rs5soQURMrgMOAUAMwSlbySU2uj2K1J+tOdGb1q2O4Yut
         4gicWBxwj5Yr3s51EKdrKaVvE8/y6AqOp8csqVh/djrlwQ9UBnGRhmTXaEFfPrE/DsNF
         T2vyrPikdVnToRQy9unB0zGr83vzg7SUZHBLcpX9xNMJ/2FtL60kCTx3J0YU4W9jWLee
         1qCxH+boiWI908qojOUUtONien71F9CNpRpUb1Tfe1jGvLmotmCNaGl28XAvN/kdnAyv
         lCNA==
X-Gm-Message-State: AOAM530Mqur9P0drGsKTuBp9vZfNR+WbxdkJ0PSeb74xbCTdJ+nx2HwU
        tCmIShcjo1GQo8Glp1HYDuTs9pfcKh0K824tsststZt955euu4HotTY4w2eCpytf7N8DFqGIKIU
        Hdv1Nui7Wr95rl9vtajJhNxIVcUznST0Z1aSaK7Uc
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr17380459ejl.278.1629397551899;
        Thu, 19 Aug 2021 11:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7N24ysDGZlQgoW7Q3735rlAtsbuXMRGfEm8M+0rgtPEoc9ckI8wE0kjehikBR8CWot0sT5Q==
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr17380445ejl.278.1629397551791;
        Thu, 19 Aug 2021 11:25:51 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id n2sm2212108edi.32.2021.08.19.11.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:25:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: merge max1619 into trivial devices
Date:   Thu, 19 Aug 2021 20:25:43 +0200
Message-Id: <20210819182544.224121-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ther Maxim max1619 bindings are trivial, so simply merge it into
trivial-devices.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/hwmon/max1619.txt  | 12 ------------
 .../devicetree/bindings/trivial-devices.yaml         |  2 ++
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/max1619.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max1619.txt b/Documentation/devicetree/bindings/hwmon/max1619.txt
deleted file mode 100644
index c70dbbe1e56f..000000000000
--- a/Documentation/devicetree/bindings/hwmon/max1619.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Bindings for MAX1619 Temperature Sensor
-
-Required properties:
-- compatible : "maxim,max1619"
-- reg        : I2C address, one of 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, or
-               0x4d, 0x4e
-
-Example:
-	temp@4c {
-		compatible = "maxim,max1619";
-		reg = <0x4c>;
-	};
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index fb03febc6616..1e4b3464d734 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -147,6 +147,8 @@ properties:
           - maxim,ds1803-100
             # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
           - maxim,max1237
+            # Temperature Sensor, I2C interface
+          - maxim,max1619
             # 10-bit 10 kOhm linear programable voltage divider
           - maxim,max5481
             # 10-bit 50 kOhm linear programable voltage divider
-- 
2.30.2

