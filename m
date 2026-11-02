Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659968;
	b=eI9NLT8yiXosk8WKCy1b8NJOv96l+m+KZC57gNFd37rtK3KzBfaurSDfVrVc9kv96w2Z
	 9Kxw9K7ad1boH7oGymADbLu26qxIRChujxInC29gqplTF7AuKHzxJfzeFPW5TJnfgpi9O
	 tgctzq13knH/+fCqfepp1fFaG9m+VKOaJMC8gBKb0AZpQy0dwLdQtwDxsUgTmHWqCrGFY
	 dc+Z1yPtFKTVlqnaSNWXqhCi3WxYZ+xj8xznFduiR92CdIMNqt8PB5Hm4GpKurjgZEE6Z
	 /GW+dfeMy8s7P9CrPhLqegXXDdQhU1FuMdu8vj4yocwQjye5b6kAo2G06Be7zHOR2hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659968;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=MUkc4+EuVDmkN7HEwcPyDwOZM06Oe1Q4Y3El5aY5QAY=;
	b=OyQaFSgLmvfj8ev2d1vxbbdLyzh4nQTjUXtUcfl1UKVgRjOqT+zK+hlO9SR4NXNcRI0+
	 zfwBpCVEXvX9ZnG1Q1sfR8zbVATOUPiS5W23vL1DNnjjNsvtoTf5ekGEuzRLTKNbIkdTv
	 cY7KxCPCvcOoVX+TdrjAQH+0UznfeaIJqYHZC9UQxmNWUIz27xw8F/t9FdgqnVg1YYREL
	 AfZTOYUfZ93FpZ0xMp/jDuKNbkoEkdWAZ4T6sDynkHbD1yHpGMyQAsuxAeDDjuZZ1D05P
	 MnzET20i32gdpIOkui4TaD62gDMeyY62meLhr5Fqxe2xc4TPaIpPfW9C+79QU9E64jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZmQIu7sN;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001EC606A336
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001EC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZmQIu7sN
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id O0t0xHSBwaC0UO0tTxX0Iy; Mon, 02 Nov 2026 22:52:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tSxZrTb1xnwO0tTxyC1L; Mon, 02 Nov 2026 22:52:47 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae9143f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=sOs-43GSasVVX4AMmN8A:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=MUkc4+EuVDmkN7HEwcPyDwOZM06Oe1Q4Y3El5aY5QAY=; b=ZmQIu7sNP+n1
	CMqtrdnNhYhoUVWrknz9A6SkmlcLb1RxiK2JWQwlCUbcAkwAjZI/6WOfUnoUFG9htBXS42856eH5i
	FlACo0MeSxRqoaLwNAjukFVRrbBVPR/8gn7m5LChnqhK3DmwAlXk4Ga/KYZygQNnESbzJCD7hfElT
	s6S7iVv+02iAL4vfZ6JQbaG9qcdr2IArO5n9y/UB5LHHHt629tI1Gbn9D12D/DucFFJ5diFG8d3IB
	pbYO+uEJ5myLaUpDcvnIlgQYF2+kMB4SBFdFtqzANG5BnNgGDztMRt5VeL5nOznNaSGumlMQGg1T0
	l1tM/+LKzSIGjyIvmd1YZQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42260 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tS-00000003jiv-2acN;
	Tue, 03 Nov 2026 04:22:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 001/102] hwmon: (abituguru) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:50:54 -0800
Message-ID: <20261102225235.334487-2-linux@roeck-us.net>
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
X-Exim-ID: 1xO0tS-00000003jiv-2acN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42260
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBp9b5W0mryQ7tksqBXAebvAyZHaSbPZkYtuomFdIvI6zrzBAN/JvH8Z3kU1QNPELZffN+/p9KE82kUWbg9aiyjKHYrAMpy81VFfO3fz1KBkDWNMLtgU
 ARPB5NX/YBeKckFzpYUytoCFiw20xcLNZ5CQXR6tNN/U4ZG/74dwsA9wgKJU8j+KRQqiQZbjm5BEk6kHwsNRN3VIthVdP1Av30f8pXc46SA2gq3UkP8/2NLP

abituguru_update_device() uses 32-bit jiffies and time_after() to track
the 1-second sensor cache expiration. On 32-bit architectures, if the
sensor is not polled for more than MAX_JIFFY_OFFSET ticks (about 24.8
days at HZ=1000), time_after() wraps around and evaluates to false,
preventing sensor values from being updated for another 24.8 days.

Switch last_updated to u64 and use get_jiffies_64() and time_after64()
under update_lock to avoid 32-bit jiffies wraparound.

Fixes: f2b84bbcebfd ("[PATCH] abituguru: New hardware monitoring driver")
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/abituguru.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index 3bb959d16dbf..409c2baf1d8c 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -197,7 +197,7 @@ MODULE_PARM_DESC(verbose, "How verbose should the driver be? (0-3):\n"
 struct abituguru_data {
 	struct device *hwmon_dev;	/* hwmon registered device */
 	struct mutex update_lock;	/* protect access to data and uGuru */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 	unsigned short addr;		/* uguru base address */
 	char uguru_ready;		/* is the uguru in ready state? */
 	unsigned char update_timeouts;	/*
@@ -1323,7 +1323,7 @@ static int abituguru_probe(struct platform_device *pdev)
 				ABIT_UGURU_MAX_RETRIES) != 5)
 			goto abituguru_probe_error;
 	}
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 
 	/* Detect sensor types and fill the sysfs attr for bank1 */
 	sysfs_attr_i = 0;
@@ -1449,7 +1449,7 @@ static struct abituguru_data *abituguru_update_device(struct device *dev)
 	char success = 1;
 
 	mutex_lock(&data->update_lock);
-	if (time_after(jiffies, data->last_updated + HZ)) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ)) {
 		success = 0;
 		err = abituguru_read(data, ABIT_UGURU_ALARM_BANK, 0,
 				     data->alarms, 3, 0);
@@ -1492,7 +1492,7 @@ static struct abituguru_data *abituguru_update_device(struct device *dev)
 		}
 		/* On success set last_updated */
 		if (success)
-			data->last_updated = jiffies;
+			data->last_updated = get_jiffies_64();
 	}
 	mutex_unlock(&data->update_lock);
 
-- 
2.45.2

