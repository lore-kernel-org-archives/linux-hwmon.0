Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B95359A6D
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250232; cv=none; b=nDHM9lsOahKxoQVnqaJP+POcUc2HhaspmPyzN5zTqFNuKF0kd7Lvoy2Li1WXFyHQ9bozPP2pbGwlhIcBudcvSY/ZXZ80gq2QsXxl21XIm4xgqLt/kkF3hgxClC97Pl9YLOg1DLvrnRxdItEl9kKZabr5E7GuUZAT8PhOLxEzJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250232; c=relaxed/simple;
	bh=LXftvX8hx2pbwLHcvKo/rJLmJNm1kgbL0Eb4+J9xkRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVjbv1V+uRYMo2mKXMfPFDMuc6tKtcluOR/6WybiiEz3vVslmRNBxJTiF+UZOQl0JoV1He1D06GELxeOFPHy8sBaz5Y/mxufOV1rdJbpLo+Qyk8XGlPgEatojUU2Gd5yYiXKU8BYOsI7qYvgeUJkKrF118XhXJjqddU2CI1cL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+VkgDPf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+VkgDPf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b9144790dso1298596f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775250230; x=1775855030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngz23gOzMdtyswYMlfME9TO2H0rC3SBjwg9WNYEgHzs=;
        b=E+VkgDPfLmYDVtQ0yuzT5SXa8XXVeBbpxM5xikY3EC37CRQkMMn/FgOQe6m7wnEKPS
         8KbaKOOpIAPU0VUd5e/SAf34UPh5dVuPZBH0HmCmEqgdpbevrJfQ6rB27syzAuUUb4AL
         yAf8/W41uJqgPr/f9nq2hA9vcvqnsWSul5l1TyfsylPwa02TZvPQZYfeQ9C5F6IXi6rm
         j75KEtK6A1PetV4tNgjioGc/qs1NQIH3FLtDRZoGS19iOm6FsSGxBkLU5f7oIzJ8MU02
         v1FEoCNllNdRn7YDvHVItElWOGnYmZw9P/e987hicXXmb9KxQDx8saFJXPQKvt0IsrdW
         zo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250230; x=1775855030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngz23gOzMdtyswYMlfME9TO2H0rC3SBjwg9WNYEgHzs=;
        b=IWRqcpM42pcxaoPhrXON6VtK0LsMHeNqhi0i1DxrzzjIKkfAPKjdwXbg8wVLXT7vZl
         fEMwMQN1RAsf9vZV+R1WC+g+ph5Gy49XyV+spRiIHOKbzaWUNwLrJQ0jKwJQvmPl5j/9
         /uuVPZmPEgki5l4sXDJFc9QKh1YeTkvFPU4njZkj0hLVfin9COP+rVXzFiiYA7qSHpXu
         gYCKO5dagiboKOhqZ39XJfoJIm1MLLSIOTYPiDqYEmGQ6BcjqSF+KM4wV2+CX/DxG2zh
         VST764RhGQ/If9vCAEjOPBtnR5k1yst9XKCMBtjbR9GXBFyAgijdlYXWIpCjI6eOvTZG
         Rijw==
X-Forwarded-Encrypted: i=1; AJvYcCX9u9XCaEMbN1BcnTQmUwwYliL9j1E0bA2NKBzI2mvGqhP14vO89xuS0IYGlHBkc/Stu5xukv/IwInz2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA86JHJUqGld4UhBySM6Q/yz5RLXLap7mlgqpVgYB/mKpQc19u
	uPc4A7Cgk+WytBVoXcq4R+xcf1R3/e7tljPEdAJCe/Fx2c/RJktSKPqR
X-Gm-Gg: AeBDiesU0lh+XmgzOk1tiyurNVB3Pi6rf92jxO7v7UMLqw08SmBrmXo4XCadASx0tz5
	lTqHoBSzQ8zyDocDJuMc8ao27vX2raeDajr3WTY7r+6pCoQR6bOcsnz4a/S1Dc5v5PEtE4oIc2J
	FEit/KvcwwckQJsfM9/QLpvsKYtldTr46b6GhRpZyTB634yc8eQLIoRQ21o1Fj+11f8+shkcEfZ
	HLVHZ8mySq6YY7Al345Dk4H27K5qbwEg1YI/maC9XcVkwdRphQqUEPtR6g3WGrKMkmGfoSngxRZ
	5H/FFr+JwAOPsHUO7qZ5Y5yplczSECnZiOxs9/kMBwbK7vet7xlYPTDHYFB9NJZn3FR+BgRi2y3
	pwWln09BNWpX0SgkWpvkQxGMcs//sAA1KyeRpxRaYYkiSr/Ivo3OklIywQZ7OuaoxWhN1bCvw+W
	5Rl2Efhz9GkApXgB7SW002rct4rdMjbK+LIy9ALfzyVFSg6G858+KU
X-Received: by 2002:a5d:5f92:0:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43d2928fc60mr7222728f8f.22.1775250229407;
        Fri, 03 Apr 2026 14:03:49 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm18108418f8f.0.2026.04.03.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:03:48 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
	Veronika Kossmann <desu.git@rxtx.cx>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
Date: Fri,  3 Apr 2026 23:03:33 +0200
Message-ID: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Veronika Kossmann <nanodesuu@gmail.com>

Add support for ROG STRIX B650E-E GAMING WIFI

Signed-off-by: Veronika Kossmann <desu.git@rxtx.cx>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

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
index 070bb368f2b7..8c53cd9ed8f3 100644
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
@@ -616,6 +616,13 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_b650e_e_gaming = {
+	.sensors = SENSOR_TEMP_VRM | SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_IN_CPU_CORE,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
@@ -861,6 +868,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
 					&board_info_strix_b550_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
+					&board_info_strix_b650e_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
-- 
2.53.0

