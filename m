Return-Path: <miquel.raynal@free-electrons.com>
Return-path: <miquel.raynal@free-electrons.com>
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Antoine Tenart <antoine.tenart@free-electrons.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] hwmon: (gpio-fan) Fix null pointer dereference at probe
Date: Mon, 16 Oct 2017 14:12:10 +0200
Message-Id: <20171016121210.25556-1-miquel.raynal@free-electrons.com>
List-ID: <linux-hwmon@vger.kernel.org>

A previous commit changed the argument list of gpio_fan_get_of_data(),
removing the "struct *dev" argument and retrieving it instead from the
gpio_fan_data structure. The "dev" entry of gpio_fan_data was then
dereferenced to access the of_node field, leading to a kernel panic
during the probe as the "dev" entry of the gpio_fan_data structure was
not filled yet.

Fix this by setting fan_data->dev before calling gpio_fan_get_of_data().

Fixes: 5859d8d30737 ("hwmon: (gpio-fan) Get rid of platform data struct")
Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 43b697380987..5c9a52599cf6 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -510,11 +510,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	if (!fan_data)
 		return -ENOMEM;
 
+	fan_data->dev = dev;
 	err = gpio_fan_get_of_data(fan_data);
 	if (err)
 		return err;
 
-	fan_data->dev = dev;
 	platform_set_drvdata(pdev, fan_data);
 	mutex_init(&fan_data->lock);
 
-- 
2.11.0
