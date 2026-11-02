Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660052;
	b=tB+qnJjh+FbdQfwhKp1CqJn4NBMfEYXwzyHzOEKZKqm//F2qkkLqg4Ug7qjO1KOCk0F7
	 zh1/r+W/NFWkdFMtqTvyGax7KaYTVzE0vGHzRI7nLcNslZE5JAaVF66BfAp9vDe+NKMTR
	 6/vnlbz4mvnajgVi97r7rHYdCTlUdUnaDuDdKtiJ2z5aWd+tI9noTTpkZbWwFl2n71j8t
	 00S1OG0opcC/66iYinPRhQX+dc/kLIx0GTaBPX4fT275nRWxqhGA0haSGHhLOYkeiiHs6
	 +bE/UDgQbQYG/dhCs/vVbBUcPtTS9qGyRBs558iVf6XSxjidjWuHJht/V0m8g13a9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660052;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=EhqN+eyuy7/CNq9ckaJ0nl+HsLT/45RvX+rCuiP73Pk=;
	b=5TDssmQisfr4ysyGj55lWASZD2JUc2E7dDIKgPV3BAmy1d27ytOJzX+Uawqiqv+mfYt3
	 LMMJQa8Ye632n+c3qcY41fodGkyhPyH13p9bDr5H8bf476/r66xxz3e7VlNzv/vsQUHe/
	 qy1KleyXbq88fKidtO/TYamdoz+WWYGYVR9pWb9sXKotdYGnr2CLgjmFRIyuiMqqBSm3l
	 9OtMXZDAbOXA1BvOdd0Ohg5AwCmDDiW/yL8UMABP120FuYPezOJc5zhG0YTlJ26+oH6v6
	 06uNAjwEIL0lbuNYELcQWRwZwZxueF/pqOMnc/WIfWOYeqSt7QOB/ywfvVUN/qNb84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pjepj65b;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A30606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A30606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pjepj65b
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id Nw9kx2RELJFmFO0uqxAWG2; Mon, 02 Nov 2026 22:54:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0upxEl32QfwNO0upxXVgf; Mon, 02 Nov 2026 22:54:11 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae91493
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=1Ez6V3JJn854t96LNywA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=EhqN+eyuy7/CNq9ckaJ0nl+HsLT/45RvX+rCuiP73Pk=; b=pjepj65bGkt9
	RgHqkAckgnUgKkJW6dXAyqt0izUqgw8fZG51dDebQjKj4ZjC4xbI/Q4XWw80ccFzHszaboNi0RKvg
	Hfpr4+KtqNg1W5BmgJPzM6UYJP/SfPjm2oAJQ5dDaO7q4KacxOjPUSkYSL3jzFYp1N/Ybrqqjm3ja
	OvQwh1ifFCuQdRqRxa8eenjhk8/rmn75KeE8pmhnhI+mWTYLC38mZXsNwIgEM2/Y8QrL7lmwcmif/
	DACOw/oiVkR3DDVQDhzAlUM2R45fNfM1LLxpvZrHnBMj8KJTC/DdKBKuBHJAXTXtqxId+RjdxcHpz
	FKNa6YiXNlhErwFzfp3a8A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50206 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0up-00000003l43-1ECZ;
	Tue, 03 Nov 2026 04:24:11 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH 034/102] hwmon: (gigabyte_waterforce) Use ktime for status validity timestamp
Date: Mon,  2 Nov 2026 14:51:27 -0800
Message-ID: <20261102225235.334487-35-linux@roeck-us.net>
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
X-Exim-ID: 1xO0up-00000003l43-1ECZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50206
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 72
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDokERz+cdNZdXYJcDMM4xzabHKvagVM9JK/MuSchbW/zh03HFkDApCOhrRuhIhRQPJ+eXkszxAFpjEJJn8lFPM9Z4pAQ0tD+2dEk6KsgH387OHP6cdF
 Bpe4IQrlh/bVpXip9+/80cBeoQ2RqYmS8aOrFE+OcF2BgGSbDm0sdlkNpu/0cCBS9EUxey4YvNo327Z7r56Yo4dguapWXHRX4If6Zs7mRAIVSpaRVC/8hgTS

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
status reports from being refreshed.

Since STATUS_VALIDITY is defined in milliseconds, convert updated to
ktime_t and use ktime_get(), ktime_add_ms(), ktime_sub_ms(), and
ktime_after() to avoid 32-bit jiffies wraparound issues.

Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gigabyte_waterforce.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 34471852fe21..85f69353ed45 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -9,6 +9,7 @@
 #include <linux/hid.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/unaligned.h>
@@ -67,7 +68,7 @@ struct waterforce_data {
 
 	u8 *buffer;
 	int firmware_version;
-	unsigned long updated;	/* jiffies */
+	ktime_t updated;
 };
 
 static umode_t waterforce_is_visible(const void *data,
@@ -129,7 +130,7 @@ static int waterforce_get_status(struct waterforce_data *priv)
 		return ret;
 
 	spin_lock_irq(&priv->status_report_request_lock);
-	if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
+	if (!ktime_after(ktime_get(), ktime_add_ms(priv->updated, STATUS_VALIDITY))) {
 		/* Data is up to date */
 		spin_unlock_irq(&priv->status_report_request_lock);
 		goto unlock_and_return;
@@ -288,7 +289,7 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 	priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
 	priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
 	priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
-	priv->updated = jiffies;
+	priv->updated = ktime_get();
 	if (!completion_done(&priv->status_report_received))
 		complete_all(&priv->status_report_received);
 	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
@@ -332,11 +333,11 @@ static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id
 	hid_set_drvdata(hdev, priv);
 
 	/*
-	 * Initialize priv->updated to STATUS_VALIDITY seconds in the past, making
+	 * Initialize priv->updated to STATUS_VALIDITY in the past, making
 	 * the initial empty data invalid for waterforce_read() without the need for
 	 * a special case there.
 	 */
-	priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
+	priv->updated = ktime_sub_ms(ktime_get(), STATUS_VALIDITY + 1);
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.45.2

