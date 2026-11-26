Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681286;
	b=JE+30nrNcOoPf4wRcrnfJFaKy0zbXWqxSgCcccv0v0tkePyF7csnZQQ2x92BUwembtlR
	 GNsLPp5QVysQWIUMykWQfjk2FmQXY4c7YvbUdraoZRidqg3hvvZMyyKReKHHWkFBn7PZO
	 oyF+36j6/0KmxTDQ/gIxcZ6uxwPEqGKg/cKUxJQxPmWnvkV1CTUn/Efni2N6UbhYno4Zw
	 iDnTlDJbjq8prVeR86hvWEr+7gTzgmy6UP/Jp0yXV2h2oRjaAdkn0EQd6LtPHlsH6KXxd
	 yL2ZvxVoJjJ3zhc/5R/Pq8GZH7jqIFJnDpbUOGPs04jQvqQqoSdAOVSS/6LJpKBvlSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681286;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Ci7Tn+mXKRZZCIBZOWWgIkfFDVZVyUSDgq6pFAwLXvY=;
	b=WGtXFOsvRGKubUVtNAezGq0kG9vVlWNOzQ94MG907qKVXZmwgULCmbwTzx2vlA6OLiwj
	 qsJBm9i+d0V4HThLdti4hrSRFAR33dE2TDuKIA+6H2/SiH/fdxEfIO9P82y0s7fp9bjp/
	 SE/iVtdk4ScNZ7t36V+tv4xb4FIWcIfnbuEor+ye9aVIeVWL6BLwW4xAOrlSjPpTR/p8a
	 4a+G+1PRUeJ3rTQrwVNt0+0JqfU9E81TscJfAWiLej/wfREGDL+zRcSbwD19zcobfJRm7
	 mLPoE97TLds4pyeH6rglyC4XgmuiF46SqnIJH0LjsOpHNXSLyiPbgh1L2WnAno+K5IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EnRm+g/x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E7606A696;
	Thu, 26 Nov 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnRm+g/x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795681286;
	b=zmFZDyOi927MlUf89CBjspUKSFVAAAojc7yrJlHJzuhQIzMse1IkXz5u8md6RaImu3wz
	 CLjUd9dKb15xDxslc1lVvkcj3Dc/ZulnQ/eouglZ74NgxFnRaQs7yMDqH28T/BNB6d2BG
	 ChFguER7/u2SwsOTYk6nKyaR7Mq+ais1ZjE8+2R9OdrhLPDc/1U9SVuVApM/JNdKu32tH
	 xOXGLvQ9mWv6pDnuIGqbYnU/SWgG6SD3xQHssU+kGBajqOf37tM+p0np59NNSKPjeL0tV
	 04e4+21FMsUR3HgJjY3EB4CqqGXVaK8xE57wFUaNfYQo9NKGkoSy5vnLL5Qc7/IigbA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795681286;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Ci7Tn+mXKRZZCIBZOWWgIkfFDVZVyUSDgq6pFAwLXvY=;
	b=FUIitfcG1sGM1oK8ikwTNnZInU5hC5MqfHeB49DRQo6cy4Dqx3e+rgmqlCVCf2c/dapW
	 nuN8LLHMS3iktFrT+4LWRwvnfuL0Q9rRVOD1FmAl4wU34AzXs4Nc+RqXeBu8cY0I1Wv0c
	 JroqWY3NOOoCIMA9K4PCjny1JntKSgNpNSZBOoOsYoAvy5CYCgLFcouQMPq/rBfDNQgXl
	 SswUpqTYhIeXAj4riupvIG+YdhQzWnjiEDIcXHu83Ej+sUza2qnbYVShD84v/5qBxwnZR
	 TIzNFdl3F5pQvLCc3jGgGmr8Ef6nOLdjMJmdXqPLvMUf5YE+Q04/a+0Za7Y40s6HByA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CE801F000F0;
	Thu, 26 Nov 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681286;
	bh=Ci7Tn+mXKRZZCIBZOWWgIkfFDVZVyUSDgq6pFAwLXvY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EnRm+g/xoRttmz3XiZyy3/1/rzlUUXT78vS9hUYgxTsy85Eq3Ob9EgokqNuA/Vg0D
	 6I+NfIMjeVLKjqIRfszA/PxGlRQUtFHYYcURnIvunUC0zdrPKHAUWXnQeoWyqOlx1z
	 /dAFOgBe3oyAD3vhoFZynQX4odMAbeHaRVcJ52O1zWshz6KUUbNcKF4gUF8QT1ljhH
	 6KCq9WjOjxbLSX94kzRvken9h02ECt2uoml5Qn8vp7oZEmsDcu3Fll6JDdepefA+uC
	 SdokCAaJgAeuN7A8nSUrjfYNNPoJBFw2LkPK3UqEPC60LxsgcunmwFdrZ8HJflg2tS
	 ktMmitqTVoaag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EEF9F4D2F3;
	Thu, 26 Nov 2026 08:21:18 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] platform/x86: Add Emdoor Intel EWMI platform driver
