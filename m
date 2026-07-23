Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA3D3FF1DC;
	Thu, 23 Jul 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842727; cv=none; b=YrEOB5n7zxg6oV99JyrfxOeMHL7nAIC5ElNekNbRu3q3kFFJhyQteUwBMi2wm2lYqseESUAoZLisURSmYJZCXIlJ16ffKJzAmMx9crHqtYnALOfbRTZ+0bI3tHdY4POT7D5ZchDxrtsTuVIlhF0J+m2iqGNtgUYzX1iwOObAyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842727; c=relaxed/simple;
	bh=8L891SO39jh7jJWxVX9Uby5fEh/ijiSTng+z0n+sieE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JYK5UxnlZwbHhXFXefAZfq0Tw+lp9vgYqcoynQPUX1yVrnn6BdJE1Uf/SIz48aQeonTboINkHoskgg0vD2YzYU3jYbyvUZj2QwwwU3efKT7ByGM0w80IhhslIAanXSXKHsmcUzAbAUwqwM6mHR8MgNE+rFngWnEgumsCC8UJqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moDscDDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moDscDDM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E3DC2BCB8;
	Thu, 23 Jul 2026 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784842726;
	bh=8L891SO39jh7jJWxVX9Uby5fEh/ijiSTng+z0n+sieE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=moDscDDMezSbwRHXbUyA1GnxnxdT8HnSXgp3ifWe2JsS+Ua8yW4xwen1f+XM6UIt5
	 u95UqlIyRRupIeediGkS0fEv/+OB8xjuolLdImZv4elnXQ4Wx9cs7aP3ppUegt7Mp2
	 8rFGYtvMRmLMsHH43cIT5Qzm7asBLG5CLoB4DZ7hZ1YG3duTGt2Lu6yu2YEezGveZW
	 Ro9OKctDz8L5GxqVxjRSGtgnqhiUXXdrvLS/Rpu8XFmNCS20ZtPzI/ASMZokrFrOdd
	 ra2NwTFl4z0tbMdW0GnFRULqMmTuxs75NV+985wNFX4fy8E10uR3NzpU29b5BlxG6l
	 CsRhpJ0aRkH+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FC8C531D1;
	Thu, 23 Jul 2026 21:38:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v4 0/3] hwmon: pmbus: add MPS MPQ8646 support
Date: Thu, 23 Jul 2026 23:38:43 +0200
Message-Id: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOJYmoC/3XNQQ7CIBCF4as0sxYDDAV05T2MMS0Fy8K2giGap
 ncXujEmdvkm+f6ZIdrgbYRjNUOwyUc/DnmIXQWmb4abJb7LGzjlkiqO5D49tBTymihB1GjaWol
 ONZDBFKzzrzV2vuTd+/gcw3ttJ1aufzOJEUqYQIlG1Qcm3ckFa/cuQIkkvg15hmiEaRVzHA39h
 bgNsXxsHHPYodZCf+GyLB/PkqxkFAEAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842725; l=3750;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=8L891SO39jh7jJWxVX9Uby5fEh/ijiSTng+z0n+sieE=;
 b=5GOuN1kyKMTSX2zeUQEe0CQTrTn3KVqtkNdfMafjsB6F5GY5o0To75sljHPPkx3nwbcqEeqVJ
 V0iPxc/AaQMBvcT60KY8/+mWJBDIEEYJ/GxTSYvCQjfC5Iqjs7ccTwP
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

Add support for the Monolithic Power Systems MPQ8646 step-down
converter as a PMBus device.

  1/3 pmbus core: add and export pmbus_get_hwmon_device() so a chip
      driver can call hwmon_notify_event() from an in-driver
      alarm-poll fallback (lm90-style) on boards where the chip's
      SMBALERT# pin is unavailable to the CPU.
  2/3 dt-bindings: the MPQ8646 binding; schema inspired from the
      mpq8785 (same mps,vout-fb-divider-ratio-permille property).
  3/3 the MPQ8646 driver: PMBus telemetry plus MFR_CFG_EXT
      gate-close retry after CLEAR_LAST_FAULT, alarm acknowledge via
      inX_reset_history, MPS-extended STATUS_WORD decode and
      post-mortem clear, the alarm-poll fallback for boards without
      SMBALERT, and on_off_config / vout_margin / mfr_pmbus_lock
      sysfs.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v4 (all reported by the Sashiko AI review on v3):
- driver: register debugfs only after a successful pmbus_do_probe() --
  the debugfs handlers take pmbus_lock() and rely on the pmbus clientdata
  that pmbus_do_probe() installs (NULL-deref window in v3)
- driver: in remove(), unregister debugfs before cancel_delayed_work_sync()
  so a debugfs write cannot re-arm the poll worker after it is cancelled
- driver: serialise the shared debugfs root create against concurrent
  probes with a static mutex
- driver: move the remaining last_probe_* updates (clear_protection_last,
  store_all, restore_all) inside mps_lock
- dt-bindings: describe the hardware, not the driver, in the description
- Link to v3: https://lore.kernel.org/r/20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr

Changes in v3 (all reported by the Sashiko AI review on v2):
- driver: alarm_poll_interval_ms is now a debugfs fops
- driver: pmbus_lock() around the async raw i2c accesses: the poll
  worker and the CLEAR_LAST_FAULT force sequence, the nvmem snapshot read
  keeps mps_lock (read-only, no chip-state change)
- driver: update last_probe_rc/last_probe_data under mps_lock to avoid
  torn diagnostics
- driver: remove the dead PMBUS_PAGE swallow in write_byte
- driver: remove the probe_page_write debugfs hook
- Link to v2: https://lore.kernel.org/r/20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr

Changes in v2:
- driver: register debugfs only after the DT-property validation, to
  avoid an early probe error to avoid dangling debugfs entries
- driver: do not schedule the alarm-poll worker when SMBALERT# (irq)
  is wired, and do not re-arm it from the worker in that case
- driver: dput() the dentry returned by debugfs_lookup()
- driver: hold mps_lock around the nvmem snapshot reads
- driver: fix VID coefficients comment
- dt-bindings: fix typo of the commit message
- Link to v1: https://lore.kernel.org/r/20260723-mpq8646_v0-v1-0-14363c75916f@free.fr

---
Vincent Jardin (3):
      hwmon: pmbus: event notification with alarms
      dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
      hwmon: pmbus: add MPQ8646 driver

 .../bindings/hwmon/pmbus/mps,mpq8646.yaml          |   50 +
 Documentation/hwmon/mpq8646.rst                    |  314 +++++
 MAINTAINERS                                        |    8 +
 drivers/hwmon/pmbus/Kconfig                        |   11 +
 drivers/hwmon/pmbus/Makefile                       |    1 +
 drivers/hwmon/pmbus/mpq8646.c                      | 1237 ++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |    1 +
 drivers/hwmon/pmbus/pmbus_core.c                   |    8 +
 8 files changed, 1630 insertions(+)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-mpq8646_v0-3383cb574d7a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


