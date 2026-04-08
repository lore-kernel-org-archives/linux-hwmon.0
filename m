Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A134D907
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 05:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626257; cv=none; b=CghE+A95cj0QzOCM/1odFbFMeSA3PKDvyQiOWctW3EyERtX/vcZb67sk0+SeUcZGJHEv6v8Xgf2CgERZz2QjmOguaja9IX+fL8YhYovnLdO/Ctd3a21CHl8RazBvrKAKU3hmx2JYKcUp7i98k0M2hiqgUtVZ3OMuVBJEfXn0+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626257; c=relaxed/simple;
	bh=2bvutzs7rtzWgmeamR13PJ6ItU9+5Cs+DqdG83Mabhw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bv3Z57GdrzFlTmVhWMCvz8XZvptaN7buLxP5jG8y83Y+O0m1NJcqvHExagEN1om7+J45fzbCXYfP6I3oNgML0jZUPrXRBTlK4ukWEn9UGVwnPRQx/CNWi5FMDusGzfKoQbxxKhmtMx6VZgwldm/Mt23o4d3/bcSMp6lbf7dvEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8ZWPWMq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8ZWPWMq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2429f98d0so37812375ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775626255; x=1776231055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G261iPgwxdDm9fBlFNsCEO8KxZODyeiwStlQ3uz07JM=;
        b=V8ZWPWMqIM0a1pIwCeYyr7S7yp7Dco1DstdcGm8g9rxA29Efde1Roj1i5rcE4iBJPn
         fsHLZhnXE8c5cggjmHM42eT3uoMXlTw9pZqUvlB3J4qUmJGuMa8PihJgxOtHA7TJKbWq
         iczR2H/A2QgWbT1TY4Px2AKvigew9sNEWySTDTHoYPFVuKUmjdfKRNzOoAee4afwiNHW
         p2NCoIgnkBIC9MQKNROYRzF+hy7M35Rt4B4StKYoRWTerL4bCioqceGnedGlFVb1zLiy
         RA1vi4luuCyS44b25VMz0M6Q1tLapccjDStg10ebjYnZvPar3u5zqJ6xshcsqGpBIk6e
         8Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775626255; x=1776231055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G261iPgwxdDm9fBlFNsCEO8KxZODyeiwStlQ3uz07JM=;
        b=iwErc6YhTz6BRbL66q8RrSVkFJuKA8RqYT5ehVvmbgQmTykQkKJB/BODgKwEkNaVSK
         9uGHmbHW6uuxUoqA8Sd4yzqcmFSawBpQCX4AqduCVi/tICryoeDPQUtSQsMzxzpZcaZ2
         lLhhtDNxE3ux2sCu1jTuJdIzBRKAofKjLAs/MfeMX1EbIAE2CabRVkRqH6elsvznkz+T
         rUqrK0Heug/MkIALFy2lRhqFMl99cZabIyDdq/MfEfmk15HxXwBQrmo4U/RovelRaYm+
         v8nscI5JrFNlwuEkG5QHlUgWDJxs5UbgxKya5VmIqQ7NQjSiGyjh2KQrdvOSec9C0IOQ
         ERjg==
X-Forwarded-Encrypted: i=1; AJvYcCVvQPsst6I2r/69bxvDtnCs+aWOa+5KL7qeYM6phc8dcJ/xrREWnd0nZVEWMwixTMO2G94BWlyldNQN5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznNNno8U6XbzZ45bOrBILW0FUHADMD3Az0LvoUXN9uSjF8kdtg
	Z+2EEMgXf8mfjy9DyrEVwnS+vI2U5ok3J7XoNDnbHau43XX81eOxj5ec
X-Gm-Gg: AeBDieu/CAlf434MpH1BEOmIYKIM1AB6XVXoq/ORLo0jsDa++7gGFUW3ODxCEeFVuUD
	odOtfxgDt+s3ZAVYzY36gunYfvw4++lU2FhSs3t3XUllnfEoUf+OX7sncy0TCfNa2BENMsyyyA1
	jR7i+COFJy8lgzeKCPRGcmW/carmwzD8bGNYdPI0TMOt+RDyHacrcxRJ/2bOnb9up+uk/uyybay
	2G8DLI1B4I9zusO/Lq9ivEYEBFEq5qLSf6bgDZ6uqi0DNyHm07Y3CydJFGd5ufqgTpDLnJTA6Oa
	tZfsOOaUUAhzIpdOrAf8JADnuoVhZeIZgcc8mJEFdZyAegSyjfoJ36zKFgFnQ/mFBjT53kYaCoY
	3jyViXn44ieEdw9UVZUI4RZR3/llyMe99skVqSKKyzhzzX/BgfbEZ55MTNV8Ks0z466Wm/J7OVw
	C3cxm8vaN9MXi8OaPLWTwWUbd37O9Fz3hjIw036n9SeHhVvPm0riGyGzDSsrdRimrtIYyMeDeqR
	bjE
X-Received: by 2002:a17:902:e78b:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b28178c3b7mr208603985ad.33.1775626255168;
        Tue, 07 Apr 2026 22:30:55 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d098sm181673475ad.13.2026.04.07.22.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 22:30:54 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v2 0/2] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Wed,  8 Apr 2026 13:30:35 +0800
Message-Id: <20260408053037.1867092-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (2):
  mfd: nct6694: Switch to devm_mfd_add_devices() and drop IDA
  mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

 MAINTAINERS                         |   1 +
 drivers/gpio/gpio-nct6694.c         |  26 +-
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |  26 +-
 drivers/mfd/Kconfig                 |  47 ++-
 drivers/mfd/Makefile                |   3 +-
 drivers/mfd/nct6694-hif.c           | 634 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694.c               | 180 ++++----
 drivers/net/can/usb/nct6694_canfd.c |  18 +-
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |  27 +-
 include/linux/mfd/nct6694.h         |  57 ++-
 12 files changed, 814 insertions(+), 233 deletions(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

-- 
2.34.1

