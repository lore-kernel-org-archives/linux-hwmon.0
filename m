Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69819219C8D;
	Tue, 12 Nov 2024 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442212; cv=none; b=KlQn3XjePOmh4FZeLTmPOyc8HLoX2xH59WXz/z6F0k8M4aW/MG+juCETNA6ZIslZSEAPp7wOyW291hqGt4cH/PdcvTcbL/WeZT972xKi/ShbiAi6FJFxWMKHJxbrDW+bfM6CXa2gF3gAQp6HT9iTWLU/Sn/RLAGTS2wl1TvDoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442212; c=relaxed/simple;
	bh=Ft4reouLgmooGNp1IzuEgObU1EGpzYrvBVstwPJi/I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkdJEKDr6lx5A4cHvJRuIYutoXlocLJ5MZzmVo1blUWQvXF5qGRL0oBaYgynAYuiTh/pxJI6Uw19RgjPOG3rE/ToQyMk9i31TZwXKh5Ivrm/CRD2AfCacicAKceCVYouR76ohAaSVt2qNldzcIebHQwGgjYEbsfryQ2ocGu2CC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8quB+Ph; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8quB+Ph"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e604425aa0so3543129b6e.0;
        Tue, 12 Nov 2024 12:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731442209; x=1732047009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gaVCPXgww8S01oVPq24IM08aAIF+M/sEyh1exT53yE=;
        b=h8quB+PhAoBh2WGKBX4B8XjswMrgMZYRS9WBDulzGU9XEzIHqb84ThaK6vFupekTcS
         6mGfhqubq06IEJFL0iaaktbMv5l0r/M9YQ3grE/vce5l6C1bJaGP7rWTLSrpnQWzQ/SS
         KZ2XtvbVjz6BDCRlwPTf+2UcQ1uccg22+577ai2AQeC5YyHfv8zBdC1oo7ouc2FsBM9x
         S3WGDL1E/buWW9HqO5gJktrcBrLrSH0OL7mgORFqHDU2ZUjN/Dz8cLOXgiO2QgIR9t2S
         pArtJAhDnX3dJsh8DSm6NKH+Z0yH9g00V7ItMi+IzL80qk/ro7RP1EniMXVISzY9NVi7
         JOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442209; x=1732047009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gaVCPXgww8S01oVPq24IM08aAIF+M/sEyh1exT53yE=;
        b=T20ZSW+P5TqcaXA3hxm9bnuWRp9dREWo/rV2nXWKxnlKesRbB8u9sVXmrmoTQEBzff
         tdwrghBMpnMplcqQc1nW1W7X4jAUa1fdhEhOcroY/gISe1rQhIxtr+ObGIfz+EbwaRl/
         tPZrTF6ulbPoaL6hscy517OHzqtE/cb44wTZBl0sO+hpI2VWkeAfA9RLbKXjO/ufrpTE
         hrr7ZlTMaiFlOl6mggjvlxZCoiVA95jsUdK9Phw5C6U4QCNM1Q8uymJidCABJQOOEnMR
         XzRRMjiNpOV0g+69lPBgCCzuKzzWO/89UNTTNS0Mwebn/wz6ykEkXqDurLOVfM4md9aT
         cPPw==
X-Forwarded-Encrypted: i=1; AJvYcCU93nq77alP5ogLE9hhsvJjjPSxToenCh/KVFlv/Vzd9VUqT3dcMBnmCrpIE0Ae4jHKn1gGxWSPidk69pA=@vger.kernel.org, AJvYcCWOqr6vxk2iOSPElTEr5k9y08F8pW6Ex3cBg1dGwNM4FX0YWQiICr1x6/FajOPT6Yggk/ZdJquPKiF4@vger.kernel.org, AJvYcCWij9fOJ9En79RgIWJss1ImaqfO3CnT3W3PbTtbMOjBF6HfAlNxxL8y18b9Hbr8h+D/AIJlN13Lvz1C@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2c466OU/KItYXqWLT2VVK0bWdSRg88bVnbtVQffeqKJh0MKI
	O4gqeDZE92SWDjonP/24y8ugLrLbZiw6dduE+Tne6Gp2DEjhGMaG
X-Google-Smtp-Source: AGHT+IHHe3B1JqqFy8F72j5meLToyh+TFOncLelRarysE4VBAHZgBlb5vFh8P2CQ8ScXCIgpB3hI2g==
X-Received: by 2002:a05:6870:5a6:b0:288:865e:1864 with SMTP id 586e51a60fabf-2955fc63dd2mr15035475fac.0.1731442208545;
        Tue, 12 Nov 2024 12:10:08 -0800 (PST)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-295e8eb8c83sm60791fac.4.2024.11.12.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:10:07 -0800 (PST)
