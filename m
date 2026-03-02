Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34642048
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465194; cv=none; b=fPR6kB19NJOOEKVPRIbGqmIon5BoV6hryHSpORokgejEcU4aYurCLXoQHqftPvjKPkStsvkOdC9/oRwGYIfP8z/BMfN7njZSqr8d/c4Pc8SiXrN2ZejWopUW2FV1lLQUPsIx6fkHN1uKAZ+31n0bkZb/KeJ1+1tPZhBWUPEtKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465194; c=relaxed/simple;
	bh=a3D9RrXSZxjYb+GrfIIS8vczbVo2gPY9v8kAdvVaCzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LpT+hyvi3nIUKasCLolByE+MS9YT4TsDhkw+oVFXn/aATwLsogC1V/BqGMM/sMC1R8+C9YE0r61Sm21DpzAPTbUeN9XEVSHb0YlN5pSwjfF5ecJU0H4305VQRyr6cmt7brLzmWm5ZuKjJ/D5oyqi2WC+rCFUk9bLqvB4RU9UGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vx5AF-0004YF-Sh; Mon, 02 Mar 2026 16:26:31 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 02 Mar 2026 16:26:25 +0100
Subject: [PATCH] (ina2xx) Drop bus_voltage_shift configuration
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-ina2xx-shift-v1-1-4ff5b7b76d51@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIACCspWkC/x3MTQqAIBBA4avIrBNsot+rRAvRMWdjoRGCePek5
 bd4r0CiyJRgEwUivZz4Cg19J8B4HU6SbJsBFU5qUCg5aMxZJs/ukctKFs1okWaEltyRHOd/tx+
 1fu/LEXheAAAA
X-Change-ID: 20260302-ina2xx-shift-89ed2c5d2e72
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ian Ray <ian.ray@gehealthcare.com>, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=3659; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=a3D9RrXSZxjYb+GrfIIS8vczbVo2gPY9v8kAdvVaCzk=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshcukZd6scHjeUCPrmLOp+tE7DJmpPym89duaWNrdElL
 ED7+My4jlIWBjEuBlkxRZZYNTkFIWP/62aVdrEwc1iZQIYwcHEKwEQWFTP84blm/6c5TapI617v
 ySNqlaF3VR9O1JcNrlQ8aXw6h/NYLCPDk5tsHYlPpih1a5QJbWe5e/PStzDOia/tEyzYqrKE23f
 zAwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

The INA219 has the lowest three bits of the bus voltage register
zero-reserved and the bus_voltage_shift ina2xx_config field was
introduced to accommodate for that.

The INA234 has four bits of the bus voltage, of the shunt voltage, and
of the current registers zero-reserved but the latter two were
implemented by choosing a 16x higher conversion constant instead of a
separate field specifying a bit shift.

For consistency and simplicity, drop bus_voltage_shift and adapt the
conversion constants for INA219 and INA234 accordingly, yielding the
same measurement values.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/hwmon/ina2xx.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 836e15a5a780..d7c894d7353c 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -151,7 +151,6 @@ struct ina2xx_config {
 	bool has_update_interval;
 	int calibration_value;
 	int shunt_div;
-	int bus_voltage_shift;
 	int bus_voltage_lsb;	/* uV */
 	int power_lsb_factor;
 };
@@ -172,8 +171,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.config_default = INA219_CONFIG_DEFAULT,
 		.calibration_value = 4096,
 		.shunt_div = 100,
-		.bus_voltage_shift = 3,
-		.bus_voltage_lsb = 4000,
+		.bus_voltage_lsb = 500,
 		.power_lsb_factor = 20,
 		.has_alerts = false,
 		.has_ishunt = false,
@@ -184,7 +182,6 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.config_default = INA226_CONFIG_DEFAULT,
 		.calibration_value = 2048,
 		.shunt_div = 400,
-		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
 		.has_alerts = true,
@@ -196,8 +193,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.config_default = INA226_CONFIG_DEFAULT,
 		.calibration_value = 2048,
 		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
-		.bus_voltage_shift = 4,
-		.bus_voltage_lsb = 25600,
+		.bus_voltage_lsb = 1600,
 		.power_lsb_factor = 32,
 		.has_alerts = true,
 		.has_ishunt = false,
@@ -207,7 +203,6 @@ static const struct ina2xx_config ina2xx_config[] = {
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
-		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 8,
 		.has_alerts = true,
@@ -219,7 +214,6 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.config_default = SY24655_CONFIG_DEFAULT,
 		.calibration_value = 4096,
 		.shunt_div = 400,
-		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
 		.has_alerts = true,
@@ -281,8 +275,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
 		break;
 	case INA2XX_BUS_VOLTAGE:
-		val = (regval >> data->config->bus_voltage_shift) *
-		  data->config->bus_voltage_lsb;
+		val = regval * data->config->bus_voltage_lsb;
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_POWER:
@@ -387,7 +380,7 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 		return clamp_val(val, 0, SHRT_MAX);
 	case INA2XX_BUS_VOLTAGE:
 		val = clamp_val(val, 0, 200000);
-		val = (val * 1000) << data->config->bus_voltage_shift;
+		val = val * 1000;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
 		return clamp_val(val, 0, USHRT_MAX);
 	case INA2XX_POWER:

---
base-commit: f08c5de5f61a117ba5326d3d5b86e884077da2d0
change-id: 20260302-ina2xx-shift-89ed2c5d2e72

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

