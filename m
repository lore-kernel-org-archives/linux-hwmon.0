Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D33AC0F1
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796143; cv=none; b=JFGyBFIZMY2qJ7rQtFBP7Gd4T9H2jO5qORDMkfJgrObrzLZGvSi+q62cpUTv3adon4GIir9z05TdOugObmSjaXl0h4AMQEPrgFro3qyTNR31DnrSpPgdG/4KHzbefTQieqPl+rHiMRcDB0nrbOM3OXHMkw7TQETDt+5BVpC5Ovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796143; c=relaxed/simple;
	bh=eXXB9ogR0eAY1urJO0yEFWMXSu04x966v4NZ+Ghfm+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8ID9hDx3dJIaFnxtEEjkFB/6RQXIM6T0fI2x5MaLVNhUZXDu8x6/1vmLbJFUJ9dPc/+FoWdfY5yF3gMB238iqkXobTGUBQwXZXtQRYVdkGInu3n+kgrMDli8/nRjhxi7rNiLp49EeBtA8cA6FXID3T0/1QxYgH8W8j6ys+6e8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7MzhyP3; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7MzhyP3"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f7020a928eso12026447eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778796141; x=1779400941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYL53xr9VbkHoR2KiufjTPqDf0nioIqOELaxBTK6sfA=;
        b=a7MzhyP3LHVHBcuJVpsGOPYANjlk+0bMyZkpvz2ZJeRLDLGN6rYl+hRKsf0Aitnuo7
         BJNuErq8Jp8pTfOq2/ng3muhCXvh6rYj6dsTYhzSH3Xzf4IawzXuD8Uno91m5N3pS/62
         JZGSRswUBKhgmpi0XAC0TjojGa7wfk1AU85CLXu3UX6T+sKoi1OkUp+x5zJUiqBdG+RZ
         aCnHGrexbkvrKOsCr9NKmnO644tDXBLFqc1umj3XdU7G7DKYzuMhadKaS9m6VL/GuQjD
         5446PbCWGyoy+txUIlRvD8KpaZOMvE3Hu5Tbl6mOUcdozJ79qqFYlSsQnBUIv3nugswM
         aeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778796141; x=1779400941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYL53xr9VbkHoR2KiufjTPqDf0nioIqOELaxBTK6sfA=;
        b=X+5bS6WcoM4J0iIjWQ5aLGIE5L4CLwIDS+XRn2wb/BLReq4leptvOhjNwIcVYwZ+5l
         lanrnINpeiIFS+YYzALh5KzeL+/K6Di0OrT4EJ/J9QvJORuF2UQuquGOrMSihyzMHp8M
         z5k6Qh5BP9qgLbViwt0CaA1+mUuPczoXDbsZvUTiYQ0w2VOAHsEuwjlBtD9U2XA2UxkX
         ZU5AQNmKo/ASc9V1KQVZ1QeEPda2lzBAdBMw/pWJmcKacpiSoe/8CM8Xc7FUwfaW9LWT
         l28iJdFh4oIL3utYT3LgRhVR8eGvM29ZPiNu3hQpjLxtN7TRHOfiHbas3qkKBfmTP2g9
         q33w==
X-Gm-Message-State: AOJu0Ywy1jIt2FY7cDSXJ1mRI7yGIovc0z1On85adOv9ZZnQsMg7ii2V
	dbFw3Gi3Tk4h6nBRxHcFclBB4LEhz+kSoCj8ZKPDizT5N9JObUrO9qk5yKcrTg==
X-Gm-Gg: Acq92OFXnC6v4+i1oRO9l85jhg7kQc8QebDHZB/gyjWk50YNisdRrCjbykHqCP/FgyH
	4j1if1WWoFhOqghZmobtytXGPqwjekhgvO6cWGaWLf6Qcwq6wBNXzY6G8vWa17otvVB00EDVuaz
	wRxIRaqs/+zeC4EbWpBKEXxJ9/FlAzDjFQMNMYkgDyuIP0z5ps0hCNNbev8OzzV1mEvNv28nGBG
	9nM95Ph/P3Mc+Ln6jOu6GxMgUIKHERRu5kWTjqGuYh1VkRLd3B2Olm8/RPlbV0gpHExOeGY0bZc
	FDQunAXxOEch3sRGWmALbKs4sTBpZI+b0GPOAP1cNndJfsw53aule9rPdHFkTLWA/vZpKtiOPTW
	5sVZAtX4xaP56Gj1P61olJ2e42R8yXmcpDs3i8j1gnDL4yU+rA9ToFE8TTfNghaR6GhDeHlymft
	D/NGrPWSA6RGEFqFBCVB1byqORXXr+6iZOeGni
X-Received: by 2002:a05:7300:fd15:b0:2de:aafb:feff with SMTP id 5a478bee46e88-3039818b0b2mr661275eec.2.1778796141098;
        Thu, 14 May 2026 15:02:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm4605802eec.28.2026.05.14.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:02:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (lm90) Add lock protection to lm90_alert
Date: Thu, 14 May 2026 15:02:14 -0700
Message-ID: <20260514220214.1380831-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260514220214.1380831-1-linux@roeck-us.net>
References: <20260514220214.1380831-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

lm90_alert() executes in the smbus alert context and calls
lm90_update_confreg() to disable the hardware alert line, without
acquiring hwmon_lock.

Concurrently, sysfs write operations (such as lm90_write_convrate) hold
the hwmon_lock, temporarily modify data->config, and then restore it.

If an alert interrupt occurs concurrently with a sysfs write, the sysfs
path will overwrite the alert handler's modifications to data->config
and the hardware register.

This unintentionally re-enables the hardware alert line while the alarm is
still active, causing an interrupt storm.

Add the missing lock to lm90_alert() to solve the problem.

Fixes: 7a1d220ccb0cc ("hwmon: (lm90) Introduce function to update configuration register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 50b30d719225..6658c743659b 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2939,6 +2939,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
+		hwmon_lock(data->hwmon_dev);
 		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (data->current_alarms & data->alert_alarms)) {
 			if (!(data->config & 0x80)) {
@@ -2948,6 +2949,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 			schedule_delayed_work(&data->alert_work,
 				max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
 		}
+		hwmon_unlock(data->hwmon_dev);
 	} else {
 		dev_dbg(&client->dev, "Everything OK\n");
 	}
-- 
2.45.2

