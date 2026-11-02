Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679141;
	b=KcFiR53q6y+s/25Cpa4TvTFKUKE6eQGhtH76XWTz0E8XVJ/NMJQYaOlk5F3KZPmZO/tf
	 lOiiRTG70rOvtPRwzay7kbJCMeQHYdWk32engdxMWItpLUFrVQXUdGnbJ/4qhTHP+Zprg
	 MONyjux67+ig5hrMIuMT2QNwU/n3iSPnzxITMQ2OmPmyxRp+47I2IoauDuHT4qMksJ87b
	 qKggI5ErQRxfLAa6OGJWpz1S587ht1KrGJlf6ocmXPpO5WLj7Brb0Tx65rkK/WbMXFFY6
	 x6BgxdTv/HI5gGZKwW2Z7aa/kWTkZAcK+TgP8oE2swx3qOd3tBU5lTmd++k/pT8SfMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679141;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=LoP1nm+wtK92U1mRaR+8qZdl0iB22faRIEkDfJ1/WAM=;
	b=dSCZ2ZwPxRPEDCJWAjsVI1iBWuq0x7sVEMG+sogcW83+1Rms94ubiuagYwg4FL10Lxgz
	 hVewQo3jyl829OD6lDx39FYpvOYT22YT77Cl/M/3Q3OwgdfqNDIGT2f32gHYeCgz2pvKi
	 2UWPKtKKuUHygyk9aDvQu71pJIR4hSvew1o8QDZE3fqFvCbIgtB64KtOwtjw0WVXkMHEr
	 uT5FvxmSzDe6W0tiNFyw9Cfpi/RsCV+eq5nFU36zhE4i2ZPLWP1LUbG5U5ER/AztiihlR
	 ndLXs7xonkTB/RRrjXYiUspjH7F7YVLXFkYEmAJ17acs2Rm4Odn63jvOLJwAZApoJeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f4MmSN8d;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ABF606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 04:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46ABF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f4MmSN8d
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id O2sdxHn5LaC0UO5sixYUsA; Tue, 03 Nov 2026 04:12:20 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O5shx1e8jNSXiO5sixJ4uG; Tue, 03 Nov 2026 04:12:20 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae95f24
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=XIwaYd1IxY5mdtdSnuIA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=LoP1nm+wtK92U1mRaR+8qZdl0iB22faRIEkDfJ1/WAM=; b=f4MmSN8dHNLq
	Zo+E3PpE+3Dvy0W7IgFMS/BZ6qmAXNys2IPoaH9Dm9n88mPeJdQpBRPMuJvquOKUTAP/kYhIasRA5
	blHUID1Aokya4ikghHI2pxGxCj19ZH9rI1uc8BEqKh+tmaw4hfH2R4DLAaFV3fBlcNYnAmuJpeTtf
	mvYSSm2HHE3r5r9iy5r+YFzWrZm94sr441Urmo184Xi9CMAdMQXPqZmHxWCpxm+99gf9KBRroVthr
	pyLnaUyAnQvL2VJeFphRV+QWJor1vMYNSndRqMGyJUDIEbpvC9LduwjUkB7enx6x8kAofLVZrBXfM
	x/jF5h3nsA2lDiU8Y4yPDQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37828 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wL-00000003llb-3cSQ;
	Tue, 03 Nov 2026 04:25:45 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jonas Malaco <jonas@protocubo.io>
Subject: [PATCH 067/102] hwmon: (nzxt-kraken3) Use ktime for status report validity timestamp
Date: Mon,  2 Nov 2026 14:52:00 -0800
Message-ID: <20261102225235.334487-68-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wL-00000003llb-3cSQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37828
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO7+MlcwXmkopwyc+3SLNHAonOKrWCKjGtDP0rpf5GF+FgVUnmEEEJsOLRsOE8hAoF6fTpdsyS5qQuAuIlcNm4kQIu9HjYSzWeHPpybfiRTV1rCBDtym
 JN/CXS3kfhimOR4N2UBTq/XuIOEt5GWGXmQywLrTzT4NgRMnc19kHJGZ4Q19HcUkvcA0TWF9E6IjjkmQO+AgxmfKVTxH2VOEQBukx1P0P8qhnHMxayXXlOay

