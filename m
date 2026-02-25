Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D63E9590
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039765; cv=none; b=Gb2Xs102+9uS1DB1mUZxAspeASqBe1CmCbN41TiFRFixwlP/OMsCysau2ewvhZq3GpOFHC3G58P6NaACn5h6k2UYOiC0fGRti8o1T6DGfmtCy5YTvk9feDAuKiQo+anfZsRlwZOsKj+IO77ug4cl3+TOLuXKuyqll4j6LNNDptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039765; c=relaxed/simple;
	bh=GmrTOcduYFWztbDipH18KMisBevU22vGehlPtTcg9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeBDqW4oEHcsm/HavO66Vi/MOxfs/9J4Yyy35XcvrwzsRo8nR+IgaXuOB6ReFTztsqNIn4OuK/5dMfpgkIG119Ax3nYsv9cE+ArXTha7vTC6HP3sTiWN1FxCqh3+QPXXJpiXWmqw8Ei4JEm3isxwHLnqljUPHGrvj3H5Ww6rXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003CC-S2; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b86-2l;
	Wed, 25 Feb 2026 18:15:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-00000008JEa-0IrA;
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
Subject: [PATCH v1 7/8] dt-bindings: mux: add NXP MC33978/MC34978 AMUX
Date: Wed, 25 Feb 2026 18:15:40 +0100
Message-ID: <20260225171545.1980385-8-o.rempel@pengutronix.de>
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

Add device tree binding documentation for the Analog Multiplexer (AMUX)
block of the NXP MC33978/MC34978 Multiple Switch Detection Interface
(MSDI).

The AMUX acts as a 24-to-1 router, allowing an external SoC ADC to
sample the analog voltage of any of the 22 mechanical switch inputs, the
internal silicon temperature diode, or the main battery supply (VBATP).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 11 ++++
 .../bindings/mux/nxp,mc33978-mux.yaml         | 55 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
index 58fcfe24d415..f86f72cfe230 100644
--- a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
@@ -64,6 +64,12 @@ properties:
     description: |
       Hardware monitoring child node for fault detection.
 
+  mux-controller:
+    type: object
+    $ref: /schemas/mux/nxp,mc33978-mux.yaml#
+    description: |
+      Analog multiplexer (AMUX) controller child node.
+
 required:
   - compatible
   - reg
@@ -104,5 +110,10 @@ examples:
             hwmon {
                 compatible = "nxp,mc33978-hwmon";
             };
+
+            mux-controller {
+                compatible = "nxp,mc33978-mux";
+                #mux-control-cells = <0>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml b/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml
new file mode 100644
index 000000000000..ccb8efb91d8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/nxp,mc33978-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Analog Multiplexer
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  The MC33978 and MC34978 include a 24-to-1 analog multiplexer (AMUX) that
+  routes one of the following signals to an external AMUX pin for measurement
+  by an external ADC:
+
+  - Channels 0-13: SG0-SG13 switch input voltages
+  - Channels 14-21: SP0-SP7 switch input voltages
+  - Channel 22: Internal temperature diode
+  - Channel 23: Battery voltage (VBATP)
+
+  The AMUX requires a settling time of up to 200 us for full-scale voltage
+  steps. Consumers (e.g., io-channel-mux) must configure this delay.
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978-mux
+      - nxp,mc34978-mux
+
+  '#mux-control-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#mux-control-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    amux: mux-controller {
+        compatible = "nxp,mc33978-mux";
+        #mux-control-cells = <0>;
+    };
+
+    iio-mux {
+        compatible = "io-channel-mux";
+        io-channels = <&adc 0>;
+        io-channel-names = "parent";
+        mux-controls = <&amux>;
+        settle-time-us = <200>;
+        channels = "sg0", "sg1", "sg2"; /* ... */
+    };
-- 
2.47.3

