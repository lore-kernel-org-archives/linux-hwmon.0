Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1C348C72
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898942; cv=none; b=qymAigtX4t52734Cm43Wr70bpjRdJ4qxWcqoe4ygzqCRQF5pjL2+HrsVI68tisXTPWTIw0zfg+lABoq6BykoMOZ5CXuNfRprWUoogQaRzbq4Nf7YnsGeHsgC8tvi8FjiEU/BmpKFUOizZfpKsNmpqUCiWzV8ohuzfV/7RgauBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898942; c=relaxed/simple;
	bh=0lPFtNBdWRvBYnXPyFHieSVNBHMCubr7WUXsnwYbK40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H27At9afaNTAqXUFE4zW9JPpi51vQ3i2PX3WjR2GIvfugtOlzzfqKfCLl6Ta8aQM3BWWZAw684af0oE/byWdyI4b3PBRr35ZfzCRZcFsYVVnLPXfqjus04cD3QgznDdVfFCb0Z9v70GjX91ERAf3aa9I+zblEAil+rmAc3Qd3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9mHgSvl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9mHgSvl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so2839310f8f.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 23:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898940; x=1781503740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqsXDC7hrVugJjB8a32rNLms35wnnkCAO8b65jTuBio=;
        b=f9mHgSvliMuMOVvRUSmiHnuJlRf7ZxqcTntkorHQfxEjLPtP5TYWdYF9vnRN+4C6cl
         NfAzhxwE+Ieq2Jc9xs8wmcWPrVEi9xyLFlzTe4P05CCd+/Gc9kLUX49bfr6TrWDi1Tmd
         hrpPMkDxZ3A8W/YIPZYHV/yfdHOppD+qzDo9sLqkJhyb4wsqYt53K4aH39wox9XlG4PJ
         gWzNPwMfI7t006+qdBcMpzs/WNMvq6TxVdd2IuqgAGsRhn0ZnFREvZXsH3LLa7bws39g
         U/4zQYep4QX8CrSIA06DKTZA5VJG6jaxFjumcahFeEzTzAJ6G/rx1hkgwQSFuNlZlRvD
         WqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898940; x=1781503740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqsXDC7hrVugJjB8a32rNLms35wnnkCAO8b65jTuBio=;
        b=Oy0wkHhNdB5Kv2glUs3hClk4E8qR0UVXC751rgWetMZQa8kO8y/ZUPFSBaQXl0o6cd
         ie9THsZPie5L07lfWF0eMyNbbFxD/+iQEt3u6nAbe9E2WJScEEtFjxwaVKJamNd+urmY
         DzrRPVqWhqiTxcYSjw0p3ZZVhn04UFsNoj5BB4dYkQ/nzGry59SI+CP04Xz7N01SISL5
         /GiBZCb280OwMskm6b6zrlo2xFYiS3FOJ36W7+xP9l8BwmdHBiwxtuBhEOewEAEPLLg7
         kQP6qcQJ5ZMdsZOKQNhN+zxzQPeHw2LDbsz2URk0oVjypZm+yApeBamqozVNEhyFX2KU
         NbKg==
X-Forwarded-Encrypted: i=1; AFNElJ94N28aU/TtcrQs8qFakp0aX9R6cTEmkU0Z9mDZ83+rlbeB92+5nZBsDyAJAYrLvckIcf2mdHbzCW3SUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2l30OtUTQLi44OBTR5DhnLGxBJ3+66HFH6m6/+/Epp4bzeYhU
	V+mXlB+B4iB19tGovPW2c09vl27/hpSZXiG7VYQmOs7Zxp8ZnoIjIC/o
X-Gm-Gg: Acq92OGt+NHnl7xUK9xnuSacdU2lDsn18xVdnDpFKCeedEsWVS1RonzzEBZF3uRD6Mj
	utw9ADCfIJ2OmZWcj8kf4ZTge01Yg4EmnuHYf0R+CI0E2PQgVi+E25gHze+HWuBHDEiXxLPY2Gc
	dp2wabU9Hb5b1/Cog/CZ9Qf2/WuEXlfCQwiUrTuoab1iOb72KC/zEz+s0ASJ67N7992kg9hM1vG
	aiEw3chFqRUf4zXmJwf70OMuSAqZy91yA330i2U8M5z6YqVXJaE9pYObLq87PZxMhaTeFvxKQob
	NQ1DgUJmz/4fk9ngp6nveYpbuLNspxYzgsQcXIqks/bKfbmG7VM4pxWv9890owhUuJtRiEh1doc
	nngKa7neN9VoTo///9ICtHtkO7SsDTB4E4x3KOHaxHZg1LcAOwSPUvLa+zDWqjkdbufDD4BOEC7
	Ks9DW1MaEQQ1Dn+VGWIm8KCdlswG35CAlP5Blk5F3oRMzSL3bvxlCz
X-Received: by 2002:adf:f947:0:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-460302e0899mr16283297f8f.7.1780898939531;
        Sun, 07 Jun 2026 23:08:59 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm52023475f8f.6.2026.06.07.23.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:08:59 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Brian Downey <bdowne01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Date: Mon,  8 Jun 2026 08:08:41 +0200
Message-ID: <20260608060855.40469-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Downey <bdowne01@gmail.com>

Add support for ROG MAXIMUS Z790 EXTREME

Signed-off-by: Brian Downey <bdowne01@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..60f1a6036538 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -29,6 +29,7 @@ Supported boards:
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
+ * ROG MAXIMUS Z790 EXTREME
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 070bb368f2b7..0e78750de34a 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -399,6 +399,12 @@ static const struct ec_sensor_info sensors_family_intel_700[] = {
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
+	[ec_sensor_fan_water_flow] =
+		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
+	[ec_sensor_temp_water_in] =
+		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
+	[ec_sensor_temp_water_out] =
+		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
 };
 
 /* Shortcuts for common combinations */
@@ -509,6 +515,13 @@ static const struct ec_board_info board_info_maximus_z690_formula = {
 	.family = family_intel_600_series,
 };
 
+static const struct ec_board_info board_info_maximus_z790_extreme = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_700_series,
+};
+
 static const struct ec_board_info board_info_prime_x470_pro = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -857,6 +870,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_x_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
 					&board_info_maximus_z690_formula),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
+					&board_info_maximus_z790_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
-- 
2.54.0

