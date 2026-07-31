Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA53489885
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509176; cv=none; b=bsZqZyCPYM1NSnbd7NrGimDRSJuoMmsSkvL7IPlkbPFWu1UZk0jPKLo86qC1CZHBWzOwwgyD03tXlcssEpy+zFVoGEsrrnG5w2vK2vdzXvy9KVhBr4BVpgENIBjKMKYowdxDTeXLGeftYOPauwLBEpf/tZ+yjs6wrvMN8am7nxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509176; c=relaxed/simple;
	bh=nkR7/0LhHDHOGuKkbm+ChypVRnDntIaDFg4FDPX24OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjnEvqYhp0JXW5iEROP5+temgq7Ks1tQjuCzxBt/hNaU03ty0nWdSthB84DiIbWN3gYRJSlaVfkEO8LCu+QSsD26DQY4rlzv3mXVLw4Tw8fLkKbWOUmDiGYNXSzhmPr0Uu3YuQrHfgbp1WHn81JYgsOo0ewvKBmgvcZ2CNW7AiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TImhxhPn; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TImhxhPn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2160849b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509174; x=1786113974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsgFTqm/mmDj9lgN+VVhvrPFHmfeuo3NQA0r2xjoVM0=;
        b=TImhxhPnIXuZE6FgCVRgWmSX+55dJt7ONfaZtionTVQ1K0dmKYdEAKLmFMqzVGN/G2
         qJlZniDQb7kLrR7GbDIwyhYQ1gJNYaNXksYilvA3vKILVuUi1TdMOZzfSXj+EGNIXPf0
         zovqHG3B3S9P5RkOkOjt5r2hwkNUqtrHNbxdzihYiThjyhnY++8Zt1wCIK5BLtX+3P83
         JqEsNeeQa3DR3f0WwguLqPcEV6FTyFXELVdWZXjZC4Xns5qrUzCVIKea4yOiMZ+2pZAl
         QpgSMkGJDTz5Vz5Nrg+NDxSRbvOcWJTv1Nw4jXIKwn2VZGNYlSpKisytB4DZdtAOUWtt
         M3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509174; x=1786113974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsgFTqm/mmDj9lgN+VVhvrPFHmfeuo3NQA0r2xjoVM0=;
        b=dls62ozmrB85N7cUtZyOW05m8L05JfeGumshU0j9QoKhHhccS88G0tprYe+G/hGH1a
         iz6zLVx0FE35CPJ4NqBvLhP6mRZE4zbA7z65BVorxId8BVljPVlMADhUlE3HAkdnV+Ki
         OJKZ1eKdehLD4GjROs67zl42hTy05TSWQ8udVxqFswLG4Tf14lR4SXB8OubLHDj8vSXn
         My/d0yK196mfVe+02c2HLtOQpSz+Dje8uCzj4oPJNr3enFgQn1pCOok13WCynzGUXkFa
         y17TKWkFlCcNSi6Ws2v3Jl36aph+kJk3kVdCsR1bMhN9dzod7IFMNf4QgJoaPmEljra1
         R7Tg==
X-Gm-Message-State: AOJu0YwfpOgJ0crf83oIDNlmWhh9ZC4g9M6A4ehYi+8V4r+U3uTfa5VW
	2tYic8FmmrZi2r6FYRzXp5gYAuouQkWbIE6M9gKsGDogkcled9B1gZa9
X-Gm-Gg: AR+sD11KsYliH9GGfnll6uZn+a/5Mcqbf67v+9dgjLxXpW5U0SyheOJR1rYVfX7Pcrl
	jZui+cpIDgekXcA6laP55dT6gsItolCJn03SUTMYrX+kcgbWCciosAcflafKt7i9E1luEAMdNFX
	Jfxw+/EKPswuz6Z76cycnorWLneWsgpiUy8KflB/T2EYbnNOB+5qA3+zZqHaFabmPzI5uSP99v3
	pKVIyWYdRJgaZLTYUVbn4cyodldEWyZB1X4yTq78B++jnTuqXJYWeUMYYbzuyaBMZ39lhB7Lnbg
	7p9SY0++j9xP+htdCzN3GxIC+5Uv7UqxUVsQp+h2aS3x4bCEkVW/Pr26jzduAfmPzY98pFtiYQy
	GWYb3BRp38IbJC4WX7+Tw+g7Cvm68P9fwCE5VLUiKfQ18YltxDgmFJ9wWEUT44lZZWFb+TrSisY
	xS7KOQecwFgpIf9J2Y3wq82vh9WrKdrYczaIq6ksO+HXz2oSEbKjI4ALxFGAp1UmJ2yr+8bFKRw
	g==
