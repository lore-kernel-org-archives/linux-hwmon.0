Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243BE1A08BC
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Nov 2025 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764043326; cv=none; b=eIgviHM6djK+E0dOKX7Pwcixg42R9ucShPrKlSlb8iVZGg4wfFEoHiXhk+QfB8niSPnkYajkIEy0/f4gX3Vb5xLw6GH5oU9MwdKwkPrPFm9lBs7GnDZeIhmqpxTUFkP3tjR2ljzY6MF+e+GUDV4GVjL6V1X9b260hAIp6jVuGm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764043326; c=relaxed/simple;
	bh=y3oFOjEYQ2IKOTUPVJ9GV5ZQ7RDboALMdp4lP73k9xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGlbFhTph75OJ3iuQ+/gIOlP8NPPI9cNGwA011xA2pmLbqs+PCKKKJaPz4GNm0lYgw+oYZqK+mTeGlqXSAnX7wWcYkPUiuJTrjl6Z9aRNGQahLh+Q/esWLrPLbkFw5IooxUdFo8kEvdxGfI3F+re+pyM3z4BPcK9Y/C5KISDRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGG45Ns0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGG45Ns0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b737c6c13e1so371477066b.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 20:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764043322; x=1764648122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5csLXwnJI8i9y/ZwcZdA1UQbcFjWR2KphmyCmCwzfMg=;
        b=bGG45Ns09VV0TPhIQKMPbpuj7lKv0hfZMby+0x1czMzaMD4qm/aUBgc021rKOmTeOI
         3CEwGm153WffNu69tM818hHmjA1erINQ2zWn8X4pCTNhaSRSG4XKi/rlIpWOlm66Lr3d
         m0l9/Vxo65fqkH3MPL9s6qF/FLWWgMbpRczf1jwkgoUvVxhM8MY9Cm6IJvbyP82pj1L4
         QdRyPaIBqnwg27BL9Pb2RB9ccHHvEjYMNo4jvVdNUgJw3ixgLsza4tLSeQjq+u9FgnyA
         +5SlGUrF3sLuTMSBiZVwUvPIcPmvv2kRVi9mCINX56NM9E/mSZ0uVQEH/ugysTSZQtx6
         vGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764043322; x=1764648122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5csLXwnJI8i9y/ZwcZdA1UQbcFjWR2KphmyCmCwzfMg=;
        b=BDfRz/pF5GowNL/X0HJ/BNSw+8IYFKROn0v+BcFUCHXomE94GCR8dcZkF3WNuF/rp5
         T28KKO9RmvcxwBl1TFfilm+O+HumQS/VhHHeCk7i1U4VekfNdkd/ScAVhlve6fkjZ94p
         1u3TmVEQv5D8Kymz7u7W2sqgbcaBEokLSZ011fo1CpL/ApzL/LEP8o3byqHmB8yKQ2O3
         xIr9ppPWnZe5olLcBU9IFmVR8u05ujCfMkSYz/wyWr8Bxd3yfyFUmBybNqSWzdmxr4xw
         NEoODfWrkgTFWhnDEi9ng4pCSx80bPJuXOVqtoerJcjegHhRWTQIz5oDD7XiX8YWpRqv
         ZbrA==
X-Forwarded-Encrypted: i=1; AJvYcCXtKYq2UmWuJEXXZMOfeVN0oNe2J3VcwtC78vrmju0HbkYx5XkipvnntDCsqrEem0Na4Ps379xTVihKWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3JdPbJGj017RW0blfti9z0oQtg7retdlTgWRKC/s3XmvI8II
	raKdP3tFhiil9rvknhJHh8UGXM9Ej/vL2Rx8NFn6SYH737UZ+54fooLcAcrO5TPX
X-Gm-Gg: ASbGnctLNyqIunSrmZ/XW7SHCNY38hsEn9+gBI9SOxaEgVs0gxOySZpxQliMih387aF
	2+CGOjcGGJyKNAyCmDErCYkrgjOypkeUHR/k5pHQm6n1FLbgaHzP+6RnVTWY4jHlaTuhYZHtI0x
	lyDpIR48BNxCzwnXxooCdPWhDLqVDsSNZZssV4rMnmIkf/OCtdjiLYad+7nLUkqAzg7ZivIxpaG
	iF5itUdhSDkiD80cRQ+cqzPep43etVyd9F8XTAfd4R09kGCgfM8Fin3uLg33bsipubU7445WCXU
	cse9wYXZN+lT0zuNOB19caIXdBhJvGmGdEnKpvKkaxo9iAqE6Q52bsGNJxLW0Qz2yx3froPag/e
	Ful9REjNBOO+T+lOJTo3IXQfidjfUPFpkmgfLzkA5quzIK1gxkkYyyJ2/j4gtDnz0HeWGM4+fC6
	T//9etbeIP4/Fcqp7is8R6p8FsbrZWrQ==
