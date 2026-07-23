Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B684968FE;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811783; cv=none; b=utCNwvS0y/8HF+c0OAvvAvzgq4DMh1SwZDil24a2fVwdeKga4959BJuqA/IdorMeCl1FcqMCDxSAru+kvzA46X6eL84wgSK4BsVALwJIRqNAO9LDGc7sNJ1naq/uG8OHGpzibh59DY7hFbpYSDqI6IjJTVpEqu1blvNKUTTqE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811783; c=relaxed/simple;
	bh=kXa6plVQtcFVC3+j2pCHXzYBLB3t/8xHvSXO96PxSfA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnM7pR6hfp1UX+MfNqk1YAU+NcXeHNr9IIV6XCnv4M9RUNurMYZvqqQB64cMQuSknth3tlR/GnL30C122Euq+XBwpCnJrEwMeMGJhQ4mzHYSygszzcQweou+dHpOD4jI1XqDIqOtaJDtHYF83f80JONpU3i0rdnhz283y/Kntp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWnjWonw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWnjWonw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 672C1C2BCB8;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784811783;
	bh=kXa6plVQtcFVC3+j2pCHXzYBLB3t/8xHvSXO96PxSfA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cWnjWonwy2elIagSZmGCSWV/Q1Ou7rlWyMuFq0InwpZV4JnIpTvJh+dP8fbQQMCNf
	 2EzpdambIKwlfEQikbfVAM+wRYu98AxblxQSjKIXk63juu6qhCRUHApmc8sfmNf34L
	 uJDnNJwVIMtsbBQGLTYMMeHUn8a7NHvg9d+iFRgx3+7JC7PtBkt+AsHkDxXoBEItZC
	 SsC2a+lKjLPipnyDY8HNgi0iATFntRodZjKIp+X3jqofgJwnDZpMa6e9Z+SjUsOpKD
	 AebQ4MvLQ2Z+cf1pLIJ1t16S6PfQ+sHhuF9Kqwlgwr4VmIJM7xjX6dRFH1GNyX5xWB
	 4Ij30qdEP3zrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB20C531CF;
	Thu, 23 Jul 2026 13:03:03 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH 0/3] hwmon: pmbus: add MPS MPQ8646 support
Date: Thu, 23 Jul 2026 15:02:41 +0200
Message-Id: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPEQYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3dyCQgszE7P4MgNdY2ML4+QkU3OTFPNEJaCGgqLUtMwKsGHRsbW
 1ANIITmhcAAAA
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784811776; l=1766;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=kXa6plVQtcFVC3+j2pCHXzYBLB3t/8xHvSXO96PxSfA=;
 b=kKQmK18ETlm33Tn76966YnxqlQbKQVxjIBKc4kHMNmNA800tJUTsQZbJ5K0u+r6W1zJzOhmcT
 +s1gUrOyW1CCPdPRMPL6cna+N12FA/lrBlnOHk5+8XGTqbr6wpBW9oM
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
      SMBALERT# pin is not available for the CPU.
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
Vincent Jardin (3):
      hwmon: pmbus: event notification with alarms
      dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
      hwmon: pmbus: add MPQ8646 driver

 .../bindings/hwmon/pmbus/mps,mpq8646.yaml          |   50 +
 Documentation/hwmon/mpq8646.rst                    |  314 +++++
 MAINTAINERS                                        |    8 +
 drivers/hwmon/pmbus/Kconfig                        |   11 +
 drivers/hwmon/pmbus/Makefile                       |    1 +
 drivers/hwmon/pmbus/mpq8646.c                      | 1214 ++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |    1 +
 drivers/hwmon/pmbus/pmbus_core.c                   |    8 +
 8 files changed, 1607 insertions(+)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-mpq8646_v0-3383cb574d7a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


