Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B026B0A9;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474918; cv=none; b=OmXoP+Ci97MgfjArfIti23QX9zzbPhksEAyEF6w803s4MHW/xhytA9gxBjPtL04SqQh1CIAhZE4rqq8DWolmPayKu7JgJUitM40DvqE+0/FoWRv0dDfBwXWmZkdx+g3Qgo1fls3WcsK84AWH27PxpCpBu5+N+ilUFXdy/H8JzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474918; c=relaxed/simple;
	bh=ge4OQCXy0fmwgEqR1w3vvbQqKhQjN1Vu7qZH9VrR5JI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YVQ5sb2eFbM3fZO6DnQfvWfweq6QkSPfvk3i5B8PeaBZ2jTplGaGX22sl4bRj7SsVoPtZ2QbRVUUzmB7nt9uffJfliH8yw3Q4P7rO75Jo+EUeB7M3zD8sp2c9GbK8iL6b9t6PBRDphZdqE64yPbo2Ni1w5/3exYtb+9lCrTl/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRF6YEbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRF6YEbH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08D04C2BCB0;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778474918;
	bh=ge4OQCXy0fmwgEqR1w3vvbQqKhQjN1Vu7qZH9VrR5JI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CRF6YEbHG7ljOaWmKYgfoNRV4oFTyqgBs4BsC4WggHBUpP6xcIsQF9PfbqmKNaToE
	 VTmHHPEOY00al6gOy+bSoSovPENL0tfinNXhjceIbk/rXpQKoxKjXG1vVXEdo2mVqE
	 4ugk0qcNxDHEpCAdUYoPEXjLYi3Z9CnsCcx69qy0dc2C8y25kWUCO1SL2mIR4CHm8n
	 8W8lrNw+QKf2abU10xHQ5odG6e6B8TBYK7MOguBy3rN73WVCrveIZVMflSMZ3yfbQq
	 iDsBFY44uUjfyXU/FbisU/1A1+a7OAEuAbNgL9P4RO/3bo4zvjIlJix42WzN6fe6rh
	 s4EkC13RQWOIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DFFCD37B7;
	Mon, 11 May 2026 04:48:37 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v2 0/5] hwmon: (pmbus/adm1266) blackbox, FW rev, rtc_class,
 GPIO label
Date: Sun, 10 May 2026 21:48:06 -0700
Message-Id: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZfAWoC/z2NQQ6CMBBFr0JmbU0ZtKIr72FYlOnUjolAWiQYw
 t0FjC5f8v77EySOwgku2QSRB0nSNgvgLgMKtrmzErcwoEajj/qkrHvmaIwiX1h/QEeFQ1jsLrK
 XcSvdqi+nV/1g6tf5agRJfRvf29WQr96vWv6rQ660YtJl7fHMmvja8NiHtttbgWqe5w9DT6F8s
 QAAAA==
X-Change-ID: 20260507-adm1266-cf3af42dc3d2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3349;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=ge4OQCXy0fmwgEqR1w3vvbQqKhQjN1Vu7qZH9VrR5JI=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZDHGL2Fk89+qyNzOx629o7F7Y2Z3iSSf6+W4CXxBa
 y6nZGftndNRysIgxsUgK6bIMueR/5u2jraIDTGH7GHmsDKBDGHg4hSAifhqM/zT+HzF493XuROu
 5uzzCy0462Hzy0pd4uzvA+UFk+d2FT/KZPifI74iwDeH59akOEGbR4w1Tw8VXKh6t2zJMRav1a9
 mdYjxAAArI0y1
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

This series fills in some gaps in the adm1266 driver and removes a
probe-time RTC seed that was clobbering valid device state.

Patch 1 exposes the firmware revision (IC_DEVICE_REV, 0xAE) via
debugfs alongside the existing sequencer_state entry.

Patch 2 adds a write-only clear_blackbox debugfs file. Devices
configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
an explicit clear once the 32-record buffer fills; the documented
sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
from userspace.

Patch 3 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
The same value is embedded in every blackbox record, so the live
value lets userspace match a captured record back to the boot it
came from when correlating logs.

Patch 4 replaces the probe-time SET_RTC seed with an rtc_class
device backed by SET_RTC. The existing seed used CLOCK_MONOTONIC
seconds, which is meaningless as a wall-clock time and clobbers
whatever the device retained across a warm reboot. The data sheet
(Rev. D, p. 22) explicitly recommends "frequently send the time
stamp to the ADM1266 to synchronize the UNIX time and reduce the
time from drifting" when running on the internal oscillator (no
external 32.768 kHz crystal). Letting userspace own the policy via
standard tooling (hwclock, chrony, systemd-timesyncd) against
/dev/rtcN is both more correct and avoids any driver-specific
sysfs ABI.

Patch 5 disambiguates GPIO line labels on platforms that fit two
ADM1266 devices on different I2C buses at the same slave address.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Drop the v1 "use wall-clock seconds for SET_RTC" and "write
  fractional-seconds field of SET_RTC" patches. v1 patch 6 already
  added an rtc_class device, so userspace now owns the time-set
  policy and the probe-time seed is no longer needed - removing it
  also fixes the cross-reboot blackbox-correlation regression the
  seed introduced.
- In the rtc_class patch, write the SET_RTC fractional-seconds
  bytes as zero rather than computing them from a timespec64. The
  rtc_class API is second-precision, so the divide that v1 patch 2
  was adding never produced a non-zero result anyway. This also
  drops the 64-bit divide that would have failed to link on 32-bit
  builds (Sashiko review).
- Use %d (decimal) for the I2C adapter number in GPIO line labels,
  matching the i2c-N convention used elsewhere in Linux. v1 used
  %x, which rendered bus numbers >= 10 in hexadecimal (Sashiko
  review).
- Link to v1: https://patch.msgid.link/20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai

---
Abdurrahman Hussain (5):
      hwmon: (pmbus/adm1266) add firmware_revision debugfs entry
      hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
      hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
      hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device
      hwmon: (pmbus/adm1266) include adapter number in GPIO line label

 drivers/hwmon/pmbus/adm1266.c | 162 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 150 insertions(+), 12 deletions(-)
---
base-commit: 917719c412c48687d4a176965d1fa35320ec457c
change-id: 20260507-adm1266-cf3af42dc3d2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


