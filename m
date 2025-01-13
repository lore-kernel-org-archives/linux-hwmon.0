Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF922CF05;
	Mon, 13 Jan 2025 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736776298; cv=none; b=NvPc7hBcG8+8jQ1K92wfZ1NSunck/6qXHX7oE5v/gAWrUo+zYAXQOdu7FQSFa8+IaLHO7B0WMYKkYp4a4qMdLQ5Q512DcfpZvO1O0UM43QHyWMJRPXtU09CN26CFujZPY6oCOAkdTh+1zSbMqRJgVTO6aHXa2NpVnpOSP5SpsJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736776298; c=relaxed/simple;
	bh=MV3w776H71efip+uUkDnxafFSdskYJW9IH/OyHjnADg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UFHqN8QQBuStmC0Lww/aBuymJfd12mI5gS445ASqVWVxJQJJcg4j8kexjLPK8kha/Jg7HabeEt9IY9MViO9e4BDCZNMosU6pDJb/4NYQYels/LAk6yXyVq86SDPMLqr9nLVntaX9VCGW/lzelBDICMR/1D+gIJIqFY1DTOhhCls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 694E660004;
	Mon, 13 Jan 2025 13:51:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tXKqp-00GlIC-23;
	Mon, 13 Jan 2025 14:51:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5] hwmon: (pwm-fan): Default to the Maximum cooling level if provided
Date: Mon, 13 Jan 2025 14:51:18 +0100
Message-Id: <20250113135118.3994998-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
always be desirable because of noise or power consumption peaks.

The driver optionally accept a list of "cooling-levels" for the thermal
subsystem.  If provided, use the PWM value corresponding to the maximum
cooling level rather than the full level as the initial PWM setting.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v4:
- Dropped custom property, use highest cooling level

Changes since v3:
- Readded validation code from v2, reworded commit message

Changes since v2:
- Recreated/resent

Changes since v1:
- Rename property to default-pwm
- Drop u32 cast

 drivers/hwmon/pwm-fan.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 53a1a968d00d..f8282050a4dd 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -497,7 +497,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	const struct hwmon_channel_info **channels;
-	u32 pwm_min_from_stopped = 0;
+	u32 initial_pwm, pwm_min_from_stopped = 0;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
@@ -545,11 +545,22 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	ret = pwm_fan_get_cooling_data(dev, ctx);
+	if (ret)
+		return ret;
+
+
+	/* use maximum cooling level if provided */
+	if (ctx->pwm_fan_cooling_levels)
+		initial_pwm = ctx->pwm_fan_cooling_levels[ctx->pwm_fan_max_state];
+	else
+		initial_pwm = MAX_PWM;
+
 	/*
 	 * Set duty cycle to maximum allowed and enable PWM output as well as
 	 * the regulator. In case of error nothing is changed
 	 */
-	ret = set_pwm(ctx, MAX_PWM);
+	ret = set_pwm(ctx, initial_pwm);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
@@ -661,10 +672,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return PTR_ERR(hwmon);
 	}
 
-	ret = pwm_fan_get_cooling_data(dev, ctx);
-	if (ret)
-		return ret;
-
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
 		cdev = devm_thermal_of_cooling_device_register(dev,
-- 
2.39.5

