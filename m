Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDCF3939A4
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928792; cv=none; b=hbnpCZh1ootqYbs/BIkh/wLa8Nwz1XT+8VdnlhX0O2o9U1i9mPMDlxrmP53QilH9H5hWyPLNCzXyMb34gced5mCZmAgU0d/Q5PBf+oQ7oyvEYQKp6e4sxoxD8V/sk60fkACxX/NbuyewXY7WcASaBPNIN0/g6t7M/F1Np6OHTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928792; c=relaxed/simple;
	bh=aBdmcCrvRpLElUzuYLREjjeHQy7cLHxZPdBypWnd1vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=riW8Zbt2SYPQEd/96BLzizmt1NS9xjZpc+ftZHxVvPcwIkNYy7LxhnYJi5zhG6czyhsZhbfSPQclRelv6RmYFAMBq0w5TOoUoAla+1GofIOzmG1DrExdw+vLrdkwkD+L+0drVl4gIJ02bZdBGkU9sXNd0IxHQK+/eir1MCtUdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo3dwKpe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo3dwKpe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso32434655ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928788; x=1784533588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0+La67QneHhY8Z4TRc0JjcxjWm5o09HxeLxb6S6j6Q=;
        b=Lo3dwKpeqCpQcH++3UbEPVAVvv5rJIHImSqzJ6NO/3fipjs0SNpuIvq8S97QMe2lIw
         QjTe7TnBeYaUppzLCWLgfuuCi9cYt+j9vJVfjUrAtRmxTq41JKTMounC9RaGA9ndULqT
         VSQErkYJKiSaIEaM6YojQxSrQMUvbv7wgmwoHR5H6vySZzQQ1uqoMnDqnTvoRxA5KpuE
         Uzy5cZ2fyAEf5IEa2a86bR9elzSlBlMJerAAut50O/T2tHCISph7lru8BovCq7OC7ktC
         Pr3M+VczC/So32E316dvHbWN4kQwVCf/jVkSxn4mh8YIGAQ4/VVIojiC2A8RsWeAFL4a
         +dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928788; x=1784533588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0+La67QneHhY8Z4TRc0JjcxjWm5o09HxeLxb6S6j6Q=;
        b=q1Mqnvp4Dgw8tkMlzNxHEZQv/gmTAhhBmUbtrwMPMUMIIi+9CDtWKSWiX4gL2perkQ
         w8w1u6GNM8eRGKoC8EO0D7Uz+WC4hnWOXqNb2rwomvYxNQtdgnLpUfIys9hPdJ7ae3of
         grCbvT3hhH5X09bFOUDnHxa7q8nW3fxmt1FnQH6+wcTO35SfyVzcMZnHqxD5nKULXfJk
         qLbt+B0ldAlAZzc8D6E6jEm2Ov2P/C7XvfP/KvNpMyPQNysH+FgRd+hmcWCJxkDGW/dP
         xRn20wYWmnWAz/RAGlpRwOz6cudZyQsD/vnL0f/oTVnF6ey9CSHUkG4LrJdmSDFIGxKn
         XMyA==
X-Forwarded-Encrypted: i=1; AHgh+RoMlCG4XBJohjfHwnO8Q7ulnPQKuDQwnoEtTYgxFiarMKJ6hwlqkm6k83H6beh1fiRpk04gTz2HDeSLqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73ULnr0hwjVA6d6d+lxN/NyJjXdi5Xtgx1omoCfevj0DqiL4Z
	k8xMU9bt064wz5RnDaXD/pqRS1C0SV/R1HqRmm3C7cj7x1KATTPy7hQD
X-Gm-Gg: AfdE7cmL1UQjGjNRRpANcopP7rswKegd3tx/Xt5cfninIaK+9P8wwSX8OohiA/eQeRX
	C02VVImhrlKkmVNjcvXaohF6CG2bW8a6DXz2Kuug6Dp4yiMF93NqR00j6IYHrjaldCWNcMK+zWl
	NxmmO9daMNoalmAj3SIQylgeOyXXQ/XSODVfc1ceeCW609jBhVS6ClKJgDvlGu14z7l6Qs0lg/E
	Z/rj7m3bmxviYxItV926TXU45WUT/tuA8p6+xIZ/I8oreEAtHKwV0Ej6031bOwtaplmRGIs9uwv
	2hPu4W1H8jDrrVv5EJn4T7AugkSMwUfwfF9gw8yFKPO8MLQ1ZfB3NL5I37QpVqOJzaezRKveSL+
	x/EBZdx2DWjdWTaP50FGsVCPEBJP/D1N1nanAsnMm0y0tlIAsQTPj/JdsuOqtKWZc2GQfimib5k
	kQOIlNmMZbC7Fb5eZi0ROfTdEnKr+E6geg
X-Received: by 2002:a17:903:2410:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2ce9ee163e3mr75760275ad.31.1783928788524;
        Mon, 13 Jul 2026 00:46:28 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:28 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Mon, 13 Jul 2026 15:45:57 +0800
Message-Id: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
family and the compatible GXCAS GXHT30, with the ALERT interrupt,
nRESET GPIO and VDD supply as optional properties.

The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
and differ only in accuracy and packaging, while the STS30, STS31,
STS32 and STS35 are temperature-only parts. Within each group the
parts share the same software interface, so model them with a
fallback to the base part of their group: "sensirion,sht30" for the
SHT parts and "sensirion,sts30" for the STS parts.

The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
as fallback as well.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..dee0252941c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SHT3x and GXCAS GXHT30 humidity and temperature sensors
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - sensirion,sht30
+          - sensirion,sts30
+      - items:
+          - enum:
+              - gxcas,gxht30
+              - sensirion,sht31
+              - sensirion,sht35
+              - sensirion,sht85
+          - const: sensirion,sht30
+      - items:
+          - enum:
+              - sensirion,sts31
+              - sensirion,sts32
+              - sensirion,sts35
+          - const: sensirion,sts30
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the VDD pin.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the nRESET pin. Active low.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt connected to the ALERT pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        humidity-sensor@44 {
+            compatible = "gxcas,gxht30", "sensirion,sht30";
+            reg = <0x44>;
+            vdd-supply = <&vcc_3v3_reg>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

