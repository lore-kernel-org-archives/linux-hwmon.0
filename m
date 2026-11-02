Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668347;
	b=JjIW0d01NINwbjISGEYjrppUoZsqsL3dFcBQziW0Nr5Hp7fBQz689sx4+hFse8QD9X81
	 WnRQksWIc1qq2zSJIpvXH2CLKNr5OS//OpUlEMnoBEUT7a4BhQKIx8ZIq/FaI2I6BGJwm
	 ERfvmfvb60/NWkMLsYzjGMiDE/4VUbcCTbo3uVVR6LLEjt5gCakLHcgF8rWVDO987eSIg
	 8wncCB768emzrsZVVx1oTeJdKG1W+Sx0izCk7KTFNHAFFEDOeAGvQ/KYob65p2qE4cb/v
	 W6rrdRcm15WnUf0zGPEYeXeOOzIVYw9Mu3PhtO4eRa9neHrRk/i4Sy4xmOSj5256wAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668347;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=cJpBwaEWtU1oNF2McZcKEf7z7MdEsRMyutU6CtYv/eE=;
	b=G3f9V0NzMU9pX7598f7T2QzvDUfDK5PJrPs/3Dmf3ANF/8a0xbJzQ40ZFps+Wv9KB0JC
	 1b+PF3UprPiauQ26OgRnPayS6Gs057u1qi173mIpMk6ACJPI6n2N/KVMIeTlxkL1f/0sQ
	 fyAMsR5gT41tdmrRJ5KAHIIJfzmZ0Q1aF57aobilzrDuSlOOCFc9Jh4YoG0+GkTQBjhrH
	 OMnwpCiCX7wEI+1ZH9sAA5KYV/RJrPPSCY5IdOZTzdP1NQzwDxbhopmJvgVp4Z0Xi8y86
	 DRI1uViSI88AhG9F3EIDzBJwgqpLt1ZhU0c1xAI6RXmOLJbgEHJVnAW+Fw9R071hmZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=spuwmHp4;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79CA606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 01:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79CA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=spuwmHp4
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id NxpPx2r8wJFmFO34bxBDY1; Tue, 03 Nov 2026 01:12:26 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O34bxNNUG63hBO34bxhm1C; Tue, 03 Nov 2026 01:12:25 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae934f9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=QQjkmUXfiR782Joob24A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=cJpBwaEWtU1oNF2McZcKEf7z7MdEsRMyutU6CtYv/eE=; b=spuwmHp4BJMY
	xTJsCTxJ3flWkOBihm36EgdgDynrUL4ukDHeHGJPkrfRz6jWAeQkuhlJPi/243jrVcXBSbGygSE6R
	IkPhMN80pGi4dhBf1ofpxUd5YDEngJTQnDd7JHyybvu6fVh5H86jRiLB0s8mLB7MbvnN4T0GCnCfH
	zfnjxwSQQ/2v3cG3+rLeQglBbMAS/uVc9mQAOu0bJWTN7TTn74EjRhbrIN7Tf/WkacXFZkmIJE9Jc
	weHrsc0RgxayLJf1mJcX3k2kFmnkIFFTx28y0Di1QL5242H3mQPR6Hmun+i3loqTX4yJTK6UWs2fT
	sZ2LKZmlc6PDlY0CUpZPYw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38184 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wZ-00000003lwF-17Yb;
	Tue, 03 Nov 2026 04:25:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 072/102] hwmon: (powr1220) Use 64-bit jiffies for ADC update timestamps
Date: Mon,  2 Nov 2026 14:52:05 -0800
Message-ID: <20261102225235.334487-73-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wZ-00000003lwF-17Yb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38184
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLdY3PzOsa9SJeE0zSUn2faFcSt/eB32IRQ0WvMBwQFWrjWgx8l7tmh7U5iTma31KmoocqRiAKDZaFBL4em4TlqpktNbeqj+tHPswk5f+7tD2iWRXrS4
 h/xtmXVT5SBMPWqnA1TCkA3PHlBtlncenPHepP+U2dNjX42sUMRwfmpDSXCCtIT5OwDVKKzPCVw8kE144jB0Bf0yiDFFOwbO7DQ8PuMAhgsZam1GeCWzRGTV

powr1220 uses 32-bit jiffies and time_after() to determine when per-ADC
channel readings should be refreshed. On 32-bit architectures, if an ADC
channel is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached readings stop updating.

Switch adc_last_updated[] to u64 and use get_jiffies_64() with
time_after64() to avoid wrap-around issues on 32-bit systems.

Fixes: f4ff415564cb ("hwmon: Add support for Lattice's POWR1220 power manager IC")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/powr1220.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 6e211601ea26..4a4a2f3b5b87 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -77,7 +77,7 @@ struct powr1220_data {
 	u8 max_channels;
 	bool adc_valid[MAX_POWR1220_ADC_VALUES];
 	 /* the next value is in jiffies */
-	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
+	u64 adc_last_updated[MAX_POWR1220_ADC_VALUES];
 
 	/* values */
 	int adc_maxes[MAX_POWR1220_ADC_VALUES];
@@ -109,7 +109,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 	int result;
 	int adc_range = 0;
 
-	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
+	if (time_after64(get_jiffies_64(), data->adc_last_updated[ch_num] + HZ) ||
 	    !data->adc_valid[ch_num]) {
 		/*
 		 * figure out if we need to use the attenuator for
@@ -151,7 +151,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		reading *= ADC_STEP_MV;
 		data->adc_values[ch_num] = reading;
 		data->adc_valid[ch_num] = true;
-		data->adc_last_updated[ch_num] = jiffies;
+		data->adc_last_updated[ch_num] = get_jiffies_64();
 		result = reading;
 
 		if (reading > data->adc_maxes[ch_num])
-- 
2.45.2

