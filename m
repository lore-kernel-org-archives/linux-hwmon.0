Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4EF3D413C
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323194; cv=none; b=gFNt1dUJT7YVdyfXn/bycvP7DxzDtKDqcHtLoiVCgqYes1/KQUN8Veml5aX1PdadgJvvvC+Q9Z4FuqB3Dy/LieqQHHeJPOsWgVMV0Gs7VFpimXLYkZMVN5GEa+tTlXWnpyMLp6oRJbRisuFZP+jnbCJWLSwZTXvzs9T+6prUmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323194; c=relaxed/simple;
	bh=zHr9xcPazVHWL8DJfrl78kLBlWerYRb/dlKmQut8Npw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tM72ock4S5pEPVYyc/ggPNyC9ZP2y/RKMXT3I47rIxSikMDAj8T/SYVaPx2QGGjLHTsotS+76QQGivGy4Z8juGtI6tR1Y6LVZsd+4dv0cddexn09/KIHLkQ/2Lnwv0uvN6+JOlmfKvJaag3GBwgXYj4ftMVTkTfnPdZQpjpcoxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EARffI3i; arc=none smtp.client-ip=91.218.175.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EARffI3i"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zHr9xcPazVHWL8DJfrl78kLBlWerYRb/dlKmQut8Npw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792323189; v=1; x=1792927989;
 b=EARffI3i9Q6j4HREmWe3h9i+761Hr9zI15AKvXDPKmVfwyU4FSTvf2eVNw3cGP1EjuojnQrW
 zrM5f/zeV73yhIBQWQAQFQMGryc61rB/zxvHjc5ccivBNT0Xc9caCaZbtDodKCfLz8rduzSmrV0
 +2vtsOkjpZUarIThQ6dbRGB4=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e71d276a41eb9d7b;
	Sun, 18 Oct 2026 11:33:09 +0000
X-Mizu-Trace-ID: e71d276a41eb9d7b
X-Migadu-Flow: FLOW_OUT
From: Aditya Garg <aditya.garg@linux.dev>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by modifying sysfs
Date: Sun, 18 Oct 2026 17:02:48 +0530
Message-ID: <20261018113248.12243-1-aditya.garg@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan_control module parameter in the driver enables/disables the user's
ability to manually modify the fan speeds. In case the user attempts to
change the module parameter via sysfs rather than at the time of modprobe,
changing fan speeds is still restricted.

The reason behind this is because during probe the fan_control variable is
used to restrict the user in the following two ways:

1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
		return -EOPNOTSUPP;

Here, if disabled, the OS will return an error and will not allow changing
the speeds.

2.	if (fan->attrs & BIT(attr)) {
		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
			return 0644;

		return 0444;
	}

Here, if disabled, the sysfs files are with permissions 0444.

In case a user changes the module parameter via sysfs, due to the second
check, the sysfs files remain with permissions 0444, and user isn't able to
change the speeds.

Since 2 checks are practically unnecessary, and the second is causing problems
this patch removes the second check. Now, if the module parameter is changed
via sysfs, the first check will pass and user will be able to modify the fan
speeds.

Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
---
 drivers/hwmon/macsmc-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
index 1500ec2cc..76c485832 100644
--- a/drivers/hwmon/macsmc-hwmon.c
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -390,7 +390,7 @@ static umode_t macsmc_hwmon_fan_is_visible(const struct macsmc_hwmon_fan *fan,
 					   u32 attr)
 {
 	if (fan->attrs & BIT(attr)) {
-		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
+		if (attr == hwmon_fan_target && fan->mode.macsmc_key)
 			return 0644;
 
 		return 0444;
-- 
2.53.0

