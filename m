Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660038;
	b=pbNepD9BzErkFzZZftJ5ZeJvUtvzw+ORIazNWWAe9s+E5gKjntkdIrmTdgWgLXx6TQPj
	 O19rdBjx4Lc3DjpbCC9G0h0fj1RUDbEwx1DTkYXSM4rWtuWKsVvgrsP7PgvwXg10+IYqw
	 orPYSA+i0uC8+GIomPX7NamgIO6z4T2hvwqCU1UyuoUAonMM+VhWcBLXJBct+9+t58wJi
	 sBSEulX/o82YwJw4XXbXn0nhNxtaZwVl8rVG7iVJ7UirgfTGhpursHfDq4PudOGq+RalJ
	 f/tiyws6zzbQjx1YvjsuaMfdP4PuyXLcdblIjhuyi3OxaSJHI0EOgiRtGkPvsa/LaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660038;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=b8RCH6+2FcMEmGpjU/urgmM3MDdJlnLvG3MZmZMcdzQ=;
	b=KBM36eCg4qhLMBxtDdTBxxuTPO6sS30UaG9KDM2wpKr8E4ac86PQjF+tfsGisK/pOsrX
	 oRFDER/YyxTFduO+OgNh5g3+5mSA3r/bK8RLwkacs3vWaK7GtbPqdOX6R1ITjtmW/fuW9
	 BWBWG8TuotCs3NVQENloNvZ7GJ7rrG/crUQ/YOivdjG1kt0f3SJ9C7YGJXEUxMNpK6/TD
	 jlGf5HPnWAiiR5OdFH9xxDd7U2OCwRjlOwoiwIYDCkDQhLj5BOsYC9+HuZ7vx07UhFwTY
	 6No4v38CSbU1M0Kc6LHUH20J66XE2OSBZwYl5qdNL7y6uchMfLhfqPGr+++8ncHu1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JBKJhlmw;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB93606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB93606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JBKJhlmw
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id NxcpxghfMc3XsO0ubxXlq8; Mon, 02 Nov 2026 22:53:57 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uaxh6HqkE4RO0ubx96Nj; Mon, 02 Nov 2026 22:53:57 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae91485
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=4ePPNjdfB_jgKYTasdgA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=b8RCH6+2FcMEmGpjU/urgmM3MDdJlnLvG3MZmZMcdzQ=; b=JBKJhlmwy1m0
	qRpwOgjJkO1923wl1GGyJIjCykFhNB0+zuEPEYyEV46gBuyhYHfkV6S1y8W+B3Q6x7ccP6xdpBlIU
	/MYcWnj7ApTnGLsayl0j+fYHY64xgf9BEt8M1K6OE4NTPsGkF/Ou94jWaPG5nZXFYOruJ/W3fre/e
	Oix60JQnk7kNTK5XawaT09hueUZT8H6M8KCxYnbrq+cYYvI6HLA9ldlkqFgVzNjxLiONuTbr5KJ59
	07juvh2Uzcjp2QVKI0MFjvwTGDSvllFDWhQSQ4XRb/btQcbpt0hjX1PtAG7aohqNtPgnUnV7gucU5
	iIPWBHXI8qqOdILNESEAdg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42720 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0ua-00000003koZ-3Ggy;
	Tue, 03 Nov 2026 04:23:56 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 028/102] hwmon: (f71882fg) Use 64-bit jiffies for update timestamps
Date: Mon,  2 Nov 2026 14:51:21 -0800
Message-ID: <20261102225235.334487-29-linux@roeck-us.net>
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
X-Exim-ID: 1xO0ua-00000003koZ-3Ggy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42720
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 64
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDY9rCZKV6+yEZnBKdHok5WB6fmJpeWOCPjob0L4gLRYsEy6iMNpXvktRn8ki0YfMZjNhIeWT3/QCpxMeGbBOEMHz+jE7BmskdWr9ua1d64tOynba8pR
 x894+qq1Kv6HLslMMSjoitHDThEwOt+H/KizNlt8uWP/W/7+IHpmB2Rp97qKyGDI4N3NH19xQsrF3o6PyPetF7TmicKU7O9nsHft0ILWF2W1S+cT1aSv6lRu

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached measurement and limit values from updating.

Convert last_updated and last_limits to u64 and use get_jiffies_64() and
time_after64() to avoid wraparound issues on 32-bit systems.

Fixes: 45fb366940d5 ("hwmon: add support for Fintek F71882FG and F71883FG")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/f71882fg.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index 204059d2de6c..08ca0bda0006 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -251,8 +251,8 @@ struct f71882fg_data {
 	int temp_start;			/* temp numbering start (0 or 1) */
 	bool valid;			/* true if following fields are valid */
 	char auto_point_temp_signed;
-	unsigned long last_updated;	/* In jiffies */
-	unsigned long last_limits;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
+	u64 last_limits;		/* In jiffies */
 
 	/* Register Values */
 	u8	in[F71882FG_MAX_INS];
@@ -346,8 +346,8 @@ static struct f71882fg_data *f71882fg_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* Update once every 60 seconds */
-	if (time_after(jiffies, data->last_limits + 60 * HZ) ||
-			!data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_limits + 60 * HZ) ||
+	    !data->valid) {
 		if (f71882fg_has_in1_alarm[data->type]) {
 			if (data->type == f81866a) {
 				data->in1_max =
@@ -450,11 +450,12 @@ static struct f71882fg_data *f71882fg_update_device(struct device *dev)
 				break;
 			}
 		}
-		data->last_limits = jiffies;
+		data->last_limits = get_jiffies_64();
 	}
 
 	/* Update every second */
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		data->temp_status = f71882fg_read8(data,
 						F71882FG_REG_TEMP_STATUS);
 		data->temp_diode_open = f71882fg_read8(data,
@@ -502,7 +503,7 @@ static struct f71882fg_data *f71882fg_update_device(struct device *dev)
 				data->in[nr] = f71882fg_read8(data,
 							F71882FG_REG_IN(nr));
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

