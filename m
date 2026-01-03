Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B022D480E
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Jan 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430684; cv=none; b=A1aquWNvWqAlesbYbpVMt3baXunGcopUdp41curPZgq1bWOFm9R9A8SCDa6dtecJvxpxY9+TMRlCdVHIv1a3JoJwXyPbQpslTIkcQxbyDJsdOYrisKv3ei4psxuibRw0m3945++nQ+q4eVveNkfh31a4xqqjGARxxuwP9sl6Yp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430684; c=relaxed/simple;
	bh=Yt6SA3kWdYbvCaJaYCZAzGs4OaZ8RNVSXe/ezQG4BJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHX4YcCivrTZa5fI1415uOvSm0HY6V03gP8wCs+FeGqQEb7NJBqyhxYn88OTfiJIZB/LrYvuFqWxmDprRghbpVZTCWW9fICkkB6KM9KTzKVP4t2OAwD30C17wWVBDsVQSHLIEMAiC22BDZN8yOV8T7dIYrHG2OCM3PLYhlEyclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlxnrvOs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlxnrvOs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so17449169a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Jan 2026 00:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430681; x=1768035481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DuZAEf2mDn/Hmk9nB0yFdt291jnIDGAheSD5EC2lO/c=;
        b=XlxnrvOs1x9gdZeXEJLCGmCpOcIirtdnoqDMlJTbSirI9HLwTPwrfr7r9Y16bCxoA6
         ovTfzCVQtT3NfczfuNfYKEUmJ34hW450UKiTJ2uk4ISZOMdwAti7pb7FXyMqmKr52HOn
         VxHFCO1W0n0LiQkCXFfQ02mHG4f/sSoTLsAn03rIWeqwUHf4Mij7QsowhAvgmsg8Wkiz
         gYt25rl6z3FfHgflwhLP2nvrCK/wRXwhp3P3dg/TAaHRi7NOA8OWfyX4SVxlGqg1rcjl
         S2dJ/64SBwaVNqBFZk6QrWs/FLwwQC0oQOCdumJLx5tUvjq0t6Y78YCKYmumuRaAdtdF
         r4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430681; x=1768035481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuZAEf2mDn/Hmk9nB0yFdt291jnIDGAheSD5EC2lO/c=;
        b=aOlrF8eEHYP9j+rcbbWojd8oTW9Lk16tuPX2uyf97heUEw6ZNEW6/Zk07l/vqciOoO
         BTvvj3mvzenngthwkL3zw6vsORM1cKaXyZA9XNMy9YbRgs/qfaI4ntRBGxVwuzbiPe8X
         34nFiVTUnaSnGsuVn1X/pZjALp3e0NP2no8q61WVcJgcyitUYjkHB0us/1WjrNAWtaR5
         CnFweZ3EhABJCIxv6Fcnq9TaoH5tjWLrEaFJbEe9gPaAFmCAGLn/k9bvlzMB5KOVOTXc
         t35J3gQCV309Ghm1ilfebs6ds3O2IuVZ6KbQbA20yHFP9UKLSVjmBvvgwOd1H11RJq4s
         8ePw==
X-Forwarded-Encrypted: i=1; AJvYcCV4RU6+fWeQK8G9GtJBe1+K3gVWLtH4980CgPq3DCO42NJ1mwJ9jB0WH9kSu5T5xNBvv2xDGMntKWyltg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8mAGsDSbgirAeK7TFUcDg2YF7SLsZV419kGb3AGOfpSeITn+
	qC1RQToJVfbEmvpmmQDzRlW1+YYLbaN2HkaounqX9IMuawVAMhveaR9eZq+JV1yLHZ8=
X-Gm-Gg: AY/fxX6kSuqvKZ27dW5MWc7fSowQyqsN5SgZApZ+/07BVqCoNmT6Vn5/OD++VbxWNBA
	ch22r9yciCuTa0eRtCx1v2TFGFmEG5O/QQ83av8sMmR8MA2Q7+kK/J0e0+oe4upftF4ut3aIwab
	HbggVkJr3T4ocg8IyroFN7eaA2kSyEr23TIVS8oZciqKTPgosSrHMmDc8OS+UNbSwMASTsK0uPY
	FbPSAWeyacxWmQIfr3LCVaGT7d9pFvtpCaUmXCH5NH6TVyhRLK77SQr/IoXXF7nQpVfINBVNCAH
	uwiRNXDzOwKLXpPKSbykBaA8avy9pVV5BxNA6Q12/cOKUgYCwvQmCPpbUC3+dcroWAefkI+pS5r
	7ERxkrQPtWzzoQyeb4zVrwPBr8hcQeEjvU4RIYqpGJzDba4CNdhex9TKX8YcBgiPTg0BNuN4jXR
	n1UfqKW6HZgY0WHHHw9ZV+EViSTPw+Iw==
X-Google-Smtp-Source: AGHT+IEvW5svBP1/hN2gV5F4lua4S1Qz0MKFTtH6y3Yrod6QNCt+39oarHEWP6Q5T7sq9qoJPfoA9w==
X-Received: by 2002:a17:907:3ccb:b0:b80:3101:cd13 with SMTP id a640c23a62f3a-b8036f0a480mr5015913266b.10.1767430680831;
        Sat, 03 Jan 2026 00:58:00 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a6050dsm4904139066b.9.2026.01.03.00.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:58:00 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Jai Kith <kithfx@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add VRM temperature for Pro WS WRX90E-SAGE SE
Date: Sat,  3 Jan 2026 09:57:31 +0100
Message-ID: <20260103085740.10644-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jai Kith <kithfx@gmail.com>

Add VRM_E (0x33) and VRM_W (0x34) temperature sensor definitions to
sensors_family_amd_wrx_90 and enable them in the board config.

Signed-off-by: Jai Kith <kithfx@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 8435be30c3f7..86f444498650 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -317,6 +317,8 @@ static const struct ec_sensor_info sensors_family_amd_trx_50[] = {
 static const struct ec_sensor_info sensors_family_amd_wrx_90[] = {
 	[ec_sensor_temp_cpu_package] =
 		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
+	[ec_sensor_temp_vrme] = EC_SENSOR("VRM_E", hwmon_temp, 1, 0x00, 0x33),
+	[ec_sensor_temp_vrmw] = EC_SENSOR("VRM_W", hwmon_temp, 1, 0x00, 0x34),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_fan_vrmw_hs] =
@@ -574,7 +576,8 @@ static const struct ec_board_info board_info_pro_ws_wrx90e_sage_se = {
 	/* Board also has a nct6798 with 7 more fans and temperatures */
 	.sensors = SENSOR_TEMP_CPU_PACKAGE | SENSOR_TEMP_T_SENSOR |
 		SENSOR_FAN_CPU_OPT | SENSOR_FAN_USB4 | SENSOR_FAN_M2 |
-		SENSOR_FAN_VRME_HS | SENSOR_FAN_VRMW_HS,
+		SENSOR_FAN_VRME_HS | SENSOR_FAN_VRMW_HS |
+		SENSOR_TEMP_VRME | SENSOR_TEMP_VRMW,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
 	.family = family_amd_wrx_90,
 };
-- 
2.52.0

