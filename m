Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB92C1586
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 22:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971422; cv=none; b=lvoEYO1wxXRSgFCTOR1yddZ+wEPIs/DQ3aq/ybuPtv11H+k7jY3WQfOCCyCa08VpVZj1nN4ASiH6vWP5XZi6bQwhndQBB9rcad2NX0jz4Rhricl1d3M8e2wzXey+x45kPqmtonSDcm4RQgC79RoTOVbsVzE9FqtcIFT7gm+2rms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971422; c=relaxed/simple;
	bh=suvdadXfq+bsniTP6WXapFTTDgDHv5m+5yaAaxPLUNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eyx8RLm2TF5nynKFhPrNzDP/FdySXKbSn3n9NYqk4yXs80ezo+bm1wu0E1TlcjyudWVvNGlt4qTcGlgDq2Vfeo78meu1fMPeNugTczWf+ZiaiSVtE1ifbYgxKVkniNwK2qCEBdz9VHshlVJw2+gFtq5XbsgtsuC3XXi6BtBCfj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbGK8IC5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbGK8IC5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so453999b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971420; x=1779576220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fa8bJlKiqInJDpYwUMJsdTdGzY6Es93D72QHE1VB3Go=;
        b=mbGK8IC5MYgVSWUyNOCtXkx/pP+6X6iqOOwUj9CyvrxSPdEhV9oFUsLVk4mzBLD0IH
         7PymI5UZ3+ANsth3qhGuTbdQufpNzWjUkGOxGBUt4me6ASlEYxClFbHTEO486NjS1ZxO
         iTX/2DBl6sCI7ojjmIhfkeIeU3N7DLuV6VKFJ2lRcY93OJxAup6OBYU70wEz4hyvV/Zj
         qgCTb6P41vuHTI8wbhpvu0kEgeRPcrj8CdHTu6sgY1klR8ZkzdVrOZGlPF0y9mAVlatc
         GqInpmJNpUa8IpIhxJGOjGifeJ+ogJyCYccGK+Gi8Yx0Yyxe0qIFeXFi95/LlzQaqkGX
         v5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971420; x=1779576220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa8bJlKiqInJDpYwUMJsdTdGzY6Es93D72QHE1VB3Go=;
        b=Bhf8j9WP9MFNxoDivYpJ3Zq+eEw4y5/6YRfOaqAwQU740FhPzcjxO97yeHNvmtA9fY
         5qb/73NnMs5dkroAnjoJHyYLdODBMoC/F5pKVxHK282rmlya9uRmflMhw7f0ZEZRC8yV
         RosHHYUtEaTJ88eSsyp69UeJ5AppCW7gK0yH0Yx07dzWm24fo2TANR/e0WGJuih1bUQZ
         s6fBkgTE/hlG7QGwRF7GR1t5U2/O3h1XOdji1y9bPchi+MfWhhmcuIhMYJghUFAAwptI
         J0bFpWtr5rac5FdapZLE7e2PZctNlhkfo1RHi9lEg42N/nF1zXx3Odn0sKLTrsryrbPy
         nXjg==
X-Gm-Message-State: AOJu0Ywt3YQhg2zGHTNMkbcp/5opy7sm4v3mPpBDVFuWIyMSXKZGfls8
	eNprb2z1uGaOKUyRvif6QNRN8iT8dRFoHNxHz7CIuzLzhMJ4I6S63WZ4RHX4N0Dz
X-Gm-Gg: Acq92OEMFNJZX3uPkRy9r8cg5wMoNFQBCWrnohUhYJth7Qx8EWF3xZmQPK1CI0GxFzj
	arAZU6jhbNu3ni91F4Th4qUgafV9/gNkSQHIUfA7HGVe1HKjTMpLNIAu5EkiBzDBq0SN18r98oG
	AABRgMIKzlHNHhXzfX67K/suIVBzZAOB+pTBg/oHWJElZm1qK8DjBFJEXyxlz4guVUOaSlaRaKS
	7oWDVH6LOhchjlW44OXxJXDvjBHh8QTf2XjJOhOpz0lCzWoaUakXxYFT58jKyjj6v/gFuU0gx2h
	3A57AKN4FjJ5Dcv8KXLg1uBQJB99KYDpWMlXeLWloBoRRtGJNetcHRRxng19EgELMr6vN6Jcc1i
	8yGsBndJGtEqsbmdNXF/FrZDzybZaeiGDgQYlhQ+AHVVq6GD1l3St/mpHykXLkLj3pLyB1FeDqy
	EHznuQWS+NZmeEgimLC5mKziO5HyuBYaYMm/Zb24N4sYJbxpo=
X-Received: by 2002:a05:6a00:4b0b:b0:82f:316:3206 with SMTP id d2e1a72fcca58-83f33dcc06cmr9718215b3a.34.1778971420089;
        Sat, 16 May 2026 15:43:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977c494sm9706911b3a.21.2026.05.16.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:43:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.1-rc4
Date: Sat, 16 May 2026 15:43:38 -0700
Message-ID: <20260516224338.1750738-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.1-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc4

Thanks,
Guenter
------

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.1-rc4

for you to fetch changes up to 873e919e3101063a7a75989510ccfc125a4391cf:

  hwmon: (lm90) Add lock protection to lm90_alert (2026-05-16 08:10:33 -0700)

----------------------------------------------------------------
hwmon fixes for v7.1-rc4

- asus_atk0110, acpi_power_meter: Add missing NULL pointer checks

- lm90: Fix locking and UAF issues

- sy7636a: Fix sysfs attribute name in documentation

----------------------------------------------------------------
Chen-Shi-Hong (1):
      docs: hwmon: sy7636a: fix temperature sysfs attribute name

Guenter Roeck (2):
      hwmon: (lm90) Stop work before releasing hwmon device
      hwmon: (lm90) Add lock protection to lm90_alert

Rafael J. Wysocki (2):
      hwmon: (acpi_power_meter) Check ACPI_COMPANION() against NULL
      hwmon: (asus_atk0110) Check ACPI_COMPANION() against NULL

 Documentation/hwmon/sy7636a-hwmon.rst |  2 +-
 drivers/hwmon/acpi_power_meter.c      |  6 +++++-
 drivers/hwmon/asus_atk0110.c          |  7 ++++++-
 drivers/hwmon/lm90.c                  | 26 ++++++++++++++++++++++----
 4 files changed, 34 insertions(+), 7 deletions(-)
