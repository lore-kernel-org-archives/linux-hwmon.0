Return-Path: <linux@roeck-us.net>
Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Henrik Rydberg <rydberg@bitmath.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RESEND PATCH] hwmon: (applesmc) Avoid buffer overruns
Date: Wed, 12 Jul 2017 08:14:49 -0700
Message-Id: <1499872489-25773-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

gcc 7.1 complains that the driver uses sprintf() and thus does not validate
the length of output buffers.

drivers/hwmon/applesmc.c: In function 'applesmc_show_fan_position':
drivers/hwmon/applesmc.c:82:21: warning:
	'%d' directive writing between 1 and 5 bytes into a region of size 4

Fix the problem by using scnprintf() instead of sprintf() throughout the
driver. Also explicitly limit the number of supported fans to avoid actual
buffer overruns and thus invalid keys.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Resent with corrected hwmon e-mail address. Sorry for the noise.

 drivers/hwmon/applesmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 0af7fd311979..76c34f4fde13 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -566,6 +566,8 @@ static int applesmc_init_smcreg_try(void)
 	if (ret)
 		return ret;
 	s->fan_count = tmp[0];
+	if (s->fan_count > 10)
+		s->fan_count = 10;
 
 	ret = applesmc_get_lower_bound(&s->temp_begin, "T");
 	if (ret)
@@ -811,7 +813,8 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 	char newkey[5];
 	u8 buffer[2];
 
-	sprintf(newkey, fan_speed_fmt[to_option(attr)], to_index(attr));
+	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
+		  to_index(attr));
 
 	ret = applesmc_read_key(newkey, buffer, 2);
 	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
@@ -834,7 +837,8 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
 		return -EINVAL;		/* Bigger than a 14-bit value */
 
-	sprintf(newkey, fan_speed_fmt[to_option(attr)], to_index(attr));
+	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
+		  to_index(attr));
 
 	buffer[0] = (speed >> 6) & 0xff;
 	buffer[1] = (speed << 2) & 0xff;
@@ -903,7 +907,7 @@ static ssize_t applesmc_show_fan_position(struct device *dev,
 	char newkey[5];
 	u8 buffer[17];
 
-	sprintf(newkey, FAN_ID_FMT, to_index(attr));
+	scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, to_index(attr));
 
 	ret = applesmc_read_key(newkey, buffer, 16);
 	buffer[16] = 0;
@@ -1116,7 +1120,8 @@ static int applesmc_create_nodes(struct applesmc_node_group *groups, int num)
 		}
 		for (i = 0; i < num; i++) {
 			node = &grp->nodes[i];
-			sprintf(node->name, grp->format, i + 1);
+			scnprintf(node->name, sizeof(node->name), grp->format,
+				  i + 1);
 			node->sda.index = (grp->option << 16) | (i & 0xffff);
 			node->sda.dev_attr.show = grp->show;
 			node->sda.dev_attr.store = grp->store;
-- 
2.7.4
