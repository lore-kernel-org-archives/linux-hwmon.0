Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219579;
	b=ZHITkZT1Fai0qUiE2uY7nT32LdPkAIv87ZH7WNxnhY3V+otibd25RPbO4Gymo885UnTU
	 nS8ZXcl3TIDcQGba5ezuZMsL+wJnq+Hym/2DECImtnm3OZr7c94EhWsZ/SbjPip89hxfh
	 MbwLA0X2RAovql1pDLUR7n7hStvFOSpTnf0xYeacYT5Oo8ScEFOkpmqXJatAtIAJA9z2y
	 e8JYsuiuyaF0sDfI6ajjiQXklfNlMmhIgXzJ2r/RgfpY5eGwOkvLCxkOy9XuIad77BFRS
	 2cSWPSPGA/05SdcpYGzeBYhW165ABjTbnRbd5NxnCh6LNeC9JNCdNpZHPnSU0edU4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219579;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aI/whF/r+V4iwwwYr2eeWmwNix4c+6rlsI46cWFLM0M=;
	b=WneA0ypVRHxdCxmsa4CpRvb/DqaUnWA5CuMWjwECRkQ8mLNQW1JF8Mv7CsF2cgZltBo2
	 fCZO64UmDT0kE4Pj32rVnhyiTnqGajjp2o9sJJYeU3mVavW++krrckxxhrgKQB0OHwI/5
	 1C490ig1iuVxJZEu+UUrR6mS+nas+KZpg25cSVbBxhPROiAng0TmD2VjJ5ldnUFzV9+dW
	 4cpIFCZpEFq3vzulRgZbGjPWdwgEPBCOb6gpFyc3nvT8g59p3Rcj97Ji+T+N2VAnIuKEU
	 fCvbBM2ePHVldC9easWeVjFV7LlxeVPlRZalN1rzpb8vdknSGkbmwTJ9R5+WZaOeTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wpx2K6Rf;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E86606A31C;
	Mon,  9 Nov 2026 10:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wpx2K6Rf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wpx2K6RfPmgZN+8oNdNYAnniODBUS3K1OLC1vGRv7nPzjYBYB+Hi2rZnwXV7GaPwTtyfdaJC4WNjx
	 3LF1EHlbc3JcZTGabMTmoD+2XT5xQevN5bWzwQF+IE8ruJqycd6EGZLirM3A54C4KH9TVc9NxX86+z
	 zxpQQGSBN3N+1EJI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af19e39c7e-64d48;
	Mon, 09 Nov 2026 18:19:37 +0800 (CST)
X-RM-TRANSID:2ee86af19e39c7e-64d48
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af19e374f0-8c087;
	Mon, 09 Nov 2026 18:19:37 +0800 (CST)
X-RM-TRANSID:2ee16af19e374f0-8c087
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm85) Bound fan stop temperatures before subtraction
Date: Mon,  9 Nov 2026 18:19:36 +0800
Message-ID: <20261109101936.17430-1-zhujun2@cmss.chinamobile.com>
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

temp_auto_temp_off_store() subtracts an unrestricted long from the zone
limit before clamping the resulting hysteresis. Extreme inputs can
overflow this subtraction and select the wrong end of the hysteresis
range.

Bound the requested stop temperature before calculating the difference.
A signed 8-bit zone limit and a maximum hysteresis of 15 degrees require
only the -143..127 degree range.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/lm85.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 80bd1f47114d..e776ec4ae40f 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1153,6 +1153,7 @@ static ssize_t temp_auto_temp_off_store(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 	min = TEMP_FROM_REG(data->zone[nr].limit);
+	val = clamp_val(val, -128000 - 15000, 127000);
 	data->zone[nr].hyst = HYST_TO_REG(min - val);
 	if (nr == 0 || nr == 1) {
 		lm85_write_value(client, LM85_REG_AFAN_HYST1,

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



