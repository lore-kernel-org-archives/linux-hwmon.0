Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572302;
	b=0cJsmJ1BnXzMKKYD8/4ycrxJKTEbCLVkjUQyqyBqIRWTMd7PAwbB0MQVePyAuiy4q9lW
	 32zsczi7E8zegLVDbh1pV2whvLgBkiCxEFi9mIPWxoz7QXVeQoAkScZmxQgKPOnsWqPnP
	 +wL0o23HlxCnZSwCauZfqI0arZb/pJ8Cmlg+Pb8nnb1YzO+IiWCmxS9NS3oqGbVLx1vog
	 jSv6VL2CVrArhBqnsWz0z5EUwfNpWnXj7vg52HhXB69BuDwN7a5DIyJHHch6yvJBz6jGE
	 ahoRWGgWhgOqBX7f7u2xxrWPmpBkg61j6P6/PnByYBdqg7xTjrToQQ0rakc9SuvHaJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
	b=AXbBbzHncJToM8TMvOFAFGLq1D1PUTjh8cH8Ah/4y5hUZhvnu+O/4WsLyJWGdzOihC9H
	 sRb4V/CGltwvsAGPVi0/3V4PLyyM3asJjtsBXPRPj3+QDs8VFqyTFVvDwWAziDZzdki8I
	 TcG3Xa8JRU+twT5dj2N1gLC87UcxWr5QXm+TOhTcBE1KdfJ9COcgY1WOa80XwgCWL4eCx
	 YRszBnLaOhJ61M+55mXxyhiP9eker+yn45lCirg86vREmcN2ftKq+844U1XCs0op8TJAk
	 nZuVBtZjsnUXbJ6GOkOJKXHPJC1eyQS3j6P80ziMBRgPUqv/PKMJ+goNfXPv2q2p/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBTGVxqJ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3336E606A329
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 22:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3336E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBTGVxqJ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1637296f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572300; x=1794177100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=ZBTGVxqJFFDmIek0+yuUIMEyoEuB0mjK7eFmVyKez2LsvkShIxZczGNHn8ZJ7RI2a2
         zPmsaGsYiPrlf8d5c9cxzTZVOKTnOjNT5tvmVCu6aIwiiyLtQ60tvFT/BDKoX6LgOrX7
         IVeAcE7TtzMcVCc7vWAIXKR3VwuValrli4He+1UZ1n37osWH8vjJmn9dNxpwmlCcQmZD
         jS0HbdNEWLYOJFB8NnnZx5fgEvfWdfBT7s3vlFHl8TNFlL4wciUahpLz16c09m9mpzBm
         5cPYQiwVLTwogadbm9kPvTUfYip4Imu2ZmIJL0/ZfzPxVniJyK9dXSUTnPLT9SsvNtUq
         O7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572300; x=1794177100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=1VPrk6vsn2g9gILJ4C5h4lM3kMqf+6qiN+06Sng2Tw8TCPyhrcI8BQP8i86iGRg2IM
         1Y9hfTdk2aV5p3fkPPcO/ZkrUz7IFvIOZHuI8d1gSePz+NkB2HuRADvCU8VrioKTiKuJ
         kn93hZJhez1T3fCXjAMe9VV1/+ZNu2MwLeLziN9fhw0Uy0jiBwE8q1ru9MEuR/DtCyel
         dIPsk8WaKYy62gWJRhzOKOI7R0Hsd0Y86Rg0XLJN29UYiZV8dG0U1zxem2orLY6EBftF
         ATCZQ7l5x3a7cfjSHjFa1pY0A8iTyXFAUcnVT+1nz+DaUTqyyqrO3I356Kw4IUWvLFfI
         b9ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzzP2jk+m4+hr2Re1GFi7pbcx+fY+l2gFscpt8hulc09iNpqHBjQRcv+bZUxbyqTdakoPv/CbJ8d5JKHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/M9E1E6ly0xu3reloHPxvf6+iGYs0TpR5WVbAHP+xceKS1owGV
	N/6KpZYL5vONvXkv9Ol6AcvExLizrsJgWL25LHF+lkhB+aVPSLciOs9q
X-Gm-Gg: AYBFou0GD5+4RaAVD5oeoqqqsWPqBcZda8seXfx9h73zeckWtevcu/PTVyk5fhQvxdA
	jHGynNLRaG4LqLvI9q4s6d7DIIpeaY8QZzcCcoYpGmXDO0+8tkUnStlIpayx/4MuNPKWe3kO/2c
	Zb5CIHDPTNyQ0ZgGYdMKAX+O9ZU/ZbMZLe7qTiCoZ7LPqEH+ktRjxAK8DrZU7Tn339zeBPCsW98
	ohU76vMvYQ9cF8CSQ7SVuiZHDlk9Ic32cFrXr9ETbxd0Wmhj3jbopjlvUMZkrB5EYsiLMKZk5Qk
	jQ9VwTWM4B8i3ZqA3ofZvQ30RDYoqxQgSBVW3MjGlekIN47v3LYXuq/mvkrKGSf4dXR2o0Ivg4b
	ZXaTdy+Gk3RqJu51ok0XcXYfc7kPeUOiyZR4rzxwT7d7XILYmMvOK7rh7nm5YbOZOis6sf4xkOO
	7rfIuTUT9g246cneHG80uHtOeanT875xHBynXbjay3R4Gs7YQB4XqMptkKLT3E98PWOJHKpWN+Y
	acHhQgRVNM8lBgXqy61yB1entsauqXI4a8Bcv2VeNraKUWRFozR1c2CEfEix54xUryJy6Qhd5j2
	v/GlZ2NwgIrmYHf+2ZGZr+cmexDI2t+w6IU/wT5G77lRD9/bTTURe3JNwivkHMA=
X-Received: by 2002:adf:e001:0:20b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e6e2bc855mr15509231f8f.2.1793572300404;
        Sun, 01 Nov 2026 14:31:40 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:31:38 -0800 (PST)
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
Subject: [PATCH v2 0/7] sy7636a: power the panel only during updates
Date: Sun,  1 Nov 2026 22:31:18 +0000
Message-ID: <20261101223125.302001-1-pmazzini@gmail.com>
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
auxiliary driver. The regulator also gains VCOM voltage control and
waits for power good on enable.

Patch 6 depends on patches 1-5 and touches the regulator, hwmon and
MFD drivers.

Tested on a PocketBook Verse (B288).

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- patch 3: only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch 4: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- patch 5: no VCOM enable at probe, which also removes the probe race
- patch 5: read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (7):
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good on enable
  hwmon: sy7636a: fix negative temperatures
  hwmon: sy7636a: read the temperature only while the rails are on
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |   1 -
 drivers/hwmon/Kconfig                 |   2 +-
 drivers/hwmon/sy7636a-hwmon.c         |  58 +++++----
 drivers/mfd/Kconfig                   |  10 --
 drivers/mfd/simple-mfd-i2c.c          |  11 --
 drivers/regulator/Kconfig             |   6 +-
 drivers/regulator/sy7636a-regulator.c | 163 ++++++++++++++++++++------
 include/linux/mfd/sy7636a.h           |  34 ------
 8 files changed, 162 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

