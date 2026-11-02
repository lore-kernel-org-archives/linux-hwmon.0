Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663420;
	b=gtRX1MLDVSlg1sn2xg+z51bKhWS3oa4uvavHEi7WAfflBmZWeApDNXu+V8g2rzSFWtr+
	 fUS8ou0zNAQrO3xEASDXo7y5psJkzlnnp+bIxu/YOlj56epodztooxT+arT/+4dJd4SUu
	 zWWTfbkOE1eAqGQincLTHBuwvXBStB8RXrxlvkScYRc+M1NL0KFo3uL4IDKACvMYQy8h7
	 D2gCbi3D0ZakVeYm2cM61a+kqIINhc0595VHVaVMSwYLw9KmQooUNVoPOQOmgop1BxaLR
	 VZSWFpHXanzKTfna3hLv5I+WzbOpkPzgSi8Tt6EWf1KpKf/N09F/VfV/e8+IvO+A1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663420;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Z2NL6nZf5bv+C9JUgNLt/y7jrP1YOVmfb+FGXd2TWH4=;
	b=KSSs5a83y6RpLF0yCdG25PvH0QIR7mP8hclb280CY1axcbFSf4WSBuBP5aHlBCoBIZ19
	 5vC0uTzCpwWGtzaRSgL6MOgshnR7CVbDInLGyVw4u76MRyL5eGE2EvRKedMfYpDZZQ/A3
	 rfb/zPLPkTuJe5Duecc85FkLI3XqWQtVDQ9D9v5JzaYKwLxnlzSl/6BLU5IjF+8Yc0hwd
	 px7kIksJ0PhrYxzNlCHcIu8ojSCUPdaMFAapoHl0wNLp9F1rh/4QD69t585EYjx28UxRp
	 s8ye/cGInXMynHsv/p/DtZzoAw0EhIVnweTNA49/7TI0YtJ7FfECUxNqMYWPnmPvMKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pNQ7lsQW;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5FA606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pNQ7lsQW
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id NpllxCLaYusRSO1n9xtEVe; Mon, 02 Nov 2026 23:50:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1n9xWmBE0ULmO1n9xMkdf; Mon, 02 Nov 2026 23:50:19 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae921bb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=e1kVFQGkEgFS52LD9IYA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Z2NL6nZf5bv+C9JUgNLt/y7jrP1YOVmfb+FGXd2TWH4=; b=pNQ7lsQWjzfO
	k8Cd+Mc8FayAqaVPw0iMauctSnPFJgugJclA6BuedKp52mune3943flvwn3dvVPQBZ8RjGz5oQ7aX
	jPoYh1HMevH1CXhJI/HHnEz4eFUrQ3u1vAk5yC7ngbI70z3QlKXeeKIKy/B0s5T0DGSLFR/dD6D5o
	8X1yJ9pxGUERkjtt3BqrYLdvtAqtoNcPYz0vjVYv4SF2HM15L400TqMRas7lqcZIi+aHAoir77R7B
	4X0mMc09nr7adHzqGh92f6TmbooycrGWYRlh2DHjqvIBXmXwxlfL56FPdiLcsmQz5seoLUi+AteEO
	UdWgNDK/cNvuHirSWyQ4vg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46932 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vs-00000003lYQ-2ahX;
	Tue, 03 Nov 2026 04:25:16 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 055/102] hwmon: (ltc4215) Use ktime for update timestamp
Date: Mon,  2 Nov 2026 14:51:48 -0800
Message-ID: <20261102225235.334487-56-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vs-00000003lYQ-2ahX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46932
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKvkaXCvD5l7xdHw9LODWoVC5Z3B1J9JwD65EKG/ZTD9rjDVnuCjAvvCq19y2RP21glGBa3Hk0a2A5bQptNQyNjqSjwR6OC3GrCFoKR+sKsk6YIWrT9O
 5ecobyueH5qLeh0sMxAy5qB5DuSaIGCK8KTSGpVkiMcDijWrffIHGFJ6ARnaByVF3MJaN2+iZQbjx4YmOUX6QtGVx8AqJDPU6J31vehigl8AOslsW5M8c6uM

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached ADC readings from updating.

Convert last_updated to ktime_t and use ktime_get(), ktime_add_ms(), and
ktime_after() for the 100 ms update interval to avoid 32-bit jiffies
wraparound issues.

Fixes: 72f5de92e199 ("hwmon: Add LTC4215 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4215.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ltc4215.c b/drivers/hwmon/ltc4215.c
index 3d439fbbbef9..4436ca1517e0 100644
--- a/drivers/hwmon/ltc4215.c
+++ b/drivers/hwmon/ltc4215.c
@@ -16,7 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 
 /* Here are names of the chip's registers (a.k.a. commands) */
 enum ltc4215_cmd {
@@ -34,7 +34,7 @@ struct ltc4215_data {
 
 	struct mutex update_lock;
 	bool valid;
-	unsigned long last_updated; /* in jiffies */
+	ktime_t last_updated;
 
 	/* Registers */
 	u8 regs[7];
@@ -50,7 +50,8 @@ static struct ltc4215_data *ltc4215_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* The chip's A/D updates 10 times per second */
-	if (time_after(jiffies, data->last_updated + HZ / 10) || !data->valid) {
+	if (ktime_after(ktime_get(), ktime_add_ms(data->last_updated, 100)) ||
+	    !data->valid) {
 
 		dev_dbg(&client->dev, "Starting ltc4215 update\n");
 
@@ -63,7 +64,7 @@ static struct ltc4215_data *ltc4215_update_device(struct device *dev)
 				data->regs[i] = val;
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = ktime_get();
 		data->valid = true;
 	}
 
-- 
2.45.2

