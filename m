Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE913EFD24
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402856; cv=none; b=AHP9YNJnJ5q3UDvIjRwGMw/A65/zCkVkwK03fm3atLWzJkh5uzorzq4F6MpGnIEQly7WD1p2rROkQ3cmgvJeKwvWrMdyNXHZIhTVFqHcLhmnbewEW187VE+HjWDdVqdk0fIF74PE0wLBmDABuWLETKSQRSSUfagPx2GXn4yaTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402856; c=relaxed/simple;
	bh=NuOX9I/WU6e84gPfmuE30SCaKWAIeOtSOKJZFIbZtFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgeLUaKG0EhQxjRHM7c6SzPwQXuEp1d47RioM2jIlb4hIlxchTE5ezNGEp1AqLGIQvTZK7WBX+uMDI4AqGNh3nvlKcu6tVgZcepbt+k2lDkJu2L39DEIVu30u8T+GNLpFlCfdC2qkpViwi4q80PKUWhECRpzmzlvs/2xRtK2abE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUyd+IcB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUyd+IcB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954df200ddso11212595e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402852; x=1786007652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDn9qQ7ntj6+K85ggMl00jcud8yuR9BTC6rTJN7emAc=;
        b=CUyd+IcBHYM8HJwjfpwCvDBfmvio4DndXT3dfqkQ7vfoVWjgUoQItzeF0jDPm3hXff
         pjHyZKRGw8PH+U9jzUb5qSmNVp9/viZ819XXS7QKimmpNO2sTGXfQpF8KXZF4JtrNF+x
         rkT7so9RYcKBYHFMmD0sr7lR5K7j4GxBzjXRji+Xcp2Xv003I0lZUXWGhoU3zn7Xt9xl
         1y30QN70dzqggTLhJC1UzMhr+DW+aF0GVPPEqIvNdE6f0tZjJhPE0TnmnKYx+QxklVa4
         kpM5/y+UEx/llqWrZnKWIrGufZdHzC6ofCMvRHIYh/0xI/AVGSlxV/r+Pb0un5EfURq7
         peuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402852; x=1786007652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDn9qQ7ntj6+K85ggMl00jcud8yuR9BTC6rTJN7emAc=;
        b=bnbnF6NHMfVlUGte+UsVZj5rWOSjutwgdv1CH1OBGnEedfenXKHj5R8XbrQ/t5dZvN
         jzN7C7hWH5tThnkIzyud5ZoJOzT6EXLHLl/Kf9G8CzE4ob/nJCKl6PGDtpEVoNZwaAoV
         ulf/h/wibkHy0BCoAbSqpTiSNxeoj/WtcLFhQib0V889KdeEB1UkQant1MZnwK8Nks7F
         j6Rz9A/6rYjhgA7shPn3PddVcqjEfmSFBC23Y/UKmPvjpFpJSTHHOCf7a12QCROnK7Ao
         gKpXCv1//b8DvHG0HNCgF0yggzigfzqJV21m2elFtgoRtqV/CkWOancIkkftzfEu7OmG
         WPig==
X-Forwarded-Encrypted: i=1; AHgh+RqNvSkCqeX0i7qAtBlCc6JCX4m3filVfZr0x+r1JkCdC73347d9z2uu6y/ThCXSuT9Zl+6LUxWzQ4kplQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBh7pP4Ai+Mc33OqXqhjdVRzm5aMIDMKSXn9mAckvjqAuap5R
	mQXNNwKngV4s3PhjBiu1XL1cmsEmRxJPN44/HMO7EnqNJOWHm80y7RIX
X-Gm-Gg: AR+sD13H41V6RRyO73EWRXgn9qceU3EUPoSclufL36L2+4PvT/HbdvIKal9t/oXmgkz
	Hrq/DFcF7vqublZouNAJeqL8rUfJ31wB6JIviOyNB5EBlyh8BrpFjfvv1U+rJ3r+E7mFXlm4Ghs
	fmNgUfFIcnm6/Spcg6zwv2F8PqpQZIle10xHMr2/OKorU1wdk4oNC1MO6A6xRJsAbs9M4zGxBTr
	2YKKBPWGZlf1qOd4sACM0pta5VgU+a4zwW10w+Y3AOlzXPB9/e640mCYeyVUjDVnq7RDCIx0Jn9
	a1ZJL1htC30pmWseHwgH9om6OKMqZqXMxHj8bWR2jQOOmtlHdJwTisXQiby4s4lRtYm3+8MftP2
	IH0SsuohP/Ncwfoz+TMcNS4rYAqMmJfPcvyzTCDJ4fW+crc7tKX4lf7Aezj9wVw9CWQmjqHJ117
	I2c0qBul8F2PCsFzrY6szWk5AQIDMAP5DwkMxFzc+ZDpedJhgvRcMLFkfbC2RXr7B1H0iSvUHZq
	tAkvHHmT/6Bv0DpjCJdDN1mMnVdbnRpHYQl
X-Received: by 2002:a05:600c:46c8:b0:495:409e:bc80 with SMTP id 5b1f17b1804b1-49800ebe7b8mr22426425e9.37.1785402852337;
        Thu, 30 Jul 2026 02:14:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496e8e06f7csm127936065e9.0.2026.07.30.02.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:14:11 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Thu, 30 Jul 2026 12:14:09 +0300
