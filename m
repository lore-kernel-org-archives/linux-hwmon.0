Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B332310784
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783969646; cv=none; b=cIItayjBvntTNPWAc7y5M9VSeE7JE5o1FL83UylIm+LnsnDZ7WerXT37a9e32a5Sd9PBpBE2E3cnJe4Q4744XGKilUU6smbHV0CosMHEfTAPxb8cAtNQmIitLSMPcwEwb8vUeOnx2RvvGTcYvXMDAMJqbI0csVe9U6sY/aZbrng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783969646; c=relaxed/simple;
	bh=mCpFa/B5sHHw1roJExFXQfC8L3qVKxFsPRJW/jhiR1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5BePpdzmJMKDnbIYdRdzWU6MRKJPvPekvhvUMkUkh1gm4p30RSthzMxI50LyIPgy9+m5qXx/nRX/RMkyBCzexdIIhu1hBWLDS3sDU6yZooUuf3O2XXVpNRxxkjhcWq6WF7CUSqV5XDfp7fecXp8r2m+YoA0tFmFehYUzOWUqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5Qrc+hA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5Qrc+hA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1900593f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 12:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783969643; x=1784574443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Li8S1rM+8DEjWAU9rwQR8len57cRwlXsYZQWs/V0hc4=;
        b=Y5Qrc+hAtSLbwab1s7jVN+YI8Dh2p6y/VDmNla9eE9Jt53gOvJmV9z3j5WQXauvnTX
         anAPCgXGTVykgq2Ewwf67UToembIarMgmT6+x60PVcewjSbN0d7APu9HPyI2aaK74MUA
         CTd6cOF62RgzoRrxaii4aEMBpq06ZHBMHF0Dx9GK1MGVgP33D6hT8VPqcYndY4uOOtzi
         /soESzC6evXJWZw32LF11SXJtBsGw11Ikh0X2Ki+/45zfZwzAM30oFhzrUraBQYAtEu4
         QRohlrcm6d0FmxSSNaACkVXK4H3n3HyUN8OzICgyJmo6XYgR26gud+3PMB2fBC4paLYD
         0d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969643; x=1784574443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Li8S1rM+8DEjWAU9rwQR8len57cRwlXsYZQWs/V0hc4=;
        b=ONk+btYGQU/hBPhPEMSrOq6euvqEO1wIxCes/JY9kDGh2j0L1sAYDjXOoxxk+QKTaw
         m6DCKgqKWoqp9AXAeMvzjxJXQBTFpK8hlfM14yuHXoA0qcntmVtWdmX9moWsdwf86t+4
         rjlS8vVTLK0bGnv8hqwgxmzvCY0OlLA+l5ix//e3/nurc6Vl4AK5rtLLMlQNGV2VJqxK
         cNbGn1kv2JA0g0QBpZ9DDP01WGAKnJ7t60LSkEDCDILKmsy65gxFXhAnsWRbYAaihRLE
         Z3sR+Ublg8jB+OvxlWNqMJu+knlMpbmB4RqFpFDy/IXtaWXYSdfwo3SNmbKH/6XTlHrX
         AmXA==
X-Forwarded-Encrypted: i=1; AHgh+RqcjUCEdLihXeSvOKeyPwP/qnevOHLUIdIYBo0nocmr83NuJNw0ZUdNK/bhK1agPQ5wlDv0T3YEOjg9AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXz7n0JFQWhLswdD7HWgr1e2t6Z944BUQoTJrDhXXb3mR+RuEI
	38KJRvXp0FCh7g9DxvbrTk7287L//pnPcCY4XeTAkL9xyMnXamJTeyv0
X-Gm-Gg: AfdE7ckhirk8xxFRx+IlIYQtR7Mi4JIqUaQ0xpQKluo7VKZ+ZzN3nFrOmTEEFTPa4Nq
	7YlcvJ/5s6MsITu07oi0Rv+C/Ao5XsAxgRdRUuZynSED5TTmxh31M/XhV4ZwyvushPIgtkdx9GW
	5US3iI/YVxOwuX0B9cvm2rT4w/snViQpnRUhM7GAWcdCKlIfUXFz5p4watQ3Gds2jRH2J9uFQaQ
	noarMMiqcR5zk7mjjWCjTLmmD353n+46JO4A1guj+40GmqVCgUhVsIVvmrsxdyFyH/Gm+6qqIgk
	b6hk/1zCY4L+Dvtc7koLMD7QBPZ6VlxXKN1YcqTwZ4m55QaLOe6IZjF3YP8qHSpEuh+M74xVQ96
	r4ofAuT+ZFcdCHuptgkfA8WcExC9hBvtffESqw/ta1jIUbWMduwaSuH0Q1PEdYeEHOHrQt1UeGU
	FwhjplfHJh4ARTPP9AQfwIBV7P7bWTYdcv1cdPfwW1eqKuuTwAXe6Bz4vRVya+EQ==
X-Received: by 2002:a5d:5e06:0:b0:477:6da:1b8f with SMTP id ffacd0b85a97d-47f2dcc6db9mr11287405f8f.34.1783969642909;
        Mon, 13 Jul 2026 12:07:22 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.64.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f476e9d02sm113430f8f.19.2026.07.13.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:07:22 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Mon, 13 Jul 2026 22:06:59 +0300
Message-ID: <20260713190659.4511-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace OF property handling with fwnode API in the probe function to read
the channels properties, improving the driver compatibility since this
method is not limited to Device Tree only.
Add also the needed headers for explicit include and clean up related
function naming.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 48 +++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4b9c0ccdf260..045977e30cf4 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -101,14 +101,16 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/kstrtox.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -295,7 +297,7 @@ static const struct i2c_device_id lm90_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
 
-static const struct of_device_id __maybe_unused lm90_of_match[] = {
+static const struct of_device_id lm90_of_match[] = {
 	{
 		.compatible = "adi,adm1032",
 		.data = (void *)adm1032
@@ -2602,7 +2604,6 @@ static void lm90_stop_work(void *_data)
 
 static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
-	struct device_node *np = client->dev.of_node;
 	int config, convrate;
 
 	if (data->flags & LM90_HAVE_CONVRATE) {
@@ -2626,7 +2627,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 
 	/* Check Temperature Range Select */
 	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
-		if (of_property_read_bool(np, "ti,extended-range-enable"))
+		if (device_property_read_bool(&client->dev, "ti,extended-range-enable"))
 			config |= 0x04;
 		if (!(config & 0x04))
 			data->flags &= ~LM90_HAVE_EXTENDED_TEMP;
@@ -2692,8 +2693,8 @@ static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static int lm90_probe_channel_from_dt(struct i2c_client *client,
-				      struct device_node *child,
+static int lm90_probe_channel(struct i2c_client *client,
+				      struct fwnode_handle *child,
 				      struct lm90_data *data)
 {
 	u32 id;
@@ -2701,27 +2702,27 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
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
+	err = fwnode_property_read_u32(child, "temperature-offset-millicelsius", &val);
 	if (!err) {
 		if (id == 0) {
 			dev_err(dev, "temperature-offset-millicelsius can't be set for internal channel\n");
@@ -2739,18 +2740,17 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
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
@@ -2887,12 +2887,10 @@ static int lm90_probe(struct i2c_client *client)
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
@@ -2985,7 +2983,7 @@ static struct i2c_driver lm90_driver = {
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

