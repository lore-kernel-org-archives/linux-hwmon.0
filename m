Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4F37C922;
	Sat, 11 Jul 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763971; cv=none; b=b99U6U/z2vFmBZWiHV0gvfEKU+E+Dbk9CnnYTL4Tyv7XUoywTtXVyC3h/Awk4giQUfT+ZSeEcRI3lKbACMyiqPDISp9S9LU/MFVgLFHhPlGCZFJmmWukrnerZ0eHC5U8B3bUrUjNHjyeGsO12RNlbHy2B7vDZGO4iPMONmUjtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763971; c=relaxed/simple;
	bh=dMQ1lUCssYuYB0g5dtX2VVlawMxWhQ8Jiw8sj/VeuN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdTErXUY5bO4eplhcKbZ8EaS1bD30s5WCN5IY20PlimQtW33ir/rlgURDRmUMtf8DZQIL0c5kHxGxzzUbXCAmkmRM2t6UvFI8Pt8Ox4O+9fBlX0pc0JOTBRMke3DzO2GdiOjWDOJJ0KQTGFySdaNNd8UAU7gyu68S4zOnnfxpbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JEtPA5Tp; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JEtPA5Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783763961;
	bh=dMQ1lUCssYuYB0g5dtX2VVlawMxWhQ8Jiw8sj/VeuN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JEtPA5Tp9CihFXAByX+ln8wFQTirG8N1pXheW6PfU4tA5Ak+002D3b0oL/as9zKma
	 ke1axLvadIRM9n26XdoPh19lFiVuejIC8qHFI77P6+b4wDJmK9BRhZPWEVEHJs6J1V
	 x4p8j18QsB0W3slMJgDnBrcyybtAaDQ8/Zcsk9P8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 11 Jul 2026 11:59:06 +0200
Subject: [PATCH 2/3] hwmon: (cros_ec) Store the hwmon device in
 cros_ec_hwmon_priv
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Sung-Chi Li <lschyi@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783763961; l=1686;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=dMQ1lUCssYuYB0g5dtX2VVlawMxWhQ8Jiw8sj/VeuN8=;
 b=/6S1kv5sEnl2udIrX3KqyZmocpWG+79Lb1xc9Bca4NciQteyqGy4JWSQAqVwjyxZwG6rllfji
 Ic4XYhOIDTnA1eAga3YARj5sJzswokYkba0p2c1LJbkazZUlLzwn3vU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The upcoming locking scheme for thermal devices will require access
to the hwmon device.

Add it do the priv struct.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index f9b19da50472..fb5daa9f80d1 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -25,6 +25,7 @@
 
 struct cros_ec_hwmon_priv {
 	struct cros_ec_device *cros_ec;
+	struct device *hwmon_dev;
 	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
 	u8 usable_fans;
 	bool fan_control_supported;
@@ -556,7 +557,6 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_hwmon_priv *priv;
-	struct device *hwmon_dev;
 	u8 thermal_version;
 	int ret;
 
@@ -580,10 +580,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
 								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
-							 &cros_ec_hwmon_chip_info, NULL);
-	if (IS_ERR(hwmon_dev))
-		return PTR_ERR(hwmon_dev);
+	priv->hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
+							       &cros_ec_hwmon_chip_info, NULL);
+	if (IS_ERR(priv->hwmon_dev))
+		return PTR_ERR(priv->hwmon_dev);
 
 	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 

-- 
2.55.0

