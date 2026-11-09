Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216346;
	b=rd1tvhOniRgepOcK/6bUvmGOYgrQXRW131z+0lB8/A8so29LIdMo4SuzvTE5X+Y89MSf
	 2EsiuVZ1qrf5RTHv7pvB0zn/CbQxwdNjizwddMkuCd/AN0JCV0mAYFyBAsrUcD2BdUv/R
	 doGHHBL2GO/tl1hlyVxIYpGq3xpt+aMaElqyKrk1+ixoQpGoO9cdpmP0NJgwQG9W0+ZSi
	 bMAm49305OCOnn2NsHCayXgaobyCbFDbCjFDGZdtMkyCy86n4lJXSD1F3P16YrrT3Xayx
	 Ru+Mx5VpITiVtrCtdN0VVeHfa7HWv4IKgeCsbjus29bKnzj1PSRQqw4O4GjAn8gMoUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216346;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qfXHdsXfUnus+BsSIHxkGMXWGAmMV5mnGUVwlX7rk68=;
	b=x+12L+sR8tQRkED286hazc4KnbGfKfwJGi00gu3qY7CiyJBxChn5AwH0qKofpwz6x5pP
	 oHiHIV9+/DlGgDG94sLAQWz67Cno9iKqSHC37HG5IEA+5b/SfgVI+qP5P+hJe2a9ohsMb
	 wdbEFmvx/5GIS2nAuepGJm/N5JVsbLYD2zBGevA96+faByfd96hQj7h/Arlc401gMmSEB
	 LeUW1ppnDoovQWmn48vX0ZeyYDs9eHadiqVy/olgmq2DO5WOOHuZSCbsa4FgKlPYGiWhI
	 vn8EUvB961qMmhHA7tcrc/Yop6/jRT3Eprkr6u8i9XRV6FHh8Zz6mcLWPgHQw39yOlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=J8vQAfI3;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5AF606D801;
	Mon,  9 Nov 2026 09:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5AF606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=J8vQAfI3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=J8vQAfI3gTyg0ZKQIMKppMkz57cWOqqfYvaw3tq+ZopPw5wJkTdBAQpRXoCupa6sBXqnqWv7M3oMl
	 Lmo8Oh8G9KG6frMMaNzjcEvJETXgCtcEW+BYk7pp82QIbrXufnms2I9C//ESeoCR8OQcVyoXaTzaEb
	 zRu9MrCEpfBirxuI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af1918f7b2-c9a59;
	Mon, 09 Nov 2026 17:25:35 +0800 (CST)
X-RM-TRANSID:2ee96af1918f7b2-c9a59
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af1918d8a1-8a2f6;
	Mon, 09 Nov 2026 17:25:35 +0800 (CST)
X-RM-TRANSID:2ee76af1918d8a1-8a2f6
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
Date: Mon,  9 Nov 2026 17:25:33 +0800
Message-ID: <20261109092533.5146-1-zhujun2@cmss.chinamobile.com>
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

store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
multiplies it by 100 before clamping. Large limits can therefore wrap to
a low register value. For example, 4294967296 mV becomes zero on a
64-bit system.

Keep the input as an unsigned long and bound it to the register range
before scaling.

Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and NCT6779D")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/nct6775-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 6e97e4f08b90..b7c1e8ceaac9 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1039,8 +1039,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
 }
 
-static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scales)
+static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scales)
 {
+	val = min(val, 255UL * scales[nr] / 100);
 	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scales[nr]), 0, 255);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



