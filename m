Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442237;
	b=E3Je+zUQNccIiHgiN0ZKtSwsWNnsrfpSIs0060bVfzIOHB1DSpMEMUWhHn9WrvAByao3
	 T55yNYV+MxsGARTX27TBX2Znx6RK5Y2OmIIporh9KhAa4Nc+8J/rTZv39RRthsc40xlpf
	 P8T92JJf/CUrBa8tQkjsg9+XGdY/60M1qTCZBHMooi7rtNLspDqKlLuUAb+hiivEOLJX7
	 UKlGZA+xvbHA1F2W6LZK8/PICAxRUDFfTV7dwqz7riXT/Y541BkXaRu4kcmzTaRozuXKW
	 ka0TjX+gda1xtvC4cmakQCV9xRK6GtvwLIZDzhAisxzrZqYOW53m8uJusihlBdjKrwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442237;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fIFE99SJxvrMOnbve93aKwvIDcZ7r+s9YfSn7JHUaMI=;
	b=euub91M4FyIBaQ1tOTP5e3NXxntF0d+Xq/YQX1WzCs1zYVgaJYGD5gQ0dFs5jIgW1OsF
	 rXwxYMFKjUz5fUU0bRPOk/UfRPNJgm8NO+IGm93KCeS3D7UsMO49euZOwrVS1sVcLXOJZ
	 wc9aH76tZf8gmjZo9OCS0pTnfCLEUsAjGNX2QbCGE58mzxbt7/cFoXZNCzOux4X3rirM0
	 V5POsnKMab+gvSa/l3sqp17VnrmJitCKrR7hhmDdXx1X554tgMtiUBHP+S2xct1VgZbsW
	 0DFc5/gNyrw8RiOGud+XKsgzHJqeoA6P2thg6wZ3uRUQ3b6D5YEH6LIt/aqH0cRTOmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBKxhBpz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C263606A31A;
	Mon, 23 Nov 2026 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBKxhBpz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795442237;
	b=C204vHoLhQVIqElowp6evDHbglK+mrbnxEQdui8ZmhVc/PaGEWN21GHYahCEiusp7H1c
	 9cIhF/hKA4/L5TJ8PX5SjDlOUvEQS5w07ASFvyJwN/DzMfKtC8kUQmDOvRueNtVT6CgJg
	 n4hKSzvTciF5US8Q3f7OwNNb9U3EzSQmCjZSZ/+TbOKW01fSBAefZdnbQXfsMiadUJQQv
	 TwQjRjRal3G8NRlivpi6n74sB+mMNE9Hr8dEncm4n1GoocvmdwdQYJJK1S9xRxPuDwL3s
	 lcZ2GZtpHSa0Eh+0QTFouw/H/e+qvWkWsb3Hr7mkgn23Ty4U92rQ7PnrjdIN4h955ZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795442237;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fIFE99SJxvrMOnbve93aKwvIDcZ7r+s9YfSn7JHUaMI=;
	b=oR5J4QRvdBVSmqggJY/bvzJtnJJRBk23fasxqAdZLzz98zvLeJjkJ3JlJ81w2kpTX9wa
	 r6L0O7AHfyPWadKUTRY7SltOsemmc4GDzb5lhf7qeP3smENVhTS5cPhdD98oEO2ZcJRUQ
	 19Xd83y688FT8nyaVzDFmcn0oks2neoAr2bmfXNqLWLKCp7Cx/YjlC9rBuudR9jxOqaNa
	 eyhhKzRpdo9eDb552MDRFN/KWxHQaQOto5qVUFqEaNMk9VegDnn1kcBz6bgRFq5HeB7ZH
	 v20p3tfMoViNSufdlhX8ucZkn/wbssf/lNxY+MqvYAnfTs/B1adfg48hlHyQPgM/GHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7A8A1F000ED;
	Mon, 23 Nov 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442237;
	bh=fIFE99SJxvrMOnbve93aKwvIDcZ7r+s9YfSn7JHUaMI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MBKxhBpzbsXiFlSqN6cWfecmW9zkIy+eLhc6eVKnlII7siR2m1orOhPA77Mj+N8bU
	 WE99jmcIxXqA+UjzT3Bmkl/azmN6Lo+XeBwq965dSYOXP+Pr5+bXKeSkP0q3zVYM0P
	 jjZ6xwITzpvIFc0otTs+6A4b1wVnB3FEgDzZlDfJTP5/hoYATDMjSrJwcSfm3LEmF3
	 XWZ6givQI2qY1vCopDhQ8n0YJOXmdfiLyCBb/R0lrrzbrj1tFQQzHOGZ1kHVHZybnn
	 rkfZjfKWMoazsTOBAB3YvpTFyFO1bIz+W32Gg0S5Prt4OLgQrFymX0NQ/BlpDJ0MY+
	 VFpv2vZhVi9qQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 340084C4C0;
	Mon, 23 Nov 2026 13:56:52 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] platform/x86: Add Emdoor Intel EWMI platform driver
