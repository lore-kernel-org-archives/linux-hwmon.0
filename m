Return-Path: <Julia.Lawall@lip6.fr>
Return-path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: bhumirks@gmail.com,
	kernel-janitors@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9 v2] hwmon: (scpi) constify thermal_zone_of_device_ops structures
Date: Tue,  8 Aug 2017 17:09:03 +0200
Message-Id: <1502204943-20075-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-hwmon@vger.kernel.org>

The thermal_zone_of_device_ops structure is only passed as the fourth
argument to devm_thermal_zone_of_sensor_register, which is declared
as const.  Thus the thermal_zone_of_device_ops structure itself can
be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

v2: New patch

 drivers/hwmon/scpi-hwmon.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index a586480..7e49da5 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -120,7 +120,7 @@ static int scpi_read_temp(void *dev, int *temp)
 	return sprintf(buf, "%s\n", sensor->info.name);
 }
 
-static struct thermal_zone_of_device_ops scpi_sensor_ops = {
+static const struct thermal_zone_of_device_ops scpi_sensor_ops = {
 	.get_temp = scpi_read_temp,
 };
 
