Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA535028D
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935743; cv=none; b=btA0ucLQK1lvosPXYm4ZVsqQ3SuXvK08UG1aUs3mMl4LF+q+RZWEtFaiOrTX/s6ABGhmjllOaKcdV04MoQGRuYYtzjERBfuwGBgN82Y9iormIgTEIsgkblEMo4Llfa5yOcu9gDZiwcgRj/FHpXFBIoTuBPfWmN8/F5gWUf8rgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935743; c=relaxed/simple;
	bh=fbUKh1todKkP1FT2/cHCaDm4OfpjsPhk1f8mXru53ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBKxtzd2RhCht+mmAj+oM71/VA0Z+npMGlV7moQdVnyfRynL6GaOHAjbl/Oh1iu0QleqL326M3IkrT7kUtJzIRu3vB8l8oNJeanHBHyw6+77Z924jI+iOD5QpTcqJwI2LrhhD4TLZ3cM7gMHHKmxOZ40Ba2r1Is+F6+UaP3FkQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ2V7wXN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ2V7wXN"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb662575d3so582410a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935742; x=1786540542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+l3n4KRaWC56rAxkOg4FR4j0cY6wBbchP2+x6Oxm4pc=;
        b=DJ2V7wXNib2XxPegFARJUtXRPsjIc1bSBiBWVxASJk0fsjCX+uQeEq4Oxlh08jYFVo
         rUSJQmymp9tEQiYsTeCDAoEf9f3rvm4IzNxJpid24Pn7IhbOAwLw7AAofgJkxiBGeMxD
         jwPcny2rsUL+GtiLrtgCAYd55zQfL3/uz7dJYXL0MrKLK0+OsyCX9/anHAx16hj58Q8i
         kCAfqKGPKVXBGOENz6gHcA7ZWxfzMRDJgn0OSt+XSDFBU3tOwvfMxALim5HRuxb6mqSJ
         swVPqZEOPVih/9JNvU2zfqRkCMFh6ykn3FGw3icjKTyCwzPrd2Cvux7114GteMyNbT3J
         0jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935742; x=1786540542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+l3n4KRaWC56rAxkOg4FR4j0cY6wBbchP2+x6Oxm4pc=;
        b=YrpmY6+6KBFmEdt3CVw5LAvmz+FSAGPufbhZQNHFvmmdkLEEpOXDADcrHtt99JxZSg
         ZTNkMEg8P7hLouLyP9ZONMr7DI9CV9YPcpOqShAdnSZcq1Wo1Xy1UgwGaIFOkHYSWApb
         iWBvuVuSGTwPI4W1iKCrPOQSVhdPAZ/OCPBm5zGRVAqYXroETZ/7HVp6vgBX7MUEFHBg
         UEk6GuuSsrXOktjlKOhP330GTV/MXVmMkOgvkXsJCAv2EQB4LpAt3aP9Gj4qhU6C6FAq
         4jLAbor3TOiAYwbZHsTIROinA24lZf1kueBkAb28XNqwgjzFTDWv55hWLUIK1E59pZE9
         eEYA==
X-Gm-Message-State: AOJu0YynakXBxHFvo5U74H8FYMVIPN8+Jz3m6xmWASJHz26pedNqIuT+
	OajfyZFunqYltUQSb2aH6HM+sidC6NI9Q/ZA83+Fk9Owd2IWDOkA8tFK
X-Gm-Gg: AR+sD12OcfBvhJEtcyxn01+3n5gmKKhAWbPgT/V3Q6a264NDatqCTSrx76HNptj1fGf
	erupgI+QuGfJeu/Cl78apD0iziQ89K4ZZH+JXeYqOpGfQi6eN/Uz4VvBfZ8IYUSEdSMcuQQeI/T
	FbSDKivNdnpNkQ7ynj19SM9W+G9cLB04OHaH4uJefheAypXeRDz8lFh4OzCki1l2AsCWmJU+ADV
	WhumSgiZ/AvvzQ5RuQSKPTAHX8GHB2vblFRkF3ZIcj3b/BR0MEEW9TDDNu6OZEW6eEu2kfXYG8o
	IoGBDne7pr03aNay8wLtwAO8iHNCzi7/sKD855My6rMCnEKkyJ7juGOFyt4urJ5CZuvneOPBTLX
	osR+p6Zrf6pYOxXVM+FV50Z7eOZk/NsiR7Y9G5F/cNKlQm7NnjvFvtSDSy3T7tZvig9QFPjyBBY
	+4tnEKRMICGu2BmhKmSLDUlWsThId+Pz3ANKu3bwKqiNlAtEMUH72x2G9fP0DKdgEKZIX/M8fSV
	/2ug6kopSw=
X-Received: by 2002:a05:6a20:734c:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cb85e788b6mr7269693637.16.1785935741411;
        Wed, 05 Aug 2026 06:15:41 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:40 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:17 -0300
Subject: [hwmon-next PATCH v6 1/4] dt-bindings: hwmon: add adi,adt7470
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-1-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The Analog Devices ADT7470 is a multichannel temperature sensor and
PWM fan controller. It supports monitoring up to 10 external
temperature sensors and controlling up to 4 fans.

Add the device tree binding documentation for it. This includes
support for the thermal framework by defining the "#thermal-sensor-cells"
property, and models the fan control lines as PWM channels by
defining the "#pwm-cells" property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..a701542898ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADT7470 hwmon sensor
+
+maintainers:
+  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
+
+description:
+  Multi-channel temperature monitor and PWM fan controller.
+  It supports monitoring up to 10 external temperature sensors and
+  controlling up to 4 fans. The fan control lines are modeled
+  as standard PWM channels.
+
+properties:
+  compatible:
+    const: adi,adt7470
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      Valid index values are 0 to 9, corresponding to temp1 through temp10.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      required:
+        - "#thermal-sensor-cells"
+    then:
+      $ref: /schemas/thermal/thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@2f {
+            compatible = "adi,adt7470";
+            reg = <0x2f>;
+            #pwm-cells = <3>;
+            #thermal-sensor-cells = <1>;
+        };
+    };

-- 
2.55.0

