Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7264C54E94
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 20:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjAXUXk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjAXUXj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 15:23:39 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC647AA8
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 12:23:38 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so11823215wmc.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 12:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmEnLOdJR14tI3Ntkk00dRFSWjZDFa7+/nYKUeYSOJ0=;
        b=YqaBqbArvj9tbfXxPPzqzyMoylHmGoUYM+4Xi57XkIPMpujQwSX5eOg8gPnANqmOmG
         FGhqo/sTQ4dB7Uzkya2ud5U/S/eOA4KPEvG/lE4cNc1/nu84GAjvm9MVfy8xVYMHDDjE
         fRu1vtqSt76yMqKMa5zQRF4P1nsLXK00yjW7XbsKh0lHuua1RD8OnYnP67c/6cdMQm0X
         lFQ/QUpixTm2XVfv9qXxsjni03Vk4LUS+1BjxNRfeH95ZjpWzsFuoEVwiBej2oLPKrwn
         1E+iCfWFotzVMxxiukAKlHk/raUwCntYZ0BUJdg33cnXy4d0VUO+3WMH6b3Eianl4d8T
         MDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmEnLOdJR14tI3Ntkk00dRFSWjZDFa7+/nYKUeYSOJ0=;
        b=6joW9mfgksub6HKNTw3mYbnsqWc4B2hRWidDSuR9AzeLgVMTifSpFLuAI4wDaixc96
         CLqXUeY6vTj2WcEM2k1F+v9GYzIDWuq0WHRP8KuU0UnLlesI0r9VdGmNlmKAAYxOJrx+
         17gA9rShNHzbdRHg9BcoJaqpMpGQytqMqMaz+0UtIka5KAwcaIWA9i5yFI3ia3xGvAw3
         fIAzNe1Taxo7wFOK/wSkzgo5hiL4gy8mmQVMdpb24n6S33a7ETidNNCYOpCSGdhfT0iM
         kpxeBsrUi66j9IFVCPtA3ah8SnKlxcS6WJ5CQnm/npFEg9rtsnpcMk2ZKqGINH3yGcpz
         Jq8A==
X-Gm-Message-State: AFqh2kqfwI2o3riCzpR2g4aQRKs+DJ7/ujnG5rjGQIOch6gSc6fKXc/s
        56eLzy3n+KgOgssI3Q/poQBuJA==
X-Google-Smtp-Source: AMrXdXswcuYTJMXhy4DWMQbQ2A+Kg+0md+xzTgmnKD0QB2GaeTpXmAVDutq5HUKk8SJj/ebTyutWsg==
X-Received: by 2002:a1c:7712:0:b0:3da:1e35:dfec with SMTP id t18-20020a1c7712000000b003da1e35dfecmr29505954wmi.4.1674591817237;
        Tue, 24 Jan 2023 12:23:37 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b003d9df9e59c4sm15334737wmq.37.2023.01.24.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 12:23:36 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Infineon TDA38640 Voltage Regulator
Date:   Tue, 24 Jan 2023 21:23:16 +0100
Message-Id: <20230124202317.3704963-1-Naresh.Solanki@9elements.com>
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

