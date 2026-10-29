Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264154;
	b=R2aPoDqmq4A/5Ehld2CmkUPedQpQIdqvvcFkYOyChK3nY6ZYjWn5aYyNbfOPIe8iTCzI
	 TpJfNHrRRUU29DAoIc54Lv17zWxRu73r2/lI1Dchw62ADVCKKFiRIkZecp36ZrrEfeBVi
	 puuPHJRZX7eVXTO9WnBsWhVxTJNd+Eoeej0fFQo/3kjHsWDvS42/Lj2qZoVRtNSQQwHfE
	 xq6NFRIZGjIHDV9cR9WhZLHo/LQQSXsxhuoSnTckUBayhclsoVjkHYXQhRvWaV7SMSmti
	 5zypqtcmfscwv6/4u0QbVX6EhMOvfxDnVpau05WeZ1nSbwXXDNQqmUPlyY1FpKWXtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YYDnw0w3VJ1m8RLFL/nZJuly2Onkx72MVUQSXk8vs44=;
	b=JqB0FvE6PkRK+Fv/Kkxy5OzTlaeANfo+3p3gvBd+TjR3+t31CI4W1dm2R7MayTFvbgwz
	 1+v1SsbPyX56x+lY3YNU8Zm20fIyd5HzhGm0MsPTQ5juMYpDt1zQHyIfBMdi76LS4XmQu
	 5ooJW3I4zPzBlCd/M0aXvYABuSalNTXkMExZKVifko1k+E687kQhMcrkcLUc40wLcvZ5n
	 bof6e9ZlPopWyOs+Sh6Bptcs5wtGqWQT3Bgw4FtDL+TKhTa+IA20UCnZSmX2E0xaoMfEJ
	 G6YIJ1RGJ0f/V5B5yHOLmmpEkPdauNEYkVoGiskZdIGkimZC/RcukjHaDOTlxkDaY1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLptjGD4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02814606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 08:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02814606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLptjGD4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso3511004eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264152; x=1793868952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYDnw0w3VJ1m8RLFL/nZJuly2Onkx72MVUQSXk8vs44=;
        b=DLptjGD46znSG6byzVrIUXtEd0wYp2ocot16hHp52y7rmlSFqfhMJlc6i2rtkGMNBC
         Lgp16RnFrXpaOvusnzJqL0Eh7tb8mrb+2S6ryqC4/zFcjcyLv9hWVwYn3Ct8znpb1mAY
         so8I8+u8h95CImV2pByyPmF8cmpo1oCNQNz8QowMRx103M7m3wqfPNJaNdCOnyzam9aC
         s0Ew2+a8RHtNJQMbBZr3Fuyn6iie3/gbNdgGgCe1hA1aD+U7IEXr99AgA0mAo/8Z543B
         gQLUedJ85qZ4m2DMMLVn/f/dF2yt6LCZfyLT6jtXnVAoOe+nA0P/YgtA+MtL7Neibt5k
         lprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264152; x=1793868952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYDnw0w3VJ1m8RLFL/nZJuly2Onkx72MVUQSXk8vs44=;
        b=ID679xgSdPuH/Ghz9vRYWi/HCE33M6K2g4q+qSq4DNyMb9+fq2yO4H3mbCwh+vU7JV
         tVtxpIq2S3+194WWT2O6ROj8JclRSndZdUHRNhNUckl+Sa1IRBTAW3UlcVWfuiV4QEp7
         jNDQrOuNEKKT/Eviuuj8jgHVPyGxPYq6raJJzrP1ieBx9uELmzVDYKzgxWOja9uQBvTp
         til1rsYWBqKz23qcwC8vQPBtcr3hDnXNSEUYq7gBj8DR6pQVSda5xsR+dov23n9Nyza/
         BPE1KSIf4hGlclePwPsfdLnGnoNVYH82JKZ9vC7WUmtEg9t722sq1O/RejdPXxy+F0sH
         yrrA==
