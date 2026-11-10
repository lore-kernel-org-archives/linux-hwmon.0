Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283201;
	b=v8mtOtjC3NXiAGn7R9U9Is1qD6/h3+jwNcTVN+JX8ME8RkeJKfKwLo4mDB5AeE0RPOb2
	 qWbiNKOHlbGKYWT5GFfKy6OZGWMD/MmtWcIO9Wp7jHeoDaxlT5C8bafXjrQ9f3kfoLM21
	 NSw+uQsZw9GMcFu6n9IpsDP6kfbmrRMKr9auXrQqWejWBmg+OauJ5JaBF9ZhuQlioFDAK
	 dHWpqRXkL+Njnac54I0J1yTln2fbn3b+uJjE5VtvOWxRjdD6g2HlhIKm7jVWFBKR3Qi4C
	 xEivoRlsPy0szb5Mk3TVEk0POXyAikWT2KjCbzQfEGIfOKVC3T7amHGaRrAnV9iGNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283201;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=8n1T9BAirYUmqC3LcH03jB++NhXoTIHb2oyJjcxy3t4=;
	b=O+E5OznCEVX27+Rdc31iC4oWiJF0Oex3CpFcyHn98Kd6gfOGKoYvF01qReCxlg/m3vtd
	 qhIlFmNvWNVbySBVAxjv4R1yw20Q4FZ4rmKhUOAYFpbZw7CLUJBfyqCFIoqoIC+tGoMUY
	 DfAA0JcikmNk7KF1YkyWQKdTN6uci14pyYzcQc90Ac9Xn0U/ik+yHaP7TvHYtXI/s3pnS
	 2tdIkYuZ/WorQSAcQ3a7wtUqiDX6gVkwC4wqX07lxQi37Xc5cLYY7tC+gfMu6wDvgQZFb
	 9ENaCBvWXp7Q8n0/KjSw6bNjh7oUvhbg8CO+VwT6DS4bvPCKw9QjUtholuqwBDDx/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FEeUBjwI;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44A606A325
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D44A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FEeUBjwI
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id QbCRxE3Lvyb4YQd1cxr4Gm; Tue, 10 Nov 2026 04:00:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qd1bxO1c3FhzrQd1cxfWdM; Tue, 10 Nov 2026 04:00:00 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af296c0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=ss7HrKbq9ujXKUoQcFcA:9 a=GvGzcOZaWPEFPQC_NcjD:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8n1T9BAirYUmqC3LcH03jB++NhXoTIHb2oyJjcxy3t4=; b=FEeUBjwIrNJM
	kLlItJx9hPd7RRDVxBKVLHAHQoNVwwEnb+VbZ8I5+y1eWfMHMvfVdVrxM3lUPZRLAEtbXmr94wC05
	PMvL36Mh9Mffhg7jIDMQ2d4we3iqL6sYN1H3XeDMTpgMSveqielN4kKNs3BAeY2yYv6uZu8V+DEEN
	RE7EFMnV2wvA4nzpnC49Sn9Bn0TG9FrUTqcFEif+T2rnAg7jP6meL9wewuHMEsssdX3nMBXYSK6Hf
	7etnwTaVM8yrvgTAZO5xbJgVo9lPsrheaRhvvVL/UWDCKr6tVKXnvjq1Dmr+xc3ARvVIOcmdriLEU
	US4kM9lYx3f6nHeUAajgHA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48882 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQd1b-00000003RcH-1yjq;
	Tue, 10 Nov 2026 09:29:59 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Anton Lundin <glance@ac2.se>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFT PATCH 2/3] hwmon: (nct6775) Fix swapped temperature tolerance register writes
Date: Mon,  9 Nov 2026 19:59:54 -0800
Message-ID: <20261110035955.3968731-3-linux@roeck-us.net>
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
X-Exim-ID: 1xQd1b-00000003RcH-1yjq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48882
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCM+DipYzvYIUtk3FS1G15vT4YrIVaLv03hEZlJ/VXYnCDAWq8gnoU1Tq6B6gWvik0c9q5s+TS98+x1v76cUxjgOWBolab4I19lSzXS0A3oY1raVM+mx
 y0OtBamGriZSV0Tjksg8W2P4RopTdxAhaq4lUJ9S7e8v3Q3e5kHWQLuDRDsOCHzz/83nkvhEtE0o2JtV21ZAumdDs4j+rfm4EijyZ41C1DdrrcZj9jgeeOgQ

sensor_dev_template_pwm_temp_tolerance uses index 0 (backed by
REG_FAN_MODE via pwm_update_registers()) while
sensor_dev_template_pwm_crit_temp_tolerance uses index 1 (backed by
REG_CRITICAL_TEMP_TOLERANCE). However, store_temp_tolerance() checks
if (index) with inverted branches.

As a result, writing to pwm*_temp_tolerance writes the new tolerance to
REG_CRITICAL_TEMP_TOLERANCE instead of REG_FAN_MODE, while writing to
pwm*_crit_temp_tolerance updates REG_FAN_MODE with temp_tolerance[0] and
leaves REG_CRITICAL_TEMP_TOLERANCE unchanged.

Invert the index check in store_temp_tolerance() so index 0 updates fan
mode registers via pwm_update_registers() and index 1 writes to
REG_CRITICAL_TEMP_TOLERANCE.

Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan control")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev
Cc: Anton Lundin <glance@ac2.se>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 192b52750db5..1d63747a2f38 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -3053,7 +3053,7 @@ store_temp_tolerance(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->temp_tolerance[index][nr] = val;
-	if (index)
+	if (!index)
 		err = pwm_update_registers(data, nr);
 	else
 		err = nct6775_write_value(data, data->REG_CRITICAL_TEMP_TOLERANCE[nr], val);
-- 
2.45.2

