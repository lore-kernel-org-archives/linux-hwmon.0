Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E63EB7F0
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536030; cv=none; b=nn3KqO7NF3VzvRHw8KNBYZQChw7psOJuYSzlLVZeF/5WmYx+GzUWMGg0avza/68a0j9idWBIpXAeMjdNPyFhFVkBjs8ooPM23MKhUPFJWTgfylRweLmXaZlieIVgGKRSUwcmIsSEDUwn++q5ZwHWkwhUUbl3VAU7ulv1w/TTwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536030; c=relaxed/simple;
	bh=h+Ntf4Qn+ws+BBHFWTbwrdLTyKq1zQ+xLkOsuqxk9m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIwVKGe1mkp3Nl9zMFuncBWEwqErwjfQGu16q5nBojtG/ybuvi3RmvFSH9iloQCSjk+JzKd+/sIhOiAbMRvDQ/p/fSlQz+TzHdFGnNstDKQ4AjItxZyo5ww9loV3mYhk3TwdfnFkHzn7w6sew213LTiu4ezMOn7FwM86yxt/tK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vxNak-0002HT-KG; Tue, 03 Mar 2026 12:07:06 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 03 Mar 2026 12:07:02 +0100
Subject: [PATCH 2/2] hwmon: (ina2xx) Shift INA234 shunt and current
 registers
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-ina234-shift-v1-2-318c33ac4480@pengutronix.de>
References: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
In-Reply-To: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=5137; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=h+Ntf4Qn+ws+BBHFWTbwrdLTyKq1zQ+xLkOsuqxk9m4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshcduCmjNai2LCnSw6nbF7n5eO/Xk313vzzl+8rqmU9e
 nHtQ2t2WkcpC4MYF4OsmCJLrJqcgpCx/3WzSrtYmDmsTCBDGLg4BWAir04x/OE8VmdX4mm5MeHC
 NoEnwbnlosdul23qW7JvU+6TB1v9GGwYGX7uS954q1gqkV2tx+GS9e53S8sYzmnu44tay6nmdCR
 pET8A
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

The INA219 has the lowest three bits of the bus voltage register
zero-reserved, the bus_voltage_shift ina2xx_config field was introduced
to accommodate for that.

The INA234 has four bits of the bus voltage, of the shunt voltage, and
of the current registers zero-reserved but the latter two were
implemented by choosing a 16x higher shunt_div instead of a separate
field specifying a bit shift.

This is possible because shunt voltage and current are divided by
shunt_div, hence a 16x higher shunt_div results in a 16x smaller LSB for
both the shunt voltage and the current register, perfectly accounting
for the missing bit shift.

For consistency and correctness, account for the reserved bits via
shunt_voltage_shift and current_shift configuration fields as already
done for voltage registers and use the conversion constants given in the
INA234 datasheet.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/hwmon/ina2xx.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 6a2cebbb9f15..613ffb622b7c 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -135,9 +135,11 @@ struct ina2xx_config {
 	bool has_update_interval;
 	int calibration_value;
 	int shunt_div;
+	int shunt_voltage_shift;
 	int bus_voltage_shift;
 	int bus_voltage_lsb;	/* uV */
 	int power_lsb_factor;
+	int current_shift;
 };
 
 struct ina2xx_data {
@@ -156,59 +158,69 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.config_default = INA219_CONFIG_DEFAULT,
 		.calibration_value = 4096,
 		.shunt_div = 100,
+		.shunt_voltage_shift = 0,
 		.bus_voltage_shift = 3,
 		.bus_voltage_lsb = 4000,
 		.power_lsb_factor = 20,
 		.has_alerts = false,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.current_shift = 0,
 		.has_update_interval = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
 		.calibration_value = 2048,
 		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
 		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.current_shift = 0,
 		.has_update_interval = true,
 	},
 	[ina234] = {
 		.config_default = INA226_CONFIG_DEFAULT,
 		.calibration_value = 2048,
-		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
+		.shunt_div = 25, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
+		.shunt_voltage_shift = 4,
 		.bus_voltage_shift = 4,
 		.bus_voltage_lsb = 25600,
 		.power_lsb_factor = 32,
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = false,
+		.current_shift = 4,
 		.has_update_interval = true,
 	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
 		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 8,
 		.has_alerts = true,
 		.has_ishunt = true,
 		.has_power_average = false,
+		.current_shift = 0,
 		.has_update_interval = true,
 	},
 	[sy24655] = {
 		.config_default = SY24655_CONFIG_DEFAULT,
 		.calibration_value = 4096,
 		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
 		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
 		.has_alerts = true,
 		.has_ishunt = false,
 		.has_power_average = true,
+		.current_shift = 0,
 		.has_update_interval = false,
 	},
 };
@@ -262,7 +274,8 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
 		/* signed register */
-		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
+		val = (s16)regval >> data->config->shunt_voltage_shift;
+		val = DIV_ROUND_CLOSEST(val, data->config->shunt_div);
 		break;
 	case INA2XX_BUS_VOLTAGE:
 		val = (regval >> data->config->bus_voltage_shift) *
@@ -274,7 +287,8 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 		break;
 	case INA2XX_CURRENT:
 		/* signed register, result in mA */
-		val = (s16)regval * data->current_lsb_uA;
+		val = ((s16)regval >> data->config->current_shift) *
+		  data->current_lsb_uA;
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_CALIBRATION:
@@ -368,6 +382,7 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 	case INA2XX_SHUNT_VOLTAGE:
 		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
 		val *= data->config->shunt_div;
+		val <<= data->config->shunt_voltage_shift;
 		return clamp_val(val, 0, SHRT_MAX);
 	case INA2XX_BUS_VOLTAGE:
 		val = clamp_val(val, 0, 200000);
@@ -382,6 +397,7 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 		val = clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
 		/* signed register, result in mA */
 		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
+		val <<= data->config->current_shift;
 		return clamp_val(val, SHRT_MIN, SHRT_MAX);
 	default:
 		/* programmer goofed */

-- 
2.51.2.535.g419c72cb8a

