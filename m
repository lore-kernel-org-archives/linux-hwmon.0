Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025537A494
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612210; cv=none; b=HY/eOIViBPjX2mJOrtyrKPw0gmVTN6cTFT0jMCkjObGncUFY+kPujYqs+G5JO3btNCbveJ0j+5Yu6RCaFmE1z4ji2lQHk8ig6zd2rUbeSkOn/gCZMs7lHBHgLlGhMNaMcbzcHQbwIhXWdwOkGCGcU7LGZ2rWYQqquiR65whVah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612210; c=relaxed/simple;
	bh=oftjZyGkhQBDX2v08GDqVOkG+JBpp/Fv7uQcMQZZ2lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAJr7FCGQPEatBnn6106X5GS1kRE/HdNWZIfqAZt2qFRS+tj21T+fKq6WM4nkSYRuiAcClP/WEHt89cUFISzqjHQtmuMmCZKlLiy+MoxmgxYIV8iX7KZrgZwIgvTCLKp5NU40hKDrW3BILdMk+kv1s+zP5oxzV3esao7mfo9J9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hA5A/COd; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hA5A/COd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7823162eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612208; x=1779217008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gb5dpzhIGZxf8OHmmRVMCTs+SemyL2u/4eJnpZoxaHI=;
        b=hA5A/COdV3ju+V6zG8oDLPaYWb/27/QGTwOXpfgeqircWUYsftcT8qF4Jn1pWyhFqO
         yHq0RqUEP3ZMPtmhg5NyOKTilXbTEbokWVz7eNxtgyw0aQLG+Ioe2Hd3qwmCUFgos+F+
         PuBCLKpKCHe8is3MZOD9hJrkXvviinDql54sfj1NegXKajsgCZCU92irIv+lmWojw0TX
         t5yHw7FKhl8is9JQBtPA6WNP5xVp1eXl8E+VWz8RfCOd1A8Q/QA9E7uVlUqEPWyZ0JUR
         UkEQEnw5sSkRXiyotwVIAAVDMK11c+Y/xgKYV/RpQL5AnhbGT4b2kdnlchjeOO5abJGD
         f8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612208; x=1779217008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gb5dpzhIGZxf8OHmmRVMCTs+SemyL2u/4eJnpZoxaHI=;
        b=epEoSUMEv6qgSJsixljxEvos5SXj+AJVuS4khGSXxF2IrUafD6Tr/O7WHNpqsPT2LO
         HAKt9C+OYNsHSxoNP9XVIQeHDuqXnsfH/hw2CntqVjiFodbAuaP/jpQznmxOZp+TlycY
         0WjnVzlmln0Z/AEkxH3Sf38r3Kau85f7tSb+BtT2tFCLbnfs0Esa8T+uNK3qn5gGJKVe
         mrA7ONpdgzUAWbS6/WS4HEtJGzb/PnA10IB0yuen7oyzqFAD3T5ezZ3+1ddpRosXCPny
         qBpyfYYAyeW6hcTEaZimlSxGk/bZPhnqBm/HaaOu0Q07eILK7OV68DQp4B0/5Qf9f9ET
         +tDw==
X-Gm-Message-State: AOJu0YzQ6nyVg6usv3+472oKQ8UneQyzk6VQ7MCfJXSgbN+O1eQ3vXgq
	5ZQ8OO1EPbkM8joiM1S79vzKYSSuHUbwEinVHahEA8SMleNaRbf+vmh6+PiwQE/eyeLsO5dcwjH
	w7nnYxYo=
X-Gm-Gg: Acq92OE16hRAPX+v2aKpuwkBKzJX7iCwxADrueehJG67OgPpuco45aBc7oA23VZBmyA
	Yn4sPAKmFG6ALR9GpuQO8Kqk+Ju5v0DZE3yQXEOVKGyyz4b3THUZE7b093upjK54bmbkLGcYAp+
	IiDNiAN6PJwcOaDibLcKVpZZnhYpiwVqHvB+nBrb3bNe2tcg1LP/+7UCe0BGLHQfz9e+IgbLjRj
	F8ZNX27GT6q4vdf+LgglZbEv+rVWv3F8OxMabbur2gWpG0J6NTdiPVlax2tkZ05Rz9UrOajlBKO
	eCOA0Loee6a0FU49iEnOXZKw3W3pQfjvMHSWM+yb1GDkgnZYKF9K377AstQRsn+wSuco+z4U9z0
	0+9ybrYqRHTdl3PO3rg+NdYa3JiOSU8yR9Mt6QaRBqWpqJNb3N+WVgveSj2bYVWwuLK/EGiAWni
	HS5w2Q5wuKzK1hcjxCyMmzZS5tcg==
X-Received: by 2002:a05:7301:198c:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-3011747e13bmr215063eec.11.1778612207625;
        Tue, 12 May 2026 11:56:47 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:47 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 11:56:27 -0700
