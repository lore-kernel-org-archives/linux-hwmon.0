Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08BA48124B
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Jul 2026 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999572; cv=none; b=slJDTLMUR8tSjl4rDei7lvaqcPjH3IV6ggjn3wmnFpD3buq3eIInZiMD13s4u5ETUmdyHeYFwPVz81KiTOEp/N48bESLzHH+8meuxErLHEdfmNZ/+UO/NIlOipnVbnJfNMgTpQGU/hyKx+Y51675g2y9qYs1ZIGLrBnkPWkwPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999572; c=relaxed/simple;
	bh=GrCO02068PRXJNOHsLPkuPj/0cPXAgIc/5NGy3rMc7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AK7hoAiwNbTjDECZNvEzZrYD1huVm8okYE8GGbQ+o40bgjEG03Tc1FYgfBODlks+I/LDa4zeV2FjsYg1K9/qIrnhbX+8hJpRUQ6zyhXA0+mCkGu/kOfJjDDV7VsgMf/yRly5SpYGi9l3srYZXlkNDWsyrNNg6lqWC4aGbxX9nzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nncZlzP3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nncZlzP3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso17941295ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2026 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782999569; x=1783604369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtITEhoW7RhCkoX4SOK3i5zrM+vLOvCUNC0WJX/x9KY=;
        b=nncZlzP3AOvfiLmmUAIqgKbgWBKgIRaFJ5nE3aKDSOmCckWhjFmxzRZ57Sc6KoeoZa
         J5z++mcK5tTMhUXsAZP61qzWAxbiMWnCDRcnh2hYElQVbtAThs5zjMo+vCJhaGwVXqrr
         2ReOmR2ZkG/AL4ly+gZGaHJo59l6rEiBtVMwChOBKUx7U9qEBRD5zEi5At/XLoTM37pB
         SYwOkEXzu/p3Sd6hdTF4rWExCDOBjX928PF0N9Ldo4GCPf6FLnmbbC0fG73FbcqFkf28
         a5SqgTB5fD6M22tZALUnBROvUr4J2Dhm7WPBDlwv61SJYueL6ygIrRDSQEl/LhLS99+i
         Uv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999569; x=1783604369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtITEhoW7RhCkoX4SOK3i5zrM+vLOvCUNC0WJX/x9KY=;
        b=Zqo03Os4QqxS9G437DA3M7O3bq+t6flFulumEth4VsuXS4POGGGcC1BXgqwK/6j8xG
         fU1NGAN7FGyfFi2duuFSyskjkVaaFwyhbp9Fg2fY0fc7YGaOi1/U/ssQ+9vXQm9zsOwM
         TJ8D97QQ1iv3cmc6gujFAnGmXb4fnbnWYyAPxwn+yhfVXrya3h/PYEopuB5kZyfCLPtZ
         rouRxsT+HSakDq02SzSrooYIGPvJwH9tX58ePYeJbrBRDIJbVl/kLvEWmpeLR6vhTRrg
         0ZxlZqPzxJ7m5/CCmMsFFl2QQ39P2DhaOB392iwJyVrhaYCo0GGkKgaoSsVSMmmwaBZH
         F/Ug==
X-Gm-Message-State: AOJu0YydEMGqrMCWOUU3tNpZKoswMGptdbPiw42VUfz3QmlAHTdM49HD
	/FJyygM0qSUGVas4zooQv28eq4tk8d2hcu724mdGL0vF1W/jIxYWrCcLtGTYbA==
