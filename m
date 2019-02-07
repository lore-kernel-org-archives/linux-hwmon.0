Return-Path: <SRS0=CTyS=QO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D013C282C2
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 22:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE5421721
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 22:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfBGWAQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Feb 2019 17:00:16 -0500
Received: from da1vs03.rockwellcollins.com ([205.175.227.47]:58843 "EHLO
        da1vs03.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727078AbfBGWAQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 Feb 2019 17:00:16 -0500
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Feb 2019 17:00:15 EST
Received: from ofwda1n02.rockwellcollins.com (HELO dtulimr01.rockwellcollins.com) ([205.175.227.14])
  by da1vs03.rockwellcollins.com with ESMTP; 07 Feb 2019 15:50:49 -0600
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com [192.168.141.218])
        by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id D2808607CC;
        Thu,  7 Feb 2019 15:50:48 -0600 (CST)
From:   Brandon Maier <brandon.maier@rockwellcollins.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org,
        Brandon Maier <brandon.maier@rockwellcollins.com>
Subject: [PATCH] hwmon: (ad7418) Catch I2C errors
Date:   Thu,  7 Feb 2019 15:50:36 -0600
Message-Id: <20190207215036.185561-1-brandon.maier@rockwellcollins.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If there is an i2c failure, the ad7416 reports its temperature as 0C.
Return an error code so users can properly detect errors.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

---
Tested on an ad7416, attempting to `cat` the temp1_input while the
sensor is physically disconnected returns this:

> cat: read error: Remote I/O error
---
 drivers/hwmon/ad7418.c | 65 +++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index 76f0a5c01e8a..28a91d14d7af 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -54,10 +54,11 @@ struct ad7418_data {
 	u16			in[4];
 };
 
-static struct ad7418_data *ad7418_update_device(struct device *dev)
+static int ad7418_update_device(struct device *dev)
 {
 	struct ad7418_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	s32 val;
 
 	mutex_lock(&data->lock);
 
@@ -67,47 +68,74 @@ static struct ad7418_data *ad7418_update_device(struct device *dev)
 		int i, ch;
 
 		/* read config register and clear channel bits */
-		cfg = i2c_smbus_read_byte_data(client, AD7418_REG_CONF);
+		val = i2c_smbus_read_byte_data(client, AD7418_REG_CONF);
+		if (val < 0)
+			goto abort;
+
+		cfg = val;
 		cfg &= 0x1F;
 
-		i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
+		val = i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
 						cfg | AD7418_CH_TEMP);
+		if (val < 0)
+			goto abort;
+
 		udelay(30);
 
 		for (i = 0; i < 3; i++) {
-			data->temp[i] =
-				i2c_smbus_read_word_swapped(client,
-						AD7418_REG_TEMP[i]);
+			val = i2c_smbus_read_word_swapped(client,
+							  AD7418_REG_TEMP[i]);
+			if (val < 0)
+				goto abort;
+
+			data->temp[i] = val;
 		}
 
 		for (i = 0, ch = 4; i < data->adc_max; i++, ch--) {
-			i2c_smbus_write_byte_data(client,
-					AD7418_REG_CONF,
-					cfg | AD7418_REG_ADC_CH(ch));
+			val = i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
+							cfg | AD7418_REG_ADC_CH(ch));
+			if (val < 0)
+				goto abort;
 
 			udelay(15);
-			data->in[data->adc_max - 1 - i] =
-				i2c_smbus_read_word_swapped(client,
-						AD7418_REG_ADC);
+			val = i2c_smbus_read_word_swapped(client,
+							  AD7418_REG_ADC);
+			if (val < 0)
+				goto abort;
+
+			data->in[data->adc_max - 1 - i] = val;
 		}
 
 		/* restore old configuration value */
-		i2c_smbus_write_word_swapped(client, AD7418_REG_CONF, cfg);
+		val = i2c_smbus_write_word_swapped(client, AD7418_REG_CONF,
+						   cfg);
+		if (val < 0)
+			goto abort;
 
 		data->last_updated = jiffies;
 		data->valid = 1;
 	}
 
 	mutex_unlock(&data->lock);
+	return 0;
 
-	return data;
+abort:
+	data->valid = 0;
+	mutex_unlock(&data->lock);
+	return val;
 }
 
 static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ad7418_data *data = ad7418_update_device(dev);
+	struct ad7418_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = ad7418_update_device(dev);
+	if (ret < 0)
+		return ret;
+
 	return sprintf(buf, "%d\n",
 		LM75_TEMP_FROM_REG(data->temp[attr->index]));
 }
@@ -116,7 +144,12 @@ static ssize_t adc_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct ad7418_data *data = ad7418_update_device(dev);
+	struct ad7418_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = ad7418_update_device(dev);
+	if (ret < 0)
+		return ret;
 
 	return sprintf(buf, "%d\n",
 		((data->in[attr->index] >> 6) * 2500 + 512) / 1024);
-- 
2.20.1

