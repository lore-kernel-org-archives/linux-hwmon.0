Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7E3B298;
	Wed, 23 Oct 2024 01:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729648731; cv=none; b=uPdouEtwWgAdP8VBcybKkTZb32C006WtRa2nWM7BZZt1IEJh2Er/je2NluEUDKCiL6Q3G5PcRn4Gc2uiGEs6T3nFj+8FTyBghSzIMrqN7FyucSvtREz82Sl3lG99wOQbdP2X/k5gwqQkc7vSR9hxGV32dLBw5MXTpoed70ZXKQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729648731; c=relaxed/simple;
	bh=FYj61WXwisPzXtbemi6EdvR6xgwUd1lYYm1eBThKgXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxwW2pHDbdoHFN2yR+fNSiZMLtOAoKZKpHSa+T9FmfUxep8dM6vWrkyPuAK3L5RefMGeSuyTc6+FSENjMYe6wr2wRnoZk/0qVFyY7j1+8OvgNY+UPJ5gVCrN+8KbuDbvhY6UvBNLqvEHZ5MzHJ3vWG1YPGLANWudlRVlJRwCxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8LhtuFB; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8LhtuFB"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2872134c806so2074737fac.3;
        Tue, 22 Oct 2024 18:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729648728; x=1730253528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unwvQEJpU2auNKArz08woZdbyl7ZgOvJVRSR8P4z/fI=;
        b=Y8LhtuFBuni/5idHPrBqyHvBzGf9AkGCKgK90SX8cdfZcH31cfu75kTnYugMZuycHp
         Hjvdbe+j60ezNxrDuSEMVZ7Xit/M6agUxB+ClcvTNKDLuXXM0Xt/JrrdJNDIbNaBWynE
         J4/A3DsCLLTBoyZJWwrxm9lOKeAGGUKpA0Tz5p+FXSxP/naoq23mGJ3ON52o00ch5GdT
         ZrYR/A12gryVU5Gaj4wMCT98WhtlbpBuGhBWtO60czrcBcc6fP6a9pQJiVrhD4vjCDBi
         4YbMi0habUSdZ8mtNLXuXtjvsqMwclvpdHIKDd9Vsi2xCCtl10/LL4W3NlqX6K4lnNEu
         eNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729648728; x=1730253528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unwvQEJpU2auNKArz08woZdbyl7ZgOvJVRSR8P4z/fI=;
        b=n2opbKrs7X6ztqUDLrDlNS84lkYgsUEZhzl0bMaaicc1yYDPlDSo1caV/VZGhIXjMW
         giYBN8GLtigZF6uGShK+QiPPd2bm2eagWPHqQJU2LU41XwHN2BjUMI+V8BLlLev1iZjT
         cVcvzY1sBMt2ij+qfUsY7UDAoGHRh30aemc0TOI6PMEdj4L7SAzvuJihyE2G+vvlns8B
         oCSWQhK/t8a9Sn7Saq8QmbeqVDcv2A/REQSjAb1XN5TmAviKGT8mf7MIbuv9L7IuA0qd
         aUwtr23OpujECCairmhn2g5kRXJ45cbNTAPKoDFN9DXWIUcY2sewalHaIKgLxp2i4Fdz
         p3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgLPICBMthDZcpcUu2NLaiLfmR7UUMax8m43gGl/uZW1Q4nFfHIR5vTObAESO8KmUI6M7PBLA12goZ@vger.kernel.org, AJvYcCVmVOX9ZpbMORn2aKN15RWevSvm5rd2I8Y4QO+XWzO2cosRcO9vnwPTNZ2HJyGhgg73Ryulq0rB2OHy@vger.kernel.org, AJvYcCWVuUf91RnoMouhrWGEnp5gQeUUjbsxPizttMRE1i65HhqRU4lj+pMYingsSsNalwEuUKX+fz9329LAoXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxghXItSpRM5I7TrqN5Qj+wOHmiW4dNZgq+KKWmfxl0F34yDZJc
	f6+39qB9/jNSjbMovLUPTZjHf7xqCxxDzucY55kFI0gWnGWLqF7T
X-Google-Smtp-Source: AGHT+IEsZ4UAWFhNS97IobAaHyzP39PM6que6NvbrHHKBo8MseJYa4hRCHGjrEDqYSeDVjEH8gqzew==
X-Received: by 2002:a05:6870:391f:b0:288:2b43:e0e3 with SMTP id 586e51a60fabf-28ccb97a8c6mr1149373fac.35.1729648728382;
        Tue, 22 Oct 2024 18:58:48 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c792509e7sm2214528fac.14.2024.10.22.18.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 18:58:48 -0700 (PDT)
Date: Tue, 22 Oct 2024 20:58:45 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <8532fec7938144abe938b7d884612052c7d121ca.1729646466.git.grantpeltier93@gmail.com>
References: <cover.1729646466.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729646466.git.grantpeltier93@gmail.com>

Add devicetree bindings to support declaring optional voltage dividers to
the rail outputs of supported digital multiphase regulators. Some
applications require Vout to exceed the voltage range that the Vsense pin
can detect. This binding definition allows users to define the
characteristics of a voltage divider placed between Vout and the Vsense
pin for any rail powered by the device.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 .../hwmon/pmbus/renesas,isl68137.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
new file mode 100644
index 000000000000..af10c55d547f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
@@ -0,0 +1,131 @@
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
+      renesas,vout-voltage-divider:
+        description:
+          Resistances of a voltage divider placed between Vout and the voltage
+          sense pin for the given channel (rail). It has two numbers
+          representing the resistances of the voltage divider provided as
+          <R1 R2> which yields an adjusted Vout as
+          Vout_adj = Vout * (R1 + R2) / R2 given the original Vout as reported
+          by the Vsense pin.
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
+          renesas,vout-voltage-divider = <1000 1000>;  // Reported Vout/Pout would be scaled by 2
+        };
+      };
+    };
-- 
2.39.5

