Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDD234964
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779556016; cv=none; b=tB9h0OIgYfA8NHP89Ow8y/rczUdBb4fuXKqn9A8bSHDHUFueD1N9yI1PVZjo/rZbpp+nJC6X/oaw1Al3kB0tOjWs32qX3bZhmfxbxgi5Udu2fv2yrfyRG8TN+KtnwF5xBN7+OSmbkzIbm6pUSx+tZed5gJEOvO+1b6V4TdhECA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779556016; c=relaxed/simple;
	bh=3wbIwfwvVB3Ko+2hIk/EHSIx5B9ydYhMy+MksNh9Xhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYxoOyx3SgdaGkX7iuNf3VoWKo04OkXGLp1RqNIl/3jhI2DYjw7yCPRGSoWWaMFwogEFU5xarmOlGIKQm6ColLUqiZRe9xewlDtLF9YIev1NnRKA/nD8EWwwNSDuHIvIHPLm4vgCoB1qTGfmn4kpWWlIUgYdn7JES59kr8Refjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/rSTmLA; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/rSTmLA"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f68f3b075fso2910514eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779556014; x=1780160814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VP/Y7MIWVWGkxarjdzz0+rrburKXe9+8m7yXarRRqAI=;
        b=R/rSTmLA+Pig0f7l82Rly2xrOz9hBGdRJ3BVorXcAmzJpVIhB/dapgwu5U2W+Jct5g
         EEhf4wpjT4xacd0yV/dX28ojj+yOo0qr7RM97qSyzGTd9ivavnWMTp1uTApfI567Tx9W
         TsAs8kwyprRTPjTpglElMQLNDYHDaWPlA5AJ48fMSxhdwloHodvnxhjO39Hs6LM44D4h
         6gExZECw/KFdpwSew7GfaSvVzl31yqv/E25oTtjLX/3HuBJHhN9mnb5E84pqMeDg0JAy
         ugOAEvnkZ9PRgD+muW6goJuX+PBbQaWP1tMSS/WJEL1WAToBJTocaoYSdZ0EquEHXclr
         +e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779556014; x=1780160814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP/Y7MIWVWGkxarjdzz0+rrburKXe9+8m7yXarRRqAI=;
        b=dLUiv1WZ7nf9u4C9iXWhE8Y6nmCoB1PXY+wj2I0+cJ+BonpEr17j3MkqWiJQ/smESf
         tDrg8LXRzhW8ghiAwk+/LmRjyo3btxUS5Sv/pejltjJAUJSr6LH1xfQE2t3FkhVk4YZS
         BgCq5r7rT+bUN7PVzZjpN8JItXFu5hNtj2fowfumNi3fikbbmph7/0h1SBA0UwM2bOIq
         oElQ9WXrkcdBw9YZUAmk9WxAaUDmOzh2fhcKdjc3YC8DAhYk7d0h0BGiRs5d5D7t2Ltv
         yKPMwxgRqsv31bHzXCSiV5qqYqpIvtFKyPprAp5bw7VUT7h7XZShZ83XrwB/XbA/taxn
         69Gw==
X-Gm-Message-State: AOJu0YzxL7wFi00gPJhc914gZqyTRDEEkbBeZHokQN59uKcpw61Y1p/j
	0pyPz5g3s4OzYGAkYggw2CVwRMTiD8hfJzIjzpGY0XdGcAF72v0jkRfeD0QOaOhX
X-Gm-Gg: Acq92OHkK2eE5SLnpOKkaIwCx1h/u4xsF99RorjEZkR/Y+2+ucghvLmd6nhPdnlvgvY
	rhZNvfuki54wBeWD0Y/0ws1GJGXgtREGfpHHiIDZYkW4FtwiYbmmINWNg6gIlN5p9LHK9/doT97
	LIlgOh4XMO5x5TqJxCY0HuXQ93DW+4fV9PSry9rkhRUkDnNJewUXlV0QmYUu/Rxj44IV53qNZVL
	qFVNqNW+dzkz3kZPP88NeOZvVCqOLAeSjQ6QiVKRKk9vCVuJgohpWUPWY+VXgGco103vnL4lPbn
	A5dyg1gDT/cczUCSjF9aehxuqZMIefPKlH31aTxS6NOzIJ95RcFAA1Hydnk6GBIoRVzNTerEMlm
	xiAb+Y8G+HRFNRhv1hZ2sqoSoP4DMaTCbbJ9cu/hxjuhxh8rpdPlQhq2tvMwyaTAFx1e8af+Bo5
	gX0iT1wGiQ75UGC/7qG1C9nooUA4vzaTvIIMh6FJmUmbyfR9w=
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-304490264femr3681425eec.8.1779556013901;
        Sat, 23 May 2026 10:06:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452461cb5sm5095902eec.31.2026.05.23.10.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:06:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.1-rc5
Date: Sat, 23 May 2026 10:06:51 -0700
Message-ID: <20260523170651.3331559-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.1-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc5

Thanks,
Guenter
------

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.1-rc5

for you to fetch changes up to 4e4af55aaca7f6d7673d5f9889ad0529db86a048:

  hwmon: (pmbus/adm1266) serialize sequencer_state debugfs read with pmbus_lock (2026-05-21 07:00:39 -0700)

----------------------------------------------------------------
hwmon fixes for v7.1-rc5

- adm1266: Various fixes from Abdurrahman Hussain
  The fixed issues were reported by Sashiko as part of a code review of a
  functional change in the driver.

- lenovo-ec-sensors: Convert to devm_request_region() to fix release_region
  cleanup, and fix EC "MCHP" signature validation logic, from Kean Ren

----------------------------------------------------------------
Abdurrahman Hussain (14):
      hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
      hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BLOCK_MAX
      hwmon: (pmbus/adm1266) reject implausible blackbox record_count
      hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read buffer
      hwmon: (pmbus/adm1266) include adapter number in GPIO line label
      hwmon: (pmbus/adm1266) bounce blackbox records through a protocol-sized buffer
      hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
      hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple
      hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO accessors
      hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()
      hwmon: (pmbus/adm1266) register the nvmem device after pmbus_do_probe()
      hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock
      hwmon: (pmbus/adm1266) serialize NVMEM blackbox read with pmbus_lock
      hwmon: (pmbus/adm1266) serialize sequencer_state debugfs read with pmbus_lock

Kean Ren (2):
      hwmon: (lenovo-ec-sensors): Convert to devm_request_region()
      hwmon: (lenovo-ec-sensors): Fix EC "MCHP" signature validation logic

 drivers/hwmon/lenovo-ec-sensors.c | 20 ++++++-----------
 drivers/hwmon/pmbus/adm1266.c     | 46 ++++++++++++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 26 deletions(-)
