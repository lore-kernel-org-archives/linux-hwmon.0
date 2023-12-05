Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCA68E90;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZGFV+PX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB56C433C9;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789777;
	bh=hGf56Pt9Njit18J/a3bDX9F940OoM+6On1YnEva0vDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HZGFV+PXOgWOmNDcmXqh++Q+2PSjLjGtYg+z69JwuGHE2AHfOyxSLqSKeRnR7zxtC
	 xiH+NLA4QOJ3P60SKQNryz6aGtC1D+c5Ce0cYmOGMeL6VNSMR0CKkqIStDtTpXXIkY
	 ApbPbnKOIDF4s15SwQw0vLBHxnrfuGrN8z2+1Axi3U0QCexTGg6rGDrvocfsHY/gc7
	 aJ9X2CQ6ykyglsKMhCyBNRQkhAlaXySeiEwRUA+HSKF5gtx+YTsNftsqpQuBVq+6aZ
	 K+lzbIXhMqNzgJGoncx/SuAXVniEi2CRce7ctf95HqTBC+K5OCTIFV7mBico75OYfq
	 G44OfrZyVWKfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE4DC07E97;
	Tue,  5 Dec 2023 15:22:57 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 05 Dec 2023 16:22:55 +0100
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-ltc4282-support-v3-1-e0877b281bc2@analog.com>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
In-Reply-To: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701789775; l=6103;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=mwYxsKMqbzfWUYbcRx2BgaOGzoY5k7xtjGAxAqKnnQE=;
 b=EevwlVAcQxtr6iLUgNHO5djjOpgSgSdgJM4AQNxAC8hWH5Dj3beVM/vgkMG0FF0cxZBI7f6BH
 hp9/VCA25XbC/+VN8m1fbZuVzkqQptEaWEqSpJvQMv+c85d7+tR/SsM
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received:
 by B4 Relay for nuno.sa@analog.com/20231116 with auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: <nuno.sa@analog.com>

From: Nuno Sa <nuno.sa@analog.com>

Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
Compatible Monitoring.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     | 142 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 148 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
new file mode 100644
index 000000000000..be3db64b9c18
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
+
+maintainers:
+  - Nuno Sa <nuno.sa@analog.com>
+
+description: |
+  Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4282
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  adi,rsense-nano-ohms:
+    description: Value of the sense resistor.
+
+  adi,vin-mode-microvolt:
+    description:
+      Selects operating range for the Undervoltage, Overvoltage and Foldback
+      pins. Also for the ADC. Should be set to the nominal input voltage.
+    enum: [3300000, 5000000, 12000000, 24000000]
+    default: 12000000
+
+  adi,fet-bad-timeout-ms:
+    description:
+      From the moment a FET bad conditions is present, this property selects the
+      wait time/timeout for a FET-bad fault to be signaled. Setting this to 0,
+      disables FET bad faults to be reported.
+    default: 255
+    maximum: 255
+
+  adi,overvoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+
+  adi,undervoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+
+  adi,current-limit-sense-microvolt:
+    description:
+      The current limit sense voltage of the chip is adjustable between
+      12.5mV and 34.4mV in 3.1mV steps. This effectively limits the current
+      on the load.
+    enum: [12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375]
+    default: 25000
+
+  adi,overcurrent-retry:
+    description:
+      If set, enables the chip to auto-retry 256 timer cycles after an
+      Overcurrent fault.
+    type: boolean
+
+  adi,overvoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Overvoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,undervoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Undervoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,fault-log-enable:
+    description:
+      If set, enables the FAULT_LOG and ADC_ALERT_LOG registers to be written
+      to the EEPROM when a fault bit transitions high and hence, will be
+      available after a power cycle (the chip loads the contents of
+      the EE_FAULT_LOG register - the one in EEPROM - into FAULT_LOG at boot).
+    type: boolean
+
+  adi,gpio1-mode:
+    description: Defines the function of the Pin. It can indicate that power is
+      good (PULL the pin low when power is not good) or that power is bad (Go
+      into high-z when power is not good).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [power_bad, power_good]
+
+  adi,gpio2-mode:
+    description: Defines the function of the Pin. It can be set as the input for
+      the ADC or indicating that the MOSFET is in stress (dissipating power).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [adc_input, stress_fet]
+
+required:
+  - compatible
+  - reg
+  - adi,rsense-nano-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@50 {
+            compatible = "adi,ltc4282";
+            reg = <0x50>;
+            adi,rsense-nano-ohms = <500>;
+
+            adi,gpio1-mode = "power_good";
+            adi,gpio2-mode = "adc_input";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cd9591df77d7..1d209f226ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12636,6 +12636,12 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4282 HARDWARE MONITOR DRIVER
+M:	Nuno Sa <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org

-- 
2.43.0

