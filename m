Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283202;
	b=PDxG5+t2ziJURSlu3/i5hlMFUpgCefpm7XW8548o9EkdYrzQK9pI6MbzXFEWHNzBzow3
	 u4o4IYBUOsaOqyxWozuAa4Cr6K9jafvDO7vxNB84Vamf/1K4DJeaZfJ35gmgYfzb472O+
	 dgFkevGIHc45UrcWfMA9MxGpK+UDQUvldtkc9ELGfCsFXr+cD8iVk04EeWK3l1rbksYXv
	 ErfwyU6OVxseKgOsivOSvY1J9co0ip9WPGkztuXMYhVX+Xo8UAZd6OF451T6azkcLDJ/b
	 ezfM6XP2acsnvPPw40xQGpPkoNpgcDt1wrLwMHA1w1VIyCeTCqcZ4lLk0WrfRIn+KCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283202;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=r9ayoz8Uy0LS3mg1v8sMePXfU7OPZQF/RHWIFPJ8eNc=;
	b=JiP+uzgW8iYTCYDjpluFYPYSDVqar9fxwi+3VE3X7kMxA8Zfhi2FMhrq+EkbvE5SXmYp
	 5NQhB60nVdjI61QCyjY95s1emM6Sy0ug/+PDels+O810jh+kVym/ZQ0goQm0TM9tvebZ9
	 6j3sOWfRgBz7ZLgptBriEU9IOZlEyfollt3cExiWpV92JpgvQHxgXmfWRzA8zM700l6YW
	 kbp4tAglJuD/e+BlG/v6akX4CWktZgdqDfyAa44eu5PMnsZwhLCvwvNPvXjMAotEGpPm+
	 PH4uvNRVa/7WoTBJfCj7GY9KfX9DWH2nuKlx/36PUZR6G6uopzzv85bK5vXOpEVcBlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Dfz3tAD4;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A75606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Dfz3tAD4
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id QWTCxqdHtRiNxQd1dxPVUc; Tue, 10 Nov 2026 04:00:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qd1cxsTRYxmi7Qd1cxPqGr; Tue, 10 Nov 2026 04:00:01 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af296c1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=NsfhUwPwHkPzWkwDYfQA:9 a=GvGzcOZaWPEFPQC_NcjD:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=r9ayoz8Uy0LS3mg1v8sMePXfU7OPZQF/RHWIFPJ8eNc=; b=Dfz3tAD4X1eq
	aOE+KuIFDKcfsSAMXE4Vuj0I57p4hIlvQkWZiW7FUQgtrcGjKs622qzU+1fF534+wQ8TZlNx23BjX
	sZsbc1S/KVYSQMmXzNOm5H8rlbgmqHmRnYkMlVr9pkvOKa7IfIgQEMGKxlYz36woDnYCpvKwB7c4z
	KUATBChJ+GcmKd/GXdiMAMQZA/OyziP2LdeOOd5Xn40XlpMpCE3gIZQX7o54dUtFN5Q1Gvm2Q18gV
	uTuSqv029GNlj6nGOLBmEf6KpFQsytk+GXETsapcDpvvamcXGXS9CpF/hoU32STNSsVraVlTj1l0u
	GTpwnuSscW3/+nX/XqMSEw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48892 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQd1c-00000003Rdt-1SPX;
	Tue, 10 Nov 2026 09:30:00 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Anton Lundin <glance@ac2.se>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFT PATCH 3/3] hwmon: (nct6775) Fix tolerance bitmask when reading REG_FAN_MODE
Date: Mon,  9 Nov 2026 19:59:55 -0800
Message-ID: <20261110035955.3968731-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110035955.3968731-1-linux@roeck-us.net>
References: <20261110035955.3968731-1-linux@roeck-us.net>
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
X-Exim-ID: 1xQd1c-00000003Rdt-1SPX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48892
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCoYIAHUjhlQGx15KdfGl/jgbgkKPptnDkGy6mwaoKyEIONKBfL7u6laA/UuS1vH3X3gho1uygwL/EfZBxcI8Kj7LN+bG/UdWdN+0NhAjPGI2bL4Rex/
 9HzgBrFOnUkt5PIYOtrg543Wka35iX3sc3mPbmWKTKtbaZvMgLC9sB+N6D6af45XVgJUumy8LjTzVWxoNgSp1HvrKyYC0oSMwzymFzFc+cbhtR5xrI2C/Rb/

On NCT6775, bits 0..3 of REG_FAN_MODE hold the temperature or fan speed
tolerance (tolerance_mask is 0x0f), whereas on NCT5525, NCT6106,
NCT6116, NCT6126, and NCT6776+, only bits 0..2 hold the temperature
tolerance or low 3 bits of speed tolerance (tolerance_mask is 0x07).
However, nct6775_update_pwm() masks fanmodecfg with a hardcoded 0x0f.

When bit 3 of REG_FAN_MODE is set on chips where tolerance_mask is 0x07,
nct6775_update_pwm() includes bit 3 in temp_tolerance[0] and
target_speed_tolerance, corrupting reported tolerance values and causing
pwm_update_registers() to OR bit 3 back into REG_FAN_MODE.

Mask fanmodecfg with data->tolerance_mask instead of 0x0f in
nct6775_update_pwm().

Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan control")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev
Cc: Anton Lundin <glance@ac2.se>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 1d63747a2f38..ff7f7468185d 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1510,10 +1510,10 @@ static int nct6775_update_pwm(struct device *dev)
 
 		if (!data->temp_tolerance[0][i] ||
 		    data->pwm_enable[i] != speed_cruise)
-			data->temp_tolerance[0][i] = fanmodecfg & 0x0f;
+			data->temp_tolerance[0][i] = fanmodecfg & data->tolerance_mask;
 		if (!data->target_speed_tolerance[i] ||
 		    data->pwm_enable[i] == speed_cruise) {
-			u8 t = fanmodecfg & 0x0f;
+			u8 t = fanmodecfg & data->tolerance_mask;
 
 			if (data->REG_TOLERANCE_H) {
 				err = nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
-- 
2.45.2

