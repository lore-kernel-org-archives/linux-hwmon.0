Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7795F331A4A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706179; cv=none; b=nK5QZFjO5J9ZZXe+SJzrHHZOLHTaZlLR5GElFsGmMHsm3GslPOyfpq2vDFNCGpt2O6iZJ9oQbUI5Wf4qqOFQ3xtIuhhXyDW98FwPIs0x/CWrImuQPRhx6V9DG4DVzxm1ZL/JlPwTeGnQEOubMbBXGKeGVG4FJ8yyHaBz+cqqwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706179; c=relaxed/simple;
	bh=JugMWLX4fkEj1NqEqq0rHu6P6FOlZCAeTfNFkZI2rDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXs6IjVow70xJn3JOoTtWQl7tD1i3wqyqyRzqBJUQhOTjXvqCJEijAcI1EEEYIdbjdmgjqotirVnN4hOQ1w4HpoKMWYMQlYyxY2GZcorQsvr6668mV5/iXjhm4qvk35aMjqp2c70AAK7x5RAdOTgaIxDn5hJuFIunR438tudOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2QWUdyS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2QWUdyS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7841da939deso1871914b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706177; x=1761310977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNF0yJJ9g6xDHxUrJkR9YrHKzL4WHVL4N+GG6jCX5nc=;
        b=T2QWUdySvmsWyJF5ICe00Zk39qghYBX8aB2t6qbp8PDAuUlXhYtqfcQ6c0kQfQ007q
         THqcTUFxEaX2rtrnk/4fWmKJQQh954c7z5e0CT6HAPa2ACF9LhOAr4hTTyB5N+G22eEj
         dVwziYIJBRqXD5KqA6G7mAmpOL67EF/3m0yUQNk2su5gLnzDkW87Nuc6R/86qjDixrqf
         KZq5kmSSo0oNw4O7VkjQ016E3l1OZB5J1Dr9ZRy4ByS+wViroAEZRhuxSsPV2NtO4tYL
         WC2tEieDfoKV0jsnJksznzYjHnEh9s8A4EyXxVigYMyFTMoFS8JmFAGi4p+i3Du/SlnZ
         i5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706177; x=1761310977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNF0yJJ9g6xDHxUrJkR9YrHKzL4WHVL4N+GG6jCX5nc=;
        b=Bgpz5Zt5hwLhEcnEGfq2eXm1oX2Vli4dlwzBSYtNRjOJ8nkTOvabVPvi2FBZ133XuV
         Rd1U3hdRIXiRGkwWTsgb+vExKHvuLPb16sySPC3VoogDDdNOzCi0rNPSvpp6TEPIptth
         G383UXa+njFJZIZ4mhW/VM9iPBGkT3GPOlSe+K7JC+yaCZcBRYWDoUec8j8SYBoZZQXK
         13DuNe2Drw++9VDQkRsHLwIu8jPHBfsGsf1l0Z7cpZ2b8yyRUgoR8T6HFlc8XuPoZDL7
         ttZS6M0aNOnb+KawVANAe9tR9apFYVFy4gzvHG0L3MHFwfpeLCQtFc9u3bxWS+90OxTZ
         WlrA==
X-Gm-Message-State: AOJu0Yxv+rBTAdSCMdO+pIdcVLJtguX4JOYLAMLj+kynITBpi2Xhz5C5
	Uu+NA2EUhnY7h1oIlldFcvFja/a1OHbtP2scF2TC8oh1p2fSLPTEvE2XBmHvRA==
