Received: from mx8.mail-out.lima-city.de (mx8.mail-out.lima-city.de [91.216.248.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AE13C9A9
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724737840; cv=none; b=RDcUeBHRXfcGfgYtyb7FQXc0gCX/zNuhXkdbdCRnvs3sQv1YILwSx0Qn1mR+7h1JYUcZsQk1uPor4hppRzb11XOvrC67Iz2hpJO0jwR+RZbqKjUi++n6PWWk/ewUASIP/yuxiiJk++nu0brORvszKfnOefrm35pZ5F73xH9KKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724737840; c=relaxed/simple;
	bh=vRUYXjJMb5yuCZCcveUVhpcJgNx6e8vnfKU+FC8TsI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e6PF+ew30YmA5weUBorcxgjZxGsNUHa5TazBR2+mQxn+1e/0b82X+B/NQc+Ji3Irz6wEiQiMYBfoGi4DrHSlXKgYz+7jHi3iKaU+JEeNw4Zc+y9UykXAp2DiR7ySr0HgNZu2Y8YXYzpJJ1e5gGSaVePO2HZejuC7VcMiEO/fuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de; spf=none smtp.mailfrom=johanneskirchmair.de; dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b=bV/hYQHE; arc=none smtp.client-ip=91.216.248.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=johanneskirchmair.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b="bV/hYQHE"
From: mailinglist1@johanneskirchmair.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
	s=securedbylima-20161106; t=1724737506;
	bh=vRUYXjJMb5yuCZCcveUVhpcJgNx6e8vnfKU+FC8TsI4=;
	h=From:To:Cc:Subject:Date:From;
	b=bV/hYQHEgd4v8lP2HIafYa+gcZBe7LHFThs/PqvZK4vT78KPGLTXDIk7yUz7QWn+N
	 nul/fChxIFDprXCnK27Jt+ad9iTaCqAoTVuP5ZOC2K6TlvSkIgkQS9DYUfJLmWoxY1
	 Q1gUWUHbSeVC2lh2e9HlFlWw+Ua39tnY7SH5utDk=
To: linux-hwmon@vger.kernel.org
Cc: groeck7@gmail.com,
	johannes.kirchmair@skidata.com
Subject: [PATCH v3] hwmon: pwmfan: do not force disable pwm controller
Date: Tue, 27 Aug 2024 07:44:54 +0200
Message-Id: <20240827054454.521494-1-mailinglist1@johanneskirchmair.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Kirchmair <johannes.kirchmair@skidata.com>

The pwm1_enable attribute of the pwmfan driver influences the mode of
operation, especially in case of a requested pwm1 duty cycle of zero.
Especially setting pwm1_enable to two, should keep the pwm controller
enabled even if the duty cycle is set to zero [1].

This is not the case at the moment, as the pwm controller is disabled
always if pwm1 is set to zero.

This commit tries to fix this behavior.

[1] https://docs.kernel.org/hwmon/pwm-fan.html

Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>
---
Changes since v1:
* switched to use bool for force_disable parameter
Changes since v2:
* add changelog
---
 drivers/hwmon/pwm-fan.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index a1712649b07e..c434db4656e7 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -167,7 +167,7 @@ static int pwm_fan_power_on(struct pwm_fan_ctx *ctx)
 	return ret;
 }
 
-static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
+static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, bool force_disable)
 {
 	struct pwm_state *state = &ctx->pwm_state;
 	bool enable_regulator = false;
@@ -180,7 +180,8 @@ static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
 				    state,
 				    &enable_regulator);
 
-	state->enabled = false;
+	if (force_disable)
+		state->enabled = false;
 	state->duty_cycle = 0;
 	ret = pwm_apply_might_sleep(ctx->pwm, state);
 	if (ret) {
@@ -213,7 +214,7 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 			return ret;
 		ret = pwm_fan_power_on(ctx);
 	} else {
-		ret = pwm_fan_power_off(ctx);
+		ret = pwm_fan_power_off(ctx, false);
 	}
 	if (!ret)
 		ctx->pwm_value = pwm;
@@ -468,7 +469,7 @@ static void pwm_fan_cleanup(void *__ctx)
 	del_timer_sync(&ctx->rpm_timer);
 	/* Switch off everything */
 	ctx->enable_mode = pwm_disable_reg_disable;
-	pwm_fan_power_off(ctx);
+	pwm_fan_power_off(ctx, true);
 }
 
 static int pwm_fan_probe(struct platform_device *pdev)
@@ -661,7 +662,7 @@ static int pwm_fan_suspend(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 
-	return pwm_fan_power_off(ctx);
+	return pwm_fan_power_off(ctx, true);
 }
 
 static int pwm_fan_resume(struct device *dev)
-- 
2.34.1

