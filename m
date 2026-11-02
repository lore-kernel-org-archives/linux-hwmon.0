Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660049;
	b=f3aQPN9/WVTr1G0Ux02S3LyVuS5aM5mU4YDV76NAsgfPBML4iGmWcXmD7xShHQPT2efZ
	 MLs4skKHd3EtHtqU9Hd4bD1hf2Irj7qZb3x3B/+EzZjM3SE/CoIHQ+/gEY+8dTRzuk8bk
	 qpbhrs+omh0Bh4BFT9b9XL39h4Y0igp1sg79AKl8j1OXlPt1MMyLu92i7d6T8rLFdja1G
	 l2b2vu/o9rfsTkJ5+tLYj1/6/D35D1gIR+RBDoNa7GkWuAhuE+3+7IFoDmi7PCdopTNj5
	 w0Ks+5inQu5FDXydVv20sCxV+G5QAMpMW4T431EyLoGh8gS/VTtUIpZZj8h+vOYevEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660049;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=cEnzegSK59PYQPFCm/929cGydo+CLoNi6SmORk/deJE=;
	b=kqa4aMD+SsLNlGC99FUBmtr2P10zMTav1Nvbd3xkmMOvvXRWZhWmLuTsFmciG3WKVbPt
	 C20fX0rEEgHCxXSmmjdLMoMnsOkc+ZOPd/p9gf7dnSpJqsxqYnGF4JHPAiPM5KnwOIAXF
	 dH7qaWuTGyOvhSw8mqhC7XfjnrKueR1XXmrS++RcGykPU5wuaMeIiRUsYukLUDNCzqN9X
	 gdV0KBL619krnMjliFT/0OHwLCl1IsPeqqLm0vNP9N4tf+LJB5uVXNJBnWCq5oV85yZDh
	 xgSCj24Jeo+89WUTQXG2n/mpi8Xsu/yYHqYlipUMD+qxhUwmvgbS8tnjogbjcI5OGyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=U1yplZwb;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F38606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F38606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=U1yplZwb
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id NwxfxGcRZaC0UO0unxX0hB; Mon, 02 Nov 2026 22:54:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0umxPMnZLr2uO0umxE7sF; Mon, 02 Nov 2026 22:54:08 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae91490
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=BO99IVjvgbZptkBqVfEA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=cEnzegSK59PYQPFCm/929cGydo+CLoNi6SmORk/deJE=; b=U1yplZwbOwmV
	9fvjVSH8gZ2EqK2TA7RZdlAZ+rBTgnF4wD7NqXnwSfGBgoEIR0nubOzka8ApyfKdaeSTx59KEvkCP
	daB04yVJtcN00GoJa0sqo+4esi4b6/tJJD0izn7IJiLvW1aiDc0ZS8IA6M2S+w9uFHSkM3s1u4I0a
	R93IBqjgGArgox53rVcYUXD4LiFcNG09UWA7vsBIrvUwCuDIXSZFonlrPNFVnMGw0taSTAE/UDkTo
	EmbViqlxj0hSO4hpFnL2Q0fhtDZHIR0FoLmiHST5zsgTl8xewcovd8xSl1Nw28xx7uFPSMlt39WsS
	lEScCG1xa6q/CRavnSAsNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50180 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0um-00000003l1B-0tkr;
	Tue, 03 Nov 2026 04:24:08 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 030/102] hwmon: (fschmd) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:23 -0800
Message-ID: <20261102225235.334487-31-linux@roeck-us.net>
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
X-Exim-ID: 1xO0um-00000003l1B-0tkr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50180
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 67
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKWaEvDOXYr+3pYHoADsh6pNFBWqYM9oTt+Impek3tOOuMCRqOEXEwRnMrJpqJGNDEeWic1tMe3rYWXRxlPFzx4l4MRY/za1hLYm20hiZ/kesbVuQSjb
 +9VWAxedL3tA8P3FfUbki2Bj3BZ6d0/cigaHJ6NsrSMDC3P2h+6whkaMWpCIz7vopWwHa83DHNJzfRqFBtR3ZXo1zBXn/VvqmyAGRXkZteqvpp4Asn4e9WDd

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If sensors are not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 569ff1022662 ("hwmon: Add new combined driver for FSC chips")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/fschmd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index df9418a86c83..2f5c3e3b644d 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -266,7 +266,7 @@ struct fschmd_data {
 	char watchdog_expect_close;
 	char watchdog_name[10]; /* must be unique to avoid sysfs conflict */
 	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
+	u64 last_updated; /* in jiffies */
 
 	/* register values */
 	u8 revision;            /* chip revision */
@@ -1301,7 +1301,8 @@ static struct fschmd_data *fschmd_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + 2 * HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + 2 * HZ) ||
+	    !data->valid) {
 
 		for (i = 0; i < FSCHMD_NO_TEMP_SENSORS[data->kind]; i++) {
 			data->temp_act[i] = i2c_smbus_read_byte_data(client,
@@ -1353,7 +1354,7 @@ static struct fschmd_data *fschmd_update_device(struct device *dev)
 			data->volt[i] = i2c_smbus_read_byte_data(client,
 					       FSCHMD_REG_VOLT[data->kind][i]);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

