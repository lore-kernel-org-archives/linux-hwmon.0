Return-path: <clemens.gruber@pqgruber.com>
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH v3 3/3] hwmon: (mcp3021) replace S_IRUGO with 0444
Date: Wed,  9 Nov 2016 18:16:14 +0100
Message-Id: <20161109171614.9730-2-clemens.gruber@pqgruber.com>
In-Reply-To: <20161109171614.9730-1-clemens.gruber@pqgruber.com>
References: <20161109171614.9730-1-clemens.gruber@pqgruber.com>
List-ID: <linux-hwmon@vger.kernel.org>

Replace S_IRUGO with the better readable 0444.
This fixes a checkpatch warning.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 drivers/hwmon/mcp3021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index 81f4b7f..3a007ab 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -102,7 +102,7 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", in_input);
 }
 
-static DEVICE_ATTR(in0_input, S_IRUGO, show_in_input, NULL);
+static DEVICE_ATTR(in0_input, 0444, show_in_input, NULL);
 
 static int mcp3021_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)
-- 
2.10.2
