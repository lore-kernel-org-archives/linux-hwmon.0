Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD2471D09
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309787; cv=none; b=etPoJEA7BhZmnX5Zc9RVSGWzYsv6nHWM/Awhcj+yHfqyuGS527J3cwgv/BoAEqEa638OWZVzkQJyOiIXL9txAFuKZmeJxZyxsB4ggYm1GFft3YDgeG/B8KhkY3WuUBT4PPyuWCkEiGqIc77Sq/KTvgDP1B+9elIB6YlrdbUsv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309787; c=relaxed/simple;
	bh=Hszesw6yVqnZ8OpYpwPtsWJaTs2YTlaai6RAYcmBCoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uvfchz8nWBrW7Q5yL0mkDYO/t6akJU0s2Gu5kb4bA9NVIsBnEXCo/OsiaEMlPAmNNITk2kYMYYwaaxWnzRfMX2Wda9jqUpmO3KZAXFHvFsxE3BB+h2urtgM8CwH4fFVx3DRLC051HIKx9ezvw7KkXZwDPF0MXfJJ633KHDyiaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scX3+nWk; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scX3+nWk"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e88b60121so616865a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787309785; x=1787914585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=scX3+nWkH7deRHF+tYx9TbrYJ4/5GCQygA5h6NPUwcxix/Q6E9n2BlgZ0wRLxwslUF
         HXbCqI+8xYhFKjmjddfLt0BUfRn9F1cggrYAj94RpoT/gRmWdkOP50C1CAeuFwi/fmh9
         fHUkjCdVvwlr5Hlq/PlU7Y+dXcqu6Rhl/reN4oE1MKmOtuqlTPJAGW1Z015c4VHhy13W
         luYvF3Fln+sIpfhwQTRnb6UqG/j3o4JZxRKaKq02FnLZUB7ub6j3M+2zvmEqi97Zbgex
         DOM7WmmAPmmsGpPFOFSmi1D6w5NVR5uxXP2/IzT26VSbBuiIm0IgfSplJXlJ0j4M2O22
         sT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787309785; x=1787914585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=ETKgZbD2mcps0juDoCmz9UBvtNeS3JJylp7bFtOgHBNkxhUAaUc/cSmh9WJ/PIjyjM
         3ZRk56c0uvsKyW5Lx/AHGf3eCMWKKKfBySlWZV1mkx8h28bSA6MdqslSfXKMxJORgGxA
         5l5EU4xLG5SLTlFRD2VEqwNxfGJi//seZHtduPDtaAoV7wlzqOhT4IoYsWRurYwRvpnJ
         SOhFrCZieyYoVogLQplYpSXF50g4apQaNefNyDhE3VbM21ibO7nbz0aXimH5ohdlh/gr
         DUP/+8CO7sGDyZ6i8TYTnbgLlz0eliPDMrmFJLTw2qQMcSc/gfyw/syzDgVJZMf0SKvB
         VYzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvRjcsvpvHp+gjOQlxwOaPBs8VJLlH1DOPfL2/NS5qGVe5E16F0BhM3YVqVIDjxcpNLHAOEPPKJR6RaA==@vger.kernel.org
X-Gm-Message-State: AFuF++mnaGO0/hak36Lw984q+vPboIQf+j3wZesoko/hjLntz279mjuw
	O/ejCIyPNHFdUFOgOBgofG3VzxAISfp4uXJeaQvqhs82qUNkpeZ8ySs+
X-Gm-Gg: AR+sD13Bh3EETKT0sbMNaZM13NsX0d6d7WoWA+UcWfMUJrTPn8IQ3IsE1SJp2vMk2Jb
	rWKMpkzYGzuzME4nofuqmd4Hfx0iKMBKnIJ9IplHWu93eI8X7oEg4cV7pkCgM/i1EMv+K5hX6yC
	GJ/MuXPmNIKU348D96vcTPWrcL1Xond0NKALxX5l5QdV/jIegHj6Lrkt7TuWl4v4r5aEeAKW90q
	S7FH3lFRjGdFyOSxCYH5G9Ao5uLfviXgHRAE0arjQP9OZjXQ7Pd36tdSMDQtV9+XXKzbCuUmZLZ
	QWFi35z9Fy6WioyDsseM6ihp+d6q/pjMiYpKCMvbMw0KfvHnmf2elJZcGxbFwensPWje6G2fsFZ
	tJRy8Lxo84v5OSCQCDfY+tagMaxsQoeU5TzhUYMvpqB8p/zpdNmZLrrMhOvwj0gNmJuHf8NOLG7
	Br5IodHogfJiwMd5/Jon8kYGV1HevUo8z3eKRdiIE0KgwZ9/h6fIxhYWixcx1/bmye/iV2UdN/j
	Tx6Re6JndXD/RDMZflUMf5IMsjDxjMgoGRWrrtswV3beQDCSEHT
X-Received: by 2002:a17:90b:314a:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395c3522213mr9208574a91.6.1787309784878;
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467980bsm2692579a91.5.2026.08.21.03.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] dt-bindings: fix typos in various bindings
Date: Fri, 21 Aug 2026 18:56:05 +0800
Message-ID: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors found by the kernel's scripts/spelling.txt
and codespell in several devicetree binding documents:

  - "curent" -> "current" in adi,ltc2991.yaml
  - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
  - "ouput" -> "output" in delta,tn48m-gpio.yaml
  - "redudant" -> "redundant" in trivial-devices.yaml

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml    | 2 +-
 Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml        | 2 +-
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml | 2 +-
 Documentation/devicetree/bindings/trivial-devices.yaml          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
index e3e668a12..698cc14b0 100644
--- a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
@@ -14,7 +14,7 @@ description: |
   details see ../mfd/delta,tn48m-cpld.yaml.
 
   Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
-  It provides 12 pins in total, they are input-only or ouput-only type.
+  It provides 12 pins in total, they are input-only or output-only type.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
index 1ff44cb22..2210764a8 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
@@ -49,7 +49,7 @@ patternProperties:
 
       shunt-resistor-micro-ohms:
         description:
-          The value of curent sense resistor in micro ohms. Pin configuration is
+          The value of current sense resistor in micro ohms. Pin configuration is
           set for differential input pair.
 
       adi,temperature-enable:
diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
index d073c51c2..e0aacecd6 100644
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
@@ -27,7 +27,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description:
       Unique EEPROM identifier describing its function in the
-      system. Will be used as created NVMEM deivce's name.
+      system. Will be used as created NVMEM device's name.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09c..719b82490 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -186,7 +186,7 @@ properties:
           - injoinic,ip5306
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
-            # Intel common redudant power supply crps185
+            # Intel common redundant power supply crps185
           - intel,crps185
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
-- 
2.43.0

