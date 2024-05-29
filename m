Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8EE1A38E1
	for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005701; cv=none; b=PhyDAXphSB4PtdVXC9/Qbhb+HYyW4dhWaqZazHzq0Oi79tl8an6AYqniO8REtDav1ld95JonEsfH6CSXHUnt62RJtkHtBjo9e0NglkgSrR6GuN++3dfaezMbUEhk192fMhZX4d7cW2l7X8BpdbHvL6VinGPmXYZ/fHBm5zUDo5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005701; c=relaxed/simple;
	bh=0dAonKCnLoNpdqdIlZhH0E1nfQ2Qxl/0zVWvKWQtWzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iquz11wrhYYyMdcV8uza0adjUCRg/v3hDe6Zm2SfOFCnGzpx1VyYkULLqZzHJ+qFPSbF6nP2DUd/xKTMAT5zIusJEf3tiILtuKJr+4I8IwQX7WTknAQhyJxGUbvE6MWgh0SAvYJCTx9NFZcHEppdH9/PJHV1Q3K/TSE0iPSJV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKrixymD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKrixymD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f8edddf756so10943b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717005698; x=1717610498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me+bRRWVvbJuCB2Hi9b0qVCNt4wMDRNR1FYOxYNpvPM=;
        b=QKrixymDpZ+Qgv556mFNOWZxBjGL/dGtxwhVVcQDye7Z5wZxoXOa8tdoUJiEO9vNE8
         XVrS38ImqdOmpkQDFH+T4gB/aO/aaNJvIjhrFOKiXlyUv5M6E3nQ6Keqbm1MuCpQmH0l
         XGjmsBT3i3hMVG1NSagEKRFrGW6U/b9hRqjUY7MqaL1a5013SHm3fbSPlNkfbaTPFBPX
         FjkTrjcU1IjxQgdR8jkNqjM2HEzC46/kphvRoSrnzhgG2qONB16cvDr4IkH7MP8mZUru
         R6nQ8Q3jNInmj7hvM+1ngbpI5D+OsLw5lzsu4T0k8sKTbbKPUSlobbwj/ekihkbMHiDv
         MF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005698; x=1717610498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me+bRRWVvbJuCB2Hi9b0qVCNt4wMDRNR1FYOxYNpvPM=;
        b=ixOdvPEmfHhksPzT8smUooIdHUDAz675q9FAn999VYhX0+s84jOmVrzCjnLvzL7UbY
         japPwr/JYERS5Ms6pVU3NHQgkyJ111NTFlzBEz42XdpKpxdVdYyvgT4wtSBtY3Py0rUT
         lKZ+vMHM5dXHh6AJmPGsThM8JlhLJtm6ycwFHvcU9Wf+X/xhKsqQd1X4VC0DXswsR8Bz
         5DIBwbbCXJauhO1Oe/eAGdcCHGVrqeoec4Jkgon0IphWN/5cKugpbqGyG4BZZGg80a1o
         cEIqEXHFJQbmNmbU1WqaRVYLQIZrWMNQo/cp7ikOfQEdVYuvj1uoEfRHW+Qla2IZabBC
         mVyw==
X-Gm-Message-State: AOJu0YyNnS+jn8sBVBtJSIWBPqb2jahNv+ZZSplCjvBIMLVQr7njoyNX
	DjzHAjd6N6KiE7GNZr6vz7oeVDLe5R5awrnuGdZyjsbWCO/vLx0fgVnAxQ==
X-Google-Smtp-Source: AGHT+IFXofiOOUZnWSKr9U/kadmtdhmpkxyHiZvzXZUW+QhfVKm8vEDfaKLTRtxC1ZmfqK30x6craA==
X-Received: by 2002:a05:6a00:301c:b0:6ec:f712:8a69 with SMTP id d2e1a72fcca58-6f8f3d6e6b3mr22121861b3a.29.1717005698406;
        Wed, 29 May 2024 11:01:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1838sm9429496a12.46.2024.05.29.11.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:01:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (lm90) Convert to use PEC support from hwmon core
Date: Wed, 29 May 2024 11:01:32 -0700
Message-Id: <20240529180132.72350-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529180132.72350-1-linux@roeck-us.net>
References: <20240529180132.72350-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace driver specific PEC handling code with hardware monitoring core
functionality.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 56 ++------------------------------------------
 1 file changed, 2 insertions(+), 54 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e0d7454a301c..40d9e21b528c 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1270,42 +1270,6 @@ static int lm90_update_device(struct device *dev)
 	return 0;
 }
 
-/* pec used for devices with PEC support */
-static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
-			char *buf)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-
-	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
-}
-
-static ssize_t pec_store(struct device *dev, struct device_attribute *dummy,
-			 const char *buf, size_t count)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	switch (val) {
-	case 0:
-		client->flags &= ~I2C_CLIENT_PEC;
-		break;
-	case 1:
-		client->flags |= I2C_CLIENT_PEC;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return count;
-}
-
-static DEVICE_ATTR_RW(pec);
-
 static int lm90_temp_get_resolution(struct lm90_data *data, int index)
 {
 	switch (index) {
@@ -2659,11 +2623,6 @@ static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void lm90_remove_pec(void *dev)
-{
-	device_remove_file(dev, &dev_attr_pec);
-}
-
 static int lm90_probe_channel_from_dt(struct i2c_client *client,
 				      struct device_node *child,
 				      struct lm90_data *data)
@@ -2802,6 +2761,8 @@ static int lm90_probe(struct i2c_client *client)
 		data->chip_config[0] |= HWMON_C_UPDATE_INTERVAL;
 	if (data->flags & LM90_HAVE_FAULTQUEUE)
 		data->chip_config[0] |= HWMON_C_TEMP_SAMPLES;
+	if (data->flags & (LM90_HAVE_PEC | LM90_HAVE_PARTIAL_PEC))
+		data->chip_config[0] |= HWMON_C_PEC;
 	data->info[1] = &data->temp_info;
 
 	info = &data->temp_info;
@@ -2878,19 +2839,6 @@ static int lm90_probe(struct i2c_client *client)
 		return err;
 	}
 
-	/*
-	 * The 'pec' attribute is attached to the i2c device and thus created
-	 * separately.
-	 */
-	if (data->flags & (LM90_HAVE_PEC | LM90_HAVE_PARTIAL_PEC)) {
-		err = device_create_file(dev, &dev_attr_pec);
-		if (err)
-			return err;
-		err = devm_add_action_or_reset(dev, lm90_remove_pec, dev);
-		if (err)
-			return err;
-	}
-
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &data->chip,
 							 NULL);
-- 
2.39.2

