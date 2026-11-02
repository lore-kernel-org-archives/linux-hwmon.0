Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659996;
	b=AOO3FQD1c/fmVhAD7WSuHRxt8j/zl810Pjh8kLV72ODSUdAYJ7vZAQ0xADALXaDiwmjO
	 WzR03tkyW+ooVSLOkWPX0brhp8G+ph+gnToPOTiPe+3UxxHYEiUVC73GoGqgZSaCw+9iT
	 UvxuaIxObw26gx3IZWjeiFsT2ChpIoFexTzzDe0hRIoBxpFJOPUow9tyLSDW3/Qi5CDvN
	 kWG9DzpOYo1f5yBggRMwW7t1cQF3i3B5EO/+4yD5/NAZAQP+PfA8aUPJWzU8eWaAQ+Jaw
	 gOOm30AeBwDmjWtGxT8GDzqm/f3in2S3/T/Q5eZJvhSrRc1XgzrkOsC6J7YSToX2NPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659996;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=P6iAjuScMdy5UUH3dZg15oIg5rNKZtG5PRkULSwlHxU=;
	b=dffh4F25DRE5G0R+Bvt4q/3C7aE+LR1+lefhv0qSp2d66yumwycojyY6I+ElFOvzsgnd
	 G3zfFf8TgNqqZKTiOnfbhVeAeoGzm8QosZW0f9/NOLm6Gns5si+N3U29Pnjwb9CFLNjS3
	 1Ec3UeG+yfp8D9NFRqelhATss4q8bvjfnHMlzG6rybH5L9fGL2lKxgE7YUofrNKMbJmkg
	 IN7FvbC3Z1bcv1OTH8Coegf1zX/oFuYqlDdQm64vmX+J+u3cujMbHk92EvrKaTh+UCoPx
	 cijIBNLiVWPL2tfMJ7SaT0m4JxbB4UEq7XbMzlLcEWwNRFmItfjdvMOJilu7SPjQULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=tBaxVClp;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F4606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=tBaxVClp
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id Nplkx0sn8JFmFO0twxAVzX; Mon, 02 Nov 2026 22:53:16 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tvxh5FBkE4RO0tvx95U4; Mon, 02 Nov 2026 22:53:15 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae9145b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=9F34hwUbuKtXVp5sFI8A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=P6iAjuScMdy5UUH3dZg15oIg5rNKZtG5PRkULSwlHxU=; b=tBaxVClpi3Pl
	vR+rPz+9Fct5erTa2vlO8MLQEtNF+CEd7KEr8OfmOyH3De7agKTepq2iqPbMQ0Kz+zLJ2NfGN/ZS2
	1vS89DPt57RwKHw5fS2TwHWmFzmAp3+6mPElilrgokEMzOlkZuKQTccN8oUkgvXl1pKJf2JKpnMy9
	tcC5DZ70tE2wvSDQSVquCastIlZxalMaWdFuu8tMiGfhywK9omiUxoPNZIMvC2ilQonAaIU5Pbv9c
	+eMQPOYI1Z9R8AmEgSbBLnrm8YvBwCCFOMKtaZXwpfmdv6Bic39QM2IX2RDQiW5qjxp1D2rD/LdDv
	x6iiFH0qx26JaweA01GVuQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52052 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tv-00000003kGt-0RXh;
	Tue, 03 Nov 2026 04:23:15 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 013/102] hwmon: (adt7470) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:06 -0800
Message-ID: <20261102225235.334487-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102225235.334487-1-linux@roeck-us.net>
References: <20261102225235.334487-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xO0tv-00000003kGt-0RXh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52052
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 38
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNX5k83smSNX9fDebGmhpsftKvpUX5GMTAhCv8SCnz2qqUDxi0/02KVC5I3rUmVbuF/jfNPX4CcsuXt+jiEHkwUBhSH9sAQaQodhD6AqAXADtqwNy/jX
 hFFHNYxk+9BiuQYmbCbzBSAZGIlV5h6U6JinRhmfLU873YUIZSvyt7Du6jvisd6WsY2ZHqhtzDJZ3Gv/ArB90pxuBy48y/swKZm1y+XOlj/X5lH6td8KuGUt