Subject: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC seed
 with rtc_class device
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
In-Reply-To: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=4804;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=oftjZyGkhQBDX2v08GDqVOkG+JBpp/Fv7uQcMQZZ2lE=;
 b=JSKpW7WLsk5TEz/ZxeflWJGTY4p/N4p+7uQHNp+tD5g3sAmELpBawgpQHePPHcBttpG8zIrvh
 T6D2Dm72+AqBazkpK/nYytcHJIrrnAimZ8IkxzuDMquICGbIMDO1Ekf
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The driver currently writes the device's internal RTC at probe with
ktime_get_seconds(), which returns CLOCK_MONOTONIC seconds since boot
and is not a wall-clock value. The resulting timestamps embedded in
blackbox records are therefore meaningless across reboots, defeating
the cross-reboot record-correlation use case the field exists for.

Switching the seed to ktime_get_real_seconds() does not actually fix
this: at probe the system wall clock may not yet have been set (no
external RTC, no userspace NTP), and seeding unconditionally also
clobbers whatever valid time the ADM1266 retained across a warm
reboot.

The data sheet (Rev. D, p. 22) recommends "frequently send the time
stamp to the ADM1266 to synchronize the UNIX time and reduce the time
from drifting" when running on the internal oscillator. The clean way
to expose that policy is an rtc_class device backed by SET_RTC, so
that userspace tooling (hwclock, chrony, systemd-timesyncd) can drive
the re-sync against /dev/rtcN once it trusts the system clock - with
no driver-specific sysfs ABI.

Drop the probe-time seed and adm1266_set_rtc() entirely. Add an
rtc_class device whose ->read_time and ->set_time callbacks read and
write the SET_RTC frame. The rtc_class API is second-precision, so
the SET_RTC fractional-seconds bytes are always written as zero.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 78 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 080e7dbd0c06..05b31bb08f38 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -18,8 +18,8 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include "pmbus.h"
+#include <linux/rtc.h>
 #include <linux/slab.h>
-#include <linux/timekeeping.h>
 
 #define ADM1266_IC_DEVICE_REV	0xAE
 #define ADM1266_BLACKBOX_CONFIG	0xD3
@@ -517,21 +517,73 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
 	return 0;
 }
 
-static int adm1266_set_rtc(struct adm1266_data *data)
+/*
+ * SET_RTC frame layout (datasheet Rev. D, Table 84):
+ *   bytes [1:0] = fractional seconds, LSB = 1/65536 s
+ *   bytes [5:2] = seconds since 1970-01-01 UTC
+ * The rtc_class API is second-precision, so the fractional bytes are
+ * always written as zero.
+ */
+static int adm1266_write_rtc(struct i2c_client *client, time64_t secs)
 {
-	time64_t kt;
-	char write_buf[6];
+	u8 buf[6] = { 0 };
 	int i;
 
-	kt = ktime_get_seconds();
+	for (i = 0; i < 4; i++)
+		buf[2 + i] = (secs >> (i * 8)) & 0xFF;
+
+	return i2c_smbus_write_block_data(client, ADM1266_SET_RTC, sizeof(buf), buf);
+}
+
+static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	u32 secs;
+	int ret;
+	int i;
 
-	memset(write_buf, 0, sizeof(write_buf));
+	guard(pmbus_lock)(client);
+	ret = i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
+	if (ret < 0)
+		return ret;
+	if (ret != 6)
+		return -EIO;
 
+	secs = 0;
 	for (i = 0; i < 4; i++)
-		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
+		secs |= (u32)buf[2 + i] << (i * 8);
+
+	rtc_time64_to_tm(secs, tm);
+	return 0;
+}
 
-	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
-					  write_buf);
+static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	guard(pmbus_lock)(client);
+	return adm1266_write_rtc(client, rtc_tm_to_time64(tm));
+}
+
+static const struct rtc_class_ops adm1266_rtc_ops = {
+	.read_time = adm1266_rtc_read_time,
+	.set_time = adm1266_rtc_set_time,
+};
+
+static int adm1266_register_rtc(struct adm1266_data *data)
+{
+	struct rtc_device *rtc;
+
+	rtc = devm_rtc_allocate_device(&data->client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
+	rtc->ops = &adm1266_rtc_ops;
+	rtc->range_min = 0;
+	rtc->range_max = U32_MAX;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static int adm1266_probe(struct i2c_client *client)
@@ -557,10 +609,6 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = adm1266_set_rtc(data);
-	if (ret < 0)
-		return ret;
-
 	ret = pmbus_do_probe(client, &data->info);
 	if (ret)
 		return ret;
@@ -569,6 +617,10 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = adm1266_register_rtc(data);
+	if (ret < 0)
+		return ret;
+
 	adm1266_init_debugfs(data);
 
 	return 0;

-- 
2.53.0

