Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D991684BE
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316968; cv=none; b=RqbH3EyLVGZKwZZBdDP99mOqHkAOju0Py74NTIhBAbDbJgENkTjQviBNwAlAXcT4f2bABjBkKny8nNzGYfw8KEhEAAPMZiUDQ01djGTRizfwSgqLIvMqeEmT1d6L08V+VKg+9aT2l9nfk7qE4y81fH1Y3IjYxG5H4jDGsASP2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316968; c=relaxed/simple;
	bh=IU3hBxvaf0QrZAwtfhUKbKZmswifiaKSlrloZx0d5ZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=erN5mirNvqopU2XQ7WE/Pz0ak+IyOtU6tuVryRNTY1B+hKlfwNktdYHIClrW7lYj48ZxxnZtBPElYmVQgnzhD5nQOonUUGbLLRsARnNrzFCoLuvQuJDuKugp20cik1UfcpkY4cpJIp3ksUaYl4xAU5R2C+G5FnWdQyWD/HYAAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Ipca3Xpl; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Ipca3Xpl"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30246cfd41aso3799304eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779316965; x=1779921765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaS2vRfmYjREKYazSAFgZcmoYxp7bw68opF8o3rdTy0=;
        b=Ipca3Xplfgnpa9KJzsaBCTZvfHwn+MLxmK1O3jx/r2s6Q50d1EOUgrpf9XG9NpNiNd
         3KbhXIGYYx6FHBYApqvdDTydwEORBqcyvQgHNmLjfAVqWxhTzwmCoF4k6iHMxbjEV7/M
         FDVjs9Il/AlrVsnEIZx/N98tf5yhOsH3R9514xp9gbaM6ooF2ZgOdnUOh9+RkDNQ55k1
         mpBKXoCMCQ2gVLd0GhYy3SsnvOoXLosoXbZqU7tFi4cMkqrALPqUzUAiuEc3hE2/pf7M
         3IJ+Obrg929weKcc282iVR2lQKXdbJiLiPd6qEGMPkyocjmfvbIvLypAr5AMlYUDnlXK
         ZWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316965; x=1779921765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaS2vRfmYjREKYazSAFgZcmoYxp7bw68opF8o3rdTy0=;
        b=jc+CjjeKcwGQnUpWWOIkPmZ9rllNh+4FQH+kfu3ZOroXNc0BBLys1JiRKDb7+IpRVZ
         g3bjERGRR7Pfk0fq1V/z0JjfY8D66VHOjY23vVQ3OD8dxn9RgoSwLlS1T3m0BWObFJCM
         3bvpQfSmk81tSw5kvuOYL0LzTOtRN8uMvO+DuJrnYuilJXSuuTpkGPidj1EWk2XOu4Ku
         harhHBvcmbnfR7Kyk0dy7s8yxsJXYqehf6OIBwQ9+8Mk/MhWashcDRzVycJvurEgXeAZ
         oDliVryst/SaE9853jRz8d547PraR38Zx5cYbIJh3vs3LmgRbw0vqiW6PlkMbXWoAeWX
         vGBQ==
X-Gm-Message-State: AOJu0YxOnGny413q98IFmZ5pisWWbWBjkPUTZ6Jef7CoxxFQVzwotCEi
	6YI2LpZf/dXlXfnMaLkW09CSN0wS6a4LNwON30ERv6TBDxRqZVZ2QmeI0MkyI/PAGBM=
X-Gm-Gg: Acq92OGlKOu/jq04kQIaEQuYbRG3MUIPqRkADDs1cEi2LfYzwc96n/+33JJi7mzctTg
	R2MhmI3barFCNiMVZk2VDC4/fIWRfPT8Wl0fKEoVPdso+rnow1DVrpZmLpDt70LFXJTsx5VUuxn
	h3Nwrq4X3T93yfBN30lXOGYOrorIOQH+sgLmL25WusNb+zf7KJAeU/decZU4owvnrAaZXIrTtjQ
	xou075guANqvl4SplSXcyN+eEg75hkhH5bGLN/ZBqiUyjOMNUY19t/G+SrpVT9JVoYfAf5X4qOf
	uHvX9t2QcMOd8/BbYZdnLOkJqbblgrJI/GPb6BVJXMJT2kZMd0v9Sp+w3XaTNtJOFWnhCtQn9pZ
	/Vf/f6yQmQ1zewGsZNyMXB7DdKe1aIFvy7feBS3mZenxsKi3+lor3ctTqTnan1e+Ic5qJbaEHvW
	ot9GRtlk78ef/R7DTGptC++re/Gw==
