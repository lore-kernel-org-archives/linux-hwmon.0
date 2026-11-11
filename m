Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379962;
	b=gRbZIIKKmyevX537EdobTFiS99xWrgSap6rmpxTWS+DiiKOeToanAd4ftIikuKK14VVQ
	 ppjl8PWslhwfm4Z0Ucls9EhrA/RRE4pehEq2+ylKztO4GQVcSRaAuvDRf61FBYSSjvNR/
	 dkXzm+wr8iCHp5H/kI0cguNz4LTZkTudDiT4MEs42+sk7kuGnIZK6/G6+57m5kWkqg0ey
	 CMxgX1nFV9C+mz2EHuzkATc2OZgVZJjGfAISzISfzbff1HW5htEk/GDRoEk7sdaNyeZm6
	 DF+AFUxkvO0PZSX3otadcz/KSOAZoBWiTycOH0P+o3FDfyi9704kRawDzxPNM4TLv2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379962;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j4vnQ5lSsZx9toALfXNv2skyxwYx2SlWvwjbTBv9/8w=;
	b=3ca/1Q/lvCeKs7xphlNcxgJCYjvpbm9sA2rO8+IzUpp/b4aA87YyWp74BLGAFS/G+7OZ
	 r/yCu6qxA2ds4tvVnqgV++/W8xa0XhktHTct+oZGfg4gjKyub5vFRe/msG2Ydy0cxQO8o
	 IcJf/WXZu2tSXV8ZipJgGNKGh2rH44HNwN63tHow1qUd4XteCQ4wfQcGW5PjZfA1Qn1ov
	 9fLPkViRmp8/MVr8rLP2BWnJTQBJSfAbx4xDUNuDIayyJcj/GcCzyfwefiaUvAG73CXzd
	 W6n9oXArZ3D2I7JRe5jkA2rBLAANeracUyQtyV86iHWkwu9jLFzaBkRWI9Y1+1/i47g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RDHoVFbU;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0130606A31C;
	Wed, 11 Nov 2026 06:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0130606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RDHoVFbU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RDHoVFbUx29sMJrXz9YEaN7oqabgiLSnZpT88ym7w5yVRBGQFim1qVLuZZ/GqOCcjcFq0m/2GL3WR
	 FMsnN/wR7gQqp35j1OERjreUJDo5DquRoUtOAF+ACp/r0RmJw2ls7rqFMeKofqRYSBYZi2Lx7j06/W
	 dpnA4LTRLjDqmNAA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af410b6307-751a2;
	Wed, 11 Nov 2026 14:52:39 +0800 (CST)
X-RM-TRANSID:2ee46af410b6307-751a2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af410b6a2e-d1c21;
	Wed, 11 Nov 2026 14:52:39 +0800 (CST)
X-RM-TRANSID:2eea6af410b6a2e-d1c21
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83627ehf) Clamp fan control times before rounding
Date: Wed, 11 Nov 2026 14:52:38 +0800
Message-ID: <20261111065238.17669-1-zhujun2@cmss.chinamobile.com>
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

The fan time stores pass an unsigned long to step_time_to_reg(), which
takes unsigned int. Large values can be truncated or overflow when the
rounding adjustment is added. For example, 4294967295 ms selects
register 1 instead of 255.

Keep the input as unsigned long and bound it to the maximum duration
before applying the PWM or DC mode conversion.

Fixes: 08c79950a047 ("hwmon: Add fan speed control features to w83627ehf")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83627ehf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 9c08ab662dc6..5bcb0a5fd095 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -258,8 +258,9 @@ static inline unsigned int step_time_from_reg(u8 reg, u8 mode)
 	return mode ? 100 * reg : 400 * reg;
 }
 
-static inline u8 step_time_to_reg(unsigned int msec, u8 mode)
+static inline u8 step_time_to_reg(unsigned long msec, u8 mode)
 {
+	msec = min(msec, 255UL * (mode ? 100 : 400));
 	return clamp_val((mode ? (msec + 50) / 100 : (msec + 200) / 400),
 			 1, 255);
 }
-- 
2.51.0


