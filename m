Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581993A8755
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485898; cv=none; b=A6L96AiJzpya7du/YF6oEqNL7ARw5tchG5HO+/k+JDmx6GAus75kBaEAUfvz/uWFuvDfz17zZandbvTQmSJycYiqP7RPYdNN8CXIIE9pxMHHfKoT1IIgRjAHAKJveUKn71s9ygK+gq5lEZDvmKY7bSgvivAf0frju0wyoATX/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485898; c=relaxed/simple;
	bh=xM916bTZTkwRT5HyT/Eda5QxuNV/acmLw3ejHozICiI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZQRGHxJjli4LwJUm2wOKDXK8jx1RqEqKN7CzWjiktoWo+0OSBdaK2LYIfzrcSdijlvX6Eb6k83hXgut0jfxUCadvW/zwCe8PO7rASM2W2Jw7Q0Wj+uCGUQxt4+fFXVKddK17JhELaRCzGy+v5K9o2rWAQwcguct1o+XiAWwmO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Fqvlz3R1; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Fqvlz3R1"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso4326935eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485885; x=1779090685; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwZ40e+EA4lVrew0IoPyLl/xtfQ6sawRSmTacADqb7E=;
        b=Fqvlz3R1AiRHmlQxiMWVELk3ll7aVtNg787PIihUqlciXofd4yKsBheg3Ez9veUwub
         ZAEviB1udU4a3gywrN/cN/w/2W1DJ410x/15HUpqlMfHJSsh7sEU0WJy1BP1egCX4l84
         A/+Zbi5vVGkty+kBGT+vLkXb2lrc3x4OfzQ+CH13iZwp1hHPwnEM9HxZjneYpgAZQkye
         zYNf4T0JCG7dVcBDAEtkYhr4qyqBWlC3C614NKrwMNVV/8zuvG/d+vs+ZvMl9gHRmJWD
         nsyLRcBUYc2CYg5s3ghyzfxzRSlVI0VYKvLf33Q4BA63OeZdxxNOuOo34RRJeQJEp/Fe
         12bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485885; x=1779090685;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwZ40e+EA4lVrew0IoPyLl/xtfQ6sawRSmTacADqb7E=;
        b=rUJQDjJ4z3l/deFpVfKi2jhCII5tFbYu40WeqJiCYRrnOGQ9gKJg5i259LE8U9tqfJ
         leunwESAH/+KV9zpHCyxF5fMjC18MsBtj9+M0qxVlTxgaXuIkZv9INuwEI46Uc9etfd6
         7+sxtz0E67k8aJ8HsBePvvXzt534OWs4VNj67tmv0JmuLIVOJPge+ZAWaZ4ROBGOXZ1y
         v/w4hU+Cg0Kn3MDkMjJRI87PWDK7f8MF57S67SvCMW50qOI6qsrYTZyw1IWQscPNKoBR
         u67FaAheI90SFwRuq6YONYhiPsfIXiN1+4xgl7vzY1uv9QE0ADVXgUOJf01aHSe7yLl5
         akqQ==
X-Gm-Message-State: AOJu0YzaMTMqf3TT+oc67E7GjT775hP9jOvvio2+6FCKE7TXtyJUsAdI
	jZf41fWDRCYnuTHk+PmGRflSqSLOU64XQIPCsblk4BEZUMeuc6yxI48J2BxLOu4ARO8=
X-Gm-Gg: Acq92OFPP0JkhUEL+c17j8QepIzzjlPvDEi+5DKb0XbpsvPoDcat4Suq7cML3wY8ZZH
	AGhnP9ayL7TeHDrVfgZx8wpz0ab7cZUral9R5iM80a+qOVob5NImkUM7WRnCmlvzRKh8hQC2KLv
	6ETEdmKA8T/uXiOAjR4U7ljR++Z+3yPDsZvWuRFy0EajDg6xXSJRzzhFOhaFbYG6SGE0Lc0DUTn
	czuur3Xbe33s953GpUDW7qPZSIVRH0stmww+YnzOoSuXmuiU4RtFdp7v4Q5z8mcm9AVPtKIRcUS
	8CYwLDtE5RiFesk5L1eDGIXz/hls7adjQOKf1DxeP7p/cQ1gfQa/xGYwTRX0IDJjOCto39gUvQK
	fGrhSsxESgvM67UHSOhSd50KAEQBlgLnSlNjZdW7HHvakjmj2Z1zoITB8ywbIzifXhVJwa/DjVG
	I7dXSfNFiDuGL2jv9zJuQTukYPrw==
X-Received: by 2002:a05:7300:b919:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-2f548e9515fmr10785130eec.9.1778485885175;
        Mon, 11 May 2026 00:51:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:24 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH RESEND v2 0/5] hwmon: (pmbus/adm1266) blackbox, FW rev,
 rtc_class, GPIO label
Date: Mon, 11 May 2026 00:51:18 -0700
Message-Id: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=3398;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xM916bTZTkwRT5HyT/Eda5QxuNV/acmLw3ejHozICiI=;
 b=SVcjtoI1DL4eJ3o+0z8xj4KqgQ8imJhLZglZCmRLs1PtpkOqXBvymL/TxYupN+2wUUwnD0DYA
 JByHFDUrpqPDWotDuxjHRmcxVg3lsuXrcr71uIoqfXXCYdlfY3FCUQv
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

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
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>