X-Received: by 2002:a05:6a20:2451:b0:3c3:80bc:1540 with SMTP id adf61e73a8af0-3c91a711b5cmr2344399637.3.1785509174488;
        Fri, 31 Jul 2026 07:46:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f0f9sm6573031eec.23.2026.07.31.07.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:46:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.2-rc6
Date: Fri, 31 Jul 2026 07:46:13 -0700
Message-ID: <20260731144613.340698-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.2-rc6 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc6

Most of the patches are fixes for pre-existing issues reported by Sashiko.
I suspect we'll see a lot of those for a while.

Thanks,
Guenter
------

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.2-rc6

for you to fetch changes up to f27f6976ea269219c1259a7c2f8c6dfe782540a3:

  hwmon: (npcm750-pwm-fan): stop fan timer on device detach (2026-07-29 09:21:17 -0700)

----------------------------------------------------------------
hwmon fixes for v7.2-rc6

- adt7470:
  * Fix PWM auto temp state array and bounds check
  * Fix divide-by-zero TOCTOU crash in fan speed read
  * Use cached PWM frequency value
  * Fix swapped PWM3 and PWM4 auto mode masks
  * Fix temperature alarm logic in hwmon_temp_read()
  * Fix busy-loop and I2C flooding in update thread
  * Fix cache updated before hardware write on I2C error
  * Fix fans stuck in manual mode on I2C errors

- ina2xx: Fix various overflow issues

- ltc4282: Fix reading the minimum alarm voltage

- lm63: Mask PWM frequency multiplier to supported bits

- lm90: Only report alarms if driver is ready

- nct6775-core:
  * Prevent access to unsupported weight registers
  * Fix number of temperature registers for NCT6116

- npcm750-pwm-fan: stop fan timer on device detach

- nzxt-smart2: DMA-align output buffer

- pmbus:
  * Fix return value from pmbus_update_byte_data()
  * Notify on the hwmon device, not the i2c client

- sht3x: Fix unaligned accesses

----------------------------------------------------------------
Guenter Roeck (9):
      hwmon: (nct6775-core) Fix number of temperature registers for NCT6116
      hwmon: (ina2xx) Fix various overflow issues
      hwmon: (ltc4282) Fix reading the minimum alarm voltage
      hwmon: (sht3x) Fix unaligned accesses
      hwmon: (lm90) Only report alarms if driver is ready
      hwmon: (nzxt-smart2) DMA-align output buffer
      hwmon: (lm63) Mask PWM frequency multiplier to supported bits
      hwmon: (nct6775-core) Prevent access to unsupported weight registers
      hwmon: (pmbus) Fix return value from pmbus_update_byte_data()

Hongyan Xu (1):
      hwmon: (npcm750-pwm-fan): stop fan timer on device detach

Luiz Angelo Daros de Luca (8):
      hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
      hwmon: (adt7470) Fix cache updated before hardware write on I2C error
      hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
      hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()
      hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks
      hwmon: (adt7470) Use cached PWM frequency value
      hwmon: (adt7470) Fix divide-by-zero TOCTOU crash in fan speed read
      hwmon: (adt7470) Fix PWM auto temp state array and bounds check

Vincent Jardin (1):
      hwmon: (pmbus/core) notify on the hwmon device, not the i2c client

 drivers/hwmon/adt7470.c          | 131 +++++++++++++++++++++++++++------------
 drivers/hwmon/ina2xx.c           |  61 ++++++++++--------
 drivers/hwmon/lm63.c             |   5 +-
 drivers/hwmon/lm90.c             |   4 +-
 drivers/hwmon/ltc4282.c          |   4 +-
 drivers/hwmon/nct6775-core.c     |  20 +++---
 drivers/hwmon/npcm750-pwm-fan.c  |  11 ++++
 drivers/hwmon/nzxt-smart2.c      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c |   7 ++-
 drivers/hwmon/sht3x.c            |   9 +--
 10 files changed, 164 insertions(+), 90 deletions(-)
