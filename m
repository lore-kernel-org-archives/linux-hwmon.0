Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C750EC08
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748487; cv=none; b=ZCj7AFTK8jKFHFxkBYcSkFjwuVzaNEXHwkVcdG2jKCuNnZDoNcju5EwThNgz9TVtuDPjXsH2LlzLQbemGOigEWHuDPiibK9lXFXhnm5bj9afvc93By83zh52gVEoN8K7DE3/2BrRstbzzQ7eVJJsXhfTzCxNxmpIG3EevUNzZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748487; c=relaxed/simple;
	bh=HEzZbfNwt6Hc/tQFq5+afAE0t9wEZ1eV4F9U3h+fX/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nj12V4+db2RI260VxXhKEKcvfigDUoLXWQ7LI1EplEUwWq9PjlQ0N2JQfClYVPtIvVf+13Pm5pYSbPJdAs60Tf3jM1zG3rCgaLwl0UD4uJuObGMPk3iOM60i/P1hbhFP/iX7tOZDu1IXULjKCwred9UPll27b71LU6ZdPTsy1Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCFLSdM5; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCFLSdM5"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so711370a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748480; x=1790353280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0g3Ed4ErIO9z7L24xx8Ie2fCNFVJDG4I4OqnxOodgec=;
        b=pCFLSdM5/qX3ahCBfdcTqH+4MpM0DOmI0td9jv6pYaiueWeKw+uNCGUSeE4WHGY+s4
         75A7ZJPRK362jEcMJHplMxMh18C2s8Tw6MHP+pABrDKQ6oBBKEi9/C9ThEpeu9viFYJU
         YCnb5tarRjEob0C+PN99DPXLiFsINkXMWvtP02dyI/FU5cXJ+4PzRpmWd9R3ganKGGEq
         8EyW38gO8n6VC2onp1jBxBgTLzx3+1b4ObfO4PpQHIQthH8Vww4X7rziyjJVp7fcJF/8
         lzi02aojy6Q3D6Klp0dJGL1iL/MyYG68axkc+jvQ6I3zkw37doL/RLy4WkXAvjTtWwBp
         I7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748480; x=1790353280;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0g3Ed4ErIO9z7L24xx8Ie2fCNFVJDG4I4OqnxOodgec=;
        b=c8RJvyvsi0JosJdfU8W5BugBKzW3cEz0xiQkpyKFZ8naOnSlNIiyaeqzkYj1bvcmfO
         BN8gVt67+mTtlSLhBuY5n2dMHsp7/d6h/vX0DvRQU8Fpj6vTGIMofLalwn+nSNKAXMqC
         /YHtYbS3h7jPhnEslwiMMb8/t4/vsD7Hrp67oCNYTDwBYM809kkArVbPqp6XL7Wb60WL
         ZLhUDJMlBjPkhln7e7HvonL3NVjQ+rsryM3luhWkU19+JxlHZZlv58wTA5H1ywqSZTeO
         thiKaRN1kD8vn1qMgZl4BOhD+euUe9UKKBLPAKRBso3AirOKjt/THx3qeAkKfZ5NQmZw
         gE0A==
X-Gm-Message-State: AFuF++lsJ9kwVyFVu9Jq0j0HMMDrWv03PN8JkByvoHd4vfhVHcAAbnnZ
	ESJsn355PmU1yTcT6sKc14YW+njTNDEaBAXUhl2RTEthjEbBb1y8oecU9/Q4Ig==
