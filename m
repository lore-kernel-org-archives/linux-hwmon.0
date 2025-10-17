Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3742233033C
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706178; cv=none; b=HN9ZxJoOEhd50OKC9OUscglVCeU3x/ey0qroGUng4h1Aqsx8JW4jwhF2e7wf2qUMaLkSlyc5KEMi43z51kbwXNevG+VLww8f39tV9WEs3lJ1QtMSK0ko6EJJfaQ7Y1w7/9enwVTTI3qD2FYsXjMK2bggo2V1luWJGxbMRTVHrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706178; c=relaxed/simple;
	bh=/YsAV1PjOp6wxHOtvIFx7wY33ZHGJBudQPowcuu/zJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lp8pflDuXoOVv+uvWF1m1xbIJLyPqb0gvqB0SeC9AHHfD36gYqe2a+jfb0o64V5Pif829Prner+BK2e2oftxVc00fGlO+65LCE9Nn1SrwPqH7yhwUZnCuLjt9PnBgGeksJ8XCUYy0s4ovz4sxw7PMvlOBkTgv9KKJdnqhoI+/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4o1dacy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4o1dacy"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-339d53f4960so1936563a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706176; x=1761310976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2DqufDyhR9QBYO7u1D4yIFFKcavDYDtfEeImRV9wps=;
        b=F4o1dacyegZXA8tKSvp7POSnZ2sL4otKVuEfg5QHDzWLa5phbr9XM55WfgKBc+aohd
         T6oqMASAWT02uXYFIzrlbt8EAynlUuZgT8r6QPp9/84U6mBQc5T21TxYE9eNBM4jiz2J
         OpNUZrboIrErE0AaoxZmbJGkuFlb0KpOZLErGSjY+H1fa5HT4at9iFasgL7UscJcAwfI
         rdV3n9bjO2b8hWEE3KBiWPiIFTP8a8O7phfTHJJcDBGx5c3Y/CmHXbToInD7ig/fOhW5
         6lsfUqd0iljF8K+fXQpg31j2z2W5CXkAnecJt4FO748OLsIVsB9lBv0foOfknKJ1OLGW
         Bw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706176; x=1761310976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2DqufDyhR9QBYO7u1D4yIFFKcavDYDtfEeImRV9wps=;
        b=fKlm9fluU/vCi2Co2zrqsIUcJnQKfXAC49ZODOC5k7xD3OnpMW9WcfIOFJsCuy93bF
         1oSm1X2HHyd10HWgD2qCqmtzkz8Ny7ZG2+VL4dn5J5j1AfYPmtj/7Ict9jQfge7MVaQT
         /Zy6laGqbi4Bmcdj9NBdi5P1csSW1R9A3OywDd09pSZJ8RlBKe8IyuiF4o2XE3vcFhrv
         LlGNpVQK4fP7STKsTRKVRSR+J4o2PegTjuHcbaTjvmKxqhKZI+bR1B14+a8ZnZumQuNF
         G21JvzW0ajp4iF2VlQylm/RDltTuIhIlwHH7/qUJqxd6XloOWgFLEXpgcQGBTkn0A9O3
         JoDw==
X-Gm-Message-State: AOJu0Yy7zWf0DGdJq4fgtPpki2iTJva5cqV+Y52drkve8sc12YY67/AS
	a1/ztry3JyJygYc7o5Fioh6LwCTlLVh/n/DpGJvzXyri7kPXZVwELshxBnqouA==
X-Gm-Gg: ASbGncueCX/p0QF/2J2wz+ykmuRw3TObBnuHr5cmad0/VVoR2D0YxWiHseiBjUfncsM
	7eSGkGKsGMyJXoV7A///ADf/QPjX+1XzM8WuGXdrObTsP5OVIkDDg6CKRbmBm38co67D7zw6MjV
	qjOd/etB0j4IeFSN2xFhb5CTf2tNZjC3JQup5ASfet3qPEMXu64F51WC41whufuVnnxzfa7dC/I
	xsMhv0S2P3G27RU4313u96MHXsHvm9ttBUVNkd8+nqNhqyQI01iB6bM7Ywl4OJ0bgD+pmXAxBqa
	vMg7AjN8QQOXg1AJ6eg79S/yt4zVMHCR/O3eATt9XTWAqqGKZzrTQXUbGxQmqNyZgz4+sBX7Ytd
	ATdGwn9PCperNtJ4mQzrAEFP8NssK36GFnoT+W88CMd2X4FD/xAhqCi9m/B53JX2cM80GhuS824
	00KvFdibllwZTo
X-Google-Smtp-Source: AGHT+IFgWWAS50+odJWeOvtFazFI13/R3J5V2TFXXdHWBsoVWcMOSc0CqF8v6X8sXR9pKNeXG2xPQg==
X-Received: by 2002:a17:90b:1dd2:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-33bcf926c1bmr4103542a91.37.1760706176162;
        Fri, 17 Oct 2025 06:02:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb662553dsm5490777a91.9.2025.10.17.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/29] hwmon: (lm95241) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:06 -0700
Message-ID: <20251017130221.1823453-15-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index cad0a0ff8416..456381b0938e 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -15,7 +15,6 @@
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/slab.h>
 
 #define DEVNAME "lm95241"
@@ -75,7 +74,6 @@ static const u8 lm95241_reg_address[] = {
 /* Client data (each client gets its own) */
 struct lm95241_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
 	unsigned long last_updated;	/* in jiffies */
 	unsigned long interval;		/* in milli-seconds */
 	bool valid;		/* false until following fields are valid */
@@ -102,8 +100,6 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 	struct lm95241_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 
-	mutex_lock(&data->update_lock);
-
 	if (time_after(jiffies, data->last_updated
 		       + msecs_to_jiffies(data->interval)) ||
 	    !data->valid) {
@@ -120,9 +116,6 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
-
-	mutex_unlock(&data->update_lock);
-
 	return data;
 }
 
@@ -204,8 +197,6 @@ static int lm95241_write_chip(struct device *dev, u32 attr, int channel,
 	u8 config;
 	int ret;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_chip_update_interval:
 		config = data->config & ~CFG_CRMASK;
@@ -231,7 +222,6 @@ static int lm95241_write_chip(struct device *dev, u32 attr, int channel,
 		ret = -EOPNOTSUPP;
 		break;
 	}
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -242,8 +232,6 @@ static int lm95241_write_temp(struct device *dev, u32 attr, int channel,
 	struct i2c_client *client = data->client;
 	int ret;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_temp_min:
 		if (channel == 1) {
@@ -313,9 +301,6 @@ static int lm95241_write_temp(struct device *dev, u32 attr, int channel,
 		ret = -EOPNOTSUPP;
 		break;
 	}
-
-	mutex_unlock(&data->update_lock);
-
 	return ret;
 }
 
@@ -443,7 +428,6 @@ static int lm95241_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->update_lock);
 
 	/* Initialize the LM95241 chip */
 	lm95241_init_client(client, data);
-- 
2.45.2