X-Forwarded-Encrypted: i=1; AKwUvBw3IFyeQwda7BRMGTkVTHGRfndKz3F3s1jeQchm+hEgelSY2RR2nsieK5dXkSV/33kAo2vX5anf0T4pqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VKKbZb+rjvKraVpVdEV/TGgqvbA/AUvJW0AJ9R+0sAmHymf+
	Yhr5mRf4SJcj0DXCZLzRlfrNDy7IiRGTQAjjU6Su0DTLMaQWQ5UzPEo=
X-Gm-Gg: AYBFou16iEqznxeFTCpx5sbM8/MjPmDTpBE1OkRphlS5P+B59lFHIce8Y89Y/edZmJT
	+KvlTzMzf223yFy/FZVsKb6tBBaCIM07cKsXj4GvDTd0hCfYo6BiNBC1wF4E4lRnLXuTmKTjwF1
	Z0kOdl/ZYhTp2gpt6PRTxc/lAHkLnuRE4IUUWQpmCh45qr7ZLA6XX2FfoISTfR0qzGQ9NlAsEdi
	74OpN9WxPiMefHscOG5JyzuMxa7IvqBSb2fSa12Yj/+sVk8tva0zZ+4k5NtkK3qYQ1mKBJQl+LO
	NC674KYyuptl2thxGmMPDCQODvbKNUD/LWRA4o/zk7DIalifWBeqnpxBYDjqg1CagfZ/ifLzIX9
	ivdv8hu0iCt4/HpfVyKdfW/aIWFRVXgxar3UYd6q68WXfrByyWQrZOSlBz9RbswDechQHatbvId
	fKePB6fDef00Nw5mxeeMZDIX+Xye5FyuHDU0U3OhQFnBRmtfppdHBdLu2tkPQTb8NOhpdiGox56
	hD5m0fL3oyxb4TD/nP6fFUsEjlFTmB1Ex14jRlIgu3PjAHbRUZ7ZlWhJwWNfInqoIZhaHrVKGVf
	5FKHtYMzsXHmEF2Hfhd5LIXVisrqybSAc2ydLN8WekJRhs+ZNEEXUr11uDmWBonierC4F3pcjDO
	8fn4KKzY=
X-Received: by 2002:a05:7301:7c12:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-36a2016c61dmr10086277eec.36.1793264151721;
        Thu, 29 Oct 2026 01:55:51 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:51 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Thu, 29 Oct 2026 04:51:57 -0400
Message-ID: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

applesmc is very old, and all of its code is lumped into one
driver. Fan control, sensors, the light sensor, the motion
sensor and the keyboard backlight in a single file
with its own way of talking to the SMC. It is hard to extend
and to support new machines.

This series adds Intel Mac support to the macsmc drivers that
were written for Apple Silicon (the Asahi implementation).
The SMC works the same way on both platforms, so we share a
lot of code with Asahi. Only the way of talking to the SMC
differs.

To make that work, patch 1 splits the macsmc driver into a
common core and a backend. The existing RTKit code moves into
its own backend. Patch 2 adds an ACPI backend for Intel Macs
with I/O port, MMIO and interrupt support. After that, each
function gets its own small driver using the standard kernel
interfaces (hwmon, IIO, LEDs, power supply, RTC, watchdog),
instead of one large driver doing everything.

On Intel Macs these drivers replace applesmc (hwmon, light
sensor, motion sensor and keyboard backlight) and acpi-sbs
(battery and adapter). They are mutually exclusive with the
drivers they replace, so only one is used at a time.

This is an RFC to get early feedback on the design. The macsmc
split and the Intel Mac backend touch fundamental parts, so I
would rather change them now if maintainers ask. After that I
will test the series on more macsand send it upstream as a
proper series.

The series is organised as follows:

  1      Split macsmc into a core and backends
  2      ACPI backend for Intel Macs
  3-6    New drivers: watchdog, IIO light and accelerometer,
         keyboard backlight LED
  7-9    RTC support for T2 Macs, a T2 detection flag, and
         disabling the broken ACPI RTCs
  10-11  Power supply support, replacing acpi-sbs
  12-13  hwmon support for Intel Macs
  14     ioctl for userspace access to SMC keys


