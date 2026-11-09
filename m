Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216898;
	b=z4jXZk2aN21e3prhnfQkaRnrmbnw3ytwbk1tArGOgKtGAAlfcYo+5ozicDXOnhqSuEZB
	 jdXNdrWvzSqZILMte4YDkF/yNgiaxghy/Y1OzSz7sIB3aKS0Wn7Xhjubakwj6boqR62Gm
	 cQIgDRnX45AQa7AlCq0Tk7BXdZLt0B/VvQJkFH6adPJGDjy8vmSXH2G5H9Lolr9g0pw9W
	 GZWl1FO2PFGUpwnXkJXEov0J96MBLRg3PhYv00AWnaGrjWaoOylX/BsbM56j9TFnb03nw
	 LEY+IpwPMC59levUUYZtXy+HZIBVjSy779FKtGRDDPb79WkDrbGnRC0D4/+J8J6kyIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216898;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CccmnGlyZTrd/PG02GZ7dzxSrKeyP9/QKdo873Q3FrE=;
	b=GG9dtIqPmx0mrfsjEDLcunA06OJu3M5e+or5i/1hm6gWPi5gw8Mj39A/wF7dJWw5IhVd
	 OP63ZibuAfAwyj3Ya+hsaax5k+iqwrY9mW3L/6DMTfyB4LjHvf0GRq3/lAV7qK1yN5QuU
	 +jw7LLY6FburkZr8caQaJP3zErVAErtpzWDYOEsBAXQ2hAc4hjZSSua8dWI6jHnA07zW+
	 eDpKXbB6IeIjNDHSjDrWWoMqvoJmEL+knK+oX9K/MVpgaOPP9d14yEVNa34YXId2/aFQh
	 Ag0mhI3UiF7GDWREcL1LFHkrUCglBONrHqyU1nG30sengzQ1mVQQh2Z7MBaDrFtO+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="iG/8bH2q";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0224606A336;
	Mon,  9 Nov 2026 09:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0224606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=iG/8bH2q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=iG/8bH2q1T9bGAdxLuhqgb6v9+0swHsRT/b44WyKCBGYT8f4EccUwAOfQEtGMMJvK2mpLa/1g4LY9
	 aayrO89joKkWLN3gK6k5X6FUPUUkeMrJ0R67fErmKpvFww5nSVppW/K+YtKUcCgbR1QaekIJs5pIKT
	 aUTBmQSOL/DlU+2c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af193bd4c6-9101e;
	Mon, 09 Nov 2026 17:34:54 +0800 (CST)
X-RM-TRANSID:2ee66af193bd4c6-9101e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af193bc3ce-89f97;
	Mon, 09 Nov 2026 17:34:54 +0800 (CST)
X-RM-TRANSID:2ee36af193bc3ce-89f97
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: ckeepax@opensource.cirrus.com
Cc: zhujun <zhujun2@cmss.chinamobile.com>,
	rf@opensource.cirrus.com,
	linux@roeck-us.net,
	patches@opensource.cirrus.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero readings
Date: Mon,  9 Nov 2026 17:33:32 +0800
Message-ID: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
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

A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
in the rounding expression then exceed the width of u64. UBSAN reports a
shift exponent of 149, and the conversion can return a nonzero reading.

Return zero when the required right shift is at least 64 bits. With the
supported precisions, the scaled mantissa is too small to round up in
this case.

Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/lochnagar-hwmon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 24a255d4c46b..328589e19917 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -74,6 +74,8 @@ static long float_to_long(u32 data, u32 precision)
 
 	if (fls64(man) + exp > (int)sizeof(long) * 8 - 1)
 		result = LONG_MAX;
+	else if (exp <= -64)
+		result = 0;
 	else if (exp < 0)
 		result = (man + (1ull << (-exp - 1))) >> -exp;
 	else

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



