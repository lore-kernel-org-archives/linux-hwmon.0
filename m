Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14DD7316E
	for <linux-hwmon@vger.kernel.org>; Tue, 28 May 2024 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900696; cv=none; b=GHS8w1F/XghcmE616ejvDKYsAzffHG7eE4W2K8Mt8m1lXO2AiPE3ajxFXQxutA6onat/jr4IA/y5UZrAm5fvAq16LN/sNA3MvqVzK/1ItzqNdLn6tv+XgZqMxvLn5MSwA19kefign2Nd4kNO8V/qMEUkEBCgFUJbWjB7zrgylwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900696; c=relaxed/simple;
	bh=X1owGtWYRo+/l0DSm9qoof73k9VXXMI2Bemu9W1jHHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8E59ed+bR+s2V/PgFLEavSEPYhHWw7Rsso2th2woYGiadZ5UcAbfVDckSudEQXGOG05RaCE5Wdumyx53UmCVL3UBQKut3p0H4lMvb0HE9wuB5SVyEUZ8TJWe8o3qxI7T8Bit+aqqOIIpO7I/F1z6QYQ5YD32TK4e3ycXmcGpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Jz125kbw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Jz125kbw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354be94c874so647706f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 May 2024 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1716900692; x=1717505492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cs6twXGUnqAVWEMHCctBxuWI9JJWQsFtcp2eRMeUzcU=;
        b=Jz125kbwQCiEM3WmY1z4kQj+jffBi324gUrk+bSSplnwz7pPJZtrr7OeMI7t7AUdRz
         LroNrzuREva4Ov1S17tCYDgeTwTfmJOaYp5EUAFwpcNLSFK2C33RWNsPXdM1qJHALAH4
         6Bswz9KyQd0vzNZK140lBdcze737av8aubFyKHmigyoZkf4/ApyQ6j5drDb8yrWn3zus
         i0TT0mZTgZAmYu28ZyTT7rtx/oIhzsH1bft2go1f4CAL7RigdbngU9ncyK5HsM4tLcN6
         132MyjYd1Kqk8dxfcGuOjAu9iSy5khVjcuilTwywoxqNVALFTkXHLBtPjO/ZGRk+y8wJ
         n7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900692; x=1717505492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cs6twXGUnqAVWEMHCctBxuWI9JJWQsFtcp2eRMeUzcU=;
        b=U0cBLcMG9bGhKmpBHZMd6UUnU3H2XHCzsui7oAm93j6eYzXui+/xxdv2jro4Klpsr/
         dIP89vNvaQyaeLjJILGjceR1H5u5hHG3Yicr5j399d6BdVBlheaeERQVE1bwupOKG/w2
         d56yuPLDsTIMcBt9m/86Hnq2+iy6S0JuxuXRUsxzWjN3LdlA8fcAX1ifTqJAxqrNkRNN
         jZjClZDIlvCq6NntMU5YcDmezfhjNNkU5nXcEe8zZMV38CGvB7qcF6VlEhQbHCJvvXDe
         W/kF/X+V2Qg74iHb7LNF+3NuFILsM19aCbqOI2mkC75al0xV6c9zlv4hG2WRAoc3gw2M
         pbrQ==
X-Gm-Message-State: AOJu0YwtUIeii6YjiwUL1P0fCVA5P+KK2JDG5nwAbWQ5tkXnhts+vgfv
	riJ2EsmB/TL9X2S1evod49rCJQEp98pXoT588+xJbcrCOVB38ipMWhKqVNItiVA=
X-Google-Smtp-Source: AGHT+IHpozxPHqfiGrD0jGWLVOCg6j4KeSpafj5rvrpse51q0RDwAAq/3wQLYkTzuvkogcwGrwjPdA==
X-Received: by 2002:a5d:6342:0:b0:354:c329:90d1 with SMTP id ffacd0b85a97d-3552fdefa90mr10115575f8f.63.1716900691933;
        Tue, 28 May 2024 05:51:31 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c92e7sm11626300f8f.66.2024.05.28.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:51:31 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: Add max6639
Date: Tue, 28 May 2024 18:21:21 +0530
Message-ID: <20240528125122.1129986-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..a2e37f7329b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max6639
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+description: |
+  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
+  fan-speed controller.  It monitors its own temperature and one external
+  diode-connected transistor or the temperatures of two external diode-connected
+  transistors, typically available in CPUs, FPGAs, or GPUs.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,max6639
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pwm-cells':
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^fan@[0-1]$":
+    type: object
+    description: |
+      Represents the two fans and their specific configuration.
+
+    $ref: fan-common.yaml#
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: |
+          The fan number.
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan1: fan-controller@10 {
+            compatible = "maxim,max6639";
+            reg = <0x10>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <3>;
+
+            fan@0 {
+                reg = <0x0>;
+                pulses-per-revolution = <2>;
+                max-rpm = <4000>;
+                target-rpm = <1000>;
+                pwms = <&fan1 0 25000 0>;
+            };
+
+            fan@1 {
+                reg = <0x1>;
+                pulses-per-revolution = <2>;
+                max-rpm = <8000>;
+                pwms = <&fan1 1 25000 0>;
+            };
+        };
+    };
+...

base-commit: 5fbf8734fb36cf67339f599f0e51747a6aff690c
-- 
2.42.0

