Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90742885E
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530943; cv=none; b=tq+scKRl7u2P/FshJ5YQQUhJdxVx1inWf6xKbcdBfRAVEngW3BDUiPx6cgu3LGI61cPqy2lCE5NJVEGsShtqOoprj74+kRpMccY3L7Lh8rCP8Y+vqdI2NuRZgjNp7PSYHYqdmy6ZdQP0Ht5YXszeKuBvT7GiDIGLz51O2Ap7bNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530943; c=relaxed/simple;
	bh=GlzdpYnRslH/TnObZGBK0rnYo0AfyckpQ81/QlcSZoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rW0ldUhlseB3iAzBKBEC5DWuaMrJ1jQzyLTasHT4+Nk1X+QaN6XUsFkOhwWaXZsnTc3MXi6mpsp6GnkS5zcE7pWb/0lVaNJ6ZHckP2BFqVFY/GWT4Pymc09ePG7zIA4LzJxs1hLRv0pJRl9C6o6lMEq8BRdY32iXHxNc4HvL3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=nP2P1Hso; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="nP2P1Hso"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c16ac21acso5051261cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786530940; x=1787135740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqDexmwCkxK5cGoRgv9/ZOTLVH+NFOtiGbbUjmtnvFQ=;
        b=nP2P1HsoC8UV98rHPT3R5vzuOFRR3MVIPS1i1RUWG70bot0JxdpmgnTMHbrlkIiqOm
         53sk08nS/rvz9bZAfm1mWdL92Yz6LH+uRa1zEOC+HNwSdvofkT9PKYiMNgbD6DdepFOI
         QbisPbuW8YX8rFsrIHcPsbQwEEBm+WP2vdhaOHHOvk6CMzPIeWyoRAlMoe2pbdCrSi+9
         12Q7DFm29yv0Q5GANOo3IwcDN/TmsLhEgPfD2jI777Y3m7TI2y4mi4nROSNMBRFY+QwY
         hlLxnMSAyVBjNvaDfCyGBFyn8Ft02GksThidEO2lQjT4qQkCrpbZA2EOgGmTJHvbNrB5
         1dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530940; x=1787135740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqDexmwCkxK5cGoRgv9/ZOTLVH+NFOtiGbbUjmtnvFQ=;
        b=Ww2vtCOySnsaYNra1XAlXPxXA9X8zLtij0j919A+GA2LUzjilsTcXy3AAJDMGYcAax
         YrdB2zSKNH9DB7roInQ8tf6HxABatfV5ECvTqGtELw5Of39tO/ML6bRRRqj0Zy15PZsp
         WJhyd3QS9qe/cQO+cYYfcUWr3dYIvTQ9Q6u/+I/JuZlXISFcfMKKHJKFjS4fthLjzZNm
         eWs4M3OVsyaldweexJk5hxTWbgBvs1KjWh7LSM/qnoXFj0EtZQ85/23xElujVJkgumYQ
         9KHnqgRbFks29P+LztGmh471Lzyk0BIu75KJqjcysqSJuF2qOXhrWEdYCPP8WpuY+5lX
         Gobg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/POJrFVgWaed9Y6vt3Ol0wSyxSsosyZS3fzih/G5PbHew8SFG7ZcBFBuKc5zgTXeP+NkPNs45iYU7qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wmPkErVRtEFiKIHir0MgJetnQnl+M4ZD4kM2LqnoE5s4JQH9
	OybhG/Xeek4cey1plkKIHSt5Sc0sXZn8EN3oymHIMui/J2quJVPGGw9tApeqCJGY5ho=
X-Gm-Gg: AR+sD117j7NUB7R9noDmabsvRJRezhYl/Xh6DszwkjvSA8S2qcOQG8REd0qSlDFmZpZ
	Gex7ro0xYqkaNrcD2b7ntnsYoGrMMg6i0qAkOxHQ4vZh1pALS7NBXtuhH7Y7yykJ54ESOVuS/rO
	tUdosEgRf1CnEVySDlOaFun7jMzBEsGoDFbOagi7xQuNa5emTfa5bLUfWHvhPB7vn+t040kqLFR
	5OAeWdGLktl7E7CnCvne1CQqZ8TON06MzFYk33X4faFqtOxjDIzUAOVVqoR637TXO7D3EAXoZpG
	03YC2OM5mtoOQNPmB2a7hVmys04MXaNtG0IqoAjiWlbGLEvLhsHaYM3C6lAOxDrpxM3cEYL/5VM
	1/gvXzj3hlBCHO8b6/srZqZOaCihVk3g1u4Ne/xIVSARQvjKMNYpD76+gHWXEF4C8NfKQlCUY7p
	RpcYWg3tJ2YLsCLcYEq3XnpgKAoZxP7c3hZA6ApeRG47AlZq7Oj1/87XqCWjLrXaRxCg/RY2j14
	deNt8zyFEhT0DnykVhnBXZ9t7liPuY3mA==
X-Received: by 2002:a05:622a:305:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52d6482ea3emr27523201cf.40.1786530940278;
        Wed, 12 Aug 2026 03:35:40 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c29e942sm18718386d6.12.2026.08.12.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:38 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
Date: Wed, 12 Aug 2026 06:35:30 -0400
Message-ID: <20260812103532.395049-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812103532.395049-1-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move model-specific report offsets and capabilities into a device
information structure. This prepares the driver for coolers which use
a different report layout or do not include the external fan
controller, while preserving the existing Ryujin II 360 behavior.

