Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485901;
	b=W9FSRNpdSxRtdtv7ss3xlIJJeOXcl47Ri9fP5kqi2CTc5wn7DNbIuO8v6ONxepZ7r8YP
	 oXepHrQK/ZPo+S3TjFzHK+sHy2psqcb29nCs5qQS2k+pjYG2k9nX2/q+OF8RG7IAnpCLM
	 VVSZTHpiB1o3O9N0rgHTTN4TXKd763yllV1vYDBy+LDhYuOnScaN+DU9dblYWXYj1gCRX
	 pu2agIigRB3q2FhB8TP7LULIaY/2UszYrnpjV/1/Kh+lkOz+/9iLeqDmapRtpCNQMBuUx
	 QCCwlDafXNPNlj2bAgJmb3IfGaFdBj50qd9anaRKFHozDaOsjrTuh4seSnDfN5JnKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485901;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lWwlwt7sc7hdYJYir2GpxjCVI2R1NRiEvRSCbx2/CXo=;
	b=lswqSyhQsvE6CsytE7zuOX7dy1GFVRnbKX9/fvyObcB5rcJ2f43Q2aydT4JzmYccTaLH
	 p1xDlujRqVYeX+VwMEZTg4PQdu+p2cKtF3JKojmSs36hOlyt6uXstsB8k9RmPpkfA0BD9
	 A3PXKCnqfywGILmmPe0ESxfPJdtTp+kFv5y0L8u0Xgb/Fz6+VBIzFbzGsGiMi67CBq2vZ
	 tM6kNmRrsmONuaWDfbJGJPUED6TPGZmpBob9PGIiqUde73Fk7ncdOJ2r3Hp1NZkor9V4p
	 wypVBrbOCz3mhgD/9pFWUffG67HzuIIFbRATRFg/79KRIlBmuBxH1aG+U6253UUFrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WG5++Xnl;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB36606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 22:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=WG5++Xnl
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id N4wVxIxxzMylkNHbwxofKE; Sat, 31 Oct 2026 22:31:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NHbvx0xhK63hBNHbvxW0is; Sat, 31 Oct 2026 22:31:39 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae66c4b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=InDTWJiRwaXWrhNk0FUA:9 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=lWwlwt7sc7hdYJYir2GpxjCVI2R1NRiEvRSCbx2/CXo=; b=WG5++XnlUAzn
	3DVtKLMAGF7aGklMjpzgqYGQ7P7cLecjhYIjl1JToYN/os5ET7o2cJiZnrw585GX6IYEusaxUyqm/
	UR0TtaI73tGgJem5+PD4syvz8vVlds8ewr4VMLKc9SFXcTBN4zDwt/rFVQ02lpwNlGQrTjNvKctwQ
	brzNu6v8M0eREoIma/+K0RMclhJkqTJGyvSWgAztLcrJgLFgNGBPZ6lc5N9TykDE8RvG6bjf/s1dP
	fVbzBbQf3NxGaI04NKMPaN4dRD0uQHI+yB2q4oalzCCcEyUTtJEFOtYN8VaYwvdd3q2e7DUvLN0EU
	7YIXlpH1LN/nZZ9tUQpKZA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41604 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNHbv-00000001Yx2-03yO;
	Sun, 01 Nov 2026 04:01:39 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH 2/2] hwmon: (gigabyte_waterforce) Protect status report data with spinlock
Date: Sat, 31 Oct 2026 15:31:31 -0700
Message-ID: <20261031223131.1855967-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261031223131.1855967-1-linux@roeck-us.net>
References: <20261031223131.1855967-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNHbv-00000001Yx2-03yO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41604
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP33Pyu2WIrq+2qRVHo7Y2to1A0wKu0Y5hsPx8CpBgGQs+MYG1bVIZXh3hFCLgO6hnZApIo1ZbudIPLHj2Kj8SBVMN01Ja2Q8nXZu/+BpUwCntXdWdXb
 BvCV7j375+X08+So5BWxvxkJh1iLPJvoFtn/OWAasJpy7FvoJZZBKJJ8hhqmHTZctDnsxBg37S1eAweBUIiXQU56nGLVfa/uRupaRp1O4psK048SThVABb7z