X-Google-Smtp-Source: AGHT+IGmqbiYdTLglsTShH2KBVnlsGq4w69YqqNFcl5W4vY1FLIL3+6VF+quoam5pwYpgdpgOAOFyQ==
X-Received: by 2002:a17:907:7f0c:b0:b76:4fcf:b371 with SMTP id a640c23a62f3a-b76c55f3f32mr119509266b.38.1764043322238;
        Mon, 24 Nov 2025 20:02:02 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3962sm1483985166b.50.2025.11.24.20.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 20:02:01 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: =?UTF-8?q?=E5=B0=8F=E5=A4=AA?= <nospam@kota.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) correct Pro WS TRX50-SAGE WIFI entry
Date: Tue, 25 Nov 2025 05:01:26 +0100
Message-ID: <20251125040140.277756-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 小太 <nospam@kota.moe>

Add missing temperature and fan sensors to Pro WS TRX50-SAGE WIFI

Also:
 - Format VRM names to match the BIOS
 - Fix swapped VRM_E and VRM_W entries

Signed-off-by: 小太 <nospam@kota.moe>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index b56a5a63cc61..61b18b88ee8f 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -113,15 +113,19 @@ enum ec_sensors {
 	ec_sensor_temp_t_sensor,
 	/* VRM temperature [℃] */
 	ec_sensor_temp_vrm,
+	/* VRM east (right) temperature [℃] */
+	ec_sensor_temp_vrme,
+	/* VRM west (left) temperature [℃] */
+	ec_sensor_temp_vrmw,
 	/* CPU Core voltage [mV] */
 	ec_sensor_in_cpu_core,
 	/* CPU_Opt fan [RPM] */
 	ec_sensor_fan_cpu_opt,
 	/* VRM heat sink fan [RPM] */
 	ec_sensor_fan_vrm_hs,
-	/* VRM east heat sink fan [RPM] */
+	/* VRM east (right) heat sink fan [RPM] */
 	ec_sensor_fan_vrme_hs,
-	/* VRM west heat sink fan [RPM] */
+	/* VRM west (left) heat sink fan [RPM] */
 	ec_sensor_fan_vrmw_hs,
 	/* Chipset fan [RPM] */
 	ec_sensor_fan_chipset,
@@ -157,6 +161,8 @@ enum ec_sensors {
 #define SENSOR_TEMP_MB BIT(ec_sensor_temp_mb)
 #define SENSOR_TEMP_T_SENSOR BIT(ec_sensor_temp_t_sensor)
 #define SENSOR_TEMP_VRM BIT(ec_sensor_temp_vrm)
+#define SENSOR_TEMP_VRME BIT(ec_sensor_temp_vrme)
+#define SENSOR_TEMP_VRMW BIT(ec_sensor_temp_vrmw)
 #define SENSOR_IN_CPU_CORE BIT(ec_sensor_in_cpu_core)
 #define SENSOR_FAN_CPU_OPT BIT(ec_sensor_fan_cpu_opt)
 #define SENSOR_FAN_VRM_HS BIT(ec_sensor_fan_vrm_hs)
@@ -296,10 +302,14 @@ static const struct ec_sensor_info sensors_family_amd_800[] = {
 };
 
 static const struct ec_sensor_info sensors_family_amd_trx_50[] = {
-	[ec_sensor_fan_vrmw_hs] =
-		EC_SENSOR("VRMW HS", hwmon_fan, 2, 0x00, 0xb4),
-	[ec_sensor_fan_vrme_hs] =
-		EC_SENSOR("VRME HS", hwmon_fan, 2, 0x00, 0xbc),
+	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x30),
+	[ec_sensor_temp_cpu_package] =
+		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
+	[ec_sensor_temp_vrme] = EC_SENSOR("VRM_E", hwmon_temp, 1, 0x00, 0x33),
+	[ec_sensor_temp_vrmw] = EC_SENSOR("VRM_W", hwmon_temp, 1, 0x00, 0x34),
+	[ec_sensor_fan_cpu_opt] = EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
+	[ec_sensor_fan_vrmw_hs] = EC_SENSOR("VRM_E HS", hwmon_fan, 2, 0x00, 0xb4),
+	[ec_sensor_fan_vrme_hs] = EC_SENSOR("VRM_W HS", hwmon_fan, 2, 0x00, 0xbc),
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x01, 0x04),
 };
@@ -545,7 +555,9 @@ static const struct ec_board_info board_info_pro_art_x870E_creator_wifi = {
 
 static const struct ec_board_info board_info_pro_ws_trx50_sage_wifi = {
 	/* Board also has a nct6798 */
-	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_FAN_VRME_HS | SENSOR_FAN_VRMW_HS,
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE | SENSOR_TEMP_VRME |
+		SENSOR_TEMP_VRMW | SENSOR_FAN_CPU_OPT | SENSOR_FAN_VRME_HS |
+		SENSOR_FAN_VRMW_HS | SENSOR_TEMP_T_SENSOR,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
 	.family = family_amd_trx_50,
 };
-- 
2.52.0