X-Gm-Gg: AYBFou3bMB2H+DViUj01MLSNcQChT0rrJOiJerbi85XPSJWn1bhEjBXabSyV4V3qFmq
	uTdtxOTxwGUAo+ID9zOk6Xw9gkFPqZsGHjLo5WPMvmCNU84bAGWRB9yqZUSNkcxeXbGrKUZGDsA
	5sU/OsNUO3Ys5BeNrXmOH8lA4OXHupymOKkFzOGjZamTmo+EpJJYqBH9EDPlN9N41pZI2K5PMPt
	JpnDm45VPdiWskpa1M/Jt0piCNhFvAfoKjuwU5TdQO8P/Gs0WqQyfMwNjddPDQmjC1g+pX7qfqL
	peNY4Uq+tJYaeEQRHhZZswpcfPYlkpHPp2YnlHBKuiqWYNwzVgMMuGUau90tIS+9MB0ocNTEtRN
	CJZ24Z1wbP43FqCw3daY4z/k1aMUZfXyuOYKZMaTEotB5atKoFwTeLcyXizPHcmeWIcdxPlTBJZ
	HX+bOGPVmr/5+WqDbxkPsf/egxTEuSZb2UV6Ytj7yMNUUmyP0m+C+W3MvJOFdAnkayYCwV1vFZG
	zDjYS9AVzNI
X-Received: by 2002:a17:90b:5348:b0:39e:6c6a:209a with SMTP id 98e67ed59e1d1-39e6c6a230amr247930a91.59.1789748479985;
        Fri, 18 Sep 2026 09:21:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17d77sm71229eec.3.2026.09.18.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:21:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.3-rc4
Date: Fri, 18 Sep 2026 09:21:15 -0700
Message-ID: <20260918162118.18615-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.3-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc4

Thanks,
Guenter
------

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.3-rc4

for you to fetch changes up to 92b68492eae701e5b0e9d142ffe229921af7b1fa:

  hwmon: (hp-wmi-sensors) Improve raw WMI string handling (2026-09-16 17:08:19 -0700)

----------------------------------------------------------------
hwmon fixes for v7.3-rc4

* cgbc-hwmon: Add missing sensors, and fix current sensors ID lookup

* gpioufan: Return IRQ_HANDLED from the shared alarm IRQ handler to fix
  possible interrupt storm

* hp-wmi-sensors: Improve raw WMI string handling, and fix UaF in show
  function

* k10temp: Fix model id range of Zen5 Turin to stop reporting temperature
  data for non-existing CCDs

* pmbus

  - core: Increase number of phases to fix UaF problems

  - tps53679: Fix TPS53676 phase page decoding, and select page 0
    for single-page applications

* pwm-fan: Stop RPM timer before freeing tach data to fix UaF problem

* w83793: Release probe data through kref to fix UaF problem

* w83791d: Remove fan/pwm 4-5 sysfs group on remove to fix UaF problem

----------------------------------------------------------------
Cong Nguyen (1):
      hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler

Guangshuo Li (2):
      hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
      hwmon: (w83793) release probe data through kref

James Seo (1):
      hwmon: (hp-wmi-sensors) Improve raw WMI string handling

Muhammad Bilal (1):
      hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()

Nuno Sá (1):
      hwmon: (pmbus/core) increase number of phases and add new mask

Rong Zhang (1):
      hwmon: (k10temp) Fix model id range of Zen5 Turin

Sanman Pradhan (2):
      hwmon: (pmbus/tps53679) Fix TPS53676 phase page decoding
      hwmon: (pmbus/tps53679) Select page 0 for single-page TPS53676

Thomas Richard (congatec GmbH) (2):
      hwmon: (cgbc-hwmon) Fix current sensors ID lookup
      hwmon: (cgbc-hwmon) Add missing sensors

Yibo Tan (1):
      hwmon: (pwm-fan) Stop RPM timer before freeing tach data

 Documentation/hwmon/cgbc-hwmon.rst |  42 +++++++-----
 drivers/hwmon/cgbc-hwmon.c         | 129 +++++++++++++++++++++++--------------
 drivers/hwmon/gpio-fan.c           |   4 +-
 drivers/hwmon/hp-wmi-sensors.c     |  32 ++++++---
 drivers/hwmon/k10temp.c            |   2 +-
 drivers/hwmon/pmbus/pmbus.h        |   3 +-
 drivers/hwmon/pmbus/tps53679.c     |  11 +++-
 drivers/hwmon/pwm-fan.c            |  13 +++-
 drivers/hwmon/w83791d.c            |   1 +
 drivers/hwmon/w83793.c             |   4 +-
 10 files changed, 161 insertions(+), 80 deletions(-)