Handles an issue reported by Sashiko where an id could
be missing driver_data.

Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 75 +++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 10a1f5aca988..80563ce38519 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -18,15 +18,25 @@
 #define USB_VENDOR_ID_ASUS_ROG		0x0b05
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
 
+struct rog_ryujin_device_info {
+	u8 temp_offset;
+	u8 pump_speed_offset;
+	u8 fan_speed_offset;
+	u8 duty_channel;
+	bool has_controller;
+};
+
+static const struct rog_ryujin_device_info rog_ryujin_ii_360_info = {
+	.temp_offset = 3,
+	.pump_speed_offset = 5,
+	.fan_speed_offset = 7,
+	.duty_channel = 0,
+	.has_controller = true,
+};
+
 #define STATUS_VALIDITY		1500	/* ms */
 #define MAX_REPORT_LENGTH	65
 
-/* Cooler status report offsets */
-#define RYUJIN_TEMP_SENSOR_1		3
-#define RYUJIN_TEMP_SENSOR_2		4
-#define RYUJIN_PUMP_SPEED		5
-#define RYUJIN_INTERNAL_FAN_SPEED	7
-
 /* Cooler duty report offsets */
 #define RYUJIN_PUMP_DUTY		4
 #define RYUJIN_INTERNAL_FAN_DUTY	5
@@ -81,6 +91,7 @@ static const char *const rog_ryujin_speed_label[] = {
 struct rog_ryujin_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
+	const struct rog_ryujin_device_info *info;
 	/* For reinitializing the completions below */
 	spinlock_t status_report_request_lock;
 	struct completion cooler_status_received;
@@ -112,6 +123,8 @@ static int rog_ryujin_pwm_to_percent(long val)
 static umode_t rog_ryujin_is_visible(const void *data,
 				     enum hwmon_sensor_types type, u32 attr, int channel)
 {
+	const struct rog_ryujin_data *priv = data;
+
 	switch (type) {
 	case hwmon_temp:
 		switch (attr) {
@@ -123,6 +136,8 @@ static umode_t rog_ryujin_is_visible(const void *data,
 		}
 		break;
 	case hwmon_fan:
+		if (channel >= 2 && !priv->info->has_controller)
+			return 0;
 		switch (attr) {
 		case hwmon_fan_label:
 		case hwmon_fan_input:
@@ -132,6 +147,8 @@ static umode_t rog_ryujin_is_visible(const void *data,
 		}
 		break;
 	case hwmon_pwm:
+		if (channel >= 2 && !priv->info->has_controller)
+			return 0;
 		switch (attr) {
 		case hwmon_pwm_input:
 			return 0644;
@@ -198,12 +215,14 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 	if (ret < 0)
 		return ret;
 
-	/* Retrieve controller status (speeds) */
-	ret =
-	    rog_ryujin_execute_cmd(priv, get_controller_speed_cmd, GET_CMD_LENGTH,
-				   &priv->controller_status_received);
-	if (ret < 0)
-		return ret;
+	if (priv->info->has_controller) {
+		/* Retrieve controller status (speeds) */
+		ret = rog_ryujin_execute_cmd(priv, get_controller_speed_cmd,
+					     GET_CMD_LENGTH,
+					     &priv->controller_status_received);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Retrieve cooler duty */
 	ret =
@@ -212,12 +231,14 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 	if (ret < 0)
 		return ret;
 
-	/* Retrieve controller duty */
-	ret =
-	    rog_ryujin_execute_cmd(priv, get_controller_duty_cmd, GET_CMD_LENGTH,
-				   &priv->controller_duty_received);
-	if (ret < 0)
-		return ret;
+	if (priv->info->has_controller) {
+		/* Retrieve controller duty */
+		ret = rog_ryujin_execute_cmd(priv, get_controller_duty_cmd,
+					     GET_CMD_LENGTH,
+					     &priv->controller_duty_received);
+		if (ret < 0)
+			return ret;
+	}
 
 	priv->updated = jiffies;
 	return 0;
@@ -289,6 +310,7 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 			return ret;
 
 		memcpy(set_cmd, set_cooler_duty_cmd, SET_CMD_LENGTH);
+		set_cmd[2] = priv->info->duty_channel;
 
 		/* Cooler duties are set as 0-100% */
 		val = rog_ryujin_pwm_to_percent(val);
@@ -394,10 +416,12 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
 		/* Received coolant temp and speeds of pump and internal fan */
-		priv->temp_input[0] =
-		    data[RYUJIN_TEMP_SENSOR_1] * 1000 + data[RYUJIN_TEMP_SENSOR_2] * 100;
-		priv->speed_input[0] = get_unaligned_le16(data + RYUJIN_PUMP_SPEED);
-		priv->speed_input[1] = get_unaligned_le16(data + RYUJIN_INTERNAL_FAN_SPEED);
+		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
+			data[priv->info->temp_offset + 1] * 100;
+		priv->speed_input[0] =
+			get_unaligned_le16(data + priv->info->pump_speed_offset);
+		priv->speed_input[1] =
+			get_unaligned_le16(data + priv->info->fan_speed_offset);
 
 		if (!completion_done(&priv->cooler_status_received))
 			complete_all(&priv->cooler_status_received);
@@ -471,11 +495,15 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	struct rog_ryujin_data *priv;
 	int ret;
 
+	if (!id->driver_data)
+		return -EINVAL;
+
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->hdev = hdev;
+	priv->info = (const struct rog_ryujin_device_info *)id->driver_data;
 	hid_set_drvdata(hdev, priv);
 
 	/*
@@ -546,7 +574,8 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id rog_ryujin_table[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
 	{ }
 };
 
-- 
2.55.0

