Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216943;
	b=wspC5P0EBnrkPlEBP1cDkQE1SdOxmYKqe7J2qawX4fxpkO/AzcyJ6hM6dXcIeFE1uXMw
	 q4ihM8eXwHd74ATdTBoURTNsL/lU1Jj030gxHDCbNQ91w+V+055PPYt0VvkuqfeofujH9
	 xWnOOKIzmXlPkeo2mAoS+TSkv3R1Vl9FU/yL/NZDMJeNlDeCWWEtBBs9EcdsnsMUKICy0
	 0wRCJuwbVtCUaXWEakYvCETNTVm89BWRzdyMgrd1p7v/cweucCgbCNx9Cg0UIr4qauIYB
	 yy7uW8jwzDzQDYgpVHKAiXF+Xo0dFBaH8Zrpm7oM/8lh3O8zHX/4eYY/nRPsIbeIjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216943;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5epefm3iytCNHvpYEFgeTn8yCjiueOrZyY9PPe8fm6k=;
	b=fSep8Fg8uoF1x/UxSCNLvczggqskJVEO3JUJpYqmqmHgxQjVe4Dp6bT8TNylKpc+Xc8W
	 a0PUWGYcZ4x0FeYxohtvRreJRBXQOSJ7ArYSO6mK0dRwOOLrO8e5nlF5ORzU/Q0smdGYj
	 d3IcydAq8ZFVMFBcT50yyTH19FhZGVWY2t44ORPIYKJa+aNf0y6qF1C0+NPlpbcSv7les
	 ocdxsnyxAKLTRXfTxqV2VfzTC6TX50kf9fJc2cjg3ptVdJDR6HackOkc/yRQGtBA1xobt
	 iWuMJUwS5CkpuAIqF7LGg5RDJyMQzjd30vkVJyiOvDQJuV3uXOXo8d4MyyabisVO3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gaPbboOb;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413DA606A31C;
	Mon,  9 Nov 2026 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gaPbboOb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gaPbboObyo24yofG4ddTlqjq0KG08BRfY66KHrGicF15wdWbx+WmdAxusD37RHM7LPaUqpMHQeAmp
	 9/xIpaAfV0H26EOVuTykLsgRotlzSfm/MC3+NFLPOeoSrk9f7h07MsAj76XB+Tv/m6anKAACsVm4+r
	 feNWshB3loOQJ+UU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af193e7534-64302;
	Mon, 09 Nov 2026 17:35:35 +0800 (CST)
X-RM-TRANSID:2ee46af193e7534-64302
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af193e4033-8ab4b;
	Mon, 09 Nov 2026 17:35:35 +0800 (CST)
X-RM-TRANSID:2ee26af193e4033-8ab4b
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: zhujun <zhujun2@cmss.chinamobile.com>,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83793) Clamp fan control times before rounding
Date: Mon,  9 Nov 2026 17:35:33 +0800
Message-ID: <20261109093534.5447-1-zhujun2@cmss.chinamobile.com>
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

From: zhujun <zhujun2@cmss.chinamobile.com>

TIME_TO_REG() adds 50 to an unsigned long before applying its upper
bound. Writing ULONG_MAX to pwm1_stop_time therefore wraps and selects
zero instead of the maximum duration.

Clamp the duration to 25500 ms before rounding to the 100 ms register
units.

Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring driver")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/w83793.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index b1d390904fe4..b5d47c00c445 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -189,7 +189,7 @@ static inline unsigned long TIME_FROM_REG(u8 reg)
 
 static inline u8 TIME_TO_REG(unsigned long val)
 {
-	return clamp_val((val + 50) / 100, 0, 0xff);
+	return (min(val, 25500UL) + 50) / 100;
 }
 
 static inline long TEMP_FROM_REG(s8 reg)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



