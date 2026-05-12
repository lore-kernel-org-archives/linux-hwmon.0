Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F703655CB
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612207; cv=none; b=hP2uTAJX8yB5cwo6flMW7WNBvt+8GIqBtEGXmSz/YYOz2mVZNHGEIL0qR35l/RYYx4fCsdPQiyLkCEAHqGMhlO5Q4hGDLtZHDEKlTYdB+gJLzjt3lhYZgzkbzM7suBLyUVNfLBynWp9B2asbSy1TA7tTGZRlwjXMyd4MWcvVJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612207; c=relaxed/simple;
	bh=+YMBIwV9PmfQ/wVfFIkC/8Cs68Ha78qWkxSPko234FY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pD/1OEdgsWQtIMTvPQLTQls8iZpmlat6kPdwivMA5qBJSsIRP62wrHIXkDAQxlaYOInk1P9DOue9bAB/zZFCoyUb/rw4aQVr8x6UF7KLoeU8gKWg38wnmbwNoUFSEZy7/OwvUEq7AfQ985hki+r7ozoF18PwWnvzY+6Zon/lQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=fSMSbeuM; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="fSMSbeuM"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c88e5f4aeso3482113c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612205; x=1779217005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RwudeOz1/5DIzg767x8N3po/ZixbVQBr2ZykQqR1Sg=;
        b=fSMSbeuMm0anpzUlE7oDWx4e1umXaOnUocAkBJJEbj14TuLprcTkTwZkGniOp77ohI
         yJegV47fQRbeLjS5NuPuTKTbRO1fOSOsECz/haMUpTi8wTKptlDRfY6wzjU6N0fLaJ8Q
         jquHatc0vqbv6Nx9+e1TkA8+VKv1kczdlTPGnJ/GOCjfISNZ/TgkT1yuELQv5d5pXaYM
         T4AURIb+3ee/ZKOQkqqHyqKWr4UciAEixjAfHBfHGfAGZ4T+7g3DcQ9TUAqmF299jy5o
         ZZcB1+ItcMZv61F2Fro2e2zGwvae6WlUQ0QIqNx8lt6sfS3j4O39SW0tzurqvyHWfNz+
         gKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612205; x=1779217005;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RwudeOz1/5DIzg767x8N3po/ZixbVQBr2ZykQqR1Sg=;
        b=bbCScoU6zknIPkzfqOBCv+2w4qZXi4L7Wd5nn4u4qK0fOLZWTI3jLD4IzUwqnM+ZOp
         bG3VBdq5c9i8AizSUkAMKclYXji4tVkk7TZvltcp9SXIhm3eP63IuTcDtgWwEPAvQXOV
         /Sond5qHFY6tuZoXNY09+pq9i31wsXlmsSk4B/GhOJsDoi+8k5/tGWBlK2WrZwQXDSlA
         05jPSeRBCTWkI9ATee4oqTI/LrOU27OhKfAews+Y9e1a4OrWVpmfDi3qFpvuJWq3mmT8
         NajwsrsB34ukdF1LqWrt52rAdTdaUwmf/IDnZs1CEt050JnvkGzxNZlG5o48t18qNNi4
         /YoQ==
X-Gm-Message-State: AOJu0YyJOG00CWWQy2RC9DWRHpnWwUTiiQ3WbF+RFLmS0YaxfD8/jyYV
	g+wLhxrfrxSMmgBDtz6eeqmgHpdWgRsbcStL1DB8bXvSvwZTADPzNy6Ah7c+3oj+Ods=
X-Gm-Gg: Acq92OEhZI6N4PQ63eBkViCosP62Xvtm0Pw9bvrQSbHwXdStP7S5GLcVNxf7j4ChHmq
	08SsNuEmB3ss/nzDAc22a6Pd51OPQlmYwIdXgR7rMUOT2eIaPZ9oBjHB+kjvjnN0jpa6PN+TLYf
	BB6zhP+P/M//yZmlcbm/zuj+BMLykGvymNd+xyMz49imEYvvHvZ/wDQOJlERWoSf6HdJ5BSSCcd
	Isgq6QFBASTiUWYSo0fnmvITRLRligf8YDv9VBB5f+iFRv7bqXNCpTUtfTJ93gEG3mLkbaTMC7a
	stVAXbqCaWoOCl9+Jr9EnZ2kQ4pCB5rpebQUCf/27WWObxb3BaGGQUa9kdfVAUbrjurUr2BAl5V
	oeRNYibFHGsJWb0Jz+CXk9QvVvplJNpRMhtSdujPiBajCkGgEYBscUNuxpuG4Kl0E0yMD4dQzoy
	jkCS/qUUrUOIRO7PfYmwrHMu72wQ==
X-Received: by 2002:a05:7022:660d:b0:12c:91ef:6e63 with SMTP id a92af1059eb24-1333af97fd9mr3181913c88.7.1778612204650;
        Tue, 12 May 2026 11:56:44 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:44 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/5] hwmon: (pmbus/adm1266) blackbox, FW rev, rtc_class,
 GPIO label
Date: Tue, 12 May 2026 11:56:23 -0700
Message-Id: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANd3A2oC/1WNyw7CIBBFf6VhLWYYtFZX/odxQWGwmNg2UElN0
 38XanwtT3LPuRML5B0Fdigm5im64Lo2gVwVTDeqvRB3JjFDwBK2sOPK3ASWJddWKrtBo6VBlta
 9J+vGpXQ6vzjc6yvpIet50bgwdP6xXEWRd+9q9alGwYGThqq2uCfQdGxpHJquXyvHcjbijyjgK
 2ISpUKs9yA1WvEnzvP8BD5413/qAAAA
X-Change-ID: 20260507-adm1266-cf3af42dc3d2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=4450;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+YMBIwV9PmfQ/wVfFIkC/8Cs68Ha78qWkxSPko234FY=;
 b=5DghsLh1xbPx/5c26fySNTnV+YXoFGgtGUIgIozqtDCS4NPiIGk7pCZ9sKp49obmcJdnBHdch
 jmek7/c9dqvBAReuGVEXgkKk4S+/9W/Q4wHswGfw68Tgt2NYZscuEQv
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
Changes in v3:
- Patch 2: take guard(pmbus_lock)(client) in
  adm1266_clear_blackbox_write() and adm1266_nvmem_read_blackbox()
  to serialise the clear against the multi-record nvmem read loop
  (both share command 0xDE). Also move adm1266_config_nvmem() to
  after pmbus_do_probe() so the blackbox nvmem entry isn't exposed
  to userspace before the PMBus mutex is initialised (Sashiko
  review).
- Patch 4: take guard(pmbus_lock)(client) in the RTC
  read_time/set_time callbacks to serialise against the PMBus
  core's PAGE+register sequences. Move adm1266_register_rtc() to
  after pmbus_do_probe() for the same reason as the config_nvmem
  move; /dev/rtcN being opened by userspace (systemd-timesyncd,
  udev) before probe completed would otherwise hit an
  uninitialised mutex (observed on hardware, also flagged by
  Sashiko).
- Link to v2: https://patch.msgid.link/20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai

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

To: Guenter Roeck <linux@roeck-us.net>
To: Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abdurrahman Hussain (5):
      hwmon: (pmbus/adm1266) add firmware_revision debugfs entry
      hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
      hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
      hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device
      hwmon: (pmbus/adm1266) include adapter number in GPIO line label

 drivers/hwmon/pmbus/adm1266.c | 178 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 161 insertions(+), 17 deletions(-)
---
base-commit: 917719c412c48687d4a176965d1fa35320ec457c
change-id: 20260507-adm1266-cf3af42dc3d2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

