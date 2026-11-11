Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368399;
	b=qlmAlxH7TO6oZ65GS0QkNpt1AlvZsQeZke6HUyjThbbvB2iajBZZZqpfCoKdZ3Y+s991
	 t0YIVhdFDVrCwNTcw5e0q8hOWLtTPZvma+E3rpf28ZEoA2K0ELq8FFSr+I5xnvxHNQ6gp
	 /s/ARch46GOaPguUNgm0RsBbRxJiXtSjIdHBVukoTHp1WERtgpF8IAu6HR9Wv3ft4lHD+
	 pwLfgJLPr6lHTMFA2KM0+OCzuckIG2LVVnIG8BtRC/sorMXB8pYPqzns+6ajvJGfoe6v1
	 xVPBXUdI4zvgj8yiLv/Dan5epBAjm1K/tG6dx93N3gyL5ATNdLYMQTOpVEzF5l2RnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368399;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5fLinhwgJX2k9YEqwsIt3Y/dkml1z/xDVNr7cT0K0gc=;
	b=nt9DaVt2i2r8tCOesGgLbEbbQnENpVJLaiH3O5kfrrfGQq5mN9+40ar7NPJ5pUnm8cHA
	 Q9/34lE3NZGR4oTP6lq6oElA+XDgMPdMahVHFvIuGGH1Ls7SXKQeWfyRw434wkBfrlisb
	 b4c2MwuOKTuql4tlm+2u9nCHpIG9rEKC+d35a31vPDK/WdsVr4/MUD05vjqux8fAALQtk
	 FG/GXO7ZgkZ7n2CjTA6vtfn3+uCbDxYmucjJ5rY2ASMW5jykj+Yd+9yEQQfUegi0XR8kv
	 vA59rwo425deoB84w9lMHP19CRnNnJQt2jsvgcvlNvXIIGJgAQMsHMols6bHfFTly8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cBAm2e9D;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F345606A320;
	Wed, 11 Nov 2026 03:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F345606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cBAm2e9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cBAm2e9Dtv/51H3HdH1ryJEG5YJ6ec1GtnHaztO+PqcgN3EGU3L1L/6BW0aeWkcm2ga+xzmiqNjp3
	 omprWXGZQH+DQr4hoLoe+Y7OkYgEEJkVno9EqlqvLV44hzU7pyroRDzMwtHar86MWLEQdHbpVdJM0B
	 3W/9pXU/IaFB2/ag=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af3e38bbd4-a07d2;
	Wed, 11 Nov 2026 11:39:56 +0800 (CST)
X-RM-TRANSID:2ee66af3e38bbd4-a07d2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af3e38b0cd-cd193;
	Wed, 11 Nov 2026 11:39:56 +0800 (CST)
X-RM-TRANSID:2ee16af3e38b0cd-cd193
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (nct6775) Clamp fan control times before rounding
Date: Wed, 11 Nov 2026 11:39:54 +0800
Message-ID: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
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

Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan control")
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