X-Gm-Gg: AfdE7cm+Bp6aLew0PJIUUPsP3cwkwsFWfAKvhpiXg8M2jmQ3U7u4BD0nk4SxBHXK4qD
	ItoVvmuscfdWlvm6VyWvWtASe1kYIA4zJunOqEYGt9HjM7HtGAj8sUeGXcsZJlfJLoXCAILdtVk
	FgjAN+LYUIk379Wc88HiSxq3KZCkCgQuWzk/x7qvAANnShOZfELONbaUCmJ3sh6a3Cv7bypkZeq
	y/kAmorbyEZde4f4gK3VBbKA5vT2gTIbuwmLFo00pJ3Rb1bWc78w1VeXvHRYajV/YO6/paCeWMi
	YNjuVT/zIgvfAb2FZdWhiyHKhjjVktWB/9/3B3IX/hkJppS7amxssIwJTYvmn9BnHBaePvT43ur
	kXCzt0aN7KtwDCh45vFezFHjjT4RlnCh8iW8+U4nKacSVxvzZmbICOxPYQZAQqOD0utleciMxrm
	VK+i+l2FishAX/1ymEI52ZEerkT8SFD0IYAqqE
X-Received: by 2002:a17:903:40d1:b0:2c9:97a7:328c with SMTP id d9443c01a7336-2ca7e8b77a5mr68618105ad.46.1782999569036;
        Thu, 02 Jul 2026 06:39:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa01bbasm13545955ad.72.2026.07.02.06.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:39:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.2-rc2
Date: Thu,  2 Jul 2026 06:39:27 -0700
Message-ID: <20260702133927.1489938-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.2-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc2

Thanks,
Guenter
------

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.2-rc2

for you to fetch changes up to fe87b8dc67f1b2c64e76a66e78468c533d3c44ca:

  hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation against divide-by-zero (2026-06-29 16:37:43 -0700)

----------------------------------------------------------------
hwmon fixes for v7.2-rc2

- adm1275: Detect coefficient overflow, and prevent reading uninitialized
  stack

- aspeed-g6-pwm-tach: Guard fan RPM calculation against divide-by-zero

- asus_atk0110: Check package count before accessing element

- ltc4283: fix malformed table docs build error

- occ: Unregister sysfs devices outside occ lock to avoid lockdep warning

- pmbus core: Fix passing events to regulator core, and honor vrm_version in
  pmbus_data2reg_vid()

- w83627hf: Remove VID sysfs files on error and remove

- w83793: remove vrm sysfs file on probe failure

- Various: Add missing 'select REGMAP_I2C' to Kconfig

----------------------------------------------------------------
Abdurrahman Hussain (1):
      hwmon: (pmbus/core) honor vrm_version in pmbus_data2reg_vid()

Guenter Roeck (2):
      hwmon: (pmbus) Fix passing events to regulator core
      hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation against divide-by-zero

HyeongJun An (1):
      hwmon: (asus_atk0110) Check package count before accessing element

Joshua Crofts (3):
      hwmon: (max1619) add missing 'select REGMAP' to Kconfig
      hwmon: (ltc2992) add missing 'select REGMAP_I2C' to Kconfig
      hwmon: (max6697) add missing 'select REGMAP_I2C' to Kconfig

Matti Vaittinen (2):
      hwmon: adm1275: Prevent reading uninitialized stack
      hwmon: adm1275: Detect coefficient overflow

Pengpeng Hou (2):
      hwmon: (w83793) remove vrm sysfs file on probe failure
      hwmon: (w83627hf) remove VID sysfs files on error and remove

Randy Dunlap (1):
      docs: hwmon: ltc4283: fix malformed table docs build error

Runyu Xiao (1):
      hwmon: (occ) unregister sysfs devices outside occ lock

 Documentation/hwmon/ltc4283.rst    |  4 ++--
 drivers/hwmon/Kconfig              |  3 +++
 drivers/hwmon/aspeed-g6-pwm-tach.c |  5 ++++-
 drivers/hwmon/asus_atk0110.c       |  3 +++
 drivers/hwmon/occ/common.c         | 34 ++++++++++++++++++++++++++++------
 drivers/hwmon/occ/common.h         |  1 +
 drivers/hwmon/pmbus/adm1275.c      | 20 +++++++++++++++-----
 drivers/hwmon/pmbus/pmbus_core.c   | 37 ++++++++++++++++++++++++++++++-------
 drivers/hwmon/w83627hf.c           |  4 ++++
 drivers/hwmon/w83793.c             |  1 +
 10 files changed, 91 insertions(+), 21 deletions(-)
