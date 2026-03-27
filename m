Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5859C3451C1
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654597; cv=none; b=pyrT/pGNwubshAu6IC3P03rzImNI5wZsmd0Q6P64H3pYyRwvleSspMo9aX7u50WcF8DL2gl8xSxRlRxD1Lt14f5I1A81/yEp/8j9yuP521AGVSqYkmfClUnFM6HuGkv5EBmB1Uoqg9ZWyXR91L8a1KP1WS4d77RYX1urgC9maKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654597; c=relaxed/simple;
	bh=udBx5ZF7GmOPHRr66jz8rX3Mg3N9JEKdCh0imJy5Lqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRqZelShY9Jy9lG0X3c1a+gx5W23QhWHEaCHAxlJfxLeVBuQNsOJ2b3EpHhs2cHvfQI+Z8iV3VcbyA9CMcf25E36SknNQHLdBclq2g0Zg0oOgFbt1DW0nQdhYRRjGiTLUQzOiTGPx4lrTfeQgSdMM/mGZ8m1OcGOqm3nUmukTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtxqaYhf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtxqaYhf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82985f42664so1600857b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774654595; x=1775259395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CY2uBIRj86fDTqqweEPg/jdSO62upO/Ysw+X26u/ppY=;
        b=BtxqaYhfsC+yuYrB1vfRflDmSLBpCqv5XB9MZJcqRMRpzSaQFaOf2Zevlz1uENfe7Z
         kozfUpc2HZ1VLp4Iksjy6NuuMr9V1eZacZGljHwDLS6lkD2IGD1X6fsFX52qijXQxIZH
         a9su2bd1YlVFOUf8ggVh4wqyWKTuW4mm/hPzIdrY5Xocl1S21dtOGQ3qIZBz7auTBzF0
         R5/odwE37e8cPnhgMDs1rJSPoGkPha9ovb6Nwzx6B0AN99Lz/4EUHDxdnXVC/VBpeoIM
         AWpJBJPIBXB8Na7m6OYsAaTUYRjq+7g39bv8kZVhbYbAh0K1DzXWBWuAWzLSH2YAwml9
         G4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654595; x=1775259395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CY2uBIRj86fDTqqweEPg/jdSO62upO/Ysw+X26u/ppY=;
        b=WQEh3MFyCeb01OdSfYfVTa0/kJSLb0a1N0l6Mc8+aNloZZ0KSk4BQ7pTqDK/EwHFJK
         dT6I3v/l/FQo8oHTf718d+2gJZIMXoUhkYhUlF0jZ7OEZciSS7Zm2A5Kw3DYgd2Pzzv9
         1HL9uOV1y6CR1ZV0CFmnLTJ1Wm19Jky2slkXIqRYOwfr+ZhVbHueGSpugMLD5RAiHgxo
         YYNsB5E9QC8BKasDt77GKgPu+00rV3ME3KZoYQMQHentk65RqwbjeS0BeVyjpuXS9DJM
         TVbCV1Pm/MUB7ghZ4HAwZ1S+TbXi3d5ce5s8FsIazwY61zztJFr6mMznmhprUKDT8Anj
         uYXA==
X-Gm-Message-State: AOJu0YwB+Jg9Hu4Zk2plsxN6Ks4O2fMY9gXxao7GocPr/ElHiNalVd00
	iYnuGWWfsrU8NzJxG1F8EE5czKw6D1+t/1qFuqKb4oiPYkfIRtE74zqp
X-Gm-Gg: ATEYQzwASrP9HhM9V/H5XHbh1QB1t3nl0CTxa4+W6DLRViz06QMumejdWsVbrg8nDhd
	cWse1Mb6Nq6SJSb7k8zMEcz3atR97BMkK277PkBEnaSqucq7jWfOUgd9/bgLN1FHaczzka+mILX
	JIqns84H6Rz7NT7KnJ0XH3CGxck3D1xZ8Dh8/W4iMrmHJuAkGkWWS0Q7HBQ+dkTuObKEw8Dk/9u
	AA6eVlyFdmMzUcuYc2O7FWSAQLeMGsDa8bF14GuiUIRd4d51tWYB+CxvE+b7C3e4mC+VUL+C0jn
	UTe3+UlKd2j7OIBcxgB3LM0Fk8a7+LkJF59VWAH+OD8y/nFmItDrARFM32lujhJe4AWziQmen3a
	N4rF6BKaXB45pgwbHdli8b9lzpqqgpDggcOj41PIUeyiFig0COwAgVOmu0pEY1xZcJI7m8nLq81
	RbwdCBRAFCcJvqJczw9pNmmuFc+KbtuukaKINY
X-Received: by 2002:a05:6a20:6a0b:b0:39b:da83:91aa with SMTP id adf61e73a8af0-39c87c095c8mr5188750637.51.1774654595467;
        Fri, 27 Mar 2026 16:36:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917b9b8dsm263670a12.22.2026.03.27.16.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:36:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc6
Date: Fri, 27 Mar 2026 16:36:34 -0700
Message-ID: <20260327233634.4183849-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux hwmon-for-v7.0-rc6 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc6

Thanks,
Guenter
------

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.0-rc6

for you to fetch changes up to 754bd2b4a084b90b5e7b630e1f423061a9b9b761:

  hwmon: (pmbus/core) Protect regulator operations with mutex (2026-03-25 13:32:37 -0700)

----------------------------------------------------------------
hwmon fixes for v7.0-rc6

- PMBus driver fixes

  * Add mutex protection for regulator operations

  * Fix reading from "write-only" attributes

  * Mark lowest/average/highest/rated attributes as read-only

  * isl68137: Add mutex protection for AVS enable sysfs attributes

  * ina233:  Fix error handling and sign extension when reading shunt voltage

- adm1177: Fix sysfs ABI violation and current unit conversion

- peci: Fix off-by-one in cputemp_is_visible(), and crit_hyst returning
  delta instead of absolute temperature

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (pmbus) Mark lowest/average/highest/rated attributes as read-only
      hwmon: (pmbus) Introduce the concept of "write-only" attributes
      hwmon: (pmbus/core) Protect regulator operations with mutex

Sanman Pradhan (5):
      hwmon: (pmbus/ina233) Fix error handling and sign extension in shunt voltage read
      hwmon: (pmbus/isl68137) Add mutex protection for AVS enable sysfs attributes
      hwmon: (peci/cputemp) Fix crit_hyst returning delta instead of absolute temperature
      hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()
      hwmon: (adm1177) fix sysfs ABI violation and current unit conversion

 Documentation/hwmon/adm1177.rst      |   8 +-
 Documentation/hwmon/peci-cputemp.rst |  10 +-
 drivers/hwmon/adm1177.c              |  54 +++++-----
 drivers/hwmon/peci/cputemp.c         |   4 +-
 drivers/hwmon/pmbus/ina233.c         |   3 +-
 drivers/hwmon/pmbus/isl68137.c       |  21 +++-
 drivers/hwmon/pmbus/pmbus_core.c     | 192 ++++++++++++++++++++++++++++-------
 7 files changed, 217 insertions(+), 75 deletions(-)
