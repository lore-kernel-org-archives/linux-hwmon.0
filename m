Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C037FF40;
	Tue, 28 Jul 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256717; cv=none; b=aEMNsP8UIpSDjAWG6u6ZLXStR92Hv7Q94pyPPeKbboiPad88Lht21/A8KS6Fe89oxFercjEi2//9EALZEC3HhICFGFd4rxBrzqItz0ESd4e4c5zuC8YrBGLO3fiDUNuXFEefHuEsj5qEw70/ZmRL6Nlo3XQzwsLCb4YJogmRKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256717; c=relaxed/simple;
	bh=/68bEN5h9Vbh67R3fDIA9Eeowf5OhI0RrraDbCOAxPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iw5oQREw8MC2XlTsbTIX7WFw8YKxACTxluydVifczak3i1aBcEFfP9++ILMC/yATramG6FKOxyXHauBelyNxqOYcfVHoAJ4I3jdxFv5jNdgt3ZIcvKI2TRE3S86wT3iZ8Tbyw4czwVFL/lHNJVR9ygYelXotatUAf82gR4vpIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoBf/4EL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoBf/4EL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FBB1C2BCC6;
	Tue, 28 Jul 2026 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785256717;
	bh=/68bEN5h9Vbh67R3fDIA9Eeowf5OhI0RrraDbCOAxPU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YoBf/4ELwJiofnfGLerOvcbpBfCF4NgMlnuEug7tFxNOw8CBoJUlW+HJT9FNTRzYT
	 9OWI29UamDalFQvkxtcv+93C4vGUzXazg8c8tNPR2Y7piDoKm2KN3CGSfFBP2n7xKc
	 U6/6oaeHwS/m1Pey9Pn8GCxdUvo9QYtdWYEZGg5pWzfaqkviVcvZrixG4Hjsh6bxre
	 Lk6mT0UKCYL3Bp1nf60cwrFPQbT4NpJudqJLNSkRnK0yo/UO6tz1kSYmbBbLNSmxRP
	 O1zJY5nuTHeIMSILROiosnsu1nogBLUCu4jxfk+BojuRkVz/yI8GZ3aOtL9nZQvVv9
	 aTLAKDuYQPuFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE07FC53219;
	Tue, 28 Jul 2026 16:38:36 +0000 (UTC)
From: Daniel Schaefer via B4 Relay <devnull+dhs.frame.work@kernel.org>
Date: Wed, 29 Jul 2026 00:38:16 +0800
Subject: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature thresholds
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQrDIBBA4auEWWfAWjAxVylZiI7NQKJlbH5Ac
 vdKl9/ivQqFhKnA1FUQOrhwTg2PvgO/uPQm5NAMWmmjBm3RSy7kcTm3nPB0kjBQdPv6RRuf3o2
 GwqgstP4jFPn6v1/zff8AeixSrWsAAAA=
X-Change-ID: 20260729-crosec-hwmon-warn-default-9f3ca86ed809
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tzung-Bi Shih <tzungbi@kernel.org>, linux@frame.work, 
 Daniel Schaefer <dhs@frame.work>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785256715; l=2383;
 i=dhs@frame.work; s=20260705; h=from:subject:message-id;
 bh=omT2q4whEkcOxIo9J62StUBGxjYSON9mpSvOGW/FPB0=;
 b=5zdOPE+UO3y/L/rqzb0IEk89jDSc4q711o3or0oJz0xKy5PD1Rnmq9V3RiA5qpEALEkEGOPcs
 MDv1WmTiZnvAS+gLp0BvoqgxSdSmOBxpHSpFVqNZ2/yGocxgk2kzNh+
X-Developer-Key: i=dhs@frame.work; a=ed25519;
 pk=O1zF7VDnmz6EZNc7sEiawR+KK650uRg1XteQ8jHwScw=
X-Endpoint-Received: by B4 Relay for dhs@frame.work/20260705 with
 auth_id=852
X-Original-From: Daniel Schaefer <dhs@frame.work>
Reply-To: dhs@frame.work

From: Daniel Schaefer <dhs@frame.work>

The EC reports a threshold of 0 K for host thresholds that are not
configured. Most Framework Computer systems don't use all thresholds.
E.g. temp_host_warn is left unset and stays at its -273 C / 0 K
default), see the EC code in zephyr/shim/src/thermal.c:

  DT_PROP_OR(node_id, temp_host_warn,  -273)

Previously these unconfigured thresholds were exposed as sysfs limits
that read back as -273.15 C, which userspace (e.g. s-tui) interpreted as
a real, permanently-exceeded limit.

To avoid this we can hide the sysfs attribute for that threshold.
See truncated example below.

Before:

> sensors cros_ec-isa-000c
cpu_f75303@4d:       +36.9°C  (crit = +74.8°C, emerg = +84.8°C)

After:

> sensors cros_ec-isa-000c
cpu_f75303@4d:       +36.9°C  (high = -273.1°C, crit = +74.8°C)
                              (emerg = +84.8°C)

Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: linux@frame.work
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 drivers/hwmon/cros_ec_hwmon.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 03bfcc40bb7c..57158443dafe 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -319,6 +319,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 					u32 attr, int channel)
 {
 	const struct cros_ec_hwmon_priv *priv = data;
+	u32 threshold;
 	u16 speed;
 
 	if (type == hwmon_fan) {
@@ -334,8 +335,17 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	} else if (type == hwmon_temp) {
 		if (priv->temp_sensor_names[channel]) {
 			if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
-				if (priv->temp_threshold_supported)
-					return 0444;
+				if (!priv->temp_threshold_supported)
+					return 0;
+
+				if (cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
+								      cros_ec_hwmon_attr_to_thres(attr),
+								      &threshold) != 0)
+					return 0;
+				if (threshold == 0)
+					return 0;
+
+				return 0444;
 			} else {
 				return 0444;
 			}

---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
change-id: 20260729-crosec-hwmon-warn-default-9f3ca86ed809

Best regards,
-- 
Daniel Schaefer <dhs@frame.work>


