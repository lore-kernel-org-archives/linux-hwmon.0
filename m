Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3813A260
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129043; cv=none; b=h1LnKVL6JyClBIVpKXH8NUszSwHLobVKFybFcRbopl+91nQ+zE6c9Xlho1qWYyrxMGXf024KTXY+Q7tf4NxAE4DmqwiqkJl3IRgoOs7+Dmv1MdkjolslmHv2J3GQ3wL0BUPNhtvIunNLeIyBJbEevnh7+6wEEyuvwGCaFypnT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129043; c=relaxed/simple;
	bh=mIIsDFzMw6/AWQVQ/iQUOQ1uB4z3DigcyVbPvPZFgfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMggIF6CBrwRp2gX7VSbBi1qFEdxjcwWA4KUEkxB3lhWtUQWWO31WMMI3URk3HrZVV8LBkaPYGb41s0jdVm6J51ibmpQQxjKgp0LUDbxQL+eSNBVyDzxnLfp4HLeJqHDXnrm6is+zQglGYGQUVsAz9ELCNLZ6hPMWPKGBzm6gtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9X/osc/; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9X/osc/"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3737dc4a669so3596835ab.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129040; x=1720733840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dG6iRobVZTYBkdbLDz9IGF27zkktf4osxkRKl6w5hc=;
        b=T9X/osc/aX6Dma8orlkJjbMgDFUqMrZKh44lD15xSahD41b5A2C2Gkmr/QC2yM8INX
         8WT0wKvgIqu9Wy1bU/Ybb6uRSl6wZQbPdcn4WhoFknzfFnO653YcQErmiI5Znmce34UX
         AxsMQHXgZkT/MNIiDsfqNKlXnD5ofNZ7MnjrLI8EStS+Kx+X6h5TC5fsMbnrnJhN1v6F
         gyqEymHfRnYzMUJa73Kyyngpk6MwY6WWJ77GVlanxMF8UDA1w5SF3PhjMIYR5tgEdcJJ
         lSagVXkLOn0AgeMdR8GsawkNEf/iYBmxW8fXkpQB502KaxMgHZ9ceOXMLUHbNqOWKBjS
         JEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129040; x=1720733840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dG6iRobVZTYBkdbLDz9IGF27zkktf4osxkRKl6w5hc=;
        b=bn7uwHb2QyysvQU3YxAq3T0qS9AFP5W5aqd8dZXBVcv3PzfQjBLHLeI7sE7cDG41Tc
         a+y72wFpKaGSVFXhq22XUqikholoQ5k99YjNBZt7Q05mI1yJuixY9QfcXHyajj2ZaTHq
         FL3re6pthXAKFoBa6kJoj15MoWoETmEziHwPEKSVwI0N5lfDLZR7WmS8zG4264+jQNqC
         zOPonVjnslpon5aD9ND+IQVZfVhaCzwN1j1QkIfm+Yi+OGQt+EwMfTXT/QlSB0r+oLo5
         LtTGDlTYezFUpMel0/VvHzMyZGzpp+nym8f0IYel334chFaGKzL4C22ksC5vrs7pCMv/
         rKZg==
X-Gm-Message-State: AOJu0YwGb/m65SKau0XwGk3bp5EjzNTryoWvhsW4SICAJqceF1IX84YT
	dezsdNurvi7IIELWpqHEngxv4jnUzn4TkYVapaF0zZkFA1mDGsownohBuQ==
X-Google-Smtp-Source: AGHT+IEK+ssAk4HUs/ckLB6evmHUEZZny+PqJO79Dtl52z1hNG8cDplUuyVUNr/n5/t295OhMU91Fg==
X-Received: by 2002:a05:6e02:18c5:b0:376:148f:d6c6 with SMTP id e9e14a558f8ab-3839a6f85cbmr34645675ab.24.1720129040211;
        Thu, 04 Jul 2024 14:37:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7623cd854b2sm968059a12.38.2024.07.04.14.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/7] hwmon: (g762) Simplify clock initialization
