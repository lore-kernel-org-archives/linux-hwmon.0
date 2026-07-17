Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F63BED7F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 06:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270270; cv=none; b=DfNucSMMDGUMnj0LIEaHoXrK6lhHsmHOVy7SSy81SWmk2HwG7fvo8vvpHzYwOAP5DV/BjtbxokyRVh73y4lor36Yy1DC1wW++JGZUlRAXXJIydxHY7ZI60E1TsWhMst3ssJKPG6f5k+Gdh6FkiLJgHGLGGhsISErv7/GX/6CtfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270270; c=relaxed/simple;
	bh=ReeEoEQsYvmBjZWQgRR92CM+SJ2darMxK748g9KMECo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=todR3M4UDkKPZX3fhIQSFvE/45LHda/zpd8zMLN1WMZSgfc6S+MkO064frmWQ/ZrI741M848Bqucw/SIxgMTw8/bAl2sxbwHYYstb4MeHHjdKDXaVoyoWtT6v7IcXGjfVF6P94oKVTn733nyFKyWxbFvlKB+ZFNiEM0G45Mz21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0R723zm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0R723zm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f75f7172so55388105e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 23:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270264; x=1784875064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qM+aWftc8PoPosfqPaRZSyph/d44ipOqM5LtqJstHI=;
        b=H0R723zmyHOIEHqyYTOh3zNncEhoxP3/7awfTjIxkx1HD5cscfPOOaEtSWnGP0LQPf
         N2To9o/oStummgCJpPHwIW56cEfFnimJUPMFyZElsA5pRKTK4vFgFYnmZnPNE2xiK0OF
         YGEO7K5XEYdSstTh4P66v0EL9/xHRnYUSOHGHQLLHfP9cV53xPjN7Y7j5t4VMpJWRiYA
         XJfN9HJjs5EeHSVrEkaCswOwyBjeVp7RaH04gUDVA7Udh6rS3JZu2+3AowsDzecma2e2
         27Yh2R2JTs9nTUsYjLe7LFxMuai90hKQY+zoXX8toiYq3AGI9x+M7UtZEUNB/C6efwc6
         I30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270264; x=1784875064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qM+aWftc8PoPosfqPaRZSyph/d44ipOqM5LtqJstHI=;
        b=L8OaV2o4iRYGmX9IwKEfPeOLlLrRdrut1RamPZPNMyESc8fpUdw4vTxW1RQ234h9Wm
         5qG79LFVHxCP1ynuzwvpU1nnwj83rz14yWgTxxcSr56ywjk0vKhEBSARnQdJRjVcW9qu
         UxOnN8oWczvth+845tdaUoaxafq/r+o+U8TABQsEg/c8k22gxsLNjkiRAQydLHIJHAby
         v78LD9fy3m3zJxUfZmGy+WPEbazAQw3w4PK3Q14yTNoHNUwwouJHaqp6iZ+qyjh9JaJw
         Xse6ZX71Buj9C2Nkla4O2EFAwEFFxnHHwm/Nd3/F4yHskTd9Y2+tKebbkn1lvb08JTr0
         xhEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpF004pf/fs4oV8X69iYYvyU+MNtdh9mmq+tWxaP3M8L7APLa4oSoLRCmggljERjJ9jd6J1HOm4wbK2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGvlCYECmQsHURZTTfpZs/ruGj3OsTuNLF8+adv6NwniTWOK/
	P6Ero1IogzmkSFRgBkQWpq1WVSr6d2KHBarQQArTgJfrzWNFuvOdGBib
X-Gm-Gg: AfdE7ckqb668OHfjJ2u35RIBw7z3CYRU7pxyaVV2IX/Nsmk7TZ3Z/IJLUGUv1R+yCVf
	U++G9KX/UsNrkOYa0roKK4ju9nu61DT04Ztc8LNfEPhAWcjBtG+EnB/NsbKXuWRXL1XTSOqMrfU
	n19TZtrZ3jF2x4oGH6mdDaR5GES62l7gvZrxyv9MHZOj9fMFcV3eok680wHRO4qziQohknVklIl
	85aU4jtZXUgCU3aZMhwL53HXPkMvm72mm06HpzBQ9sNhIq+xaVQmP4LGXxytPfpBLdANuAjK4Fa
	PoVklx0QACgaXHAJOkNrKAZnoE8Lac2NZYNx1Ub6vSkcy0fCrU++fHvKl9vveMiqWyPCpag3GC2
	SDk9hl/y0bkGepHwy2Vo1pxCs3tdBfJEWTYR2bw7SaLzyLS5rynS8l3rsC4hpQjA7Y68dfDoSAb
	URF+lD7HyKs7ffjm791r4ZaaM0nOAhmesHZnUhfxhXwm/hhRtojTNYSeI=
X-Received: by 2002:a05:600c:4691:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-4954a3e20a6mr12918325e9.5.1784270263423;
        Thu, 16 Jul 2026 23:37:43 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954966a033sm22207295e9.0.2026.07.16.23.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:37:42 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Fri, 17 Jul 2026 09:37:30 +0300
Message-ID: <20260717063730.5617-1-flaviu.nistor@gmail.com>
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
Changes in v2:
- Remove <linux/mod_devicetable.h> as suggested by Uwe Kleine-Konig. 
- Link to v1: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail.com/

 drivers/hwmon/lm90.c | 47 +++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4b9c0ccdf260..7d4b8e61bec5 100644
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
@@ -2692,8 +2692,8 @@ static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static int lm90_probe_channel_from_dt(struct i2c_client *client,
-				      struct device_node *child,
+static int lm90_probe_channel(struct i2c_client *client,
+				      struct fwnode_handle *child,
 				      struct lm90_data *data)
 {
 	u32 id;
@@ -2701,27 +2701,27 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
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
@@ -2739,18 +2739,17 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
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
@@ -2887,12 +2886,10 @@ static int lm90_probe(struct i2c_client *client)
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
@@ -2985,7 +2982,7 @@ static struct i2c_driver lm90_driver = {
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

