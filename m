Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661682;
	b=iSOq0ph8KBo8zrUIWowVredRZgnUZ20BHbmdtz4jYWVzvLxzMeH82BlxVa4kKW7yQgwK
	 dZL0kIBm5nwy41gHuhwaueRJptYhxxjBsPNb3t9jlZd8daA2zXVLkNLllerCIXcS6lfQt
	 5I9mx7qFgfckeymynIsXL902vYzPUmiOV3LC3OWnesnYMhDZhcLgjI6NCGLeOWRlXhh0M
	 QXX9b7DyzSNNvwejemtbh++aAxp7Oskt3vZokFwX8eDDlNr+CQraxTIEE5Ua8Nrela+vm
	 LE0ppImyVgTXjF/KjBFtkrKdOxZuvhfxHUe+Y5REsPDdf0TkOSXlkT9NCfTSt9BIKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661682;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=6WxaC+TT/jGlJ6wywztLUeEsGDMvTleKXgMM7IK255U=;
	b=RZDFTJS+c41goaIAcqXn8geIdBJa0jgPp0UPZ9vWqlaAAf83tsPdj4qoJMjQCTXcTjwk
	 6gahKCU0/9eSs3rIOl4UsOC7b0eLdmAcbW2drJcjEXmG8MFW74W6lc7va94QWHh/pOyFO
	 AmdObQ21SQLin8Vu7b4zuIKBzx4IvzwVDyrWMF6UVX45z0h9keHy4PPHBJMXxO829DqBU
	 pZWj7y+alt/+vi74ioowc6LIRDyexdkCigrvCYW+lOr85aG7Ucpp34nzH+g4DP60lBLeL
	 G0uIu9Kvl3CHqSXJa02b5ODEhKt6QDr5X6UQTGAoZcZAjaQCxYmds4lnocyUxCtCe5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LwfW3s5p;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF974606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF974606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LwfW3s5p
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Nz8qxh24Rc3XsO1L7xXvYJ; Mon, 02 Nov 2026 23:21:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1L7xtxbW8LLeO1L7xeiYu; Mon, 02 Nov 2026 23:21:21 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae91af1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=fa5l03D-DcTfirLes0oA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=6WxaC+TT/jGlJ6wywztLUeEsGDMvTleKXgMM7IK255U=; b=LwfW3s5pUskt
	kKWmhOLExP2j6W2h8uAwKoLqRlt6ELus69EqFKMr+XGcd2b/dX0t64N0QyRHlkdNnWRcEOQwleOxN
	utlYfQ8QbI0zf4UlaLUDmyLdR1JZQ91Ziy73W+lI4lh+yuoofpy5O/TtZzfzLeDafu1f6R8daxTDX
	Ub8aTFp1VF6xJzugtZx0z4pzryrUlk50CsyTp8P2ey9vJkORyRRuPLS/ae3ak0UuZuy+ZnyOflNRc
	Y4jaHz2pySqmBVbXK5x+Xt5nD9BxIVhXMAdG7rV2v7Ml2XoR5vrbFs1GYK84RCddaHV0HJL7xUjx7
	+gpctntIj2KF0R380uXPQQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37822 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wK-00000003lkZ-36TR;
	Tue, 03 Nov 2026 04:25:44 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonas Malaco <jonas@protocubo.io>
Subject: [PATCH 066/102] hwmon: (nzxt-kraken2) Use ktime for status report validity timestamp
Date: Mon,  2 Nov 2026 14:51:59 -0800
Message-ID: <20261102225235.334487-67-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wK-00000003lkZ-36TR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37822
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfApyjhBnTXknlRrS+ll5wFrTZ+Q4urJZOJfZprWOeg/znEJvnmdBO6Q4iKgJ6xiGBpcQZyEH8keFWIwN2WzMSMVqD0GHDZOSCVugKLwQH3EPOt8wGJx/
 KRVjp/U/NErEMyY5KQUvjDKEci3by+W+8hYI/7aabX54FwyOI0D47ksiqg0WTwTmG3KKUL3G4DwpOBlvvZKUwK/yv6CjFzCvxNk0flrUfSBiaIQsDoY7J9nH

