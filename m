Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D903D6CA7
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 21:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447029; cv=none; b=kyYBxUkfZ4x662sM6+fMgj99AlkTBevGbg82dKmy6tpRCIMj4imt8XKfmILzbwqoJUXWcW7wIA4+sv071jyrL0QLSB152xpglzosxn5ceFMAMGbHxCaR+A2+BJ++2ZwnmKu/VnBnz+9lpyrvSsL4QQQFMv58N0iiULEebIcNeuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447029; c=relaxed/simple;
	bh=kPSU8K3hloJk0CA8KkjVBFkdAjOTtZpzNvFwM4OXI18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARPsnkxNIyYsbmNLKmclqZyKkQjoklX9LP7Z8LaZ+Bnm+dpcIcniu3OfjfjXJJWbbX+tB3zo+JpFvi7k6RsuGBo+22kN1OF1TeNrkm46Ee11MtCA8VuBBTVDZWvyrNuztEmJPySUGDQGUJKwynuXvk9+hit01osppQiksHmdpYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtVPEDWU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtVPEDWU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so3529465ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447028; x=1786051828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJRlG/nhDfRO8KA3xYrGnvb0TOuHPcGeB7eh7wI6Y04=;
        b=mtVPEDWUCuTdz+e3LgqNxygHIqzI93ShgLoTjYwLyfwwCKdknXR4bmJWl4IpcWC4FT
         Pn9OsH2/eoz6XgEdcezCjbxlpOppi2z1mZzd8XEyHmgbEaBfFJLqDIELNdjsoKljIFlm
         FbZwBTTLpyB2KOnB9ejpSmM47gwU4XdbJLJHYWdpn0QGks8WxnBcStYCDVnb7NfEu4eF
         JCPEsJljds0rD29i4T9aWCLbG+wc3tbD4I+WcxUCaQizKWpeqfFyPTzRtjb+ejy9SFqt
         GUD2i5iB7Nzg8oODFw8gunT9xpsuJrm0CXUFGsNxXDYoHBmSuVtGW6BZedIZa5dpAtUd
         m1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447028; x=1786051828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJRlG/nhDfRO8KA3xYrGnvb0TOuHPcGeB7eh7wI6Y04=;
        b=ao1+ooeljCtsrCf4nCxME4Nu8nz0I5m0Dxbb20gC22181f0SnoE6OFThPIgwtZ9tK9
         mgDMBEWsRrIqfYOKqk9//0gch3wqlUJ9mpeuuVdpwJl6h7od6FBG4j+C92E9wCoFLh2S
         WNRYL9oXe4xLT5fBTlz6OSybOqgj/s3qHMrlwfv8cTUAYbby+acDNWHFmHuikCi7y4ll
         IJkaQ/atEGxRGCOX1dtNAfYOs7NpOyxifpCxcV5yddNhi7rVVIS2hvaoU5UB9JAczUPs
         zXv8vBNmXfD40KBw5kq4QjwmTQlv/Uz5L/oybBnl8a+RfeV4hcLtdcUdD1R7S2xMRnAk
         +jVA==
X-Gm-Message-State: AOJu0YzbMah242QxpGCSOU1bbgO15ygsijzGBH6/v2Y+KieznBC7yrkw
	CK31r+y91KMcoRj8x7IP1ftdQzNS58fyRSNq6mDS1/VbQkEX4MXUntr13U+V2KPM
X-Gm-Gg: AR+sD12hqcLRNicoqPDIa7hNM3qh12OBmhuAJitKJqavea0AE/Lq7aLcbXjGFdYL5gc
	u3fXKn9lKWC1JUoclPVvIhKAbua4qFIYIGjqg0vyBrYpGh86/G4Wx7Z89KwmX7BTxxGPQ4EilJT
	8TyzQ6tpI+24KHACOX1qNH2aEPEqacaVPMMpS/zm/rGs2s/ZsnDAmzrz7ZbIImhYH6mbqnXdrKF
	fJ8BmfZ+WSBVf15CIqfdjEQRNeBTtfow+31XAq35lt2npd2lRQRldJFKqxrBC76UfsFAyc6b3zI
	/hiTobD6cIE7QvIz/NaC4GgX1M3yihsfzitGMTBVbVanswDfh1USLe4a32nA5tiJilcMIMntHDZ
	VkmauXzJM0LBt/D3u0YJTzU3Avh9dH5Hj513vZGDFqlvuAVbkn3hA2WNZjAJuYOp8D9V7gdfs5r
	9Df2AiG6xo/NYiyp8IllWa3Ej6idT5tGW6szNrlqPjSOGkN3Si0g6z4NqeGgA/XIYi381PZUn7n
	3FZ
X-Received: by 2002:a17:902:ec81:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2d035ce64f1mr38650655ad.32.1785447027541;
        Thu, 30 Jul 2026 14:30:27 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:19 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:29:56 -0300
Subject: [hwmon-next PATCH v5 1/4] dt-bindings: hwmon: add adi,adt7470
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-adt7470_thermalzone-v5-1-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
In-Reply-To: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

The Analog Devices ADT7470 is a multichannel temperature sensor and
PWM fan controller. It supports monitoring up to 10 external
temperature sensors and controlling up to 4 fans.

Add the device tree binding documentation for it. This includes
support for the thermal framework by defining the "#thermal-sensor-cells"
property, and models the fan control lines as PWM channels by
defining the "#pwm-cells" property.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..f653a06f241a
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
+allOf:
+  - if:
+      required:
+        - "#thermal-sensor-cells"
+    then:
+      $ref: /schemas/thermal/thermal-sensor.yaml#
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

