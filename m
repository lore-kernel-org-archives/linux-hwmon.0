Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7071FF1B5
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251114; cv=none; b=Kpr6a8d/6+meVGcYv0NrLq54Op8qvf6S07CqSIEH/pGBCcpLawc13OyYbbNFeOO07wsK/2C7mwEg4FebDQUWHxhmDNwKA8je64/tRQBZRQCH2uhshgrwWySIZbLrEG8pD9JXb9GnaLFP1icXN3Uub5at6/YOOm8bdzqMrgFr1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251114; c=relaxed/simple;
	bh=ysh6ReeHvJe9TwyiaXD20oAVatLGkl/mCNQ5S1j0pt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEYwaCuQUvpaPMh7HM4PTsmo1poFMUPkpi+KHLC/vqUjBNCabdzNNxNBKBU5Hz5FKg6I6D4E7zJqhShePqVgQwLpkx68nWB/4zRkf2NR4IS3MEXXcSiZ4tTCII5jauULsCQJ5p9rjZ4FsEB6pjanEzNyXsVhhv8MzIAFsmQhC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drySj0NI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drySj0NI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so8183985e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jul 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783251112; x=1783855912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5BS4AAszkEfCLhT3vHbqa6KSd2l7Qvz7/ajSmqfW3c=;
        b=drySj0NIUigj8gy9zfWJrmLr0ZqWPwv3DcsfDZRXbRXYDmbzo1LhY5NweGWiMQQqzG
         +IDBd5L9cVgD94N1nWtrtKl2qMuhQHJrSls188t3tXmSUxf5RDhOYgUwkmi995Sh9cPF
         s4SDXq7Z0CQMdLiL1WxIeFu51vNW2vuSwFIyFygT+XjUgpfCbkxEHB/TONamwphvCs9h
         cKL1S8OAuc6qzUYrDnW2ihf2tJFghhtduYWUeUxggDhymIJC0OLIsk1z8H2n7NzioDXC
         O0ed6Is9nZvq9FgQZiP5NhxdTqhII/fN1sxEcDbCIWWyEM5Q1QEvibIyZrFgfp4Q3A/r
         aeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783251112; x=1783855912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5BS4AAszkEfCLhT3vHbqa6KSd2l7Qvz7/ajSmqfW3c=;
        b=b/UQyeursXn6vAiubtY1dU5wChjpvzHbjk8AsWi/on/TagZoDvUbORvRRev3qtC9UA
         chuui/OMjEMZHtjQL+U+8wpqAwFHBP2d+KGR0806TtDoxeQwUztooiQVWkDIWi+LUKKv
         QjkFMp3rjD4UxXMKmFRFN+Go0klATbiQBb0kldozCFsrD846m0ayVQydknGgnMWSfZQr
         S02UrP9wZIJbShFIvXLB6ltDE1oct6oxSnc5FBfogZ4/ke1MrbvBcG00cu36edN9QPwa
         V9B6K+pwKUgs1EJKJm6GzwAf/qK1hd4mj1jJFV/sf6BC2bdITwtlcqSr240gMpgp6hHl
         vmAA==
X-Forwarded-Encrypted: i=1; AFNElJ+R/LfI2bmR5r8RHuYOrOJisvKLL4roGx+kvtAsD/NRpgr8D+y48u1Yl+HB7lhJ+/JOFKAZfWIZMTwMPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WSXR2+66p1lYifnLj+JmKvr13W7kRBJpii+47nHp6GTKZxIv
	Tq8JGYldMoefx9RUJtj6XXgSS+WmTUZB4LDd1Ijk/VYy5dDIVZ9kkrai9C3ktuw7
X-Gm-Gg: AfdE7cl+PWEYRxY6lSD6g6O8aDmDgsYiC5cxjsp931tonBAiJIfSGk2wltSlJ2VBPIL
	Kfk2SNuUc6TLrRAal9/ma7ffersibAtrIEONGQujELIO8312V0hatA/ju5X3TYKXVykJup840k7
	2PdS3XzKyXDkp+9QfmWbn/gPhBvZJG2swl4AuffoLzk1+Rg+wADLlCewfmfS+t0TqJJE9X2ugxk
	QPRIDYzgDCuapOPCN2nmlXvdJ5UGTbxDud6GxvxnUizr2/YCKP1CoUDRfDZteO4YzlZolM8FQWd
	eApMowW0uQCKFZjgbw2uJyOYB+ewqjfaT6R1LkXcVlRnNdJCi0/OlmXEiW6nmw73qV/Xg8Lk12T
	6AVQ5+Y1gVw3kZE9q0eK+apQwiwDiocvHtgd5FP+lOQ/YmTCTALYCF3RF5KMpmPaDuMVzewOUh0
	PQtScF06rjFyXwBmk0xEypEx4ZcLwqrq0=
X-Received: by 2002:a05:600c:6288:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493d1201f26mr69773425e9.39.1783251111668;
        Sun, 05 Jul 2026 04:31:51 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ec8asm237235895e9.1.2026.07.05.04.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:31:50 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Florian Schut <mail@florianschut.nl>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG Maximus Z790 Hero
Date: Sun,  5 Jul 2026 13:31:15 +0200
Message-ID: <20260705113125.812045-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Schut <mail@florianschut.nl>

Add support for ROG Maximus Z790 Hero.

Signed-off-by: Florian Schut <mail@florianschut.nl>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 77a709517437..ccf43fd1fa9f 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -30,6 +30,7 @@ Supported boards:
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
  * ROG MAXIMUS Z790 EXTREME
+ * ROG MAXIMUS Z790 HERO
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-E GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..4ec2028f7dfe 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -527,6 +527,14 @@ static const struct ec_board_info board_info_maximus_z790_extreme = {
 	.family = family_intel_700_series,
 };
 
+static const struct ec_board_info board_info_maximus_z790_hero = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_700_series,
+};
+
 static const struct ec_board_info board_info_prime_x470_pro = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -893,6 +901,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_z690_formula),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
 					&board_info_maximus_z790_extreme),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 HERO",
+					&board_info_maximus_z790_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
-- 
2.55.0

