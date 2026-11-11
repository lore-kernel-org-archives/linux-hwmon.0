Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413795;
	b=E/aBkU8zg9o4kgB3VDO+ML/E/vH9ECY38UinG7ybEi4IAiF0QylRMcq2oGmRGIPpKL6R
	 VjICJdzkCPGoO/MbsHgczM6AYafNDWnCi5+BJr32+1hA6mHxCDuPw20oNoBlNVMGYKQ+C
	 DjsrFqN8Mj2DlpljoxJ8b/dC27VyZ9tC2sZdCDo0LsfPCelJ3GDWBgjo62Jiy5eqrmhAR
	 DvPhlTL1t+s4u95KdeVa44aeHRH19qLu5f9XDFoERd2SiWf44pKlwxad+QGVUp5AYkp+A
	 BedXmRKCNvtBTIz7tyRFaMHJJ0YRoM1xdsKo5+VHzVyAwc0z+tqcY00FflSgtjOSe5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
	b=VgVl3XGd4z6UhuoxfXP9QuS4tiY2Bff5XVhDP1cLA9d6RiiXOI/UoEBYz+upLqNfqAeS
	 a/bR6jGz4BOG1qMCdehyNIY0JZZDv4zWMt/mcsszfICuZd7nIVhgx2AMMfvULOitwV1xk
	 Dh+WqZ6/MAEGqM66/XGbz1/PqqkH/Df413FJ9FEO2s8qB4QGNoQj2wE8uXthTje61hgmU
	 U+8JWCmQ25OI+iC0TMYxX26/KFpjw2mw3XYYo6+bjThWn2Ub5jbsOgO7F1SNIUOQZxw42
	 PpEUlyZaac6YpvCE5B5QzulD1I1ufDBuQtJDWj0mvpn59pTOgBSVrNdgFIZbsD/FG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B889606A32A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B889606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24932875e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413794; x=1795018594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=xCGgpKHON65vGWLu5CG1Egngwk2+BdTi+fnSsSL8D0x8Xqivs1HujwomCjDv2PPMZR
         q1VSZnruWiOoG/A8ksoUMLToYXYFzCXX6Wka8yk3Bkz6oolx7esGfrc0u+7+e/NfowS6
         K3blGXurwKXyACJIfPTQ62IhUwWmSqR9Ajgri9lqTE5lEYbTPQIItU3FfyeA08d0SYEN
         RmPhSHR0/kChKXvGKMKn9Hc3XMRZgExRnHHXpFfOTvW9IWTYHWQGFTPhIZ+PQkKgxdfF
         zfhdOksppr/kElqDPx/cr3e1HM7bkbGnizpDpDOZxpYxaeW5nbN0SDGeiE6q4MfVH6+N
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413794; x=1795018594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=qyAyjjhDs21BfiC9bk/L8niAYU/kRDsEqiXcsPzzKSiFX1ziry4upTUuiuk0PtFJSa
         EtTY+YnzOVySl/5VqppqVdW3LEqUqUdfDvS8/4YR94rOLXm7YAReqrC8tJsL+QcF6fZR
         YW/GckXKtT3B1Jzj5qbkZDBvhRjspZyovvOdPHsoYMFPEYU41LQF+EE9bO3rsA4a+sFE
         jvumamWy59es24l3tye5RpxNip09GsGelC3UvOHJxOtgo0pJc/3ZARwKwq9D9TyQSF9E
         vOK0Mi6U2+/UByUXNI0vTj3j1nPtCd7f/NFnTUyZycrLVZN+2CkIn8mvrgz7CrEbtauA
         AMhg==
X-Forwarded-Encrypted: i=1; AL+hErF6nYGJl+NzmlysYqHRptpGkP3CAvI+dZlB+RXzA7z93NaXjdeQVj6W5a0jR7JDKyzWg/j/oqdbdRBNXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z89Fr5RB3Fc9nW0noNWWVF5oNasy26UBUIf5YhkPRCzu/Lj5mka
	wNubadJgF4E/nlrlx2PPVawYo8ec6DfqXIlLIGq7iSPU9nZZeZGMdRfGUlfywDgdX/I=
X-Gm-Gg: AYBFou3VYFgEJBiQq2SPiWHOSHQ91FMvwS+9a3JaBM0HogvadD3RoePrRAGrNRLkkiR
	q/Ldesu+tpR6N9xPj9ZVwVjk95ISERzq1scFF41gr8GEEzPOxzCFeRFgQJsORqn2qbzCOYmL1gk
	uPjWhOkiszbEPfyB14+R8C7/hKV79H0cc/cln8wFrYJxTmxNPB00Jq9mnWYqHug/VaEFOqTn9dw
	wIxmbipImAcdtrR3qz1ktL9qA2HLGS0RInRt7qTeiNqqjfm6kFY4N6eQPIDrzfgat4x2Afsh+rr
	tS2jIDBNYsqjwMO2M03yvpE2Y15SHiGoHRuVnXb1D44wF8YVfr2HSltS0KbS1sKTfI+U8RXvE4N
	G+/oHDCVd4D4yKKQ79N6VWJwxP+eeYTHIb9AqOTJSqWvwV8fXOvIHW3+51upTiJ1VE165Xm04ta
	lLsUnTJBYdW4G8EPKjFl/feBF8FV4zBPh3Jg5gmZE7uqiu7zWHwIeqAu6TYC+QDeNXjAWG3v1ON
	Y37nO3m/NsiN5fnj17YQ8cbPwywE6PEoPYMwKl/T9TBKgQDlUFh/SHRuPgTqNtoW1kJpSV8LXgX
	kepskmrVkfYgzyXIbSWRF4z3bq8gxSrC2IfFqAHitvHxDA1rhBw+tIpUjo/3vWvsUpHwI8V5Bic
	pBIl7DN0t1pMwWubxnRAyBhKnJ+aPd6qCE6C5Lnss8QmCwHgoL43oo4jJdCrXf3eyQ0y0UhbAFY
	jXhaw3icVcJ1JYsdWDC+0dBCg=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr48000605e9.8.1794413793928;
        Wed, 11 Nov 2026 08:16:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Wed, 11 Nov 2026 17:12:46 +0100
Message-ID: <20261111161619.232141-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Drop the unnecessary literal-style description marker.
- Inherit pulse-count bounds from fan-common.yaml.
- Require cooling-levels only when #cooling-cells is present.
- Add Conor Dooley's Acked-by tag.

Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..6a8d05a62f7c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description:
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

