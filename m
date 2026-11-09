Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219450;
	b=U51CXNt/cWICLWkZiHTvIcPhsaxf2RojZmEisp1zjASb9bHSCMz5z6UX1JYAoYXjcLbi
	 ARwyvSHgTOmBi9lEICfGnLLcQsnRcIZ+vc7GZDEU0O1KHNpsZXpDFWlUVqqcfbIeRPDvi
	 PdLKzctz4tMlygpaHuaTqqvZQRSC+nPHZVchFLdulGjqd6DGTfHWgAfX8I2//B3v45yzZ
	 5NPKLn6qmcwPXK50Ez/nEbNQ4m+KVkHs5oaB3/BTvWj6rSG32NJVUL74a+h+5bgrKZXds
	 WHTB3WhHCcxybjzn8xalUxqWupNMS61tmFibA9cvSp5E7YCObrEAOUipnnmE5LjVGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219450;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cTz+IlTqa5+jcSZYqRGk9nQTbICrUS28laYZWZAnGYE=;
	b=1ywL0N2ce+e3uhgRQSYdYKob8OHkosXpHfqGxFCYjE5eVUFbgzxYj4rg3tM9CKWcA72R
	 oJn9+jqUIfn8n3YpG4DYMZGrgxpHGTXVZWoyitubP2D3KzVpE0bnHTBFSuGzhj74OXFrI
	 JtS0KZefUEErnBOahseVsAHSG49EXhP+GbNaYOMUhT/OncEQAsD7yLjsJJUleU0XRI2jU
	 751pJD+YpGpMOTfewr68K5Iiy6agWAfSn19l3AaYlZIWsm+lbJeT7utsAoEf64y36Kike
	 SOzmL/EBgts7lRAwNCqSTd4g55Ke1r42nhznBeNHKlLf2OQ43EG42/TXv78BuhIm3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZetOdvQi;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13642606A31C;
	Mon,  9 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13642606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZetOdvQi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZetOdvQiVmrP7ehBMjuoEFVlyWk/ZtrjqE9BkPSj1RaJQleBq0O2tWofqv02QDxv5nEmKBun0MHDE
	 dgSdJy/9TUxXWOQPDWwo0D7/yQ6efNrMcAhLADB0f4hrBKLQmd534jGymUGRnESmLJQmidVvOEwbr8
	 VuPV9jeYeQEhcB/E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af19db01cd-ca476;
	Mon, 09 Nov 2026 18:17:27 +0800 (CST)
X-RM-TRANSID:2ee96af19db01cd-ca476
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af19db540f-8bfa5;
	Mon, 09 Nov 2026 18:17:27 +0800 (CST)
X-RM-TRANSID:2ee16af19db540f-8bfa5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (it87) Bound 16-bit fan limits before conversion
Date: Mon,  9 Nov 2026 18:17:26 +0800
Message-ID: <20261109101726.16875-1-zhujun2@cmss.chinamobile.com>
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

FAN16_TO_REG() doubles an unrestricted positive long and adds 1350000
before dividing. Large fan limits can overflow these intermediate values
and select an incorrect tachometer limit. Converting LONG_MAX can select
0xfffe instead of 1.

Apply the same RPM bound used by the 8-bit conversion before doing the
arithmetic. Keep zero as the alarm-disable value.

Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

 drivers/hwmon/it87.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index bbb3f9788c2e..b8ad1ed043b3 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -761,6 +761,7 @@ static inline u16 FAN16_TO_REG(long rpm)
 {
 	if (rpm == 0)
 		return 0xffff;
+	rpm = clamp_val(rpm, 1, 1000000);
 	return clamp_val((1350000 + rpm) / (rpm * 2), 1, 0xfffe);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



