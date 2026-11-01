Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793497681;
	b=FNfHwNV1DeSK/3+jfn/sr8vih3Wb/zcIr6YdPJZg05przn/2S2ba5SJWNwOIBU7MGjfZ
	 XL1SWNAvGhCkq49tEKHb34ykw/E45Gxj7yNHODACCtn1t1Y8w6YItxfckOeEbTROXOMQL
	 guJ+pqMqK7nObyzM/MiwKlJY68uDJcQurcoWp/gL6h5Pyi/pje9sVXh8mjaDMUaJdA75s
	 Y8cGsyJImFsr8s+ir77lYISGMRNOsEmxH1bvTnO9COWqTXkpxjcUmQjnVb8YRPAjZrwCk
	 Yazb4R7jgB0LkgPdyqn04oGp2NQN6vS/lq1bxU+qWMbntaUYS+pK3odYwtpWtrs0VLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793497681;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=pbQapHthlVuaNsaDinGay0w6EsgaKiYn1QteQWB1I5g=;
	b=CbZ6WoSrVbLNDsUG7E4mJ24L22ioTOckuGWzXjNY1D2+1H33dZQbrykzram7GomOMbfY
	 UtT5f1ifs4o9fKSTvJiS8vWY/i+dqH6r97ntElbjr/BNGiw1HQk8F3gOrhAyTxAsNOfqO
	 HbXt6MbVc4fslhymKnJrb6AOAm5e/LTeyomAPkbXAx9YYZjBB/As6HW8/oCYJ5QH2M1QN
	 PvKWplESFXCV9AA7qFdY3O9+23EOHUr0ycn33LM8Yyi6vc8zdxp7i5fLqCob5i3EzCmmt
	 96Pzb0KBy11XYybtRPkGi6YoNVQX/EbbUBmlsWBqkDf5xo2DYoHL5z+q517dRo17gwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=u246JLIS;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB9606A325
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 01:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECB9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=u246JLIS
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id MzK8x51gwusRSNKfwxgFKL; Sun, 01 Nov 2026 01:48:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NKfwxXyVmvtkxNKfwxFRG5; Sun, 01 Nov 2026 01:48:00 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae69a50
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=5kqtJ7aLVCY-SjPLrx4A:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pbQapHthlVuaNsaDinGay0w6EsgaKiYn1QteQWB1I5g=; b=u246JLISfiwUL9kHjpJaqUsqOY
	RiVoSUbK0qqA5YhvrgyKOeV5dPkFTxUgp8xRSaJF9e666reiWGM/gzT3hMSNrXj9zjbh62tBDTcgy
	evD0tzVhdxJcRryh6+4CR8lJltmS+fuRdzs27Uxyp8w0QrZzNHEH8GkZ9lffVsMM27tgAPPC/uTvl
	jBpyhHkuubujVerp+FssgDkr+tubGb0neUgKY4JyFqpx5WlmW8UWpVouQ+lVcWQj4byQwj8ETxYAC
	TBjsv0vqZW4woK28iH+tT6/RRhk0PDGY+WWDLQHnCcUcUl3KgLFJR8vZjAdgjexlcde/9gx0Qq4JE
	3u+MPEsw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40306 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNKfv-00000003Yh2-34Q1;
	Sun, 01 Nov 2026 07:17:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (sht4x) Convert update_interval to jiffies in pending data check
Date: Sat, 31 Oct 2026 18:47:56 -0700
Message-ID: <20261101014756.1921506-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-Exim-ID: 1xNKfv-00000003Yh2-34Q1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40306
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPSWkrKaKtKc5KebYFURHhlH7vH4UDgRoGhXzZbRCqBzeAylFqDIsd8mFFafX5WIQkyABdNXw36BqDCj21iiEfvf1wRxBEfsYVT6SfEgQakaEZsCJVRi
 x1jrKTTy3ocIJCC1CboBW4EGNBYKlAYq9pXnERqz410OwSLPNcnVTim2S3+U0fKzV/epi1bmDVNQJmmNzYbVQDXblTnba9llJpOU0mNAGfpwHldeczZxawwJ

In sht4x_read_values(), the check for whether a pending post-heater
measurement is still fresh compares get_jiffies_64() against
data->heating_complete + data->update_interval. However,
data->heating_complete is stored in jiffies whereas data->update_interval
is stored in milliseconds.

Whenever HZ != 1000, adding data->update_interval directly without
msecs_to_jiffies() mixes incompatible time units. For example, with the
default 2000 ms update_interval, the validity window is inflated to 8
seconds at HZ=250 and 20 seconds at HZ=100 instead of 2 seconds. A read
within that extended window skips triggering a fresh measurement and
instead returns and caches the stale post-heating measurement left in the
sensor's output buffer.

Convert data->update_interval to jiffies using msecs_to_jiffies() when
computing the pending measurement expiration deadline, matching the
next_update calculation right below it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht4x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 8372b4fc902e..020a523bf863 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -111,7 +111,9 @@ static int sht4x_read_values(struct sht4x_data *data)
 	}
 
 	if (data->data_pending &&
-	    time_before64(get_jiffies_64(), data->heating_complete + data->update_interval)) {
+	    time_before64(get_jiffies_64(),
+			  data->heating_complete +
+			  msecs_to_jiffies(data->update_interval))) {
 		data->data_pending = false;
 	} else {
 		next_update = data->last_updated +
-- 
2.45.2

