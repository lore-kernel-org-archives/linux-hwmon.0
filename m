Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D8432E6F
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491596; cv=none; b=jfBKu+WnCTcHQHxEF+zoL3X8Li0CoPstZjY5nM/xTUckCFa4crnZECEGqZZjl2e5rekA9mIB6CKwuULGPRUKTrBVo9JU+d/FIKpliRfTT2GF5m/cO1U2pITau59vMl2kjeTcLmCPKBsxIeiP8SdGwXqlRJV3JetU2cB0MxXL2BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491596; c=relaxed/simple;
	bh=TQ8cIteOUoh0RN9lFPHnaSOVGs8QySDAURgXCYGyLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3xo/YejMweJo5jPA5JXFbG0fb/+mRwe4Yg6+6DA8O4zUTMHueWjBUzxGXC/mLL2OD/80UnVvP8DQFw2oGvnUisgSAwEgKQOzUD46nWxR2jBUZGsCh9NGmMhawcFh2+Azngri/I4KGfAqAu499oqXjed9ricfY04YWf+o4AP6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=Y5wbjcwL; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="Y5wbjcwL"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90a6b298887so2209686d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491594; x=1787096394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=Y5wbjcwLR7n/kmAnAVNpFnb/AWZYjXPmXxAHBOBaHJCTtyTH2JxbLeSc54LZcjRNMo
         /ZQkFq5arRoKzEZHZ5ffkCltL3VxFhqLq0zL9/OELtVkTcZrlhBmVKsB6E9zI9k3xz8W
         qVuDNjEQXubMU4AeU4lIat4dImkXzn9th8LQQ7yQr9S6fzM5o8iiRDQ0rcqr7NwpotJH
         Lc1cuOon3/FyLAV3mA+vBlxmKQNEh/aIzNAMkiR+g/xEqEn2Zy4vh/2tPAIzIjO1t8bE
         VhRjVmk36910UYYWpAvX2leWk5sQ1Gn2LCDI8LnEZeAf26ZBAAlfxAJzMR2U+o17frgH
         z4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491594; x=1787096394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=jJPxWCDFT/AK6r4U7+4GOYhap6vNeGEv7zrpoh2jw/4qnHTj5XtZvf948QOyif0VFx
         fqstzFDqr4CcpI5mLHEhYqEJ3kR4AyP/sv9Ck21rAsPCEkPBdBIpZH3nIyZBSFpZKOR1
         SQspD1W3hYsHJntvE1p9o9/rgBz+XLMypQ+PH1/HOPiQ0FNQ86kvwuJ7rx88yqwvC3P+
         j8mLaTQ0+Y1r5OPxdHJ40Ew4+kThNza5yPNmJoX3/32yjUsVCcwOwbVTVu6oqmnL6VVG
         L8KTAY+XID+WNBSJ3c9EYNFkUOMm9kvQeypNBum+BwsKF77o07vzN7OGg5D4rWQPowmV
         cqgA==
X-Forwarded-Encrypted: i=1; AHgh+RpBmGBBtSAY/4A5VgOwGFEcSFR+ooL5/aKHnTYsjiAwu6gN7uJsfXz/N9qmntU51UC7NB2xuZM/dkbuJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2RD2Fgi9AcDWqo43Inex2vNgKd9Fz/xC7elJ7N+F9vYx+vX1a
	amd1JZcANSaQl1xpZWE6jf6VNO8Xjw3cYtBvUacOdd0vadRNODeQa+V5j5hp0FgtUXs=
X-Gm-Gg: AR+sD124qAlStUGQ91D9PmX4nf2artsbBFECnkIa0jTE06EXpTBvwveCzqge31M0S2w
	jdd4xetjM607z3ooelQ6KOweyFbz5xLjW4m9n4FG2t0jALQanveLXhxxz96Eq+ddNj7rNAhDj3B
	ush2i+uwivZsst5lxf/1i/ylFiwtgbk7WnDbKcl/xOI+0Dhg608RCj+0cHfpfcfsML0CL9VGtPG
	vE8b1Qn18d6F/X7gJAbiABqqjDZ3CoCdINNzTgJhMvMmuoQssDLInn2wQz0MKp+I8aw7F8jBmmd
	vIIQhhOJjXV41qUSkU/mpAk7cmHAbGFX/sURiPF2BSJ9vhP5cjbu/kAzt6mYeb6r0nNsAOO9RBo
	MeKTfkxK298RxhQYADHMe4nm4uIjM7KoKrZTqbtdkthKxLbb0jbX47eQO86lfZSeyjFWDARkspx
	PupScs+c3jG8+hFBq1ZWWQIbfgpnon8STx1tiSf4mFzU+chyPlU0Ios2QFUnF4RzjYJi/GU3YPf
	gIfpFui2tULTea/uFxyhtBaunOo05P1Rg==
X-Received: by 2002:a05:6214:2d45:b0:90a:3291:7ba3 with SMTP id 6a1803df08f44-90a6ff1cea0mr8295346d6.5.1786491594021;
        Tue, 11 Aug 2026 16:39:54 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:52 -0700 (PDT)
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
Subject: [PATCH v2 1/4] hwmon: (asus_rog_ryujin) Add per-device configuration
Date: Tue, 11 Aug 2026 19:39:40 -0400
Message-ID: <20260811233943.319729-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
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

