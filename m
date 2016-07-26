Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53519 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755546AbcGZHrc (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 26 Jul 2016 03:47:32 -0400
From: Quentin Schulz <quentin.schulz@free-electrons.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: Quentin Schulz <quentin.schulz@free-electrons.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	antoine.tenart@free-electrons.com
Subject: [PATCH] hwmon: iio_hwmon: fix memory leak in name attribute
Date: Tue, 26 Jul 2016 09:47:09 +0200
Message-Id: <1469519229-11749-1-git-send-email-quentin.schulz@free-electrons.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The "name" variable's memory is now freed when the device is destructed
thanks to devm function.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/iio_hwmon.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index 0a00bfb..777f2b5 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -110,24 +110,24 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 
 		switch (type) {
 		case IIO_VOLTAGE:
-			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
-							  "in%d_input",
-							  in_i++);
+			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
+							       "in%d_input",
+							       in_i++);
 			break;
 		case IIO_TEMP:
-			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
-							  "temp%d_input",
-							  temp_i++);
+			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
+							       "temp%d_input",
+							       temp_i++);
 			break;
 		case IIO_CURRENT:
-			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
-							  "curr%d_input",
-							  curr_i++);
+			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
+							       "curr%d_input",
+							       curr_i++);
 			break;
 		case IIO_HUMIDITYRELATIVE:
-			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
-							  "humidity%d_input",
-							  humidity_i++);
+			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
+							       "humidity%d_input",
+							       humidity_i++);
 			break;
 		default:
 			ret = -EINVAL;
-- 
2.5.0

