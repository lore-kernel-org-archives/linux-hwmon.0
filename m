Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD151242D9A
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361885; cv=none; b=BHHuS91TpkJwIEKlK+jenZe+p1eVINIvIGp1Acu6pqPWPJ1CZv51g/Fl5PGz4WozBwPMn+D4PY10KDTiQn0/3Uh1qYAi5nW5bBNV0rS1gs0IKIAaxRxzdLaTXzX/nkmdkEHNgmflPEcazlp1BmZ4x3771QQWOfT2JUArYHrlmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361885; c=relaxed/simple;
	bh=/4FUKzJGctfh4F0xV6RfSXalAyRIePr7kz+uFmRa8D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avEo90S8MxAu45UiFU2G/LoXg0zJuW2LS9ZEMJSsIqhT6TefXI9+j+YuhDYQPGt21WHUjMe1Gpg+cTRbMRC0Etojhrm2hb4+E9jA/F+wEe3HolKctDFrdJXYVUAW4lx7P8KeGOM6S8tCFE+nzj925WRQJE5SdDp2SMPf/Hseo74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FK3j/1R3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FK3j/1R3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade5a0442dfso214302666b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750361882; x=1750966682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDdReUCNxh7kd/Z4bkc56sI2H6wihwxJvgXXCb9jS7U=;
        b=FK3j/1R3KZfkr6kRFpHjSoCDijsFtzbeU3NGFwatbPq0nYs++p3S0epYU6zHgvZa2y
         +KyelKK9s92FlorVYisbytoc9ZLj44vBy7JU3BJMKnzYX3hGr6wPJqUeQIoqZcYaNvFz
         NdVFQIy4KHxEufjFzQgkI/+76Pj/SqfkJCtv1lq9sfHAJ1AcwgXR8U/K4dEKRC99BKJL
         apRDhtXoHjL4yWxtPHa+KXEBNhT1MegORYpaGV0Fdlswb5Nv6PwqJSSWtNmwd7AqDXJ/
         rd06Ucg6X9M7sa8odDw/cFzXjZye5BdrYDjm9pmI6UawQo4WIgDwkvvrF5csTpimEN3Z
         rqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361882; x=1750966682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDdReUCNxh7kd/Z4bkc56sI2H6wihwxJvgXXCb9jS7U=;
        b=rZHw4AGMjBBP1FXnAF0ufUnmX6GM97A2Zeg2NuOpYpgKg+wxnPN4Lfv0HVyQOwcXbh
         3QvsrepM0YXwdvp9lJCiFkt5vmL+1bNCcvmueo7uaAT+szMMk1qTMyNluylMLh9GaEhk
         b86hhoFSfo2Oy1EhED4d0brU1tkG+l6cTfwGC9RiB9oLqbHnkLDaTHy5JAW+93sJfjPm
         d5tD9H3V1DKOWYz7DK9xfbwo7ml65/IlyMT0g/BS8anytr//H4TACi4irdHVN5C2+M2r
         w0PCu+ovqLsVunUYi8jioprSzudzeyPIZ1R6q5AcQf9oLiz7RUXkGvOblx/JhMIEkJvG
         L//A==
X-Forwarded-Encrypted: i=1; AJvYcCU+u1hYw3vnFYKVSZzFQnG6/40sHtUeQ05dsSsuc4SYBYCvrare+OxlEM0Oe9qDg3ol7FjL0oGo5+cqGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9R+D/GO5R3y4hWXMwKNpvzyoPHsJUzTWYwD5NO2egk91REOHp
	qv34dc+fcQIevAthn/2QeRmQzzzSLXZdMjH3EUhpCaUlgrjaiTT545oz2sweO/EZ3Ag=
