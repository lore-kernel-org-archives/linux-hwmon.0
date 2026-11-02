Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660227;
	b=g/raqWwnnkbqsGlMtHnzADBrOp38zSfdLbSS0An65FD1SwmNJ2Q4KCKMfKCnUQ5C4zf5
	 XoHyhpmwTNYNUCE8HMX0vT0iup1RMrzIxyJyvCBiwNiaxfK0aa3O157BVrDhVm8ytQ/zs
	 280NAV+qDTtIWhA/nw7unDIJFtFopsTHdTPrRrsj3MddFPBRh+FrhlRIKD+/X3lv9JOOq
	 tVXRK/mludz6Z1zoT1UAB9lnhvj1rfrk90aRdwnfOxgkcVrqS7mrM6R4cqa9BWGhL/UF6
	 7iVZCxFkFDk/I27O4Kv4UI8mgfODCIqBbJXJT5f+lddD3HSCR053jUqBNgM91aN7+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660227;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=GlXu/XiQxrzW73yVUtzbofxPwfyAWkEg+9cKVyPgRMM=;
	b=WJKYzeuHWiV+5HrYjN+wVgBfpLpvfPYfoeNDjLSSsiKE+Q0ZbA9Ts6t9vgNF+55oWd6M
	 4Ebh8sn1UQdZ/3dQmc++8lQ5hWsFifCgqVyGVLWhueT36/XFRXHMD7D31HCVTfuC7ivsu
	 kDmaTu/2k6ul7QyVOM4xmVjeXYGtsZxonZEGaUrba//C96c+SQVqQQl+B5TPpyNENUJnI
	 madYAjSfZYDKDze/PsVxSIdKo3QVwOH/C7OvQ7AXIeaVVplRZv6Dj7sw+YoQfbPFuGzYL
	 4170kZ6yyy8eKz8uO82IxWxeOZo135BcSBwqrEpE37WWZCU4AKp+oHa0D3uZer52e8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="HRgQ0e/+";
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38685606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38685606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=HRgQ0e/+
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NopexEoBIaC0UO0xexX1W4; Mon, 02 Nov 2026 22:57:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xexPRQVLr2uO0xexEBmT; Mon, 02 Nov 2026 22:57:06 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae91542
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=kjp4eax-WhFvEt44xPkA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=GlXu/XiQxrzW73yVUtzbofxPwfyAWkEg+9cKVyPgRMM=; b=HRgQ0e/+L5Zx
	Wz/sr8rzVYrS4UgLeFuh5AqDMwiKam55h5KJFbcrUO1bWvg33DmhFCs2wOCvBRDq5/16YET+2dQTU
	AFUX4rmqTMoJYQ41CkMA8wU0JoUpXl/vcCNf/wuUvjsjnnz/9ylsJ9EUwK6H+VxuiosmqFI8Wg9sG
	JVgkY2g64pGosLIiXqPu9OHPoGKUvW3aJapUtTYXb3IQIhD+C/7qcDxn4ZIVkciPbVNXBR/lJQUY2
	iRkZx+zNtXEYqjNFVmd5EJZDC6nWUbVoaSh7T0tJmGWxC5yjDJL3Whv5rLOTBg3MJppPFZupGc0Ay
	O0e1O6GPd1lgSG0fzeEPyQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44592 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xe-00000003nL7-0jrA;
	Tue, 03 Nov 2026 04:27:06 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 095/102] hwmon: (w83781d) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:28 -0800
Message-ID: <20261102225235.334487-96-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xe-00000003nL7-0jrA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44592
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 147
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHIGVWcD+A8C2D7LbufK69gmIIL0jwpRF5dMN8TtiAi2IbZFaZ71bHBmNmppwsdRGfLi31I1uL/XMeGO07m4jEdY8t3RvYyToePCO5K083bBhmWApvNr
 ZNUSQMMoWv5nkYnarwX7aIQF1NItnI7QJlkkm9yv7PLRHWBnY1pgssFYHXBP0MQhtiNONvTqHjbq7s63RxlWSPebIBAolNRzMK67O3qEs3oS121gMGTQNKwK

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83781d.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index c40f84e53469..4582221ca2f3 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -204,7 +204,7 @@ struct w83781d_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	struct i2c_client *lm75[2];	/* for secondary I2C addresses */
 	/* array of 2 pointers to subclients */
@@ -1447,8 +1447,8 @@ static struct w83781d_data *w83781d_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		dev_dbg(dev, "Starting device update\n");
 
 		for (i = 0; i <= 8; i++) {
@@ -1549,7 +1549,7 @@ static struct w83781d_data *w83781d_update_device(struct device *dev)
 			    w83781d_read_value(data,
 					       W83781D_REG_BEEP_INTS3) << 16;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

