Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660243;
	b=ufIVXfRrV+J9eJ9g7H7C78OvIjMk2F1s/w1hpbcR4XcJX+U1fNiMWIU0PtNzJBzML7gj
	 yIKnIs/kE6GXmrwVh0PXm7AmWisxrQhvBZE8uBTbSyA6KUxhtU9GDKwddNqZMgOLR/NuY
	 2rkCzqXCPTL24i772FK+AXs4vlo9HT2MNsB3TvGoWZrgUzXWwg6kyaYxj2DZ8IQfc5UuC
	 3OxKZnj1dsReZriAG6ExgD/xQ9zOfHfLrimo4NZj0ZvqJuwBd5m2RpjVe3YwRPAiU5fcb
	 sKUzqD3QeK+amDCE9qDnNYEWV7C4KZduX58FHQXvI2MuUaYRGelxnaWFVPKvxkdya2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660243;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BX27ICsdlA/FHhfLPmge/+FsiqgAClq7A/aZSLjuZAI=;
	b=gSdmIvvOhPDIej4yhATYEYEUByACN5U4YyfFX3MHuieulwhZfr2hr3IRQA6SO35kURso
	 2pp4ErmDqWpJ+eUXtJr9mKZKMxFdxoxSWecHeCScMnAnMiRv9zqtM8U2H9mRXJhbco82/
	 GKNpCxYiTRrtkHiU6H49dZAFKo6SmCj+YETvBrY01mEA5lEjVN1Hi1nrJcRX35kPkmv7E
	 QV1ZESYdfZLN0i3b1mkmV4l9RbjC4XpjwfqpfJ1cvKo2UxN1aaD5xdC8aBvMkv8X/ivwq
	 CkrRYoGusVOg7HxuJCnJOeBX5dGleT2YvalOnjK7Mh5K6KQCRbtDp58mdUedW3lMR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XK+7ZGJ7;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACC606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0ACC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XK+7ZGJ7
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id NycUxGznUaC0UO0xuxX1ag; Mon, 02 Nov 2026 22:57:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xuxTo8J1fkWO0xuxuvqr; Mon, 02 Nov 2026 22:57:22 +0000
X-Authority-Analysis: v=2.4 cv=CLMqXQrD c=1 sm=1 tr=0 ts=6ae91552
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=n1byx4hRERA631oDKqMA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BX27ICsdlA/FHhfLPmge/+FsiqgAClq7A/aZSLjuZAI=; b=XK+7ZGJ7Vw/H
	mmyR9j0tYjrTS2nrTgZVyaosLTln5nvsvZmtniLwQbk/1QqwQx8V9p6Ib3RzWLhEbNVtEkuVhVcZS
	j5pla4sFHbESWgFVUIW0BhwmQa5D/tICS/s/R6G3Hjy6DVRKsTG7QgbxwJQQSOcQER7dfYyGJKCdE
	fcyRfYrXi5aY7pKH2kNs5pGPEgOvcsRoUUEKTpDWAMX25kAaiaMXAV4XQ90gSqZ8Q6xlKtwd3j+C9
	Ori7tSzQSKQpJWCu1EdS6h2Zq/wIYAakQSL/iNiCxajrEYFNYe7jLz6WdBwTJ8KGORMUJ4RlafQYU
	JVA74xZ+NZy+MC1IvbD3wA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55026 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xt-00000003nYF-3iwy;
	Tue, 03 Nov 2026 04:27:21 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH 102/102] hwmon: (asus_rog_ryujin) Use ktime for pump source change timestamp
Date: Mon,  2 Nov 2026 14:52:35 -0800
Message-ID: <20261102225235.334487-103-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xt-00000003nYF-3iwy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55026
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 158
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNI2A0Wmws9fmVOnpTx9JyQo3O1L6MHFSFMjBLWCsdVDoV3sTUCJxFfHiDJYO/63mw9Lrq3ru7/md64FJOl/ll/Bdpl8aUjJlWTjiZ7ztQbXHyZqTg9u
 iMYnxvPPRdeJ8q8nQ/uXXQ4WyEDVvCa/pQJPDuJlCG2svK9OksG0hwMS2N2TDB9Pm5yvD61j5d4b+dVWyXARBhuOLFUcFIhgGpJZ4X6YlYCo8SyZihdYgWAT

