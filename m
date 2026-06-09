Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A338AC8E
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989788; cv=none; b=e/u5gpreDnDwtPfPNPbx91a8WepYQ7K4C6vpvLt3o0hT5EK4JhRWW2vxU1bMCmqdinIw2xqVZugfNS6g1F6hGWPcm7tFTFeJ4/QuIqplQ91qTnQ7cmAzeSc/9lusuDZGcvND4oCoJYbjhH52j3XRlPaNbTruI+gA29CEpJUUtPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989788; c=relaxed/simple;
	bh=2DoSYMa6yi1JbCx0eUEHAHsnOXZ5QxBRICJPFbzMzzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CWZ3FTIikwXzAVt5AY7hXRh7qEKET24GBIV1qBQZ1PekpXOQhtAJCrFQj5vVseOmNnXLrIalwDhE9ioUO8GDOj4IskcyE9PMS4YAQ0IwGtocuHIBYRASDqFsveCYkQ96lEJBPlNRu+rwJbx1efqZhODGD/6bgt1bUtPmVKxaWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVdLZA8V; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVdLZA8V"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8419ab3a297so2230255b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780989786; x=1781594586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPjGRYuGB5NaKB93UNphbkrOTPUazzJA5U+tGaunaXY=;
        b=VVdLZA8VjaXfm5LYAqpmQwixMCFiju6d/8CguoRebA5aVkjwrT43F3Tr0RqrhM4N9A
         FXrVPAHNT9xyS5xJUuJUOVzMtFAKY2vfcC31bNm3WTkTZKQNz3cflB1uQ/Kcs8fIlA6c
         XfUHnpmVKFewoYqXawmWJtSlBfBQBiSSe/UGSM161GcN+ShOSifidg+9Mmz7pUkkSIjW
         SuJeetqY9k1RJAfSHQAv4S51TkhxvRUpw/GOCO17KW3znTBaOYSqLZt5gg+FlNuB444H
         0yfGWsn3q01CfULTIh6AKBjsNPLv4zP3cptbZWIgZj5kPuoJIWynNOVgMdrk/hf0DGYi
         rc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989786; x=1781594586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPjGRYuGB5NaKB93UNphbkrOTPUazzJA5U+tGaunaXY=;
        b=RpbRXuaAFy/pL2qQFGI62MBfmznLHHfuhAWAUAga8s3NPjLTVPCzAQIJow3gSTncUj
         pJbJIBNyoK+nNPaaiQMnt8+A7mZ9/jsz/+qAiUYkH+1rTFLgDumGI+60r7kYNJV6Imxv
         tiHltHgArzsuu/aeOf/5elA1bO2gB8mLlbZ+dDOj3GkNN6TgBDSub4xAq0WfW6SojVb0
         CmC1UolDUiafGC5wpC+7+sXqxOPzL9h4WxJQcl7+NK23KjCS9/hywfCidGMzWx+STdPY
         ALxIkw9pzmr5lcZRebZaTR+u62S+sThmYXykQ9A0uAOCQKvlL9Jd+WMfYvFJefPCtnvk
         nOlg==
X-Gm-Message-State: AOJu0Yzydrmy4EjD6mWHPPOyiIoHSF1TCWYmPFbI8xIAlKJ21RaD+v5v
	3zFcFW7Dc8Edk58izm5Z5xr7bLiG/Q9AByZWxXCqXWK41LUxkmZMysiS
X-Gm-Gg: Acq92OHhOpAPfbLmW3xAGUCAWPfBoWr1sU3DklkW4G381t4PBsQri3/ZHztMW2870od
	uxpJaG6ETc5o/T46dmTwNdS0jLne++1SAW9yAtzJLa5AKSTEqP43tEVh9O7NoULnvjHr8Aun2UU
	NCjFNuN23Fs1h5fSFTibT9HSPACySRNIpz2QBsioUuo+YvvAqpfCfjwxy/QYW+yZbGgrm5updiG
	akLIp1Oenvm+nEDeRxQ5mnNN9fdpf7pwqMbetLoRIu8bN+bNvaB06buoFpdVXbeg6CHXAL0XGa2
	NjhUDjsWyA8WaZhTUAlIyJ84mqszdoarUAPVSPyaXkWLlv83pwScfDLT05kU/U2uYq6cCxhpPiL
	09E5Tr97NhK9/N9dj0sZfV1+CAHVWubjg9/K37nuGqXskYWAr8cbCzulvcEm+qQJrT5rLVYpXVQ
	Hlm96kiVQT+k/+Vc77Trs6wvMm9BjmWm8P9xAlEmGv4mwXL23QtTaEOYWN
X-Received: by 2002:a05:6a00:982:b0:842:3be7:4d57 with SMTP id d2e1a72fcca58-842b0e7b8d8mr18749350b3a.18.1780989786207;
        Tue, 09 Jun 2026 00:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c919:66b5:f0e5:3e9c:92e5:3878])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221671sm21702448b3a.4.2026.06.09.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:23:05 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Date: Tue,  9 Jun 2026 12:52:29 +0530
Message-Id: <20260609072231.15486-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP730 eFuse.
Rename node to efuse to accurately reflect its hardware function.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
index 72bc3a5e7139..4a949c53f7ae 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -5,23 +5,31 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Infineon XDP720 Digital eFuse Controller
+title: Infineon XDP720 / XDP730 Digital eFuse Controllers
 
 maintainers:
   - Ashish Yadav <ashish.yadav@infineon.com>
 
 description: |
-  The XDP720 is an eFuse with integrated current sensor and digital
-  controller. It provides accurate system telemetry (V, I, P, T) and
-  reports analog current at the IMON pin for post-processing.
+  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
+  with an integrated current sensor.  They provide accurate system
+  telemetry (V, I, P, T) and report analog current at the IMON pin for
+  post-processing.
 
-  Datasheet:
-     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+  Both parts share the same PMBus register map and direct-format
+  coefficients; they differ in the GIMON gain step exposed via the
+  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
+  (XDP720: pin 9, XDP730: pin 20).
+
+  Datasheets:
+    - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+    - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
 
 properties:
   compatible:
     enum:
       - infineon,xdp720
+      - infineon,xdp730
 
   reg:
     maxItems: 1
@@ -33,9 +41,9 @@ properties:
 
   vdd-vin-supply:
     description:
-      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
-      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
-      RC filter.
+      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
+      controller power supply.  Typically connected to the input bus
+      (VIN) through a 100 ohm / 100 nF RC filter.
 
 required:
   - compatible
@@ -50,7 +58,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        hwmon@11 {
+        efuse@11 {
             compatible = "infineon,xdp720";
             reg = <0x11>;
             vdd-vin-supply = <&vdd_vin>;
-- 
2.39.5

