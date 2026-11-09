Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221377;
	b=i3+C+oi03e4FdsQb97SKC/5Q1S8zO+baWHbIOc1Y+RhuIZZXOi8r5+kU10MjZnpE6o6h
	 5o6mdMb43RhPRZoG3xmuqxl/hwI1/vcKsfi9GQ8UfdLz2jPfIHss4kTVD6MajuNf7A+U2
	 ofHBNyxKG5/gqQxv3g4KwYge4Sg/O+OLM/wPT12vtUR4t8rzbSSiDTFftNaW/ibfPb6f9
	 hjx+mBclJxhhfoW/DydmIb0OYaZurwn+wWmv9SRhELcaMJre1LmtaW58oXmcufuHXBUTQ
	 XrxbMC62bzqQm5Kh7sTA233jTO6E26ew2Kn1vpddTbhQNPzK2eqtNVL9Rkb0OYst7eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
	b=tXAiIPZ+q4XUr42OA6Hhqu9nferDxMTcEchPbuEOyMtNxKkDK0Y8FHt82tSS1IEhqLre
	 l/EkhY486iGpKPCOSefvdYEMH783R6wneuul8S3Yt7dZ6NVptZ6Vglj1E7l6n5SOPqKMk
	 KyQy3re+Q+HDbELjBgoPmdos4NOuROWkK+6KZYEDBL5w0AUwrVrKhnzEY8w/q35cgqPYW
	 vlHSH9SlcBmR2GRhZJcMjj8NcifaQUWhMmar1Dh6JatCc/QLa6V8/6hQyAj6azAuA7xli
	 o+WUe+pyJwujFY54ygb7leUCoaLlPkz5Ee2IjBiQRkcgmQTcMmLQZoUHYEo/VS5TGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99403606A322
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99403606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3292755ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221376; x=1794826176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=mhuvuvXX0rIaEIqZ3DzR1FBgAu21NuHPq7Q31T7dFQOqeblaWlH9D1o+q9ykUC+Z6D
         sfTUBtHFNuNKu/0W97XuHP23fA2bJkNE9yggNCNrR1M/vXLFuLRK/l+/fLLmYYPLiXSA
         d0xl8e8ZMlhvge/faXWUC8mqUhtRzeYCOJCc2xWMPAB5WHlH3Q9NzA6xDRWOgNpKRjds
         FZQXe5ciiNXD5CJBbKjeX9XJoKsKHtdSV3RKYWgG5adtQEhRNTl276P2PJ99JamMM5d8
         iHn8Z+3fmQOdLTzBDWrPh62ezoPUQumOtOcgdtc9VgPTxHf/U+cbZhNGnkiuuSsrDckI
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221376; x=1794826176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=Klp841DK2m2W0dir7+a8EolbPKtv63TO5mL+SkBM1uR6902fVQpAYhhGV+KcaxcLJY
         xNgyQ/RS7t7e/nPwIexuh5KVCxtVkddLdXdvKLI1T/gOrhW4TR86SncocUdKmCze/CE/
         JWlWYPa0a/gVLI+2Lu7k99evDgsq69Fqynj9LHrP+SNJ468GYaHgKYzCyVE4cEDzVije
         uAyPGoEHSjlS7vNStnx+AfZvtIOZRgyEFXPsZjEXTeh2QHcieSiaXUvQB2hZ/5SAQP+P
         ZDTZx+axy27XvsTd9pkrQ77sqHK0VfIbi/ArjfUP99fE58IIQq1A3aeT1SNZuuDsa+M/
         xRtQ==
X-Forwarded-Encrypted: i=1; AL+hErG8mJTmaCTCq1QPlsoUdj9AfB4KvJAruXLNgtreRNIPMcNkwJJkbVfWpulfXrzUu4yUyaJNknkxh5v2sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9NoqazMjK5OqlRtJvq9Wv5lyP279T3UHDfv3jyfGABSaoD7MX
	S195ZPXRyQdCAnbdL1A6zEovM7Kl1SwML1AzyoPpDSShMD2V5O7dOZDL
X-Gm-Gg: AYBFou1tL09aKUqLp8TZtAYOMZClJjlAWgzg/JVxbMWizgYOBSqYky2v38uMpc6KZzk
	ZOu6kX/gh+Iyl55HUSpnWYelrw+7isBWW7ARa8KZVuO6F97LXv/mA2J2vB8SZWks8/OIvbelgF/
	vSshZoxiiEb8Y5UZM6ZnFDcBSoMlm4LNZvp4EP11ThrokYtobCMM4MOdNKEOpecYrIqsphCUSrB
	yFoVoKs3vWu4pVixxIL50gimocwHQk1J4NmI+GjYC59KQBAP5b3xTlk9YjJcnXQyjnYHR0/gF1i
	pbE23fBcEhXe6oiek3FHzZ+WjzRx0tAFWsLTC8VsvfKXreTlU/xgC5vuVzqCCR2jx8PGzQnjD4e
	L9LPHrmt46Ubuh7DmVzZIyYkW2NAmAtTbZaOX7BpPJIxbED/vvSkH/nrZ0jGSxEIP1iZYwXWSLN
	ZkmKeG6rjwHsot5hkIvVPStVhgdOoUATplxMDb60DJ+X5Yy+VGIS/RCWf95lyijuSuMl/W3Chko
	vKqurzzruLu85lwl/DU0fH/h6kGEgUrf8+6oW6M51gp1rt/D7LdrHi6bOQztEzqV3Y97Y4q7yHN
	uSW0ecVv90L/NCdTNruDy+th6Nzy9amCYgl/FM5g9XqpB1Tl9mvMMUPAzwGFtKggvYa8zNXsfrZ
	ngxQrsAFDtcN38ef0zx+V+F9swlzJXzKTJVqor5pS72/Yd1d/TN6okbHJ3TKjXQ2P5lg=
X-Received: by 2002:a17:902:d588:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2ed8375ffaamr41615415ad.19.1794221375807;
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform: arm64: HP OmniBook 5 16 embedded controller
Date: Mon,  9 Nov 2026 16:19:12 +0530
Message-ID: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
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

This series adds a binding and a driver for the embedded controller of
the HP OmniBook 5 Laptop 16-bf1xxx, a laptop with the Snapdragon X2
Plus/Elite SoC.

The EC sits on I2C at 0x76 and takes commands through a mailbox. Its
protocol and its command and event codes follow HP's ACPI methods on
this laptop. The driver exposes the fan speed and four thermistors
through hwmon (the thermistors can also serve as thermal sensors for
skin temperature zones), the mute and mic mute LEDs, the keyboard
backlight timeout and level, and the F9 and F11 hotkeys, which only the
EC reports.

The board device tree that uses this binding will follow in a separate
series to the Qualcomm maintainers.

Testing: the driver has run on the laptop since late September, on
Qualcomm's qcom-next (7.3, latest qcom-next-7.3-20261031). On
next-20261105 the series builds with W=1 and passes dt_binding_check.

Rahul Pon (2):
  dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
  platform: arm64: Add HP OmniBook 5 16 embedded controller driver

 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           |  49 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.53.0