X-Received: by 2002:a05:7300:fd0e:b0:2ed:e12:3773 with SMTP id 5a478bee46e88-3042fb490f9mr275051eec.35.1779316965283;
        Wed, 20 May 2026 15:42:45 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm25575614eec.3.2026.05.20.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:42:44 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v5 0/3] hwmon: (pmbus/adm1266) add clear_blackbox,
 powerup_counter, and rtc debugfs entries
Date: Wed, 20 May 2026 15:42:39 -0700
Message-Id: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN84DmoC/2XNywrCMBQE0F+RrI3c3PSRuvI/xEUeNzaCrTS1K
 NJ/N1W0FZcDc2YeLFIXKLLt6sE6GkIMbZNCvl4xW+vmSDy4lBkCFpBDybU7CywKbr3UPkNnpUO
 W2peOfLi9lvaHd45XcyLbT3xq1CH2bXd/XQ1i6n1W1Xd1EBw4WVDGY0VgadfQra/by0YHNs0Ou
 IACZogJSo1oKpAWvfiDcglxhjJBrYTOysqAMfAHsyUsZpglKLxyPskSc/UDx3F8AuhFUwtcAQA
 A
X-Change-ID: 20260507-adm1266-cf3af42dc3d2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779316964; l=8630;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=IU3hBxvaf0QrZAwtfhUKbKZmswifiaKSlrloZx0d5ZU=;
 b=aou1jUT+PxW2+qiW3j11ih/aLwvnGCLmlYmJ5L+ALRRDW5xBnSmhlrD+VxAw5VieImPI0JV1l
 +cDrWoE09p5CrISOfe75qawE8+pR2sfVm0NwN9ItPzHrXkNR/O4X7Sz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This is what remains of the v3 series after Guenter applied patches
1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
asked for patch 4/5 (rtc_class) to be dropped.

Patch 1 adds a write-only clear_blackbox debugfs file. Devices
configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
an explicit clear once the 32-record buffer fills; the documented
sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
from userspace. The write takes pmbus_lock so it serialises against
the multi-record nvmem blackbox-read iteration (which now also runs
under pmbus_lock after the parallel "hwmon: (pmbus/adm1266) GPIO,
NVMEM, and debugfs accessor fixes" series).

Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
The same value is embedded in every blackbox record, so the live
value lets userspace match a captured record back to the boot it
came from when correlating logs. The block-read is taken under
pmbus_lock to serialise against any pmbus_core PAGE+register
sequence on the device.

Patch 3 adds an RW rtc debugfs file backing the chip's SET_RTC
(0xDF) register.  The driver seeds SET_RTC once at probe with
ktime_get_real_seconds(); over a long uptime the chip's counter
drifts away from host wall-clock and the timestamp embedded in
each blackbox record stops being meaningful in wall-clock terms.
Read returns the chip's current seconds counter (useful for
observing drift).  Write makes the kernel re-read
ktime_get_real_seconds() itself and push it to SET_RTC -- the
write payload is ignored, so userspace cannot push a wrong value.
A userspace agent (chrony hook, systemd-timesyncd dispatch script)
can write to this file periodically to keep the chip aligned.
Patch 3 also drops the now-redundant adm1266_set_rtc() probe-time
helper, since the new adm1266_rtc_set() callback does the same
byte-packing and write; probe simply calls
adm1266_rtc_set(client, 0) after pmbus_do_probe().

This series builds on the "GPIO, NVMEM, and debugfs accessor
fixes" series now in hwmon-next, which gives it two invariants the
new debugfs files rely on:

  - adm1266_nvmem_read() runs under pmbus_lock, which is what makes
    "both clear-blackbox-write and nvmem blackbox read serialise"
    work for patch 1.

  - adm1266_config_nvmem() / adm1266_config_gpio() are called after
    pmbus_do_probe(), so any debugfs / nvmem callback that grabs
    pmbus_lock has a live mutex to take.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v5:

