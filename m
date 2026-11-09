Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219422;
	b=h57ZToNFgNoAoPo/cuSyJ9PJm0Oi6/DEmzzQ5jVKMZRb8l+J/ypdiuEo0T/6yEfJF5OR
	 eMFs9+288Y01WRd2KD/l/OImD3JGTgFaPjMW2NiG4t03qiPb4EBHCrZekUf+qXlKdwuHv
	 wt465/z0OdHpI1MJnnFRxWN5Q1OWwoRhCzY7clPnzSW55/eT7Itfl6g34JpBds5CXbCoJ
	 rE6HeCKUHACX5J5CNZF3gTEV4C1wzOS8y0YQgStZFc2TTnXB4s4eUyRyA+4aq+qGNE4sJ
	 2Z/2VU1MpZnhZSJJ5rEl/Mpt740QV+m1ceFiwvLGGdDVBSPu03+8nILTe/E35f/nNGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219422;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gOHCe4hDhs4ZH7TGCggKPRPlRIeYbewm1vhOq46tUng=;
	b=3eNz0ZV5l4Jv/2AjOJEvEKE8945CLHyO4BNs7iVO8wfg/NPmoVUgRiT4WHlEDDJnqOzh
	 qTWgKIA/rSTUM+Wvux5Ed5EvMECZKA7bJXSYV4TJmhKKP8p4SkXZHRcTBh7uRCZJmmprl
	 g9xDLzHSQSQrCHaFJU46jAD9MLcMUT1sT4kFlI7qHWcM1gNdgixFtgAu6BgVCND4wNbzb
	 gFZLP3DPzolro+N9pJud9EG18iBB0e54XeADVaFlZpyR56B7aV1+s3IgGvUqZnISMRRwT
	 3Od1u+E53lDpYy74qC/+PneBhqcfZn7AZtG3snEc2savXOg+suJSzLNDT2FMo93kYOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="QsTL/tl4";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12B9606A334;
	Mon,  9 Nov 2026 10:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12B9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QsTL/tl4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QsTL/tl404m1yyUYEw5Xmasl4WpHcIBHTEGcg83fahmifDUMvV4Fsu+I+qsQ045m9G/vupzjIZdZH
	 TM5JZ7fzJy64Sf4kjtdmgkFcps8ET8StQO6TOq8czxBEOyQp1sDoPm9ZtUufyEmTdeIx1/HE2VqH/P
	 Z2kIj/rfxDR/Y1Wk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af19d9904e-00dea;
	Mon, 09 Nov 2026 18:16:58 +0800 (CST)
X-RM-TRANSID:2ee26af19d9904e-00dea
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af19d98fb9-8baa9;
	Mon, 09 Nov 2026 18:16:58 +0800 (CST)
X-RM-TRANSID:2eea6af19d98fb9-8baa9
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83627ehf) Clamp fan control times before rounding
Date: Mon,  9 Nov 2026 18:16:57 +0800
Message-ID: <20261109101657.16793-1-zhujun2@cmss.chinamobile.com>
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
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

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

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