nzxt-kraken3 uses 32-bit jiffies and time_after() with a 2000 ms
validity window to check whether status report data is stale. On 32-bit
architectures, if status reports are not updated or polled for about
24.8 days at HZ=1000, time_after() wraps around and stale readings are
treated as fresh.

Convert updated to ktime_t using ktime_get(), ktime_add_ms(), and
ktime_after(), and serialize 64-bit updated accesses using
status_completion_lock.

Fixes: f3b4b146eb10 ("hwmon: Add driver for NZXT Kraken X and Z series AIO CPU coolers")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Cc: Jonas Malaco <jonas@protocubo.io>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nzxt-kraken3.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index a185e8b27532..02703741f1e5 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -14,6 +14,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
@@ -105,7 +106,7 @@ struct kraken3_data {
 	 * was processed after requesting one.
 	 */
 	struct completion status_report_processed;
-	/* For locking the above completion */
+	/* For locking the above completion and updated timestamp */
 	spinlock_t status_completion_lock;
 
 	u8 *buffer;
@@ -119,7 +120,7 @@ struct kraken3_data {
 	enum kinds kind;
 	u8 firmware_version[3];
 
-	unsigned long updated;	/* jiffies */
+	ktime_t updated;
 };
 
 static umode_t kraken3_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
@@ -248,6 +249,17 @@ static int kraken3_read_x53(struct kraken3_data *priv)
 	return 0;
 }
 
+static bool kraken3_is_stale(struct kraken3_data *priv)
+{
+	ktime_t updated;
+
+	spin_lock_bh(&priv->status_completion_lock);
+	updated = priv->updated;
+	spin_unlock_bh(&priv->status_completion_lock);
+
+	return ktime_after(ktime_get(), ktime_add_ms(updated, STATUS_VALIDITY));
+}
+
 /* Covers Z53 and KRAKEN2023 device kinds */
 static int kraken3_read_z53(struct kraken3_data *priv)
 {
@@ -256,7 +268,7 @@ static int kraken3_read_z53(struct kraken3_data *priv)
 	if (ret < 0)
 		return ret;
 
-	if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
+	if (!kraken3_is_stale(priv)) {
 		/* Data is up to date */
 		goto unlock_and_return;
 	}
@@ -294,7 +306,7 @@ static int kraken3_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 	struct kraken3_data *priv = dev_get_drvdata(dev);
 	int ret;
 
-	if (time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
+	if (kraken3_is_stale(priv)) {
 		if (priv->kind == X53)
 			ret = kraken3_read_x53(priv);
 		else
@@ -780,6 +792,7 @@ static int kraken3_raw_event(struct hid_device *hdev, struct hid_report *report,
 	priv->channel_info[0].reported_duty = kraken3_percent_to_pwm(data[PUMP_DUTY_OFFSET]);
 
 	spin_lock(&priv->status_completion_lock);
+	priv->updated = ktime_get();
 	if (priv->kind == X53 && !completion_done(&priv->status_report_processed)) {
 		/* Mark first X-series device report as received */
 		complete_all(&priv->status_report_processed);
@@ -794,8 +807,6 @@ static int kraken3_raw_event(struct hid_device *hdev, struct hid_report *report,
 	}
 	spin_unlock(&priv->status_completion_lock);
 
-	priv->updated = jiffies;
-
 	return 0;
 }
 
@@ -886,11 +897,11 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 	hid_set_drvdata(hdev, priv);
 
 	/*
-	 * Initialize ->updated to STATUS_VALIDITY seconds in the past, making
+	 * Initialize ->updated to STATUS_VALIDITY in the past, making
 	 * the initial empty data invalid for kraken3_read without the need for
 	 * a special case there.
 	 */
-	priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
+	priv->updated = ktime_sub_ms(ktime_get(), STATUS_VALIDITY + 1);
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.45.2