Date: Tue, 12 Nov 2024 14:10:06 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <f7ac200e982961ff733de27a5c4505c04d68b6f3.1731439797.git.grantpeltier93@gmail.com>
References: <cover.1731439797.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1731439797.git.grantpeltier93@gmail.com>

Add devicetree bindings to support declaring optional voltage dividers to
the rail outputs of supported digital multiphase regulators. Some
applications require Vout to exceed the voltage range that the Vsense pin
can detect. This binding definition allows users to define the
characteristics of a voltage divider placed between Vout and the Vsense
pin for any rail powered by the device.

These bindings copy the vout-voltage-divider property defined in the
maxim,max20730 bindings schema since it is the best fit for the use case
of scaling hwmon PMBus telemetry. The generic voltage-divider property
used by many iio drivers was determined to be a poor fit because that
schema is tied directly to iio for the purpose of scaling io-channel
voltages and the isl68137 driver is not an iio driver.

New schema file named isil,isl68137.yaml to align with the corresponding
driver name and pre-existing bindings ported from trivial bindings.
However, all new device bindings use renesas as the vendor prefix
since Renesas acquired Intersil and now maintains all documentation
for the devices.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 148 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   6 -
 2 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
new file mode 100644
index 000000000000..bac5f8e352aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/isil,isl68137.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Digital Multiphase Voltage Regulators with PMBus
+
+maintainers:
+  - Grant Peltier <grant.peltier.jg@renesas.com>
+
+description: |
+  Renesas digital multiphase voltage regulators with PMBus.
+  https://www.renesas.com/en/products/power-management/multiphase-power/multiphase-dcdc-switching-controllers
+
+properties:
+  compatible:
+    enum:
+      - isil,isl68137
+      - renesas,isl68220
+      - renesas,isl68221
+      - renesas,isl68222
+      - renesas,isl68223
+      - renesas,isl68224
+      - renesas,isl68225
+      - renesas,isl68226
+      - renesas,isl68227
+      - renesas,isl68229
+      - renesas,isl68233
+      - renesas,isl68239
+      - renesas,isl69222
+      - renesas,isl69223
+      - renesas,isl69224
+      - renesas,isl69225
+      - renesas,isl69227
+      - renesas,isl69228
+      - renesas,isl69234
+      - renesas,isl69236
+      - renesas,isl69239
+      - renesas,isl69242
+      - renesas,isl69243
+      - renesas,isl69247
+      - renesas,isl69248
+      - renesas,isl69254
+      - renesas,isl69255
+      - renesas,isl69256
+      - renesas,isl69259
+      - isil,isl69260
+      - renesas,isl69268
+      - isil,isl69269
+      - renesas,isl69298
+      - renesas,raa228000
+      - renesas,raa228004
+      - renesas,raa228006
+      - renesas,raa228228
+      - renesas,raa229001
+      - renesas,raa229004
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^channel@([0-3])$":
+    type: object
+    description:
+      Container for properties specific to a particular channel (rail).
+
+    properties:
+      reg:
+        description: The channel (rail) index.
+        items:
+          minimum: 0
+          maximum: 3
+
+      vout-voltage-divider:
+        description: |
+          Resistances of a voltage divider placed between Vout and the voltage
+          sense (Vsense) pin for the given channel (rail). It has two numbers
+          representing the resistances of the voltage divider provided as
+          <Rout Rtotal> which yields an adjusted Vout as
+          Vout_adj = Vout * Rtotal / Rout given the original Vout as reported
+          by the Vsense pin. Given a circuit configuration similar to the one
+          below, Rtotal = R1 + Rout.
+
+            Vout ----.
+                     |
+                  .-----.
+                  | R1  |
+                  '-----'
+                     |
+                     +---- Vsense
+                     |
+                  .-----.
+                  | Rout|
+                  '-----'
+                     |
+                    GND
+
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
+
+    required:
+      - reg
+
+    additionalProperties: false
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
+      isl68239@60 {
+        compatible = "isil,isl68137";
+        reg = <0x60>;
+      };
+    };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      isl68239@60 {
+        compatible = "renesas,isl68239";
+        reg = <0x60>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0>;
+          vout-voltage-divider = <1000 2000>;  // Reported Vout/Pout would be scaled by 2
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0108d7507215..5afe09026938 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -155,12 +155,6 @@ properties:
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
           - isil,isl29030
-            # Intersil ISL68137 Digital Output Configurable PWM Controller
-          - isil,isl68137
-            # Intersil ISL69260 PMBus Voltage Regulator
-          - isil,isl69260
-            # Intersil ISL69269 PMBus Voltage Regulator
-          - isil,isl69269
             # Intersil ISL76682 Ambient Light Sensor
           - isil,isl76682
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
-- 
2.39.5

