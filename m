Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59938D687
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Jun 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304998; cv=none; b=gdAuZr/bTRKpUvGm0ND9bM0QKxIlSsEyfytuIEwdzHnrCrqfBpxqW1N1FwtUkzMxa34VskPDcJrT+HIVXEqyk2e1Zz7gh1B8Au6a+CS+3VQ1wcmzmFRGRunZtt1ZfH3dlSnbPKtDJ8S3COVAtERLkUUSxIc3sT5qF+1SEunMXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304998; c=relaxed/simple;
	bh=Nwoj1JLk+rT+t8t/aofBWJfWEjNvTCbde0YbhbL+QTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G9R63zPPlEUytpLUA79CW8LEeLVLE2ZXOQF16JPBrz5LFtFTkKUkX6meciIL6E3Hsfl5y2muSB3CmR5p7Amg9IsBrvRs2veuZPURfUT9xIKMAYcdriiE/CqT9LKPKx2xZDORA5gbL4fyckV8KxAtAF3cT23xC9Abf3HbhnQsTCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQYc+j3W; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQYc+j3W"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so334450a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Jun 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780304997; x=1780909797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeGYUyOqwAJwv7mjGV4LKyQU8XpoQ7Rqg3p6TF3nIMM=;
        b=YQYc+j3WBxgfACMR0R0jXaan+Qef+LeSCZIiQ9povwEtFOr7VLb2K+I9luclhtEmMm
         emOk/xT8giGLpGxt1jbOqnw5RBknN4nCE5hCZoQLYWREZUmXN2/mPuUb+xfrmeNjCjqb
         O3EB/xxNiuzk5DnZy4iUayWDgycXTNUFo/HU3zrsIEq4F63dfyKHODjZLz/7G9MtABvN
         UdeSVeA7hEHydX5y6jzIx841WJDHyYOVW1I7k74b1F+rs0KM7LYV8YD50s2ylqzAerst
         ISFcOF9cqhSidoRTT5XwFFaqp+6Euj0mbhBdhEEkM4GkiYEmM/rj9h13+36ihQclzqfR
         JL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304997; x=1780909797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YeGYUyOqwAJwv7mjGV4LKyQU8XpoQ7Rqg3p6TF3nIMM=;
        b=hOKTo4CzPyx7dDrZjAHaOf3WH8GoZQQov8UPpiqsn/Zp1L7xXuZy1OT9BwJyRAKVvv
         TlN3a4NZsPHwb7T5wOhOv3Urb1/wqHKNXXat6oKqJ3rfhxOLKyqtJDhdW/dzV28h34k6
         aXbnwgCk5TM01j5ooJ6VYXyfCia2eUF1z4GXHDio6Id01bhYTDNKN9hV4azMoxh8Gk/S
         Y7/X0NKXetvny8jvPvkbR0P10hRsOvyM7ZnqViI684ecuHyW00fftJyJoKuIVnSESBHI
         moNY6nDjJDTBIWV91BE9JBV3BS636nty7S+ZDWpYtXvGsha2Uo2X3U9aLJk9vh8UQHWv
         U+VA==
X-Gm-Message-State: AOJu0YwV+xI73tDSIBkNTYh2mFdmjaT19vGRqrT5i3g/oD4Xrl5hfrQ4
	d1uOKTQ//C5Y9kk5Amo2PUKbfX9XbVIIA4LP8WJ2nAjgyCahSKqpOT5N
X-Gm-Gg: Acq92OHpgRoZbiraDxMBg7oSQjgul20FKYC+EXmmy0jZiKYMwrHouLLk5pvxU4ta2I9
	M4irYiDm1Yz0rfNDHbrdu6AgNlq0CDdDMzinxt/muDQm44fulNr/jv3gZqZu6lIomMJngXefs/+
	fFh6Ed/ple+ke0V2K5Pd00ACp9gyGQiUv4I2dRKaW1CG5D+SwNrBemeVlLqS1LB+8OmUX5mysD1
	qZPj3OFNbfiwus5AzQSxAUWOkO7YMMB1HuoZnPFQP9UHVLUqCvaZXFQ1EaoecHizjl0ZwAYrUEv
	ogSRyITR5V3XwBneQZADQC9GCNV0EgH0vKuzSUSYHfTWlnKu3M0FJP1Ra32rmEYnjAIbCBdnvKf
	bGuU9XLaOSctCq8q9TlYEi1kZKhJ0Or8die4cD2MeCk8Iqj110ffDLxyQ/kN+5B1as9pvDhICBu
	WRXYTwi6qUy2pq3ChHugWsDJkYYj9SbscPZNBALK9FaokG93jJmi/LFJR4
X-Received: by 2002:a05:6a21:4c08:b0:3a2:dc51:449 with SMTP id adf61e73a8af0-3b427c1ea5bmr10986910637.12.1780304996751;
        Mon, 01 Jun 2026 02:09:56 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:91f7:9b52:3422:d8b9:6baf:c53f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772df0fasm9105827a12.30.2026.06.01.02.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:09:56 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Date: Mon,  1 Jun 2026 14:39:24 +0530
Message-Id: <20260601090925.3781-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
References: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP730 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 41 ++++++++++++++-----
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
index 72bc3a5e7139..27ec00a8a41d 100644
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
@@ -50,10 +58,23 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        hwmon@11 {
+        efuse@11 {
             compatible = "infineon,xdp720";
             reg = <0x11>;
             vdd-vin-supply = <&vdd_vin>;
             infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
         };
     };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        efuse@12 {
+            compatible = "infineon,xdp730";
+            reg = <0x12>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

