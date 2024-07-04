Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19756143892
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129050; cv=none; b=a+E44mHDFj1byq+XPLo5y/UUjeM64zO5KWlaintqNbySqYK7OEGZ3kAN+R06y0gqCbsoLr5nh2n1BIPADvmUFwH2NP/uD+BRQfgvt7szDBcKOJrl4vP1szA7MQqWJJgRA8YiJQpEhRyU1DpBGjSniV5mJ3C5b+NJrxaZsCWCysE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129050; c=relaxed/simple;
	bh=ri2VHkpN01jzXgoDotq/TFm7g2Ji5nHuOShxvHRpqMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E1LTFbYMXPM5jhvPe47A2m5dL2NU+YNeNtUYMQ0h8OB+xApLVJvpLs7VGPRIhrNYw40EaMtEAAsVYH6tbD/eNEHR0ZJsHciTPfYa8AE6N/MIPHQae73SWE+wUpT3foxM2QFLtSHcsywnDIzRnjJEUgpg2GaowFazmXHM/k9GpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeLoyzlM; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeLoyzlM"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25e3d8db819so150061fac.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129047; x=1720733847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buU1sa3D8kYKB4RAOEfOuNvdlYsBO0jca9eI/hF/X6Y=;
        b=KeLoyzlMU7Eu96jiKkkbkLLyHYSKjppJHm0cvKIkxTp0HNn6GDRXqysV63NJwATEq0
         KJ3GGnc8l6PYcpHa03lcUtapw3oRASeqZMKm6Wc190BmQVMlGz/sxTE2qi0ehtSjXv5c
         AXwsCXimVZTQZqCuYaqq+jJCBYgTdnvduA2QImTwWZyvkyHVtxcqlPF1y8xtuXN1qCZc
         hr3Hcq7NN5+Pe6iCCv2R2O99K6E0GUuT9A8bocWAq+dDsUkiTRarloVtz3LyyR7HSfCT
         1me1DAnVMdw5AYWuz1dPkAaQlCsAdh1QaT6laIIVt0WtKAZvAqW2NzddWQtZirhmhSV6
         xP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129047; x=1720733847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=buU1sa3D8kYKB4RAOEfOuNvdlYsBO0jca9eI/hF/X6Y=;
        b=iy2f4itgwn93U3Ia37oQhCKkJXpsMmmi9yGz4C38pl38Q6qJPVYKfqvH8t9mavBFLe
         FLx5Jer44Fr31Eicd7JXtb451j/+RqHRuvvOU5Qhv//w1wDBQr69Gvj4o0EH/YHcWWkn
         UOZ4lfZ39SxOzXQvSLXWPoo1GmPsKM1MV4noMTqIfvMLCGW862m90jvNTwG3+wqbxgsl
         Q3DtSBcz4861Q51gLHnnWsl4F5IFzCvNUCU4hzLLj1IYt8e7nnrSibD8Hx2+8FPHgja5
         8xgf03Ipua9W9lSFkgLzUEtk/G/aaAgEqMd7WhXOrozYKS3P9v9Ctg2SuKycvdwZU30L
         pMtA==
X-Gm-Message-State: AOJu0YyjENgR50j+1Cb7NWHcRYoe8/yQnVWg+14N/79g11UbETTgJpa4
	rVK21GM2tnCT3zPnls90PKtKtcPROd8KXljiylyKv7oTgUZKwu6TtPFS5w==
X-Google-Smtp-Source: AGHT+IE+ipZHt9ZDnEveZ5qB56P0vzA5faVN070cH3wOgcCDQmAP0zPa+WluSTbEjBDR/8B/0OCGog==
X-Received: by 2002:a05:6871:24cd:b0:24f:cddc:ccfe with SMTP id 586e51a60fabf-25e2b59025fmr2437619fac.0.1720129047250;
        Thu, 04 Jul 2024 14:37:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-74a3594c5ffsm5188505a12.35.2024.07.04.14.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/7] hwmon: (g762) Make chip configuration devicetree independent
Date: Thu,  4 Jul 2024 14:37:10 -0700
Message-Id: <20240704213712.2699553-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move chip configuration code to one place, and make it devicetree
independent by using device property instead of devicetree functions
to read configuration data.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 187 ++++++++++++++++++-------------------------
 1 file changed, 77 insertions(+), 110 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 59077e54d47e..0ddaa0bd1075 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -44,13 +44,6 @@
 
 #define DRVNAME "g762"
 
