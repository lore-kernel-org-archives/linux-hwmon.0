Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592893;
	b=sADS1IlNF4yCRGZcDrv55fzCQRCNVdpt/XthkiWw0oTddVrkw7iq7vyMRgPplTBQ/WWU
	 Sm2+gE63PLN8ap9Sw6LWruXz2MOZOi5JFjcEFgVAskXdP7JvkFlhSD9DvSZGTM53dBNwC
	 QYw0u+JUnTm0VpSJw+f0wu3yCpoCyPcdl9GP2vLJ0Gs01cxGKrkjs+aRP+Q3tvLQLlDZ9
	 yElwocYTqiKcvujJp46x24ioP6wMDj3Keyu09vCyzWLTxktdSa7FTGrYPfg2+pFb7nMh0
	 ZLUPPcaoxijvAu3z7HIfYVrOZAu+7oyGz0SJZ+vT+JRW/5ZIM7K+uCe1piGD5RE2yVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592893;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DMlyh2YqL6xpLQBuXBy51QwOYGRyp3w79pXs9p6wjXo=;
	b=rvlB0WBffdH4J4+TEYazVbabznAMJh5RQeDJtkGRXebcU8dDaFd6V7K61di319U37LnG
	 azqVNJQQxeTpDoOZgKHEjv7fJ36sSTWsnOIi8xGWG/+O7qg7iCOYeNp29Rnz/KHzFF6nd
	 6ZTTyKv2sdr7BYYqGi9N/w9E7U40XmEk4BoVPqysXn1apKOTQiv/2AbbegfHij6wPh44R
	 f7Zif4uBASWMXe0jXRHSjteXTQhhgG766TulIL/wgp4D38mHlhbLF/fSWyyic9igV2uUr
	 G0tpQ5jyEarNSSfrG+051Mrm3iJfbPcXGWqYLvV3As4VWp8Jgg37+KdIammsjIwA+kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsUjYLey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF01606A8A8;
	Fri, 13 Nov 2026 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsUjYLey
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794592892;
	b=rj2zsa8eO5mkJG3osjkfXD2a0GnWCptRX5kY2esMnZyH+n/KZU/CFhzOd0hPSQx9qycB
	 G+zn5MGMB8pAGo8WrgyV/5TXRQBI0Tgwq1INp8NBMNo6Q0p4KCENsPnnm3X9i33SQdhOB
	 QdxVIB85I7fyoD5WwChkck03MyBJzL1kfz+MafeV64p1B3J8k/yNcOUzaqGn4wnm8Rg89
	 Mc5zz3wsakT8XeCw+aZTAURS3oXdRqZFeoM8J6nMHxguH1jgI+4Favghj09TEyjwGFzW7
	 gfsl+2H9r13s9v/K1OqZm7L3HDlyoI6WwoLscJWXrqpbbzFrD2/ktKAHLaZO49MfZcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794592892;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DMlyh2YqL6xpLQBuXBy51QwOYGRyp3w79pXs9p6wjXo=;
	b=CUVh1FXnixYtQopMy1/P4P28FTrdkEIGnss+xmRjsy6bikY/WXH95qrjMWSE0BmaLq5U
	 FzrA+BjaQNzj689Hlr48xnEWQY/VwfXuOnbY14YRzqflI0dQ2yVTk9K1NLFchya7eBuKA
	 anCtHi6QG9iI0as28KSoNhaoeVNanPhn2FFTexpPgAHuVKzeo2HIUeXACaVPmND864Reu
	 MO/xzOQgk+6lOpDPcVS1ZntPE2ioXtq1DcPf/3m8oIj3Q1kf/lMPb/tDZavVl7HANTk6J
	 OZJVILTgfrOZfkUos4rT+EwRniOZTtT9T2WXUZzL6p6NSnLN+ihPfKafSXSHrM8zaAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 296671F000C4;
	Fri, 13 Nov 2026 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592892;
	bh=DMlyh2YqL6xpLQBuXBy51QwOYGRyp3w79pXs9p6wjXo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=TsUjYLeyQJp4FHkRBunhDPm6OJFaxGckWE+c5lcMda0N95cRQ2j4F7yT4NzxXZAWt
	 lQ08zdYvzkZDElGIhf3o3hGT5LE7zWsDynzCKNrKViJWzobefhXnS3plK1TNSqC/VY
	 Zz2kwJ6OtZfd/fofL/rs0jy+cWLf0iCpCsDF8nSmdK82TWXgDqwd0sdE4V7oWn5KKs
	 TlcTi0JQoV1CdMFlOiWttYc0I9dQpM+x4s18nWrvoMt9kWO3SKxkHWq99KORR/uKMh
	 EuSp+A4rGwmHgN45yrIfv31mZ/qUJT7t0Lx0v3i/NFPoiyUFrG5OpwZzXW0kWPMY4s
	 UtMwzSoIAx2Ig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF0F149A58;
	Fri, 13 Nov 2026 18:01:31 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Subject: [PATCH RFC 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Date: Fri, 13 Nov 2026 10:01:29 -0800
Message-Id: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCMBAAf6Xs2YVugi14FfwAr6UHm2zqik3Kp
 j6g9N+NepyBmRUyq3CGQ7WC8lOypFiAdhW46yWOjOILg6lNQ0QWefIpKUpc+I6vSVCDQ0Ot3dt
 6sD40UNJZOcj7t+3gfDpC/5f5MdzYLd8hbNsHtGM+i30AAAA=
X-Change-ID: 20261113-emdoor-intel-wmi-rfc-2173530b3df6
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794592890; l=3693;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=JQbOY3rncIfzbhs1rsCFzoXeGSybYu6siuyOH4uu5Fk=;
 b=PmOVtzXO3VOIls9JiNhmhESX3vzKn2G50R9MMhIwLxp6XiKbrbcMiMGYYUiFTYr//wMM8JNph
 Y0NDJUd4XbICTpmjpd6ZD4YvKKPu31YWcYuhv1EDmK40YBF4LGX9Awc
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=
X-Endpoint-Received: by B4 Relay for xiazq123666@gmail.com/20261113 with
 auth_id=1513
X-Original-From: Ziqiang Xia <xiazq123666@gmail.com>
Reply-To: xiazq123666@gmail.com

This RFC patch series adds initial Linux support for the Intel EWMI
(\_SB.EWMI) WMI interface found on Emdoor-based Intel laptops, initially
matched strictly by DMI and BIOS version to the MECHREVO Wujie 14 2026
(WUJIE Series-Lark4-LNL, Intel Core Ultra 5 226V Lunar Lake, BIOS
EM_LNL326_V1.0.19).

Note on naming and scope:
- Community out-of-tree projects such as fewtarius/emdoor-wmi target AMD
  Emdoor platforms using different WMI GUIDs (8600ACCE-...) and AMD SMU
  ports. This Intel EWMI implementation (0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39,
  0B30FD67-1B62-4FCA-B10B-50DC7ADE6DDD, C75665A3-4382-4646-ADC8-C81AE146E455)
  is unrelated in protocol and EC register layout, so the driver is named
  emdoor-intel-wmi.
- Legacy WMAA-WMCA WMI methods on this DSDT trigger AE_AML_BUFFER_LIMIT due
  to an out-of-bounds CreateField() and are deliberately unused. The driver
  only uses the clean WMCD, _WED(0xD0), and WMCC interfaces through modern
  wmi_driver / wmidev_invoke_method().

Hardware quirks handled and verified on real hardware:
1. Shared EC5D mailbox lag and hotkey collision:
   AML methods GWLS (0x03/01) and GFLS (0x03/03) time out after 20 ms on
   this BIOS and return the previous mailbox byte on the call itself. After
   invoking WMCD and waiting 100 ms, the driver reads the settled mailbox
   register directly and retries up to 3 times if concurrent _QF6/_QF9
   hotkey events overwrite EC5D in flight.
2. SPFM stale-EC5F drop race:
   AML method SPFM (0x03/0a) arms ZZTT/TIZZ before Notify(IETM, 0x88) and
   before writing EC5F, so an EC scan during the notify can consume a stale
   EC5F and return RTNC=0 without updating PPMD (or return RTNC=1). The
   driver verifies 03/09 readback and reissues the absolute mode up to 3 times.

Validation summary on Linux 7.3.4 (MECHREVO WUJIE Series-Lark4-LNL,
EM_LNL326_V1.0.19):
- 1500 readonly attribute/hwmon stress reads (battery & AC online): 0 errors
- 20 platform_profile switches + 40 idempotent writes: 0 errors
- Fn-lock, Win-lock, and auto_power_on write/readback cycles: pass
- High-frequency Fn+Esc / F8 hotkey concurrency stress & s2idle: pass

Specific RFC questions for reviewers:
1. Should fn_lock, win_lock, and auto_power_on stay as WMI device sysfs
   attributes (documented in Patch 1), or would pdx86 maintainers prefer a
   firmware-attributes class interface or moving any of them?
2. Event codes 0xA1 (F7 mic-mute hotkey, _QF8) and 0xA2 (Fn+R refresh rate,
   _QF5) are conservatively mapped to KEY_PROG2 / KEY_PROG3 for now while
   verifying whether i8042 also emits scancodes on some desktops/DEs. Is
   KEY_MICMUTE / KEY_REFRESH_RATE_TOGGLE preferred once verified, or
   separate input mapping?
3. Exact DMI_BIOS_VERSION matching is used because board EC offsets (0x5d,
   0xf5, temp_regs {0x70, 0x73, 0x72, 0x62}) are board/BIOS-specific. Is
   this strict match appropriate for initial upstreaming?

Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
---
Ziqiang Xia (2):
      Documentation: ABI: testing: Add emdoor-intel-wmi sysfs ABI
      platform/x86: Add Emdoor Intel EWMI platform driver

 .../ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi  |  28 +
 MAINTAINERS                                        |   7 +
 drivers/platform/x86/Kconfig                       |  18 +
 drivers/platform/x86/Makefile                      |   1 +
 drivers/platform/x86/emdoor-intel-wmi.c            | 873 +++++++++++++++++++++
 5 files changed, 927 insertions(+)
---
base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
change-id: 20261113-emdoor-intel-wmi-rfc-2173530b3df6

Best regards,
--  
Ziqiang Xia <xiazq123666@gmail.com>


