Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A8F39A07E
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910920; cv=none; b=WYTjFEDt3FvYCsGRxITFcD3xrxN/MbTtJKWRavCnVvAWcu7NFu45W7VhECXVaCfFYS+zZtkRWUEqyyfn94tbZe7MyVBrlVNLOLm87sEzc9BkadPcGb8SoLg/0qqibHPZjf58YZOVqnMiFRrJK1WPTdR29fiPhrPfV2hRfnvIF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910920; c=relaxed/simple;
	bh=H9cY3HUqGT9SKI+YapI58fZaNOQJ3Bii6JWiY3YZ3sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLHtRgcL9D3X+806jj+7VJBYRFS8vfMlHBXHFLcFfHecRCPNchQkHhCtZRqp/NbbXsh5Dw/odIcp1wFWFmolY5iqgTaLHj1Sz2Yu6aK3tTZ/tAZ3xmdLDB9XVplMfNzO5rQQM0Wec6SToiRAbdRcF7jvEXtJZ9PsBhBT8Eu9SK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahmab0ox; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahmab0ox"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso833374a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910918; x=1788515718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkZTYKwU4CakfzDfQMMLG1JWh0tvz+y04iItJyhiZG8=;
        b=ahmab0oxT8Fa6k5GNQSMwTjCqCY9Oc6v7Tk5JV690yv+0YATqCa8Yr/9eEXhJFJ1Cd
         yUhwWK3EDEoGU2PZRn9pjuYSuscyzz/TPybdKIXvlbeGNhoJJcBBPjxM8r/kHQGC1T1H
         z9qYUuZhpDSof/UsWlE/SYok0PebPNrC7EWS+vfrQBt8gJTc5iVyhwEbdk24fk/RdmPc
         EHaAHytu+r6JuaTllP1UHCDn7honIrtv/xbX74OlW+a32+W1xLrZmciTZwjBZ9i6K/gE
         +hL5lGtQ2c3ReWYscp9HV7XfeOQN46H+x/XAAE0fW7Hkn1CKCWU4b2YaNyA+Dg+UmLjG
         fkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910918; x=1788515718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkZTYKwU4CakfzDfQMMLG1JWh0tvz+y04iItJyhiZG8=;
        b=reFI5GpXR7XdJglOt/M6COsrVl23fwy2JImNG3YKSItZdG7uZogS/hoWFooarFVlq6
         Cgau91i44fByAfMkYHQah6ei0n/ZSgwKmXkuNPO2S0rr9dQWXRRQMxdJJgBeHPmhNv8a
         wKprdahH288uKjPrfCIDyjpXRlfsGx331ML2IjZlt5mlWQGI+wJUbpMju4fPGUbcsezZ
         cdoSXP0TbwAwSaMXy4x5Db6sjNireT7y4JQLZLt4SjgHGnxmRSDJVI5RF1Ca3x0jjslg
         HxhkMO5v0lbaRrTkkyB0Gp/aJ29xIz0uo+4Yt5UT7gcZ3l4zjhbO5Dcl2MbIrFv9X4rW
         qgwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYa1GjfP9/driKTP7wJRS9VRmYpEyqRtxBUj2Y2xIjh2EQdTr/Ly1/zCK4clwMiV9ghsWXWlYR9Lmijw==@vger.kernel.org
X-Gm-Message-State: AFuF++mF82S5q9lOdaVj07oZ+NEMdQwObmtPKI6+62y2crvtf11BAp/z
	jx+ACO6KOXgNEEi3MnJHU0ewKonoyH8myXwAoCywh3rakrR2NxUFSQfl
X-Gm-Gg: AR+sD10FR4JfquUll1N7qqJDkcQ3zjR+A9uMnlbgqapnL4sw3FffxLdemRL1xwUs2k2
	rTPGTgwAV2IBPKNpAlO6q6i6EWIiMa9EzIbAqpyzCH/BOnDE+9ITtXumtNX5Dw4wseWhnvRq0Z4
	YvDTiiIPrmFDK14uH29n2Nck7FhSqtBC84Zt3rVJnj7NdC9az+odOxJIa8ejQnt8Q43L4gvMUwm
	t+Qf6UIHeS39Y1jGqVWlyYSfl8DXW6xX24D/0wCn6qs7zYtWc/mqzNh/B0xYE485hrIrSAxkAqN
	mRLpCh/NVppZiL21Wh8t3lp2Mmy6vQLvQEhxc0hvrZECIkub3Q6tcskByGYZxaMSOgu7K//sJP4
	gNw7uReH5eyfSACTXWX5RR8Nybf/pwPWA/zoiPoA9AdP35ZWpA2So06NYCSu0AToNgxQp/QP5l2
	5N/FKHzkenXYABXIaEtibTLELDSyqC81fWvw6VwWdF9ZjCYNXEyXFVMFlqmuZzoD1UqMWURGluR
	U+1ijahKZ5j81jsuj8oQBYXD9g/PLvGBCbJHkIpiMi1MI0hFuiw
X-Received: by 2002:a17:90b:51c7:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-396d0f52b2amr11522464a91.15.1787910917577;
        Fri, 28 Aug 2026 02:55:17 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm1872577a91.6.2026.08.28.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:55:17 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
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
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v2] dt-bindings: fix typos in various bindings
Date: Fri, 28 Aug 2026 17:54:59 +0800
Message-ID: <20260828095459.834657-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
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

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
v2:
- Use consistent identity "Zhijian Han" instead of the login-style name
  "hanzhijian"

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
