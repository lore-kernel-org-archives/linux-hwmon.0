Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9B3AA4F2
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485906; cv=none; b=lyMl+oarbZ5YzHrCAfwNscjEl4i20ddmmbmGdNUZ7bXgOc0kmjP/MMDQG/ApnVmzgwURlJrhV3KI/RROctOPvbn9PMZcQ+kLaG1uUhI7kb00PafbzGtAp5+Qr1T/5WGSMmWP52me+r5n3Xke7q/jNqoc0Jm8r9PJMzsJTokUZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485906; c=relaxed/simple;
	bh=4ibCJKgh5O0PlQIzarHRly8PpVR0ik1+YJcgF8LKXcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMyJQQ7omqD6DWq8wZBwD7QtQTv+j1q0Cd0XkSKfIZKDchb6sIausCyU1hRxUGcigArJ7W+NfgeoIH2YFBnTpDBmVlW3W2R88gotZI6H2nBK2i4m+YvShn71EADZV4vivMPsSsg3JAf/+IXAux/deppsZX/QKLpfX9DgCLRD7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=dru2DOmx; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="dru2DOmx"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ee990e8597so7084568eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485888; x=1779090688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOMLJB4Oh7xtGNEINQHb/KOg6mgGsuMaGDF24hTcF4o=;
        b=dru2DOmxZbt/rBepApbb+Dm+/+I4wkfqSOkm4CCvDDlw0chs1XiRX8ObqjVv5MEz6j
         Dc/V4bOQoRXs0rS6pwL22+lwUfDpDlzSCXRUMuWqD9+Obv8b7QHGugsDnc+1TXAtUv8N
         W6bVeUyCgpZcGc1sfWZljx05+Uw8fDGmRyq0davN/AnjKsl6idEBKPfvhHpJxR6Ky9hr
         +58owaDk8wweyBG5ORgF0ry/4zACD0Uk/uN85Fhqu1CzBNwSHq5MrpasdAFTDhH0MmOh
         Jv1faExq07NuIKeLume/xAIjDiQiKQot7Nk8xRPMogFU/wiXu1RPJFprf4nF4R1AUCc5
         gUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485888; x=1779090688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gOMLJB4Oh7xtGNEINQHb/KOg6mgGsuMaGDF24hTcF4o=;
        b=nKLSsAihgDHhdnScLgHd82ndmPu136ZQP/gfG/3RH44kQ0r6ftLdmpqDeAYzAZgcz9
         YcZJvaq8McOefNnxUrUWcbNfA7rnkhKGQ/+09xIZ8vd+gPsiJiNw9pQ+ztaO/AUmpP/j
         ZN/NWV1/DFq4ZQsiQxCdL4P7xahyWZgIu4HUmOWi7ZtoR1TwP+RHoSsPOhp/bknQIHgf
         eTD6VDR12tAdk1Q5mHAE6t/etoQ6sPTsEmBemsoQFt5x91Ix+Y3eMl3O9wM6kJxm+LUj
         apU9sT5YAHfAz20sg6RboShYoN3qKyAhiKw2zr7Td8LHes98Gnz98u+WJJFmM2c6xiAm
         fHyg==
X-Gm-Message-State: AOJu0YxJm9OgZl6piK+UXaTkHFQ0AXV+nhVmXbvcizgXPkfaOrh9L0i0
	K3nSIWT0GFyudwDVPAwbNNMP/PLn4svpq6WHK3EQxFGECS6j/9SbFd0/cp55f96q4PA=
X-Gm-Gg: Acq92OGMNn8qYdnaB12y/qiUuoTNzD2eKL5rP6zmo2RxYvvWN5BNF3SMVUBe+kBQakX
	vilYkgDiV3lq69dncRgRsrL78XqyuMkyIJSG0b9QMghAdGS7sJiOsEhHRMNt5sUn6n1PkBXjxof
	hmsCAnIer5Q//pgGeL6gJQjPpxpRtt1mNbg07df5gOZ/5Ij/hTP2mbDrhLzjZJrBhS2MGM2WkY8
	3qHfDHos1g4puTrFVQ8VeltRKMqfu6xfPhyK8YRjctd6YHqYowe+N4WVSs03YiEHWrt9Ij9WTXQ
	ciP1Nrho9T3JWZTczElp0D7NBXuWiTcl/4s3/b03AmlR7ceUA3B+Hx7FiktCjXreWV+BOHt9TmM
	ZLDArwbpr3nvkX8pdfLj7KsKIWeZtGQD0gNhk0P60AKXH9cq7S2plETbaH9vB8JDXx7tNSLBa0/
	dL+sXTL02vR/ATf3nhPzNwR/YHmg==
X-Received: by 2002:a05:693c:2c01:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2f54b265a7dmr11730370eec.23.1778485888037;
        Mon, 11 May 2026 00:51:28 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:27 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:51:22 -0700
Subject: [PATCH RESEND v2 4/5] hwmon: (pmbus/adm1266) replace probe-time
 RTC seed with rtc_class device
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-adm1266-v2-4-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
In-Reply-To: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=4478;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=4ibCJKgh5O0PlQIzarHRly8PpVR0ik1+YJcgF8LKXcQ=;
 b=ETLsCjM6H4EMaCozDZLBwrdM/ijhzzcc38skjIZYng0g5ME3hk6FcDI+ofaNo9bzLZ8FSJDwv
 RyvPs1Q4UI7CsFu4ZIz7XnG9ONonKq1lMoV+ugVjX2nlH3hls/JeE6B
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
 drivers/hwmon/pmbus/adm1266.c | 70 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 99e92a8365fb..0dfb02db8683 100644
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
@@ -513,21 +513,71 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
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
+
+static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
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
 
-	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
-					  write_buf);
+	return devm_rtc_register_device(rtc);
 }
 
 static int adm1266_probe(struct i2c_client *client)
@@ -553,7 +603,7 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = adm1266_set_rtc(data);
+	ret = adm1266_register_rtc(data);
 	if (ret < 0)
 		return ret;
 

-- 
2.53.0

