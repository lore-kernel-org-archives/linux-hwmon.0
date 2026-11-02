Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660242;
	b=YU6fBE4h/QSLmH9SWOwWSQlxgSgqEZPqCRnZe6GGVOge4jE2iao2liAWnBt0hx3pPwc+
	 wiwyBcIU+hwQSpWNSuYS6fP1u4jJjYdZmcUbfeQQ1fX2nKPue5rAz7cNQpJlIom462PIu
	 D9C3osAoDaimETfMTqh/iru9Dj+XDySeLRoe5BP+dkAXxJ+Zmatz4ps/ln2ZzoxllFcKS
	 xZYYWboWQhk5X6QFdk0oaMYUdis53Zt2XOlhGUOUOiAmOKLPuDlrl1GRG4enAvCyQH4g2
	 7eNKa0o+ITwtYYVIrhQ0cBfRYUov2ApmCA1iuSedpb25DuR61CBrzyJQAUUnZo09hVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660242;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=qT75s7+BwkjHyhEnBCq49oS5kF9+JIi3U3wqR7zotPk=;
	b=toss7iqfORPZDJ5fHlVAA7MZB5dfgw+rsIz98ieQicUk4G1vBLmvshd5YHurJ7DhxG3I
	 pElp1zXwLPFOCKxoyu4JQ5DN3LE5CG5mkEB27DOo+oqW8XjR7JzCLg3YRio1qHzk8FthN
	 dQ1doRItXgcAlZ2IMgeh9zntzaSGsKbF8q06GXMyXiEg0osIMNb+BcDZsxJjDFAVkJfup
	 BEKq3iRHxVuykFiODDtKeR6ZKB+EYos7zFWYL0qdpB2lV7xOHp1v7kgDAmBslxlH0altO
	 ZmXKuVuKEVy4YTAMalU3JtL82ZeC3WEdH9y+596bvH/i6XhoMZnWGp6g6vHmEIAjt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oT6JkZ47;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0EA606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0EA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oT6JkZ47
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id Nl5QxVxnnLvgbO0xuxlZtx; Mon, 02 Nov 2026 22:57:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xtxhtdasTgvO0xtxxnUm; Mon, 02 Nov 2026 22:57:21 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae91551
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=IFMgBmfkWOUqYXIyFksA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=qT75s7+BwkjHyhEnBCq49oS5kF9+JIi3U3wqR7zotPk=; b=oT6JkZ47y1eO
	nbLX4IB6CKDAcW1MIfZfpzB7fBsGXElGFY7TvOsr5L/fpdo+RUcKd1UFi9yzzu4Y2RhYh4EBtOvWx
	j91eQxlcxVwd1NNcxY9vbff4HNxrM41ZalikPmsBRX8O/l1Feh17m9ZB3cT/m/KuniuzAliSmsXlS
	aD5RXoE+maoj5LbwXV/4+TMemAlsEha8moCh3T/rraWAlGdDoahMmMsOhwk7bG+oHzFVgRd3JnYOB
	7nP0vWwjp+sNOgPM5lLsqBxjr+HyGAhpZP7m8Sww4/g+gfztSUs5DAkHO0o7/cNgRYYj6fplHu4SS
	JLYn7VFvg53I+CgtH30chA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55024 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xt-00000003nXb-0IWl;
	Tue, 03 Nov 2026 04:27:21 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 101/102] hwmon: (w83l786ng) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:34 -0800
Message-ID: <20261102225235.334487-102-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xt-00000003nXb-0IWl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 156
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJX+ieRwuZrERgtRAJm4Nj/SA82HmxQDADiNHeRLdwJsYwqHClC3jgtVu1yyceAN81tNbLgKLG9IXkboguFnA8GHs9fAMitrtfWw9fflBWiwj2pv1ZbG
 Tz1wGh4tLPsxSW+8NV3xkIH5b36B8AB7YbH3EBeiHL03KAiwb2xvV7cLLF5ZEym7q5idB9FJgaHhsHZDWN+EBImWVuJjWbmYgy5f5y8RV/Ht+OCGbE0mD233

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83l786ng.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index a72397083cc4..061469fc5b6c 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -123,7 +123,7 @@ struct w83l786ng_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 	unsigned long last_nonvolatile;	/* In jiffies, last time we update the
 					 * nonvolatile registers */
 
@@ -164,8 +164,8 @@ static struct w83l786ng_data *w83l786ng_update_device(struct device *dev)
 	u8 reg_tmp, pwmcfg;
 
 	mutex_lock(&data->update_lock);
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		dev_dbg(&client->dev, "Updating w83l786ng data.\n");
 
 		/* Update the voltages measured value and limits */
@@ -217,7 +217,7 @@ static struct w83l786ng_data *w83l786ng_update_device(struct device *dev)
 		data->tolerance[0] = reg_tmp & 0x0f;
 		data->tolerance[1] = (reg_tmp >> 4) & 0x0f;
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 
 	}
-- 
2.45.2

