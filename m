Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0542D9EFE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706166; cv=none; b=CM/tNb0YQmpgOKMsIavLPGwSFBD33wznuCN2G9lzI/yDf+DO6IFvLwB2HR3/cLxjtojqKmN5SqZeBr41l0r6HFWKPwcYlzfILiohhpkq0paVqx5YraSOWaSXWKbzuTD1g0GtypHEwxrArHO029oEQayRjMuotF0DjXV4r15/8sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706166; c=relaxed/simple;
	bh=O4ZEBZHMbaZZxNZE1zrEOE/IU136OlWaoL/a8WL8NXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gij3YzK+Z4S5/iaW5WTUy9gWg4yM0C4L5WIsOIN3do7XbGDYu61slDJnCQ4FiCzEjjWqQ5UaTjnJJvS5AErHj/Nv11VEvcPE+FjGH4eTUxthjBeJxbGG4Spe2lVEb6B2yjSMEnQuCAn1JA8wZg6GvRj4u41/9zK3JXyYdnNNPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcm6qwY/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcm6qwY/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33b8a8aa73bso1747073a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706164; x=1761310964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeqcW731KJVenONbIrarcyM2S3esaQb4ChlqBvu2bUc=;
        b=dcm6qwY/XahIYJpozgmJYBvIT7wC9juel5y55nrWDlAyzJVtGXplsHtQlgXR/8o8Nr
         yZNjgzfbqpXrXgo1uR9EY2GboLfkWLr45SjraxyPt1ksVpgiSdrKi6KI9uNkOKGbJnQ2
         7kjocJ2/Dy5S+f6h/EMdOLnQD3Zm0Q4uExYVlAPXctZSSSk7pwbdEiu9u3oD1ScVUHzQ
         SQLjt6AxS2jvbURiYc+jKIMsqh32yNZ057qyauEw08NiRLXm9y8nRQo2tJ0mNoSySL/d
         hnVnWqgtCKakNZ1OJ3jlOCjbiJEgSExV6isa73QQTxLZdmqATvEowWfueTtz9Nj5s4Vm
         mRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706164; x=1761310964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeqcW731KJVenONbIrarcyM2S3esaQb4ChlqBvu2bUc=;
        b=dSG5QSMTICb2Jvi7T2593VJr47rtCvousw7MGu2HcsIk/2TOGk94Eyl4gu5wskWb3F
         WKuj5WIUpBx+11pLUA5AUnkLwzkbcx8PXT18U58XzqPbABGdQIySoASJ5vU6Lrbw5nFd
         2ISSzWSfFWDEB3MkyabpmgA6Jfw51A9rLSkCeoNNLTcKaBmXkANZbMvxXuSm294bZjQv
         EoarQihBnsUrH0PA58/qlb7D2jvAEnZ5kCT1/3RgV7RvYpoNY1mml/kGtcAot9sAKyQq
         RKJibgPUJTEL/1zT8etxFb9lcL3jhp/LeHxHdLSBTbm264aB+jCuxT58P+7PLHk/94WJ
         e4TA==
X-Gm-Message-State: AOJu0Yxa5pRkfW3g1zs96pREjZXZsGCK395+aj7LPRQGtzEW1+IWXX9m
	95P9xuwsF9UFubQVxGwKYbSmnTiBQfcRWkZyJxdV2h02X2cO/bgTqOXjLb29TQ==
X-Gm-Gg: ASbGncs4Zib0lHajsokj0cnvRFhnuK18KZvtTkvTY6Mm3pUC4yvUi2VBy4FTlq3ecnk
	H14AQiMJcwKLStcQ++QnUG+FTYpb5xlqtN8xNqV9FmYtIi2mhF8YuBdJVD76HgOeCiIkPcpyiwL
	eUm9qdBtpBQFQzBgP6SvRwFqdaUKGS0HFVJbPpu21UYvczjvW6IVGktp+I4RLB+CJCF6liQZk4G
	0loK081+rB7iYOnJcf9fDH/SfhqBSIIRioZcA73FtM60q8VxLcj1OxFKtgqsjuxYlV3hKFuktDj
	a9KQzu4mkmXlQ1Nf9NjWFTyeuAz4C1tnS8zcNISon2ospiGKZ2e+BYooV2sS64OxVPEF34kmDPg
	GhEQfSpLPijS33nvxllCh9yabmJkeapX9s8GDN7+OzGxOOiDdBG9THzJCrxbye0gfIzxvQ5d+eU
	hFNgz62pPtpZBx/h3JaTonQkJ/f3qRBajwMg==
X-Google-Smtp-Source: AGHT+IFtBPSKpWVhXZBPoYMzQMXEI5urZ07Wl0ajcdv2pNjicebh2C4HWhr1g7Rofx3WI1m6ynLrug==
X-Received: by 2002:a17:90b:1dc6:b0:339:a4ef:c8b9 with SMTP id 98e67ed59e1d1-33bcf8e61admr4833971a91.17.1760706163653;
        Fri, 17 Oct 2025 06:02:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b401e5sm2822345a91.20.2025.10.17.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/29] hwmon: (sht4x) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:59 -0700
