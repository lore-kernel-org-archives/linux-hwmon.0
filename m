Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6472602
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064975; cv=none; b=RUWlrp9IdaG1s/bR5oaX+PxgOYdpTjICh7rYpHM3uH3LDEjgWpsjlr6hJy+fQ7Vbvz9ZWZXgKACvHGiKOw6qVb5xYK6+X+D0FVt2/IdMj+xCRWHvbUVXvTEb2HXVmZBj4tFMAMQ06c+CIHxkHosMFcHTG80JgWwP1AoUujZpTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064975; c=relaxed/simple;
	bh=LoZgFSMbH6l2V8yXMUuVWMtfuVe3msV1ym68BSi9k70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+BLR9pRbSyj8URRfdu8QAieUGCxQA90C4cUp+HTGmrC+fnlPyr+3mXx0mMwjdvmRnutMuyjzQxyB6Ge03fcOKUCzBJuKOhIA70+uH9PyFuqi2Udd69iI6XDvcVXIK8bXkk9s79vUZzbQKtydJQ6CqHmSAUCNh9IzgpLgyOcUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NipcsWLT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NipcsWLT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-851cbd64814so7851b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789064973; x=1789669773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxFdTsORvz4Di0mzXUD8oZCgI3pt+vNsjqEyUYZBOUM=;
        b=NipcsWLTWGykpPhvvrKcNL1a0YfdEbtUTaE8qSwhlA/wGq+xj2C/S/ASooHxwvG5DB
         P7ULLRttA57XgIKKrjvP9l2WrnbYrBNS8gzDUkjcspbzNpnKfDHgbaQP4Wd5QQETi29L
         JzxzIPdeNWWvRRXmkI8spAZ5sX8VWw9ei8794LJJwmikmqukFevOH1HYp+nPXVG3SGPG
         pHLHHvrPHEZ/3i/OkMijaL55xUjOHf7t0VZ+UhozjsdQ1gNxJu7cwyjNM+I+H6DZ6TC6
         igC2TYJvE4nrg5a+BsDNj4V2YLQYohcTvBU/NrlYrXYCzqUD0WUoCmUE13oTQL+8Io3w
         EQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064973; x=1789669773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxFdTsORvz4Di0mzXUD8oZCgI3pt+vNsjqEyUYZBOUM=;
        b=JyHXHxtzoYl9/tQ0iMEzeLcn4oCAeBPjppBq34eEYEtEIWHb5NFUjwXzfSy2hcsowT
         zIV6VWrqiNawLSQ9X9GkR0pGu4+Igg6KdYHtvCj3D76Ns39Fz3eHbfeLf+eLOZ36Z0n4
         M6hnftbiAQE2IFTmctzO0qLBQiyDnteU3+d+Q7iFPBM0J+Qk2c6rTX6THEVsygvPvAlx
         HK06/gZU27pNGkD55M0KYzr+LXs5IegU4GityGeZX1RVoPWxMbI70zuzsxsS4Ivq99O7
         oblRhbyeX2soTacqJYPlUiEAxz9pwzfK6vmbWYZCqbCKFz1v/WdFsmso4nGLwchO4z6s
         mlyw==
X-Gm-Message-State: AFuF++mnfWO8TNwj/o8e0SgEq7d4E1EUDmRaq/yhDnP2rRkm6IPCYbXF
	kiM0CovO9k4Sau4VbWqMFsxEYwIY1ygZI+sxasnhGFddn1lAFLCceru8
X-Gm-Gg: AYBFou21MJQx0Horr0IPoRdC7L67BHlMWM3U4unVUOdwkpP2ws8rXZaapl1UH0llum1
	fth5SVJublieDW6N1bkchKFVzqt9Svqh5hUnH4mo8QmFGabwIh95yZuM3VMvyBcRbPSn53eH/no
	ESIIxIP2vVsQIiFByRGy4tPGKsLmLL5rF+pZX/O30tu7TGHWU2Lvqtwx6csRLGu97XtKF4oER1V
	UUEQv8m25ayODGet/qjrNl4SgSknLXV0bRumBYsy35dAdoYcowRthPD4MM8Z9lEsDoH+18npUFF
	KDWoF9D+eeq5hWo4yRqPlzu+ZJY3omvrmDoeBIvwQ07m+UHqHTjtZy4O7VkFNc0pZuxP67Kcl/B
	fOqCk/8BlY7pyT4u+knkeW7Uk4Bsm5NdTFpXRi0b0SOZ1GSghYRFgdasl1dXiiCHIm3YFAiCAhF
	0D6A5+8dWi5prusca8xPqaQcX+Gfn1U/+hHO7CeWmLbYMlI+TZuSSFel8Qn/XWEEZn34pS3Uibu
	D5RGIS3wO8f
