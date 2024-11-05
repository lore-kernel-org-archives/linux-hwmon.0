Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C881D63EE;
	Tue,  5 Nov 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814801; cv=none; b=hgyWRizP671YRoumzL/gscFMt2IkP60OngwPIyiL3cu3lf84zALaAGcULqnou1OTFZtRyZMagyf1/uDyRBmS4sadS9g8qhFwmirh6EZqNAF2GXFTVqwCKsn+jsXYqKqKU6kCx01L7Kr6vgKmIyEVo5XKZRDMp4pJ9wOAUK5XLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814801; c=relaxed/simple;
	bh=qke3xfinQ7svPpG8G43/A+EGWLaaKP/XNn1oMhsEnts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSkWWqnV6HaohreJSnP4d5fLfkMo5t24oXJ+DprbZGFNl7zokt7el0H47IneX074xN2wAhNjZOPCPT2T8N1nMqVjP3rv6gaeRHpraegFA1rPt+KEV/24Hg51IUDj/ghMARNpiM3YAmYRuH1w/uV3+RbXhzzPI2FVqB69HlnH2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=xCOY2BXp; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="xCOY2BXp"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DC81588E60;
	Tue,  5 Nov 2024 14:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730814798;
	bh=iUSve3NbwISCq6rUP4L5qX8V8UcbZk3WE3t9EDeWV+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xCOY2BXpzPZG6k3a8nfN7eT0J0NRPjRj5gki6M0x5tTtiJwUhYrKL+j3VGjPPBpS7
	 h73nl5Wwsh4g8Uy7O8Kp4IapMelPdglDDIusxB5splHodv8wf5jvjA9em1Odk3q0PG
	 ahGlEW1p06fUobcU2ugrnfAz1TZLMBswsKIQcuCXCELTOypiOl4UQljOKnGpwFSKQ3
	 oupZnavIHKqaqcgKRqQT2xPpm7FsmZcUE/rPa3fJFw+4ZSVZJiRMxSYho88NMdDNfw
	 ogJeBKvekizU75avR4hWHHML8XKULC91Nr6AsdUdo03OJgkk2CpTV4JK5BouYJn5Xy
	 Y2T5I5zjOjd9A==
From: Marek Vasut <marex@denx.de>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop handling
Date: Tue,  5 Nov 2024 14:52:16 +0100
Message-ID: <20241105135259.101126-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105135259.101126-1-marex@denx.de>
References: <20241105135259.101126-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
to spin up from a dead stop, and can be afterward throttled down to
lower PWM duty cycle. Introduce support for operating such fans which
need to start at higher PWM duty cycle first and can slow down next.

Introduce two new DT properties, "fan-dead-stop-start-percent" and
"fan-dead-stop-start-usec". The former describes the minimum percent
of fan RPM at which it will surely spin up from dead stop. This value
can be found in the fan datasheet and can be converted to PWM duty
cycle easily. The "fan-dead-stop-start-usec" describes the minimum
time in microseconds for which the fan has to be set to dead stop
start RPM for the fan to surely spin up.

Adjust the PWM setting code such that if the PWM duty cycle is below
the minimum duty cycle needed by the fan to spin up from dead stop,
then first set the PWM duty cycle to the minimum duty cycle needed
by the fan to spin up from dead stop, then wait the time necessary
for the fan to spin up from dead stop, and finally set the PWM duty
cycle to the one desired by user.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/pwm-fan.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index c434db4656e7d..264b7ddf8bb40 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -7,6 +7,7 @@
  * Author: Kamil Debski <k.debski@samsung.com>
  */
 
+#include <linux/delay.h>
 #include <linux/hwmon.h>
 #include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
@@ -60,6 +61,9 @@ struct pwm_fan_ctx {
 
 	struct hwmon_chip_info info;
 	struct hwmon_channel_info fan_channel;
+
+	u64 pwm_duty_cycle_from_dead_stop;
+	u32 pwm_usec_from_dead_stop;
 };
 
 /* This handler assumes self resetting edge triggered interrupt. */
@@ -199,7 +203,9 @@ static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, bool force_disable)
 static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 {
 	struct pwm_state *state = &ctx->pwm_state;
+	unsigned long final_pwm = pwm;
 	unsigned long period;
+	bool update = false;
 	int ret = 0;
 
 	if (pwm > 0) {
@@ -208,11 +214,22 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 			return 0;
 
 		period = state->period;
-		state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
+		update = state->duty_cycle < ctx->pwm_duty_cycle_from_dead_stop;
+		if (update)
+			state->duty_cycle = ctx->pwm_duty_cycle_from_dead_stop;
+		else
+			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
 		ret = pwm_apply_might_sleep(ctx->pwm, state);
 		if (ret)
 			return ret;
 		ret = pwm_fan_power_on(ctx);
+		if (!ret && update) {
+			pwm = final_pwm;
+			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
+			usleep_range(ctx->pwm_usec_from_dead_stop,
+				     ctx->pwm_usec_from_dead_stop * 2);
+			ret = pwm_apply_might_sleep(ctx->pwm, state);
+		}
 	} else {
 		ret = pwm_fan_power_off(ctx, false);
 	}
@@ -480,6 +497,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	const struct hwmon_channel_info **channels;
+	u32 pwm_min_from_dead_stop = 0;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
@@ -620,6 +638,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		channels[1] = &ctx->fan_channel;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "fan-dead-stop-start-percent",
+				   &pwm_min_from_dead_stop);
+	if (!ret && pwm_min_from_dead_stop) {
+		ctx->pwm_duty_cycle_from_dead_stop =
+			DIV_ROUND_UP(pwm_min_from_dead_stop *
+				     (ctx->pwm_state.period - 1),
+				     100);
+	}
+	ret = of_property_read_u32(dev->of_node, "fan-dead-stop-start-usec",
+				   &ctx->pwm_usec_from_dead_stop);
+	if (ret)
+		ctx->pwm_usec_from_dead_stop = 250000;
+
 	ctx->info.ops = &pwm_fan_hwmon_ops;
 	ctx->info.info = channels;
 
-- 
2.45.2