-static const struct i2c_device_id g762_id[] = {
-	{ "g762" },
-	{ "g763" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, g762_id);
-
 enum g762_regs {
 	G762_REG_SET_CNT  = 0x00,
 	G762_REG_ACT_CNT  = 0x01,
@@ -315,7 +308,7 @@ static int do_set_fan_div(struct device *dev, unsigned long val)
 }
 
 /* Set fan gear mode. Accepts either 0, 1 or 2. */
-static int do_set_fan_gear_mode(struct device *dev, unsigned long val)
+static int do_set_fan_gear_mode(struct device *dev, u32 val)
 {
 	struct g762_data *data = g762_update_client(dev);
 	int ret;
@@ -507,96 +500,6 @@ static int do_set_fan_startv(struct device *dev, unsigned long val)
 	return ret;
 }
 
-/*
- * Helper to import hardware characteristics from .dts file and push
- * those to the chip.
- */
-
-#ifdef CONFIG_OF
-static const struct of_device_id g762_dt_match[] = {
-	{ .compatible = "gmt,g762" },
-	{ .compatible = "gmt,g763" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, g762_dt_match);
-
-/*
- * Grab clock (a required property), enable it, get (fixed) clock frequency
- * and store it.
- */
-static int g762_of_clock_enable(struct device *dev)
-{
-	unsigned long clk_freq = 0;
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk)) {
-		if (dev->of_node)
-			return dev_err_probe(dev, PTR_ERR(clk), "failed to enable clock\n");
-	} else {
-		clk_freq = clk_get_rate(clk);
-	}
-
-	ret = do_set_clk_freq(dev, clk_freq);
-	if (ret)
-		return dev_err_probe(dev, ret, "invalid clock freq %lu\n", clk_freq);
-
-	return 0;
-}
-
-static int g762_of_prop_import_one(struct i2c_client *client,
-				   const char *pname,
-				   int (*psetter)(struct device *dev,
-						  unsigned long val))
-{
-	int ret;
-	u32 pval;
-
-	if (of_property_read_u32(client->dev.of_node, pname, &pval))
-		return 0;
-
-	dev_dbg(&client->dev, "found %s (%d)\n", pname, pval);
-	ret = (*psetter)(&client->dev, pval);
-	if (ret)
-		dev_err(&client->dev, "unable to set %s (%d)\n", pname, pval);
-
-	return ret;
-}
-
-static int g762_of_prop_import(struct i2c_client *client)
-{
-	int ret;
-
-	if (!client->dev.of_node)
-		return 0;
-
-	ret = g762_of_prop_import_one(client, "fan_gear_mode",
-				      do_set_fan_gear_mode);
-	if (ret)
-		return ret;
-
-	ret = g762_of_prop_import_one(client, "pwm_polarity",
-				      do_set_pwm_polarity);
-	if (ret)
-		return ret;
-
-	return g762_of_prop_import_one(client, "fan_startv",
-				       do_set_fan_startv);
-}
-
-#else
-static int g762_of_prop_import(struct i2c_client *client)
-{
-	return 0;
-}
-
-static int g762_of_clock_enable(struct device *dev)
-{
-	return 0;
-}
-#endif
-
 /*
  * sysfs attributes
  */
@@ -918,6 +821,65 @@ static inline int g762_fan_init(struct device *dev)
 					 data->fan_cmd1);
 }
 
+/*
+ * Grab clock (a required property), enable it, get (fixed) clock frequency
+ * and store it.
+ */
+static int g762_clock_enable(struct device *dev)
+{
+	unsigned long clk_freq = 0;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk)) {
+		if (dev->of_node)
+			return dev_err_probe(dev, PTR_ERR(clk), "failed to enable clock\n");
+	} else {
+		clk_freq = clk_get_rate(clk);
+	}
+
+	ret = do_set_clk_freq(dev, clk_freq);
+	if (ret)
+		return dev_err_probe(dev, ret, "invalid clock freq %lu\n", clk_freq);
+
+	return 0;
+}
+
+static int g762_configure(struct device *dev)
+{
+	u32 property;
+	int ret;
+
+	/* Enable fan failure detection and fan out of control protection */
+	ret = g762_fan_init(dev);
+	if (ret)
+		return ret;
+
+	ret = g762_clock_enable(dev);
+	if (ret)
+		return ret;
+
+	if (!device_property_read_u32(dev, "fan_gear_mode", &property)) {
+		ret = do_set_fan_gear_mode(dev, property);
+		if (ret)
+			return ret;
+	}
+
+	if (!device_property_read_u32(dev, "pwm_polarity", &property)) {
+		ret = do_set_pwm_polarity(dev, property);
+		if (ret)
+			return ret;
+	}
+
+	if (!device_property_read_u32(dev, "fan_startv", &property)) {
+		ret = do_set_fan_startv(dev, property);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static int g762_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -933,20 +895,11 @@ static int g762_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	i2c_set_clientdata(client, data);
+	dev_set_drvdata(dev, data);
 	data->client = client;
 	mutex_init(&data->update_lock);
 
-	/* Enable fan failure detection and fan out of control protection */
-	ret = g762_fan_init(dev);
-	if (ret)
-		return ret;
-
-	/* Get configuration via DT ... */
-	ret = g762_of_clock_enable(dev);
-	if (ret)
-		return ret;
-	ret = g762_of_prop_import(client);
+	ret = g762_configure(dev);
 	if (ret)
 		return ret;
 
@@ -955,10 +908,24 @@ static int g762_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct of_device_id g762_dt_match[] = {
+	{ .compatible = "gmt,g762" },
+	{ .compatible = "gmt,g763" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, g762_dt_match);
+
+static const struct i2c_device_id g762_id[] = {
+	{ "g762" },
+	{ "g763" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, g762_id);
+
 static struct i2c_driver g762_driver = {
 	.driver = {
 		.name = DRVNAME,
-		.of_match_table = of_match_ptr(g762_dt_match),
+		.of_match_table = g762_dt_match,
 	},
 	.probe = g762_probe,
 	.id_table = g762_id,
-- 
2.39.2

