Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED611A683A
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336940; cv=none; b=iJ6jA6iui0VyjqteXn0AQ3DBGFKzl7C9GHbogD90yS6yHb2iQQ4+a5Rx4hAyBvALllKXHE4DSNoMrxj7AsCdjwhHSXvg4Qyx9oaQfIfLZHqx9rFW2FFrvYoU31jE67HD0HhasRvpYvs7iqQJ3D9jpen2sp2ywGricqhICU4rhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336940; c=relaxed/simple;
	bh=4/4uziXSrPmR6yYWrjys3cgLdOi/1pgxARE5bDGdwfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WyihVD2P5c8iJ4ODMLWQ5KFnXORfsvvUR2BYCQLR8MrOp/DfH4DetShlTjaUHoFM6qTV1qbZF2embdM5raEP2PdcF161Hu0YBaC6UxaqsUxbXY/wgAe2lFltY2p/SLfI6uBtPYNQi9i5NHTgGa7urs92JgOfDqmd7KG0eeaOJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFIDPqjV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFIDPqjV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-366375c4076so1193877a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336937; x=1778941737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/3wl3+doAi+WlD8B4g07cK2s5moaWWBNNcS4MSBtosE=;
        b=AFIDPqjVTpPvEG5cBRoSNbYrA5KFQNUU+P/ngT6FGSb8qparag9mYcAAkmc+vQu7yL
         EucTcIWrXMq87kP66tEyTi2ba/nGzDP1DevujocbKo2dHISJZybLKGfPe03bnGjoA4cu
         FX0Sp73zdNHT5eMvn/4TRulpceGZ6oxFWvoDD4aBlMLtdDMfjX43arbMRwhrtgLOPTzW
         9lJtoMNT6gXmMos532J8R4ag4cP2QHe9LYRgb8DZIVAihq0QKHbivwxCRXFhKPb+2qXf
         PprR0Ssjp6h7ZdotjgaFtRGJOo7IoHisP6j5ZSbL9LATxYtKcsPZ4cmP+Ih0vU3p2Z1T
         F47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336937; x=1778941737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3wl3+doAi+WlD8B4g07cK2s5moaWWBNNcS4MSBtosE=;
        b=I36NcaWi9QEdh4FfKE59E5RnUaHp2ADQ20rD7wkjrjsL++9Drr0/EWtT+ViwD8DpZz
         voN95E/iqm4Y2OSFxwLmkO5Kmn6RTdqLRsPLklIFCDzXU5nH/DCalC/v2qzXQoff5DE9
         yiOihdHrJqWSToZWuS7ia8as2iiyuVd02e94rytCftWYS/P2z32ADJhklvs/MgY/xxbD
         YArp5uoI8wuSB6zZIAPjwpJzz4EEf2IzciO9Rv4Uvzsp21IuOTBSrTch9M1e5/7gX61g
         Ctrb3D/9/6pDS7QFjaXBCJXieFQ0bj2dULyn2XT6lQA0wtRIqsxMxtX7Z01aiVPEdeZG
         OBGg==
X-Gm-Message-State: AOJu0YyGeCmXm3KHZ+2D+A8h3Pp3Z/Xe2KzKzN4LSk8RF5h3GFAa42mz
	xWJlwtXP4VkC/KNgrBUeR914gIxhFwkJCOrBLER0/KFXJCjmGRuxwvJY
X-Gm-Gg: Acq92OF7OLkRGoa9fR91GCIG6ppmqylFct/w/lhuUNWtWsLEUcd0ubWA/e0lselIHwo
	Tr0OkYnw2M20odW0c/fkIFkPxDkfvcM4/zxUkMhyhekAjkwRnubGYv/wsTT7PWdSvh4MSQJS71m
	A4B2xZSKVKKUoA9Dw51xID5cfw3dq0sTQyBhRVtT2KUrxvL5TIah8jp9pWVQAiuzocDB0QVMXWm
	/h7LwzJ/Bp/x3J8RhxsDBI8kVTTRLcsngIQC44nm0h61LtW/RLTlLXFerCXkU0LojC25dveHo7Z
	46WrWNx1yv2hTQHbMLm41Vqs7I9z+R6BF1vF6EkFRjKAyoMh32F+/k+GuhsZw0oBWYWUO6xu4RZ
	JU7BfhH+lquqBWmsSCe19FSK6dSiTvTK0BhfWTzM67oOissJV8tNFYNmxfg6Dw/7boXXaGxQwit
	9VvOdqM56yTxElTH63vrnFdJjF+TqMzmpaRK+P
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr2836903a91.0.1778336937231;
        Sat, 09 May 2026 07:28:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625ef70sm2410549a91.1.2026.05.09.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:28:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.1-rc3
Date: Sat,  9 May 2026 07:28:55 -0700
Message-ID: <20260509142855.1456995-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.1-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc3

Thanks,
Guenter
------

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.1-rc3

for you to fetch changes up to 99076a17a112ac43cbd37f6883898ae649166303:

  hwmon: (ads7871) Fix endianness bug in 16-bit register reads (2026-05-07 16:30:12 -0700)

----------------------------------------------------------------
hwmon fixes for v7.1-rc3

* ads7871: Fix endianness bug in 16-bit register reads

* lm75: Fix configuration register writes and AS6200/TMP112 setup and
  alarm handling

* lm63: Fix TOCTOU problems

* corsair-psu: Close HID device on probe errors

* ltc2992: Fix overflow and threshold range

* Documentation: fix link to ideapad-laptop.c file

* Makefile: Remove stale CONFIG_SENSORS_SBRMI Makefile reference

----------------------------------------------------------------
Gui-Dong Han (1):
      hwmon: (lm63) Add locking to avoid TOCTOU

Markus Stockhausen (2):
      hwmon: (lm75) Fix AS6200 and TMP112 setup and alarm handling
      hwmon: (lm75) Fix configuration register writes.

Myeonghun Pak (1):
      hwmon: (corsair-psu) Close HID device on probe errors

Ninad Naik (1):
      Documentation: hwmon: fix link to ideapad-laptop.c file

Sanman Pradhan (2):
      hwmon: (ltc2992) Clamp threshold writes to hardware range
      hwmon: (ltc2992) Fix u32 overflow in power read path

Sasha Levin (1):
      hwmon: Remove stale CONFIG_SENSORS_SBRMI Makefile reference

Tabrez Ahmed (1):
      hwmon: (ads7871) Fix endianness bug in 16-bit register reads

 Documentation/hwmon/yogafan.rst |  2 +-
 drivers/hwmon/Makefile          |  1 -
 drivers/hwmon/ads7871.c         |  6 +++++-
 drivers/hwmon/corsair-psu.c     |  4 ++--
 drivers/hwmon/lm63.c            | 39 ++++++++++++++++++++++++++++++---------
 drivers/hwmon/lm75.c            | 10 +++++-----
 drivers/hwmon/ltc2992.c         | 41 ++++++++++++++++++++++++++++++++---------
 7 files changed, 75 insertions(+), 28 deletions(-)
