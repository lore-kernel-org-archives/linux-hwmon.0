Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854127;
	b=bnogvpksARqTDqtH1eXf/b2/HnP/2oIHwKRZF4BVYE/vcet9f5UtDJ8jC0CKQ5hv+XWU
	 VVPse7K2/eSnyuVoPdDWfMxiipe4B7CrxZR4S+fJiy8D8P+hxVPmwKlkFzwzeQkJ2gSX1
	 iiK6lnPlvKAgHkJkdB+pZuaUSjX1NP7EfTlnwR3qZE2io7gRJQEorsqyexpWRqVtSm8SE
	 NxAgP14ZSxq/H6rvR8ezO/7hq6LKq8KE58u4H+NqJFU7/txFzlesLjo0S94YWsqu18SjO
	 ofHCBEj9LVL2liAPJB2iG2URNi2Feyu1t4evVewGd7H9xPWjjfRVZtw3BriHbQ1SPXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854127;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=1YgHePDWKP9w0ydF4EH2CRyGLg5W+poiJeyoSgzoB8o=;
	b=QX1LTN+HXthBVYkrOd8gBUaVcJeQAVHP+SlxI1SDLprP2nU/SwrT5OB9CVpwPEp4rVcK
	 h9jzJDINMjsb1kwcEbbskKjyR2XwhZ1btjcRsdSOJtIbPXANHNWGbiSQgs3F8eSqvVTCS
	 /TPXiNdqI0NJdhO5BZOgHTHCKjrtdmh8g4vpRIHBJVxiCNDK8lbWswMj+utfyTPOZHFiT
	 s9SrmpJ6bGlPhlllLJb7xA1zddMSqD/aSPhwbzIEndN2RASkmYjr2n3jY4XUfX/Ifdbiy
	 MmR/21/oFggkLUCKNMCApy/oGK7g4ApjaUwR4QqOvMQdeA9VQCz0qEXlH5ujmWlNqcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="VWMYCY/5";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9B606A336
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 04:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C9B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VWMYCY/5
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id Oi5TxZbxTVK9UOpP4xKovn; Thu, 05 Nov 2026 04:48:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OpP4x2QB7xqjjOpP4xnyoU; Thu, 05 Nov 2026 04:48:46 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6aec0aae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8
 a=6ncjbjqT17sfS6AjvkMA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1YgHePDWKP9w0ydF4EH2CRyGLg5W+poiJeyoSgzoB8o=; b=VWMYCY/5cxctcNSf1vrU5Ihr6r
	k3b+7EkbVlPBYK3KtPcalfpELMskQGR53pBqs1xT+FPaKAs/QjFVJ4PAjOmPaN2kyIooit5ybuFn3
	GjE3GKL3x27TRWQXu15egexjW7rr8Mk/eGncRUVMq/M9uF3kbLIeH0f8ODllKiih0fE+0KdqrWi8/
	XaUwTOakFoesEXhbO5G1Dd65lh0JY5tbCcL73Sw34f3KVvLFCbnsxOMoTdu2NZz39FNpGohXSkHQZ
	TUrOMjo8SLpque1HaBujdPzleYjIXlVgMxMIRi6oby5DeDHuMOyUFelhJYDeOTBXeHyWSecITBS27
	NP9XbczQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33302 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOpP3-000000005ka-3rPT;
	Thu, 05 Nov 2026 10:18:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH] hwmon: (asus_rog_ryujin) Update cached duty cycle after cooler PWM write
Date: Wed,  4 Nov 2026 20:48:43 -0800
Message-ID: <20261105044843.3262037-1-linux@roeck-us.net>
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
X-Exim-ID: 1xOpP3-000000005ka-3rPT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33302
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 29
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIiV9BIdtdITfzdf3CsiBwCeVXRz3pX3p9Ia07CDbCW3ob6MBSFhRdg82yT39HxXo1jHV601FBosJgGWo5Y7lAiGOW1jE2MZgjg1sZW23tO5eU/bt8rz
 3scF2X0VrbSKBI7E/QEt4ccd2QpU2lcfInApFLBeb4LswZO4hRS4AOBrDdZ8GC1o5GN4UiqgaCvWB/AWEQ9TdrD+NaSseBRvCRnIpqJW1GUhhRKFX6eA95xL

In rog_ryujin_write_fixed_duty(), writing a PWM duty cycle to channel 0
(pump) or channel 1 (internal fan) returns directly from
rog_ryujin_write_cooler_duty(), skipping the priv->duty_input[channel]
update at the end of the function. Because the function first fetches
the pre-write cooler duty via get_cooler_duty_cmd and SET confirmation
reports do not update priv->duty_input, subsequent sysfs reads within
the STATUS_VALIDITY (1500 ms) cache window return stale duty values (or,
on Ryujin III when switching pump source at the reported duty, the
temporary neighbouring duty written by rog_ryujin_select_pump_source()).

Furthermore, rog_ryujin_write_fixed_duty() overwrote val in place with
rog_ryujin_pwm_to_percent(val), so even before the early return was
introduced, priv->duty_input[channel] stored a 0-100 percentage rather
than the 0-255 PWM value expected by rog_ryujin_read().

Keep the 0-100 percentage in a separate local variable and fall through
on success so priv->duty_input[channel] caches the written 0-255 PWM
value until the next status refresh.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Fixes: b4306c0c8e24 ("hwmon: (asus_rog_ryujin) Rely on subsystem locking")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_rog_ryujin.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 695e74cf71e4..7b80c46a0930 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -420,6 +420,7 @@ static int rog_ryujin_select_pump_source(struct rog_ryujin_data *priv, u8 *set_c
 static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel, int val)
 {
 	u8 set_cmd[SET_CMD_LENGTH];
+	int duty;
 	int ret;
 
 	if (channel < 2) {
@@ -437,18 +438,18 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 		set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET] = priv->info->duty_channel;
 
 		/* Cooler duties are set as 0-100% */
-		val = rog_ryujin_pwm_to_percent(val);
+		duty = rog_ryujin_pwm_to_percent(val);
 
 		if (channel == 0) {
 			/* Cooler pump duty */
-			set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] = val;
+			set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] = duty;
 			set_cmd[RYUJIN_SET_COOLER_FAN_DUTY_OFFSET] =
 			    rog_ryujin_pwm_to_percent(priv->duty_input[1]);
 		} else if (channel == 1) {
 			/* Cooler internal fan duty */
 			set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] =
 			    rog_ryujin_pwm_to_percent(priv->duty_input[0]);
-			set_cmd[RYUJIN_SET_COOLER_FAN_DUTY_OFFSET] = val;
+			set_cmd[RYUJIN_SET_COOLER_FAN_DUTY_OFFSET] = duty;
 		}
 
 		if (priv->info->duty_channel) {
@@ -457,7 +458,9 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 				return ret;
 		}
 
-		return rog_ryujin_write_cooler_duty(priv, set_cmd);
+		ret = rog_ryujin_write_cooler_duty(priv, set_cmd);
+		if (ret < 0)
+			return ret;
 	} else {
 		/*
 		 * Controller fan duty (channel == 2). No need to retrieve current
-- 
2.45.2

