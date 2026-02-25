Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6638E5D7
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011768; cv=none; b=CmeUb8/2x+Wn1RihEuOsOSScS0Vzpf7ZzID895ocrOMEAkOKfwWtW3qEqiEJa4TvN2aAIcYmyeZQXWlNLByOzB0Dc/KwgRCZo/Y8V8bxG9a46IRm2xvLsKMmFoq5IPLpm6j66uLPLxJXL4dCiPK4YKz0XXn8HLOxVl9QAcGPvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011768; c=relaxed/simple;
	bh=nfhF+uSMnIk48frjPAZKn3oDK6TMKtAu7341kKYbV4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QujoVRTu/t2NNd5RmXKXGQu0lQ1yhTjBYJfKWKDZ40re3McDYgmjBGQ8ij6Tx5cBgpBH9tUESjXaGwhXQBQ012wHMZlo7wfty1ZzK+ORuPPUBvhoIOlR3Bt22ASUYtk1yi+Ja2nREBAbII0P26OyhS3CV72cnP6TbgZ0eIziMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=MJT9CozY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="MJT9CozY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806bf39419so4471985e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 01:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772011765; x=1772616565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBu7E7R6aJl6XDY9NrZLFpAyzlylvs3/JCsOIqQyDUI=;
        b=MJT9CozYFMVlySd1Wc04ZN630MVFRGpXiUxXCUrLJ1FYMHAfamTS2f4kaHtKUDVF90
         XXDxW0T+7oK4zWltDhDHHA/a4IE8U8XrgaQcwlIAu9mF+dHGmrrix/0Nt6m2MCfNHUsA
         0GmMbc/8RVdwZFXFEttktD1JHHtp+3gd8h/JGTL0HBNmtPCrzhazCy7IRoX12Clds1P5
         a5xAGtyv3s6nnTMPwNzzHzLCDKz+EIp8pDsZmDqwgfQlg/nw5phBKZ5YtPnCc0swu0oh
         o3e3+JITX8MFJ8+z30G/cXIHqCSEY/GSV6cTd8WzMkhBs/+3Q6lGUyP4XV/W9kpm3f2R
         SeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011765; x=1772616565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IBu7E7R6aJl6XDY9NrZLFpAyzlylvs3/JCsOIqQyDUI=;
        b=h6L4kX6D0QPSUYNs7SdPOoo5IA46borCl4j67BU+Gkbx5r5j3uWn5BmhJBg1UOofiX
         QpL2Y01E2rx3i08aOCvZq/M0QZ4tzu33LTHzUcmfLpb3cvv9W89pB1hGyMlOIGj2YXN1
         4Z9vs814oCdcMlvNPewqipHQ5hVng47YrF1eADkme+tbjbCEIQ4sovWO5p9CSTt6h+Nm
         IOC0IXtWQ/ENM8krZCEb9cDqZyMxMkdBD1t++Jbyg4zhfI7RUlo0nRVu+1+UCh/ZPw+K
         I4qeeb4kjDtOwhS9vKkvd33bV22gH1GdZDYGqDz9f36ksvrtGh4j6AwX9+Mpqqb11wOn
         6G7Q==
X-Gm-Message-State: AOJu0YyIJ4ShoxMYdPGZXhfew2hVbMqMyRmbfrpDPbVZ7epkuS063fJ2
	D0sNx54VM4PjfGY+agxM+zHXi5vQtOdesa4uSunzcxFRBXCEud2IYkQSegkbW4I4vTM=
X-Gm-Gg: ATEYQzxq+6uWDlOEI+mkwAUr0+Qu8AlrOOwrd7OPz8+N15nI9ImsSdlY/XErWZ6mO96
	efROOi7i0nhaIduwxVdXvxKj020YV/OPuKXICB0SuNrcfYmgp1K3CaHrQ1QmXeSl2zYt7yoA8yf
	VA0t71JFA32i5fU7zlYYhZikCM1c2p2ww7rSF1rYgX12X4MiX5pf8elkXljrHmxKE8/SdIdG0dB
	O199Q4jmsSXLmFWTcrGhAAdCuSA297j29Pt4eYuH4ka/SDi08W7RtmnN6747wYDbSM1Yd6CHXXv
	LdBLfmPoXscQ2GQ+ZGwwBRQX+7cxatsnG/YJwYO/Yh2wy6v6uDXJ7ma2iaL4mwC1EAvEAApejch
	SPqhJpSlawOqePNefwfv6Iy0FyCzFEVZML8ICMDCs/wV+I+HcPHWreIhG16tloDG5m3euKHlyqK
	M7e9XyRagzcTuyLuzw/b4+xc1zloYk+NulqabpTY2tuFkavVOtpUVuLE7JYpPxJk6yqgAO7oaOw
	10=
