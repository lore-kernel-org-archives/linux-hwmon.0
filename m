Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF4F51F;
	Mon, 18 Dec 2023 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BIDLbpY028640;
	Mon, 18 Dec 2023 11:27:00 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3v2pw7gu8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 11:26:59 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 3BIGQwC9043882
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Dec 2023 11:26:58 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:57 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:57 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Dec 2023 11:26:57 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3BIGQiuW024955;
	Mon, 18 Dec 2023 11:26:54 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 18 Dec 2023 17:29:42 +0100
Subject: [PATCH v4 1/3] dt-bindings: hwmon: Add LTC4282 bindings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231218-b4-ltc4282-support-v4-1-4fc51f7d04f0@analog.com>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
In-Reply-To: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702916989; l=6498;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=oojdKwLyvbvIwuETLcOx1fT8+oVsNhlM5t/I+U44efw=;
 b=MAEmr+q4xJ+CGZI6qesQY6oCLRP8H/+1bUhnK2EPXxmUjd4yNeOlTo5YpLq3l6AIdUdz1cyAl
 2nRhgVOw0nAAOtYePMSDnHkBKGPBKWEjbUV6q85tQe5HKv+du6z5MA2
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: jTkfNfI_DoZ0llvbn0jUanCQu38gVBU2
X-Proofpoint-ORIG-GUID: jTkfNfI_DoZ0llvbn0jUanCQu38gVBU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180121

Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
Compatible Monitoring.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     | 159 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
new file mode 100644
index 000000000000..4854b95a93e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
@@ -0,0 +1,159 @@
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
+    default: external
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
+    default: external
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
+    default: power_good
+
+  adi,gpio2-mode:
+    description: Defines the function of the Pin. It can be set as the input for
+      the ADC or indicating that the MOSFET is in stress (dissipating power).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [adc_input, stress_fet]
+    default: adc_input
+
+  adi,gpio3-monitor-enable:
+    description: If set, gpio3 is set as input for the ADC instead of gpio2.
+    type: boolean
+
+allOf:
+  - if:
+      required:
+        - adi,gpio3-monitor-enable
+    then:
+      properties:
+        adi,gpio2-mode:
+          const: stress_fet
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
index a0677e35c9b6..4c0d12bffd4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12592,6 +12592,12 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4282 HARDWARE MONITOR DRIVER
+M:	Nuno Sa <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
+
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
 L:	linux-i2c@vger.kernel.org

-- 
2.43.0

