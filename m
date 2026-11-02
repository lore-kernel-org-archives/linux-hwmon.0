Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661454;
	b=J+5LlfNbSyMvn/AbW1QPix2IP/yDwc+rOCpZwYCSazgm4H7x7iq37a6pOpN/6iqMek2Y
	 MDoSFCIWDbVHFmX0nb2ouzD9nnU/nTr7nKAuo+wJVQg2wy7LAKsXvrpqV1K1vuNiqNw1i
	 Qya3Q3PMFE3epRmgsj69ZfD3iaroIwmwcMORiFXYMTHZyZXCMOWO/pYsWK24Ok2N0ITbr
	 6VnlXQRYhgmAVbFUnD5IvVZmxLKD3QTrxvsxxUldXqYAMFA8qYhTlBsEYfBcNE2xC50BW
	 39Yhn82dBS6aH0kbZ1/JNMezxScpX9ZQb3fG+0eiJG0SCpvIgSdtYLG1KFV6s4PiKwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661454;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=9A+hWpFIGxP/YjP6UDz26z7Xpp5XmqBkhNWJs1cUE90=;
	b=uUn93+q8dwbQP+ENyPnnbFpyTAG3BVHox7WNweT4YnZZ5t6xr1NzR+h344KwTtuEFfGZ
	 FSe8X71wqBWdvkjJfPAqZ3GqOU1dwVvQmCXOQ8qz9+b9wI1RrgmwtiqLloI3+xWGwx7Ku
	 gKfzms9U2JYYxfNtJK1NZggnARnKWnokA3CDwpeEtWrZ3vW82W7Z31NlRtArzyA4Vztvi
	 h/D53vhONohxlJ/i4+uCd2OFQSQcpQU/jAkNL0m2jx9wbSLpRwb8HBoa619tjiSz2r8JG
	 SiPryH8bo0rmXEiZt/haznQkp399qgZ51oQ06obzAWi+yHRs1uT3aL03o6yH7mil81w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CqNf+9tq;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95D606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E95D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CqNf+9tq
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NwKAxDpbVusRSO1HRxt4vi; Mon, 02 Nov 2026 23:17:33 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1HRxnqaRvtkxO1HRxM2sO; Mon, 02 Nov 2026 23:17:33 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae91a0d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=4_LdQFLGqiWllw3kWdQA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=9A+hWpFIGxP/YjP6UDz26z7Xpp5XmqBkhNWJs1cUE90=; b=CqNf+9tqtRFV
	McCEy48VkFqFFXfdFbpsOtGmbAPRfoskj4YMUg4Oyd2U+kSmdcsCNI8P5gpX+mecG1STdjWoRjoqZ
	sb5Lobp2U/FxmMvX/cDsjGmVVIp/2rbGhXLEALTeiNlkI8C9/3MzhbpgghAtX933bPb8ip/1hr0Ro
	d7Ab3M7+PpelSbQvWb4awCswoHULqVT+nF+Qd1qod+nxJRRJlve/68/7scoQFDlUHKdDTuTazlAoZ
	pemPNxmGr+mhdonmpC/r6O35P5PzP5GBIdhgP44sIJsp7/QoW9w5X+RaEv5RMfXQYDFIUmwvDz8BN
	8ssWlUZM/TXGgtEW5nJKTQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40872 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0xC-00000003n6i-1n7y;
	Tue, 03 Nov 2026 04:26:38 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 085/102] hwmon: (tc654) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:18 -0800
Message-ID: <20261102225235.334487-86-linux@roeck-us.net>
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
X-Exim-ID: 1xO0xC-00000003n6i-1n7y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40872
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBQhAL8d7AaQABWOWNoiEIMmbX80786KCeCyYbtblnSN2MY11n5mzybLwQnQOdMg6OhuYWAfR5sFTfhYVNzVSL414lJCPFYf9zYtPulleXl/mUIAAbHR
 TtePGcR1WkuD+4r9taGBOjrAHA8Lw/ZG+a7oUdkXfcClHRFCQ5HLfkv+lvulPFqqMA51nNpALz7J3z7s4ObqmInVafVEByVEg2dL5luRMysGDf/MxOmloUel

tc654 uses 32-bit jiffies and time_before() to determine whether cached
register values are still fresh. On 32-bit architectures, if the sensor
is not polled for about 24.8 days at HZ=1000, time_before() wraps around
and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_before64()
to avoid wrap-around issues on 32-bit systems.

Fixes: aaf6fabf1be8 ("hwmon: Add tc654 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tc654.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 4af9f0e2c0bc..b7c3b702db2a 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -64,7 +64,7 @@ struct tc654_data {
 
 	/* tc654 register cache */
 	bool valid;
-	unsigned long last_updated;	/* in jiffies */
+	u64 last_updated;	/* in jiffies */
 
 	u8 rpm_output[2];	/* The fan RPM data for fans 1 and 2 is then
 				 * written to registers RPM1 and RPM2
@@ -138,7 +138,8 @@ static struct tc654_data *tc654_update_client(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&data->update_lock);
-	if (time_before(jiffies, data->last_updated + TC654_UPDATE_INTERVAL) &&
+	if (time_before64(get_jiffies_64(),
+			  data->last_updated + TC654_UPDATE_INTERVAL) &&
 	    likely(data->valid))
 		goto out;
 
@@ -177,7 +178,7 @@ static struct tc654_data *tc654_update_client(struct device *dev)
 		goto out;
 	data->duty_cycle = ret & 0x0f;
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
 out:
 	mutex_unlock(&data->update_lock);
-- 
2.45.2