nzxt-kraken2 uses 32-bit jiffies and time_after() to check whether the
most recent asynchronous HID status report is older than 2 seconds. On
32-bit architectures, if status reports stop arriving and the device is
not polled for about 24.8 days at HZ=1000, time_after() wraps around and
stale readings are reported instead of -ENODATA.

Convert updated to ktime_t using ktime_get(), ktime_add_ms(), and
ktime_after(), and protect sensor values and the 64-bit timestamp
between kraken2_raw_event() and kraken2_read() with a spinlock.

Fixes: 82e3430dfa8c ("hwmon: add driver for NZXT Kraken X42/X52/X62/X72")
Cc: Jonas Malaco <jonas@protocubo.io>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nzxt-kraken2.c | 37 ++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 034698232758..79fb07bffd3f 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -12,11 +12,12 @@
 #include <linux/unaligned.h>
 #include <linux/hid.h>
 #include <linux/hwmon.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
+#include <linux/spinlock.h>
 
 #define STATUS_REPORT_ID	0x04
-#define STATUS_VALIDITY		2 /* seconds; equivalent to 4 missed updates */
+#define STATUS_VALIDITY		(2 * MSEC_PER_SEC) /* equivalent to 4 missed updates */
 
 static const char *const kraken2_temp_label[] = {
 	"Coolant",
@@ -30,18 +31,24 @@ static const char *const kraken2_fan_label[] = {
 struct kraken2_priv_data {
 	struct hid_device *hid_dev;
 	struct device *hwmon_dev;
+	spinlock_t lock; /* protects sensor values and updated */
 	s32 temp_input[1];
 	u16 fan_input[2];
-	unsigned long updated; /* jiffies */
+	ktime_t updated;
 };
 
 static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
 	struct kraken2_priv_data *priv = dev_get_drvdata(dev);
+	int ret = 0;
 
-	if (time_after(jiffies, priv->updated + STATUS_VALIDITY * HZ))
-		return -ENODATA;
+	spin_lock_irq(&priv->lock);
+
+	if (ktime_after(ktime_get(), ktime_add_ms(priv->updated, STATUS_VALIDITY))) {
+		ret = -ENODATA;
+		goto unlock;
+	}
 
 	switch (type) {
 	case hwmon_temp:
@@ -51,10 +58,13 @@ static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
 		*val = priv->fan_input[channel];
 		break;
 	default:
-		return -EOPNOTSUPP; /* unreachable */
+		ret = -EOPNOTSUPP; /* unreachable */
+		break;
 	}
 
-	return 0;
+unlock:
+	spin_unlock_irq(&priv->lock);
+	return ret;
 }
 
 static int kraken2_read_string(struct device *dev, enum hwmon_sensor_types type,
@@ -97,12 +107,15 @@ static int kraken2_raw_event(struct hid_device *hdev,
 			     struct hid_report *report, u8 *data, int size)
 {
 	struct kraken2_priv_data *priv;
+	unsigned long flags;
 
 	if (size < 7 || report->id != STATUS_REPORT_ID)
 		return 0;
 
 	priv = hid_get_drvdata(hdev);
 
+	spin_lock_irqsave(&priv->lock, flags);
+
 	/*
 	 * The fractional byte of the coolant temperature has been observed to
 	 * be in the interval [1,9], but some of these steps are also
@@ -117,7 +130,9 @@ static int kraken2_raw_event(struct hid_device *hdev,
 	priv->fan_input[0] = get_unaligned_be16(data + 3);
 	priv->fan_input[1] = get_unaligned_be16(data + 5);
 
-	priv->updated = jiffies;
+	priv->updated = ktime_get();
+
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -135,12 +150,14 @@ static int kraken2_probe(struct hid_device *hdev,
 	priv->hid_dev = hdev;
 	hid_set_drvdata(hdev, priv);
 
+	spin_lock_init(&priv->lock);
+
 	/*
-	 * Initialize ->updated to STATUS_VALIDITY seconds in the past, making
+	 * Initialize ->updated to STATUS_VALIDITY in the past, making
 	 * the initial empty data invalid for kraken2_read without the need for
 	 * a special case there.
 	 */
-	priv->updated = jiffies - STATUS_VALIDITY * HZ;
+	priv->updated = ktime_sub_ms(ktime_get(), STATUS_VALIDITY + 1);
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.45.2

