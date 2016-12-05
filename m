Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34741 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbcLEE5I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Dec 2016 23:57:08 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/17] hwmon: (gl520sm) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:40 -0800
Message-Id: <1480913740-5678-17-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into limit attributes can overflow due to multplications
and additions with unbound input values.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gl520sm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index dee93ec87d02..4bb37d7234b1 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -209,10 +209,11 @@ static ssize_t get_cpu_vid(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR(cpu0_vid, S_IRUGO, get_cpu_vid, NULL);
 
 #define VDD_FROM_REG(val) (((val) * 95 + 2) / 4)
-#define VDD_TO_REG(val) clamp_val((((val) * 4 + 47) / 95), 0, 255)
+#define VDD_TO_REG(val) \
+	DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 95 / 4) * 4, 95)
 
 #define IN_FROM_REG(val) ((val) * 19)
-#define IN_TO_REG(val) clamp_val((((val) + 9) / 19), 0, 255)
+#define IN_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 19), 19)
 
 static ssize_t get_in_input(struct device *dev, struct device_attribute *attr,
 			    char *buf)
@@ -514,8 +515,8 @@ static DEVICE_ATTR(fan1_off, S_IRUGO | S_IWUSR,
 		get_fan_off, set_fan_off);
 
 #define TEMP_FROM_REG(val) (((val) - 130) * 1000)
-#define TEMP_TO_REG(val) clamp_val(((((val) < 0 ? \
-			(val) - 500 : (val) + 500) / 1000) + 130), 0, 255)
+#define TEMP_TO_REG(val) (DIV_ROUND_CLOSEST(clamp_val(val, -130000, 125000), \
+					    1000) + 130)
 
 static ssize_t get_temp_input(struct device *dev, struct device_attribute *attr,
 			      char *buf)
-- 
2.5.0

