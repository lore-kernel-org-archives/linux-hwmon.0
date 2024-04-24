Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB813A3E6;
	Wed, 24 Apr 2024 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713990306; cv=none; b=a/TFxABhQwSBLQxzPtrL9/MYab9f19b7a14OdzDMTSeVLEvbhoEYT1T0R9D+u3Xis4LpwZ50f3IswOuV9kN28i4/EX+Gr9A6VmCWmYzHjkwPxYV1zJzWfYEuN5Vy7mYehHUbQdi7zZA7ILVGhMUil9W3DOLjDmaRPRL+gFt9O7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713990306; c=relaxed/simple;
	bh=FgSrIgxlzRAd49SPrh+f45sBIvkB5Nvm5cWP+UdpNpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cak9WTGuFqvvSlRDwCUqH11BTogpj2XTgaFj1sy9C5fZ521Xe0B5mcCqsb7tjxqFY+2ofSiYaW529B39sFKbSiBkuAjbX9+Jjwjtl1MEbUG7E6QBMKgxl5psaV86e+PDJ3YH97z+S7BpJzbFKv79ZybNbSDfi4SXKeFXFZyuARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54B6E1BF206;
	Wed, 24 Apr 2024 20:25:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rzjAn-0004xT-32;
	Wed, 24 Apr 2024 22:24:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH v2 2/2] hwmon: (pwm-fan): support default-pwm property to set default PWM value
Date: Wed, 24 Apr 2024 22:24:48 +0200
Message-Id: <20240424202448.19033-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424202448.19033-1-peter@korsgaard.com>
References: <20240424202448.19033-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

For some use cases defaulting the PWM to full fan speed is not ideal
(noise, power consumption, ..), so support an optional default-pwm
property (0..255) to override the default PWM value.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Rename property to default-pwm
- Drop u32 cast

 drivers/hwmon/pwm-fan.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index b67bc9e833c0..a2a309f8e3ee 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -482,6 +482,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **channels;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
+	u32 default_pwm = MAX_PWM;
 	int i;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -527,11 +528,17 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	of_property_read_u32(dev->of_node, "default-pwm", &default_pwm);
+	if (default_pwm > MAX_PWM) {
+		dev_err(dev, "Invalid default-pwm: %u > %d\n", default_pwm, MAX_PWM);
+		return -EINVAL;
+	}
+
 	/*
-	 * Set duty cycle to maximum allowed and enable PWM output as well as
+	 * Set duty cycle to default and enable PWM output as well as
 	 * the regulator. In case of error nothing is changed
 	 */
-	ret = set_pwm(ctx, MAX_PWM);
+	ret = set_pwm(ctx, default_pwm);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
-- 
2.39.2

