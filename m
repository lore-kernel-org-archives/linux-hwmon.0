Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660008;
	b=jLKOh31Dt85NS1a+PWdjXjgOiDR8bXUAtQ5AXek1/U64MUmX0vXs5CxgwVdTMn+74MaE
	 22OVT29o6JkG05EY22m2754ZDEtp0PTMwUr6oHyD75E77MQy/Fd1eUmn+7RhO/iNQ4HXX
	 jAPYUEX6JJDl5TxFx6A0MDj7mkcW3wLw4d8zfIK8wGn/z6vQq1uxRNC7iVgMEz2+Entle
	 p7prwBQuHYhaDS0abNkIDznAIFOyLbMCtfC+YWsWFYG34+3DMYrcGoKfNAh2VODw6E2uW
	 k3JcPOYGuwmS7zoMzEIDE6uLnRNK8OmhJKbTJI9VuqSHsY/OeaDDMg0i1FJkB3MZDDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660008;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BzQPqA5Pn2EgvUYrHVjcz0hk0StqmkKTUQJhn3Nc+xI=;
	b=doKRyxpJeVv6FlU4BEP4kfDMrVszY/J0NCvwKBcDVJ4noOOjU0Kjf6Nc67CLoa6squ9C
	 uEK5EQiDzdSE52pewyksyZcuvEUyY0VCjuMDoN1/LB1Harq+dLmFYVvwWrP//porrhbXd
	 3tsVn9H6TP8cx9/5UcFkU7r0RMhrcdiDyxG54koIIS6I2n94g1Fk+xt+Bwmnj4uOdp1cb
	 1b8VLLZcXqgddpaqa7KZY2qTmRzf2CE0aj+IMDdlFy2BTJEdJAyaoi7DZHRi8fiHnoy+O
	 GTHTSxKUrnJkfBz3CAmdA4i/d5vUeaHegELIoeS3T4WYVByuLRsPTLbOsR1uqXA0UAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0BuVuwun;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA4606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFA4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0BuVuwun
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id Nz8OxYnDwLvgbO0u7xlYmJ; Mon, 02 Nov 2026 22:53:27 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0u6xbRPSe0duO0u6xzQJq; Mon, 02 Nov 2026 22:53:27 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae91467
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=W7o7ocYhAAAA:8
 a=_jlGtV7tAAAA:8 a=IcrR-AVeVSGpPcEwdbIA:9 a=9uIKRcg7Gvwk8o89M4RL:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BzQPqA5Pn2EgvUYrHVjcz0hk0StqmkKTUQJhn3Nc+xI=; b=0BuVuwunMuEF
	FiaeZNBJWHOeP826pxVnyCMzkovPqAl3yjmP+1He9qgTnwDbNHIFv4sNkeUI75GCKDceGqvus0FAP
	GKgTsbRKoKtoNVYs9IBNJ2g8f+dIluZVuL/ALPdcv5D9De/jvi0BW4dIrSqdrmNdhyYB1CWb3w/EW
	YdK2DAQc1VARJUFEloroWI2DleDehGibcaE5FSbZH92854eIHapyesfVA/OZ0HR+rNscNl0ldlcVu
	pzdLrO2tsdPgQdk8NjVake6WpAf4hZ8vuDBV0ylyl1j5AxquPDuuo7jSLdsAk32RYQ3/s54ll7wHY
	pC75PcEtf8k2M3rhPGlK9w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33438 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0u6-00000003kKh-1wwy;
	Tue, 03 Nov 2026 04:23:26 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Subject: [PATCH 015/102] hwmon: (aquacomputer_d5next) Use ktime for status update timestamp
Date: Mon,  2 Nov 2026 14:51:08 -0800
Message-ID: <20261102225235.334487-16-linux@roeck-us.net>
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
X-Exim-ID: 1xO0u6-00000003kKh-1wwy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33438
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 43
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHpYK4t7VoNt+TW48UN0vwZvJntHdqYHMd9c5fbwxlnCJ6rjqNB0JtmHOeQIpdPFjn4kziVYzAp1g9epSksrbua7/RdFekT97fW5r9n9nA/ugp0Nv1GB
 gmci79a1xSXKoe+x+aaQ/tiC+tEAs7PkROBP3iOPiHmRsDtFbGxCXzKShMgU30YmWboquJlTNHbUXRB+sLotaWdOx1G6BPZvqZfYW/bor0ArvyTLx4I272nc