Date: Thu, 26 Nov 2026 00:21:17 -0800
Message-Id: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQ6CMBAFf8X0bE3bFQie/A/jAdotrKHUtFg1h
 H8X8MLFeJzkvZmRRQyEkZ12IwuYKJLvZ4D9jum26hvkZGZmSqhcSgkcnfE+cOoH7PjTEQ9WcyU
 LyEDUYGzO5us9oKXXqr1cvxwf9Q31sLiWRUtx8OG9dpNcdn8SSXLBTVGgtgryEupz4yrqDto7t
 iSS2kjUL4maJWCPlQBRZlbhVjJN0wfns/XhDwEAAA==
X-Change-ID: 20261113-emdoor-intel-wmi-rfc-2173530b3df6
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681277; l=4820;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=mbNSsAbdhVjBjHoys7LN4MzomgEfv0qv55gysUlBqwQ=;
 b=MtY9cZGFygb5KDCse0x2MNcFzD7Wr6nhUIo1R0zug3bsSIv7bYmG7QV04KT6sUdiN4PhydHWW
 sk0Dn+F6Q7uBRLKNkqYWTDFJKuj7dN5c1WwZQH9yyowh/HJVWpSODG5
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
Changes in v3 (thanks to Ilpo Järvinen for the detailed review):
- ABI doc: update KernelVersion from 7.4 to 7.5.
- Replace EWMI_FAN_COUNT with ARRAY_SIZE(ewmi_fan_labels) and add explicit
  headers (<linux/array_size.h>, <linux/dev_printk.h>,
  <linux/devm-helpers.h>, <linux/stddef.h>).
- Use __free(kfree) with in-place declaration for the WMCD reply buffer.
- Replace magic numbers (WMCD groups/commands, profile modes, event codes)
  with named defines.
- Switch mutex_init() to devm_mutex_init() and INIT_WORK() to
  devm_work_autocancel() with proper error handling.
- Move version-query error handling inside scoped_guard(mutex, ...).
- Use 1-based retry counter in ewmi_profile_set() to drop + 1 adjustments,
  align ewmi_hwmon_read_string() early-return flow with ewmi_hwmon_read(),
  relocate the profile skip comment, and add blank lines / braces for
  multiline blocks.
- Populate semantic keycodes (KEY_RESERVED, KEY_KBDILLUMTOGGLE, KEY_FN_ESC)
  on KE_IGNORE entries in ewmi_keymap[].
- Link to v2: https://patch.msgid.link/20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com

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
 drivers/platform/x86/emdoor-intel-wmi.c            | 565 +++++++++++++++++++++
 5 files changed, 596 insertions(+)
---
base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
change-id: 20261113-emdoor-intel-wmi-rfc-2173530b3df6

Best regards,
--  
Ziqiang Xia <xiazq123666@gmail.com>


