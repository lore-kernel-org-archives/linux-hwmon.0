Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E252F25F0
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Feb 2026 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772279067; cv=none; b=V4WoMYfSI/P/nx2MpwqbpBx6nI6Hyw0TmZwKr6wfAcXAO2aKOKufFbzsZaHrTBLuGlYFwk6f4Lrp8gmJY6L+1DmXcH3lRyKmM8anuTR1/fxsuHOyEMO8cLT+0RS8NefUFFcsN6ytB/KnSbdhd9JEcEGMXmBSwmpGHNv5myHl0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772279067; c=relaxed/simple;
	bh=y2VxJYVpFPHCUjmN+HLpUN8Jj2ve1ZiTJ40Sxpt4ML4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzwCV6HjMF4rvg6s/+8JIiYXKf60ZtdeKYQBqDNeS1gJJHsoe9AdOWmGLASTu+TOq/sLNRediFNMYt8KD4Yz5foWyC+KU0CjFnO7XjrBwXWvUwcBXTlM3mSZm6GP7OYg4dRWtMhJatF5qx2mkIWVYANjAjvaxn3sAA5IOvIBmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rlk172LN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rlk172LN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837907f535so25347705e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Feb 2026 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772279064; x=1772883864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98h2Yf/UHTEpAy1GYwD6YY/YONXeb7JoAzQUMndrfgM=;
        b=Rlk172LNjxTa6tIakpBpA1IC4uTKl3T+T4GjqQiqHDkfbqnWHdgMpETzwVc4mZx3Cu
         SUAswy0ZM4AqulYyv4F51m5x4+tLe9bvHlh7FepwwG4xX9bddzyLIhfqlL5yj3c+2+9P
         e12+ugsSwD0OO8PYwCN42maa/qDN60dqDcKDScZE+aCZlLdL8DRGNRlq8tO7pq0hRXOC
         PAOfcfM39J+Vl3lOvnKy5DeCuDVJEyHNVtsJ81YOtxN9IbvHB4rD9Ok0KEWvzvNpU2tM
         H4Sw8zb8DpNAoXXfEOdbKBj+75BijmGGj1p1ud0ZzpebM1jgD7i4Ppvg2IDa4+MN1u2U
         v15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772279064; x=1772883864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98h2Yf/UHTEpAy1GYwD6YY/YONXeb7JoAzQUMndrfgM=;
        b=dEnuhWLl5wf7UxOVQkgRJcaeDTCl+6AR1rxyKlae+TBXF0cCWMNlOgMMtDRxH9sTFV
         UB68v1sS/Aslupw3u947mQXYq8IAferH33C5WVHlrZUOyOZm9jMcHZ3+M0bYrVPQ5hEK
         91eiIbQxI8bKOvZyTmv2ZgEl6Lf3YK7O2ksDnJUKZXpOXwCy0nNTu0PRM06he1p+u70y
         BKuGeMfyjoBF4yKo/7f8u2dfvS2nxNFeTJ8uhNrDjbkK+pVNh07mfMijUdFGSUPBjfHj
         UHbzvJMpkUtBUb1RGW+YiNZR4+kP/Wsm6uxkSqV8gOzKxosMMpnB/kVmn22R8xBKXZ4p
         /uxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV8r6BLm2h/sukPH0+aNPRGGMVga3I0n3u2EnLRb50zFBNdsoBoIHnTYpBPXcHbyAd0vKzvYQjoo3LGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UUCT+c5oe72GzoE77m8ezndbbgexayIG3QFivf7Kd7bF34+t
	eYo0L76uibfHXSMo+hTOjHF0zf77SOEL4b9r+pZxpkzY430OBUcopqy6
X-Gm-Gg: ATEYQzwV291NCZGdI1MuHSRWhHZTBrHnkENes4KHabqD5HDltovOMjxT4vf3nwygn9o
	RLhZSiOSq8sp8yFxQ4+3n3Df6GwardORqyoFJoZDcn4ED9vA01QDqWMvmtDGWPlFulyPfoP5m+z
	a5brv3GRxx9g54bjutGQ6d3s2bBz7Useea4vEBLdL1Q8t4j/PssvUdY1RcXVwd4obFne+9rHX4d
	QGFUF8wTgiOTywXMxIUZjAYnYOuxnzfHMC+AXWYJ/bSujZg2M/gRKuBxh2Bm4VJSy5E2ng/RsU0
	UxtK6IQQQlJSL4WSITPckV9we3xNjW3Y/Z0lftRj+qKv9h+DpckmnM/wG91QyaZPL6+XVdvxjEe
	iB1CccWmx6YtW59La7R+pvOoHxmIb5qW61bqdSePK+CK/iMq9gwXM2vmZgDsnzOuySwgI3Dz3yP
	qN8DAw1cWXGneBD89BNOsO//bppWS9/+E4RGYEwYfgQw==
X-Received: by 2002:a05:600c:350d:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-483c9bc5721mr101981405e9.23.1772279064394;
        Sat, 28 Feb 2026 03:44:24 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm293394635e9.3.2026.02.28.03.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 03:44:23 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z790-H GAMING WIFI
Date: Sat, 28 Feb 2026 12:44:02 +0100
Message-ID: <20260228114412.358148-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>

Add limited support for ROG STRIX Z790-H GAMING WIFI (VRM temp and
T_Sensor only).

Signed-off-by: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 84b92093771e..9ad3f0a57f55 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -50,6 +50,7 @@ Supported boards:
  * ROG STRIX Z690-A GAMING WIFI D4
  * ROG STRIX Z690-E GAMING WIFI
  * ROG STRIX Z790-E GAMING WIFI II
+ * ROG STRIX Z790-H GAMING WIFI
  * ROG STRIX Z790-I GAMING WIFI
  * ROG ZENITH II EXTREME
  * ROG ZENITH II EXTREME ALPHA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ba1db62ad646..070bb368f2b7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -762,6 +762,12 @@ static const struct ec_board_info board_info_strix_z790_e_gaming_wifi_ii = {
 	.family = family_intel_700_series,
 };
 
+static const struct ec_board_info board_info_strix_z790_h_gaming_wifi = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PC00_LPCB_SIO1_MUT0,
+	.family = family_intel_700_series,
+};
+
 static const struct ec_board_info board_info_strix_z790_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_T_SENSOR_2 |
 		SENSOR_TEMP_VRM,
@@ -893,6 +899,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_z690_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z790-E GAMING WIFI II",
 					&board_info_strix_z790_e_gaming_wifi_ii),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z790-H GAMING WIFI",
+					&board_info_strix_z790_h_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z790-I GAMING WIFI",
 					&board_info_strix_z790_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH II EXTREME",
-- 
2.53.0

