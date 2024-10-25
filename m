Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D391859;
	Fri, 25 Oct 2024 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816859; cv=none; b=Q5NS8kyvxWL7zQbmSeu/OvBLSJhXA82jyH+zIFr/VqUA9qoP/xMOE2FmWutV4FqHKnT4AE57I9NpwgrlnOZ9KZsg4Cd+HbhYQguCjwSgRuEqIpjo0vR5PWhoBgR8xys7kxoEXIhKirhGkCs5+r9NB72FvWiGBkmmIEJCKOfLmeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816859; c=relaxed/simple;
	bh=jynsn9/HWlcVF/RtcXOBBMh/eWxekmobiKJIJIJNrCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO6qWT20ZEkp4bbJqA6RsdqidxCbejr3wZcNhom/KQV51Xxcx14BuEzoVSFOk40t+Px0CAIawmeF5AgClECHxjmG4Zj7AmX9za7UQRTcs8Niha2W+AZo29uk+kDKNL8OWxM+IrbICxx7sIDijST5YCPNTpEr/00J90KXeB+yN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnUioCyA; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnUioCyA"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e60825aa26so916746b6e.1;
        Thu, 24 Oct 2024 17:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816856; x=1730421656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FhMkcmQi5eySEw7AhhvMJzQm41DgM0WGXgc488nr5sA=;
        b=GnUioCyAaImgs0l9sYZsPT1dzxPIm+wpsPK3Sl85fNO0YczSRVneyQZmX51NDrVUew
         10ZtX91cxpxfzZMlHehXiETovroiSNHyi3P9S8H4Fvv5cqe/PfNdmpQWQqjEQ4W/hNeH
         Uiqxbr6HGn2sI0UuB+l8so72AQw6vh4YjaCcEMtkXx+YtaU0HguK3qHYTlkvHZI34x4w
         w+D7U58Uf9HbXv8ZLxeP50KlVkI7+PRqoWWL3N2uHMWbCkq2dbx4t8wbxgFAkTuA0iFF
         hrmJoXM+x3RzY7pjEqNariehjW10bsK5luKBhSDtekMU9gFjiiGt1SS/ETkrcwkuMSBd
         C19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816856; x=1730421656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhMkcmQi5eySEw7AhhvMJzQm41DgM0WGXgc488nr5sA=;
        b=G5MxK/i9aX3ogJs3vz4c3wZRmr9G5wOLuF4jXFoUYIw+NiTn8s3bpYEHpcKZKatdyj
         kZKOfmhzqCf5lJKvElxObwRTPXN2nU/AmhpVea+4nK5+3fCVkAyTXygdKyV3cXCnqiPG
         SrW/t+qoFKb/EtIR11MGlLETTPYYCklWOdoOtxxow8/FnqqV5M4Ut6FpqwBiCfyKqc/F
         BeM8XsdwtHOriI7LsekfDSB1WyceRv5ZDN7u1FxUBbGkvYMVX1pSQrGR9b4JoS+KZINb
         EbnfI9X3xfx8hcBDa2+ppKmft/uAS1mrlpVIHBD5z7nA4aEVIb1Ccr4r3nkJW8iILnXy
         SxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXqNvlNj2/+L8a9LHD/3RUuzdVkU3s9+ZnVVV61Fco9kyLdfrT8eQeXl0N5X6dF2/WV/qHe/eJmIubMjM=@vger.kernel.org, AJvYcCXfJ4MyVPw7IpmO0SjNkua9h0gitFPQhxMfvTz0gP1KQUaZHaRn9AG0JHHjsEoyF+6WeJ9Dg87rRz7A@vger.kernel.org, AJvYcCXkJzxd71/t/NBAvs1/vLWjKFAI6OQbV01YVELDc+TEHvfgRuO/L62z1Gau/3DAjytk1j7EJ8vB7gGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVsDvzT38pTxS1Vj3S5/PiOYPeV1864xx6/h6aFkP4dVybOrG
	dcTrloYrM3qvMWyNu4wK8zVFZBoqFRsc5AWE5wWIA11dgXyZIgHy
X-Google-Smtp-Source: AGHT+IEUAQCa7pXJM5J81Ke5nULE4kKJ9lmuoPz8333TpTHKkj71AJAFf5L3sPeJUizWGJqQ7zQlww==
X-Received: by 2002:a05:6808:1307:b0:3e6:1ed5:1921 with SMTP id 5614622812f47-3e6245d1fc2mr7851482b6e.47.1729816856107;
        Thu, 24 Oct 2024 17:40:56 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6325b7d0esm31678b6e.51.2024.10.24.17.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:40:54 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:40:51 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <6634c1b8e015f82c2c3529ea7ce234eaa73452b6.1729812789.git.grantpeltier93@gmail.com>
References: <cover.1729812789.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729812789.git.grantpeltier93@gmail.com>

Add devicetree bindings to support declaring optional voltage dividers to
the rail outputs of supported digital multiphase regulators. Some
applications require Vout to exceed the voltage range that the Vsense pin
can detect. This binding definition allows users to define the
characteristics of a voltage divider placed between Vout and the Vsense
pin for any rail powered by the device.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
new file mode 100644
index 000000000000..ed659c2baadf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
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
+      - renesas,isl69260
+      - renesas,isl69268
+      - renesas,isl69269
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
+        compatible = "renesas,isl68239";
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
-- 
2.39.5

