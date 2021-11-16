Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1DFC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Nov 2021 11:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D095F61B62
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Nov 2021 11:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbhKPLGw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Nov 2021 06:06:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57472
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234624AbhKPLFs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Nov 2021 06:05:48 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3891C3F499
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Nov 2021 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637060570;
        bh=/fhj+bVJm076Wq/VhTriJ0yxdPwTog87+Zp8k+Dl/zY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=NUWFbxQoCZvJWjTS8Ht7e3I2J5ylWjXWPLTwiEZjiEPjjjL/l4M3yesmp8gtzBp/e
         xKqxhssVrSmlnQXVW1Vs+sYohaZO2Tfjxb54q6nVaiGsYb+e7x7KBobbvrd5LTsSyI
         PDljoEHz0YRdwBb4gAe7J0XuMO4djMTufpZUvBiQrtYUuYDotIQNsFmrLa99/QFInZ
         2Mc6BR3QBS9rAew/rstubrrRJdcH+TelAsPtzagYG4uP8QhO4Q9JSetTMD4zffqz+u
         4cVUqrHO/aFHyCLGoWjjTMSh3/D2TaPVtywzI7XC195M272gx4G2ArdjEmh2MxLoL+
         BPT72sUXpD1qQ==
Received: by mail-lf1-f70.google.com with SMTP id g38-20020a0565123ba600b004036147023bso8074225lfv.10
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Nov 2021 03:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fhj+bVJm076Wq/VhTriJ0yxdPwTog87+Zp8k+Dl/zY=;
        b=5kX5kX78W0p3pZGcxEDO19mEbjEuTdKQUaY7kC3M3q/FruBbeDUnc8pCDqa3cE0UEt
         OMUzMnI08PqK4D2wedMpgTCgmkefQv67nymO/NyCdErkle2qbwHTNPw99EIp2ZQELE0J
         GilwesMIqc6xoZIYMt1Eu44PNHFScJOUZFBND6Md0XV6aQvsPELwbRHR9ehQxBRx9yrh
         QRpL85yYISd8vusT3p8AgqPj620U7r2nF06ERmotc44I6x8GfFI0gJ8Uhg5D9qWYkxk3
         Tk5/bEYDLQE+6BmWAbvXLiQAKztVa5lSR/nhGMyOrCJqQUFAD/+TqkkqGnmD+Yk6z7CT
         mgsA==
X-Gm-Message-State: AOAM530ufWPah9JJnxkAGzgcsU347zD40NYgHypfQe9H/LaslPNT94eK
        JW3UJ9XnDWN0fFpCOtsczIbFus0ltwHBkjoUO8HWr8o0PHq3aNMp3I7HhTc5UZpUv124Ee2hvQI
        9y4+QiWN5YqK7q9UUqZENV7Xd4XHV8FgSYUFYlAlU
X-Received: by 2002:a05:6512:604:: with SMTP id b4mr5696000lfe.198.1637060569467;
        Tue, 16 Nov 2021 03:02:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7ajDYjXbeKcZbiXLfcr+dTx8ryW8atDeHVo7pyKw8Zx2SmbmhraxaC8+5fg6M9h4tJ5URtQ==
X-Received: by 2002:a05:6512:604:: with SMTP id b4mr5695972lfe.198.1637060569244;
        Tue, 16 Nov 2021 03:02:49 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z8sm1420074ljj.86.2021.11.16.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 03:02:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Vincent Pelletier <plr.vincent@gmail.com>
Subject: [PATCH] dt-bindings: hwmon: add TI DC-DC converters
Date:   Tue, 16 Nov 2021 12:02:07 +0100
Message-Id: <20211116110207.68494-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Few Texas Instruments DC-DC converters on PMBus like TPS544B20 do not
have bindings and are used only as hardware monitoring sensor.  These
devices are actually not trivial and can receive basic configuration
(e.g. power up mode, CNTL pin polarity, expected input voltage), however
devicetree support for configuration was never added.

Therefore in current state the devices are used only in read-only mode
and have trivial bindings, so document them to have basic dtschema
tests.

Cc: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 791079021f1b..3297a6480534 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -329,12 +329,19 @@ properties:
           - ti,tmp122
             # Digital Temperature Sensor
           - ti,tmp275
+            # TI DC-DC converter on PMBus
+          - ti,tps40400
             # TI Dual channel DCAP+ multiphase controller TPS53676 with AVSBus
           - ti,tps53676
             # TI Dual channel DCAP+ multiphase controller TPS53679
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
+            # TI DC-DC converters on PMBus
+          - ti,tps544b20
+          - ti,tps544b25
+          - ti,tps544c20
+          - ti,tps544c25
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
             # i2c trusted platform module (TPM)
-- 
2.32.0