waterforce_raw_event() updates temp_input, speed_input, duty_input, and
the updated timestamp without holding priv->status_report_request_lock
(and updates priv->updated after complete_all()), while
waterforce_get_status() and waterforce_read() read those fields without
synchronization.

Because HID_CONNECT_HIDRAW is enabled, or when an interrupted wait leaves
a requested report in flight, waterforce_raw_event() can execute
concurrently with sysfs reads. Under the Linux kernel memory model this
constitutes a data race, lacks memory ordering between priv->updated and
the cached sensor fields on weakly ordered architectures, and allows a
reader woken by complete_all() to re-enter waterforce_get_status() before
priv->updated is refreshed.

Extend priv->status_report_request_lock to cover updating the sensor
values and priv->updated in waterforce_raw_event(), checking priv->updated
in waterforce_get_status(), and reading the cached sensor values in
waterforce_read().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gigabyte_waterforce.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 65169dbb91d8..34471852fe21 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -55,7 +55,7 @@ struct waterforce_data {
 	struct mutex buffer_lock;
 	/* For queueing multiple readers */
 	struct mutex status_report_request_mutex;
-	/* For reinitializing the completion below */
+	/* Protects status report data, timestamp, and completion below */
 	spinlock_t status_report_request_lock;
 	struct completion status_report_received;
 	struct completion fw_version_processed;
@@ -128,8 +128,10 @@ static int waterforce_get_status(struct waterforce_data *priv)
 	if (ret < 0)
 		return ret;
 
+	spin_lock_irq(&priv->status_report_request_lock);
 	if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
 		/* Data is up to date */
+		spin_unlock_irq(&priv->status_report_request_lock);
 		goto unlock_and_return;
 	}
 
@@ -139,7 +141,6 @@ static int waterforce_get_status(struct waterforce_data *priv)
 	 * the raw event parsing and marked the priv->status_report_received
 	 * completion as done.
 	 */
-	spin_lock_irq(&priv->status_report_request_lock);
 	reinit_completion(&priv->status_report_received);
 	spin_unlock_irq(&priv->status_report_request_lock);
 
@@ -170,6 +171,8 @@ static int waterforce_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret < 0)
 		return ret;
 
+	ret = 0;
+	spin_lock_irq(&priv->status_report_request_lock);
 	switch (type) {
 	case hwmon_temp:
 		*val = priv->temp_input[channel];
@@ -183,14 +186,17 @@ static int waterforce_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = DIV_ROUND_CLOSEST(priv->duty_input[channel] * 255, 100);
 			break;
 		default:
-			return -EOPNOTSUPP;
+			ret = -EOPNOTSUPP;
+			break;
 		}
 		break;
 	default:
-		return -EOPNOTSUPP;	/* unreachable */
+		ret = -EOPNOTSUPP;	/* unreachable */
+		break;
 	}
+	spin_unlock_irq(&priv->status_report_request_lock);
 
-	return 0;
+	return ret;
 }
 
 static int waterforce_read_string(struct device *dev, enum hwmon_sensor_types type,
@@ -276,19 +282,17 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 	if (size <= WATERFORCE_TEMP_SENSOR)
 		return 0;
 
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
 	priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
 	priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
 	priv->speed_input[1] = get_unaligned_le16(data + WATERFORCE_PUMP_SPEED);
 	priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
 	priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
-
-	spin_lock_irqsave(&priv->status_report_request_lock, flags);
+	priv->updated = jiffies;
 	if (!completion_done(&priv->status_report_received))
 		complete_all(&priv->status_report_received);
 	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 
-	priv->updated = jiffies;
-
 	return 0;
 }
 
-- 
2.45.2

