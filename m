Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F938F250
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830458; cv=none; b=mNP3j+yTv9wpwDy1YQVTDVzs1I2viEZgJVGsnY3mWgkdUYwAsb1mWZqfpLlV2wOJxiPjNklfaR6xkIWYrmyWtwpx6o0xiNgTBc0VQaMsE5HQDyle4dHAPdlNxJ77gv9ERDYC/Jgx/qkJu+LNHrKBD7eYCZV3gUiMSWJYtA6nr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830458; c=relaxed/simple;
	bh=aHNIAZR547ORAamD69jxHP75MUld94pHEiLDYWNStfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5zcg2u2sZV/i+TGBLES8qQug8aZhwhpBHSEdCE/zLaF++u1g7Wq7TyY5qE9ZTzrSO1Zf1lKzLHpxm9Rgi4CWH3cB06T4pa7zkfTtdPxC0Rg6dxXEmlWCwyVygqjG4jXZ9OiGfhAaUz5FAoeYOPph52WcB9ghsbUiIlNMDEhoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJcaUhbc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJcaUhbc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so37020935e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830453; x=1781435253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnxpnnpv+j0cUNV6Xmi0dq5s+yph9snS3pWDXjBt4ho=;
        b=QJcaUhbcz1UA5TnZJsEdvEijpE1dPRgfUCVehf5ZGbPI752x3ytIioeOiGoeWBtZMf
         MraLtqWIpmytvulPpbllPry3mKXiaBskk/0nH5KRm2Go1saroLBu0lbV+u5n/u+7DBvz
         ar5TWVUEP7/GgKU4+vT/+q48v0iYhVJ+f1UanwN/yjjHw28wrObac0P5L6SH4wBE9Ozg
         2e1Yltu/JOlE0GmmtwSRKBFGbsWkWDCoRyk9wYSRa0i3FXwk6rTtjxlBLlYLYV9gYhUK
         bxRirw0/E1Fu2fjwRMGRt69DuloetTBHxqikwXPP9cN3NDaJa9nWvu5b88JJrEovC9Z8
         pe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830453; x=1781435253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnxpnnpv+j0cUNV6Xmi0dq5s+yph9snS3pWDXjBt4ho=;
        b=nBfATGxW7Eh/PnvmYzwvW/M3OD9UrJhVve9fBtEFlWKoJywGstoQewrkbNpuOY1sDP
         9GErioS1/pyi44Q5UuyCwtAM72B2i9Edfxz9gonL3nNJO6ERBv57CSV7hkT2Rwraebcv
         DOaRsAeY04RdXcrYoQb0abpd489XudnOBscs8VIK2QlNdE3SmWzvGNgQQRzJCMwynOPd
         8Ck8a9jybCOW0jfYsSwvlCeoYMR/ykigbIpznzy1KKbkBVqDxooaGtQ1Ec5d1NoR64G6
         MqJVgWkAfSJqS4FWzmQ5n+3SMqEiWqKDJ0TUf4XuQjVRPWxoOu7kylbrEobrR2hmRIhB
         lrgg==
X-Forwarded-Encrypted: i=1; AFNElJ8nMyQhNmvP3/qPslcW+jH9srNu7mqkIfYz8KX11cPICNgWOAZ/IREwfmYf1omHnvJmk5ONqcS8r5M8DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Cww15gF9WLJmX0swHozu4iaGkvnnKaO3+vUo52oM2lIdIeDO
	r38wOw4jS9vh8MXIMfFISHE7/6sVyfjNYu0XuRLH8eS9LiDbVqFw+Xnz
X-Gm-Gg: Acq92OHjjVPs17rxj64Ktp3JobOQwzBxxWTQHha0ISFru4HXr7IdMR1ZxsiSMGgfU8e
	CjqEegkqhf4AXN2ufhZERQdj2jlZveXH0utdFFdHMdYyN7JYK0OJMDR4MFYiDlrvCUM2vouwh3O
	Hpq17q9HOYgQozZ3Jub0GvLFSitgtOYgSwvGN41mXRFQRQ0lyN/oxzDGEJk9SLYSw1W+U8tzX8i
	mjRDJzvUGifBIMbjc64OgGEhd7jmXThRy9SJCrGNHDABBNiWB1+qz/v+TOe95zmhN14v7peG2UI
	bH6JLMboLmajbmRTY0LSxt5ZFUMJuA9fBB0lHotdb0CR31/LFrsuHfxGYNiJTos9J6uuOC2tYGu
	lUyopWAIe2E1xw2Y75jMwObwiSagDi8igUT+53ONjPp5MRie0D5YyzQl2jSBDNk94MGOOHk611G
	o8v2GdI8ggxljFfdl6h520aPCNUEu3BxVJMehsvD2F9EGKXjknR0/K
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-490c25ee058mr185298245e9.22.1780830453061;
        Sun, 07 Jun 2026 04:07:33 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm41711527f8f.18.2026.06.07.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:07:32 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
	Oleg Tsvetkov <oleg-tsv@yandex.ru>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
Date: Sun,  7 Jun 2026 13:06:10 +0200
Message-ID: <20260607110702.84599-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607110702.84599-1-eugene.shalygin@gmail.com>
References: <20260607110702.84599-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Veronika Kossmann <nanodesuu@gmail.com>

Add support for ROG STRIX B650E-E GAMING WIFI

Signed-off-by: Veronika Kossmann <nanodesuu@gmail.com>
Co-developed-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
Signed-off-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..e14419811aac 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -31,6 +31,7 @@ Supported boards:
  * ROG MAXIMUS Z690 FORMULA
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
+ * ROG STRIX B650E-E GAMING WIFI
  * ROG STRIX B650E-I GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
  * ROG STRIX X470-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 070bb368f2b7..f351bcfc5679 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -274,7 +274,7 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 	[ec_sensor_temp_cpu_package] =
 		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
 	[ec_sensor_temp_mb] =
-	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
 	[ec_sensor_temp_vrm] =
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 	[ec_sensor_temp_t_sensor] =
@@ -616,6 +616,14 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_b650e_e_gaming = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
@@ -861,6 +869,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
 					&board_info_strix_b550_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
+					&board_info_strix_b650e_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
-- 
2.54.0

