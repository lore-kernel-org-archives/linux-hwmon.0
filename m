Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220833EAED
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899377; cv=none; b=CMjIWLJ0f3haC4+/0PLKM0WATQDZANBceF9GcgYTByPSRhL71UgkRKiNK9c/bl5OuIN/oEKDkAq0c4XOISpTZFnQs1fv4C/CGmHoDtT44mrjtKKvEO3W15uM3WbgAzi0rkUHbKYQOn0kRAitjHP7empetyk91YBm779BzTF//7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899377; c=relaxed/simple;
	bh=8jV3sPOUmzmiYZsew3DnulkuKI7cZR2rZqgemiByXB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HRwI6smxEhU7oME0Dwr+IifPr7VZ/zTWBYpb90JhiLevAVF6yeGq5NXesOhj7WspEE/gqQEfcYLzmiiY1q1DKfyC66PqiwOTmJr9+qt/Q4jnAuJ3t2TASUMZTZfU5gVa6G6tibXznVgdDi/lLpX06N8Fes8JwI5MCI9frbSi3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+OqIAvl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+OqIAvl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso26036565ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899376; x=1781504176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxx0jQCY+1f4Z1G9lBzodgHZuU86nYtRFXdJqnpJ7WU=;
        b=S+OqIAvlkxqo3+wrUULiJUW/PvYSXqaR8rWW9bPm1bEZGbUUgEAYknyWPIx0SwjxuS
         Plovmje5ux9xDR2z6fG9uk2YC3eZEmM0OeJpA0y0ztPUcZFI8A4L0biHBzhVWBtxHXMt
         KiyForHLg2u9SPXyGbJEJe6gZVz7Z35eA6JC7SxByOF1P8sih4pTAFF38g+MyxXVVQPi
         NSvu5z3rNCPk8CCpDHC0Gzmqebs6k4ivrSWKLe2Ncw1hn//sM2tuERbttU8F0BuQHq6k
         ZSYqWwx1c9Kfu157aviehLwR9ew7TCdDOPyNMfCL7w1/DTiWOvsJhL3rKXsHXD2YlVP4
         NFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899376; x=1781504176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lxx0jQCY+1f4Z1G9lBzodgHZuU86nYtRFXdJqnpJ7WU=;
        b=q3SnHTf3fgeFoDZJLqSLB1uSBeZ3oXe/aLtwYBZnU07jEmkkeBpn5ROC0sArv7FUBT
         p4oqwFltP43LI2yz0Xtm4P7u1sIIOnFeNTBWfVCLR2who4FyntAdXYGEqnZRBd4PLgTO
         qQiEu/oPfi09ir+ebGH6/iBJD5ippY5iFEqK9V3xyndoocKudSMRvKDxRj6a+za6kqBg
         MWkb8CKSpTUjv4AaRrcPgzMs3yHhIpMm9rShH+JESMVURW1arkUnmpbWS0V0kqgYLnVa
         kYkPDPKCgxiJdPZdUtP6WebRAO9Q3IfIM/bVxME2OrcKzhT/LKj4VzLuv8+BvPn1VI/R
         eM3Q==
X-Gm-Message-State: AOJu0YwcBXnYcFR3JgRjuXB4+8Thi5Uc5b91Kf6hrMldHTzYATfVFTPw
	7GmD4TDhnpK878LG09Xk4OEvMjzRphjOlIq08wG5rLjhgRRYP0PMwZt1
X-Gm-Gg: Acq92OGX2ve3QZY4P7AJDBV6SX8PQvUHOgh5LkWEnxbs7N7VZJsFHoeoOqXZadkgBVb
	lBSQm/gu3HvcaFVAZ8p5KsPx1U4MDjCca7M/QOURpOeiQz1kXZ50k6ioUUMjY4XP5xo/F02lTHF
	qrpgGouIzmo5Fb7enqcDNvFC7QEoDc3Il/WHpWSqKVmaiA/fHngOd5uC6Er2OIFNGIagH6g/1ni
	P3Jzv9sSizUGOf0x/SANh1mGTdNKeRQYYezCMcW0LGKCHi0uGU+BPNswH2uLa0PTUUJdk+jVPUT
	Zt1Efa20Ekpqx35shw+TFQ8PJAiWqYuqKRrIxAjlr3RVBvOVmixP3oTcrsytQ9XW4BYMiAFUB1t
	rgS8FXyNg1ipNF+SWNNvF5vN3Zj4tYKO80K5OE9/ztbbWkZE5JnqdmyakaeEfWVQdod3zvucd5O
	/jedFnTPcRgAeoJWsSUdCMZm4wXX76TwBWf6aCpPrAO7QLo+aNiZpmMbtKAW0tnKYaIFk=
X-Received: by 2002:a17:902:e851:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c1e80edfeamr146689005ad.33.1780899375677;
        Sun, 07 Jun 2026 23:16:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9004:8bfa:6dac:310c:dd97:e630])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm173856925ad.82.2026.06.07.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:16:15 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Date: Mon,  8 Jun 2026 11:45:43 +0530
Message-Id: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
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

