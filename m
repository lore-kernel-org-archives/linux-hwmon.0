Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882575;
	b=UYxNH9DTuCnn8IrlFP7m+yb/WDB0/cUyMhqWHoUyRvG5aapa8eY/BRBSekbV/GLupPTg
	 5qAgy3A5KtBasIOMzBFHIhwrdpNllOM82RD3oidKeOVsxNKowWZyGaE/Btestui8PEFN2
	 UJgZYnm8SVepcJwoSLpyDytYrzDYAOfWCJz7uE69qf1RBXG0HMwskrtGNSrtk8FUC7ydi
	 lJX04aHY4fMaG3w22Aq3rU+0nU2+UPbM7Lqr+S6YXJThq6e5j0sXGG4PM7UVitdMPcM1z
	 O2/XKgdtnvORqTpd1F3oTH8QR0MOzjU8LOYa0CJW1+aVNtz9Ox1kvrh5JS/G0C2QXmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
	b=nbY87nwrXL8CKMOQnPPgFRefC0vg7YxR/t4GfipEPLt8AOpgy0C778XIX8+FCivseTqT
	 1yLM42ATatGvEgBLFPzIpNyGM7AX9JSStksqqQ9Zz2DdzJ2K/L4L6L+MTZ0h9db4VMIDw
	 M4vX2Y/CRtkOMizIrrB/GkB7205nIQJ8XslGIlLFTzqRqcrrhg2tpWSVEd1FC9wFVqx6w
	 c5FwvPHiiqm1t9r9EiJ229xRM2xAIrJL18nwmn+1gmbEAIvEc4+F5oIUrQpxiisvZLw/Q
	 wP2Y1UA9GF4tlk/cHg7GLJhno/kY1lYSje6CLXUhgjtO+H4MjQ9/orWGTKd5i3GFy8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kv3MlWHi;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E37606A333
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E37606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kv3MlWHi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6656585e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882573; x=1794487373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=Kv3MlWHiv/Pi2yYZQ24WH57pIgU+4rYl6XNaf8k9PCshrsKUqoSpI43BBg38WQJG1r
         f7kKmjbHuB8cMAvCPqBki02n1awpU/sgIxa7ZFAPRr3zMZ63688UkIbAL5PNkNUeGFFs
         AQKxCpD5Wii/STujUsXpGtCe+EJHWP2b8PxT2DChfD/rAI8NcZGj/t9oY5424pQ8wZ9f
         uj3qm4Y5cemH8OdKURbiG9A0df8wSGdfHL7OJ8sXpFV7AqF4NNjq16swlalGL1h2a90H
         FSltisQ8J87JiVejGoILIMqvEi2klOg2+VOcT2rOgnmHwqvnkMpwHl2TOk5AWkQzwj7u
         hX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882573; x=1794487373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=l4lSpveGKSW5ZvZMxR8T7uhW+w1My/ztDYZH1u2KrUolGVEi7deRAYP11Lv1ExX/BY
         e12D5LNWH1YuWVzMlCFev3v9hpVAIOxeKWnSOT9h9asfyP+JOTlQaIBaQE0A+vVIH/Cv
         8P4dApsnT3SdsE0eZ1rmMP3yK8N68nMLEu4UERDkRrDJlPhVFCU6BQIt1dNzU0XSB24l
         AlcbOLtbNrGcoZdpz1+NRYybOdfhwAp5sXGDOFAsUueSMTG07EtinszWZYNq5EYVHyDh
         tehwPugGQ1Is8PHe1aBzclXbi93XoA9LlHr+gH/BsxYag1mQPxuaWTMcAXoGLIzlGXHN
         Ru6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcBSEDab0eT6e+vUQKHW2BBxQWdh5kz+RnZ/ZW0eoF6eHc2aWZthltr2gnHQZNg5sGNn/7GZzsV53JjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8W/2Izkc1I7P9xAU2TP0nVx0RA55+2SVjGaOasDyG9ANwcEo65
	zdhCBo/O3zYoPjeT4yNMLbVTvNlTlbDYXWDWBTRi9/6LhsdkZYnfL4xDZrlkYSY150aCxv8GCPK
	kYHTx
