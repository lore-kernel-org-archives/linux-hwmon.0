Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379715;
	b=vJSiSIyX+h3bjR9GKFtcJWaQrfTCnJ1uq3b7WTBME5LXcsxz4qlGQRnCBHUl+9wAMkod
	 VWj0+11hB7keoG+cnhTq5r0q9wuhayll+ofZq9VDs9tByEBPdbtok6Pv6qMQsQ8SXxB0x
	 KzGwxjveyH8SVEGYlK+dz0azkXscAHWXt2ZgnlnEUmhmx8GBmlk+RxVRZtFUXHuPdI27m
	 hGeehZu1PsMPfgmft/vMX0+v0fbv4v/MGYlO8pEtaVu3QkBXQM6FJ48aBnqq8SHxBWrQ7
	 /h4f9MRoulrG5csXsD9qskkRaJd/JN5nCOluWMglqixeTjpfhm3U0tDe5UXUOXG7eFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379715;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EiudYiK8Nl3Q0w4RgLVGNqLw7ojYPMTrFxKGITMzjTo=;
	b=NAIyMBRRXE5/aZueN5n1l4MKihxgWQhVtLgXLq3q1dQFRA/2caPKTG+U62F0pZNvaI06
	 OCJbAY4eT5jakBWSA91khjEJaoElpu6q8dx2iTBuyhoslIb7tSPIAlIgppkx7SNw4OuPt
	 hWccZ5Ktej8s/7dsfqCDWygZr4PwKhbukM9BkMRNnVTZlsMQgaRf1kJQ+Zz8NW2J2/qsC
	 LI9Q48PImwgSxvcZJw6o/dov02wXVuN1XyZZnU1AoyvipUsu0MfyDqso/uiQTCh5HRF6o
	 Azeed71YQ0m9nBM2maPGTCq5E8y5mvDTpok+xx3jHfT153jrk55kXVpqW5xavSQxs/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ar2c2WfS;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E40C606A335;
	Wed, 11 Nov 2026 06:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E40C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ar2c2WfS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ar2c2WfSzhpvqslziufykuQ/dNxLjM4nxY2TbPurBe1fh5h/C2NEyrch2buSpuIOBkvB/wUn6k0Q/
	 VFGc939htVVYH6vW0OHsEHDADd+dNrhoLMAvoU0HUUAcfi0x+XVnyxsqdW6yvhvGfK4z3g7v88NQqO
	 jX/GxdV531eKVB+s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af40fb50c5-75238;
	Wed, 11 Nov 2026 14:48:33 +0800 (CST)
X-RM-TRANSID:2ee86af40fb50c5-75238
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af40fc0acf-d1b31;
	Wed, 11 Nov 2026 14:48:33 +0800 (CST)
X-RM-TRANSID:2ee86af40fc0acf-d1b31
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Date: Wed, 11 Nov 2026 14:48:31 +0800
Message-ID: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
before clamping. A large positive voltage limit can consequently be
programmed as zero instead of the maximum; 4294967296 mV reproduces this
on a 64-bit system.

Preserve the input width and clamp to the representable voltage range
before multiplication.

Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83627ehf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 9c08ab662dc6..5c04b9c52b76 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -293,8 +293,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scale_in)
 	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
 }
 
-static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
+static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scale_in)
 {
+	val = min(val, 255UL * scale_in[nr] / 100);
 	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);
 }
 
-- 
2.51.0


