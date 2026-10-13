Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7D35C6AC
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900442; cv=none; b=YiDsce+2+gsD+GsybkldfIYBKFF/35tQImLSbJUt0IJvM9Shoz6Wl7qKyyH3ckHLzRn+MI5nWdAYWmumuDUoxiXPIDYAj6ihQkPhE9fP2JRoupW82tlKxTCu4c/r7TfJ9d/ybeRh8plhCA0oRg9MMT7ayfr6bFJHIbYu7LjzNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900442; c=relaxed/simple;
	bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCruFuKT9Imi+j7GVoohL9oDXwJ82m1Yc4beplvvoXXsAAzfPOC5WkSj/GSEcKS19BjQZxEV+zUnTaIdaQdtZgkTNoYOAWTl+j53pD39m9Xe0BWhrRiY2dBPmVbBLcXPtVZTM41e6NKgxFgHfbSXz5FZ2QVCRGtHVmWtn0vF2L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCo3fHVt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCo3fHVt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso21472145e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791900437; x=1792505237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=iCo3fHVt+4J9OljvCtW68ljTNXvmbSz5O/RYTqWiL4ZO7F6WYpHlnkS5pwtrh/jZ6/
         rILmg5y5sc7kFxICBrH3OUdqjCoLMsx2ysTJiN9k4L/a4sysfjY7xxx36ZR+XexkPuOK
         nVYlypY6ocAM0sqQPQnM7T+AEr8qs6S432nyItBBEgl4oBPMfaVqgK3gSeAe2dq0Razn
         WUpAlap4/3btnqyR9iqVE87ENBT54jWgKWgefiWLkL28C6CwpOK0eVtDc2TZQ+Psek0p
         aqXaDDerlsp/RaWAEVPWSuLm6DXk1J2EwtGnaTPUxrNYpEzE6e4vmo558CqNCvz2ntBf
         wRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900437; x=1792505237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=mO7UEzUu9CUy1zx6tEkJ/Z+Gez8EI78Z0L7zehGDv7homHGiZwfMeI7rCdu4iaY9sq
         6PGdKlv+KMWBzNONqSihiAcesUTW0i8oQyCF53QhyyNkO6txrXT3E9MoVtyGUf/f9d7M
         HfpRsck7lnU0HoPTTluKqaorvv64F+AebLgUooXYIZoTJ2L9F7fsaX8XNke22YNUZdRS
         DSmUxuGbjGFEalzB7kLieNDxGNxhAaF47WdOMb5dW6eu+2GPYTMS5mSdBQkRSbQM4+3E
         w82+sDlnNLcNXNQGxMr6erHb+yVBgzhHgTvpYTF9UF2NqSM7SzJFxRj7MYTdWl0RaqG4
         uIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfWP9chURXynxESwLT3brgALwDteGVNm1sz237I9TEjJ248RUr0ZUx1XJXbZxYbWG9YkuKY2lVjSDTrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+fYYDBlH9QcwpseTQW06250hV+sp2/Oz8XidHvn45W6Rc5KVC
	LeTYOh2tGIFcUcbRUsE1SKm7Chu12Dqc9gsfYaP+Z1tNQZfqZljvwbrCXUQuf/Nxi+E=
X-Gm-Gg: AYBFou3Q+Ec+CpIwpuTwGTl/O1wjTpS795VnNIHBpWblHw3e6AWLTVHhTWRgDSJnOPu
	m8yXFsubqnnLqsWTcCTND5QfNe9RqUMY6jyj1d8LXlVnag9a8i7zIzSU7X2D8qQx20EfKLgVxD4
	OmQdv6I0ZAwsXSH+EpRAoEAXsP9Mv52bHnAmbihg80vVfV1+DoDyaZsrhnfDf/BjphttalEmfHZ
	BqzrOmEd9FPQOOq/T2pDPNByO1SKu3KChVPzH3YSX2AlVCMCL6EeXzdUYMJqwn4fbUdJDD5xOZ2
	2uI20HIRoDNCmNc9ZXhe1TaBDsA+zUUkdKfwlVWP7/s62zZoOuTBKFm+3uxZ/RB/Gb2bHzGrcML
	9gYg0RHzciB6L9LBqbDJVTM9gbsHyXRyv9ci1Ks+3gfnGn+jJoN8n0vM2o+36aUohQMYiNqONa9
	pl+7biLDxueXVMduNNMWa5GVpEzihxD9sh6uOGNzbSfo6jMgNj2d0g3I4oDacsV8ai19ZR55dEt
	6SzzlXRUVvTOgEHLpJX
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id 5b1f17b1804b1-4a18e4b2b25mr250431415e9.17.1791900436244;
        Tue, 13 Oct 2026 07:07:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm364625305e9.13.2026.10.13.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:07:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Oct 2026 16:07:11 +0200
