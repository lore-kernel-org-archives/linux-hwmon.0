Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216527;
	b=XgWjZ9k4DJfZwZm7n0CBMhUCi0f3lPRy2v+hCk0TZywEbWIOTyh2tWd5OT2gqj6ew4qw
	 DX8ZFqF17PhuMDjPrFs0wSCK/+Vfre+UGfSyd9+BBAhsmjAsybEZRtbodydgvGHz+0v5N
	 VI/V63W/YOvdsCU5xdtmo5R3rnq3QA2vKib6Z658JmvCpMGBVIwr4WuhwC7h4QygJUjDQ
	 IiGj5oPvudlH5hqGsC7rr74CtL4hf6YcRc7GEZOKtI6UN7LY6ox0gqQSI9B/wQaOVv4U5
	 YpJM8y8B5824rEHZUfVlXBQGjsBstQtFfm72ORPAzuahjl3atf6F6XRgOYbL//IkekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216527;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YFe5M381UzkyVvvhI1VEtncAT935+GDOCxJFFsueCPE=;
	b=LQrxoFXmarPe+XgTsbQSJiovUAkUNX/Ck0BCHGZZ+RWfOFwTgARJt61aHsXYFeXZNB3o
	 97fRAYxIiP/UZ93g1Dlh0Sy6mqIqAFhr/HDpxizDEF5sL0w7rh0b5ga7LpBjT5XomFJ8B
	 yCxdphN1gKquZi74/9hlnWX3FCKzcoZ5KmH50gelmzVAbjpt/+ih5aRgiwMu8LfoVWcGN
	 90NekL3z8j63CUlO3BLtaFCtun6SWrYD9JGKSW++0E5yRwh3tTuZVDSkGZomqY8ylxs3Z
	 wzvBy7xi4stQEG6YqLyxzefb9ms0ViUnK3yPUxziYX9fp0r8WE4ZkfDUayPVsz2s9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sX+SG8KD;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FE0606D836;
	Mon,  9 Nov 2026 09:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FE0606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sX+SG8KD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sX+SG8KDcJqBNn23FT+dNZ52CXxIDzGXABSpe7nIKmqFJRz2TRbYSY0ArY7s8YMbmJ6nmPOD07cSE
	 ruurl19F3b/sjiARdDl8VOHFOAT1ufWblhgvXOSH/K/IolDI5FPqr00JSOrgjzsCjOhh0XL0cZhzzR
	 pzRYXdKMUA8dujjg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af1922e8bf-c9b66;
	Mon, 09 Nov 2026 17:28:17 +0800 (CST)
X-RM-TRANSID:2ee96af1922e8bf-c9b66
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af1922f712-8a1f5;
	Mon, 09 Nov 2026 17:28:17 +0800 (CST)
X-RM-TRANSID:2eea6af1922f712-8a1f5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83627hf) Clamp VRM9 voltage limits before subtracting
Date: Mon,  9 Nov 2026 17:28:16 +0800
Message-ID: <20261109092816.5268-1-zhujun2@cmss.chinamobile.com>
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

The VRM9 limit conversion subtracts the 700 mV offset from an unsigned
value before clamping. Writing zero to in0_min or in0_max therefore
selects register 255 instead of zero. Multiplication can also wrap for
large inputs.

Bound the input before applying the VRM9 conversion. The chosen bounds
cover the full register range and keep the arithmetic within range.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/w83627hf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index a26f4cdfb8e2..3ebb41db5033 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -853,7 +853,7 @@ static ssize_t in0_min_store(struct device *dev,
 
 		/* use VRM9 calculation */
 		data->in_min[0] =
-			clamp_val(((val * 100) - 70000 + 244) / 488, 0, 255);
+			clamp_val((clamp_val(val, 700, 2000) * 100 - 70000 + 244) / 488, 0, 255);
 	else
 		/* use VRM8 (standard) calculation */
 		data->in_min[0] = IN_TO_REG(val);
@@ -892,7 +892,7 @@ static ssize_t in0_max_store(struct device *dev,
 		
 		/* use VRM9 calculation */
 		data->in_max[0] =
-			clamp_val(((val * 100) - 70000 + 244) / 488, 0, 255);
+			clamp_val((clamp_val(val, 700, 2000) * 100 - 70000 + 244) / 488, 0, 255);
 	else
 		/* use VRM8 (standard) calculation */
 		data->in_max[0] = IN_TO_REG(val);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