rog_ryujin_write_cooler_duty() tracks the last pump control source change
in 32-bit jiffies (priv->source_changed) and computes jiffies -
priv->source_changed to enforce RYUJIN_SOURCE_CHANGE_INTERVAL (1000 ms).
On 32-bit architectures, jiffies wraps every ~49.7 days at HZ=1000, so an
unpolled source_changed timestamp can falsely appear recent after
wraparound and trigger an unnecessary sleep.

Since RYUJIN_SOURCE_CHANGE_INTERVAL and RYUJIN_SOURCE_CHANGE_TIMEOUT are
defined in milliseconds and the driver already uses ktime_t for status
caching, convert priv->source_changed and the source-change polling
timeout to ktime_t using ktime_get(), ktime_ms_delta(), ktime_add_ms(),
ktime_sub_ms(), and ktime_before().

Fixes: 054395a539cd ("hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_rog_ryujin.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 34b1150520ca..c0d2f9463220 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -134,7 +134,7 @@ struct rog_ryujin_data {
 	u16 speed_input[6];	/* Pump, internal fan and four controller fan speeds in RPM */
 	u8 duty_input[3];	/* Pump, internal fan and controller fan duty in PWM */
 	u8 pump_source;		/* Pump control source from the cooler duty report */
-	unsigned long source_changed;	/* jiffies */
+	ktime_t source_changed;
 
 	u8 *buffer;
 	ktime_t updated;
@@ -340,25 +340,25 @@ static int rog_ryujin_read_string(struct device *dev, enum hwmon_sensor_types ty
  */
 static int rog_ryujin_write_cooler_duty(struct rog_ryujin_data *priv, const u8 *set_cmd)
 {
-	unsigned long interval = msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
 	u8 source = set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET];
-	unsigned long elapsed, timeout;
+	ktime_t timeout;
+	s64 elapsed;
 	int ret;
 
 	if (!priv->info->duty_channel || source == priv->pump_source)
 		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH,
 					      &priv->cooler_duty_set);
 
-	elapsed = jiffies - priv->source_changed;
-	if (elapsed < interval)
-		msleep(jiffies_to_msecs(interval - elapsed));
+	elapsed = ktime_ms_delta(ktime_get(), priv->source_changed);
+	if (elapsed < RYUJIN_SOURCE_CHANGE_INTERVAL)
+		msleep(RYUJIN_SOURCE_CHANGE_INTERVAL - elapsed);
 
 	ret = rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
 	if (ret < 0)
 		return ret;
 
-	priv->source_changed = jiffies;
-	timeout = jiffies + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_TIMEOUT);
+	priv->source_changed = ktime_get();
+	timeout = ktime_add_ms(priv->source_changed, RYUJIN_SOURCE_CHANGE_TIMEOUT);
 	do {
 		msleep(100);
 		ret = rog_ryujin_execute_cmd(priv, get_cooler_duty_cmd, GET_CMD_LENGTH,
@@ -367,7 +367,7 @@ static int rog_ryujin_write_cooler_duty(struct rog_ryujin_data *priv, const u8 *
 			return ret;
 		if (priv->pump_source == source)
 			return 0;
-	} while (time_before(jiffies, timeout));
+	} while (ktime_before(ktime_get(), timeout));
 
 	return -ETIMEDOUT;
 }
@@ -703,7 +703,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	 * a special case there.
 	 */
 	priv->updated = ktime_sub_ms(ktime_get(), STATUS_VALIDITY + 1);
-	priv->source_changed = jiffies - msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
+	priv->source_changed = ktime_sub_ms(ktime_get(), RYUJIN_SOURCE_CHANGE_INTERVAL);
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.45.2

