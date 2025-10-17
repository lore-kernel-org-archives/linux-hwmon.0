Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA21E1A3D
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706160; cv=none; b=aGa3yjs97yb02erBKdCbAYz8/3OTqFZqXTTzVpaiclrfizsxWRiL70QBgmIGA438BuKLyEU4NObmdYpDI76/jrhrG+G0DovMhvud/Zh07zIBihD5yF3TrcFnECDqPbSxXtOHBpeX2L12nqI1MAv7uo3tCdRNwAkD+xfoPSxQKAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706160; c=relaxed/simple;
	bh=+DcSpDtJEbICuW4Ai36R3P0V+ylsXejBNOyGJZi1gA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/4C4LcbAoJG2NksH8dVXbkulNv0Zm2YNN66dO8794RMFVH+QgQAQn/iSZsZmcRC5HuhecCyqL2RtPS2ebsuejeCe5bZY7KWjPdcAM1KBrSyFHRlpH19OTroOvsPfxO8wfn8Y5E4ZupmhRZEBK10YW2tjufPJz+DK+PsqQ8Qedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9Z7iFz4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9Z7iFz4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33067909400so1486314a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706157; x=1761310957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S74JzU5mg3B8x3yDmj2zQbPXJlNPNOW6wXz2z3bLi7M=;
        b=Y9Z7iFz4U/XWW4X3RbTTA1K6Zt1PhcX+F76RzPm+ndpptIEyXIRbR923ZHgdvsc8I2
         M1TwOdsNnbLRfPu9JtHJz+Tp3ZqqmMQ+0Fj00bYcLkQdm9F2I0fKehN23h3ap56jo77u
         cjEz319VUXjG7nW7xIkkFCxbFQTrysVQuyEHsPKynT2FXswQkNsxMccrE+EIxcuWQpSx
         hq3QxWoRvkWNjNqrB2Hp6Ts4V+8WVd7A1KydphkMRfYFUqK7Nw2ohSZHdMiWdVBprRNZ
         a9Gqe4VaY9Oz0IlKvIfaYdBxjgQM/YSm5DosuO0xE8dm3SMvA+HF6r3Rr+xi1KrdHUej
         gMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706157; x=1761310957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S74JzU5mg3B8x3yDmj2zQbPXJlNPNOW6wXz2z3bLi7M=;
        b=Ei0zJ8fT0Zred7RDgM+dvh5pj69Yflo66zTABATqdf7Uf5RZb8ejHDt4cnc/gww3JM
         c3Oq0QPLF7bxKxBSeaq68UBn5Uwmnu5m8aS22zmAgUfLwnme60kF7yQWJEuU3qtobQBP
         WKtNLoBWC7gFsKOMuGhO5ejbSPVmqmBDXY8QDsv4OkHaAzOGsaqYpLdnrXa2C5zeThLw
         ClX8+No2SdfUOvVbhktkCZy/L401sFTf/tk0Aa20NXrn8nIqFgx2sGyS9tMJz0OWIUEr
         IM4B/1ccS65bSbfgGWtw77sE43mkBAYjWsJsr4My2FOLHmbyMa5OjVcEEX5UxbCXfAoa
         zyFQ==
X-Gm-Message-State: AOJu0YzW3Mh1eH9s2rgoDo4EDvYR+E7qR5Eyzn0vswNa82hk8gUOfCAC
	0OpfEW/KKPKp71U22kWZDFvkA8nX3WywuI3nftONlgi4b8JlqG0oxkmgXn3aRQ==
X-Gm-Gg: ASbGncv20n8Itmwyu6eBMX5WLyYpzwTGs8IIXB/XHeQJR8t+88A5uhyRBWY3SbiHx+C
	CHKEl63D4qOTybdmEEi2EB+Nt9rXzKtceFXWyl030dwp7bz4ruOm88LfMCF+egfDWvCdlTFSzkc
	egw0IZWNMzyPsLNctqZ5P+cYLCzVa8iAbK8BUVl2J0F8Vz8JLCxOoUPAC3+FSavR8XXa8hEvOsM
	DbHU9pCVJMCJA8lCH7o2EfXCiJfbBCbTmWCtBaWt6tVOn3P7wD4z5c3+g28shR8vXiHg1QL5YIr
	t+UDAc2Mrk/NXChAwQafCXwoK043NiTtkWGwRIZqvFcK5hAzmh+K9afTYW0tYrggIq+e8G6eArs
	LQjDiXqLXrn22pqzJ+kFDM/MSlmddwqUdJMae/ndnq5IuiHaaiscBxMbXeRcMIksSpFHzJSWh6c
	XB6Hc60AWsV27Ss6WH/rHgE+A=
X-Google-Smtp-Source: AGHT+IEww17VBi8x8tPyzKConmD0DF/QAIckRLadF0Box6uKACd4fwBHUpx2SAWANmeNf1fXOavaBA==
X-Received: by 2002:a17:90b:3a4f:b0:32e:a54a:be53 with SMTP id 98e67ed59e1d1-33bcf89348cmr4323458a91.16.1760706156532;
        Fri, 17 Oct 2025 06:02:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd79d4927sm2917309a91.9.2025.10.17.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/29] hwmon: (hs3001) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:56 -0700
Message-ID: <20251017130221.1823453-5-linux@roeck-us.net>
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
 drivers/hwmon/hs3001.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/hwmon/hs3001.c b/drivers/hwmon/hs3001.c
index 24ed3fb9a43a..50c6c15f8b18 100644
--- a/drivers/hwmon/hs3001.c
+++ b/drivers/hwmon/hs3001.c
@@ -42,7 +42,6 @@
 
 struct hs3001_data {
 	struct i2c_client *client;
-	struct mutex i2c_lock; /* lock for sending i2c commands */
 	u32 wait_time;		/* in us */
 	int temperature;	/* in milli degree */
 	u32 humidity;		/* in milli % */
@@ -112,12 +111,9 @@ static int hs3001_read(struct device *dev, enum hwmon_sensor_types type,
 	struct i2c_client *client = data->client;
 	int ret;
 
-	mutex_lock(&data->i2c_lock);
 	ret = i2c_master_send(client, NULL, 0);
-	if (ret < 0) {
-		mutex_unlock(&data->i2c_lock);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * Sensor needs some time to process measurement depending on
@@ -126,8 +122,6 @@ static int hs3001_read(struct device *dev, enum hwmon_sensor_types type,
 	fsleep(data->wait_time);
 
 	ret = hs3001_data_fetch_command(client, data);
-	mutex_unlock(&data->i2c_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -211,8 +205,6 @@ static int hs3001_probe(struct i2c_client *client)
 	data->wait_time = (HS3001_WAKEUP_TIME + HS3001_14BIT_RESOLUTION +
 			   HS3001_14BIT_RESOLUTION);
 
-	mutex_init(&data->i2c_lock);
-
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
 							 client->name,
 							 data,
-- 
2.45.2

