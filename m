Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803477;
	b=qaIRwhjc4OxBkTAd+muXf7Et/+nUQo8lwoYLSOIdStZYbnnS7rds9ENz0uFXEV+a6GsS
	 TLQ1IiE7ASf3s935RBFrdOMCi/hLRlMFwCMMmqwRNAnvqbvT3cSsRksgKqvdTuF5LPcii
	 9ekFfBHd+h/9IcNMEM2WapvLsTMUvdBPM5qt2sLdHGh/4wVbDCEP0lGEZDIsfiktpEIkH
	 jIzDB2ZnH8ePC11PxxpSMVv1okVNRpWg6QRh6dZE8xFGczrS+73TAKFRPR6XFMxLahJD9
	 XYNE/HmYq90G1HIEo8zgdoEkc+C38Ck8m7ja7krm6fxpK/OEJPRYVaPadRjSQ+bRRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803477;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=biqFWrHHGUpDuzb1SMRN7uOcyRrGYjR2AxbuvKi8mAU=;
	b=DvQRssPisr795ZUb+QAUJm/uRc9thRxj6jRNCWYBM3+TsFp6NRUAdTb7fPq1GoFF97At
	 wbXjb6o8S+VlPj0U4/dLSojuIRT+xD9ngu66fH2SLQCr4v+uMxUHjGnj1gn+0VKSXkc8i
	 51xbEw9HVZ7OlmxWC/UHWGnYtAImGoT4jVjVWzRebnVL/D0b7poQZcBWup85rq/ddoqK4
	 4srT1fj7k+qoeC/pKSJguqJ9m2Q8o3i6whF8Yx+XVRNKm8VPUSCh3SAb0hPEJrPrqMvVd
	 wuMtsThULBa7nFOUkfXnEUHNRFpYE78ozuhCFk83PG9iP5iyCjAvAdptWDw6yniVx/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="gSLr/Xby";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3B606A326
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 14:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gSLr/Xby
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id OcDCxCDCbJFmFOcE7xQtXs; Wed, 04 Nov 2026 14:44:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OcE6xwf9zgk6fOcE7xTpDs; Wed, 04 Nov 2026 14:44:35 +0000
X-Authority-Analysis: v=2.4 cv=KM9aDEFo c=1 sm=1 tr=0 ts=6aeb44d3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=H_7rOOZNw-gYM5RDhToA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=biqFWrHHGUpDuzb1SMRN7uOcyRrGYjR2AxbuvKi8mAU=; b=gSLr/XbyCzp5Bi4IRrpQrsmly3
	ZbWl+CQqby8tuFyHXsqV86sWqIBTvVkHSukUR65n1BAiyEzpr+IO0lVSxj1M+Dh9kagvHcYw3e9lb
	Ss02ix35KKLIo4Fh40J4ltVYlsC7plNL+00KpFaURAJEOBsZfeIbcByvYzep36DI8fdEXCSy2yInM
	2yli8g5ZuKMYF5sBTpQTiFZ1tkkyt0YxbHoE1rwiO1jjzOlOff5UDdJ68aF6fnfZ1DHmHXFGA7rHP
	Ty+oyTwpiLIR/XPhzC/hZd6C08hzOngYPpw8p8gxZjlgqzxx90r4CJrGlCJ5cov3rqtQH5d3vsCjp
	ZEC//Jig==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51048 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOcE6-00000001Uxx-26ft;
	Wed, 04 Nov 2026 20:14:34 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH] hwmon: (asus_rog_ryujin) Fix timeout when reading 0% duty cycle
Date: Wed,  4 Nov 2026 06:44:32 -0800
Message-ID: <20261104144432.3199070-1-linux@roeck-us.net>
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
X-Exim-ID: 1xOcE6-00000001Uxx-26ft
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51048
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBq0IIocMaGMdUuJAHCXZLSBf4AsFb+lcLdbvUDuSKPI5TTcFmgCO+WHJDTJcGyoVq/hZDXFDrBYHAVKdcbGeD5fswLlN1kxpaorD9cIUUVO95TytYlr
 /Cvo6RXn7ousrsBpXwE0S25sZcHAFU1o/1w43CUuvPOK3QMeAxUKDfROM843jqkohaKHzZI2e6zaUPQf+MV+GDnl++8jLPBNHRYvZTLcucmlbAN96PbBEO2W

The device uses the same zero-duty report format for both legitimate 0%
duty GET responses and SET confirmation ACKs on cooler and controller
duty channels. To distinguish them, rog_ryujin_raw_event() checks
!completion_done() on cooler_duty_set and controller_duty_set, assuming
this is only true while a SET command is awaiting confirmation.

However, init_completion() initializes the completion count to zero, so
!completion_done() evaluates to true from probe until the first SET
command completes. Likewise, if rog_ryujin_execute_cmd() fails to send a
command, times out, or is interrupted after reinit_completion(), the
completion remains uncompleted. When a valid 0% duty GET response then
arrives, rog_ryujin_raw_event() consumes it as a SET confirmation and
leaves the pending *_duty_received completion uncompleted, causing
rog_ryujin_execute_cmd() to wait 1.5 seconds and fail with -ETIMEDOUT.

Mark all completions as done with complete_all() after initialization in
rog_ryujin_probe(), and complete status_completion on error in
rog_ryujin_execute_cmd(), so !completion_done() is only true while a
command is actively awaiting a response.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_rog_ryujin.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index ba188e867934..111e0099fd9c 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -207,16 +207,23 @@ static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, i
 	/* Send command for getting data */
 	ret = rog_ryujin_write_expanded(priv, cmd, cmd_length);
 	if (ret < 0)
-		return ret;
+		goto out_complete;
 
 	ret = wait_for_completion_interruptible_timeout(status_completion,
 							msecs_to_jiffies(STATUS_VALIDITY));
 	if (ret == 0)
-		return -ETIMEDOUT;
-	else if (ret < 0)
-		return ret;
+		ret = -ETIMEDOUT;
+	if (ret < 0)
+		goto out_complete;
 
 	return 0;
+
+out_complete:
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
+	if (!completion_done(status_completion))
+		complete_all(status_completion);
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
+	return ret;
 }
 
 static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
@@ -630,6 +637,18 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	init_completion(&priv->cooler_duty_set);
 	init_completion(&priv->controller_duty_set);
 
+	/*
+	 * Start completions in the completed state so rog_ryujin_raw_event()
+	 * only sees !completion_done() while rog_ryujin_execute_cmd() is
+	 * awaiting a response.
+	 */
+	complete_all(&priv->cooler_status_received);
+	complete_all(&priv->controller_status_received);
+	complete_all(&priv->cooler_duty_received);
+	complete_all(&priv->controller_duty_received);
+	complete_all(&priv->cooler_duty_set);
+	complete_all(&priv->controller_duty_set);
+
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
 							  priv, &rog_ryujin_chip_info, NULL);
 	if (IS_ERR(priv->hwmon_dev)) {
-- 
2.45.2

