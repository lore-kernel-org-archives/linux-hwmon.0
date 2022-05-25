Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420DBC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiEYHhT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiEYHhR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:17 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABAE5DBF1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:16 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:13 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 1/7] dt-bindings: hwmon: Add compatible string for ADT7481 in lm90
Date:   Wed, 25 May 2022 09:36:51 +0200
Message-Id: <20220525073657.573327-2-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464235;
        bh=4odEewbwZcaxnfC1CYoMmE2sqvk0v0Ksnmm/yXE9drM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=K4kEoXbTzL/PsDerrtcCkkfqNmkTvNrYVRlxf5TeueW9usAkj4MgC4JlORFg7cD1u
         H1LN8O272i/OoFgz3xyLvGH7TC0DaAwYddKmizCBjyYB/LKJ9yftcw3NI3SojDPUri
         4gXIBbp58ky8E80JFSnHPGL6HDXiNNl9JKUUjyK0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

This will allow binding the driver with the device from the device tree.

This device can work in extended temperature measurement mode, so add it
also to the list of devices that support 'ti,extended-range-enable'.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index b04657849852..82fce96498c7 100644
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
@@ -70,6 +71,7 @@ allOf:
               enum:
                 - adi,adt7461
                 - adi,adt7461a
+                - adi,adt7481
                 - ti,tmp451
                 - ti,tmp461
     then:
-- 
2.36.1

