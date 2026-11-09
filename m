Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219484;
	b=VAX+MAYUnJX5yJLb4vDMDdfdAjsQnBIOlNvQqd8oajZnU/19uKqgWg6glzs3AwGYfvZb
	 N96DeNe7tOYN45ZoR1kp8KSafSk8TlKELr6FoszrWKqmlPrrNK6MhvTj0f6BiC9IcXg9F
	 es35ZtHBIrBtAuBJx6ft0Ea8bzwZK5dnwklPwk0ghD0+Fx8T3UNYydu2fm5anPMYIs3iv
	 zR57D3xelXf1aVMxLqmUqSjqZxDrDkepu6VS46E1vLSj7wA7IISRBs/7SDIAYAXzRupWw
	 WZhGGH2PjOEL0JuL9csLa36MABoIgC3PFg/fYQasID1ocEalIYEQjDf04apO4GJlYow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219484;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0vUeR1piG+LWbEjKikDCbahj8rmm8R3X1liybPqq/WI=;
	b=sgs9cJxt20uDfhY89JrjsOLk7NZG1M2WSjZYmoCaeUyV2o4VniplveQsNCiRHHZpt96V
	 +BYvZk5OegUznIZm/+TWJXdX/76mW5SC5yQm7vCufrKKVgzPB31p2Ixl9WZ4lWJI8mTKj
	 MOLcdPRwS65Hdq82DmMkNRldjY+qr3kWAanQ06LCaaRhWb/nn+GfUTEKCW/xmee5HLT2Y
	 1Cd2/OaJR+x84xLPJQuW3JY2d4bGRqAuP60NOKHAfolX6a6+NoKcKF8gv9tMusszdxt1s
	 AEWuMIz5miAELlNvt04dET/XRs2h7RBfLEA00lgLMYMc05gDjGW9EiXT6X50nxKrR+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vfVMF0q9;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5195606A330;
	Mon,  9 Nov 2026 10:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5195606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vfVMF0q9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vfVMF0q9vXPAlaspKREfbRRApfVYDBr1/nyWPbO93mopZ6PqnU+sE7JZDxnQzu60ZPadiuacvfK8f
	 AThrSjd7dsv3HGpeYCRG823tf9oBC3M3Cv0jjs523j77JM1SzvixU8c+mCVlvsJNTevr2WslFkSfkN
	 r5RhSvsa2hKct9C0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af19dd91dd-ca486;
	Mon, 09 Nov 2026 18:18:01 +0800 (CST)
X-RM-TRANSID:2ee96af19dd91dd-ca486
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af19dd80a4-8bb8f;
	Mon, 09 Nov 2026 18:18:01 +0800 (CST)
X-RM-TRANSID:2ee86af19dd80a4-8bb8f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (w83793) Clamp temperatures before rounding
Date: Mon,  9 Nov 2026 18:18:00 +0800
Message-ID: <20261109101800.17028-1-zhujun2@cmss.chinamobile.com>
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

TEMP_TO_REG() applies its rounding adjustment to an unrestricted long.
LONG_MIN minus 500 and LONG_MAX plus 500 overflow before the register
range is enforced, potentially selecting the opposite end of that range.

Clamp the input to the requested temperature range before adding the
rounding adjustment.

Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring driver")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/w83793.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index e1f2708b5db6..012544b044bb 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -199,6 +199,7 @@ static inline long TEMP_FROM_REG(s8 reg)
 
 static inline s8 TEMP_TO_REG(long val, s8 min, s8 max)
 {
+	val = clamp_val(val, min * 1000, max * 1000);
 	return clamp_val((val + (val < 0 ? -500 : 500)) / 1000, min, max);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



