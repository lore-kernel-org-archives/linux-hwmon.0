Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677992;
	b=ErZ1GAuNhGsKVRzTkKgrYWWrnxxlIvoZye1RplJdm3B1wSfKAX0l8QwdwXWPFZssvz0e
	 hCOsVe25vWLtrDRFlRydjEs/+WDuJ9tQs20e6G2Trl07FJt5KfGLJVoEamnfN9jWqXj0a
	 cKYf8yXtT2i0SK9aMrZwIyoKkT5mStDX5RVHgEbgkV25hUfkPuNM5OjZb+aiE4CO2BN4D
	 /CvG7M8BXtwne5TtE4FXvGbTgiswaa+A5Sj7HTU7S2a23VpgijXOeFpiR7J/StkNwcAM8
	 fXLqB7JxFK+ITJyKb7UIlM/NztxW7xtZUtHGGK543GqRBRTIkFXYlytEydRQE/cXHoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
	b=qXfsfxP3Rds4v0VZhor2pKd7ojeBdp3KXfqZFNTruuD13+/mzT7nGmWDETVIFzpZxJEP
	 87hyQcnJ+Bp4zhXSfllLO9yxbeCbVPA1M3lSoEjzTLvT5AEqRC3CBy97ziL1W9cJ0S3Av
	 vW2PpftKZcpXyBW6KZuFi1j8aiQzK8bmXB9szCISovKNu7RqxJ6N/eJXyDzS/Hrg7cQ6c
	 4xU8eceRglXiZtUfcLZTPqHP8b4wuIL6iFfyeBajB7KcPyz/cnMMo327swQTjzBbwbK+L
	 t8aWCHBlblwSP1suM6uCfkzLhXLi2XC/zsOHuy6/2PfwLQc4jYVi1H7wdP76Khb43+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD931606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD931606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b305d38bafso15399277b3.3
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677991; x=1795282791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=lTQSU8uVsfdWtv5lFWi8oI96fpZ7chFSLTW1MkdhL2aJM/YWp0P8h8pJQH3FsIMGuL
         9tqgmuPMG1HHCbeNdpj+ZsyiAA03hdYCisY04HbNyU9h8VomIWFukyO/rcQUSDYJPc4X
         v6Vu4vfIFHSXQpg3rzDf9M62DuDOPXw/99EQRXowFGIASxR278XNQg2O4d7JiXJjZ1j3
         UMapZXz6AavCH5LjAoySZTpN62kZ6eWeVaKyAfr7afZItxTqpHS31C0dC3tALYAASwmW
         OPgqMPsnyop+TOt1J35ozAw8FytaUL0YPubxz3YhO7TpLBTQWd0mkrjUJWmysRDDrpV+
         qi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677991; x=1795282791;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=ZbVH1LYuX6QSK0iJ0jtlkgqnznPDLiBrp1bnIttr5CGvlYPNKGPGPlcP11VAY7gxgz
         mQDL0OsCQD8xanAVIFvLDAEGbAu/70zhodwxgtgLTnFL2lsVGHmHsNwB2hGZG0dIi0TO
         Dz/APRnpnEXfuXMWWcmv7EXS7j8XN7F7rt6d8989xEY9BVYj4AJvEwMzykVeJq5aUf7s
         fF7bS5zGEItm8qzgmiV5sqQq7YcvRLXtVetdNqFNDmYtv8sNawVT3PIntzKUj+RQU/R5
         A4CGrwBeBwJA9FOKWrVSFwEFzlqxvh3+f4VISV9gqff+9Gl7ASe+V/FcY2IWEPvva5yT
         CUrw==
X-Forwarded-Encrypted: i=1; AL+hErFqsMOmhaAwHMe4GtIxcphjBokX9prmSzDsHtaJOno7abXELvxkz9TE5JEXep85FrzgTUBtEglmxiXJzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vldu2tfSyT/KwtCYFBYGgXrxzkj0n+h6IJoN1bsMWzkgOC5yx
	L/fr29zMEMx68JnPmXy0nAnf44dLO0pR+CeDvnGULU8PCCP6T1bOJkau