X-Received: by 2002:a05:6a00:1bc5:b0:86a:38af:2062 with SMTP id d2e1a72fcca58-86b34cea716mr50922b3a.26.1789064972414;
        Thu, 10 Sep 2026 11:29:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm111155a12.7.2026.09.10.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:29:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.3-rc3
Date: Thu, 10 Sep 2026 11:29:30 -0700
Message-ID: <20260910182930.1739489-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.3-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc3

Thanks,
Guenter
------

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.3-rc3

for you to fetch changes up to c88a6338ae485e4d6210cc74cdb7664d6476c925:

  hwmon: (nct6694) do not expose enable on DTIN temperature channels (2026-09-09 18:16:35 -0700)

----------------------------------------------------------------
hwmon fixes for v7.3-rc3

* Core

  - Fix potential UAF in pec_store

  - Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device

  - Document hwmon_notify_event()

* applesmc: Fix key backlight workqueue leak on register failure

* aspeed-pwm-tacho: Propagate reset deassert errors

* asus_rog_ryujin: HID report fixes

* chipcap2: Fix channels in humidity alarm notifications

* corsair-cpro: debugfs fixes

* gpd-fan: Documentation: replace full-width colon by a standard ASCII colon

* gpio-fan: Take fan_data->lock in gpio_fan_shutdown(), and fix
  use-after-free in alarm work

* ina2xx: Fix in0 and curr1 alarm handling, and acquire hwmon_lock in
  shunt_resistor_show()

* ltc4282: Fully initializeclk_init_data

* mcp9982: Propagate one-shot polling errors

* nct6694: Do not expose enable on DTIN temperature channels

* PMBus core: Clear generic status alarms with CLEAR_FAULTS

* sht4x: Fix return value from heater_enable_store(), and add missing locks

----------------------------------------------------------------
Ali Ahmet Memis (1):
      hwmon: (nct6694) do not expose enable on DTIN temperature channels

Antonin Godard (1):
      Documentation: hwmon: replace full-width colon by a standard ASCII colon

Arie Miller (2):
      hwmon: (asus_rog_ryujin) Validate HID report lengths
      hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

Cong Nguyen (2):
      hwmon: (applesmc) fix key backlight workqueue leak on register failure
      hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()

Fan Wu (1):
      hwmon: (gpio-fan) Fix use-after-free in alarm work

Geert Uytterhoeven (1):
      hwmon: (ltc4282) Make sure clk_init_data is fully initialized

Guenter Roeck (5):
      Documentation/hwmon: Document hwmon_notify_event()
      hwmon: Fix potential UAF in pec_store
      hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
      hwmon: (sht4x) Add missing locks
      hwmon: (sht4x) Fix return value from heater_enable_store()

Jared Kangas (4):
      hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
      hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
      hwmon: (ina2xx) Replace masks with enum in alert functions
      hwmon: (ina2xx) Decouple in0 and curr1 alarms

Javier Carrasco (1):
      hwmon: (chipcap2) fix channels in humidity alarm notifications

Linmao Li (2):
      hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
      hwmon: (corsair-cpro) Remove debugfs entries when probe fails

Nikhil Gurudasani (1):
      hwmon: (mcp9982) Propagate one-shot polling errors

Pengpeng Hou (1):
      hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors

Vishnu Razdan (1):
      hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS

hanzhijian (1):
      hwmon: (yogafan) fix non-kernel-doc comment

 Documentation/hwmon/gpd-fan.rst          |   2 +-
 Documentation/hwmon/hwmon-kernel-api.rst |  15 +++
 drivers/hwmon/applesmc.c                 |   7 +-
 drivers/hwmon/aspeed-pwm-tacho.c         |   4 +-
 drivers/hwmon/asus_rog_ryujin.c          |  30 +++++-
 drivers/hwmon/chipcap2.c                 |   9 +-
 drivers/hwmon/corsair-cpro.c             |  24 +++--
 drivers/hwmon/gpio-fan.c                 |  13 ++-
 drivers/hwmon/hwmon.c                    |  31 +++---
 drivers/hwmon/ina2xx.c                   | 163 ++++++++++++++++++++++++++-----
 drivers/hwmon/ltc4282.c                  |   2 +-
 drivers/hwmon/mcp9982.c                  |   2 +
 drivers/hwmon/nct6694-hwmon.c            |  35 ++++---
 drivers/hwmon/pmbus/pmbus_core.c         |   4 +-
 drivers/hwmon/sht4x.c                    |   8 +-
 drivers/hwmon/yogafan.c                  |   2 +-
 16 files changed, 267 insertions(+), 84 deletions(-)
