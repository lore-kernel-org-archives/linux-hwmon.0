Return-Path: <atull@kernel.org>
Return-path: <atull@kernel.org>
From: Alan Tull <atull@kernel.org>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alan Tull <atull@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] hwmon: add dt binding for max1619
Date: Mon, 11 Sep 2017 14:16:49 -0500
Message-Id: <20170911191649.3344-2-atull@kernel.org>
In-Reply-To: <20170911191649.3344-1-atull@kernel.org>
References: <20170911191649.3344-1-atull@kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Add new device tree binding for max1619.

Signed-off-by: Alan Tull <atull@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 drivers/hwmon/max1619.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index a182789..76d9669 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -303,10 +303,20 @@ static const struct i2c_device_id max1619_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max1619_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id max1619_of_match[] = {
+	{ .compatible = "maxim,max1619", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, max1619_of_match);
+#endif
+
 static struct i2c_driver max1619_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max1619",
+		.of_match_table = of_match_ptr(max1619_of_match),
 	},
 	.probe		= max1619_probe,
 	.id_table	= max1619_id,
-- 
2.7.4
