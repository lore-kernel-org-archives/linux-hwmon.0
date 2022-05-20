Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17741C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346778AbiETJyS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347972AbiETJyP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:15 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34A714ACA0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:12 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:44 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 2/8] dt-bindings: hwmon: Add 'extended-range-enable' property support in lm90
Date:   Fri, 20 May 2022 11:32:38 +0200
Message-Id: <20220520093243.2523749-3-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040306;
        bh=22cLxtKoijqNk6rKLajnHx+TImeEoOc7fC+XaF4oOGY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=OaFPbgLWGjxNysMm6Eb1i3bs6Wok4figSFmMJk+RZozWqA+ZGE/6NqDOhR7eJQ417
         m6Df8kqu5gI0XnChXJsY3BoAC5fIxGyIZR6WiHYtWUH88jpyF4dCrH4INqyvl+JHbg
         iXK4GtsrdJ2o66jE6BU+74eBIDmZsCF8TyW8/sq4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Using the 'extended-range-enable' prop will enable the extended
measurement range for device (if supported by the device).

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 92d97ebefaae..066c02541fcf 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -53,6 +53,9 @@ properties:
   vcc-supply:
     description: phandle to the regulator that provides the +VCC supply
 
+  extended-range-enable:
+    description: enables the extended temperature range measurement (if supported by device).
+
 required:
   - compatible
   - reg
-- 
2.36.1