Date: Mon, 23 Nov 2026 05:56:50 -0800
Message-Id: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RjaRhpdeQ/DAtopjKGtaRE1h
 LsLeACXL3n//RkyJaYMl2KGRBNnjmEFeSjA9E3oCNmuDLKUlRBCIXkbY0IOIw348ozJGZRCq5M
 qW2VdBev0kcjxe8/e6h/nZ3snM26tzeg5jzF99t9JbN6fi0lgiVZrMk6q6qzaa+cbHo4meqiXZ
 fkClestIcoAAAA=
X-Change-ID: 20261113-emdoor-intel-wmi-rfc-2173530b3df6
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442211; l=3702;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=Dtj6FFXmz6jNRcgW4ATc31osqTiaO6dYT0JZQJpSMtg=;
 b=i7wM0m/u5DzKyBAKO4hmfWsYGNakAU9rti0pSc9jjv18rAyze0seYpgX8THUNqrRzba3hGokE
 MJwdAXcGvg/BLGITGi7UAl8QCbI1wx4eF1wcO7yIPpyX4povREimYag
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=
X-Endpoint-Received: by B4 Relay for xiazq123666@gmail.com/20261113 with
 auth_id=1513
X-Original-From: Ziqiang Xia <xiazq123666@gmail.com>
Reply-To: xiazq123666@gmail.com

This series adds a pure-WMI Linux platform driver for the Intel EWMI
(\_SB.EWMI) interface found on Emdoor-based Intel laptops, verified on
the MECHREVO Wujie 14 2026 (WUJIE Series-Lark4-LNL, Intel Core Ultra 5
226V Lunar Lake, BIOS EM_LNL326_V1.0.19).

In response to review feedback on RFC v1 regarding direct EC register
access, v2 removes every ec_read() call and every board/BIOS-specific EC
offset so the driver operates strictly through standard ACPI WMI methods
(WMCD and _WED(0xD0)) using wmi_driver / wmidev_invoke_method(), gated
by WMI GUID and WMCD GVER protocol version 1.0.1.0:
- Dual fan tachometers (fan1_input, fan2_input) via hwmon (WMCD GFNS)
- Platform profile (balanced / performance) via WMCD GPFM / SPFM,
  synced with Fn+X hardware profile-switch events
- Read-only touchpad_enabled sysfs attribute via WMCD GTPS (0x03/0x07)
- Sparse keymap input reporting for _WED(0xD0) hotkey events

Notes on firmware quirks and dropped RFC v1 features:
- Legacy WMAA-WMCB methods on this DSDT allocate an 8-byte Local0 inside
  AML and define CreateField(Local0, 0x20, 0x3F, RES3), aborting with
  AE_AML_BUFFER_LIMIT regardless of input buffer size; they are unused.
- EC temperature sensors (TSR1..TSR4) are dropped because TSR2..TSR4 are
  already exposed via int3403_thermal (SEN2..SEN4 under \_SB.IETM) and
  CPU temperature is already covered by coretemp / x86_pkg_temp / TCPU.
- fn_lock / win_lock (EC5D 20 ms mailbox race) and auto_power_on (WMCC
  write-only with EC 0xF5 readback) are dropped so v2 has zero direct EC
  access and zero per-BIOS DMI tables.
- SPFM (0x03/0x0a) arms ZZTT/TIZZ before Notify(IETM, 0x88) and before
  writing EC5F, so an EC scan during the notify can consume a stale EC5F
  and return RTNC=0 without updating PPMD (or return RTNC=1). The driver
  verifies WMCD 0x03/0x09 readback and reissues the absolute mode up to
  3 times using pure WMI calls.
- Sanitized ACPI tables (DSDT + SSDT1..SSDT28, Windows licensing table
  omitted) and decoded ewmi.mof are available at:
  https://gist.github.com/winddd666/8f739d1cab5beb503f606093ade10d65

Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
---
Changes in v2:
- Drop RFC prefix.
- Remove all direct ec_read() calls, ACPI_EC dependency, and per-BIOS
  DMI/EC offset tables (drop temp_regs, fn_lock, win_lock, and
  auto_power_on / WMCC driver).
- Keep the driver strictly pure WMI (WMCD + _WED(0xD0)) using WMI GUID
  matching and WMCD GVER (1.0.1.0) protocol version validation.
- Update ABI documentation, Kconfig, and commit descriptions accordingly.
- Link to v1: https://patch.msgid.link/20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com

To: Armin Wolf <W_Armin@gmx.de>
To: Ziqiang Xia <xiazq123666@gmail.com>
To: Hans de Goede <hansg@kernel.org>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org

---
Ziqiang Xia (2):
      Documentation: ABI: testing: Add emdoor-intel-wmi sysfs ABI
      platform/x86: Add Emdoor Intel EWMI platform driver

 .../ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi  |   7 +
 MAINTAINERS                                        |   7 +
 drivers/platform/x86/Kconfig                       |  16 +
 drivers/platform/x86/Makefile                      |   1 +
 drivers/platform/x86/emdoor-intel-wmi.c            | 494 +++++++++++++++++++++
 5 files changed, 525 insertions(+)
---
base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
change-id: 20261113-emdoor-intel-wmi-rfc-2173530b3df6

Best regards,
--  
Ziqiang Xia <xiazq123666@gmail.com>


