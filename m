Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485905;
	b=Vg1YZSVFRLkXNtnq3GpjeLSCejsnZdGRUt7tVoJSP0y5a5WWs/RXb0f0jeSUYUsj1TRj
	 yG8DEnZcGwqkAV+eNSVRGF+tQmzY/tHzjqh2xGZZ7J1dXaTSNP2BYbWpR6UecwlI65pCh
	 sk/jA6IHcnUy+BYR52C9l7ek+V9uhHneNdMFfUzUNJKw1VD0+aaySecBMIUVaH/jpUN+m
	 PVIXG3BJJJW5gMVL4JDWzE+OZBPp0N2AbJcUffo2z7PtNOHvTylESO6KxekCZA26AZoLt
	 0f8ynAIU2KKA2Mxtgy0d2x2TjE0G3bgxsuYhYAvhwIPtBAQ43L0YpcefBpKspo7r8wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485905;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=gI4Yl/pK3Ym+5/NKELfEvrLqrMnZ4nIGAradyzGO+UY=;
	b=fnFcfzlt3JieSEIRG6K4eNLkmEaGf8pd3m8xSz2nur9582z/LiDQhlO810IoTF1Azc/q
	 2iyroCGtoGAMefy/zozBct+XrtvreWntr7qxQutc66a8zsfRiGKMhKhKqHRSSEwYjFka9
	 F/yOmCo1brRFSQptNnJ0n0MpHFDsrgWOHyrZX0OfVLS0wc19oPbZiWPv7FOTLgGQTVR5w
	 wyqKMYqStPOBhKyw3qeC+nnkk7lcr/KrsHjl5KBNECbbHE93IkidjVIwWYdRwCC+tQZdM
	 QdfGNftEGAAojC02GSJ7/0AqvsAPl68tqYbPxcr2uDVnwdWzyml4Y0bKCWuBXhw4RCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=En96zjfI;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB1B606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 22:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=En96zjfI
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NEYOx7G5CusRSNHbvxfizR; Sat, 31 Oct 2026 22:31:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NHbuxHGDA1xnwNHbuxpZ2n; Sat, 31 Oct 2026 22:31:38 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae66c4a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=0Sv2e1o7e4dK3zd1w8QA:9 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gI4Yl/pK3Ym+5/NKELfEvrLqrMnZ4nIGAradyzGO+UY=; b=En96zjfIgJNaI3QmL14l3a6uEr
	22lqpWcmBBm0PSZfNUSye4ubGkYr9B36fbTyZ8TVfAUy/IgrTZTyqY/Lvo8yzZsNIoaKpVgRi1Heq
	tmKUxONWBsz0zFTnUXYsXj0BQ/dgQDO8LuONamDn/n/gobaghSBuD4aesuXx02Cp/4Hvt9aYELgaL
	L9vCuwTk4hzWZoj6GR6roIB0KuiydwyS9IrSZQbX/m65Qt9gKN1tOSosoW4tXIcYMQ5bLFFcztubi
	/xpXr5QoSDkZirjnmnsVcuPQSxsF2vQxEUrx/4ojhuFuBmhSKaehhTCDhz5dx7TR4rcOYixF0Jpbn
	dgItU3kQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41592 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNHbu-00000001YvM-0siE;
	Sun, 01 Nov 2026 04:01:38 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH 1/2] hwmon: (gigabyte_waterforce) Make status_report_request_lock IRQ safe
Date: Sat, 31 Oct 2026 15:31:30 -0700
Message-ID: <20261031223131.1855967-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNHbu-00000001YvM-0siE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41592
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA+UJch/RhxQQ71la9wyPyee7e9C04/0xYrGmlVGgs5AC+kXiNqSsh9cM4r8qAXhgefe9EPpJqA++YKdH8QKv8XT+ZxkMEn6zCzcs9e8YkX+8e2eE7RY
 n+meNpJh8vZ466NDUvuGuBEUQwcy0lnkN7c79CUnFjQBBkGcZcdWivFYnPwbVakzioXWuPI/bGOER6PM4IWrUjuX+2UxOu1f0zpoJb67xAuwc0+Ee6Hf4cr2

waterforce_raw_event() is the HID ->raw_event() callback and acquires
priv->status_report_request_lock with a plain spin_lock(), while
waterforce_get_status() acquires the same lock with spin_lock_bh().

Depending on the HID transport and USB host controller driver,
waterforce_raw_event() can run in process context (e.g. via uhid with
softirqs and hardirqs enabled), softirq context (USB HCDs using HCD_BH),
or hard interrupt context (USB HCDs without HCD_BH, such as OHCI/UHCI).

Because spin_lock_bh() in waterforce_get_status() leaves hard interrupts
enabled, a hard-IRQ URB completion invoking waterforce_raw_event() on the
same CPU will self-deadlock on status_report_request_lock. Likewise, a
plain spin_lock() in waterforce_raw_event() when called from process
context via uhid leaves both softirqs and hardirqs enabled, risking a
self-deadlock if interrupted by softirq or hardirq raw-event delivery on
the same CPU.

Use spin_lock_irq() in waterforce_get_status(), which always runs in
process context, and spin_lock_irqsave() in waterforce_raw_event(), which
may run with interrupts either enabled or disabled.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 41c71105a845 ("hwmon: (gigabyte_waterforce) Mark status report as received under a spinlock")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gigabyte_waterforce.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index f4d0376dd68e..65169dbb91d8 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -139,9 +139,9 @@ static int waterforce_get_status(struct waterforce_data *priv)
 	 * the raw event parsing and marked the priv->status_report_received
 	 * completion as done.
 	 */
-	spin_lock_bh(&priv->status_report_request_lock);
+	spin_lock_irq(&priv->status_report_request_lock);
 	reinit_completion(&priv->status_report_received);
-	spin_unlock_bh(&priv->status_report_request_lock);
+	spin_unlock_irq(&priv->status_report_request_lock);
 
 	/* Send command for getting status */
 	ret = waterforce_write_expanded(priv, get_status_cmd, GET_STATUS_CMD_LENGTH);
@@ -256,6 +256,7 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 				int size)
 {
 	struct waterforce_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	if (size <= FIRMWARE_VER_START_OFFSET_2)
 		return 0;
@@ -281,10 +282,10 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 	priv->duty_input[0] = data[WATERFORCE_FAN_DUTY];
 	priv->duty_input[1] = data[WATERFORCE_PUMP_DUTY];
 
-	spin_lock(&priv->status_report_request_lock);
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
 	if (!completion_done(&priv->status_report_received))
 		complete_all(&priv->status_report_received);
-	spin_unlock(&priv->status_report_request_lock);
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 
 	priv->updated = jiffies;
 
-- 
2.45.2

