Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897578;
	b=ZnubB3kKkhqs6MjqNp7cL4CcZvYnFdq3t/737aYnehRqwIn7Iejoh9emhvKsEzEpehug
	 vp2+acPGsIQc1E3tdkq3YeKEpKh/sI2oLPcrRCDebgYRHz0plujpNNNXLcD5Ke7Nb94Vs
	 /3ZOXzwCdCi9J/CwbWKGrzFfbYFZKFFTS+zjqDr3fZBS8ut+FSxK7ZSu+N5ayGmyzcYvs
	 TZBKJsQT34kTwQkv7aYMU/cFa1SwqaVTPTqZIRGfK96xOGR8iM5CFlZykZjLsZB8QFRdk
	 TgCuRm8wppIQjV58He83/rJBn4DHLKOOJZX7m/YyooIUwjesdQayHKBA+4dvpSPucDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
	b=Hsw2AJQYYAKGHW+fGfQjBJ7l5ffEty08jqZ5sjR9s0yipxLpDQB0bkyWIIiSKfYOtdCv
	 PSoHfJ0ZB5dRpmt0rrxe5YWgIiLb2flyO1wo3YblqCdlgF0zndBi/9ZeXoh84G6M4y7tW
	 7NRQrlbY2gHvnVScIRssZMwFm+Y/H0HdHtOnAneNle39N6z0V2dYKHP4jPEJyTnseynE3
	 67bgPRuGeAvsGHptuGWQI/qkmFm1PTBOHK0Yo2WnCIkVkPloEovPLd8AfDzUcpwEi2ZSW
	 QBApOD7Joa6nFrCNmDv41E7B1VDHRvQqPhFuoXtF21Yx4/b8BLPRgVNuCN2+iW3G+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sI3sci8P;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0E606A321
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sI3sci8P
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so1235384eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897577; x=1793502377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
        b=sI3sci8PU0LRbXzg9pnV9RKSt5pEesz1u3xPqqTfEF9W2neduMRDwC6nKr6nO7RYAx
         4SccFKxbd4j2G6559Hcgg6oQgVDeQojGC/SgpK0kDueKRFIbstaC91zBdoxg7pnjB9WA
         hzJ8cK0LfY4e61+dPYQ6uApB2CBafT6UolL8Mcz+2dpb/KJpwu65dAz5VBAVM1yPUxq7
         0uV83XlIeiSa4C7938vCjWJRq0QUi2TNQMduDgDeRvThLQWTmKuCb4b14+BFS9ksTfmd
         AskoiJ4tp6+3l4t1K2cI7QpXHD0Hx6bAYt/IdOYtTSOz0Zm0NzIA1ejVuMa1YXIbZ5ps
         q+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897577; x=1793502377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltpPctHcCv3D3mCQn85U0Am43143Q5d2LuJIwwGQgSA=;
        b=c5yMUES5n0Qlcq+c2uXDBaF1rPVRkg7tBKvXZEC0KF/ZdMf8pyUZPfy19SjgNIfwH5
         +zA8DTgiO9GL7Wfu+2YzEct9+MZmnHfEEWi5c6rLPfovuXx559+vL3tPGzJOYLoY9QV7
         m6qTYLzX9yvBkw5wopRVUPTKdUQVTILb/RbcimPI6WF1DquTa4cqNevfCKVLxdvJPNfY
         LoV9ErTdW73o76ebxmNtjUgwYkMc1jkKu8xHPuwy52woWNH6YD5ix4//il1iGMOOFdCr
         FcpZQz2k4fEDZ9ystU05oiUdQK0XwFY1T/h3ZbCIIrOXAon4U0iNZxeVXjQLoodWykr/
         7NRA==
X-Gm-Message-State: AFq9FYLzZsq2QGL2qkFu2DHwLDV28wyTs15T1TCXy4KjgqhWyglmFJGh
	ZTZW5Np3Gsj6wQxNQ3ADhOtDvIz5FKzJzKwLfkCHl0PRgVAxsIaCF1aW
X-Gm-Gg: AYBFou2sE5b2xWCH31i5hb7aJcW0YF8B3zBslxfYHAOJL6Q4bYKcuWVZMlN02ESHADt
	w+WRPeN8UHsCnFyNdTXJtmwwgZnTv9a/9v+IpT3V+i0welpPgAqyUSkdlQaW58sXPsQECABHYR5
	s4DbqlDmhU052ZT22e/scOxclAZds5yYLLh7euzos1x2fdGeUs1L0heQCKvU22yP4gtvrbv1xjm
	dboXB+OHIOww1NNW2IndhlZB0A0JXMG+SDE16XpFUWZR94KgFw7CY29QnyNrzU1kM022GCs05Ag
	p0VbJZ+c1jWuiFKoPiIEggUF4Nr8n/jBKT5rYiwFGEd1MnbJR+8H+ZWfMe6YVt0qbV/YoprHuB0
	XG9vp7xfrvMzaWbwKpbONc6QqAvkUcgr9S2N8KwLHkEoEEyz9Id3xdpqlk6ZtBiD/oJAi0sluPt
	fYsNnG3Plu/S0xQm03y1C0XdRlRZaI1gAudsYDqk4hK8M6HaNTmHQe98xnhq/WaNYg7sHy/ZjrZ
	gCLTZF2njH3uxeQml0XQzehCtxeTXQVWXeQRnBGIvrjhr2pvpub5eK2mJgvNu+T8Jl22SAAgPfP
	+zYb2bIJdniLfZU3fRz4jGvKey/tRmVw68kJRQzU0Io=
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr3001487eec.28.1792897577020;
        Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:09 -0700
Subject: [PATCH 06/31] hwmon: (pmbus/adm1266) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-6-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() and shrink the
GPIO read buffers to I2C_SMBUS_BLOCK_MAX since they contain raw binary
status bytes and are not NUL-terminated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/adm1266.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 22ccb721dd51..9f3b5bc9f3e2 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -165,7 +165,7 @@ static const char *adm1266_names[ADM1266_GPIO_NR + ADM1266_PDIO_NR] = {
 static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct adm1266_data *data = gpiochip_get_data(chip);
-	u8 read_buf[I2C_SMBUS_BLOCK_MAX + 1];
+	u8 read_buf[I2C_SMBUS_BLOCK_MAX];
 	unsigned long pins_status;
 	unsigned int pmbus_cmd;
 	int ret;
@@ -177,7 +177,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 	guard(pmbus_lock)(data->client);
 
-	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -194,14 +195,15 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 				     unsigned long *bits)
 {
 	struct adm1266_data *data = gpiochip_get_data(chip);
-	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1];
+	u8 read_buf[I2C_SMBUS_BLOCK_MAX];
 	unsigned long status;
 	unsigned int gpio_nr;
 	int ret;
 
 	guard(pmbus_lock)(data->client);
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -215,7 +217,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 			set_bit(gpio_nr, bits);
 	}
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS,
+					sizeof(read_buf), read_buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 2)
@@ -361,7 +364,8 @@ static int adm1266_firmware_revision_read(struct seq_file *s, void *pdata)
 	int ret;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 3)
@@ -387,7 +391,8 @@ static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
 	int ret;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret != 2)
@@ -461,7 +466,8 @@ static int adm1266_rtc_get(void *data, u64 *val)
 	int ret, i;
 
 	guard(pmbus_lock)(client);
-	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
+	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 	if (ret < 6)
@@ -525,7 +531,8 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
-	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return ret;
 

-- 
2.56.0.257.gf7497c7d27-goog

