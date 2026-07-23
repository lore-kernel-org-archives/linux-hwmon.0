Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB9473C88;
	Thu, 23 Jul 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821572; cv=none; b=XYlLf0QcD4qPrsHtx6frUwa6F8XCpxRWvIiC2BWHqzRLkO++ETLzz8PpqxeNyxLKjnPUd+yuZOTgKB50RqxkY49DsooDGy14pKux1h6NKXGzLckdA0hqx6DmQPJfSmDt6Nl5RtkbMt5Zl7mOa3cDtf+1Mzen+exk6NoPz/LK8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821572; c=relaxed/simple;
	bh=NCuLCoLtM6Hl+suAEaD5R2WPrK6BH+Y3Pf5I07jzxL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S8u4MVYYmrwlUlGXQyCG+KdbVYQb22fA7Kc4W9vjKBArK4LfSOcGMy6ikdYQeq1hZ0qoPBLZ2FAgP/CsBalRI8j4wz4WGtg2nEIi0u3qm0B/7VLXozAm+xAxynnaDLDPk6HO/CELaLQE4fUqw6/0r6muBYyQp81Mh+dZNuNamFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/JIYhNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/JIYhNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E694C2BCB8;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784821570;
	bh=NCuLCoLtM6Hl+suAEaD5R2WPrK6BH+Y3Pf5I07jzxL8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O/JIYhNQTdVRQ4bJDIRZ7pltPqLkH5zUebOU0dh9B4cYL1x4vsZm+YS5R07M45MfU
	 IkNWbNZf+fWbJfAfp9MTKh8HmlPX/FGKXtoc6vvsWL0CkWNl4UghWwJufD36FnfFl/
	 37eGb6lV65QFEujrWHSHYmlN4dUXLF8KLBBZsVr6UbsfvB0AVMk+GctKN8ePjwBMvB
	 E4X/HZXW+qwtjS8kF4HIILgOoYbLQYhE4Bo2q8/nOUO704IbadhY1nM8e8NW0PdWJC
	 84tBMa002S0fg7cyNESegK9nrm61j8kyBXraQqfQFhTry2FBzio7bzPU27PUDdmgNJ
	 DHHBNXn6/sVjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FAFC531D1;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v2 0/3] hwmon: pmbus: add MPS MPQ8646 support
Date: Thu, 23 Jul 2026 17:46:04 +0200
Message-Id: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADw3YmoC/23MQQ6CMBCF4auQWVvTdkqLrLyHIQZhKl0IODWNh
 vTuVtYu/5e8b4NIHChCW23AlEIMy1xCHyoYpn6+kwhjadBSW+k0isf6bKyx1yQFYoPDrXZmdD2
 Uw8rkw3vHLl3pKcTXwp/dTuq3/mWSElIogxYHV5+U9WfPREfP0OWcvywyGlyiAAAA
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784821569; l=2342;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=NCuLCoLtM6Hl+suAEaD5R2WPrK6BH+Y3Pf5I07jzxL8=;
 b=oiluK605zf0rJ4i4VZg+emDI4+CV7HrBsP1C9MaIxv4rql+NBa/oko5YEnioTz7c6Lk4I/tLG
 25CaxG1uss+DK8UWvwJYQ3oSKQjyP3HR5+jbSC+bU/F3drGCHqDqP7s
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
 drivers/hwmon/pmbus/mpq8646.c                      | 1223 ++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |    1 +
 drivers/hwmon/pmbus/pmbus_core.c                   |    8 +
 8 files changed, 1616 insertions(+)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-mpq8646_v0-3383cb574d7a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


