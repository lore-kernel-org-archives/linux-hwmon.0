Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695A20C313;
	Fri, 25 Oct 2024 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876657; cv=none; b=K2ibDu078tWRZld+A4XWIga4TALGKhewt2g4lHj+IXYXlMRMjmCBIWdkUfF42/MRaozPcmQJMzO5GyW+0CafnC2iPF76RJp4bjKwk1oQQgjJNYrJZcTHOVaxXGxhav9YypmFN6zdux10ro4bCdMg4z46iVtCdogCyMWD8alW8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876657; c=relaxed/simple;
	bh=jynsn9/HWlcVF/RtcXOBBMh/eWxekmobiKJIJIJNrCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1wkbCY39RjJhhoI6BboPkfp18n85ikAS4mDTij3q02UJNij4XxkhDW3QiGnrNkQBwjClD+XypdjjU2n+/Fms30z8jO8Iw7ezhu9/AdWSCGdCT0orEKAqPD5dTx2Ouoe9T7jurBx5aN2ZkpGLx5VxBHYzusdEuu7EUF55dXlZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp6aUPLk; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp6aUPLk"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e600add5dcso1262445b6e.2;
        Fri, 25 Oct 2024 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729876653; x=1730481453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FhMkcmQi5eySEw7AhhvMJzQm41DgM0WGXgc488nr5sA=;
        b=Fp6aUPLkRaP89ifXoHr9nHrq3nOo8mNA4vgGlKEdaieXBN9d2zxd1pi5EphyQSw7X3
         JqZKkrsI3MHJDvBb7fZ0B/VyJVKtv3JP6zsoXxh6+1AwGjfWDNengpdsBEwfGmrZYS57
         KcrDu8yKFGq4HcCSfIljGaD6Q56L6EVjMYopSDBc+n9hO5W71SOSQYU1EBuiTN2dL+vM
         67fFYYFEHWJnktQLvBSwTz+mmz9tvYUIOBVyBEwe84sNg+sf+LQW+aXRLe8rAjWeuHdc
         C0DwHY9HietzVBJX2Yxi2yODzeCJQ8aLUHiJNhhTfZCc4hec2mWl/0DT/EcBqK2xhjUy
         ssGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876653; x=1730481453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhMkcmQi5eySEw7AhhvMJzQm41DgM0WGXgc488nr5sA=;
        b=th4OpyTlI4zlQa6SVH6W9EB2T2egieZ/hZkdAHPD+QkcaeI4XBi1b5DMRSsE9YN4J5
         9obUE1WydAh1LM+XvNaRY4+psGapqW/GBOuBic5LbMTi0AWQxEmacDcDMj3CNzb9pBrL
         ILgs4/Efgpyc9BK7Y1SekqxdfqnK/9w+vqPmVbpyFsL6u37vqZVc2Dbg7nZFZN33SBqs
         H5K8PBYVcw+5njyiZZNndv8Ip1086NDigBIskYq6+pCsGodH0X5G187pEzLYLELUEwY1
         0YHET+h3Z0uT8eNayDXGD53Rn6X1krIquZsNtiIzLIKoz6UT8ceyt4EcmqSZXxnMx2F4
         NAPw==
X-Forwarded-Encrypted: i=1; AJvYcCVTrNBwbvtrGfwbCROJTYZ/WgaIuTF1x9nOQheORxGP7aFS9ZNXvOxzW4tmlZ0vhKmdRO4XSRiQROEKIXg=@vger.kernel.org, AJvYcCVfRpTyi5QcbcUO9HAkG3D05Ae2/C5RE6wOKZN2AL2xpWYRQzHe1kvYcFB6OKfWA6kzxH6QuqCPdWwm@vger.kernel.org, AJvYcCWcxKW1e7beYaYLdsOkFbwjrOg1vvazqWQvtQtV6ve7GhZ8NsaEqauX71OFrL5zW5XRPKGJWXaavT3U@vger.kernel.org
X-Gm-Message-State: AOJu0YzWuZt79fRDufGWicOkrR9e7/ANdvrMJZAzU8z/ApwMZGGENP7Z
	GgYoC423VUa5Mzsf8Wm8pfWlAspJWV4smLgH3OzWL2h7ovMHy3qu
X-Google-Smtp-Source: AGHT+IFzeZJtPFe48xpCoqJ3zXgFC+ikYqxX6jnH6EPCyvOpx9aWahguhhu28Ghv6jUaIDdLs17PeA==
X-Received: by 2002:a05:6830:7002:b0:710:f926:709c with SMTP id 46e09a7af769-7186827b830mr327995a34.25.1729876652709;
        Fri, 25 Oct 2024 10:17:32 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7186189e1e6sm302315a34.56.2024.10.25.10.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:17:31 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:17:28 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <42eadc3942a70bef73ecdf601459aa8b9ea0bcaa.1729874904.git.grantpeltier93@gmail.com>
References: <cover.1729874904.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729874904.git.grantpeltier93@gmail.com>

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

