Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20FC38142
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 14:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbjAXOt3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbjAXOtL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 09:49:11 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727464A217
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 06:48:55 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v10so18511325edi.8
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmEnLOdJR14tI3Ntkk00dRFSWjZDFa7+/nYKUeYSOJ0=;
        b=I9WJV4tHohdSFNvgT3DyyRpkrkbR321+ZvIjeLn6cxLNMil3v6RvbA23WpOl1FxWEZ
         RM+OHDDpxbAV8RAzSY6xlxgcpTrXPJk5RYx68GTxFl+059YF4psYeA6sgwHrInvtHg6w
         RGNIxRI/h2d7K2Xb2fbYAl+rtymmKdxwot95z3bsNwmg+1jh84fuVY3sSZ7cq9hLKI/Y
         OZzCuHUjUIrqEeJ9oVPeik/jPaC+4D5eXsw9bMw3TlmqaqRQrTYraFzHhI0K/odUEgp+
         2vka+hpM4gz8/c+V+Ta/loEiExVqCINA1nioIiaE5ygICF7gz+5aSI4j1PhVMU9k5AYa
         2GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmEnLOdJR14tI3Ntkk00dRFSWjZDFa7+/nYKUeYSOJ0=;
        b=hYnsiLo2s1FIdCDJUSHUl8L/k12TmuEOGrqE6dRfEMmW5juBhDWDj+ja0136MCsdRL
         M7oSQlN3Ev4uydsrpWsAaUGqn+C3g/FF1nylD3UOqjONvJp/fwGC0MGTe5ihfLp5OwBl
         fr3vbdF2DisQl+8Wb2bsuFTkZ9eNW93ZS4zqYLts6wgJdTQ3vk61GiuwpimkfNj5iHSH
         sLstirCqeeJyGIjPJ/gSxBu7uSeTBOfsLymBVrBuQ5a4ozxtCn6ObCvfQQN+VavQKfFd
         mV4bHtVv2yVpGFNRSGJX5+dLDoiZ8B9amZC3Y8Ku6Wbz027GrcQQu6FZBUPKLLP+Y4X2
         tcfw==
X-Gm-Message-State: AFqh2krRIPAv/mGQFkeLDNhQvhU1bUxngbt8xmt4Izo+yOrxHkjJi22Q
        fwQ8qylpC7PEPZ4NVzUekmgXbg==
X-Google-Smtp-Source: AMrXdXvn5O8bRNj0aUasc7ka2tDDIcHcDOU0IRE4ejFhCjw58kLWIlA0ka87oYwA8fHtt/cbAf9TAg==
X-Received: by 2002:aa7:cc81:0:b0:47e:eaae:9a5b with SMTP id p1-20020aa7cc81000000b0047eeaae9a5bmr28281849edt.42.1674571734030;
        Tue, 24 Jan 2023 06:48:54 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7c908000000b00482e0c55e2bsm728104edt.93.2023.01.24.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:48:53 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: trivial-devices: Add Infineon TDA38640 Voltage Regulator
Date:   Tue, 24 Jan 2023 15:48:45 +0100
Message-Id: <20230124144847.423129-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Infineon TDA38640 is PMBUS compliant voltage regulator.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index f5c0a6283e61..a28b02036489 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -141,6 +141,8 @@ properties:
           - infineon,slb9645tt
             # Infineon SLB9673 I2C TPM 2.0
           - infineon,slb9673
+            # Infineon TDA38640 Voltage Regulator
+          - infineon,tda38640
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe11280

base-commit: 4d891f76a30d3be4194a805c5e4277786140ef05
-- 
2.38.1