X-Received: by 2002:a05:600c:3652:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-483bd726fc9mr36024395e9.6.1772011765528;
        Wed, 25 Feb 2026 01:29:25 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-44-101.alshamil.net.ae. [94.59.44.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm33027463f8f.38.2026.02.25.01.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:29:25 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Feb 2026 13:29:11 +0400
Subject: [PATCH 1/2] dt-bindings: hwmon: Add DT schema for TI INA4230
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-ina4230-v1-1-92b1de981d46@flipper.net>
References: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
In-Reply-To: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4435; i=alchark@flipper.net;
 h=from:subject:message-id; bh=nfhF+uSMnIk48frjPAZKn3oDK6TMKtAu7341kKYbV4k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTOO/Cl63XXz/DexzzsokIzr/2c3njl55ksWQ7zitDwZ
 ys+2lV+6ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCq2Q8yMkz2+b3EznnicpMDHkz35Ceu0+fp3DmnnnPR6Xuc1cGfrGYwMnyf1VJ
 cdDBm65K4G8xf+M+LPtxu0rf3+635qU6iVn+ZpjEAAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add DT binding for TI INA4230, which is a 48V 4-channel 16-bit I2C-based
current/voltage/power/energy monitor with alert function.

Link: https://www.ti.com/product/INA4230
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
new file mode 100644
index 000000000000..8027eb902f7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,ina4230.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments INA4230 quad-channel power monitors
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description: |
+  The INA4230 is a 48V quad-channel 16-bit current, voltage, power and energy
+  monitor with an I2C interface.
+
+  Datasheet:
+    https://www.ti.com/product/INA4230
+
+properties:
+  compatible:
+    enum:
+      - ti,ina4230
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    description: Required only if a child node is present.
+    const: 1
+
+  "#size-cells":
+    description: Required only if a child node is present.
+    const: 0
+
+  vs-supply:
+    description: phandle to the regulator that provides the VS supply typically
+      in range from 1.7 V to 5.5 V.
+
+  ti,alert-polarity-active-high:
+    description: Alert pin is asserted based on the value of Alert polarity Bit
+      of the CONFIG2 register. Default value is 0, for which the alert pin
+      toggles from high to low during faults. When this property is set, the
+      corresponding register bit is set to 1, and the alert pin toggles from
+      low to high during faults.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+patternProperties:
+  "^input@[0-3]$":
+    description: The node contains optional child nodes for four channels.
+      Each child node describes the information of input source. Input channels
+      default to enabled in the chip. Unless channels are explicitly disabled
+      in device-tree, input channels will be enabled.
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        description: Must be 0, 1, 2 or 3, corresponding to the IN1, IN2, IN3
+          or IN4 ports of the INA4230, respectively.
+        enum: [ 0, 1, 2, 3 ]
+
+      label:
+        description: name of the input source
+
+      shunt-resistor-micro-ohms:
+        description: shunt resistor value in micro-Ohm
+
+      ti,maximum-expected-current-microamp:
+        description: |
+          This value indicates the maximum current in microamps that you can
+          expect to measure with ina4230 in your circuit.
+
+          This value will be used to calculate the Current_LSB and current/power
+          coefficient for the pmbus and to calibrate the IC.
+        minimum: 32768
+        maximum: 4294967295
+        default: 32768000
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: hwmon-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@44 {
+            compatible = "ti,ina4230";
+            reg = <0x44>;
+            vs-supply = <&vdd_3v0>;
+            ti,alert-polarity-active-high;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            input@0 {
+                reg = <0x0>;
+                /*
+                 * Input channels are enabled by default in the device and so
+                 * to disable, must be explicitly disabled in device-tree.
+                 */
+                status = "disabled";
+            };
+
+            input@1 {
+                reg = <0x1>;
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            input@2 {
+                reg = <0x2>;
+                label = "VDD_5V";
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            input@3 {
+                reg = <0x3>;
+            };
+        };
+    };

-- 
2.52.0

