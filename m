Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74C4C47095
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jun 2021 10:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9306461205
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jun 2021 10:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhFGKgr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Jun 2021 06:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhFGKgr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Jun 2021 06:36:47 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331A7C061795
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Jun 2021 03:34:40 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id f5so14702280eds.0
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Jun 2021 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=Y5+sYcP12AU9+nSL0rR24Tm+WCMD6ByYuo/k6ES3uomE0fKDJ/gtc+GnLCYf94OkVJ
         Pa/ZWB+1ueMshsQimx8jXXo0KRg+sJUVw06w70HBb8XxnsUIo/d3SR9Paj/RQl4iWHrh
         9v+my4x8gN/HM4sM4tYv43PL5E1eE+V0emvn7dwRmvES4wNzRE/nO7+YAkhfbHPsk456
         8OgFqIMuTToDbniBWzoBh0CfMmPnJ28IBjr+J55l7Pz+Qd8lNeyJQ/R9vHc1zY9fX+Z+
         o5HtIT965jQ5byQEsVpuShiPD3KUiomQeUeQ3OGw+Mk8VgvA3qlWZCb9cIlJetM7yoJP
         +0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=q9ovvg9de3Amo7gyMx6HDh3Tj0jBM1FKYtSRTm8gcWceq3H9PBpa8VrscFTwpB/o3k
         FmhmDKIxwS++DsAAZCp2nWONjhYkL5Tv9U9iTd2wsQs9w0A2Z1MV4rye08/CtpbQaAL4
         sQ11VhCfWIZFnh7sgbIwwjkCgfhRLg2kX9RdTGQ2h19hFMC3aA1qS3PAfmH/IHTaA4t3
         j9UWHzngYykQbggXDKgPug2vgWZd8zn7DzOrusADR/EARU74yymovP7Atth/7v7IaXPj
         8w6nvSDzC4orAVDdcYRIwRXHUL1CGAq1hhSzuRu9loUakOrsxOzU0Ns/3sUJwwDseS5R
         +oDQ==
X-Gm-Message-State: AOAM533mmIz2Nj6bLTGLlXWD8zjXqax23nACA2oZDrMgdCFkEEzpU6lX
        gNIrjxrCCtDxagQf6IqbSpvGew==
X-Google-Smtp-Source: ABdhPJz+jLvE5NKH5gEqXje/mFle1nM9LSCeJiOfsSqvHNWYSi82AU4IlfFsbyKOw0XIedpyBsljuQ==
X-Received: by 2002:a50:ee18:: with SMTP id g24mr19439130eds.11.1623062078574;
        Mon, 07 Jun 2021 03:34:38 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id b25sm7521037edv.9.2021.06.07.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:34:38 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 2/3] dt-bindings: trivial-devices: Add Delta DPS920AB
Date:   Mon,  7 Jun 2021 12:34:30 +0200
Message-Id: <20210607103431.2039073-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607103431.2039073-1-robert.marko@sartura.hr>
References: <20210607103431.2039073-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add trivial device entry for Delta DPS920AB PSU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop custom bindings file and use trivial-devices

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..1cb6c1fc0903 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -68,6 +68,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+          # Delta Electronics DPS920AB 920W 54V Power Supply
+          - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
             # Devantech SRF02 ultrasonic ranger in I2C mode
-- 
2.31.1

