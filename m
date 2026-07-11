Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE539184C;
	Sat, 11 Jul 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763972; cv=none; b=F76ZEWDYsHM0cxEJGxXByyO2uzXtsj98YB89uJ5NCuamBQfPnqLauywy6lNei047zkrpLFGSltjuTiOLkEE51hvue/gP+JyzweVvefaaTkUwRunF3NANWv47U+nC6sr8rf6SHv9Fc4Szkaj5/v6MRBvq6KkVUjUinfSAaM70gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763972; c=relaxed/simple;
	bh=jthXYdBVWqNR/7CFQ6yzASpbT1+pG2syGHyOYibktD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FA7WB9c1sj5zDtvllxxvzBFOzn4FGJGCyeOr3nGtvRvpQ/HT3Yu4uEu72E/fiHWmeiS5J4TGyo62KcCNw+B6CzuvRa91kXIIzgyXHAXZ+6Dpd7OVtiaeVwIG7FDxIIH4v/0XyLwxTdBvqpw43DES9XyR7E8qIm7ffK4+095wfBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Z1MwexPo; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Z1MwexPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783763962;
	bh=jthXYdBVWqNR/7CFQ6yzASpbT1+pG2syGHyOYibktD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z1MwexPoxOElfkNQmn/RXHR24h0OpqUT35bvLsJbl7wX04XhZg79QvHwuwL81ScBU
	 Jljo7hZWk/6LRAlsgMs7LyASvpDn2yjIjG+RN0rwi5h8mOR3hKZe+/rQcJ0fIcDnEQ
	 445Ggc1+yQUvGdjx4AdPj4sAgrVzV9FYKfXfYQHk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 11 Jul 2026 11:59:05 +0200
Subject: [PATCH 1/3] hwmon: (cros_ec) Register the thermal devices after
 the hwmon ones
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Sung-Chi Li <lschyi@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783763961; l=1446;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jthXYdBVWqNR/7CFQ6yzASpbT1+pG2syGHyOYibktD4=;
 b=9FPU4EdehkkD/g70WArz0Cgm2TsuEjVr5ZBaiYda19TZp5U7r8ngmTc+jHsIZjzKFkzc+JI0T
 j/AOObrmRTKDPNbY4ZtdJO49Lgig/k0lBMyFt1uRv62MsiIxqqKDoKD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To guarantee consistency for the read-modify-write access in
cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
The locking will use standard hwmon device locks, which requires
the hwmon device to be ready before the fan devices are set up.

Reorder the initialization so this works.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 44291799dd8e..f9b19da50472 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -579,13 +579,17 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
 	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
 								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
-	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
 							 &cros_ec_hwmon_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
+
 	platform_set_drvdata(pdev, priv);
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 }
 
 static int cros_ec_hwmon_suspend(struct platform_device *pdev, pm_message_t state)

-- 
2.55.0

