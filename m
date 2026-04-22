Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0747635F60F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859587; cv=none; b=l/K9foX7PH259kxahf/RJXIG9VZEg8Rksv1Tz33DiXHSKJ7LgAK5i1GDdHxIO+DFoIGviu4he3+jt220WrI29EuuV0UE1UWiv20wWRh/JAq0jazoDe+5sz6a1uPp4vjAAoEBv52aV9tB4vC36tWbWSadtKQfaJT+4iDSGuxHXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859587; c=relaxed/simple;
	bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2sgFxwfupvlKyKA5fYWQm8OOkIyJfqb2CSftouK1PipSjDH6fQr6HvAMyNDLK8XiBmcH9ueBrM9+UmePEls4Vv6vJNzL8nUgocoSTXJSs6h8LO4EkABNmbkrc0Yyvw11TuKtSdJrmB7HBdqMUFykcMJnjgeqhX70YN60Y49A/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Fjk2OJOk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Fjk2OJOk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824c9da9928so2626699b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859583; x=1777464383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=Fjk2OJOkngr82YUWzoDl6Kd03zgRcCUpGCcHwsEJ+VDfDP0+zXimq4aUtc5Bi1grEM
         NCDE0KmDWrLixApOnFQP7vNiHPFeQtVglOxaWoRodySFSnIRVNPyhWDK/3yauclvHFYv
         ziwqRknCyHmXr+WPFLHR3oiqAj6Shoq6uJbHdXcQBylQbTGbbKGiHclrLgKcRu4Ws2rg
         UmxQKlKITCIPgktIp8W/786U4PrZyqsAhuKQ/yb2TYkjO387GFFZgj6MQaLksknET8et
         mikpn9v52+eURDeduWSrn1GTLUPqFdY8ZWW56vwoiM4VBF2ySTtxiLrIfoi2zjvrVgUn
         uJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859583; x=1777464383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=Mwqi3JrWaRH3difVMXV45E1vVyfrLn5qpI8YHZR3OvYMere2lke9J/uqmySuQBwMSX
         4hOhbCdxrOgLqPC6bxxKHFzQfVLnFqGyoJwzEiQDlrrdgIlX0SGB2Dma4M/j9FfrW1xy
         cPT04Va1o5mVRUTAGtzliSGGnKB1d5yF+0TVuUhAe62tzF1axTG34E2SiBvFlEJQLEEj
         nw9e5SWlzAtA5otsL5mI0dhHen3qYKiGwtEfOFhXqHf5lPIbro0tp9ymIAROUKPOXNmD
         506FfQ3vSNHY7dX9fQuJKw73ACdbQ2JQ5gwctOqd+JWFi0nf26cB1tLzFunGPDHotS5O
         EHQA==
X-Gm-Message-State: AOJu0YzyTOK15NMGiDgZcNvzf2oMyRR+1oBSI0caf/QvQoPW5QfrLwsD
	4NaT8cnfz/qeElwV3vvHo8v5AtyGXhtsFPyonOLNSU99U1kBaigqs1mz8eBNRboEg9g=
X-Gm-Gg: AeBDiesQFDkRf0XY1S262lVo3O051qEXUWwMS3yaoaHDFaI2HYLFtRweJ2NIWYZ0D2s
	9e/VTgGLMT3kk+tAk2IYpRaFIs68BidW3VyFr5a33UoFsQzfd+AVmTX8XzGP8aNUJpAa4dhCJqW
	2WxRatG3jYYkPx6NL3xDwo53SQOlnYxUv9JQEF/Twn0g/bjAw1/lunyxoYN3pNRJGi3CcrBXSK8
	U2vAGcOxvJLF6lVbKnut8rA19JEy7DaApV8BgGgW+9kB/JfQeqeiWh/ZxMx1TSO2u5/akjNDXhn
	kywY3nRxq0cmeFjoyJie860egaRA9v4waw/vOdmSdW/cbuf/Uq8cEnWMMuPdxHFep/oNu00M4IA
	iFXjdRzGiNP1QkpjwfFjQaXsIQcf2S2HMPimY+nVRi6MkZX3UAKzeOnJOPYujF2gHTSpnbAbX9y
	jwf+IjbOAqljiOM8mObGfTCn7DubQSwSWIbAjeHDsBIwxSzQ0jXVeSe7Ysf+y0qBbdny1gxZed9
	qyf
X-Received: by 2002:a05:6a00:10c5:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f8c95c94cmr23378749b3a.25.1776859583175;
        Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:22 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:06:15 +0000
Subject: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
In-Reply-To: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=3150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
 b=eCXpJOmrWLqiPrJTwm7WXb64vLmd7+OKz7DeIasA+gQhQ608RaflSXpzWoGj6cZgUlwxmSB7+
 bW6GwKYrtpOCFd38S5TRj3zMcnG9t93tcXaawLCh4xfDP1xzQw2i5yG
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add device tree bindings for the Luxshare LX1308, a high-efficiency
12V 860W DC/DC power module with PMBus interface.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        |  8 ++++
 3 files changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
new file mode 100644
index 000000000000..a8d92447508d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Luxshare LX1308 Digital DC/DC Power Module
+
+maintainers:
+  - Brian Chiang <chiang.brian@inventec.com>
+
+description: |
+  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
+  digital DC/DC power module. The module operates from a 40V to 60V DC
+  primary bus and provides a 12V regulated output voltage. It can deliver
+  up to 860W continuous and 1300W in transient.
+
+properties:
+  compatible:
+    enum:
+      - luxshare,lx1308lch
+      - luxshare,lx1308nch
+      - luxshare,lx1308sch
+      - luxshare,lx1308ldh
+      - luxshare,lx1308ndh
+      - luxshare,lx1308sdh
+      - luxshare,lx1308
+
+  reg:
+    maxItems: 1
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      power-module@60 {
+        compatible = "luxshare,lx1308";
+        reg = <0x60>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..67fb1592daaa 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -967,6 +967,8 @@ patternProperties:
     description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
+  "^luxshare,.*":
+    description: Luxshare-ICT Co., Ltd.
   "^luxul,.*":
     description: Lagrand | AV
   "^lwn,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..58fa595cff6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15175,6 +15175,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
+LUXSHARE LX1308 PMBUS DRIVER
+M:	Brian Chiang <chiang.brian@inventec.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
+F:	Documentation/hwmon/lx1308.rst
+F:	drivers/hwmon/pmbus/lx1308.c
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0

