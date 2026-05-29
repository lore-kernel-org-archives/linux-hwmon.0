Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13003769E7;
	Fri, 29 May 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086730; cv=none; b=JurBylQ35MxQERc/rJatFh9Sax1czeC8Qtih03nc9vtzxtGkVcHf1AobhgGzyQ5sy1qUVc7acWh33Hk0L1l03vkLetbezbuxh9uyu98zs5eeafD8TXM3bxvuU4fRRxjIhdS0raCu/eS+RsyydcOD/cg3qahopIDGK26dVFsewHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086730; c=relaxed/simple;
	bh=y9mUKi//PlqZu2QSuyKWMN9pMtbs4+4wS0GlSxHpeSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcvxztDZ11+kHKLNw/RT5XaSDzrqPGGsbWIWOD9LmqujhB6G7P9p+OFSaKmDrg3F8HYuWIX8poT1qLGuOcg7vbA12g6TY/cpekBCcK0O3bcDByQYzysY69vK78+/mn9nIUDNnm6esF1XP8n65qdgMY1g1L98tFa0+T/jwZ0FgKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nH+xZrNJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nH+xZrNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086726;
	bh=y9mUKi//PlqZu2QSuyKWMN9pMtbs4+4wS0GlSxHpeSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nH+xZrNJpZnam2AvbXeZpFHajCPHLvtn/hmoU8tD1Bm3nnxWQSjPU577lsN6bAspU
	 i2y95W/GG46c6dBAkRIaYmVEzMqPsaiaPzBKs0KaT2CwLwKn3OsseHEVpkO5KSXWpE
	 OxTqfU49f4ifRv0mCitfODq6YSGXvSAp7eCFz9kI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 22:31:53 +0200
Subject: [PATCH 2/5] hwmon: (cros_ec) Prepare the addition of custom groups
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=1185;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=y9mUKi//PlqZu2QSuyKWMN9pMtbs4+4wS0GlSxHpeSU=;
 b=QigvaSdZKf2GXxy3SgGLjEaN2QhCsV8opJ9veA/GK9z5dX7MSgqzPooqcoXwfEexEAb0IZctb
 q/eXuxm3HMEAQx9K2y4pYHRQUg1wwNO7uQ+3Yw20+zv8JbMuZFjOrOH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

An upcoming change will add a custom sysfs attribute group.

Set up the scaffolding for that.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index f1b6c9c2d2a3..932e45caba9c 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -402,6 +402,10 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	NULL
 };
 
+static const struct attribute_group *cros_ec_hwmon_groups[] = {
+	NULL
+};
+
 static int cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
 					       unsigned long *val)
 {
@@ -588,7 +592,8 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
-							 &cros_ec_hwmon_chip_info, NULL);
+							 &cros_ec_hwmon_chip_info,
+							 cros_ec_hwmon_groups);
 	platform_set_drvdata(pdev, priv);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);

-- 
2.54.0

