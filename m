Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9F63A6B8F
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485906; cv=none; b=cXg2l1xmCSDv6MvGyN+a2eTHnXeFOsS99Mbqj7iBILPzAE96Lnu+DSU0ro0wKyYcJgRrOn2Z6/A0XIQZ7meFR7y6f04ajmoIeCU/JAbLZ/uAw6zS1LO1U2SWD5ep2d9hON+MAa7VuKh0ts+fJ9Ziqbcy9tlky6O+5lX3BEbQ3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485906; c=relaxed/simple;
	bh=Fvs4izgDZLwvwAFpe9E0YJJPp97a8WERWKXmnjgLvo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JC2fTG6Z2BETx4GkUB2knNbCNwzkwjGSSvfH6zxuTP32Bh7/8CnhJjhynBqBs4VxuZ7Y7i+pBMYrUWjs2I0xGs0wczneKYRo56h/GisEcDP7EkUQTuyitncv7tlTWRT3BJt37LBxEsrNWvBOX0cTas0Vtf4lNs3n+DY2fqvq730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FiA+3OKz; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FiA+3OKz"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13246950f3cso4660001c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485888; x=1779090688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8vyo3aKJz6kvSqhB3iqzMJn3n4LWS3lqwD60ofe3OY=;
        b=FiA+3OKz8MHV+zIZquC1f52TTRJWivm6pJK/TzvF5E1WCUXjFXznO8vIfIZUEoebrg
         Lv/2Fs5BXo/aRq7UZju72ei8giSI9FUKKbouSZy5V0Fgp4GdY/L9sM7ICrYeDZSUKZYd
         m09p3Gx0Vq1PliFDM+ymz9QZRO/mVQxO63w0oWeTn+PIQSBFogPsZPxZ3GO92/7IdIlE
         x4l5ETRB1h4tKg6zJ1IDvQThcmHIVC8cgxGh8xb2d2n9WeRGuVP6IW1Y53xliuixyVH2
         1UxcWazZetDiWIwUFqC6tKUzsfaCU2ZsTMomMZsPYRDtJw8MDJ/yx1g6WFWFgTk+mrGW
         Xb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485888; x=1779090688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8vyo3aKJz6kvSqhB3iqzMJn3n4LWS3lqwD60ofe3OY=;
        b=PiA+rJfdxwS5XNwEEuVX9dubslmqDdB3JSDzSSVJcqdu/tMvY9WRWE69aRc6cqXw/5
         YOxm5227RUZkI8B3Y4iBrKQNjfKL91Dn4v08AzVJyZuQyWmPgR6A2bfHhIRjWuocWHfh
         zKn1l4kzfj7NCoTfbPt72fGZUJZQqykzWIcKW8Q2p9rXspTE1OSRuZvNXnYOUR22Kpx9
         d9N0jtX8YiqCJt44RdG5U7pMNUdRh9Zbj0VrwBVovtO5yil7dBYeBuMJ8v7gnvVxyYoS
         DR4DzJh9C1dMxo2MWPuFtnIztSYLFyyvAk+/xdT9vRBTwYLGnMH/zHWu5Qth/ghkQ3eQ
         lKjg==
X-Gm-Message-State: AOJu0YylRtrf0MEPSpAyZ98AFItX4D1NK8hfOTYXaAB1jqzN61QmR1T8
	RFgqJB+RRKlmPZ0ttTGcInPNnGvGjZYGUrjxEsVuAKYdRiG0hXTqhdZtFP+AOBK2ubqM2qXcFO5
	VGgOxJiQ=
X-Gm-Gg: Acq92OFeMg4Q66C2NS9WgTTOsT9QXHaLnUWMGFS4ytARffL+1N5ZpiAP8VwtJebvXw0
	p0vCv7utVv1J+oRxLvNyqSO2cP0CtbRqghU4Tufb6WGMKGJm/K2YgZ1rQ4UyrVgIHLUMsyEsIvw
	S+qD32x0PSlAOw8Z+8XJ/0ZAxX2U/Mmq/CgvehCJ9yOYy+lcWimPQxBdqdSiblerbPKAO4qzVFf
	4OoyVej/03EYRzy23hHQghklMDe9HTw2rbpPUNfivvey7J6WJ0kgYzHeYZ8d1uREM4Ej+zDmdau
	R3j8OaEY1QoUJ/JM6RZdr6rHaygDwaZmyOTS+7eaVDzt+1qNV65e9UWHvjsVQC8WORIYumltYTt
	YfzY8IsOHdXpXPKZwBZQ/sK+VtEUZNHZjk1V4+QHQt2LUZ+drZfkLKo73eb18hC/skD6u6+iV3U
	fSA4RKY5Kd9UvjnPi4k7rO+hc9Cg==
X-Received: by 2002:a05:7022:2381:b0:11b:9b9f:426b with SMTP id a92af1059eb24-132a81d8664mr4496956c88.20.1778485887332;
        Mon, 11 May 2026 00:51:27 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:26 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:51:21 -0700
Subject: [PATCH RESEND v2 3/5] hwmon: (pmbus/adm1266) add powerup_counter
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-adm1266-v2-3-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
In-Reply-To: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=2726;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Fvs4izgDZLwvwAFpe9E0YJJPp97a8WERWKXmnjgLvo4=;
 b=PBeENLC9td927hNWKsmqwm5769GFt+CUkHzmLGWArXRD8tz/THMLZKlOEiPvb3UiJ5WTHh+pO
 xYg0EngFBRZCg7djMVmXMRaASxho+mQDEVoPimvIebvhLFKNvLX415I
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
(0xE4, datasheet Rev. D, Table 93) that increments on every power
cycle and cannot be reset by the host. Each blackbox record already
embeds the counter at record time, so the standalone live value is
primarily useful for matching a captured record back to the boot it
came from when correlating logs.

Expose it as a read-only debugfs file alongside firmware_revision.
The block-read returns two payload bytes in little-endian order.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 31aefa8fc75f..99e92a8365fb 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -28,6 +28,7 @@
 #define ADM1266_READ_BLACKBOX	0xDE
 #define ADM1266_SET_RTC		0xDF
 #define ADM1266_GPIO_CONFIG	0xE1
+#define ADM1266_POWERUP_COUNTER	0xE4
 #define ADM1266_BLACKBOX_INFO	0xE6
 #define ADM1266_PDIO_STATUS	0xE9
 #define ADM1266_GPIO_STATUS	0xEA
@@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	return 0;
 }
 
+/*
+ * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counter
+ * that increments on every device power cycle (datasheet Rev. D, Table
+ * 93). It saturates at 65535 and cannot be reset by the host. Each
+ * blackbox record embeds the counter value at record time, so this live
+ * read is mainly useful for matching a record back to its boot.
+ */
+static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
+{
+	struct device *dev = s->private;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);
+	if (ret < 0)
+		return ret;
+	if (ret != 2)
+		return -EIO;
+
+	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
+
+	return 0;
+}
+
 /*
  * Clearing the blackbox is required when the device is configured in
  * single-recording mode (BLACKBOX_CONFIG[0] = 0): once the 32-record
@@ -400,6 +426,8 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
 				    adm1266_state_read);
 	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", data->debugfs_dir,
 				    adm1266_firmware_revision_read);
+	debugfs_create_devm_seqfile(&data->client->dev, "powerup_counter", data->debugfs_dir,
+				    adm1266_powerup_counter_read);
 	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->client,
 			    &adm1266_clear_blackbox_fops);
 }

-- 
2.53.0