Subject: [PATCH v3 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-topic-sm8x50-iio-max34417-adc-v3-1-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqzjsRBrbn6UXcvWoMXQ7jkhABq1GaFKGsVFGHcxwE
 C6fHvxyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCas47EQAKCRB33NvayMhJ0cgVEA
 CacZCaGIo5rsONTqqPcpd4Mk4Mz3qcdBYHfXe+4r84k3eunzhQT8geL/qFilWITwo4B7ehBAuI4uJU
 dt3bQmmqT0/XgNKRebn5AHPLPuaVCaSOYPw2yz8hihuY4zgpaC6Hxk5C9w9miXgY7mSYModXOqwHCU
 v1ZPvQpZjXEhuMbdHiEvaAOcNmpz3XQqPBc5NtPuRDOoNklQ4EY1SGJeoEpYzSkNuwYSrRNJgtayzy
 rW0ZioSI4wwZTR1Eb0VVeHHJ4bxzYVOF+yqt3is6fqto7bK+0OXDNY9wHb2IyJtzewFv4IbOzNDk1h
 jq7PoQ70SdHPGH1E6ydkHvBFxguUTYUi2OZ62iaim7wLPx7h+gIGFJdncUtONWUnXMrHvxBBk/3wkh
 HhReOQH+prG5sktSa51hvYc9PneUsug6kdsXqnuCWkOeKT0tSjwj7MnR5Qy9pmfce50PzoVcRTbcXm
 GhZVjDrqz7QlD+qKShUFR6h1BQSBBWVH8rEx4hPDNcFuVSYfB443fscc/IxZ4SV6nDB8IxIqWYa7CA
 QlOHo6LUC1tqaUtb7s5WXkZ+md7+J8eCF6+Usm/JdufLOk4nhYQChp3PXqGdtJLygVwPXlp76zvRtL
 ATuROGH9Q5GbeNfLvtrnp0sezrkeKkt78YBBSX0ONVqufX/Daa9zAl2xD0RA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/iio/adc/maxim,max34417.yaml           | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
new file mode 100644
index 000000000000..058af61cc04e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/maxim,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX34417 Four-Channel High Dynamic Range Power Accumulator
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The MAX34417 is a specialized current and voltage monitor used to determine
+  power consumption of portable systems. The device has a very wide dynamic
+  range (20,000:1) that allows for the accurate measurement of power in such
+  systems. The device is configured and monitored with a standard I2C/SMBus
+  serial interface. The unidirectional current sensor offers precision
+  high-side operation with a low full-scale sense voltage.
+
+  Specifications about the device can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
+
+properties:
+  compatible:
+    const: maxim,max34417
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vio-supply: true
+
+patternProperties:
+  "^channel@[0-3]$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the sensor.
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 3
+
+      label: true
+
+      shunt-resistor-micro-ohms:
+        description:
+          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
+        minimum: 1000
+        maximum: 100000
+        default: 1000
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+              compatible = "maxim,max34417";
+              reg = <0x10>;
+
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              channel@0 {
+                  reg = <0>;
+                  label = "ch0";
+                  shunt-resistor-micro-ohms = <5000>;
+              };
+
+              channel@1 {
+                  reg = <1>;
+                  label = "ch1";
+             };
+
+              channel@2 {
+                  reg = <2>;
+             };
+        };
+    };

-- 
2.34.1

