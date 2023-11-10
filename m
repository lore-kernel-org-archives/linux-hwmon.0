Return-Path: <linux-hwmon+bounces-7-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8D0C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:55 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A78AB22920
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07E53A295;
	Fri, 10 Nov 2023 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF523D997
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 17:47:09 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7E43A234;
	Fri, 10 Nov 2023 07:16:52 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AADPX0h001170;
	Fri, 10 Nov 2023 10:16:29 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3u7w2fx6ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 10:16:28 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 3AAFGRFS046171
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Nov 2023 10:16:27 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Nov 2023 10:16:26 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Nov 2023 10:16:26 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Nov 2023 10:16:26 -0500
Received: from nsa.sphairon.box ([10.44.3.69])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3AAFGA0L029635;
	Fri, 10 Nov 2023 10:16:20 -0500
From: Nuno Sa <nuno.sa@analog.com>
To: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Nuno Sa
	<nuno.sa@analog.com>,
        Rob Herring <robh+dt@kernel.org>, Andy Shevchenko
	<andy@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Conor Dooley
	<conor+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Date: Fri, 10 Nov 2023 16:18:45 +0100
Message-ID: <20231110151905.1659873-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231110151905.1659873-1-nuno.sa@analog.com>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: p5OG32J-rIDCiEGfV79xuNjpO41KKOtS
X-Proofpoint-GUID: p5OG32J-rIDCiEGfV79xuNjpO41KKOtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100126

Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
Compatible Monitoring.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../bindings/hwmon/adi,ltc4282.yaml           | 228 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
new file mode 100644
index 000000000000..0a5d540f014e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
@@ -0,0 +1,228 @@
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
+  adi,clkout-mode:
+    description: |
+      Controls in which mode the CLKOUT PIN should work:
+        0 - Configures the CLKOUT pin to output the internal system clock
+        1 - Configures the CLKOUT pin to output the internal conversion time
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
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
+        0 - Use the external dividers.
+        1 - Internal dividers 5%
+        2 - Internal dividers 10%
+        3 - Internal dividers 15%
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+
+  adi,undervoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+        0 - Use the external dividers.
+        1 - Internal dividers 5%
+        2 - Internal dividers 10%
+        3 - Internal dividers 15%
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+
+  adi,current-limit-microvolt:
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
+  adi,gpio-alert:
+    description: Use the ALERT pin as a GPIO.
+    type: boolean
+
+  adi,gpio1-mode:
+    description: |
+      Defines the function of the Pin.
+          0 - GPIO Mode.
+          1 - Power Bad. Goes into high-z to indicate that the output power is
+              no longer good.
+          2 - Power Good. Pulls low to indicate that the output power is no
+              longer good.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 2
+
+  adi,gpio2-mode:
+    description: |
+      Defines the function of the Pin.
+          0 - GPIO Mode.
+          1 - Acts as an input pin and it is feeded into the ADC.
+          2 - Pulls Low when the MOSFET is dissipating power (stress).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 2
+
+  adi,gpio3-mode:
+    description: |
+      Defines the function of the Pin.
+          0 - GPIO Mode.
+          1 - Acts as an input pin and it is feeded into the ADC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 1
+
+  gpio-controller:
+    description:
+      This property applies if some of the pins are used as GPIOs.
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - adi,rsense-nano-ohms
+
+dependencies:
+  adi,alert-as-gpio: [gpio-controller, '#gpio-cells']
+
+allOf:
+  - if:
+      required:
+        - adi,gpio1-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio0-mode:
+                const: 0
+          then:
+            dependencies:
+              adi,gpio0-mode: [gpio-controller, '#gpio-cells']
+  - if:
+      required:
+        - adi,gpio2-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio1-mode:
+                const: 0
+          then:
+            dependencies:
+              adi,gpio1-mode: [gpio-controller, '#gpio-cells']
+  - if:
+      required:
+        - adi,gpio3-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio2-mode:
+                const: 0
+          then:
+            dependencies:
+              adi,gpio2-mode: [gpio-controller, '#gpio-cells']
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
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            adi,gpio1-mode = <2>;
+            adi,gpio2-mode = <0>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 43121073390c..9f9527f6057b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12481,6 +12481,12 @@ S:	Maintained
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
2.42.1


