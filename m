Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2218BC3B
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060879; cv=none; b=o3Ghy3LwoiTAXNEjoQG8P4o0EuawkztGlpp7yHYxTuTe+drRxBjabGBVmCkBOsIfulrmJOf0OIFg1qaWXWKkxYhzUyuGPDwoz/WmpW5wYFcVj6ecSQT5n/FIAlMkhvUOXPap+fMnPtyTn8eshC9GgbQO+l/GEdWr9GEX9T+u4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060879; c=relaxed/simple;
	bh=TQ8cIteOUoh0RN9lFPHnaSOVGs8QySDAURgXCYGyLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lB6XnLR+bm87sQ81XprMbdgvm+d6fy3OoQQXH+regwwJnE3ZQ2qUygIvgORvntHue9NuyGarBcLdHyE3XWZ+aafTK7OrQmYlAwKNfmPpxmz22vkzNFWRhykckhuq+AEOkTs3Alaal8wFiuOeFknilbGR1wzZdpjqQ7SZuxOdeUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=b0C+fZez; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="b0C+fZez"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e53581361so158219485a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786060877; x=1786665677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=b0C+fZezNHGCOyDA1qqDGgqaxp+fWHOqJeaY/UAq3CmzDZyC4NMRjzHHIQaHBweCwh
         hpuFW6G51Uj3v9XsRLfR8sN9yTHaXAwWH/xjHI6p8ZKzMNxeF2GU/VHMAwq7kQa7sdCN
         vwwD/dqYMyiSRmDJpex51JCVQ/L1qBMnY0YHiqCDwkyFf3JcPuR2OvMpbApjxe4dZDJq
         kdlP6w3WVjtrWDNee+3gWpXw5EMFRARK0YicdtOeHupOlsZd9whBtCS1fAUZ4rJZn8yw
         joUuxEYF2WF08v1bHA3EK0iUtO/z7PofIz8fCbcCk/5zha3D/xy33l0Xm4/fSoAgOU0J
         X+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060877; x=1786665677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=jnpWAWx+E3GB3QU6NhsrOtayNMGiSk5TJ3jUKsMazlvmFMxWvZ4stM52pXg0KrXq1p
         o/ge990AP/Jo2hRueb7/iC6x0hzO2a+Ygw6gu4TgVUqh/afHBNYpp3kpaiSDfCogMLLI
         GnfPYMqxTY/v0ZdrhPirgz7YtuaJVLeNzvTPyigEhNFP8eFMrLuEws6J4IzF+NdocGyC
         f47gsQWcYcRuCeZvjoK85uIMobQ7gYUWeCi5UCFua/m36wa7T+WVS0gWPjULIdF5WTFO
         EZlRevue9bDZqOkuLCwkpapVVaPbXYAyHPmbI65k4kPyuSb1Qn633tMJuw4cKDKO21y/
         8sKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/3S3qkQiB0wXDuiLvoRfQWtq1n4/RzNcOOwvpLOJP8UxzviFB4aepsNOMY2CwMWyV4XjgeLIAGvJU1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjmJvdNyCbxdoM2djcq6tolyBJ7s1ScH7f7zBTwe1U+n9pd63
	StwB3f9dmsxfR27FmATv1ez+0LHvW/e2iHrdxAWxoFQE70raxr750Wq91AkD784/cIg=
X-Gm-Gg: AR+sD13sMHwKzE5aMXRTw/4IWq0a2vhJ+Ow0f/Q87lwUYXwYNobL/N9FCC8c/77O14R
	E0SAkI/E8MzyaE+KeXLW9zqvEt38gtNNXZ+iWeUU5y25Q5bxl6LQvICvXTO9hI0FuxNLBEOu4L6
	teJqcZZTm3l4nZtMf3ZnFWwVWjhwEOUlYIFZWpXziC89Rn4orXpOleyWTFVjPcGvDAHPPCokX0N
	vxj0sP4riBdAmQcm+6fT6+oKft4C1IQ6Rvordpcdrn9NaBA3MzUumorQu1grdrOF5AFIz+9bxkQ
	+9OogYOyAekOSaGBUfFKjkVelXv7/PVBvRxTi9fEi8788zgpDsIQNW7h+OWWGsfcGIU8Rj9Bo2n
	f9J7bezuhChf+7Pw/QdocUH5NjkE9E7IAwwCyYNCJcp6K/PGr5zqeiR+h5C3iDmWgDfQrLpBFVD
	0J6Wu5kwACLxaaPOf/OG+E0hWL7qN3hYXygSQglUkaXrJcHClWzf/FPmdVDo0unkOru+4nChldX
	RoQK8TxaFjffOMuHbU6GIEPhnD+wmahYvttSL0lZWzM
X-Received: by 2002:a05:620a:28cd:b0:925:56bc:b8bb with SMTP id af79cd13be357-93648fafb5bmr1890073085a.9.1786060875234;
        Thu, 06 Aug 2026 17:01:15 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm27341485a.38.2026.08.06.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:01:14 -0700 (PDT)
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
Subject: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
Date: Thu,  6 Aug 2026 20:01:05 -0400
Message-ID: <20260807000107.1786892-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807000107.1786892-1-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
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

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 72 ++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 10a1f5aca988..b86b87e33615 100644
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
@@ -476,6 +500,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 		return -ENOMEM;
 
 	priv->hdev = hdev;
+	priv->info = (const struct rog_ryujin_device_info *)id->driver_data;
 	hid_set_drvdata(hdev, priv);
 
 	/*
@@ -546,7 +571,8 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id rog_ryujin_table[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
 	{ }
 };
 
-- 
2.55.0

