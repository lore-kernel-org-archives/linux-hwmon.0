Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365170;
	b=0G5gy93gP8USVHL82BzGuaQ+rTul3hLyJcItUpJ+JmLYbEMdiQdVHk3+uhlx4S4pc0wT
	 72uSQWoQ7WDMVc8S7kIhfh3oKjOouqt6TzBvYPWKOOw1WjT8vRj7GzT2slETn4Uis/i+C
	 FU5trq5VadMeG1JzCGHx0N2hVqkuBDpvZf+1ge+YpEOmD9jU6PLROYlAQTZqsoWHWnHKC
	 CYMZFNmkpNPLCAkuu0Yx+sDFwxUUgGKd+GgkM77aLBxHx17l7AwgguSCe5Gr3wbK1Xigr
	 Vaaej1KiQ9Q2vDLDaBn5MZ9BKpK9RxmGj9rg3VoUwOi7P4az3TtwSnlXuhseL/mTwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365170;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XcJQtx1mPw+4XJgEUHSFDFHWrbgGMFpi1vVAjJ6961Q=;
	b=xMaRcDGJV9OjRyDmE+MYBIQttDInQX3xpOQF+BdoSIB4fXpBPY3Af505XD+ITV8zqJo9
	 Vnao119ENVT7hQmOVKaqVjv0G1FYMI8ZQotnXxooPYI4W9CCIuk62/l3F6Epc6iqpP0nR
	 1FbUR7OfEJDA9NDCUThDaAvVvhoitCVUAAi+nRVye9bY6k7+Sb7Dx9grLNc9eOffyrvf4
	 bnfyF/G+v0MNHx5d8nGkZFe5sAEUyEqj45fKBFBIesgy9fv48awaUh8MKAn+xtTgXBVJH
	 Rxit2LPRY2VnZFEs5nQ5ksKsOApS6dW+JOHs49RFsFE+J+ynBYQ/tfR6RK9Zgk7wVTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="fuPF/sxM";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA86606A31C;
	Wed, 11 Nov 2026 02:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fuPF/sxM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fuPF/sxMUed8E6iLORCYvYBceEzi/uC+v866iLXlneo3Y9hXwcZXUNrY7L+BjZ4i+11hNUTfYohjk
	 TAuBwg7VKnEuyineI691Cuqlb3NE3vdlPPxVW54bT24BSt9y+uSnay1VeVfBhC+LgsyS4XoZ+XQwhN
	 +3iIy4WBVAnJGx6o=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af3d6efde8-9f5fb;
	Wed, 11 Nov 2026 10:46:08 +0800 (CST)
X-RM-TRANSID:2ee36af3d6efde8-9f5fb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af3d6ef1fe-cb5b4;
	Wed, 11 Nov 2026 10:46:08 +0800 (CST)
X-RM-TRANSID:2ee56af3d6ef1fe-cb5b4
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (nct6775) Clamp fan control times before rounding
Date: Wed, 11 Nov 2026 10:46:06 +0800
Message-ID: <20261111024607.9712-1-zhujun2@cmss.chinamobile.com>
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

store_fan_time() accepts an unsigned long, but step_time_to_reg()
narrows it to unsigned int and adds the rounding adjustment before
clamping. For example, 4294967295 ms wraps and selects register 1
instead of 255 in either mode.

Preserve the input width and clamp to the maximum duration for the
selected mode before rounding.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/nct6775-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 6e97e4f08b90..76b2c9551a1c 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -949,8 +949,9 @@ static unsigned int step_time_from_reg(u8 reg, u8 mode)
 	return mode ? 400 * reg : 100 * reg;
 }
 
-static u8 step_time_to_reg(unsigned int msec, u8 mode)
+static u8 step_time_to_reg(unsigned long msec, u8 mode)
 {
+	msec = min(msec, 255UL * (mode ? 400 : 100));
 	return clamp_val((mode ? (msec + 200) / 400 :
 					(msec + 50) / 100), 1, 255);
 }
-- 
2.51.0


