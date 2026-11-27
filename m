Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.52.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765529;
	b=W7JX1YNJYCQYGxSaW6+iz4c80jlYNnwAKME0ms+Q+yssLpavnMdOH6G+T4bHahVwbHwS
	 +Fx3NIJ/YrOXdburCCIoZPmbaTipadkE7pxlowntr5TqYkQoHiNzLJn3CgUPAtAa54dko
	 DpCXqFHakohlaN0R9EBNJUUTxc7Za+w1pkPoFTe/tgaYhldc5UZVLKS2lWsKIlii9p+nH
	 wajnKzYACjiIt4ww2Mcu49KUvpW0+padVwdr2xPQ9yJTfXkMWC0UdGccF0W3jjd0DCq9k
	 XC0Yx0IWEUoDPrrZuJ3lrZkrdP3NiSbY7Rya7x+ww3NmzAUDt6phT/MM3uhdxDnrzBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765529;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
	b=kCumpK1uc/P5MKyjnDTc1LZhcsEMz0KyJPqS2ZDAjdVEtusv9iYKxT8KY/Qspkv1nAI7
	 ouWS1bI/HWSqxq65K4jALN5ofsuBHX5RVjKo586xElnu82NeOGvGRAGpUriaWWfnz7yQn
	 6OSmF+i71Z67kfzHpc3SewYkTQPhHRcTPsmx0UnBnWvqL18SZ28ugssN+aVdukmCeESEf
	 +foniP0DLmuIZdLoCwpuOQJ3VwsMRCP5zMhVbHxWaF1NnFbt2BBipIfwfS5L6sVPaRfuW
	 H558672WlaHwadRL1lWDeiJJsxZ+fAI1ziMnrI6Tx3Ehy1GQ+N/RvZxwn3aq6E72Fbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=PYks6VNY;
	arc=none smtp.remote-ip=188.165.52.203
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net [188.165.52.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B6606A321
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=PYks6VNY
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.43.105])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4jbQSP0fv9z5wWs
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:25 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-dkqtv (unknown [10.111.182.117])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 78A4281F38;
	Fri, 27 Nov 2026 07:45:24 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-7ccd8bbbb6-dkqtv with ESMTPSA
	id +aujBBI1CWsizRQAjZbTUQ:T3
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 07:45:24 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S0022b9602fb-da7b-417f-b508-2b8c0d1717ee,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v3 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM write support
Date: Fri, 27 Nov 2026 08:45:17 +0100
Message-ID: <20261127074518.3244152-3-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127074518.3244152-1-filip.golas@3mdeb.com>
References: <20261127074518.3244152-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3824963458698833903
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlzejOHWhJDnI5lAkxq+LYQNJbWD5fp5cPkwrQADbLdltbiiGhYbReankvOrwTW7m/MrdTT/ZjdFIgsvRY/6E+hvhx/z4CD8ZJf4lrENCIRTnKnOUIRIfUyP6q/Cu72bzqr2mYjKuh6ySI1xJA3YYNMj0wY8W3DzmOBu0G0goD96SnxHmNQM2CwRILRqcJFjPCX3iz+FD0iLq70G2N47XvQyzP1AhRXzjJISsG0LR232DvwxOaY+BySfbCBPWg/UQEVQPNUknuk0f65Jso4Z6NY0xStmb/G1x2ylYVJzFbdtEE7dnaZr9VjaXviCbnuWhORGcpgOwZ1fc09QkWLL0rI07sZKHEpT6BsaYaZSgUcwWkRj5jRjw1aY18nKzqLa8ItLp25c9SZxvPHxdElaVju7mDWB1Khb5hnSCFyUrPRIOTbbaPN2pZYq9TzQ+cLfm66BdO3QX6GmRBIhML+2IgKBtX3q2IiSylCh1VDj+TsaO1Bea82uzS9/de4svxQhbkqB3lEWQDNqJaTqUoiqx+aSLUQ0sgb/60IdhC6JNychHKy+cLPCSE1oEbrnhKCdcslB4HVpxjKA9CFOKsCE/6DkirLKUnBw1vHqCM8Oac1luwrudz1XRTu9c4XyEuKAZ0kbTFvF3soH2u7ryfgVsW0Wz9eJzmL05K0MiVE9k8xw
DKIM-Signature: a=rsa-sha256; bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795765525; v=1;
 b=PYks6VNYY4TpQLWHgXKtYuwVOS9ff2n4GacTlgIZHCNv0B1Kq1dm1AJM9OWXQBSwmmTMdGDQ
 WifKtEQVfbYbZbehzj/ycptjaqZ5Bj5N29vknzlcHu3Ta1Wx6cQtdn3ZQEXxcZzmd3XTe22aXUt
 abpcODCJ5ShdCiUFY46pTe7G3zlFTZwJOZbhTRtf06pKL0OOIsF+jWFeDoLaURa41roNl2QE34Z
 ECkbq/ix69pXRWVYlrmGwrL3nwzFCdhETF3qJIq0kPRtdi40wsdys7eXb0LfN9J0lIYaA2auhzA
 wUXCFXRC/+hIUkcdfFLWLIN2NUhkD9JyKbrDWMT4p9y9Q==