X-Gm-Gg: ASbGncv4jRHpo2/B6MhiCmx24qOyXShipD74m9wyJOawLmDFfCyfNvUoktrBnXYTI0P
	mcX9BeC3HlNEZ4MQ/SawjTwwSS1bHfmUgfGJqc++gctwBN8UzyKyXAJYrK6j/Es0kVqSaktpok5
	v3JMgJdtNf/f257RXzpchLceIszigi6MVOEpb3smjTGNpaPn61yzY0/fEbmMbkM8R4fbNIL+IOm
	bKU3kJCJxXG30kjKmUplNNt3Xh+3xPak2ZuFr2sSoLFoy2So0N15itDfCssnfPviZ0hlftcf/nz
	PnEdMzM8cynOOT9+7VfFF3cAxnreQtpsH5rEL/dED5S9EOs9fHSfU8AMP4gnA6wXqLAfO7mZUyU
	3wVMPCYQV2ntxzVNpvr1f8ymNoy8KVnaLZrOuxYClKUH/5+2oLjoOO2pj3FaxJ00bG+EnYg1W1s
	5NDZrdscUV/O5A
X-Google-Smtp-Source: AGHT+IF0o5A8RwCJmEJrSLhBteQ0ehNmoBXMRuWjdfb6nF3UiDZmFegIL+TuIDs7vO773l9RS/IAdg==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id d2e1a72fcca58-7a220ab550bmr5195409b3a.18.1760706177445;
        Fri, 17 Oct 2025 06:02:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2774sm25741510b3a.63.2025.10.17.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/29] hwmon: (aht10) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:07 -0700
Message-ID: <20251017130221.1823453-16-linux@roeck-us.net>
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
 drivers/hwmon/aht10.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index d1c55e2eb479..8b90b661c393 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -60,8 +60,6 @@ MODULE_DEVICE_TABLE(i2c, aht10_id);
 /**
  *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
  *   @client: the i2c client associated with the AHT10/AHT20
- *   @lock: a mutex that is used to prevent parallel access to the
- *          i2c client
  *   @min_poll_interval: the minimum poll interval
  *                   While the poll rate limit is not 100% necessary,
  *                   the datasheet recommends that a measurement
@@ -81,11 +79,6 @@ MODULE_DEVICE_TABLE(i2c, aht10_id);
 
 struct aht10_data {
 	struct i2c_client *client;
-	/*
-	 * Prevent simultaneous access to the i2c
-	 * client and previous_poll_time
-	 */
-	struct mutex lock;
 	ktime_t min_poll_interval;
 	ktime_t previous_poll_time;
 	int temperature;
@@ -168,32 +161,24 @@ static int aht10_read_values(struct aht10_data *data)
 	u8 raw_data[AHT20_MEAS_SIZE];
 	struct i2c_client *client = data->client;
 
-	mutex_lock(&data->lock);
-	if (!aht10_polltime_expired(data)) {
-		mutex_unlock(&data->lock);
+	if (!aht10_polltime_expired(data))
 		return 0;
-	}
 
 	res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
-	if (res < 0) {
-		mutex_unlock(&data->lock);
+	if (res < 0)
 		return res;
-	}
 
 	usleep_range(AHT10_MEAS_DELAY, AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
 
 	res = i2c_master_recv(client, raw_data, data->meas_size);
 	if (res != data->meas_size) {
-		mutex_unlock(&data->lock);
 		if (res >= 0)
 			return -ENODATA;
 		return res;
 	}
 
-	if (data->crc8 && crc8_check(raw_data, data->meas_size)) {
-		mutex_unlock(&data->lock);
+	if (data->crc8 && crc8_check(raw_data, data->meas_size))
 		return -EIO;
-	}
 
 	hum =   ((u32)raw_data[1] << 12u) |
 		((u32)raw_data[2] << 4u) |
@@ -210,7 +195,6 @@ static int aht10_read_values(struct aht10_data *data)
 	data->humidity = hum;
 	data->previous_poll_time = ktime_get_boottime();
 
-	mutex_unlock(&data->lock);
 	return 0;
 }
 
@@ -358,8 +342,6 @@ static int aht10_probe(struct i2c_client *client)
 		break;
 	}
 
-	mutex_init(&data->lock);
-
 	res = aht10_init(data);
 	if (res < 0)
 		return res;
-- 
2.45.2

