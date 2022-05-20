Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673A6C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241878AbiETJxf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347922AbiETJxe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:53:34 -0400
X-Greylist: delayed 120 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 May 2022 02:53:32 PDT
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B8D14AC9B
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:53:32 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:43 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 1/8] dt-bindings: hwmon: Add support for ADT7481 in lm90
Date:   Fri, 20 May 2022 11:32:37 +0200
Message-Id: <20220520093243.2523749-2-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040304;
        bh=rZ3VasfHokP8cmTBuMPcZ2asdVA79OQ/FHbd5JxSj8M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=T2AwcBbZeb+rHS0/V115GsrTxwtDKFcFUnljlYQN9QII9SbhRvRTDHA6ncAC8AIhk
         oiht2d2KM0/5RK72m8Qg/zEal2MK5RC7lstezGR7nBtgZBKnduLndaNevH5OSCs5T5
         vfLmXVODj8ncw2506JjBDuHmyGGC1CjMSAG4lLDE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

The ADT7481 sensor is quite similar to MAX6696 so we can reuse a lot of
code from lm90.c driver.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 30db92977937..92d97ebefaae 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -16,6 +16,7 @@ properties:
       - adi,adm1032
       - adi,adt7461
       - adi,adt7461a
+      - adi,adt7481
       - dallas,max6646
       - dallas,max6647
       - dallas,max6649
-- 
2.36.1

