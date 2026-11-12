Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516785;
	b=Nk9+WdQQ7lC8tpaZ/EgmVuygXgVwhZ7/l2DoIp7Pncq85WAjBJPmVm00zsoR5qRs2SXG
	 bQsGU1YFLC7P0rhJbkc3g7MGxFcopMKJB7x978RoNKpl2Sjtu8zwulGtamNTvTR/eObnN
	 BxfY6gN/4v423KfzMhrip6H0/u9Y+USKO8/Zs3OPLfJPRxNFu0CfYiusLgVEKTCPzGL40
	 c+d8EzskmFr8lmGNTbJuX+p/bpEypZ9zbFgmTnn1GnJA/rEmTDpxKP4+LGWR8y6F3i2Ua
	 mEDOrTUOjrBLeebh5B5LFFPpzBrXtZPDKsy+FVor3cIjTwKkvFSLsGl37pjTNVEa1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
	b=XzC1/l8o7fqD2CcM+TvNVomcUCaCyiqo2ZRpI1aPaXERgMmWk9nQpJ5oHbg39mW5Ta1Z
	 v26UKoGaVMZnXUoG1puaSvvUO3RBw2GqtVBIS71m5S7ClmhFJfMPfFxwyz0DW3OrS4aOV
	 LqSjrICOoKpDavr/Wdpl9gX4xIOp3bFtze0UZ2b2xIu9J+tk4F5Z8y+3tKZ9cgwK7CMDF
	 eFIvA+CLrE90Olhm2GbnkmFkhmEig/491haMde35oCrf3+JLgslxNVJrAxU0pOtyjtdKP
	 6ww4fAzK48oEJ8QXfsjslOdil3VKUquYcWVoSLCmyI2djeAb8palysHpD94Y6gcQ4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSRZelkC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E323606A323
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 20:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E323606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSRZelkC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3130765e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 12:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516784; x=1795121584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=WSRZelkCOScvaAilQASb4Fa6hpipGTcmN8pNyw1WWmyAy1kM9POtIW/MCBoX3pM5ss
         7DDXA+7IP/HMOWxvPDX8zdsUzaQbirkfovoOsr4JuXhbBXg1dApcTsLpnqRI5Mai4Bvs
         EoD3b6shYWROH+YT7oCeK1wb4HRx7PWaQ/EKRbpuKuc1ENzv321KHbhHpkpYFQex8Xi7
         VRlKGh5wAUS3BwnWAfh9Rvc2dPtsNvWJQ+QczWdoDcD/XQuEP+S/p3SZpFcgLH2LehRT
         fLkxV6TU0yFBE7WfooixzrliqtyQM4V6PxfaRQnWDRhkMicEPKr6cwSED8U5ptBORcin
         6MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516784; x=1795121584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=tpmi8TI95Rt0/6cAMlQ4vfKLZVSQGi7OQtXKGOMoI1097zhGMYFqe8uZVtDaYQDQ3o
         t8nVaE/0/SU244RUvDyk/1a4KDJVM8pnsqhb6SiGw8ms5fRGgTAlP9k5RV24eW8htwpo
         hBJ8oJvvU4D8+h5myOUBxzeyFsantx3rvxX71CzKO6qjaUDw2/qHdmUOlCh7E8mujy6U
         m1B9vpptulWrXEnxQCC97sbMNSThHQWxVXNZRaliNSax2+DrZmSf9WQds3IwIl32zTIR
         1kKJYCeZo3TmdrJjlUI4P2UhLk5c2tBFoPdU0WfQJUeEhhk2kP8dgQqqvR9JqUUo4jwS
         Ws7g==
X-Forwarded-Encrypted: i=1; AL+hErHCJnYIQ0t1Ut97nmo8SPwg5qSRKWVsCed78+4QHIzAHmfaffVjqjTwYUCQ0lUrlhduCtbI58ifpv6acw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9J/+aHUbSz39ZghVFnFsp0M4wiXDlz5CVuxoLL5cr6LEeQDoad
	itcX9iK7YCt/fToQq41A7riYAmgUg+2oYlKhn/vG58/J60pVNkGsCVJB
X-Gm-Gg: AYBFou0lUrDeYBKa4FDx+JpMAZNsg5YSeI84+2CtwRuIKaozvzzDmxnUOmufsx/Fta4
	y5h5imSWkVFWGo9ALVjrorSmDFrE6rQ9ebaj3diVyaScaRtN40FE3E0qYcgKFK6ZlLBdMxTm5qR
	w/ceGeAuvXtTwaV49gLapH6ucKlsmgNF/fHpILFAvaZKwjc54WeSO3sFLHs7wQm4Q2+NUN+HnK+
	ZgbP36U7W4IpuTF5+sRqJnFYp+pwTnniiUCw6vyf+Juyn4OjSO7k13kZi22IdUo2Wy62jQawi1M
	pgqkbOFoDND/NhsiGez/2i54mTznuMbxmvgr6lXE0Fd9fa7loWJiNv5dSpwqbTGCu7IWXseX51Z
	yvZCYr6QrpVSR+DC4Al0U89V8XINccnUH7lymdZfdYmxxzY3WX6j+mzOm8IheOiLgJicPBR7KY2
	/eumiXtnFZlhKds7qjuVl93a8Y/XBcY96IbUXd9sN4sj6DBHKbQ2JlWwqI1UHLHhru1k6AKzWQS
	AbZO1U//VW0R/xUMVujOXaE3x/Cp8tvhkPgQIOMHiHMkfUSdkdM/hw5fnSXFYQV16gUhJUGzCSo
	gVigq3UuTkFQ+iVKiyHx5zlyioK9sKnp/PoE/fKlwjjT8jtolU2mpOa77WeunIM=
X-Received: by 2002:a05:600c:46c5:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb55a9b453mr8505215e9.32.1794516783607;
        Thu, 12 Nov 2026 12:53:03 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:02 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] sy7636a: power the panel only during updates
Date: Thu, 12 Nov 2026 20:52:26 +0000
Message-ID: <20261112205228.42630-1-pmazzini@gmail.com>
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

Read the temperature only while the rails are on instead.

This is based on regulator for-7.5, which has the rest of the series.
Patch 1 depends on "regulator: sy7636a: bind to the I2C device directly"
there.

Tested on a PocketBook Verse (B288).

v4:
- drop the patches applied by Mark and Guenter
- patch 1: keep the hwmon name (Guenter)

v3:
- drop the applied patches 1-3
- new patch: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- explain in a comment why power good gates the read, and its
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

Pablo Mazzini (2):
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig |  1 -
 drivers/hwmon/sy7636a-hwmon.c        | 35 +++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)


base-commit: 89b552ff49551960b9e270feee888a0298a12d94
-- 
2.52.0