aquacomputer_d5next uses 32-bit jiffies and time_after() to check whether
the latest status report is older than 2 seconds. On 32-bit
architectures, if status reports stop arriving or a legacy device is not
polled for about 24.8 days at HZ=1000, time_after() wraps around and
stale readings are treated as fresh.

The driver already uses ktime_t for control report timing. Convert
priv->updated to ktime_t with a 2000 ms interval using ktime_get(),
ktime_add_ms(), and ktime_after(), and guard 64-bit updated accesses
between aqc_raw_event() and aqc_read() with a spinlock to prevent torn
reads/writes on 32-bit architectures.

Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Cc: Jack Doan <me@jackdoan.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aquacomputer_d5next.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index cd6cc304614f..9599281bb6e7 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -17,11 +17,11 @@
 #include <linux/delay.h>
 #include <linux/hid.h>
 #include <linux/hwmon.h>
-#include <linux/jiffies.h>
 #include <linux/ktime.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
+#include <linux/spinlock.h>
 #include <linux/unaligned.h>
 
 #define USB_VENDOR_ID_AQUACOMPUTER	0x0c70
@@ -64,7 +64,7 @@ static const char *const aqc_device_names[] = {
 #define DRIVER_NAME			"aquacomputer_d5next"
 
 #define STATUS_REPORT_ID		0x01
-#define STATUS_UPDATE_INTERVAL		(2 * HZ)	/* In seconds */
+#define STATUS_UPDATE_INTERVAL		2000	/* In milliseconds */
 #define SERIAL_PART_OFFSET		2
 
 #define CTRL_REPORT_ID			0x03
@@ -655,7 +655,8 @@ struct aqc_data {
 	const char *const *voltage_label;
 	const char *const *current_label;
 
-	unsigned long updated;
+	spinlock_t status_lock;			/* Protect 'updated' flag */
+	ktime_t updated;
 };
 
 /* Converts from centi-percent */
@@ -1054,7 +1055,9 @@ static int aqc_legacy_read(struct aqc_data *priv)
 		break;
 	}
 
-	priv->updated = jiffies;
+	spin_lock_irq(&priv->status_lock);
+	priv->updated = ktime_get();
+	spin_unlock_irq(&priv->status_lock);
 	return 0;
 }
 
@@ -1064,8 +1067,14 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	long power;
 	int ret;
 	struct aqc_data *priv = dev_get_drvdata(dev);
+	ktime_t updated;
 
-	if (time_after(jiffies, priv->updated + STATUS_UPDATE_INTERVAL)) {
+	spin_lock_irq(&priv->status_lock);
+	updated = priv->updated;
+	spin_unlock_irq(&priv->status_lock);
+
+	if (ktime_after(ktime_get(),
+			ktime_add_ms(updated, STATUS_UPDATE_INTERVAL))) {
 		if (priv->status_report_id != 0) {
 			/* Legacy devices require manual reads */
 			ret = aqc_legacy_read(priv);
@@ -1386,6 +1395,7 @@ static const struct hwmon_chip_info aqc_chip_info = {
 static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
 {
 	int i, j, sensor_value;
+	unsigned long flags;
 	struct aqc_data *priv;
 
 	if (report->id != STATUS_REPORT_ID || report->type != HID_INPUT_REPORT ||
@@ -1537,7 +1547,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 		break;
 	}
 
-	priv->updated = jiffies;
+	spin_lock_irqsave(&priv->status_lock, flags);
+	priv->updated = ktime_get();
+	spin_unlock_irqrestore(&priv->status_lock, flags);
 
 	return 0;
 }
@@ -1605,7 +1617,8 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
 
-	priv->updated = jiffies - STATUS_UPDATE_INTERVAL - 1;
+	spin_lock_init(&priv->status_lock);
+	priv->updated = ktime_sub_ms(ktime_get(), STATUS_UPDATE_INTERVAL + 1);
 
 	ret = hid_parse(hdev);
 	if (ret)
-- 
2.45.2

