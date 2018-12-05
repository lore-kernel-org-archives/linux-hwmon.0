Return-Path: <sashal@kernel.org>
Return-path: <sashal@kernel.org>
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Levin <sashal@kernel.org>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 028/123] hwmon: (raspberrypi) Fix initial notify
Date: Wed,  5 Dec 2018 04:34:20 -0500
Message-Id: <20181205093555.5386-28-sashal@kernel.org>
In-Reply-To: <20181205093555.5386-1-sashal@kernel.org>
References: <20181205093555.5386-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Stefan Wahren <stefan.wahren@i2se.com>

[ Upstream commit 35fdc3902179366489a12cae4cb3ccc3b95f0afe ]

In case an under-voltage happens before probing the driver wont
write the critical warning into the kernel log. So don't init
of last_throttled during probe and fix this issue.

Fixes: 74d1e007915f ("hwmon: Add support for RPi voltage sensor")
Reported-by: "Noralf Trønnes" <noralf@tronnes.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/raspberrypi-hwmon.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index be5ba4690895..0d0457245e7d 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -115,7 +115,6 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_hwmon_data *data;
-	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -124,11 +123,6 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	/* Parent driver assure that firmware is correct */
 	data->fw = dev_get_drvdata(dev->parent);
 
-	/* Init throttled */
-	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
-				    &data->last_throttled,
-				    sizeof(data->last_throttled));
-
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
 							       data,
 							       &rpi_chip_info,
-- 
2.17.1
