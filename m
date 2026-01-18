Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB69280325;
	Sun, 18 Jan 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729567; cv=none; b=iGOBPm+H6wrfrlklG63BHerUFjP6b8KjlYMACbdJ7GDFP4ZrZD6VaJKLjewzWCmuxnoH94B53T/IlKP6cOrFGsNrFAG08/KcF9B0F2MS1WCIonhivXJjUg1UtoaVxPx7GPH0lhJ8Nht7uy735UqK6osSLFVcTPbk7qZCNXkju/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729567; c=relaxed/simple;
	bh=OrEhVYhmAAZqP1oSwX9fPmHeB4GdNsE4gbx3o8EiGcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l58gQrxy2JkdP3tNBAbuFUvz2YIE/pMX40o06/liAx61vG8v/j7GmN5VJ+ApSBAUT+C5g5+6KYd+tLX8NEQzeNZrzMFtehv8HJC7pky2ex/UTc2L1lgxxIhwJSBfEOPoiXmwM483yTXLY9l4KpnpHm+PMbA8WS6sljO8/34Y63c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SBglOmmH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SBglOmmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768729562;
	bh=OrEhVYhmAAZqP1oSwX9fPmHeB4GdNsE4gbx3o8EiGcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SBglOmmHExUlswmfPHULxm7qXXfDFaeAWXv1JVXINOjB4VgkWU+nyickv8Q/iCf1k
	 k4ninRzIvcG00iP4jqC7bCKz+6A96M2N9RzVuJXqdQMphYA1uednnTqOZcMl5p1rk3
	 RfaMvHHm76ewQrq38VpemWl6hKFH7M2rPgcF5X4s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 10:45:56 +0100
Subject: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768729562; l=2923;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OrEhVYhmAAZqP1oSwX9fPmHeB4GdNsE4gbx3o8EiGcE=;
 b=CAFi6nQOTtacRv5gXY3e+5IGkaUVHc4Ggt5ctcEu71s+naoXWi0cM1utV0LleWI8Q+G4xi3rb
 XtjlbSyjqMFDJg4yJiLqa1TswyirjEj6TErz6JnKvgPyQOAcMJKkGnc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Use EC_CMD_PWM_GET_FAN_TARGET_RPM to retrieve the target fan speed.
The EC only supports this for the first fan.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/hwmon/cros_ec_hwmon.rst |  3 +++
 drivers/hwmon/cros_ec_hwmon.c         | 26 +++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index b7dc88d22fda..ebc8da48fa8a 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -29,6 +29,9 @@ Supported features
 Fan readings
     Always supported.
 
+Fan target speed
+    If supported by the EC.
+
 Temperature readings
     Always supported.
 
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 48331703f2f5..53abd55cba05 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -86,6 +86,20 @@ static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 inde
 	return 0;
 }
 
+static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec, u16 *speed)
+{
+	struct ec_response_pwm_get_fan_rpm resp;
+	int ret;
+
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_TARGET_RPM,
+			  NULL, 0, &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	*speed = resp.rpm;
+	return 0;
+}
+
 static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
 {
 	unsigned int offset;
@@ -143,6 +157,11 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
 			if (ret == 0)
 				*val = cros_ec_hwmon_is_error_fan(speed);
+
+		} else if (attr == hwmon_fan_target) {
+			ret = cros_ec_hwmon_read_fan_target(priv->cros_ec, &speed);
+			if (ret == 0)
+				*val = speed;
 		}
 	} else if (type == hwmon_pwm) {
 		if (attr == hwmon_pwm_enable) {
@@ -259,8 +278,13 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 					u32 attr, int channel)
 {
 	const struct cros_ec_hwmon_priv *priv = data;
+	u16 speed;
 
 	if (type == hwmon_fan) {
+		if (attr == hwmon_fan_target &&
+		    cros_ec_hwmon_read_fan_target(priv->cros_ec, &speed) == -EOPNOTSUPP)
+			return 0;
+
 		if (priv->usable_fans & BIT(channel))
 			return 0444;
 	} else if (type == hwmon_pwm) {
@@ -277,7 +301,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT),

-- 
2.52.0