X-Gm-Gg: AYBFou3EkVu/EEot59JLX+KOMWAezXph0+bmVOJCFHHol1EegYBGCETaEZWv8pjm/lr
	NThRtsz9q30iRFLn+oDTvtR7MA/PAgZq3ovcWdTSdMLlLJ5E/3mkGb3WsXs35QwnrbA9+rxUduV
	HXgStVb1PVz5ex8tG/qdaKGgaLDPhY9g353EM1yIAshebKPDfcpxv0updWm39Jq33niGRdUFlsi
	TpGgGW3zras+QFPm8/5IxKYFaA2K6+4TWu6k6bxh7WP/xST4SEdXCs/xoEMAgZFflximjTz/g7l
	i2qNsDI06B5k11PE7ansYSAoEiqNjV/ABl7BCy4nGCSqu1znykGImCizD2r4xuXJG8AoNsAErcc
	VTMGesG1GMXyQuvGcCzHBtFjdVR43hF9fr/CtjYKC0tr9qByUhKVPJu/uqacIY146cnKXXLvbLZ
	dScFlo5sBITBNlw4dRIdMSwKnG9ogRgB22zHRkJve9NuYC+7lyeqKMV1J9CuT3HLScYQIbpZqKI
	jD7XLS4WI52JZye7tJD8XeoiQQAToas3rrk/5okJ/S0eDlvVQG25Wj8e7yyDszdmwT9U/ss1KfJ
	uCUuZV+SHqWr9mEXCqb2+mCcSprk04VirCTcoq88gGYntWfp5kcRgxyINDr8x/B67O2yn/Sd6B0
	JSJCicrT2XeNjb7ByRdz8EXWgQRPbvyoGLvMDsRBBtwcKNJp3ylYZr7STU8dNsBM=
X-Received: by 2002:a05:690c:f03:b0:88f:ccf7:25d9 with SMTP id 00721157ae682-8b4aa2f4a19mr36899437b3.60.1794677990741;
        Sat, 14 Nov 2026 09:39:50 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm47674277b3.43.2026.11.14.09.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:49 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/7] alpha: marvel: environmental sensors
Date: Sat, 14 Nov 2026 12:39:46 -0500
Message-Id: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRVvxdRSyqBiOUtDQScXfF8
 lu8d4FDS+igii6w6MnRagJ4HIEelRmQURcMIhEZ5zxli7IeZ4bGsy4RRalzmbVKQgg2iz2d36x
 ufrujnVDv7wHu+wHOhOJ0bgAAAA==
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2461; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=RmT7r+x1GuIUeyBqSvzPUTJFmGQwU2dkow/VD15WaTo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMtu/Z2ta8jT+qZZPfi+980fYr1zhu/aEyEaenk
 udant9+3PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXpNQy/Hc4faLU+0
 xn/RY7N77NCzWu13abzV9y/MfbQwFJ5+TXu/Iz/I+3P5U3SVjrr9gnsYdmfMKKK9qqRQqXf7q4K
 md92c1X2/kA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, and patch 4
registers a platform device. Patch 5 is the hwmon driver, which polls.
Patches 6 and 7 make it reread the sensors and notify userspace when the
firmware reports an event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply alarms. No environmental event fired during
testing, so patches 6 and 7 are only build tested.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (7):
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      alpha: marvel: notify environmental events
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/marvel-env.rst    |  64 ++++
 MAINTAINERS                           |   8 +
 arch/alpha/include/asm/console.h      |   2 +
 arch/alpha/include/asm/err_ev7.h      |  16 +-
 arch/alpha/include/asm/marvel_env.h   |  17 +
 arch/alpha/include/uapi/asm/console.h |   2 +
 arch/alpha/kernel/core_marvel.c       |  59 ++++
 arch/alpha/kernel/err_marvel.c        |  39 ++-
 arch/alpha/kernel/proto.h             |   1 +
 arch/alpha/kernel/srmcons.c           |   3 +-
 arch/alpha/lib/callback_srm.S         |   1 +
 drivers/hwmon/Kconfig                 |  12 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/marvel-env.c            | 633 ++++++++++++++++++++++++++++++++++
 15 files changed, 840 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

