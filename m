Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDA5C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 08:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237872AbiEJINa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 04:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbiEJIN0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 04:13:26 -0400
Received: from inet10.abb.com (inet10.abb.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F07C259F91
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 01:09:28 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 24A892es031565;
        Tue, 10 May 2022 10:09:02 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id 4AF1465F90D5;
        Tue, 10 May 2022 10:09:02 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Holger Brunck <holger.brunck@hitachienergy.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [v2 1/2] dt-bindings: add extended-range-enable property to lm90.yaml
Date:   Tue, 10 May 2022 10:08:59 +0200
Message-Id: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
X-Mailer: git-send-email 2.35.1.871.gab1f276
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some devices can operate in an extended temperature mode.
Therefore add a boolean onsemi,extended-range-enable to be able to
select this feature in the device tree node.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
cc: Jean Delvare <jdelvare@suse.com>
cc: Guenter Roeck <linux@roeck-us.net>
cc: Rob Herring <robh+dt@kernel.org>
cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 30db92977937..92afa01380eb 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -52,6 +52,10 @@ properties:
   vcc-supply:
     description: phandle to the regulator that provides the +VCC supply
=20
+  onsemi,extended-range-enable:
+    description: Set to enable extended range temperature.
+    type: boolean
+
 required:
   - compatible
   - reg
--=20
2.35.1.871.gab1f276

