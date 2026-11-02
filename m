Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666173;
	b=J9ndbcMBpGkbKxBHr0JQPiFKQOYa1D1GbrcUhmmQFRsPhR6NsmVZ6zibATD/5os8E2mP
	 A6mYW5ZgwNm/3VJ//VBJpsoUyEkxbKvDgLGGCvT7f+Qvc8cAsQ4/uSRal4dXSN9in7AnH
	 uDSF9dCEd0P11Ip1NkjnNU6Jc+z1Nyign4qlXwWMVuLmki35nDmYhjGVT+pPcyD9Q9Mib
	 WaZOwMTjyzp8waUgLAwlvg4SWyZYuXUihGgmdJhWddowaDDEM85So1VXaQAfzd6u/nkCi
	 kTngGO0Vak4n9HAxopKrTOx2Ik8XP9TXPVz57Rd7qAPM0QWmYB20/uVszmF4Hws+shw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666173;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=6XkQZrv0gAiuGG+XNPNRZFJEx9262qRIIUSlpgn2WSU=;
	b=YhFPqoO+c4pRMK2Kxf/9Jt/VQEJgiwlmrcBdKqfI10L4osV5osu8AKoXVNPDMb22DTr1
	 AT3ZgMoYS1GqNONZSQy/5wKpocursMKdzcKQb/gz47COjhq8spg2VNoavYkkzjpvWBMnO
	 dGmfsJ9m1aMM1p9RZg1/RKTVlShyB0/PML+zL8LEGWC4KPZld8ZEU8wems/Hde5NjHhdl
	 U5SGh/8msGNFdQHbIXViCekZO5LPGmj7G2eGDG02Ra3lIrDOo5R0YFPYIOlTekBxXeuXf
	 dyI+jPYAnXbbT51AATL2SgUBQwLvMiw/J9yBZASX/B4UJGbmunb3B0K4CZaWKjPaptA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KXaxoCQs;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0B606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E0B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KXaxoCQs
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NrHYxMftqv0ndO2VYxByoJ; Tue, 03 Nov 2026 00:36:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O2VYxpwg6vtkxO2VYxNrGC; Tue, 03 Nov 2026 00:36:12 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae92c7c
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
	List-Archive; bh=6XkQZrv0gAiuGG+XNPNRZFJEx9262qRIIUSlpgn2WSU=; b=KXaxoCQsavDc
	jh09+MW/0IelOWNCRVQCNpf7zF90WSDYVEsUfasNOO8UL3UQYABdC9hjXyQlMu04P2ffb2255aiUt
	szZhTr26lWMqDVgzItPQYxZeNDpVD+3LmueYXp+R1GpThzT5ZZ+r4b+232YuJKjEKsSBnEN8DQFif
	OOsgk4G/dizPZSdGylozV4To9LYqqfGNOiuJbdXXp3WYnL9DjYIkmFjEEVN8awuTuDDRmg38/9xJG
	U4g5d2igjuGJwzjOyvGiqKupKevcHe7+fK8qcNJq5DKeHRAz/rKWzpLM53qNLJUP0FOAKfm4JJ+bP
	7M+vS3/SjyzdyrHe7+jdZw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40716 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wz-00000003mzi-1s6I;
	Tue, 03 Nov 2026 04:26:25 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 081/102] hwmon: (smsc47b397) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:14 -0800
Message-ID: <20261102225235.334487-82-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wz-00000003mzi-1s6I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40716
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDOIbBjol3wxLuCREw3vC+o+kZOd/wypy8JZ1+YgW9h7gD2hugH6oAaar+fIuvfBCPtp4DVTQTyJsaiWg9dDboV0ZtHUKzj4cqq8elSk+/XAaT2DXkPp
 LDdQphQTDzRttNazY+c3r784ZT+xptcyN1d62PIsieSzW1raXNanR4zcuNXpACr1SqxSM1t8vf4dYR3kWfJVusL7GKV+3Eu9ua1RP+RwfFeaa7GYL1i7OZ09

smsc47b397 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/smsc47b397.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/smsc47b397.c b/drivers/hwmon/smsc47b397.c
index c26d6eae0e4e..6096ba255183 100644
--- a/drivers/hwmon/smsc47b397.c
+++ b/drivers/hwmon/smsc47b397.c
@@ -95,7 +95,7 @@ struct smsc47b397_data {
 	struct mutex lock;
 
 	struct mutex update_lock;
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 	bool valid;
 
 	/* register values */
@@ -121,7 +121,8 @@ static struct smsc47b397_data *smsc47b397_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		dev_dbg(dev, "starting device update...\n");
 
 		/* 4 temperature inputs, 4 fan inputs */
@@ -136,7 +137,7 @@ static struct smsc47b397_data *smsc47b397_update_device(struct device *dev)
 					SMSC47B397_REG_FAN_MSB(i)) << 8;
 		}
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 
 		dev_dbg(dev, "... device update complete\n");
-- 
2.45.2

