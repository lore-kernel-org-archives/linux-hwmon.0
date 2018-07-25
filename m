Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from www.linuxtv.org ([130.149.80.248]:56762 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728990AbeGYPCV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jul 2018 11:02:21 -0400
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Wed, 25 Jul 2018 12:33:53 +0000
Subject: [git:media_tree/master] media: video-i2c: add hwmon support for amg88xx
To: linuxtv-commits@linuxtv.org
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1fiJun-00011l-Ui@www.linuxtv.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: video-i2c: add hwmon support for amg88xx
Author:  Matt Ranostay <matt.ranostay@konsulko.com>
Date:    Thu Jun 28 14:11:04 2018 -0400

AMG88xx has an on-board thermistor which is used for more accurate
processing of its temperature readings from the 8x8 thermopile array

Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 drivers/media/i2c/Kconfig     |  1 +
 drivers/media/i2c/video-i2c.c | 81 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

---

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5ee7a09001a7..439f6be08b95 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1033,6 +1033,7 @@ config VIDEO_I2C
 	tristate "I2C transport video support"
 	depends on VIDEO_V4L2 && I2C
 	select VIDEOBUF2_VMALLOC
+	imply HWMON
 	---help---
 	  Enable the I2C transport video support which supports the
 	  following:
diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0b347cc19aa5..7dc9338502e5 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -10,6 +10,7 @@
 
 #include <linux/delay.h>
 #include <linux/freezer.h>
+#include <linux/hwmon.h>
 #include <linux/kthread.h>
 #include <linux/i2c.h>
 #include <linux/list.h>
@@ -77,6 +78,9 @@ struct video_i2c_chip {
 
 	/* xfer function */
 	int (*xfer)(struct video_i2c_data *data, char *buf);
+
+	/* hwmon init function */
+	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
 static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
@@ -101,6 +105,74 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
 	return (ret == 2) ? 0 : -EIO;
 }
 
+#if IS_ENABLED(CONFIG_HWMON)
+
+static const u32 amg88xx_temp_config[] = {
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info amg88xx_temp = {
+	.type = hwmon_temp,
+	.config = amg88xx_temp_config,
+};
+
+static const struct hwmon_channel_info *amg88xx_info[] = {
+	&amg88xx_temp,
+	NULL
+};
+
+static umode_t amg88xx_is_visible(const void *drvdata,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	return 0444;
+}
+
+static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct video_i2c_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int tmp = i2c_smbus_read_word_data(client, 0x0e);
+
+	if (tmp < 0)
+		return tmp;
+
+	/*
+	 * Check for sign bit, this isn't a two's complement value but an
+	 * absolute temperature that needs to be inverted in the case of being
+	 * negative.
+	 */
+	if (tmp & BIT(11))
+		tmp = -(tmp & 0x7ff);
+
+	*val = (tmp * 625) / 10;
+
+	return 0;
+}
+
+static const struct hwmon_ops amg88xx_hwmon_ops = {
+	.is_visible = amg88xx_is_visible,
+	.read = amg88xx_read,
+};
+
+static const struct hwmon_chip_info amg88xx_chip_info = {
+	.ops = &amg88xx_hwmon_ops,
+	.info = amg88xx_info,
+};
+
+static int amg88xx_hwmon_init(struct video_i2c_data *data)
+{
+	void *hwmon = devm_hwmon_device_register_with_info(&data->client->dev,
+				"amg88xx", data, &amg88xx_chip_info, NULL);
+
+	return PTR_ERR(hwmon);
+}
+#else
+#define	amg88xx_hwmon_init	NULL
+#endif
+
 #define AMG88XX		0
 
 static const struct video_i2c_chip video_i2c_chip[] = {
@@ -111,6 +183,7 @@ static const struct video_i2c_chip video_i2c_chip[] = {
 		.buffer_size	= 128,
 		.bpp		= 16,
 		.xfer		= &amg88xx_xfer,
+		.hwmon_init	= amg88xx_hwmon_init,
 	},
 };
 
@@ -505,6 +578,14 @@ static int video_i2c_probe(struct i2c_client *client,
 	video_set_drvdata(&data->vdev, data);
 	i2c_set_clientdata(client, data);
 
+	if (data->chip->hwmon_init) {
+		ret = data->chip->hwmon_init(data);
+		if (ret < 0) {
+			dev_warn(&client->dev,
+				 "failed to register hwmon device\n");
+		}
+	}
+
 	ret = video_register_device(&data->vdev, VFL_TYPE_GRABBER, -1);
 	if (ret < 0)
 		goto error_unregister_device;
