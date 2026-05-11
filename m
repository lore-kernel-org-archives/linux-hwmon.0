Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA88355F3A;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474918; cv=none; b=JFPnNHRJvXIw92P8kvV0LTivyOLA3YsTDRoO6qKlcFftl9g3lBZcmCgFSGxJQbN6rMeGS19x2OjEXDvza/usWToXYqMIjJDeuAevYN5CJ9yS7qsMFszM4ByhX9JTqmx30qX66Tqc6t5CJCW06182fy+v38E5O/d5RSlj9jF+b08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474918; c=relaxed/simple;
	bh=nuDq6G7gm6QJxy32WG2Qe/bPDCAPB9vssEDwtKSqx7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZkykmUPGlMKipIpKMPQQJKgCTzvRGDRD9KNFS7isVpu9nf+4UQ37t7I/p1h2lLdXeQSim6K9EClvtS7cnx7T1XLxFaf1dPD/qfXWpHyQA5HILENj99FhiQAWs2hBaupbgVem5EPnozjCS6y/LnBK5fQ7553Srce2fbWQWFpQQqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyP0r8T3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyP0r8T3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F2CEC2BCFC;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778474918;
	bh=nuDq6G7gm6QJxy32WG2Qe/bPDCAPB9vssEDwtKSqx7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CyP0r8T3Tg10R7hPXG8M5HDH/x2RQlI/P3/Y2tA5oSGW1E/5yz5zx3qO8eRmGYhjj
	 XrCz2aZoWDkQQU9IIs2yjBDznfw+35AhTbfVHZHl8f7wsgzchEirZLvNw68RLNMjCB
	 yeU7AQsm+249dbmn98+T/eD7FHDN2/a+ivGVc6/6IkgpySyrBaGzsrcEVit42ttBRA
	 DEtCVmGvRn8UMGSKS0SHHrp2sutOiV3WTMrrGSxiu2jDfnWRsNrvNGevbaWI4fKI9r
	 SezEAN24+SVwYSQQzuc1g8No3lqe7xT5PJLiIZ6cZ2ENWsjcViopIVtTTap4pSmK2H
	 mXEXL5VkCIuaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381ECCD37B7;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 10 May 2026 21:48:10 -0700
Subject: [PATCH v2 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC seed
 with rtc_class device
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-adm1266-v2-4-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
In-Reply-To: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4478;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=4ibCJKgh5O0PlQIzarHRly8PpVR0ik1+YJcgF8LKXcQ=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZDHGL+UMLP8XKXzDPS2PU7T/hJqxqVLqkoNrbZtfd
 DNMvqa3cnpHKQuDGBeDrJgiy5xH/m/aOtoiNsQcsoeZw8oEMoSBi1MAJrLIn+F/rt71itWvv1XH
 Lb1fJqjfNrF7QVlGxPLVZ/Yd2n5mN99sO4b/6cFx2Ybimy9xVEwu+pRjHyBvudRUf8NTq8aZhYr
 r2R+zAwDp+0xS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

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


