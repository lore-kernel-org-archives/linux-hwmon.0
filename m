Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3BB3370E4
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655880; cv=none; b=e7roXfAYVj4Y0luIIcyZFNlQ+B5VF5b/vUcD9vqU/cB01IIc/fLmAftZ5lF+1eC8Euaq2YoJmOmLpUuyOrYIpt8jJB5mbggtf663CGX/iju0g0iAugAH2enEddV/iMgnGAKhmBxe2wgo/ECcRguGn9nkdArV63jCmrqBtRJmrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655880; c=relaxed/simple;
	bh=p4FNiRW7IH11He7Tc+nMe5zvSfjEJPLmgVrsIw3u5mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MD+8eY0IDBTqJtEZT0RylmwSJVyEL+KsC7Sl/OVTq3BP7nTAbnevyAfPjwqv1MtTFildCQR09eGNRWh4g8rF6AJwU11cQ3HNxla0Q+ieX7Pp4x4vOeNfStCWMFHlHD2QJtietYAN8O7cMl4wV8mkHYnvNB7F2MyfoDZYFXg+kUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBaaNKfo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBaaNKfo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so6855224f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655877; x=1780260677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0qt0dN/pnIWpLYC8cK09N9h63M8YNaBsZ6T23s5myc=;
        b=OBaaNKfovBvFN+rAdXdb4i66XzPeeJWKRY8urwzaQWoMh7vANZBI8dlLhKHdrL5UdZ
         9Fns9PjIffro/7OtsVyzd22JPEfb+a/nq1J+wynwG3F61sFNZLC5swD/Yhl3+AQNe8zk
         LWAoi1/ssVUfI2S5jaI0gh0w3+9YAG+NB8C/FO0DY0ASigy77cchDGT1l5hLWHFMRzY0
         LUn3GanFM/LjiBndZF3vl/7QGCs4vDWsY26KDiwmHAoTonAW1oiUN20wW01mSp0W9vdc
         qKYMR0dlcUYsUIPu77wpyy1oktK2QhV8XECR7o06Y0tdzvhAlu6KSJBC08d9mqhIjkWZ
         sxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655877; x=1780260677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0qt0dN/pnIWpLYC8cK09N9h63M8YNaBsZ6T23s5myc=;
        b=I5gMVMZ1hHvJPXU+me0c7sgQ1XjGKwJr7CtoklkNu0jp44IJwayueViYqnEHHu6ku/
         6dSFQ9KYXY54Tv/yoA2DU5VIyv7HR/1ALDgfXSjsNO11A7+o9sDntGCBXC/+MqrUzmue
         wXe4Y17be1jkamM2kDDGBokkCJ/7jvgfv2iOkgROKrtbGNf1NMm2Tx2dOiah5kDBS1vC
         bZ71DTLqfds0v3NV1kJF6/n89mjx3Kch9/A/l+1ExUJHlMYoaU8ADCQxGMnFDmpOi3mU
         uWemIj2xHQKJrlAwNHtR4Z7pf3NlcIaU2s5+r0pj8fhQANYrBMOFcu9W1fIRCHOSoVKt
         dmpA==
X-Forwarded-Encrypted: i=1; AFNElJ9SIHhZSgMImdYasUbKgpqoAb06+EB9pXFMviZxrjVr7D2U2cdk8LMoK0o+g1uPphytfYq1YmiQJvxI6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvxp44LQSTU8Oi6fH4dMB5h38X6MevkKl+yje7VYDB3tpcuYy5
	/ZoU11Fa6hmvZs/Kpx9iyyq29gmIGuqv3Zm0ZVZ7pSmo5KlSR9SOvvhD
X-Gm-Gg: Acq92OGp3tmMYy34BPS1LqxlXqhzSrflQsQHVhln7Nan7HmXL9RcDHN1TemiDCwlT86
	zE3gV4DS/zO8+eZ9dBRhSiK00s60S57ALnc7wqK7d5wzObF3HrIgfU8ui31nWfe+mKHAAVJbOF0
	TN1kQRsXrW1AiQBrf0p9AZT2K+YBH36G0dPds6TRBCESXQW+2ToGbnI28DHkqP2U5Li742vC6iQ
	mAoyOZEGHsATdkr2nPkBaD57Y/Bo8k4ZAeRNn73524IUhrK/09V41LCFHytMcYQ660+4EelbP8c
	XwLDM5bD7c9SJdITQ5ODiMLtgl5YMFxu6FBv97NGgF0jdfyZDK5Kg3iccImkB0kMwCS2se+ZOFf
	xqvDfi2+W23/4GM83qq7y8+rSTqXnQS4OGJSjhk2GU514zIzgG7lt4W20d8mcqY0NQwWTwvNeBt
	pCop4+JbkSdg5Fml0=
X-Received: by 2002:a05:6000:4609:b0:45e:a0ab:8bc8 with SMTP id ffacd0b85a97d-45eb368915emr16870318f8f.3.1779655876913;
        Sun, 24 May 2026 13:51:16 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d6ebf0sm22738588f8f.34.2026.05.24.13.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:51:16 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/4] dt-bindings: iio: flow: add Sensirion SLF3x liquid flow sensor
Date: Sun, 24 May 2026 22:49:37 +0200
Message-ID: <20260524205112.26638-3-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524205112.26638-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wadim Mueller <wadim.mueller@cmblu.de>

Add a DT binding for the Sensirion SLF3x family of I2C liquid-flow
sensors.  A single 'sensirion,slf3s' compatible is exposed because
the sub-types share the same register map and are detected at
runtime via the product-information register.

Signed-off-by: Wadim Mueller <wadim.mueller@cmblu.de>
---
 .../bindings/iio/flow/sensirion,slf3s.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
new file mode 100644
index 000000000..5ef62435f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/flow/sensirion,slf3s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SLF3x liquid flow sensor
+
+maintainers:
+  - Wadim Mueller <wadim.mueller@cmblu.de>
+
+description: |
+  Family of digital liquid-flow sensors from Sensirion with I2C interface.
+  The same register map is shared by all family members; sub-types differ
+  only in the flow scale factor exposed by the device and are detected at
+  probe time via the product-information register.
+
+  Supported sub-types:
+    - SLF3S-0600F (calibrated range ±2 ml/min)
+    - SLF3S-4000B (calibrated range ±80 ml/min)
+
+properties:
+  compatible:
+    enum:
+      - sensirion,slf3s
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
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
+      flow-sensor@8 {
+        compatible = "sensirion,slf3s";
+        reg = <0x08>;
+        vdd-supply = <&reg_3v3>;
+      };
+    };
-- 
2.52.0

