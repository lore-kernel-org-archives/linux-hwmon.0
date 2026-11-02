Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660221;
	b=sJD0oz/XDYj/KF10nOITuXhsnnofQo3fWFVlM/xGxw8ncbc2AEMuD9VgwtsoumRR+GHn
	 kZAPy7xgKjNSqXLWFLrh2uSBykRRWaGD/UwjjPpceerPkscpNyXD2x6yk0bksl3S/78M+
	 NsCamGig0lZKinK3CqzIpUsFopeTMD9DjNrwKekIwaf8TliAT8nX/7iC/K3RWNmZVJrOc
	 RIPXyTREOkduFzUl+RKL9DBp9Hvx+HAtVC89LVYvwNjnAjIDLqJAahLI3RYiGP5t83i2f
	 jLzaqHPjbU58h4dnI8PvgebKQbeZ08ZpWTKyOpFRLtWVnLZvVJ9uRjyaMr0s4MAbN3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660221;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hKmmyriwszZDQi2R9V3LIMo2CX3inXZS7wctZzdX1Po=;
	b=PcGmkK7tIBVXAbCLNqsroH5fLxQAX71DbYa5W1L+xFXcTVNbLe7relPOspVIDFhUc7qe
	 mjjTalHNyUl6IZfY3YJ9vUlJx8K8fXTkzOpQe5omeUwoswN+j8se0N1Xh9CWGPd0DJ+us
	 UFNZB05p53Wzm9igGTexFaHwkFFsgZS7veKjF37dG0NKd4yaGrVMccnd/Nj7xeDsec1Uc
	 RqBvcKfhO+JRpTh5GDHuXarHmggx6rG9xcTohE36ZGfAKaoYivI1SWyhKNF3bqR3JxnDU
	 5TLw+GCIUwIe9jAcX2UwacHaxrWGQ3X6BXy6jEEKklHq5V75IrBmU+M9YXOxx4zRFqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XWsYqnNH;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A79606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=XWsYqnNH
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NzucxOg37v0ndO0xYxBSx5; Mon, 02 Nov 2026 22:57:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0xYxPRGaLr2uO0xYxEBdz; Mon, 02 Nov 2026 22:57:00 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae9153c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=N4X_Y2vUnc59bwN8jIwA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=hKmmyriwszZDQi2R9V3LIMo2CX3inXZS7wctZzdX1Po=; b=XWsYqnNHX3sr
	n63QW8T6fAOnwgZ+SMbozaopZkGast2guFertTkH02n37d64kWfQhdpNlwNJozMHtQLmYg89X93CP
	hVRQ77+fpZ0Aoefgl1j6nApdmYJJZaerffs3T7c/PL72sd+nYnJiu4Kjr6wK4uhjY/CyJQxqmHxN0
	+4d5gZ2y8oNF4w9MqiogFnC+a9undJyD7KQnpdWpwLq30aCrdHo9JY1RWZhpW8NPXPPFZS2xVPVUc
	EoB9PgN7t/3CYJFOHSD8G5NZ/EtKFBy/b5p1hWuLH4U/WiT9kilb8el82S1bhSudGRTVDUjXLOFMZ
	jEBFL+BT7m968ymb/gBvPw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48696 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xS-00000003nGp-23Dx;
	Tue, 03 Nov 2026 04:26:54 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 093/102] hwmon: (w83627ehf) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:26 -0800
Message-ID: <20261102225235.334487-94-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xS-00000003nGp-23Dx
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48696
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 145
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPLY/Q2r02rFE9KNAryGFnA5btLeuulgIEFYe5cTWCZtJQAJRI9W/Ss2vhg8YlBjWc/seeyRwko19mpCQzgc5aglB7l7I81CxFxxHxSkioCc48FyQr2u
 o1z1bkqRsu6CxIcoE4DG8T4mOq2DjDbwCRSyTxuU875XT46D8svHIz61jOh7vgscCeAMpv5Qfcos047bBiv9OXQ/NyptkTR2jH5oLZixZqStRmfvcRj+5htv

On 32-bit architectures, time_after() overflows after about 24.8 days
at HZ=1000 if the sensor is not polled, causing cached sensor values to
stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid 32-bit jiffies wrap-around issues.

Fixes: 08e7e2789e0d ("[PATCH] I2C: New hardware monitoring driver: w83627ehf")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627ehf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index a23edd35c19f..193f4b795dc0 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -321,7 +321,7 @@ struct w83627ehf_data {
 
 	struct mutex update_lock;
 	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;	/* In jiffies */
 
 	/* Register values */
 	u8 bank;		/* current register bank */
@@ -567,8 +567,8 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ/2)
-	 || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2) ||
+	    !data->valid) {
 		/* Fan clock dividers */
 		w83627ehf_update_fan_div(data);
 
@@ -687,7 +687,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 		data->caseopen = w83627ehf_read_value(data,
 						W83627EHF_REG_CASEOPEN_DET);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
@@ -775,7 +775,7 @@ store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
 		data->fan_div[channel] = new_div;
 		w83627ehf_write_fan_div(data, channel);
 		/* Give the chip time to sample a new speed value */
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 	}
 
 	w83627ehf_write_value(data, W83627EHF_REG_FAN_MIN[channel],
-- 
2.45.2

