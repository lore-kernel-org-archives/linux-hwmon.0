Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A4145A1C;
	Tue, 22 Oct 2024 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729625143; cv=none; b=n6PcRmbohuc5adY0aCapoSEn7fSMIdzCaAKjaDcgxppLfBIh6kSk+/v3V3PBAbkhowKPAQm/8CZ8QEiXaV8sSRWcqCxJWWWPnaZphNwvLXIGtG/Q38MMEryMFKcJZEW14q9hRx5cyQkkAQoGtD9RzBBY+scP0NTrH4Iu9M1IbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729625143; c=relaxed/simple;
	bh=6dlE5ThcAJ1Lk1xAaTmU7hvsZUlMQ3Yx3RXwM6kWV2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGrt+zN2bkwfB/ydTuLurLw/SRm8GieYreQMYPMd0D4a3erYpMMFmM88auSCHCBdN006x7CNB5SvGv0XWVSamVB1OEE/g5ozPd/LidbZ8M4GngBtfgNP7vWJQSA0UywWO5c+oJiNn60imAKDbMlacVz/YIVkWrux5BUU4ApnTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHKwRyrl; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHKwRyrl"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e6104701ffso1651733b6e.0;
        Tue, 22 Oct 2024 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729625141; x=1730229941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOF/6k6W9BWZmzkwrXMMJ9EUe7Ocy6Od5PcB07oLc0E=;
        b=LHKwRyrlvk3nEVR0wA4jOXTTDJ37wIDBHuWAW4ygrpM4wUrWNMIaU3GBxax1keu3Y+
         wkQD0JIwE4wAANSsit3BepriuApEtJxXnyHi5xI4g9SMrnhndyezG86t2ZCAq64yj+p5
         DQhiQQjbsw6RZ/cAeDr2PXiA2gGfT+tSTE4zgjucy6oQPv+8C87U/JYwonXpNuZIf7t0
         eRKMzsE62zWqHiVScAG9BYOghfptVKVTVvnnSvRFwANAibDV7ZEKgSU8O7DH/ZEWy4xz
         82QbsneIouEqF0LXvTrhmzqd7VHauG3WYFG/Stj2uTPeQQPLEdB40jP+cuKugnxomUEv
         e1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729625141; x=1730229941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOF/6k6W9BWZmzkwrXMMJ9EUe7Ocy6Od5PcB07oLc0E=;
        b=IbqHlw7Q+j3+eUE4c+5XBH0GNVdwXp/cHuHSs4u3Ue6nJ+g/Imal/hVgEhXH0tPE9I
         zdIxnOsrmiZZWqr3JXMXSS2rMsPI9sWjHEeIAKsHol5w/osbhlTIeI4eaulaunO6sFPN
         izxvWOin3j3aqnSHHd6rNlunOk+eJ4px7t/qVENEYqZGR40Q+ZhJq9WZh8Kjhqmyq5iA
         31Z+Fg0rvTsRxPB07ujgeIdE3Li4nKHVcIFm2lJZWnlwcpV+R3qpcatDUKnUei9NuQuo
         j9PAEEoJmXD2CnANgrcTCd9pMo/MCpAvqzQzXRHILE7SyP+4QWiUVOdNtdZCYlSIZScr
         Kx+g==
X-Forwarded-Encrypted: i=1; AJvYcCUDwBJJbeuX534NacorwStQGozc4ZSPiGHQfeuYd3bugMRxX22HeO2mNwweFOcQfW+A9+tdmFRu4WEiGdI=@vger.kernel.org, AJvYcCW8DrcYkT1Yq2stbQ2dtW7MtW2TPHdmiYT6eJNzJCCh+j+Rcless58ulDPtgXiuFTWNsD46bx3U7OKT@vger.kernel.org, AJvYcCWsqmzBsfIFMF9rKXIMBQH1RtDj8XCJCR44K0sZfQIPmnRLLghF5ImfszwwSQoohBF1TYZklheWRc6x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2d81L+F46L/712Ojlnqtu3jHWWakpdcfmhfNvbgZtZTeFK5sW
	NL3VGXXjBGy8SlMyWtbXaf4Rf4SsVmyWXF2iKK7FtSzvS41Bn2Od
X-Google-Smtp-Source: AGHT+IEvGBeHWsuV7gNe9UXgbegD+CAd/zc8CQ7u63tprwBbw6yACieBU+rVHnGXRY5LwRIcTd/S5g==
X-Received: by 2002:a05:6808:1796:b0:3e6:143a:faf7 with SMTP id 5614622812f47-3e6245cea03mr225628b6e.46.1729625141285;
        Tue, 22 Oct 2024 12:25:41 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6102b66bcsm1427599b6e.6.2024.10.22.12.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:25:40 -0700 (PDT)
Date: Tue, 22 Oct 2024 14:25:39 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: hwmon: isl68137: add bindings to support
 voltage dividers
Message-ID: <858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com>
References: <cover.1729622189.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729622189.git.grantpeltier93@gmail.com>

Add devicetree bindings to support declaring optional voltage dividers to
the rail outputs of supported digital multiphase regulators. Some
applications require Vout to exceed the voltage range that the Vsense pin
can detect. This binding definition allows users to define the
characteristics of a voltage divider placed between Vout and the Vsense
pin for any rail powered by the device.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 .../hwmon/pmbus/renesas,isl68137.yaml         | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
new file mode 100644
index 000000000..12004da53
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Digital Multiphase Voltage Regulators with PMBus
+
+maintainers:
+  - Grant Peltier <grant.peltier.jg@renesas.com>
+
+description:
+  Renesas digital multiphase voltage regulators with PMBus.
+
+  https://www.renesas.com/en/products/power-management/multiphase-power/multiphase-dcdc-switching-controllers
+
+properties:
+  compatible:
+    enum:
+      - renesas,isl68137
+      - renesas,isl68137
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
+    description: |
+      Represents
+
+    properties:
+      reg:
+        description: |
+          The channel (rail) index.
+        items:
+          minimum: 0
+          maximum: 3
+
+      vout-voltage-divider:
+        description: |
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
+          vout-voltage-divider = <1000 1000>;  // Reported Vout/Pout would be scaled by 2
+        };
+      };
+    };
-- 
2.39.5