- Rebase onto hwmon-next, which now has the "GPIO, NVMEM, and
  debugfs accessor fixes" series applied.  As a result, the
  pre-existing-bug parts of v4 (the pmbus_lock lift in
  adm1266_nvmem_read() and the adm1266_config_nvmem() probe-order
  move that were folded into patch 1, plus former patch 3
  "serialize sequencer_state debugfs read with pmbus_lock") are
  now in the tree via that series with Fixes: tags and Cc: stable,
  so they come out of this feature series.

- Patch 1 (clear_blackbox) shrinks accordingly to just the new
  debugfs entry and its own pmbus_lock-guarded write handler.

- Drop former patch 3 (state_read lock) for the same reason -- it
  is gpio-fixes patch 8 now.

- New patch 3: add an RW rtc debugfs entry exposing the
  chip's SET_RTC (0xDF) register.  Read returns the chip's
  current seconds counter so userspace can observe drift; write
  makes the kernel re-read ktime_get_real_seconds() and push it
  to SET_RTC (the write payload is ignored).  Implements the
  combined RW shape Guenter suggested when I asked about
  re-exposing SET_RTC after the v3 rtc_class approach was
  rejected.  Patch 3 also drops the now-redundant
  adm1266_set_rtc() probe-time helper -- the new
  adm1266_rtc_set() callback does the same work, so probe calls
  it directly (with an ignored @val argument) after
  pmbus_do_probe().

- Add Assisted-by: trailers to all three patches per
  Documentation/process/coding-assistants.rst (Claude Code during
  development, sashiko's Gemini-backed reviewer during v2/v3
  review cycles).

- Cover body reworked to describe the (now satisfied) gpio-fixes
  dependency as a "builds on" rather than "depends on" relation.

- Link to v4: https://patch.msgid.link/20260516-adm1266-v4-0-1f8df4797258@nexthop.ai

Changes in v4:
- Drop former patches 1 (firmware_revision) and 5 (GPIO line label):
  applied to hwmon-next by Guenter.
- Drop former patch 4 (rtc_class) per Guenter's review: turning the
  chip into a pseudo rtc_class device and making the driver depend
  on the RTC subsystem was rejected. The underlying CLOCK_MONOTONIC
  -vs- wall-clock bug in the original probe-time seed is fixed
  independently in the "hwmon: (pmbus/adm1266) buffer-bound and
  timestamp fixes" series sent in parallel, so the seed-at-probe
  behaviour becomes correct without this driver needing to depend
  on RTC_CLASS.
- Patch 1 (clear_blackbox, was 2/5): take pmbus_lock at the outer
  adm1266_nvmem_read() callback rather than inside
  adm1266_nvmem_read_blackbox() so it covers the memset of
  data->dev_mem, the refill, and the memcpy to userspace as a
  single critical section. The nvmem core does not serialize
  concurrent reg_read invocations, so the v3 placement still let
  the memset race with another reader's memcpy to userspace
  (Sashiko review of v3).
- Patch 2 (powerup_counter, was 3/5): take pmbus_lock around the
  block-read so the access serialises with any pmbus_core sequence
  that sets PAGE on the device (Sashiko review of v3).
- New patch 3: take pmbus_lock in adm1266_state_read() (the
  sequencer_state debugfs handler).  Same defensive-locking
  argument as patches 1 and 2; surfaced while folding similar
  fixes into the parallel "hwmon: (pmbus/adm1266) GPIO accessor
  fixes" series.
- Link to v3: https://patch.msgid.link/20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai

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
Abdurrahman Hussain (3):
      hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
      hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
      hwmon: (pmbus/adm1266) add rtc debugfs entry

 drivers/hwmon/pmbus/adm1266.c | 155 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 134 insertions(+), 21 deletions(-)
---
base-commit: 7e63dac55e2de42a7947613c01e3d3c0fb9c15fc
change-id: 20260507-adm1266-cf3af42dc3d2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

