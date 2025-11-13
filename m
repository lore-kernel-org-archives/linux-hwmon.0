Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219F2F6585;
	Thu, 13 Nov 2025 23:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075500; cv=none; b=sO86KvHp4SrLbm4ruUtNCgkJe3kLQnFa6j4i3Y03fKv6PgF8uudQ5az6l6tjtfmCut/cfsn5SHf/MwCM+DyephkCo2E+672LCLyBqwD2+65ftS1m/G2q1FnpM2RXIHjp7gdrXvvHg/lOECsolloYoYIoYoyJBXxs4rqPiMfPGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075500; c=relaxed/simple;
	bh=eW434AzTthzShhSP9k4agJhCm8IckIw44BA0AY/lGNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCn6DsFXUiF1yzfvUfhcPN7jUScYqeK2S7z76w8IPs5XLwQUhjjDrK0KUneBpQCCxHCE9BWA3PbmsSGYVsoJ8/MhSpfcjcvwIIvx37Qb840LiXAnVyTrb41jRzxP62mxKjUYcKXI0KnpB3caO0nMFnEe2JqjKezCliD0URJKbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8JZ3odAk; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8JZ3odAk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=awmJtLJBvhAfwJnDUR/tVhpFnJ0yeqggY8R7Yl2jinA=; b=8JZ3odAkDwIxRt0Sbmf1ehIxnk
	ixxd7/wA4mpFm7dvsT8xGyG9PxNgUqPcdVT3vazbgiU1XSiGISF2p3ojkIJ1bgGmyKW7ATalnD0f0
	MvZv6R6RoUuYjN/0kAbuhjMe+LfXJkVusUedvBilvdcM2YtPZUpxK4DWzy4UxnvJtPSmt/SwuJTzh
	YHq9t7nkDuOSBPyF5gQcNH7fY/ZT3f6K4b9d3llFI9+cxlQjufB8qCoi+J7x75ax9P2lt9qlhfWUo
	AtCR/WdTHwIWL82Smn+aiV6n2/MLTpIR6k1S0Ke8MgqTzuXjn8dqWSOENPJo8AhQGFuB1H04I/7Jw
	JTifXStw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 14 Nov 2025 00:06:42 +0100
Subject: [PATCH v2 2/3] dt-bindings: regulator: Add Fitipower FP9931/JD9930
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-fp9931-submit-v2-2-cd6998932c4c@kemnade.info>
References: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
In-Reply-To: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=eW434AzTthzShhSP9k4agJhCm8IckIw44BA0AY/lGNg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJliKWd1d/34WelteL7DeuKUJJ1Zq7ace7ZwzfNay9VGD
 Gp85dIqHSUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzE5BIjw4HQimwu06T+8//U
 J29rOpHrL/HyzZF7Uh/CTEJuGscWrGP4whFUJOvnOWt60qwGkwCvtVe1jY3XP+sX+8le+MC59SE
 HAA==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Document the FP9931/JD9930. As the FP9931 is a clear subset of the JD9930,
define it as a fallback compatible. GPIO names are same as in the datasheet
except for the EN pad which is described as "enable".

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/regulator/fitipower,fp9931.yaml       | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml b/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml
new file mode 100644
index 000000000000..28802e4518c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/fitipower,fp9931.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FitiPower FP9931/JD9930 Power Management Integrated Circuit
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+description:
+  FP9931 is a Power Management IC to provide Power for EPDs with one 3.3V
+  switch, 2 symmetric LDOs behind 2 DC/DC converters, and one unsymmetric
+  regulator for a compensation voltage.
+  JD9930 has in addition some kind of night mode.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fitipower,fp9931
+
+      - items:
+          - const: fitipower,jd9930
+          - const: fitipower,fp9931
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  pg-gpios:
+    maxItems: 1
+
+  en-ts-gpios:
+    maxItems: 1
+
+  xon-gpios:
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Supply for the whole chip. Some vendor kernels and devicetrees
+      declare this as a non-existing GPIO named "pwrall".
+
+  fitipower,tdly-ms:
+    description:
+      Power up soft start delay settings tDLY1-4 bitfields in the
+      POWERON_DELAY register
+    items:
+      - enum: [0, 1, 2, 4]
+      - enum: [0, 1, 2, 4]
+      - enum: [0, 1, 2, 4]
+      - enum: [0, 1, 2, 4]
+
+  regulators:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(vcom|vposneg|v3p3)$":
+        unevaluatedProperties: false
+        type: object
+        $ref: /schemas/regulator/regulator.yaml
+
+required:
+  - compatible
+  - reg
+  - pg-gpios
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@18 {
+          compatible = "fitipower,fp9931";
+          reg = <0x18>;
+          pinctrl-names = "default";
+          pinctrl-0 = <&pinctrl_fp9931_gpio>;
+          vin-supply = <&epd_pmic_supply>;
+          pg-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+          en-ts-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>;
+          enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+          fitipower,tdly-ms = <2 2 4 4>;
+
+          regulators {
+            vcom {
+              regulator-name = "vcom";
+              regulator-min-microvolt = <2352840>;
+              regulator-max-microvolt = <2352840>;
+            };
+
+            vposneg {
+              regulator-name = "vposneg";
+              regulator-min-microvolt = <15060000>;
+              regulator-max-microvolt = <15060000>;
+            };
+
+            v3p3 {
+              regulator-name = "v3p3";
+            };
+          };
+        };
+    };

-- 
2.47.3

