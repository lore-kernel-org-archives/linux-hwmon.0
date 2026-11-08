Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130589;
	b=eBzs4FnKs1WTAnH7gxYNFT6Kx2QZ8VpbIwHELU72yiRpNrHtdR36Hn/jfte8mIvs/YCa
	 ftd2ScdhBSwKoBYnU7IWMhGg6X0nujwDcON+9Owi7at5qc9uXM3X66BJ9nXyOsNUucQDO
	 I+QbZTTG7UfRs3dZ4TKWGPUuQf3/zF36FGBGlE6zidI4AnKck4FHtbYHStWjGuxQVEKbD
	 u2UFozPMhYuWubWT15oflTyar5hUco9UhiO8aRqYBirhK2RsXxqHtXwEOo8UzddYkcGOL
	 ZfzEQ1L2ASmGa7j/TEtU9FX36RuUa5bJTFSQuDz6dcjPxM1+kf7qahZ6+NjK39iAjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
	b=AtW3XPImU6xFU0TYwXvSArNQVDrc3TnpYNJFk8jsHBigWHgo2m9+8Xt79XIf2GNA9Swv
	 fOthDh4qNiKEFsxfharW60bdqVPIzpyVY4eFZL5/bxajMOVUMSSVlII0EPDxaRMie/V4j
	 qelQpEvRIJ06SgaaBVvRY77PMwwlnlvb9K+sbTXmRyZD3paz9a94iL8/wnPJmFDgK6cQk
	 LrODuxLnCApPzyPA4H15JoJyWL5SY//t6us/mOaN4aahZSXMBOsjQNtVklbjPK4fITCAn
	 Z2yjzlED5Ye5d5BZHhFDNsHs5JlVEAqAlqtPJdTlzJ9Iz7Dmu8m+5eV8jYrNRMTJ3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eL5zqJOO;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACBF606A320
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eL5zqJOO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1224775e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130587; x=1794735387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=eL5zqJOOARgwAeZRFDpXiRsgR9hEN4hg09+7A+7qbkDObfGuLgBVmATW2/FPOPJL4m
         xbpFxRD4Ux2lWfJFSujF9lkj9iyFKy2u3dtjHSMlNQev3Q307jC/VLPtpBAFiYST8opR
         pys5iKpT80hWYq1mcF7KHr0FKdebak0ZvlC+MXmGq1TxwzEur6BUwMLlWGizBzSGHwl2
         oV2gIeWoBYjVIAATVHb7ZAtVV9/R5CPOaViz+Vp55Ctl9w9wmPxz39hVkhlR2b+sAzdK
         qXU7o5BlzMGLm5YiDQiv2Q5yJ7JxDNqiF8trC3z8utebmHcYTtfC6zFaDqOqz0MoKAZK
         2SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130587; x=1794735387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=2NnK4FIkYyZVhBO5Tck7TuLS7edZbh5GAGzzb/D9Sw1jbZjpKxiJjhx4utItMDnuB+
         f+NkeqzCnTnEnXfTFmlaLMG3LpvAxNsIaBvIVG/GfP+PJjcLH9Pmc0QQyN2SG1wUsPHT
         6U8Db8IQ4GWXBgkkCdD/NQFr3rohBAx/b2/CZl5DOm4DU7CnH/hzM+q6j2mK8q67JJcS
         OpBgkI/YcRepZ3zgYtpExxUfRFHPi4YqGKZCpTkNA81D19/gt4BNyebr4B1LZJafsRm+
         wi5tJ66Ho9XpkkKZjkHYy4K/Nt07wuHZ0n4x6eMpj6HomGgH26MvdS+vcRz43UAw0Ipu
         Nhzw==
X-Forwarded-Encrypted: i=1; AL+hErHDE+f+ReKf4V6su0uo+wvGQEr4//cDCu6Zh4W925O6ZQIz+/B4jplX+D++zb9Pfz8HlQm7smrveLuB3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z97iyVVtucviIwtPCRkYMRtlIzDVaMiDx179IrJY/R/fy63Sc5f
	bC9YB0iQubTNg/BHIg7NiwnrJnF2NmZGfXVrARsoqEZ/bO7Nj/wCIAXq
X-Gm-Gg: AYBFou1V8fGkpl7c0e9shj4FjODeGUsMfK3kfMO6zchQTEFJsbk0mTaW1InqPwsFp8o
	5XbyP1Iry6t4NNgpBx4WEC14Fjsw/nHznC0ZPFkZf8UBEMpIYEemsJvxPjKPMHCidFV29eB0xzc
	dmfE5vo5kFPt7Ds6tnonXEMupONbzU4rSaOsLFxNYVRk8Z6bK+ia+RajabbJEJt1/ncurOsacYP
	t8/9lRoOXLVg1qSu+5r36GO3Ki9NqEawx1b65G1d2j86IOGfw0sLYuvzW7Zbgwky16uchaTPVUE
	82C3PRxihJWruWqiBER0xAbuCWw7YCb+3hZtAY7aMPNGhxViYWNgiKpVZzCO5feFUejf51L+LPI
	+fd/926vtrl33/go/AXr0gAbqW3QkckIwn3zVIZEDNk5LLlWFumNjM/yEcFtgCwICtNkM8ezCiw
	QCwk+ChUd4qE8DHO683mkJxBJ7Wr9d9/heaAi4e+9x1ndjGCmxSmTcdCjolhRDddNBABtuaBa2m
	rOPk5VXM/IFU7AG6qaNTK9Ev1kxHA4hAHvaSphNFEnuZQQhWGGzDaiqf7/IK8BR869VTdOVBTYZ
	ihY4pNs7pFaKo3nViBn3coKmGQZus0ZKk/AMfD8W+7aECQ/zJHhYSvPidJBCvDI=
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr19923505e9.19.1794130587155;
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:26 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] sy7636a: power the panel only during updates
Date: Sun,  8 Nov 2026 09:35:57 +0000
Message-ID: <20261108093602.329554-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver.

v2 patches 1-3 are in regulator for-7.5, so this is based on it.
Patch 3 touches the regulator, hwmon and MFD drivers and removes the
MFD header, so the series should go through the regulator tree, with
acks from Guenter and Lee.

Tested on a PocketBook Verse (B288).

v3:
- drop the applied patches 1-3
- new patch 1: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- patch 4: explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (5):

  regulator: sy7636a: don't wait for power good if already on
  hwmon: sy7636a: fix negative temperatures
  regulator: sy7636a: bind to the I2C device directly
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |  1 -
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 66 ++++++++++++--------
 drivers/mfd/Kconfig                   | 10 ---
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 90 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 ----------
 8 files changed, 99 insertions(+), 119 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 2a1984b30e9cfcb306a076cb4b9e68d71daeb45c
-- 
2.52.0

