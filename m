Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A452D3EC1
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994059; cv=none; b=RNvdQiq6jJSQ6J56nQ8UlKshcLkr1WYBLvGaHG2VcBwHceZtXnAWhjN/PhAd0yDUBKIFdwz4t+QP0/6IfmHM62G+gtO+knaOlngTB3bsv0Pjs64WFH4TvhcU+8W7wWeR3BqI1qMReMfPCah+vdPgvrOsKK4R3iW65ShCXjGL7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994059; c=relaxed/simple;
	bh=yZxtZWBqdfenSFda9Pc97ZeUxFX3TNjjuLPulpbG7Eo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TxbYRsD9Wh8eibJt8M04h1x47XpMVRdKvwLCRNp1yJ/hWZpF8OzyhHymhVbVe5l0Ytk4xV7MwjN98UJt3pWj0PITfrFHJA2ZVDYc+yN1BDgC1rPnRLWn1mFDA/6jqllfJtWZQnrHzTS9Ysn/U31z4vcZas72KjIpwz9a3Cb3N/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=o+8kh86I; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="o+8kh86I"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 67FEE401F4;
	Tue, 31 Mar 2026 14:54:16 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 2DF9140261;
	Tue, 31 Mar 2026 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=dkim; bh=QXTsAQIfet5GSU6XSgQEulbUP
	DE=; b=o+8kh86IdzWYz49/f2BHW6uU4NBkNVjQMt+AM2mK0ggrMMaYHjTH0hhOA
	xs7+OcOILG2kuu4q5GPUE9hfZuQshYZxmnTl6ljAsEwFZZBPX9vpnUfh6J02bRXH
	bUUo477x5HwS93AgkTUDnd+patK3lQQzGTdpvPJH/WzBLXxoXU=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; q=dns; s=dkim; b=NQGqpaxWTQTllSe7a7i
	C8mJae8tfTgxNiOAxujCmxkgqoYuLaXkCqK747lZQlFmA1QpTxXS2tamJpr+qq5O
	NakZIXKkxg1zRcP7LdDjAgSnkdM6nDaMdGv1v4OT37wO1j31NOJmWp4IZ4wvhsqm
	TGt2wXxArwL4p64ALFrVmEW4=
Received: from bugfood.local (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id E3258401F4;
	Tue, 31 Mar 2026 14:54:15 -0700 (PDT)
Received: by bugfood.local (Postfix, from userid 1000)
	id E8CC7C1EF214; Tue, 31 Mar 2026 14:54:14 -0700 (PDT)
From: Corey Hickey <bugfood-ml@fatooh.org>
To: Corey Hickey <bugfood-ml@fatooh.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME X670E-PRO WIFI
Date: Tue, 31 Mar 2026 14:49:06 -0700
Message-ID: <20260331215414.368785-1-bugfood-ml@fatooh.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Corey Hickey <bugfood-c@fatooh.org>

On the Asus PRIME X670E-PRO WIFI, the driver reports a constant value of
zero for T_Sensor. On this board, the register for T_Sensor is at a
diferent address, as found by experimentation and confirmed by
comparison to an independent temperature reading.

* sensor disconnected: -62.0°C
* ambient temperature: +22.0°C
* held between fingers: +30.0°C

Introduce SENSOR_TEMP_T_SENSOR_ALT1 to support the PRIME X670E-PRO WIFI
without causing a regression for other 600-series boards

Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
---
v2:
* Fixed comment format.

v3:
* Removed comment about T_Sensor address varying.
* Removed incorrect reference to thermocouple in commit message.

v4:
* Made commit message much more concise.

 drivers/hwmon/asus-ec-sensors.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 86f444498650..adedaf0db10e 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -111,6 +111,8 @@ enum ec_sensors {
 	ec_sensor_temp_mb,
 	/* "T_Sensor" temperature sensor reading [℃] */
 	ec_sensor_temp_t_sensor,
+	/* like ec_sensor_temp_t_sensor, but at an alternate address [℃] */
+	ec_sensor_temp_t_sensor_alt1,
 	/* VRM temperature [℃] */
 	ec_sensor_temp_vrm,
 	/* VRM east (right) temperature [℃] */
@@ -160,6 +162,7 @@ enum ec_sensors {
 #define SENSOR_TEMP_CPU_PACKAGE BIT(ec_sensor_temp_cpu_package)
 #define SENSOR_TEMP_MB BIT(ec_sensor_temp_mb)
 #define SENSOR_TEMP_T_SENSOR BIT(ec_sensor_temp_t_sensor)
+#define SENSOR_TEMP_T_SENSOR_ALT1 BIT(ec_sensor_temp_t_sensor_alt1)
 #define SENSOR_TEMP_VRM BIT(ec_sensor_temp_vrm)
 #define SENSOR_TEMP_VRME BIT(ec_sensor_temp_vrme)
 #define SENSOR_TEMP_VRMW BIT(ec_sensor_temp_vrmw)
@@ -279,6 +282,8 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+	[ec_sensor_temp_t_sensor_alt1] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x37),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_temp_water_in] =
@@ -519,7 +524,7 @@ static const struct ec_board_info board_info_prime_x570_pro = {
 static const struct ec_board_info board_info_prime_x670e_pro_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+		SENSOR_TEMP_T_SENSOR_ALT1 | SENSOR_FAN_CPU_OPT,
 	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
 	.family = family_amd_600_series,
 };
-- 
2.51.0

