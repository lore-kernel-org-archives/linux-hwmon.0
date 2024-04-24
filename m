Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159215886E;
	Wed, 24 Apr 2024 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949510; cv=none; b=mPWax8+o/JQtgaaNBjaKK1izg0I+qz1btIBK3yqBerp2BtoIixTTtH8R08aaDFIgKEpLQVqc4XsLW6YxgTcD+F7UIKcmxZaqBC1iIesehwOYy+NL7ZBpbotznY53RshJeQpkv3sy/zvH/h9HFuyBUtUus4Y8H9PMzm+QFD51rXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949510; c=relaxed/simple;
	bh=YE5s47CIByt3Ika8dTZUoJP9u+JZjdRLjMs11/56nZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPfJ3Cb5F1WPDBa78QBHczsn046Unv1U6yQnvRXYu7XXg6VtijCNs+ms8W52YxGN7qNVsQloLWaFJtxa83Q8hg/o1VdpGKYoUfZROJ2NIkr6g4KVkUPbp2PJF91E7SVVvlEcAi9QOlz2txeThZXmTw1BTQ8iTCcTtEYC7h41X+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BE0C1BF203;
	Wed, 24 Apr 2024 09:04:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rzYYj-009cJH-2b;
	Wed, 24 Apr 2024 11:04:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH 2/2] hwmon: (pwm-fan): support target-pwm property to set default PWM value
Date: Wed, 24 Apr 2024 11:04:53 +0200
Message-Id: <20240424090453.2292185-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424090453.2292185-1-peter@korsgaard.com>
References: <20240424090453.2292185-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

For some use cases defaulting the PWM to full fan speed is not ideal
(noise, power consumption, ..), so support an optional target-pwm
property (0..255) to override the default PWM value.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/hwmon/pwm-fan.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index b67bc9e833c0..ebdefbd5789c 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -482,6 +482,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **channels;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
+	u32 target_pwm = MAX_PWM;
 	int i;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -527,11 +528,17 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	of_property_read_u32(dev->of_node, "target-pwm", &target_pwm);
+	if (target_pwm > (u32)MAX_PWM) {
+		dev_err(dev, "Invalid target-pwm: %u > %d\n", target_pwm, MAX_PWM);
+		return -EINVAL;
+	}
+
 	/*
-	 * Set duty cycle to maximum allowed and enable PWM output as well as
+	 * Set duty cycle to target and enable PWM output as well as
 	 * the regulator. In case of error nothing is changed
 	 */
-	ret = set_pwm(ctx, MAX_PWM);
+	ret = set_pwm(ctx, target_pwm);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
-- 
2.39.2

