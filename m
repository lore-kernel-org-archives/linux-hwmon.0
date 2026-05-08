Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755783630B7;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=uDz18J0E64XZUaEPWh50R+NXnHEXiuF4198SnpAxxUiSK5PwSiehmFYCI80KLLVwjx+6sIvHAHFgLM2u4J3wIAusUZye+BoWHk0+/wByXb6fJ2nzK8XY7RYJuPrJnr8EjjR7rmpZ1K+PKY76FgsNQo9x/8cYMjg3g41GpekSQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=jt0U3NVrVS1sKLM6aSFaTtJhs6yLPAuUJNrXgqbkitg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZNC5EWDYuYaJtRiFSWQnIS9K8xia+ksgwU4C5z/P1gtq9gu2ZqIertIvyjyUII162gNYayIyWqTdhMGmv52L52MoMr197koNErU1/02pSoSgoKqLzfkACvJ1ibJJ1pSorUIaoCX+3O1orFDjP1fokiJk3BcIXDZTUih9HV2MlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiDW5SFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiDW5SFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5651DC2BCB0;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=jt0U3NVrVS1sKLM6aSFaTtJhs6yLPAuUJNrXgqbkitg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kiDW5SFQEn1EP9zwj3oMUsZFVcmA7HpHndcHIVqkR+WS9DR/VGjvH5ZXYFF/sxEAi
	 rqc++zAU+dC1q2abALKxcsYud+eG8tTSU+cEMkm128fdIVngqe5zmuT8M3kXq0QkgD
	 JkJX9Tm55d056VBTH5aQymNxHfCzoCV9LVrEnpArbE7S0+pKDZKPDHEEq5iJHHFraT
	 QFm7nlU8QkYuM1O1ft3ihnsKYCV+r4tuPL9nE8e3ZMMw/8ntqXqrEPmYb2fiBRgMbS
	 w78bNzUWS9ugr5DWGZe5C7XyTaU+yPDLPKuWD+32P7DGW2u9T2rK3RO+O9RnyvUaUb
	 IjRqK3P1DkNaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46166CD37AC;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH 0/7] hwmon: (pmbus/adm1266) RTC fix, blackbox, FW rev,
 rtc_class
Date: Fri, 08 May 2026 16:33:12 -0700
Message-Id: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhy/mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3cSUXEMjMzPd5DTjxDQTo5Rk4xQjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAH79X4hrAAAA
X-Change-ID: 20260507-adm1266-cf3af42dc3d2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2581;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=jt0U3NVrVS1sKLM6aSFaTtJhs6yLPAuUJNrXgqbkitg=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4r2p+ZsuDQpJOV5jeuBCUtnlPwfeOFcx4+Vxl57
 vT5WM55NKOyo5SFQYyLQVZMkWXOI/83bR1tERtiDtnDzGFlAhnCwMUpABN5OpHhf6Dufk1G0+Jj
 64NuXj7Es3fOnOBSJfO7m26onDkp4+rmGMDwP+J7ncqVmOnRZ9+s6ZibfMNgg1OZ6s+Vshb7Ij6
 c/iktxA8A3JdTJg==
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

This series fixes a few issues in the adm1266 driver and fills in
some gaps, as listed below.

Patch 1 is a wall-clock RTC bug fix: the driver currently seeds the
device's timestamp counter with CLOCK_MONOTONIC seconds, which makes
blackbox record timestamps non-comparable across reboots. It carries
a Fixes: tag.

Patch 2 writes the 16-bit fractional-seconds field of SET_RTC that
the driver was zeroing, restoring sub-second resolution on records.

Patch 3 exposes the firmware revision (IC_DEVICE_REV, 0xAE) via
debugfs alongside the existing sequencer_state entry.

Patch 4 adds a write-only clear_blackbox debugfs file. Devices
configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
an explicit clear once the 32-record buffer fills; the documented
sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
from userspace.

Patch 5 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
The same value is embedded in every blackbox record, so the live
value lets userspace match a captured record back to the boot it
came from when correlating logs.

Patch 6 registers an rtc_class device backed by SET_RTC. The data
sheet (Rev. D, p. 22) explicitly recommends "frequently send the
time stamp to the ADM1266 to synchronize the UNIX time and reduce
the time from drifting" when running on the internal oscillator
(no external 32.768 kHz crystal). With this patch userspace can
drive the re-sync via standard tooling (hwclock, chrony,
systemd-timesyncd) against /dev/rtcN, with no driver-specific
sysfs ABI.

Patch 7 disambiguates GPIO line labels on platforms that fit two
ADM1266 devices on different I2C buses at the same slave address.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (7):
      hwmon: (pmbus/adm1266) use wall-clock seconds for SET_RTC
      hwmon: (pmbus/adm1266) write fractional-seconds field of SET_RTC
      hwmon: (pmbus/adm1266) add firmware_revision debugfs entry
      hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
      hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
      hwmon: (pmbus/adm1266) register rtc_class device backed by SET_RTC
      hwmon: (pmbus/adm1266) include adapter number in GPIO line label

 drivers/hwmon/pmbus/adm1266.c | 177 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 167 insertions(+), 10 deletions(-)
---
base-commit: 917719c412c48687d4a176965d1fa35320ec457c
change-id: 20260507-adm1266-cf3af42dc3d2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


