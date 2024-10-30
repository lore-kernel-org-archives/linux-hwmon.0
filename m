Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C11BD9EB;
	Wed, 30 Oct 2024 22:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328106; cv=none; b=Xij7fsx1k9I3oxpiYpcdcfG1z94UuZfLtOBjDf9wyRYmznLDM7sGsY0pBwzE9hVjbZb7tBbGmjvEQKODWYWYWtXKuwAO3toTH88QDDFlZ32cdy5QC/t8fWQGrvhyHCKsJjLx89Aje73/lTrXpk798RQHpQ44Td8fdGupROLZLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328106; c=relaxed/simple;
	bh=Bd+9S1wV4kUjogO+1kzUX1OPC3IJ1vjNfiqjaf+r+Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plHqcM8zG9+lg1syj7sw9ugZACgul5n6cQqm6/wSJ45PH1oYg2GX09crFLYALcQ5sOabvmCv+cMAh4HsPsWQtBCWpYkkfS6r2KXSNss4FC8iC7kfP23pF25LsMF04z2c31kHNrMWioxB1EC6B4rumMS9BO2KDM9B6uGw/OptF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnlK+A62; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnlK+A62"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5eba450531eso738066eaf.1;
        Wed, 30 Oct 2024 15:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730328103; x=1730932903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+DwSwN+f1TWnzqmhelfmmEne6kIMIbAyJKh/tFg1yA=;
        b=bnlK+A62Qc1zKLL0C05/pETHS2N+cqE2cr4KtA2wJq40fMgm+86gOsiLEeRhDMyie0
         0H6BuH8OSe//flAhjQ7+esPpJbGyaqYH2v1IyfI1LbNYc3LmLqNX0pcXzKxLPASSaSpF
         YEUxzaSoxvUhy7D7GMUXW8pJL/1eS2r5b7QAIsGv1VAxm9MV7B1l7hn6tRQ5nJYVXiwQ
         6D4AZbrUc/7/JpoioLU+iLwCF3rtUHSCiqS5T4CVTads0jLYRWXLyPBCU9Jmvll5+Q19
         6Pywn0pK6fYu1wpH6Pjf+xgbOSfZ2EVhv1uXyyKXzk1lNwK45I/AzKGBWGeyfFyY1sj+
         UgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328103; x=1730932903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+DwSwN+f1TWnzqmhelfmmEne6kIMIbAyJKh/tFg1yA=;
        b=A7IIyEe2LLUqxgjQrM02pg3d2pMoDxWIgn8+sTZY1OlUR+WbgnJA76mEVNSb5jO1IH
         1Mv3xZ4s2t1eq/NSr6lLwzvd3z8GqtxKKsliw12h4mEx3+MrHpAnwkh6SmuCp40ScJzz
         0gJ/ViXrXmEeDfa52jcSB9enbjECXdLabfgk9a4O7JSycLK0jTBaUw6xWjLE3jn0XyIL
         4y75WB6uMiQHbIOcLlFgKs3WS9h6RApwpOU641tvZm3Y60RUIyxWItybYoxYekCdPl28
         xvph8+cOAeh81mGEx1U8FyN5dv9WcajusRWUEf4K/ipoClgRkx9RGVXw4ueSnwGUNEUw
         55lg==
X-Forwarded-Encrypted: i=1; AJvYcCUFXQcMfEObpRjqGdWdOTxLgs4Y7WeynbxHfjTQDMpGk0/WXr8zxSDKCiYmJXd66JAqA7fWnDXLY2BMiOc=@vger.kernel.org, AJvYcCWHVWWSSvBzAmS6P9MuCWebOF+B5Q/uEM8isaenMY/p5hbqzwmNeeppdTZ6biYmEZj0Sd7aI76lLLam@vger.kernel.org, AJvYcCXDN/1goy2y6N61jQTWgoUtJJ/atpEN4hLcW+rLF2OcDuco/ZhRM796P1C/Y8qQNapQpt75J0vhk29x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/jkz0XvlW3Vdiwc5vehLEp79oKWnOSNy8vBgwBeVyAewjbTae
	pDRVsdZYTKTwbJAhS9x6gGDeCjTY/3PJDsC0bSJ3FMbEwSkc4LGc
X-Google-Smtp-Source: AGHT+IHhBzFSSyu1erQl9J1Slu2oQqdHzl0pXPnKk6X8Y/5j/q3GxGOnUB+3x5wRJK7C0Vv4lkeONg==
X-Received: by 2002:a05:6870:d622:b0:288:4407:55cc with SMTP id 586e51a60fabf-294887709e5mr181601fac.8.1730328102124;
        Wed, 30 Oct 2024 15:41:42 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29487429f8csm115166fac.7.2024.10.30.15.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:41:41 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:41:39 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730326915.git.grantpeltier93@gmail.com>

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

