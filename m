Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D280DC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 07:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiEQH5s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 03:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242149AbiEQH5o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 03:57:44 -0400
Received: from inet10.abb.com (inet10.abb.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D3638781
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 00:57:31 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 24H7v53n011137;
        Tue, 17 May 2022 09:57:05 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id 906F265FAB06;
        Tue, 17 May 2022 09:57:05 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Holger Brunck <holger.brunck@hitachienergy.com>
Subject: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable property
Date:   Tue, 17 May 2022 09:57:03 +0200
Message-Id: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
X-Mailer: git-send-email 2.35.1.871.gab1f276
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some devices can operate in an extended temperature mode.
Therefore add a boolean ti,extended-range-enable to be able to
select this feature in the device tree node. Also make sure that this
feature can only be enabled for the devices supporting this feature.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
---
changes for v3:
  - rename property to ti,extended-range-enable
  - use allOf:if to check if the device supports this feature
  - rephrase commit msg

 .../bindings/hwmon/national,lm90.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 48b7065798b0..1c39b1b4011b 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -53,10 +53,28 @@ properties:
   vcc-supply:
     description: phandle to the regulator that provides the +VCC supply
=20
+  ti,extended-range-enable:
+    description: Set to enable extended range temperature.
+    type: boolean
+
 required:
   - compatible
   - reg
=20
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adt7461
+              - adi,adt7461a
+              - ti,tmp451
+              - ti,tmp461
+    else:
+      properties:
+        ti,extended-range-enable: false
+
 additionalProperties: false
=20
 examples:
--=20
2.35.1.871.gab1f276