X-Gm-Gg: ASbGncs7sGOYWSc1qUsaV7DNljSmnR6hdh5hj6Yvd7z4ucTQPVGa+9JGLhHFz32ZGn2
	9TbIGaYB03VLCsi1hPOMqxU9+0q+dJIaBwfB1dpES0iDEH4IhWcWvTyFmsW9HW83PAq/wVeHglC
	OKVMpp8L+9bL5hhGTZMbp3CnRthgn4k7XY2uJc6whm3U2uJcIEe1lkLsyHLfpXKQM5JiJyv22X7
	eEvogB6FDCR9hulrt4XQgCeGm9d+fkNHnSWwRuvIRWNk6Jzpei0mi7INe6f7RrddW/iqCay25Cg
	EBe6iyCmRDLwa6WZx55kohxAOejy5iTGSCscefb3cyZWktHdfh9yY3kOfShkMX3+yJw=
X-Google-Smtp-Source: AGHT+IFNRziKzwyTYykIWbCd8I4m09uDgsNr/FjlRZAov9xS5nfVCYLscsjvNom85tKOHH+EclWA6A==
X-Received: by 2002:a17:906:9fc6:b0:ade:9b52:4cc0 with SMTP id a640c23a62f3a-ae057973159mr14369066b.26.1750361882019;
        Thu, 19 Jun 2025 12:38:02 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae0541b719fsm34386766b.128.2025.06.19.12.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:38:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: hwmon: adt7475: Allow and recommend #pwm-cells = <3>
Date: Thu, 19 Jun 2025 21:37:46 +0200
Message-ID:  <77895aec937b6217f513d3b12e7945f1707fd906.1750361514.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
References: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/4FUKzJGctfh4F0xV6RfSXalAyRIePr7kz+uFmRa8D8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoVGcOLupelSkrmQjV6M90KjftqVREBMjymX2NE FYbmeD8SOuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFRnDgAKCRCPgPtYfRL+ TiYpB/4gIq2rQz2gQtCu/oAre9BDqpnQM+7a9sStdUsaCWu9tgn+biAyDMU8ogazmQH/CcPrwmS 55Fxh/lS7BGRga5T0tMxWuM+5pbaNmTY7RN+3ifCVpC9LYoS3Au1fYhzcfyTML8+0toS1bJZoVo i6zC8fnW0Vbw8Z261EIfStmLVu7HF/P4cClUu9U7lQ8fbA9NPwF+2G8cwJ+WkOoSX1wvXfLO7J2 98BsuAaqS2XpN4W6dQGOlAt3kgFIAtG2ykP/xKTvOMGzoVLGN1T3Ns2gqnfSq3L4BskcY8vwf13 9fXlXocxH2Df6xmwCljE+O0Fu8LmE34lDg1pnPcZvEAvwODd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

To make this binding match what is usally used for PWMs, deprecate 4
cells and allow 3 instead.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 .../devicetree/bindings/hwmon/adt7475.yaml        | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
index 79e8d62fa3b3..43e9fe225870 100644
--- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
@@ -53,7 +53,10 @@ properties:
       default: 1
 
   "#pwm-cells":
-    const: 4
+    oneOf:
+      - const: 3
+      - const: 4
+        deprecated: true
     description: |
       Number of cells in a PWM specifier.
       - 0: The PWM channel
@@ -68,7 +71,7 @@ properties:
            - 11363636 (88 Hz)
            - 44444 (22 kHz)
       - 2: PWM flags 0 or PWM_POLARITY_INVERTED
-      - 3: The default PWM duty cycle in nanoseconds
+      - 3: The default PWM duty cycle in nanoseconds, defaults to period.
 
 patternProperties:
   "^adi,bypass-attenuator-in[0-4]$":
@@ -124,15 +127,15 @@ examples:
         adi,bypass-attenuator-in1 = <0>;
         adi,pin10-function = "smbalert#";
         adi,pin14-function = "tach4";
-        #pwm-cells = <4>;
+        #pwm-cells = <3>;
 
-        /* PWMs at 22.5 kHz frequency, 50% duty*/
+        /* PWMs at 22.5 kHz frequency */
         fan-0 {
-          pwms = <&pwm 0 44444 0 22222>;
+          pwms = <&pwm 0 44444 0>;
         };
 
         fan-1 {
-          pwms = <&pwm 2 44444 0 22222>;
+          pwms = <&pwm 2 44444 0>;
         };
       };
     };
-- 
2.49.0