Message-ID: <20260730091409.10544-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace OF property handling with fwnode in the probe function to read
the channels properties, improving the driver compatibility since this
method is not limited to Device Tree only.
Add also the needed headers for explicit include and clean up related
function naming.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v3:
- Use casting (with explanation comment) to handle the signed values as suggested
  by Guenter Roeck. This is tested and works similar to the old implementation that
  used of_property_read_s32().
- Link to v2: https://lore.kernel.org/all/20260717063730.5617-1-flaviu.nistor@gmail.com/
Changes in v2:
- Remove <linux/mod_devicetable.h> as suggested by Uwe Kleine-Konig. 
- Link to v1: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail.com/

 drivers/hwmon/lm90.c | 54 +++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index ae3b0a33d676..1c603272538a 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -101,6 +101,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -108,7 +109,7 @@
 #include <linux/hwmon.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -295,7 +296,7 @@ static const struct i2c_device_id lm90_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
 
-static const struct of_device_id __maybe_unused lm90_of_match[] = {
+static const struct of_device_id lm90_of_match[] = {
 	{
 		.compatible = "adi,adm1032",
 		.data = (void *)adm1032
@@ -2602,7 +2603,6 @@ static void lm90_stop_work(void *_data)
 
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
-	struct device_node *np = client->dev.of_node;
 	int config, convrate;
 
 	if (data->flags & LM90_HAVE_CONVRATE) {
@@ -2626,7 +2626,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 
 	/* Check Temperature Range Select */
 	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
-		if (of_property_read_bool(np, "ti,extended-range-enable"))
+		if (device_property_read_bool(&client->dev, "ti,extended-range-enable"))
 			config |= 0x04;
 		if (!(config & 0x04))
 			data->flags &= ~LM90_HAVE_EXTENDED_TEMP;
@@ -2692,36 +2692,41 @@ static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static int lm90_probe_channel_from_dt(struct i2c_client *client,
-				      struct device_node *child,
-				      struct lm90_data *data)
+static int lm90_probe_channel(struct i2c_client *client,
+			      struct fwnode_handle *child,
+			      struct lm90_data *data)
 {
 	u32 id;
 	s32 val;
 	int err;
 	struct device *dev = &client->dev;
 
-	err = of_property_read_u32(child, "reg", &id);
+	err = fwnode_property_read_u32(child, "reg", &id);
 	if (err) {
-		dev_err(dev, "missing reg property of %pOFn\n", child);
+		dev_err(dev, "missing reg property of %pfw\n", child);
 		return err;
 	}
 
 	if (id >= MAX_CHANNELS) {
-		dev_err(dev, "invalid reg property value %d in %pOFn\n", id, child);
+		dev_err(dev, "invalid reg property value %d in %pfw\n", id, child);
 		return -EINVAL;
 	}
 
-	err = of_property_read_string(child, "label", &data->channel_label[id]);
+	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
-		dev_err(dev, "invalid label property in %pOFn\n", child);
+		dev_err(dev, "invalid label property in %pfw\n", child);
 		return err;
 	}
 
 	if (data->channel_label[id])
 		data->channel_config[id] |= HWMON_T_LABEL;
 
-	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
+	/*
+	 * fwnode_property_read_u32() has no signed equivalent.
+	 * temperature-offset-millicelsius is signed, so read and reinterpret it as s32 to
+	 * preserve negative offsets values (same behavior as the old of_property_read_s32()).
+	 */
+	err = fwnode_property_read_u32(child, "temperature-offset-millicelsius", (u32 *)&val);
 	if (!err) {
 		if (id == 0) {
 			dev_err(dev, "temperature-offset-millicelsius can't be set for internal channel\n");
@@ -2739,18 +2744,17 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 	return 0;
 }
 
-static int lm90_parse_dt_channel_info(struct i2c_client *client,
-				      struct lm90_data *data)
+static int lm90_parse_channel_info(struct i2c_client *client,
+				   struct lm90_data *data)
 {
 	int err;
 	struct device *dev = &client->dev;
-	const struct device_node *np = dev->of_node;
 
-	for_each_child_of_node_scoped(np, child) {
-		if (strcmp(child->name, "channel"))
+	device_for_each_child_node_scoped(dev, child) {
+		if (!fwnode_name_eq(child, "channel"))
 			continue;
 
-		err = lm90_probe_channel_from_dt(client, child, data);
+		err = lm90_probe_channel(client, child, data);
 		if (err)
 			return err;
 	}
@@ -2887,12 +2891,10 @@ static int lm90_probe(struct i2c_client *client)
 	/* Set maximum conversion rate */
 	data->max_convrate = lm90_params[data->kind].max_convrate;
 
-	/* Parse device-tree channel information */
-	if (client->dev.of_node) {
-		err = lm90_parse_dt_channel_info(client, data);
-		if (err)
-			return err;
-	}
+	/* Parse channel information */
+	err = lm90_parse_channel_info(client, data);
+	if (err)
+		return err;
 
 	/* Initialize the LM90 chip */
 	err = lm90_init_client(client, data);
@@ -2983,7 +2985,7 @@ static struct i2c_driver lm90_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm90",
-		.of_match_table = of_match_ptr(lm90_of_match),
+		.of_match_table = lm90_of_match,
 		.pm	= pm_sleep_ptr(&lm90_pm_ops),
 	},
 	.probe		= lm90_probe,
-- 
2.34.1

