Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4DD3AE6E9
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540620; cv=none; b=CTNlBKfDnrdPidmckNLnoqGEm3mYNcLcuUNMjGX0K/RUFi82ls4OifrPG+mwWReTXy1J1TRPxKwxNcUlXmS2ZNOPm7PbqpLjG7M/gvBQJ0KaXIty8j3ywMEhXrC5qKin+UOB2mqkSsQtd3bNCIW8PLfnkb4MlYGmIYvAi73bQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540620; c=relaxed/simple;
	bh=TDMWQykWRLH+xUnH6dEBJSSnBtEoUJ8mDeu0JnQ5ykg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFqiyg2jbNMiAQRVlgeB5h++wVt+scduDJ/Fpsw6gupMN1GJeyhzKEJWAMsdNlqvsviencCi1+UmIZ8sYznYEaoPXh6f1fvWkKzHw73llK/roTlk5tMGUaflT5j96vrfzJ7fwZEh+m+wwnUlyyj/5dFLo2NfjsO8g+p5XFH/aKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcmKbYqi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcmKbYqi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47d6c634f45so71007f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783540618; x=1784145418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PaQGGp+ro7L+efkwpTdWheFx/o+vkLCN2v+zKVvSvAg=;
        b=ZcmKbYqiVcMyuzKc4D9jDtykAF7KSPC1oacuUhHAZ8PbA/aNA29OJhqRnViL4bq11+
         2YMMLyUoTp4nGSpLquun1Z2Yp+6k+1BakUB08IAnwSorDE2mRbBfeZzrndv+vvM8g8TA
         blazTaRXiPAWnckhBnvKB11qyDMX/hdIL/ibGNkkhYMAI9OD+JlYiNpNLbTWjrkxnnUG
         DOr7XA9GOkwCU5VKn9XS7PeALz51MxxFtHCz8RIzXu7qtm26pCyeaoGDgFCQcDGe+Zkw
         zCI7iYw6dyJvNiRmizARLnidpMmHJl8vKIPn2mCqWAwdL6knGAxlLtpo+ZairUis48o+
         aKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540618; x=1784145418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaQGGp+ro7L+efkwpTdWheFx/o+vkLCN2v+zKVvSvAg=;
        b=IoQ4xro48wfMGiA7EMgyFgc3U79b0yjVeqHO1tJcjGNv968aPdAIjjgZb5v9o6W6A9
         rSC6//UpHfzmbwlcPGVbJkAJE7gNikig17/3VHFjVUGN7jiHjz/xAcSfS66YZXLrDw1e
         p+zkgtdBQITbdRjvqFmQiMdvQWKJ3uchW1oZsgIreOe+wsYBlOA3hyUQ2LFhGU5YZS3S
         V0tPTLSrdqAzctE8Y4nzwLc9VbDDs92Eb3R+6t9pZrtZeOx2I5AUK/aZLctv1CQIs8RA
         YLtz3iXxnxfahZkghjN6R6oPFwFg7ETGiPtGwPomFAU6MQGbstXtqcn4Kl9fHA3049IC
         cCWw==
X-Forwarded-Encrypted: i=1; AHgh+RpnfKFCctekdUV+bDI6IBmABbpCFt/0O4vaQf3kZ2zy/qKbbZCZiZ/btKudJdzNX3tj0dWEGo98UfVTeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdatFuFzwqRqJpZxBjEgmfl7MBlsQ8kFXggw3uGP5dozFo93L
	mr0izVtCp3Up8LW4dBISvKahzsBFL6DwXCT/5EEPv61Gb3SSeV7auBrS
X-Gm-Gg: AfdE7ck3dDBdpB1vdDpzmCXK1wWQvfUO7Tp9pWm9USTIy8WWR/kS5o6NaNCgSrBNeyy
	6z/syViDJJK8yR3mt6JgeaN8Z+8ovlfDhvde52A7xMSv/YAf54oeMzElPg9c0rK7pa1KBPtLPqw
	UBxjh98qdyFhW7j0ifmdBqHWT7M2dWyFWUBGAL/8a+SPLNO8NdFCXJmRMebRfFA/4S2f09Qe9mB
	fHocU4AgSQeEl2ID+FHELl5iyhdSi2HbsAygspW6JMhR5GRc8Qvvz8RQ/uOtQVvlzUaRvGnKFL8
	6mzduFh1p6DXAYBzHACpVoq10v4XBeQLP8WRl1tin09VmoRiu5ksmhR12bJOYUwNmxdnb9+GOM1
	bq1g9cmz5KZnTIRFqea6WGe7I446YAErLbhajXaAh4VHP8DGcybrQ62j3NlNfq+s+awvTtQ1bQi
	KcifqyPxSpgUAwO19/9Yd0KpOybYlEU7w=
X-Received: by 2002:a5d:5f53:0:b0:47d:e0da:fe6e with SMTP id ffacd0b85a97d-47df073179emr5473702f8f.27.1783540617473;
        Wed, 08 Jul 2026 12:56:57 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm43090783f8f.34.2026.07.08.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:56:56 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Date: Wed,  8 Jul 2026 21:56:26 +0200
Message-ID: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>

Add support for the ProArt Z690-CREATOR WIFI board

Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 77a709517437..d76e6356acce 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -17,6 +17,7 @@ Supported boards:
  * ProArt X670E-CREATOR WIFI
  * ProArt X870E-CREATOR WIFI
  * ProArt B550-CREATOR
+ * ProArt Z690-CREATOR WIFI
  * ROG CROSSHAIR VIII DARK HERO
  * ROG CROSSHAIR VIII HERO (WI-FI)
  * ROG CROSSHAIR VIII FORMULA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..389f8ee129fe 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -386,6 +386,8 @@ static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_fan_water_flow] =
 		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbe),
 	[ec_sensor_temp_water_in] =
@@ -590,6 +592,13 @@ static const struct ec_board_info board_info_pro_art_x870E_creator_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_pro_art_z690_creator_wifi = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PC00_LPCB_SIO1_MUT0,
+	.family = family_intel_600_series,
+};
+
 static const struct ec_board_info board_info_pro_ws_trx50_sage_wifi = {
 	/* Board also has a nct6798 */
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE | SENSOR_TEMP_VRME |
@@ -859,6 +868,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x670E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X870E-CREATOR WIFI",
 					&board_info_pro_art_x870E_creator_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt Z690-CREATOR WIFI",
+					&board_info_pro_art_z690_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
-- 
2.55.0

