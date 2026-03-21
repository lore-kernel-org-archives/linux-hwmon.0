Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFF318EFA
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105243; cv=none; b=E7tDWs8iv6hjpP8m1sShLRken5Nhu70eN9hU97/TH6DkTmrHk1ckIvIiPM3TaGsD3teYthlCaQR++O9XcsNpqKF8U48iJyMp2kiByoCqaBa7ayQDGC9DEebRO1d/dfA8e0YSYUs9xkg20m1T2cpmAk6DLJ/LQtCJTTzYWAgtsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105243; c=relaxed/simple;
	bh=ZK1S41gTNxxkqIF/wN2c8PNj7SUhB27jlFMKuiwYriE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cx0BMw42ppgtDlkujUe5P5Ez2uV7fgyjeml3MeKo9SWpRATXLvMqxCPpb9THt1MItyZ9yS5dVHhHvq+aApGgMsatNkLoCejSjI88sbV/V6fPLOM37sr82dtIk676CKvS1rSxjxm9yOErcQEggdXP4rNbBzhN9H0V5KT4gNUd6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnyZOMpi; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnyZOMpi"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0c482e069so1229941eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774105240; x=1774710040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4WD98ns2qollx1b9TP29D26OB0UXT7kBZe88qQqZ/Sc=;
        b=DnyZOMpi9BQZW7DH05iWtG8GiEFq2x62IzaRShBZDt/bMQxV8/NgT1lCaZ5ppazo2p
         MV3MVPoUHtEyiqMshVl7LGvGV+5GEqTIPVzYCYx3Qsj5dKhLe72rcZKOqJBwr/orMVIU
         Z87BvrHGR+S5gKNzMYOWsHUgM2L6yu0wA80+1jtGd72r+Cm7UiDYVaPLGtQy3pzgkr6X
         6lYMEzzaSi/69x4YOORzhWjYRfsbsxh8xw6Byt7P2pT0wb+FNq9/ZH5LcLPrOAXLQVwH
         itWknHcLDHqz3F9M7VyLeI+VIckloFKxiQ8g5UnP09IuRFlOFgq3sKtT/sPzzVFCXJZI
         J+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105240; x=1774710040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WD98ns2qollx1b9TP29D26OB0UXT7kBZe88qQqZ/Sc=;
        b=L7Q3G4Xj2+Vf+aWVDSHopceIghpWxnGAHM4qfppcUaYzAB93wTu9wszmrpAPwmAvKn
         PmYdijQTMRydsna/Uu9s9CaPz1Q5BT+u7CMKXBmBggKAP4WgOxzFXhCW7g0q4BdRQPS3
         +enDjSrkudLmiAuoYotXIEMi1lscHOl1ITd+UV3Iz4tPlmQMlj6OcvlAY4N/VD55CcuJ
         eqM/xDBTiu2j5fHtKx/USxji8+4Em/FCNUbqvvMWN/VFX4o5N3Eh+ZI61EW7Ja6agiVv
         ODcvuVzGyXO+iAN/8b/mRt1yGNxyuKInQLjpiIlsLMuxBpbCzCw8Xy3D0rhuVNlLKXWr
         mMNw==
X-Gm-Message-State: AOJu0YxY9cEarf0LK9zq0Lm3e/eOky55BKWxQgYjlAaG5dGxGDmj/T0e
	N0OaeIi2bH820XUt54H6/qmLBlAsMSBuUJoO5D0Ga17+Vu7NPXfoi4Yp
X-Gm-Gg: ATEYQzwZJ6g+6VAu2+CRjyFrnTB2mPgIyutidN0mbj0r4LD/8oiEVvU3fquAj+Bc/8z
	baVU2jiGvcexGAcWXt0CL/lA6iPFZXF9/rJ24Hi7xv22YIX9XgMqvvTTBsJX4N4k1ULkSIbJNnE
	P6P13++mS8kHx7H8/12Svf1tGEsyTL131V+RES0+yYhuORoH41mDcimqmSGRHVSm3Y6tlQBA8Gh
	yLbiXXFXgXNLzYkLNxLky+EIQhc0lFwk8LeZV16cjZYllpJ01zeK2qE0rgKg6whurqiOJHK7FxY
	JhQuRyxi/isDeUn/a/wOlOBm1MBkIM4uOGH5Q3v6xl4bY4LgwAqyjLcEcD29ShuqqR1dqwyQY1M
	1uwOTnclADhcPehP7I/3fIdpGBHqeky9R2A2iBEPnT1DaeFBakqDk9/f3HjN9se9vv4Rd6hClYg
	bD1okdmaBiwdTyEv3Opp1PzwfGLw5x4qi3sn4Wq+nim+c2Di8=
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr2778905eec.32.1774105239442;
        Sat, 21 Mar 2026 08:00:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm9830197eec.5.2026.03.21.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:00:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc5
Date: Sat, 21 Mar 2026 08:00:37 -0700
Message-ID: <20260321150037.1451623-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux hwmon-for-v7.0-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc5

Thanks,
Guenter
------

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.0-rc5

for you to fetch changes up to e7bae9a7a5e1251ab414291f4e9304d702bb9221:

  hwmon: (max6639) Fix pulses-per-revolution implementation (2026-03-20 16:50:58 -0700)

----------------------------------------------------------------
hwmon fixes for v7.0-rc5

- max6639: Fix pulses-per-revolution implementation

- Several PMBus drivers: Add missing error checks

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (max6639) Fix pulses-per-revolution implementation

Sanman Pradhan (5):
      hwmon: (pmbus/hac300s) Add error check for pmbus_read_word_data() return value
      hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data() return value
      hwmon: (pmbus/mp2869) Check pmbus_read_byte_data() before using its return value
      hwmon: (pmbus/ina233) Add error check for pmbus_read_word_data() return value
      hwmon: (pmbus/isl68137) Fix unchecked return value and use sysfs_emit()

 drivers/hwmon/max6639.c        | 10 +++++-----
 drivers/hwmon/pmbus/hac300s.c  |  2 ++
 drivers/hwmon/pmbus/ina233.c   |  2 ++
 drivers/hwmon/pmbus/isl68137.c |  7 +++++--
 drivers/hwmon/pmbus/mp2869.c   | 35 +++++++++++++++++++++--------------
 drivers/hwmon/pmbus/mp2975.c   |  2 ++
 6 files changed, 37 insertions(+), 21 deletions(-)