Tested-on: MacBookPro16,1 , iMac20,1 , MacBookAir4,2 , MacBookPro12,1 ,
MacBookPro15,1

NOTE: Almost all drivers have been tested except the motion sensor
driver as i was not able to find any device that had one.

Atharva Tiwari (14):
  treewide: Add backend for macsmc
  platform/x86: add backend for macsmc in intel macs
  watchdog: add driver for apple smc
  iio/light: add new driver for macsmc
  iio/accel: add driver for apple SMS
  leds: add support for macsmc kbl
  rtc: add support for x86 macs in macsmc-rtc
  treewide: Add a flag to detect the Apple T2 chip
  treewide: disable other rtc's in t2 macs
  power/supply: add support for x86 macs in macsmc-power
  acpi: disable battery and adapter for x86 apple machines
  hwmon/macsmc: add more types
  hwmon: add support for x86 macs in macsmc-hwmon
  mfd/macsmc: add ioctl to access smc keys

 MAINTAINERS                                   |    2 +-
 arch/x86/kernel/quirks.c                      |   37 +
 drivers/acpi/acpi_tad.c                       |    4 +
 drivers/acpi/sbs.c                            |   17 +-
 drivers/acpi/x86/utils.c                      |    4 +
 drivers/gpio/Kconfig                          |    2 +-
 drivers/gpio/gpio-macsmc.c                    |   13 +-
 drivers/hwmon/Kconfig                         |    7 +-
 drivers/hwmon/macsmc-hwmon.c                  | 1126 ++++++++++++++++-
 drivers/iio/accel/Kconfig                     |   10 +
 drivers/iio/accel/Makefile                    |    1 +
 drivers/iio/accel/macsmc-accel.c              |  248 ++++
 drivers/iio/light/Kconfig                     |   11 +
 drivers/iio/light/Makefile                    |    1 +
 drivers/iio/light/macsmc-light.c              |  189 +++
 drivers/leds/Kconfig                          |   11 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-macsmc.c                    |   69 +
 drivers/mfd/Kconfig                           |   15 +-
 drivers/mfd/Makefile                          |    2 +-
 drivers/mfd/macsmc-core.c                     |  362 ++++++
 drivers/platform/x86/Kconfig                  |   10 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/macsmc-acpi.c            |  642 ++++++++++
 drivers/power/reset/Kconfig                   |    2 +-
 drivers/power/supply/Kconfig                  |    2 +-
 drivers/power/supply/macsmc-power.c           |  751 ++++++++---
 drivers/rtc/Kconfig                           |    2 +-
 drivers/rtc/rtc-cmos.c                        |    4 +
 drivers/rtc/rtc-macsmc.c                      |  126 +-
 drivers/soc/apple/Kconfig                     |   14 +
 drivers/soc/apple/Makefile                    |    2 +
 .../macsmc.c => soc/apple/macsmc-rtkit.c}     |  185 ++-
 drivers/watchdog/Kconfig                      |   11 +
 drivers/watchdog/Makefile                     |    2 +-
 drivers/watchdog/macsmc_wdt.c                 |  140 ++
 include/linux/mfd/macsmc.h                    |  104 +-
 include/linux/platform_data/x86/apple.h       |    5 +
 .../platform_certs/keyring_handler.h          |    8 -
 security/integrity/platform_certs/load_uefi.c |   38 +-
 40 files changed, 3786 insertions(+), 395 deletions(-)
 create mode 100644 drivers/iio/accel/macsmc-accel.c
 create mode 100644 drivers/iio/light/macsmc-light.c
 create mode 100644 drivers/leds/leds-macsmc.c
 create mode 100644 drivers/mfd/macsmc-core.c
 create mode 100644 drivers/platform/x86/macsmc-acpi.c
 rename drivers/{mfd/macsmc.c => soc/apple/macsmc-rtkit.c} (70%)
 create mode 100644 drivers/watchdog/macsmc_wdt.c

-- 
2.55.0

