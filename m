Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379914;
	b=FIv2nLp1E19SvZVlrY6ELYjrd+syU8nWpEYCvY1JIggB/tLKIscD5/NeJaGCaCpEsAc9
	 brWUaCdsnXNPsXlMUCOXr8uoMaYHfdjl2TAb3+hwzGg1ej9XKYhgBzD95qhAxSqTVXg6c
	 Un1E9hTuaPT8J+IebfzLimo8jyhuPSaXP7x9uIbR3F6CyALeEy3GtgSfy+1wV8KEG61Mj
	 2u+57i6Hw3kKYcwb7uzm+pUV52OixQGniJLKiGu+TDmmVMModiogqLASrczIseeStYQq6
	 AiG2UYwgPiaJT899mlPz1M+SKvYhnVkxqFYi6QO7E16Qq+K6yS1e4HOdHqjygynsZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379914;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vMpt5ff6+AXGfR4OFKswlTPiTNNPJO0ctcjTwlF1qEg=;
	b=zEa2asd0PO0ze189BxbCFnkoMik6LHuq4TgxekFkWdIrboYgQEw2H0Im8mkr5Sx/cyR7
	 +slM0H5eaHWY85NK+JBccFNrnY8aZzMndE1Txuuo4ko7jaajrue3hSCqmVxDkmM+cQKZ5
	 vo9tHfyMrKWMj9d1dr82j9LEDONIEHgMcdt+n4fBQcJK7vuVTg9YFe4nNvcTttf4AyKQH
	 ulMOzIo+6EAiG8C39mvejojbgtZf3jT4T4mj0k2xcBvFR7IhiFaeCqqMp+unqswjbxVHP
	 EDeaftVQp5xoC1KXyj8ZmwxY4DVavwUrFsO7vVSa7CkC4biEb/M9ox7DGaJLxSebfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HvqPV+Ts;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885B5606A31C;
	Wed, 11 Nov 2026 06:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HvqPV+Ts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HvqPV+TswH1YfZj/ClmLysgym1txX/HLTcxiv19SwRtSgQQGVxGLRRAwm7z/jzMVeEj0LNXpc3sdV
	 jLg8n5rGvhQg6PEz29+whtqeEHFmPcobReAhofCTZ7fLrBha8q/YC8LksvfNvin6HeRhZGf9vbW9LJ
	 PvvINkPnHdfVkSgg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af4108365d-da9c0;
	Wed, 11 Nov 2026 14:51:52 +0800 (CST)
X-RM-TRANSID:2ee96af4108365d-da9c0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af410859c4-d1bb7;
	Wed, 11 Nov 2026 14:51:52 +0800 (CST)
X-RM-TRANSID:2eea6af410859c4-d1bb7
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83793) Clamp fan control times before rounding
Date: Wed, 11 Nov 2026 14:51:50 +0800
Message-ID: <20261111065151.17581-1-zhujun2@cmss.chinamobile.com>
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

TIME_TO_REG() adds 50 to an unsigned long before applying its upper
bound. Writing ULONG_MAX to pwm1_stop_time therefore wraps and selects
zero instead of the maximum duration.

Clamp the duration to 25500 ms before rounding to the 100 ms register
units.

Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
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
-- 
2.51.0


