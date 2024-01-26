Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002F14265
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jan 2024 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706268601; cv=none; b=WgMVWFOKNV/qYIC/aILqBGXqCVyIjN0mLEBjsSKCeOF/G8JpoVIqMqwoSxxSUEmaHeBZWKPOi+4vcf7Bju1vwEh8IqfB2/awSmbt7gqy0NVYnl4MriDuAwCQUrMQS9ngWeH56qf8HziC9ZWgDNWVWZSqASW0Y4WN9n5oqjMOuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706268601; c=relaxed/simple;
	bh=kk8TW/ENv6T0jmFy9Fe2+TbD0NwhTcZRKCATFbVXU5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdtCvL+hGbe+g9yYiQn86rGBPT7k7IldAjAJ2RT8iNLsDQYvm6OO7Tm+Ll/l0yUfiyfoRRpHq0apzELn86zT1s38Ljh659Ur3GzcHw5jm6R8qIFMrqtpBz94gcHm2GPfiEdNo/mgQ/aoix/iMYq7uxt0/qllItiarZzMoUpTkF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Iv99MF2k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Iv99MF2k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e80046264so8562215e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jan 2024 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706268596; x=1706873396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MpsuS1RISyLieZhG+nOiB9EUsr5IB8MOc8CVenn3tg=;
        b=Iv99MF2kSSEJGJY2SZq2G/qhZ0/3ytHYOkTRoy7bzw7AkwjNpKKDqfMGQNonCVsA2X
         RqdrvIfrbei+JIgmhpGt8y+ctkgE6mOpx7iA3VDOrH8M5pph3NGH9woIVbC1bAculiBw
         rX9Tlhs6NW4fnNmzXcLeGP1kA1/x2/0o83h3nHrhkLnh6W4Fpf9KTuxbkFb7dUQG8FpK
         qBXrWHV4pM0kqK30Sq8SeFSAg3lG96cvpqysCXRIQt8htqlWcGPR55MR4GqyOUr6IQSq
         Oa53djDYl4mCUwwNOL+b82DtaQh8gjTkx0OUiys+J+knfr/HpEOGAAsN8Hp6+A/Nciv/
         BFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706268596; x=1706873396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MpsuS1RISyLieZhG+nOiB9EUsr5IB8MOc8CVenn3tg=;
        b=cEvs0ZHD1LEwEUVk26x3PZvXmZ6KZNBXCRLfWnTyCHxhRsSDiOFuH3a7yKv2JYOtNj
         xRHekhqd9y8+JzLsqnUW2c9TGfLU36V0tFZkMFzoJLPhIQRswIaz3o3zra7V0U4ElNrX
         Foq3tmD430J/zhoAAMARgtPgG2dTf65F59Y343s5lwKEI975suw1Xs+uWFmq+OAkOl6z
         0etKIyTOZ/6aVJxy8qlIiTuX2VBzT1DeGcxazwfTUJ14D/WHoJuNxwH1Zp+rHtCfoITa
         BEYznXhI1YXj1Ekbukw3+6Q8ZappDzhAxA9/0gOG7A79pDl6WQexMbzyVOSZhwKd9h3e
         SbkQ==
X-Gm-Message-State: AOJu0Yw2m3HC9g+bhuUqQ/NgVYysgGmMb0iHRtnZ7pAieZqrp5BIe33c
	jhHWJmY1gITMCdjmX1yfts/zOlSLAI4QLjbpAigSusksRypn29ufUHfwOmbr0Fo=
X-Google-Smtp-Source: AGHT+IFZgFs4WF2KSb72kcILtaARumCAGosfYJuXqhmjqYlE1W8oA4FFNJfIo+it28R8yLf/Ude3eg==
X-Received: by 2002:a05:600c:5247:b0:40e:44ad:4645 with SMTP id fc7-20020a05600c524700b0040e44ad4645mr810415wmb.3.1706268596440;
        Fri, 26 Jan 2024 03:29:56 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b0040eaebc4e8fsm5523313wmo.1.2024.01.26.03.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 03:29:56 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Cc: mazziesaccount@gmail.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: tda38640: Add interrupt & regulator properties
Date: Fri, 26 Jan 2024 16:59:44 +0530
Message-ID: <20240126112945.1389573-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add properties for interrupt & regulator.
Also update example.

TEST=Run below command & make sure there is no error.
make DT_CHECKER_FLAGS=-m dt_binding_check

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../hwmon/pmbus/infineon,tda38640.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
index ded1c115764b..2df625a8b514 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
@@ -30,6 +30,15 @@ properties:
       unconnected(has internal pull-down).
     type: boolean
 
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    $ref: /schemas/regulator/regulator.yaml#
+    type: object
+    description: |
+      list of regulators provided by this controller.
+
 required:
   - compatible
   - reg
@@ -38,6 +47,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -45,5 +55,15 @@ examples:
         tda38640@40 {
             compatible = "infineon,tda38640";
             reg = <0x40>;
+
+            //interrupt-parent = <&smb_pex_cpu0_event>;
+            interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+            regulators {
+                pvnn_main_cpu0: vout0 {
+                    regulator-compatible = "vout0";
+                    regulator-name = "pvnn_main_cpu0";
+                    regulator-enable-ramp-delay = <200>;
+                };
+            };
         };
     };

base-commit: ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
-- 
2.42.0