Allow switching fans between automatic control by the EC and manual
control via pwmN_enable (1=manual, 2=automatic), and setting the duty
cycle via pwmN. The EC refuses duty cycle writes in automatic mode.

Fan mode control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
Changes in v2:
- The capabilities of each feature are packed independently, so channel N
  of DASHARO_FEATURE_FAN_MODE will not necessarily be the fan of PWM channel N
  if the two fans have different capabilities.
  Use dasharo_fan_channel for looking up the fan mode capabilities by
  comparing the group and index.
---
 drivers/platform/x86/dasharo-acpi.c | 146 +++++++++++++++++++++++-----
 1 file changed, 119 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 13d97eb43511..85f88b11fcf9 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -15,6 +15,8 @@ enum dasharo_feature {
 	DASHARO_FEATURE_TEMPERATURE = 0,
 	DASHARO_FEATURE_FAN_PWM,
 	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_FAN_POINTS,
+	DASHARO_FEATURE_FAN_MODE,
 	DASHARO_FEATURE_MAX
 };
 
@@ -54,6 +56,16 @@ static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PE
 		[DASHARO_FAN_GPU] = "GPU",
 		[DASHARO_FAN_CHASSIS] = "Chassis",
 	},
+	[DASHARO_FEATURE_FAN_MODE] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_POINTS] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
 };
 
 struct dasharo_capability {
@@ -143,10 +155,45 @@ static int dasharo_read_channel(struct dasharo_data *data, const char *method,
 	return ret;
 }
 
+static int dasharo_write_channel(struct dasharo_data *data, const char *method,
+				 enum dasharo_feature feat, int channel, long value)
+{
+	u64 arg = value;
+	u64 ret;
+	int err;
+
+	err = dasharo_call(data, method, feat, channel, &arg, 1, &ret);
+	if (err)
+		return err;
+
+	/* Non-zero status from the method means the EC refused the write */
+	return ret ? -EPERM : 0;
+}
+
+static int dasharo_fan_channel(const struct dasharo_data *data, enum dasharo_feature feat,
+			       int pwm_channel)
+{
+	const struct dasharo_capability *fan;
+	int i;
+
+	if (pwm_channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+		return -EINVAL;
+
+	fan = &data->capabilities[DASHARO_FEATURE_FAN_PWM][pwm_channel];
+	for (i = 0; i < data->caps_found[feat]; i++) {
+		if (data->capabilities[feat][i].group == fan->group &&
+		    data->capabilities[feat][i].index == fan->index)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
 	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
 	long value;
 	int ret;
 
@@ -162,6 +209,17 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = value;
 		break;
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			/* hwmon: 1 = manual, 2 = automatic */
+			mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+			if (mode_ch < 0)
+				return mode_ch;
+			ret = dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
+						   mode_ch, &value);
+			if (!ret)
+				*val = value ? 1 : 2;
+			break;
+		}
 		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
 		if (!ret)
 			*val = value;
@@ -174,6 +232,35 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
+
+	if (type != hwmon_pwm)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+		if (mode_ch < 0)
+			return mode_ch;
+		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
+					     mode_ch, val == 1);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		/* Refused by the EC unless in manual mode */
+		return dasharo_write_channel(data, "SFDC", DASHARO_FEATURE_FAN_PWM,
+					     channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
 				     u32 attr, int channel, const char **str)
 {
@@ -203,6 +290,7 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 					u32 attr, int channel)
 {
 	const struct dasharo_data *data = drvdata;
+	bool has_mode;
 
 	switch (type) {
 	case hwmon_temp:
@@ -210,9 +298,12 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0444;
 		break;
 	case hwmon_pwm:
-		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
-			return 0444;
-		break;
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			break;
+		has_mode = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel) >= 0;
+		if (attr == hwmon_pwm_enable)
+			return has_mode ? 0644 : 0;
+		return has_mode ? 0644 : 0444;
 	case hwmon_fan:
 		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
 			return 0444;
@@ -228,6 +319,7 @@ static const struct hwmon_ops dasharo_hwmon_ops = {
 	.is_visible = dasharo_hwmon_is_visible,
 	.read_string = dasharo_hwmon_read_string,
 	.read = dasharo_hwmon_read,
+	.write = dasharo_hwmon_write,
 };
 
 // Max 24 capabilities per feature
@@ -283,30 +375,30 @@ static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
 		HWMON_T_INPUT | HWMON_T_LABEL,
 		HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(pwm,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT),
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.56.0

