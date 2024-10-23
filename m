Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48413AA2B;
	Wed, 23 Oct 2024 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716836; cv=none; b=pE3na8z3ME2BJOpjI0KC8wmZbaROvv8uzT9tbktG4L27gDQgN5+8Za8EqDamibMHBLbxtYzxInUE1stEYVZ1mpzFESORwCsDrk6QW4x8LXXgBri0HbYS/oqMYLxFyIigyzYV/L8a62v3JidMNapuMZsG9fHiQ7P6XPq9Osn8J5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716836; c=relaxed/simple;
	bh=FYj61WXwisPzXtbemi6EdvR6xgwUd1lYYm1eBThKgXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPDSfpSsMPSKA+jX7Nc44yKFCPXHfE9aAgkgewEdV4gCF5XTZuABOx2hR49tFQW1A+8IU5t2aR6w2+m4Th+YVkx8QLOTTK6p17ZoN8CezmH860LRmAE0DDXADvh4UfQ5sk0nqEsGqCLJH8c59+vRenAHCBGNLRYTjfq5uY4gQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8Szicll; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8Szicll"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7180ab89c58so163253a34.1;
        Wed, 23 Oct 2024 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729716834; x=1730321634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unwvQEJpU2auNKArz08woZdbyl7ZgOvJVRSR8P4z/fI=;
        b=H8Szicll7TPPeYmdtWwQi7etMhcFtyFgYKLgDdQ1czgJPfJxKLm6JG7jMQPzAC4P7n
         O1+qkF8Xih1+pkohrpeH8Z1IHRPGvR57s/vNkjRMnNquCog7NQokkWbzxttsrD0Ns49f
         kWoJdNa6YG3GEuV2L2GmVr7PpPnNS17JUuVpPSHKYM6UQ+hb2K4jK40V/g0IQbGkxtBt
         BFVlPaoVTPUIEpkFCqwa0zyDE0zPdWu7xA/NnNIRHRIKrKQfOCDa7C0JPomGOvigmx4I
         /5aJxbleGJ91WBFTe6ygsl6Nws1xBRXFglkNCtpA09UjAcKSaWyjiKUPnlaEdX74+BED
         Uzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729716834; x=1730321634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unwvQEJpU2auNKArz08woZdbyl7ZgOvJVRSR8P4z/fI=;
        b=mWqm6BQ50BlxTvjCG0mHeLfBLwP/I0vkXd+H+Hnbfs/a9LcxfaR8HdHn6RNvkUsurj
         YAmeorPDLDWSnmni15pjOAOpoBnPaBbuMIt1ecEpTafqPuXzvkWJNkSmVoWhVSZVUnmJ
         u77io+cceSukF6FDOleDPnvf3xBNmRO4CW6ZCIpewDsC17SDI/lLfEydObcmk4wQSaDQ
         uQkiIfZO4RVozudJ/eHNLJsKSUvFGVJ2JtWtGaPi2bSzZlD0GZp7/jYQQff2lENe6lMF
         egARhVpKg+C4IogjrKzqCKT35zHtmSMU0gdNKxgqNa3JvOUqdMiz/Yeu3/v1aEVDbNBU
         rZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCVRWzmzWZ6uS0uSRQJ0D6TQTRGpzwEOCxZhuDVwPGd6mxlOK/R9ckiVpdMbZQ9d9gpTzO2PLWY4hQsolOY=@vger.kernel.org, AJvYcCWG/FubVGf1eGOXoZpsUV1yXmv3AzSVNUUZqEICWor+bFXQxuf4k8dkxzfH90WN5f4xTY7AD6wYWl+h@vger.kernel.org, AJvYcCWS8MI2dELZbQSvMehup1TAKJaD6pMZeo/kLIKa57b8Le6CdveCi9p9FMZvbdJ3usJgABIJnpqklRXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2UCa91IvUljK1f44V8ZZovTA1s07sLe4x93o7MthV8GO9Mf9
	Xdx6pQ8h8SLVbJbhmCDJwzlldYoC4jyrkM0L/eTythxUr/7XcN73
X-Google-Smtp-Source: AGHT+IHqxONL9icorPiBAyJ7fxCvW4JQT6tYn2d0Un3n+fGTAwxo9dB/jB6wLNVqqxOb2iT11oahVA==
X-Received: by 2002:a05:6830:6f01:b0:718:10ce:c6a7 with SMTP id 46e09a7af769-7184b348e49mr3519502a34.30.1729716834152;
        Wed, 23 Oct 2024 13:53:54 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec02aee5c6sm57787eaf.8.2024.10.23.13.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 13:53:52 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:53:51 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <2cc99616ff3dd9bcecb1309cd4d103d70aea862b.1729715599.git.grantpeltier93@gmail.com>
References: <cover.1729715599.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729715599.git.grantpeltier93@gmail.com>

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

