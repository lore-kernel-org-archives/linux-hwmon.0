Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661681;
	b=uGzhui6+K4M6sRQsxahPEOBPD5SXRzKItltzsxUrzjbgUpSAaGLgv+0kHCo7v4pLr7v2
	 QCU+EORUgWqKdn0wjvQQe3aqSIPMFaCGxuhearMxyRXttu6DMnoM6sbNLIYUFOE+EMj/f
	 IfWiOeZQRFiPCqG7ysDEyR7xY4GXDlg9pO/7CMQkwYKIv2ihPYi5ZOd/q3cBtLegzZjUo
	 KGbO4YRtrcdeSKfosuurGHFLNhP6FUdvpqcjcSW3IrJ2zEIN7h0fhANGxwP33Qu/tYSAT
	 /+DqtCYnL23VqZP18iq4Jtq9zepjGhcGU1VwNk8IvAyLxVQd/7lLilB3HHnGAwPMYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661681;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=qP5DBR5iioNpCMhCs1tKwFvPXTVAiS9NfGHUVqhKOQY=;
	b=qHq/i2Rm1OB0Q9xUnfwslO04KBC4jSeGMr4V7CWApJQQ7E5kOg0wVtgn7T5l3GS64CNS
	 F/U3m0idNlVFN9Zzp/klR5c9+JYt7mEpf1tYZ7KwdM91cS9fOwR+/7pbeqEyp00F+3oaU
	 2vEqaMyu4OGQBcfzFCLOL0J5l0g+ZAjWd3ymUYD+AyOUBQHlwvkbOxmpGMK/Mx2xZDSh0
	 kok7ziWnpCBy//5wX2TK3FDoLVEzOWbzTjw4TyIaVLTkCDc5LxsUSkwujIZMYT35ZpnDC
	 HzrVwe9kXKTzCLD63h3nJs1u/PdutBBFVHlnhmRQM9dgJWkTsO81XLTM48POuU9qFIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vSGoZy2+;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A251606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 23:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A251606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vSGoZy2+
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id Nz8qxh24Rc3XsO1L7xXvY8; Mon, 02 Nov 2026 23:21:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O1L6xtxaM8LLeO1L6xeiXv; Mon, 02 Nov 2026 23:21:20 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae91af0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=-CHQxXihaXk7cH2lcq4A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=qP5DBR5iioNpCMhCs1tKwFvPXTVAiS9NfGHUVqhKOQY=; b=vSGoZy2+mNls
	/i8ArjdiET/T37mR3w8tgfIhTOEPDizIw0lp8GCDerXWIh3nlM5lFdPvJg7ex/dBbvueJ3E0mlFa2
	PVyOTglMWMblc+MAVMGD0gf0sJSpje4yUF3O2mX4ojIj66qBrLGiMFOMtnALpAFYAkV6k+lalE9fw
	6j8lLeyPf4D1ArapmhS6Rk8THs+B7SK9Q6NUQFQ4jhCFBWZl/T0HrRqBS3SuII2DoZeSS9o17Ckn3
	jGskiSEytN0v28CfPod8HQ/Md7aA74gNBLx2DITTZL1vP1MF9HdJtJd+KYjbv2dBnXJXzjUhHUx4b
	kByvp+wod3vlYDy5e3udTQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37808 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wK-00000003ljT-03Vr;
	Tue, 03 Nov 2026 04:25:44 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 065/102] hwmon: (nsa320-hwmon) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:58 -0800
Message-ID: <20261102225235.334487-66-linux@roeck-us.net>
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
X-Exim-ID: 1xO0wK-00000003ljT-03Vr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37808
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBzgUg+dS76gTfTLusvVg8JSsLHDsnh4SRYi/4Xj6QKopWTkhVK+KrZiTxTsJ/tzWDx+MKgcMFG4O2PeBUvGe8NuZyzII/noghboj7LWP+rI0Nia84p1
 vgJwcBjTGkiTKgDymBGzQYEcSI4IbxK8+8lwnNK0ULxwwbD883Jr0uhHQr/wOBtisO2XgdxgiRbfy7LTvliYL5W1EUHHyTmIQ4jf7zX4T7KfgDicnVo/xbdM

nsa320-hwmon uses 32-bit jiffies and time_after() to determine when
cached MCU sensor data should be refreshed. On 32-bit architectures, if
the sensor is not polled for about 24.8 days at HZ=1000, time_after()
wraps around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 630300d5fcb6 ("hwmon: Create an NSA320 hardware monitoring driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nsa320-hwmon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
index 5c99acc09677..e1a871b837de 100644
--- a/drivers/hwmon/nsa320-hwmon.c
+++ b/drivers/hwmon/nsa320-hwmon.c
@@ -37,7 +37,7 @@
 
 struct nsa320_hwmon {
 	struct mutex		update_lock;	/* lock GPIO operations */
-	unsigned long		last_updated;	/* jiffies */
+	u64			last_updated;	/* jiffies */
 	unsigned long		mcu_data;
 	struct gpio_desc	*act;
 	struct gpio_desc	*clk;
@@ -73,7 +73,8 @@ static s32 nsa320_hwmon_update(struct device *dev)
 
 	mcu_data = hwmon->mcu_data;
 
-	if (time_after(jiffies, hwmon->last_updated + HZ) || mcu_data == 0) {
+	if (time_after64(get_jiffies_64(), hwmon->last_updated + HZ) ||
+	    mcu_data == 0) {
 		gpiod_set_value(hwmon->act, 1);
 		msleep(100);
 
@@ -95,7 +96,7 @@ static s32 nsa320_hwmon_update(struct device *dev)
 			mcu_data = -EIO;
 		} else {
 			hwmon->mcu_data = mcu_data;
-			hwmon->last_updated = jiffies;
+			hwmon->last_updated = get_jiffies_64();
 		}
 	}
 
-- 
2.45.2

