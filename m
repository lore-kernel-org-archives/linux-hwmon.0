Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718311547FB;
	Thu,  2 Jan 2025 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840256; cv=none; b=egozU6f7ZAk9J49DS+m2XEkdiFtZAC18gFQyvFBMP0I4YdUsg53QK1M/jNQ3AOapGy7g1O40kpLpzkApRFPSDUeUmCEoGaCV+AI+LYVw0Q579hbd1d7FTQExQMh8n3mOMDRM1o3T2suOttrlzYeEhTAZPwJCfGRrQduE3cAIxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840256; c=relaxed/simple;
	bh=CDFWn3cU4IaC7WCZ2vFzCMqdXGCzZpvKDRhdMZaj49A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LK3UUoSwquIaXrUjsahv8vpFGMmK7VtSRhMBOURZhMi5Y6+aPwP/wB8E/bj9bIQSFbghTKjpR8CUFLMfbPFwWkbmi4VygRJND5lDQiWAn/psFj5nGedKJKfWUF9FK8Revkvj8Krn4S0WfDxHxHuhwp+FcX2i+9FFScNhDqYBlfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC19D60006;
	Thu,  2 Jan 2025 17:50:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tTPLH-003S6O-1k;
	Thu, 02 Jan 2025 18:50:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] hwmon: (pwm-fan): Make default PWM duty cycle configurable
Date: Thu,  2 Jan 2025 18:50:41 +0100
Message-Id: <20250102175041.822977-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102175041.822977-1-peter@korsgaard.com>
References: <20250102175041.822977-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
always be desirable because of noise or power consumption peaks, so support
an optional "default-pwm" property that can be used to specify the default
PWM duty cycle.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/hwmon/pwm-fan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 53a1a968d00d..09e9047635f7 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -499,6 +499,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **channels;
 	u32 pwm_min_from_stopped = 0;
 	u32 *fan_channel_config;
+	u32 default_pwm;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
 
@@ -545,11 +546,15 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	ret = device_property_read_u32(dev, "default-pwm", &default_pwm);
+	if (ret)
+		default_pwm = MAX_PWM;
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
2.39.5

