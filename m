Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B782E413
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934215; cv=none; b=UYkT1dIcVQE2vuUHMzzE2YLgdWVuQxNUDzV7ctoEm2yzYrwmo2lMajR2fsjyx0+PEutXajGKcC8T/lV287Qd6FZ21AmGzKV9yqBrAdGxhM7etmfSrR6BdS6T7lk2JQUPLFoQaGMi+DfqW/KKz90qnTcArAvvEbzc6dpsqLFZuW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934215; c=relaxed/simple;
	bh=jGCQ//PZW8vvSvp0Z+KcNL0bEb5zqVTK49jOl85+gJY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUZvqmygyZUZhG2MFZlNi/GIqWCqct8nqGDCCXFCWpojiVTd6rGXvqEw84N8hB4gRypGT1VWECODuXyqWgtJNXF52THhkynDVIKUabL53P22+7Q7LfPb8ueEM2XkkaTYO5OKU5hFqLHW1PLbwRu3novb8iByjtqbATG0IoGETWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=H22vB+BR; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="H22vB+BR"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id C853B401B3;
	Mon, 30 Mar 2026 22:16:53 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id AC9CE401F4;
	Mon, 30 Mar 2026 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding; s=dkim; bh=0G0kjW1xbpK6
	rMgJ9htPmETZ+Y8=; b=H22vB+BRGg4mCExOwcbY115FBAHWAQiKsO8s+TixI3NZ
	nIJtXMnw9JRY2XOo2vdkmoP1PxzX//XdO7Ic95b8eGkBC3rkLTrAnYQ2dAiLrW6c
	5Fupk/+SMBBWoLKScFYpuQsNDZbI3Jkg5Nsp4j+ny18jxQ3rx0zWH1g0lpobw28=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=BO6T13
	7OjLpRJm4GZLej2664lr875BJApLAcYfDGfmzJ65xHde2tcxXBCV8x4/VCKthFpO
	PmBz8v9T/3t/r1Y9BjJkyjQaDwO8jnrS7bJH9Jrmpo38y5qumL3qhP+JymaZ2VVQ
	AFg71Hoxwp1ai62JkR9jQqFCX+RC5dpK2jUVM=
Received: from bugfood.local (unknown [IPv6:2600:1700:9750:59ef:62cf:84ff:fe62:f2b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 97318401B3;
	Mon, 30 Mar 2026 22:16:53 -0700 (PDT)
Received: by bugfood.local (Postfix, from userid 1000)
	id 0D547C1EF210; Mon, 30 Mar 2026 22:16:53 -0700 (PDT)
From: Corey Hickey <bugfood-ml@fatooh.org>
To: Corey Hickey <bugfood-ml@fatooh.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME X670E-PRO WIFI
Date: Mon, 30 Mar 2026 22:16:53 -0700
Message-ID: <20260331051653.332155-1-bugfood-ml@fatooh.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260330230836.314311-1-bugfood-ml@fatooh.org>
References: <20260330230836.314311-1-bugfood-ml@fatooh.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Corey Hickey <bugfood-c@fatooh.org>

I have attached a temperature sensor (10k thermistor) to my motherboard,
and the temperature monitoring in the BIOS reports a value for the
sensor, but the Linux driver reports a constant zero value.

    $ sensors asusec-isa-000a | grep T_Sensor
    T_Sensor:      +0.0°C

By experimentation, I have found that the address in the driver is off
by one. Some basic checks seem to confirm correct sensor operation at
address 0x37:
* sensor disconnected: -62.0°C
* sensor plugged in, ambient temperature: +22.0°C
* sensor plugged in, held between my fingers: +30.0°C
The latter two values match those measured independently via my DMM's
thermocouple probe (with a precision of 1°C).

The existing address was added in commit f7ac3020036b ("hwmon:
(asus-ec-sensors) add ROG Crosshair X670E Gene."). The commit message
specifically mentions T_Sensor validation; assuming that commit was
indeed correct, then 600-series motherboards are inconsistent in what
address they use.

To fix the "PRIME X670E-PRO WIFI" (0x37) without breaking the "ROG
Crosshair X670E Gene" (0x36), define an alternate T_SENSOR. The "PRIME
X670E-PRO WIFI" only has one T_SENSOR documented, so replace the
original T_SENSOR in the driver rather than specifying an additional
one.
* If there are any other boards using 0x37, those can be changed to use
  SENSOR_TEMP_T_SENSOR_ALT1 instead.
* If there are any other boards using an entirely different address, an
  additional alternate T_SENSOR can be defined without altering the
  naming scheme.

For reference, the sensor used is "XSPC Wire Sensor 10k", purchased from
Amazon.

Link: https://www.amazon.com/dp/B0CR8Q24TK
Link: https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x670e-hero-model/helpdesk_manual/
Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
---
 drivers/hwmon/asus-ec-sensors.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 86f444498650..f5b24a306a0f 100644
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
@@ -277,8 +280,14 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
 	[ec_sensor_temp_vrm] =
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
+	/*
+	 * The address of T_Sensor can vary; only one of the following T_Sensor
+	 * addresses will be used, depending on motherboard model.
+	 */
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+	[ec_sensor_temp_t_sensor_alt1] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x37),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_temp_water_in] =
@@ -519,7 +528,7 @@ static const struct ec_board_info board_info_prime_x570_pro = {
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

