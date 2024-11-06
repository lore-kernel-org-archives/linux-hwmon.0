Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565220899B;
	Wed,  6 Nov 2024 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919589; cv=none; b=MU3+M/hOwrBVa2MB+eDePHNQqzU9GtmsQaUw7K6wqyM/Iw8Zp+dcqIyyLWUpUd9ZHS74QblYawGbDs8xyIf911Bn+roU9NttjTGsFv43xou9yKkpb/E1eOmRhP8M4naoBkxHxiSWoqDXv/hnz4/CAvJxS2x81kM2l8k6AAFElvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919589; c=relaxed/simple;
	bh=ntHxbb9ERDj7qVNKOiKLAKcZVzSpEyTdFw12/YYkVP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRXVnWQvAw+wnjdvTx1Bn6soytitnqJk+gdk/IQYjG5C+WobSiPbBJUnQWlldvouhffAhLX7oasEBYrsqMj7OU1DNs6SJo8zZuryfSUfAxZ9ciVKppE+ZduLkOqCW+I38rW6Bqgdd1hGqXR1v2Vd6WHFwAxIoeD1U+bDN1x3A5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=CjhFDBWk; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="CjhFDBWk"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0D16088E0A;
	Wed,  6 Nov 2024 19:59:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730919585;
	bh=7cbWQ9OmRZA03ZO3ie8FPxXT5AC6GIlScQ52QQ1uJUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjhFDBWkZpxLdRFV++vGA5YwA+glKzRQmrfGQVGhl8l83PJnZkU0sMA+4mE7AAWFS
	 NjUOuUY+EdbK7uwOZNHo8NA4RJDNdSHsrnDNNmvJqxSDRJZGrcvlL4eSyHrIM+L+NS
	 sGwks71iG2TMBBJAbU5Ej/t9eIe69Xxm48WaQLIcveHcH5nkTuBtsoAqqh3W+4Zkh6
	 U4Ws/gy4ylEXY//0eggUS6MCQzh4RSr2lPd/sAgr2YaYUJnGvr/zPt6eBcpYX4hqJv
	 AGfR5NHjVNofd1WpiY7ZRs5/m3iqaXK4uXCFUKCZCiqapG2+PRSYtTM/OHv6c9Df5I
	 NEuRzzU+NbSIg==
From: Marek Vasut <marex@denx.de>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (pwm-fan) Introduce start from stopped state handling
Date: Wed,  6 Nov 2024 19:59:05 +0100
Message-ID: <20241106185925.223736-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106185925.223736-1-marex@denx.de>
References: <20241106185925.223736-1-marex@denx.de>
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
to spin up from a stopped state, and can be afterward throttled down to
lower PWM duty cycle. Introduce support for operating such fans which
need to start at higher PWM duty cycle first and can slow down next.

Introduce two new DT properties, "fan-stop-to-start-percent" and
"fan-stop-to-start-us". The former describes the minimum percent
of fan RPM at which it will surely spin up from stopped state. This
value can be found in the fan datasheet and can be converted to PWM
duty cycle easily. The "fan-stop-to-start-us" describes the minimum
time in microseconds for which the fan has to be set to stopped state
start RPM for the fan to surely spin up.

Adjust the PWM setting code such that if the PWM duty cycle is below
the minimum duty cycle needed by the fan to spin up from stopped state,
then first set the PWM duty cycle to the minimum duty cycle needed
by the fan to spin up from stopped state, then wait the time necessary
for the fan to spin up from stopped state, and finally set the PWM duty
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
V2: - Rename fan-dead-stop-start-percent to fan-stop-to-start-percent
    - Rename fan-dead-stop-start-usec to fan-stop-to-start-us
    - Rename variables containing dead_stop to contain stopped
V3: - Use DIV_ROUND_UP_ULL() since pwm_state.period is u64
---
 drivers/hwmon/pwm-fan.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index c434db4656e7d..53a1a968d00d4 100644
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
+	u64 pwm_duty_cycle_from_stopped;
+	u32 pwm_usec_from_stopped;
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
+		update = state->duty_cycle < ctx->pwm_duty_cycle_from_stopped;
+		if (update)
+			state->duty_cycle = ctx->pwm_duty_cycle_from_stopped;
+		else
+			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
 		ret = pwm_apply_might_sleep(ctx->pwm, state);
 		if (ret)
 			return ret;
 		ret = pwm_fan_power_on(ctx);
+		if (!ret && update) {
+			pwm = final_pwm;
+			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
+			usleep_range(ctx->pwm_usec_from_stopped,
+				     ctx->pwm_usec_from_stopped * 2);
+			ret = pwm_apply_might_sleep(ctx->pwm, state);
+		}
 	} else {
 		ret = pwm_fan_power_off(ctx, false);
 	}
@@ -480,6 +497,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	const struct hwmon_channel_info **channels;
+	u32 pwm_min_from_stopped = 0;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
@@ -620,6 +638,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		channels[1] = &ctx->fan_channel;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-percent",
+				   &pwm_min_from_stopped);
+	if (!ret && pwm_min_from_stopped) {
+		ctx->pwm_duty_cycle_from_stopped =
+			DIV_ROUND_UP_ULL(pwm_min_from_stopped *
+					 (ctx->pwm_state.period - 1),
+					 100);
+	}
+	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-us",
+				   &ctx->pwm_usec_from_stopped);
+	if (ret)
+		ctx->pwm_usec_from_stopped = 250000;
+
 	ctx->info.ops = &pwm_fan_hwmon_ops;
 	ctx->info.info = channels;
 
-- 
2.45.2

