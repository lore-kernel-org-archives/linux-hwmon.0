Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904C42F709;
	Wed, 29 Jul 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361918; cv=none; b=X2OT9ZlwxDv9vUI9zReQsz+txGGA3RGpP6PDVXGOTySrwmvMHQvscDP+YACjjOJPtIzhft+SOGYcHLf37bSrHbfv8Xy3k1juS5TAfYovW6I3Gnf85YmmAz0G1usA4OzWSwwfUY7ZXx22HhxSay2svSjHtxtBMBp8mTeHIr8b4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361918; c=relaxed/simple;
	bh=4HjGqwAZEnifMCrcj0XY/f15Eo3gD72NccHcHAbnrjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FlqInA0viWGKakaBUR2l8ab81sGCsIjoSB2PUG17QZrYjRdRuLhGDQyjJ47RFjEb/QT/4Njq1fGqWRO8+ZHv1bfNtpl+m4ggVGj5Y68upYX88SlIxyzHHYyAjCXM6j9WiNVfAydLm8P2CSk3/MkQJlDgQVvBBZzBMjZtII8n/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6f4hk/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6f4hk/6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86FBDC2BCB9;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785361915;
	bh=4HjGqwAZEnifMCrcj0XY/f15Eo3gD72NccHcHAbnrjU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=u6f4hk/6+JrTTqwh4GzOgdQgs4v8DfxyXYP+HyPAiR+1/TpOnKMKP6ye0yGne9pmy
	 Usf/QEvfEfMbGlE6B8F06fKxKRvPluebHM3uaMsnE127du/hYpv1Lqru0kYDZN+Lcr
	 MliB4L7MIjX5NONFq8c9c+1lpEKQ0B4mp1IFgy/upUBg3bQN00IUc0Jmpcw6BfoAVp
	 LNzEq5GUCgLv53/TkpR9NOQJ1mSaHD1e6KeQXVZcMBdFKgXYofVxOotf0OrQ27FmWK
	 vGuCGg8cRD6xvVVup1LLcJgKJaw7JdexZio20ec+91/SCXDgrDULMCngo0soXXYxUD
	 BMuhdKL0+rBcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B39C53200;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v6 0/4] hwmon: pmbus: add MPS MPQ8646 support
Date: Wed, 29 Jul 2026 23:51:42 +0200
Message-Id: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO51amoC/3XPTQ7CIBCG4asY1mJgZvjRlfcwxlAKykKr1BCN6
 d2lbrSJXX4kzzvhxfqQU+jZZvFiOZTUp+5Sh14umD+5yzHw1NbNQIAWBpCfrzerSR+K4IgWfaM
 MtcaxCq45xPT4xHb7uk+pv3f5+WkXOb7+zRTJBZeEGr1Ra6njNuYQVjGzMVJgHkKF6Mk3RkZAL
 6YQ5yGOF12UEVu0luwU0jykChuNgK2KXgFNofqFNIGqwvo51SgX1s7BFw7D8AZkz2G4hgEAAA=
 =
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785361913; l=6143;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=4HjGqwAZEnifMCrcj0XY/f15Eo3gD72NccHcHAbnrjU=;
 b=n/orkxQZu4okf7aOSoHwGZnlT3tUrP673perPXtXDk8kE0NJDo1GjAPPB5KPFBI5UCSqrXH7I
 /ovnViMiD4BAamTRjUwcAYHRQ7ad+YdY+G0p/W8MNL/SHiNNnABcn/v
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

Add support for the Monolithic Power Systems MPQ8646 step-down
converter as a PMBus device.

  1/4 pmbus core: export pmbus_check_and_notify_faults() so a chip
      driver can run the SMBALERT# path check and notify sequence
      from a polling work item when the chip's SMBALERT# pin is
      unavailable to the CPU.
  2/4 dt-bindings: add the MPQ8646 compatible to the existing
      mps,mpq8785 schema (same mps,vout-fb-divider-ratio-permille
      property, same constraints).
  3/4 the MPQ8646 driver: PMBus telemetry
  4/4 the provisioning/NVM write entries, compiled out by default
      thanks to SENSORS_MPQ8646_DEBUG_UNSAFE.

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Vincent Jardin <vjardin@free.fr>

Changes in v6:
- core: replace the pmbus_get_hwmon_device() accessor with an exported
  pmbus_check_and_notify_faults() (suggested by Guenter Roeck on v5)
- driver: drop the bring-up probe/instrumentation debugfs entries
  (challenged by Guenter Roeck on v4)
- new patch 4/4: move the write/provisioning debugfs entries
  behind a new default-n SENSORS_MPQ8646_DEBUG_UNSAFE
- move the debugfs files into the client's pmbus debugfs directory
  (pmbus_get_debugfs_dir()), mask using VOUT_MODE checks, MPQ8646_DEBUG()
  using dev_dbg(), drop the 0xFF VOUT_MODE probe check and the
  source-attribution comments (many inline reviews reported
  by Guenter Roeck on v5)
- driver: drop the WRITE_PROTECT read shim: the HW implements the
  register (reads back 0x00, unprotected), so the core handles write
  protection as designed (reported by Guenter Roeck on v5)
- dt-bindings: fold the MPQ8646 into the existing mps,mpq8785.yaml
  (suggested by Krzysztof Kozlowski on v5)
- scope locking, guard() and scoped_guard() (suggested by Markus
  Elfring on v5)
- XXX TBD: should pmbus_check_and_notify_faults() also update
  the pmbus registered thermal zones, or is that follow-up material ?
  Currently, neither the SMBALERT# path nor this helper does it.
- Link to v5: https://lore.kernel.org/r/20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr

Changes in v5:
- driver: fix the hwmon channel indices used by the in*_alarm poll
  notifications (thanks Sashiko AI, v4)
- driver: remove the shared debugfs root on module unload, by creating
  it in module_init() and removing it in module_exit(). It also drops
  the v4 per-probe root mutex and debugfs_lookup()
  (Sashiko AI review of v4)
- doc: add Documentation/hwmon/mpq8646.rst to the toctree (kernel test robot)
- doc: fix a malformed table and drop the stale probe_page_write row
  (removed since v3) and fix typo
- Link to v4: https://lore.kernel.org/r/20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr

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
Vincent Jardin (4):
      hwmon: (pmbus/core) export pmbus_check_and_notify_faults()
      dt-bindings: hwmon: pmbus: add MPS MPQ8646
      hwmon: pmbus: add MPQ8646 driver
      hwmon: pmbus: mpq8646: gate the writes

 .../bindings/hwmon/pmbus/mps,mpq8785.yaml          |   5 +-
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/mpq8646.rst                    | 298 +++++++
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |  28 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mpq8646.c                      | 954 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   1 +
 drivers/hwmon/pmbus/pmbus_core.c                   |  14 +-
 9 files changed, 1305 insertions(+), 4 deletions(-)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-mpq8646_v0-3383cb574d7a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


