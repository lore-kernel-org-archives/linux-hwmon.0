Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665731;
	b=xvdYM82jAAvsriE18gpO1qu1vPy4fWnyYCb6hqZUF3lv/BVP1SOzRPoQuV7WNDpCGqsv
	 BxjSmvxWgFGWvL59+IJhTe8ZsOp34kI+guEDNuLxOdXJqY6/q1+0jRzDU1PK4nTaYPXld
	 Ycx+IlOi6MG6eotYf/J0xgWjmIuztv+1y6X+4yQJUPESovswvOPpCXrItOTP+Ar+jbBtq
	 dBfYiPxiyb0+bzhvdMXUpOnu9c4Uas9cl7sdBu/3/3mruse/H399pdMVuPOy83v0UOYJB
	 023k9RZm5uwHyCwy9/ktZKv/bKdDb+uy3eP8cUZgaWx9OH2bRD38o51FJDFgVL5xecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665731;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=n0V5g7vkAdn3IHmZaSQrerdDZ3n0yn1Jw/IPym8U0o0=;
	b=N6Z4CBXQP6Bok8iVf7IfCxI2ILJxx+bxY2O/L8ZM4vk1AHh/6hVuYtdzwuKZJQx4MYRQ
	 7/thxZfUFFK8rPXrEcJwmpHreG+YoPPGiZOKgUYr0KrbU1S4e5H4IZmIiLrBD+gAT4Ah8
	 6+QDkmfjkPD2pkVqT2/dWqQcGN7JBznPvfDBPmEVxfgnZccJaPXxDWylC/IyIyRto1ygV
	 JQsLOQlda4sNnuL8rDeL3mo7/GHuogptYO6JYnQLc1XEHNFxIiYt5/MFo3Om1xF97rhWL
	 IB9FyVQrMwaiXqxf/kJGyVLgJCEEeoDmrfBxf33UOB4+Y3IV7GblE7QKncx0pxPUinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iTo6dK+o;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB9606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BB9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iTo6dK+o
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NopfxEoCTaC0UO2OQxXUyj; Tue, 03 Nov 2026 00:28:50 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2OQxRtFnLr2uO2OQxGJJ1; Tue, 03 Nov 2026 00:28:50 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae92ac2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8
 a=agofVQKObDrp1vJju4sA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=n0V5g7vkAdn3IHmZaSQrerdDZ3n0yn1Jw/IPym8U0o0=; b=iTo6dK+o1aT9
	+WaAKjYMcdFm3LFqnAKnZZNENe6PWJ5U9XUfAxBsmIfmWP4hDC+9YE2FK8KduVVFNAf4hJW0cA92a
	mS2mZjdn4tnUQW9bvxhsQVFlEI0FS0AvI220UP01GwpAmahQX7ohCm9Jr7LybJLj9ZamV5bUICyH5
	2lk5Cz1maIUG4ogViYG3HOfK7fo7ydfk1S/hkLzdkUlfQ50GXwEUxx1Ej1Dc+6R4iW3IcYhKyBMpx
	7guru5AYmfE7pcvIPXUbBjOhLE9STvZXZOQkX/sjABl8pcxw2TotCZtuuuayxiPQuFbWvT6PrhKZ7
	P7eTOwyDTSJ6ye5HXV971g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52500 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0vE-00000003lFx-43xd;
	Tue, 03 Nov 2026 04:24:37 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 042/102] hwmon: (it87) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:35 -0800
Message-ID: <20261102225235.334487-43-linux@roeck-us.net>
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
X-Exim-ID: 1xO0vE-00000003lFx-43xd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52500
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLxcf3cdK2Inx2f1u7wzCvI/YkbZ2h9gCvCmTq6iBQWywUt4MdYD/5aajMa2X8z1a1hSXMhwYxMw7+8KRsQQiu9s6degBGwQmsqYXU4jszO4JBI4dTzD
 aSpWWzMeZR0fMP01dEtn4hhR6GK1yaboLaJP0VOwKaGOYNpbAWuBGtZXPAWmGpDtLeo3F6GV23DxLiT3q0LeI+MXw7ZGHuuTt+seXWwLlMPg21Ini5gKyuyI

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 14800a56513e..13dc1480471e 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -680,7 +680,7 @@ struct it87_data {
 	const char *name;
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	u16 in_scaled;		/* Internal voltage sensors are scaled */
 	u16 in_internal;	/* Bitfield, internal sensors (for labels) */
@@ -1050,8 +1050,8 @@ static struct it87_data *it87_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2) ||
-		       !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		err = smbus_disable(data);
 		if (err) {
 			ret = ERR_PTR(err);
@@ -1157,7 +1157,7 @@ static struct it87_data *it87_update_device(struct device *dev)
 			 */
 			data->vid &= 0x3f;
 		}
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 		smbus_enable(data);
 	}
-- 
2.45.2

