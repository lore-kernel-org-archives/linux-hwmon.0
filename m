Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D027FB2E;
	Sun, 18 Jan 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729567; cv=none; b=ioP9TMb4FLnSGAd6VGPTglVNceyxa7k6+Votn0pLkhM1ZLlhJ2+2iy/T2+ThHO5a/075hzE7ivty3K4ktpUwjBqcPr/B0ytQTbMSOYpJbpfiWioI+jk6R2Q6Lj2O1Fq+ocDw9TgMJCc9zTl2VGbvBQ9B4rGiUiSn1IyjSpK8xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729567; c=relaxed/simple;
	bh=17m7WiAjoAcgsV/06CC0RNSL0rVjD9jIOzoXf9IKjbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VHc4Db/nyLjFRNlKMnqt5ZdH7O5T79RU4UKji7Z7ESd0XBWodq8z2F8csRUqcw8Cfa5Kw85OkHpq3aCwPplw7zfMiu2/xwlh8nWfA/twvP1Cjryy/AamyVx1Q0rBzgxK6SqS+ijnHC0rFMGHpV3MDUbU7evDLWrtauN+mnNFFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PcCaoNV5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PcCaoNV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768729562;
	bh=17m7WiAjoAcgsV/06CC0RNSL0rVjD9jIOzoXf9IKjbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PcCaoNV5WXDDSRmXfpuN7UtyNNCRuw4WGXNEE3WzjxML2XgvPDi0mr7lBTiW/MuCg
	 lH3Tk1lsNAhpqqArSFmyGTL+72Xl26FzsTjPPEY4RM10XHkf3jXwE8Uox9HrE0Fx08
	 Uz2ZLW5O9UOhtXS7iZ0dyzgnSS8ZT7AZacCqNpgo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 10:45:58 +0100
Subject: [PATCH v2 4/4] hwmon: (cros_ec) Add support for temperature
 thresholds
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Stephen Horvath <s.horvath@outlook.com.au>, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>, linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768729562; l=5600;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=17m7WiAjoAcgsV/06CC0RNSL0rVjD9jIOzoXf9IKjbo=;
 b=zBRy7NE9VMB8EKU3/N3JzuVLL564HLfNJyUWHHCwWn3wA3RBPhFGOwn2Y5vP/YdPHNWZWShTS
 2F0dSAagaIqCbeXkmG0bxMpI6XQr9BzOLb675wq86F1FJsCxRhjK81V
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Implement reading temperature thresholds through
EC_CMD_THERMAL_GET_THRESHOLD/EC_CMD_THERMAL_SET_THRESHOLD.

Thresholds are mapped as follows between the EC and hwmon:

hwmon_temp_max       - EC_TEMP_THRESH_WARN
hwmon_temp_crit      - EC_TEMP_THRESH_HIGH
hwmon_temp_emergency - EC_TEMP_THRESH_HALT

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---
The following checkpatch.pl complaint is a false positive:

  WARNING: else is not generally useful after a break or return
  #75: FILE: drivers/hwmon/cros_ec_hwmon.c:170:
  +		return EC_TEMP_THRESH_HALT;
  +	else
---
 Documentation/hwmon/cros_ec_hwmon.rst |  3 ++
 drivers/hwmon/cros_ec_hwmon.c         | 60 +++++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index ebc8da48fa8a..9ccab721e7c2 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -35,6 +35,9 @@ Fan target speed
 Temperature readings
     Always supported.
 
+Temperature thresholds
+    If supported by the EC.
+
 PWM fan control
     If the EC also supports setting fan PWM values and fan mode.
 
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index f5be293fdaa6..5b998cd5e506 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -28,6 +28,7 @@ struct cros_ec_hwmon_priv {
 	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
 	u8 usable_fans;
 	bool fan_control_supported;
+	bool temp_threshold_supported;
 	u8 manual_fans; /* bits to indicate whether the fan is set to manual */
 	u8 manual_fan_pwm[EC_FAN_SPEED_ENTRIES];
 };
@@ -116,6 +117,23 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
 	return 0;
 }
 
+static int cros_ec_hwmon_read_temp_threshold(struct cros_ec_device *cros_ec, u8 index,
+					     enum ec_temp_thresholds threshold, u32 *temp)
+{
+	struct ec_params_thermal_get_threshold_v1 req = {};
+	struct ec_thermal_config resp;
+	int ret;
+
+	req.sensor_num = index;
+	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_THERMAL_GET_THRESHOLD,
+			  &req, sizeof(req), &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	*temp = resp.temp_host[threshold];
+	return 0;
+}
+
 static bool cros_ec_hwmon_is_error_fan(u16 speed)
 {
 	return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
@@ -134,12 +152,32 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
 	return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
 }
 
+static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
+{
+	return attr == hwmon_temp_max ||
+	       attr == hwmon_temp_crit ||
+	       attr == hwmon_temp_emergency;
+}
+
+static enum ec_temp_thresholds cros_ec_hwmon_attr_to_thres(u32 attr)
+{
+	if (attr == hwmon_temp_max)
+		return EC_TEMP_THRESH_WARN;
+	else if (attr == hwmon_temp_crit)
+		return EC_TEMP_THRESH_HIGH;
+	else if (attr == hwmon_temp_emergency)
+		return EC_TEMP_THRESH_HALT;
+	else
+		unreachable();
+}
+
 static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
 	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
 	int ret = -EOPNOTSUPP;
 	u8 control_method;
+	u32 threshold;
 	u8 pwm_value;
 	u16 speed;
 	u8 temp;
@@ -187,6 +225,13 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
 			if (ret == 0)
 				*val = cros_ec_hwmon_is_error_temp(temp);
+
+		} else if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
+			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
+								cros_ec_hwmon_attr_to_thres(attr),
+								&threshold);
+			if (ret == 0)
+				*val = kelvin_to_millicelsius(threshold);
 		}
 	}
 
@@ -291,8 +336,14 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 		if (priv->fan_control_supported && priv->usable_fans & BIT(channel))
 			return 0644;
 	} else if (type == hwmon_temp) {
-		if (priv->temp_sensor_names[channel])
-			return 0444;
+		if (priv->temp_sensor_names[channel]) {
+			if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
+				if (priv->temp_threshold_supported)
+					return 0444;
+			} else {
+				return 0444;
+			}
+		}
 	}
 
 	return 0;
@@ -310,7 +361,8 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
-#define CROS_EC_HWMON_TEMP_PARAMS (HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL)
+#define CROS_EC_HWMON_TEMP_PARAMS (HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL | \
+				   HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_EMERGENCY)
 	HWMON_CHANNEL_INFO(temp,
 			   CROS_EC_HWMON_TEMP_PARAMS,
 			   CROS_EC_HWMON_TEMP_PARAMS,
@@ -520,6 +572,8 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
 	cros_ec_hwmon_probe_fans(priv);
 	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
+	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
+								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
 	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,

-- 
2.52.0