Message-ID: <20251017130221.1823453-8-linux@roeck-us.net>
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
 drivers/hwmon/sht4x.c | 40 +++++++++++-----------------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 6c9b776237c2..5abe1227e109 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -55,7 +55,6 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
 /**
  * struct sht4x_data - All the data required to operate an SHT4X chip
  * @client: the i2c client associated with the SHT4X
- * @lock: a mutex that is used to prevent parallel access to the i2c client
  * @heating_complete: the time that the last heating finished
  * @data_pending: true if and only if there are measurements to retrieve after heating
  * @heater_power: the power at which the heater will be started
@@ -68,7 +67,6 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
  */
 struct sht4x_data {
 	struct i2c_client	*client;
-	struct mutex		lock;	/* atomic read data updates */
 	unsigned long		heating_complete;	/* in jiffies */
 	bool			data_pending;
 	u32			heater_power;	/* in milli-watts */
@@ -87,7 +85,7 @@ struct sht4x_data {
  */
 static int sht4x_read_values(struct sht4x_data *data)
 {
-	int ret = 0;
+	int ret;
 	u16 t_ticks, rh_ticks;
 	unsigned long next_update;
 	struct i2c_client *client = data->client;
@@ -96,8 +94,6 @@ static int sht4x_read_values(struct sht4x_data *data)
 	u8 raw_data[SHT4X_RESPONSE_LENGTH];
 	unsigned long curr_jiffies;
 
-	mutex_lock(&data->lock);
-
 	curr_jiffies = jiffies;
 	if (time_before(curr_jiffies, data->heating_complete))
 		msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
@@ -110,11 +106,11 @@ static int sht4x_read_values(struct sht4x_data *data)
 			msecs_to_jiffies(data->update_interval);
 
 		if (data->valid && time_before_eq(jiffies, next_update))
-			goto unlock;
+			return 0;
 
 		ret = i2c_master_send(client, cmd, SHT4X_CMD_LEN);
 		if (ret < 0)
-			goto unlock;
+			return ret;
 
 		usleep_range(SHT4X_MEAS_DELAY_HPM, SHT4X_MEAS_DELAY_HPM + SHT4X_DELAY_EXTRA);
 	}
@@ -123,7 +119,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 	if (ret != SHT4X_RESPONSE_LENGTH) {
 		if (ret >= 0)
 			ret = -ENODATA;
-		goto unlock;
+		return ret;
 	}
 
 	t_ticks = raw_data[0] << 8 | raw_data[1];
@@ -132,26 +128,20 @@ static int sht4x_read_values(struct sht4x_data *data)
 	crc = crc8(sht4x_crc8_table, &raw_data[0], SHT4X_WORD_LEN, CRC8_INIT_VALUE);
 	if (crc != raw_data[2]) {
 		dev_err(&client->dev, "data integrity check failed\n");
-		ret = -EIO;
-		goto unlock;
+		return -EIO;
 	}
 
 	crc = crc8(sht4x_crc8_table, &raw_data[3], SHT4X_WORD_LEN, CRC8_INIT_VALUE);
 	if (crc != raw_data[5]) {
 		dev_err(&client->dev, "data integrity check failed\n");
-		ret = -EIO;
-		goto unlock;
+		return -EIO;
 	}
 
 	data->temperature = ((21875 * (int32_t)t_ticks) >> 13) - 45000;
 	data->humidity = ((15625 * (int32_t)rh_ticks) >> 13) - 6000;
 	data->last_updated = jiffies;
 	data->valid = true;
-	ret = 0;
-
-unlock:
-	mutex_unlock(&data->lock);
-	return ret;
+	return 0;
 }
 
 static ssize_t sht4x_interval_write(struct sht4x_data *data, long val)
@@ -287,22 +277,16 @@ static ssize_t heater_enable_store(struct device *dev,
 		heating_time_bound = 1100;
 	}
 
-	mutex_lock(&data->lock);
-
-	if (time_before(jiffies, data->heating_complete)) {
-		ret = -EBUSY;
-		goto unlock;
-	}
+	if (time_before(jiffies, data->heating_complete))
+		return -EBUSY;
 
 	ret = i2c_master_send(data->client, &cmd, SHT4X_CMD_LEN);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
 	data->heating_complete = jiffies + msecs_to_jiffies(heating_time_bound);
 	data->data_pending = true;
-unlock:
-	mutex_unlock(&data->lock);
-	return ret;
+	return 0;
 }
 
 static ssize_t heater_power_show(struct device *dev,
@@ -422,8 +406,6 @@ static int sht4x_probe(struct i2c_client *client)
 	data->heater_time = 1000;
 	data->heating_complete = jiffies;
 
-	mutex_init(&data->lock);
-
 	crc8_populate_msb(sht4x_crc8_table, SHT4X_CRC8_POLYNOMIAL);
 
 	ret = i2c_master_send(client, cmd, SHT4X_CMD_LEN);
-- 
2.45.2

