Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA13E9F84
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039773; cv=none; b=Wy34J9znQXa/ML1LrjXJIOITS91774cjuh4HxSNESDy1Qv+HJQEEeTuVrvZNqANviE18E8QfaH8vFMgcC0d1iSkV6F5HkBPgdLLTBDKk07yXrV/UOEzMlo5bjOgQXBnrFBhi5b9UwZ3a8lvwCDsJF9o0CvrvSfg2X2iXGvgngig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039773; c=relaxed/simple;
	bh=egCfM0YGhfPlTldjlvHVKlmkGukF+YBwAMQxbKCiMKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOD+ffyzqcdKItTZUGF1mmAmliGK93FIynKcJ+pbNIyI3a4ogfuLUkoInropS5Yd46FjMb2vcomxvbFr/HIFzm6L2zGV/lgGaNcvKEvV/eFC8gaWC/IEwtI+v1tFEU5XLQZBPNJbYIFza43SJE6/OMga2D8clbAWcbRti1uEU3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003C9-S1; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b81-2S;
	Wed, 25 Feb 2026 18:15:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-00000008JEE-07vB;
	Wed, 25 Feb 2026 18:15:47 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v1 5/8] dt-bindings: hwmon: add NXP MC33978/MC34978 hwmon
Date: Wed, 25 Feb 2026 18:15:38 +0100
Message-ID: <20260225171545.1980385-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225171545.1980385-1-o.rempel@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Add device tree binding documentation for the hardware monitoring block
of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/hwmon/nxp,mc33978-hwmon.yaml     | 34 +++++++++++++++++++
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 10 ++++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
new file mode 100644
index 000000000000..b7e2aaa51a33
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/nxp,mc33978-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Hardware Monitor
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  Hardware monitoring driver for the MC33978/MC34978 MSDI device.
+  Provides fault detection and monitoring for:
+  - Battery voltage (VBATP) faults: undervoltage, overvoltage
+  - Temperature faults: over-temperature, warning threshold
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978-hwmon
+      - nxp,mc34978-hwmon
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hwmon {
+        compatible = "nxp,mc33978-hwmon";
+    };
diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
index 5e8ab2cff685..58fcfe24d415 100644
--- a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
@@ -58,6 +58,12 @@ properties:
     description: |
       Pinctrl and GPIO controller child node for the 22 switch inputs.
 
+  hwmon:
+    type: object
+    $ref: /schemas/hwmon/nxp,mc33978-hwmon.yaml#
+    description: |
+      Hardware monitoring child node for fault detection.
+
 required:
   - compatible
   - reg
@@ -94,5 +100,9 @@ examples:
                 gpio-controller;
                 #gpio-cells = <2>;
             };
+
+            hwmon {
+                compatible = "nxp,mc33978-hwmon";
+            };
         };
     };
-- 
2.47.3