X-Gm-Gg: AYBFou3yFhHKJ6TN6HdQAVvLyhArYTKZeBW6bdUNq9+G4XxC600qlu2QflLeK7tMgYU
	PcB013LiFw+Q23rRdBbQGCyZSV8ITCr2CpMXjkJ2LWthFhbUg4TMA3rwyGQ3hjyQcoLj9PiMkgA
	VoAYgTAw938sZjEnfIC5ExZKcilwlhCFz07s50v7P5XAQpbk1Sd3NteVodPdbjeSlEAdfUh/VlU
	CNHoH6qvivMPxoWCYY3DBOajzF9zH8+loicorY4r2nt96gqFuCFmNospYLShCDvCG5rJ0KemuSs
	rYMi0C3sMNjfPZaglTfOX1FYgkroLzll3zFa2C9j/DJBxrICojrJVU87jx0/EdRM3slLmCIhUHw
	ZJvwjsd4R6n0MHkE7cj3qHu2SeIYHiYyOMR/7PQSU6g/zKky36AnOOLp2VRgZyGXN4TIPYr6nxz
	Zok/7cYYJNe3cFuzro6EnFuSBvAFn2uMDujHDNWmsHVH5VP4I1r3G28oSXO2t4omAGS3zisXX+l
	bHF33OwACj9BF4HgZH/42jBQydjYV76spnf3FjtVnxXu7AXm/5TUZFsbBNCFN+qLHkV9gdkahxG
	QeuEgBVG103ZAKklFTkH2XkbEarcQqhi6m2NjtwOsWZx
X-Received: by 2002:a05:600c:34d2:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b55e07e6d5mr43391015e9.16.1793882573382;
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 13:42:46 +0100
Subject: [PATCH v6 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-1-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3254;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rt+RNgD7W/568mSoPzZilfLHyJVHF2C60dxHxMFmmgI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnKPcrukw2okC9t8mpexyXqI/3FLXbirVbNr6b4
 t+eHdZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ygAKCRB33NvayMhJ0Z7ED/
 9idBXRdH9kFNiTN7/6IcrnwX4NtxIWgvEr/hlO7fCS2EAe44in6EfkeRVYFr7PH9lyHqZEfwfkvJZr
 qAdc8+9/cgYYfoEGBUpexgW1+LXFACC0IO9jMXbNvYboGo5rJMEFyKsUoKKcyUgy6Y0xEmsrw5Wbqj
 n0wE1NZCP2FlnjMXBIcfh9adX/YUn3D2kWcryvrqPKjOUaUfRs887lFwFHFdDbrjJ0G/JvORF9vCn7
 6IEF5yqcBY1rX3A7LVgAximQZWuGFfrO0IpbbIGuq19dK60XKzSuhlaiUgKWfYAMUBf4obICI6b5rL
 xwUbwEnCClpLkcEUCrN9iNZH/1eSNfuwrc3loSC+aX8dZZE8vJuRWCFSMNPfTXd2m+VF1ctEyXfVUE
 TTjR5M4OppC0THcNaPTJasNVWY2wfyFNoVO5q4hwk5GN8n0Z0ZVTc+o0tbdPWuciQwhZLqspMsObFw
 RWAjNwxdV3LZEBldswAcSinTZA4voubn7oaU6MD5LZJOFhbwPQB9aTnM0LpwHLzRqQBqW3n7LekvTk
 qAzJCjep5m+eIEvzIhztJw+lB6E3SBLKdjRdyAaOewD8F2QKuKHp6GcQzD36iiP0ZSWsDOFr5LfflI
 tGj8RmmQchAO+xj4N8tDxpHUrOoRZWBQXJTH/aW4kcJx0KUwXJ9TpcPL6Fjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
new file mode 100644
index 000000000000..77934a9baa81
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX34417 Four-Channel High Dynamic Range Power Accumulator
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
+    const: adi,max34417
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  - vdd-supply
+  - vio-supply
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
+            compatible = "adi,max34417";
+            reg = <0x10>;
+
+            vdd-supply = <&max34417_vdd>;
+            vio-supply = <&max34417_vio>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                label = "ch0";
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                label = "ch1";
+            };
+
+            channel@2 {
+                reg = <2>;
+            };
+        };
+    };

-- 
2.34.1