Date: Thu,  4 Jul 2024 14:37:06 -0700
Message-Id: <20240704213712.2699553-2-linux@roeck-us.net>
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

Use a device managed function to prepare and enable the clock.
To match the current code, only let it fails if a device node
is present (i.e., when it is mandatory). Otherwise set the default
clock speed.

No functional change intended, even though the code now does set
the default frequency if there is neither a devicetree node nor
platform data.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 66 +++++++++-----------------------------------
 1 file changed, 13 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index af1228708e25..da43a26f558d 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -115,7 +115,6 @@ enum g762_regs {
 
 struct g762_data {
 	struct i2c_client *client;
-	struct clk *clk;
 
 	/* update mutex */
 	struct mutex update_lock;
@@ -574,66 +573,27 @@ MODULE_DEVICE_TABLE(of, g762_dt_match);
 
 /*
  * Grab clock (a required property), enable it, get (fixed) clock frequency
- * and store it. Note: upon success, clock has been prepared and enabled; it
- * must later be unprepared and disabled (e.g. during module unloading) by a
- * call to g762_of_clock_disable(). Note that a reference to clock is kept
- * in our private data structure to be used in this function.
+ * and store it.
  */
-static void g762_of_clock_disable(void *data)
+static int g762_of_clock_enable(struct device *dev)
 {
-	struct g762_data *g762 = data;
-
-	clk_disable_unprepare(g762->clk);
-	clk_put(g762->clk);
-}
-
-static int g762_of_clock_enable(struct i2c_client *client)
-{
-	struct g762_data *data;
-	unsigned long clk_freq;
+	unsigned long clk_freq = 0;
 	struct clk *clk;
 	int ret;
 
-	if (!client->dev.of_node)
-		return 0;
-
-	clk = of_clk_get(client->dev.of_node, 0);
+	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
-		dev_err(&client->dev, "failed to get clock\n");
-		return PTR_ERR(clk);
+		if (dev->of_node)
+			return dev_err_probe(dev, PTR_ERR(clk), "failed to enable clock\n");
+	} else {
+		clk_freq = clk_get_rate(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(&client->dev, "failed to enable clock\n");
-		goto clk_put;
-	}
-
-	clk_freq = clk_get_rate(clk);
-	ret = do_set_clk_freq(&client->dev, clk_freq);
-	if (ret) {
-		dev_err(&client->dev, "invalid clock freq %lu\n", clk_freq);
-		goto clk_unprep;
-	}
-
-	data = i2c_get_clientdata(client);
-	data->clk = clk;
-
-	ret = devm_add_action(&client->dev, g762_of_clock_disable, data);
-	if (ret) {
-		dev_err(&client->dev, "failed to add disable clock action\n");
-		goto clk_unprep;
-	}
+	ret = do_set_clk_freq(dev, clk_freq);
+	if (ret)
+		return dev_err_probe(dev, ret, "invalid clock freq %lu\n", clk_freq);
 
 	return 0;
-
- clk_unprep:
-	clk_disable_unprepare(clk);
-
- clk_put:
-	clk_put(clk);
-
-	return ret;
 }
 
 static int g762_of_prop_import_one(struct i2c_client *client,
@@ -682,7 +642,7 @@ static int g762_of_prop_import(struct i2c_client *client)
 	return 0;
 }
 
-static int g762_of_clock_enable(struct i2c_client *client)
+static int g762_of_clock_enable(struct device *dev)
 {
 	return 0;
 }
@@ -1062,7 +1022,7 @@ static int g762_probe(struct i2c_client *client)
 		return ret;
 
 	/* Get configuration via DT ... */
-	ret = g762_of_clock_enable(client);
+	ret = g762_of_clock_enable(dev);
 	if (ret)
 		return ret;
 	ret = g762_of_prop_import(client);
-- 
2.39.2

