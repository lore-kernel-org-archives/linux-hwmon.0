Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219401;
	b=L1UG/SOdwLNEGD8+5qM+rjUgM18LRsLgkpmXTf8yeAXsMAARbwRu20VhHrmk9xcm/JeX
	 3q3BMkcPxJ9Wb5aV2ef4EEzgqo1MRPB7qa541g/rHIuMAIotT+FpIW9WdH7o36fpYZndU
	 ZQy8HKyK/ICyjowUz8ytE0NHg3EwGkV+xqiZYjdYLxLGGo5UbRu4tlETm0113TqQX+zB2
	 1YS0rPTbmKPNfGttpzYi7HyStqC5RgOTcFBw5ECvMxu1zcJtF3cDg+h7iikMe+fSyVDj9
	 Kcyjq5wrl4xdZhsm5HHJVbcf/rUHQihJfjW0y0ksYONOv5UIMqh7Y85dVZ/9eMjmm7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219401;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SYuSauNZpFX6/3SylEF/UGKBHMPf6eSYH+o8mdKbxYQ=;
	b=X37cZd6UWTdBJ9eUL6rI3pfrzgLYBiYQBy6J57HjVt65e4uOAm3FLX20bZh3xqQZ7x0F
	 1tUA6nPl4vcR4TJdCX5Evc7kdZOvP9aCpE0gvd3jnfJKkpfFDlhWWoiuYQnsdpPjMqH7+
	 cL491mxGuZT59IRCVIpbDWJNdlr/nBqfNC3NOA3BFRXDrHK3ygoRE3NrAXmtJHp+WPvsu
	 0hw9Xc92EaAakRyNwacZWJPyzq4U58arOQ8EFGk5XLRbndT6MAmU8L6VPuSZFwX/UT6VA
	 j+trAyyYacjdU5K1xlsCUUbgTgwVZF7hKCo7s+MsJwraZvi2NEmBTE7PSwK6fKtm30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=F720lMUv;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D39606A31C;
	Mon,  9 Nov 2026 10:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=F720lMUv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=F720lMUvGqlflwf5l8iGllkfVqZBGp28jjtZVVlCKWPQ8f4d95kc4cc3poO4wH5fUGCD7yYer0fXr
	 z2tNK+NMwf65YBREwtBi0KYgyU0lUIYofzwGjeqBGt8/Mv5cTuL/NSF8YWmUjnSMunLLOuMwgwvVMo
	 TBfkvMsMTlU523eM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af19d7e240-c5a9d;
	Mon, 09 Nov 2026 18:16:30 +0800 (CST)
X-RM-TRANSID:2ee76af19d7e240-c5a9d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af19d7d011-8bafc;
	Mon, 09 Nov 2026 18:16:30 +0800 (CST)
X-RM-TRANSID:2ee86af19d7d011-8bafc
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) Clamp fan control times before rounding
Date: Mon,  9 Nov 2026 18:16:29 +0800
Message-ID: <20261109101629.16713-1-zhujun2@cmss.chinamobile.com>
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
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on both word sizes;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor or booted-kernel testing was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
Please review and add your own Signed-off-by before submitting.

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

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