adt7470_update_device() uses 32-bit jiffies and time_before() to decide
whether cached sensor and limit values are still fresh. On 32-bit
architectures, if the device is not polled for about 24.8 days at
HZ=1000, time_before() wraps around and prevents further updates.

Convert sensors_last_updated and limits_last_updated to atomic64_t and
use get_jiffies_64() and time_before64() with smp_load_acquire() /
smp_store_release() on the validity flags. This avoids torn 64-bit
timestamp accesses on 32-bit systems while preserving the lockless
fast-path so sysfs reads do not block behind adt7470_update_thread()
while it sleeps in adt7470_read_temperatures().

Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7470.c | 48 +++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index f652532f2f32..1e216e6598d4 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/atomic.h>
 #include <linux/module.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
@@ -165,8 +166,8 @@ struct adt7470_data {
 	struct mutex		lock;
 	char			sensors_valid;
 	char			limits_valid;
-	unsigned long		sensors_last_updated;	/* In jiffies */
-	unsigned long		limits_last_updated;	/* In jiffies */
+	atomic64_t		sensors_last_updated;	/* In jiffies */
+	atomic64_t		limits_last_updated;	/* In jiffies */
 	bool			use_pwm_framework;
 
 	int			num_temp_sensors;	/* -1 = probe */
@@ -463,44 +464,59 @@ static int adt7470_update_limits(struct adt7470_data *data)
 static struct adt7470_data *adt7470_update_device(struct device *dev)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
-	unsigned long local_jiffies = jiffies;
+	u64 local_jiffies = get_jiffies_64();
 	int need_sensors = 1;
 	int need_limits = 1;
-	int err;
+	int err = 0;
 
 	/*
 	 * Figure out if we need to update the shadow registers.
 	 * Lockless means that we may occasionally report out of
 	 * date data.
 	 */
-	if (time_before(local_jiffies, data->sensors_last_updated +
-			SENSOR_REFRESH_INTERVAL) &&
-	    data->sensors_valid)
+	/* Pairs with smp_store_release() on sensors_valid. */
+	if (smp_load_acquire(&data->sensors_valid) &&
+	    time_before64(local_jiffies,
+			  (u64)atomic64_read(&data->sensors_last_updated) +
+			  SENSOR_REFRESH_INTERVAL))
 		need_sensors = 0;
 
-	if (time_before(local_jiffies, data->limits_last_updated +
-			LIMIT_REFRESH_INTERVAL) &&
-	    data->limits_valid)
+	/* Pairs with smp_store_release() on limits_valid. */
+	if (smp_load_acquire(&data->limits_valid) &&
+	    time_before64(local_jiffies,
+			  (u64)atomic64_read(&data->limits_last_updated) +
+			  LIMIT_REFRESH_INTERVAL))
 		need_limits = 0;
 
 	if (!need_sensors && !need_limits)
 		return data;
 
 	mutex_lock(&data->lock);
-	if (need_sensors) {
+	local_jiffies = get_jiffies_64();
+	if (need_sensors &&
+	    (!data->sensors_valid ||
+	     !time_before64(local_jiffies,
+			    (u64)atomic64_read(&data->sensors_last_updated) +
+			    SENSOR_REFRESH_INTERVAL))) {
 		err = adt7470_update_sensors(data);
 		if (err < 0)
 			goto out;
-		data->sensors_last_updated = local_jiffies;
-		data->sensors_valid = 1;
+		atomic64_set(&data->sensors_last_updated, local_jiffies);
+		/* Pairs with smp_load_acquire() in lockless fast-path. */
+		smp_store_release(&data->sensors_valid, 1);
 	}
 
-	if (need_limits) {
+	if (need_limits &&
+	    (!data->limits_valid ||
+	     !time_before64(local_jiffies,
+			    (u64)atomic64_read(&data->limits_last_updated) +
+			    LIMIT_REFRESH_INTERVAL))) {
 		err = adt7470_update_limits(data);
 		if (err < 0)
 			goto out;
-		data->limits_last_updated = local_jiffies;
-		data->limits_valid = 1;
+		atomic64_set(&data->limits_last_updated, local_jiffies);
+		/* Pairs with smp_load_acquire() in lockless fast-path. */
+		smp_store_release(&data->limits_valid, 1);
 	}
 out:
 	mutex_unlock(&data->lock);
-- 
2.45.2

