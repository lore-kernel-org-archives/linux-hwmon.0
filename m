Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51187 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbcK0XAi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2016 18:00:38 -0500
Date: Sun, 27 Nov 2016 15:00:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: tmp108: Update driver to use hwmon_chip_info.
Message-ID: <20161127230035.GA19132@roeck-us.net>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <1480223737-82080-4-git-send-email-john@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480223737-82080-4-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Nov 26, 2016 at 09:15:37PM -0800, John Muir wrote:
> Move the tmp108 driver from hwmon attribute groups to
> hwmon_chip_info.
> 
> Signed-off-by: John Muir <john@jmuir.com>
> ---

Hi John,

please have a look at the following patch.

Something else: Symbolic permissions are out of favor nowadays.
You might instead just use 0644 / 0444. Not that I really care,
but it prevents the inevitable follow-up patches.

Thanks,
Guenter

---
From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 27 Nov 2016 14:54:19 -0800
Subject: [PATCH] hwmon: (tmp108) Add support for various attributes

Add support for temp1_{min,max}_hyst, temp1_{min,max}_alarm,
and update_interval.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp108.c | 144 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 124 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 29ddc2e124c6..4cc2adee069a 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -103,7 +103,33 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	unsigned int regval;
-	int err, reg;
+	int err, hyst;
+
+	if (type == hwmon_chip) {
+		if (attr == hwmon_chip_update_interval) {
+			err = regmap_read(tmp108->regmap, TMP108_REG_CONF,
+					  &regval);
+			if (err < 0)
+				return err;
+			switch (regval & TMP108_CONF_CONVRATE_MASK) {
+			case TMP108_CONVRATE_0P25HZ:
+			default:
+				*temp = 4000;
+				break;
+			case TMP108_CONVRATE_1HZ:
+				*temp = 1000;
+				break;
+			case TMP108_CONVRATE_4HZ:
+				*temp = 250;
+				break;
+			case TMP108_CONVRATE_16HZ:
+				*temp = 63;
+				break;
+			}
+			return 0;
+		}
+		return -EOPNOTSUPP;
+	}
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -113,23 +139,57 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
 				__func__);
 			return -EAGAIN;
 		}
-		reg = TMP108_REG_TEMP;
+		err = regmap_read(tmp108->regmap, TMP108_REG_TEMP, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval);
 		break;
 	case hwmon_temp_min:
-		reg = TMP108_REG_TLOW;
-		break;
 	case hwmon_temp_max:
-		reg = TMP108_REG_THIGH;
+		err = regmap_read(tmp108->regmap, attr == hwmon_temp_min ?
+				  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval);
+		break;
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
+		if (err < 0)
+			return err;
+		*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
+				     TMP108_CONF_FL : TMP108_CONF_FH));
+		break;
+	case hwmon_temp_min_hyst:
+	case hwmon_temp_max_hyst:
+		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
+		if (err < 0)
+			return err;
+		switch (regval & TMP108_CONF_HYSTERESIS_MASK) {
+		case TMP108_HYSTERESIS_0C:
+		default:
+			hyst = 0;
+			break;
+		case TMP108_HYSTERESIS_1C:
+			hyst = 1000;
+			break;
+		case TMP108_HYSTERESIS_2C:
+			hyst = 2000;
+			break;
+		case TMP108_HYSTERESIS_4C:
+			hyst = 4000;
+			break;
+		}
+		err = regmap_read(tmp108->regmap, attr == hwmon_temp_min_hyst ?
+				  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
+		if (err < 0)
+			return err;
+		*temp = tmp108_temp_reg_to_mC(regval) - hyst;
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
-	err = regmap_read(tmp108->regmap, reg, &regval);
-	if (err < 0)
-		return err;
-	*temp = tmp108_temp_reg_to_mC(regval);
-
 	return 0;
 }
 
@@ -137,33 +197,76 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long temp)
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
-	int reg;
+	u32 regval, mask;
+	int err;
+
+	if (type == hwmon_chip) {
+		if (attr == hwmon_chip_update_interval) {
+			if (temp < 156)
+				mask = TMP108_CONVRATE_16HZ;
+			else if (temp < 625)
+				mask = TMP108_CONVRATE_4HZ;
+			else if (temp < 2500)
+				mask = TMP108_CONVRATE_1HZ;
+			else
+				mask = TMP108_CONVRATE_0P25HZ;
+
+			return regmap_update_bits(tmp108->regmap,
+						  TMP108_REG_CONF,
+						  TMP108_CONF_CONVRATE_MASK,
+						  mask);
+		}
+		return -EOPNOTSUPP;
+	}
 
 	switch (attr) {
 	case hwmon_temp_min:
-		reg = TMP108_REG_TLOW;
-		break;
 	case hwmon_temp_max:
-		reg = TMP108_REG_THIGH;
-		break;
+		temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
+		return regmap_write(tmp108->regmap,
+				    attr == hwmon_temp_min ?
+					TMP108_REG_TLOW : TMP108_REG_THIGH,
+				    tmp108_mC_to_temp_reg(temp));
+	case hwmon_temp_min_hyst:
+		/* limit value range to prevent overflow */
+		temp = clamp_val(temp, -300000, 300000);
+		err = regmap_read(tmp108->regmap, TMP108_REG_TLOW, &regval);
+		if (err < 0)
+			return err;
+		temp = tmp108_temp_reg_to_mC(regval) - temp;
+		if (temp < 500)
+			mask = TMP108_HYSTERESIS_0C;
+		else if (temp < 1500)
+			mask = TMP108_HYSTERESIS_1C;
+		else if (temp < 3000)
+			mask = TMP108_HYSTERESIS_2C;
+		else
+			mask = TMP108_HYSTERESIS_4C;
+		return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
+					  TMP108_CONF_HYSTERESIS_MASK,
+					  mask);
 	default:
 		return -EOPNOTSUPP;
 	}
-
-	temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
-	return regmap_write(tmp108->regmap, reg, tmp108_mC_to_temp_reg(temp));
 }
 
 static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
+		return S_IRUGO | S_IWUSR;
+
 	if (type != hwmon_temp)
 		return 0;
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_max_hyst:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
 		return S_IRUGO;
 	case hwmon_temp_min:
+	case hwmon_temp_min_hyst:
 	case hwmon_temp_max:
 		return S_IRUGO | S_IWUSR;
 	default:
@@ -172,7 +275,7 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 }
 
 static u32 tmp108_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
+	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
 	0
 };
 
@@ -182,7 +285,8 @@ static const struct hwmon_channel_info tmp108_chip = {
 };
 
 static u32 tmp108_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN,
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_MIN_HYST
+	  | HWMON_T_MAX_HYST | HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM,
 	0
 };
 
-- 
2.5.0

