Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08F18C933
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351912; cv=none; b=BfmtaezL1yVuAfsGGohokmPkGQz0yqKlPLRAFV910CxAgWS0BjQBd47Ev8+CLe1r7x7oxU3e9+lcZgW4F0jciyYvDxJx+2MP1Mox7RIsNt2MRA2pZzFB2pREDCRvAfTs47fdjjeXHJZUoZh7/atmXXAb8zLlCukeDSlhOg19/nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351912; c=relaxed/simple;
	bh=QLglMo5Tzt3fMQq9JyCYlBLgJC3+XwEd/tCVV3EfeJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=da816wMYaJxnVDKt0EmzZGaV5WiJJGULfokDDmHaQy/Dz3ixeP75zIx+Qri4y20aVAzo34tui1V46SQ9JdguC+R3KwZnbmn1jZ4ZKv5ofkc8Ix2xY80G5Ou/AbUMSei8A3Msr172mx6s4IKV7F/gV3YCgphXCB9Zy6O+oO+7DDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adTc72gj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adTc72gj"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6cf257f325so2210241a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351910; x=1761956710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwfidYGuKHgshH134+IxmWFS70+GCQaswxiZDtAJyWU=;
        b=adTc72gjS7H5RMgMlV/CeAu6QJpntVP0fjbmeObn3AtBj2B9CVpbSyqrBdV3JcVsXE
         Zs7ZhYQw4ln2EV8En9pQdCdK2UqgTD2GfHZ+JYHkkcCMW8D/jRZ9BpwKTMric1irJufH
         rGJDV/OavrxU1nZy07RGk0h7lLvJVIVVHuaGGYBaoPwkp1ofV01+nXaV0+9O7KAJMni3
         IbfMTAecz3xMQPi6cuE4j+UgTzTQuC9Ju5YEnNVSgQM2mxXr7Qc+/NCB1BGyli05PtmM
         qbhwS3CcQInRHT29sfScwchm0BXrE83Jx/BDWgRjTLBxsuseMK4W7q0h6+9PvSSWh38r
         Tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351910; x=1761956710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwfidYGuKHgshH134+IxmWFS70+GCQaswxiZDtAJyWU=;
        b=vdk2thkSOXjCTOAlaRM4gJP6bxojKVt1TV8j4r6KXwCiyR74K7DV6DMbcAJQWj3DHk
         3ZZDWnTxyQB6n2NxP1DPV9i5Wo6amJoPU3pVuHqOP7id3ujZVGNU4rMftDhW8M2P3VKI
         7OWd1p+97yyW3GVb8d8yRmNszROZLkL6qcC6SrY3L1Vl9zRHtSgELZlMQ2AsbQx9awer
         co66WOmf4N0eBxKRwFhOktVMsyhFkIrdX4nQApR2cU1z8h3LTQsesbtS3joEqWXrdGD1
         kkEWhfE5TZjBD43Vw57yDgHINsrbXwl57WM8ISHrIjWlpAxDiALgEyEd848svbZNJFsX
         vtSw==
X-Forwarded-Encrypted: i=1; AJvYcCXMcUmpUDtNGd0OnusILRDLLDoTo1gdOAvxbgR9KVoScUnf+fl+BFvTwUxYbd6MT/WzvN6L01HkQEyfSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqQixGPFyFhz2z6ZR8UWJ59FwiintrqXKY/7v9aGCtsbLI+lqL
	2lrGU1GpaAb1/PEd6BMElt/8xVANvZTdKw4etMqEHeOrsRArGfnCn1Og
X-Gm-Gg: ASbGnctd/Qq2vAAbcY3jAV9jrify7sKyw5XHBAlRg+HeLur9QBMv2OqrOBdKn1lCGyv
	yFhr4OchpJ3HXzmwS3qCcQxTl7VhuK1giLQwvSDqRSk5CWkrNimLFOqQFtZzqQFVoNPRyDscylv
	G9ZpmVfdrhJO6ZjdVywR3t8FOLGsZDSiZ75RiTLlGLZae34YbgWOwSdWLCmMRWSbNUihQPK0fw/
	RnQPIwl6LTtMn/KI8ShMwTnsXFGQ6FyzPUGYpJIA9OG3yQA51pDDkFaX0Y2sSLsGCUloOR+1rDc
	ibwEJhTH7ooElOoR1wmQNxn3OSdnw2dpxi663BEymd5ZOGvtWiCUIGd15DfokIOSd9XtSHJRnE2
	KOz5JabWs4bHifUTQ75/CjftsvcVGVGY4BmWy4/AwRyzkJ5xPxb8HJPDlATHx5tKIjWEMYqQEkV
	rZMzRahdXlVSz8IH7amrb6GE0ybmcFhx5IhZKgWkxGsNmwi9IvNVZVV0JU5A1rFaUEOpQrVNxon
	0kOrEHgKFSqi7/eLkijTUOd6zSn8JvHiLopNpA6BtmZ0iuIlQYWAxlMkQoP1IxNZaYE1G3Idqw=
X-Google-Smtp-Source: AGHT+IHw9sGrmw3gIagphERDqgFYOOfKGYJBT/zaK0hILzkn0QI5qiwyyeZwL/Ik3dMeZqMZWF0mQw==
X-Received: by 2002:a17:903:38c8:b0:270:4964:ad7c with SMTP id d9443c01a7336-2948b95c6e4mr49579925ad.2.1761351909745;
        Fri, 24 Oct 2025 17:25:09 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:33 +1000
Subject: [PATCH v4 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-2-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QLglMo5Tzt3fMQq9JyCYlBLgJC3+XwEd/tCVV3EfeJY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4q+J7ufcBmuzj98x6LMhmZc/P4XtedWXA2xiB7v
 u3yNvb6joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSrbWP4wzWnQJ3/LdfVrP3vRf/NUVHi6vxwNqziYOEpzwzFzKSpfxj+hz/xWWa
 aG1zR/LLciSfa2dRHrmafmfw3ueVLOi3ckz6yAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 000000000000..2eec317bc4b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+$defs:
+  sensor:
+    type: object
+
+    properties:
+      apple,key-id:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: The SMC FourCC key of the desired sensor.
+          Must match the node's suffix.
+
+      label:
+        description: Human-readable name for the sensor
+
+    required:
+      - apple,key-id
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^fan-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+    properties:
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+
+  "^power-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 0410e712c900..34ce048619f5 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -49,6 +49,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -89,5 +92,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 745d85b66365..10f4c0034b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2418,6 +2418,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0

