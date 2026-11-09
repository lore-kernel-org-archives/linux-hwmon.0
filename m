Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212737;
	b=aqNGNJELYfCZxmFuWrrihWcsR+7/F9DvtrORRNS7QfwznA67pHD1WQ67vBduAmdNuotN
	 5UU+unOGNrZFWkJZh8ZcoqtbQB22JYRAInWqD4UvvHZX7FMaD44c7UrUsdZ6bQqg8oSiZ
	 z6PRhPAKVBkw/16Ioy8BiqIuP4/gmGvnQ670hZloz10b0rQCbMNhAuZKND9VSAECGo0RW
	 SxF2ovdTaTB/goilBE5KCsjiGHYn4Gba9jUqjJ8oEk2dXKtUm7wuAt7fF+0ET+Kzydovy
	 vEe7X7tOr0+w45YG1HFL/pxOrc0LJCJlMTnw6UgOZJc6P8ZYiXIeNvl6c2QAzonUCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tEydOwE0MMBrdiPPTgBp7lt6OIxD9/x8C1exQrN2vr8=;
	b=jp6TguwcHuIDa5Pr5+fmePXb6Ww+F8byYNHqiUL/MIjg1hRUbYCl+7/3qzXmkqCKddOh
	 6c5+ticq7CWfMmIxQpbAvT4uw7PUljKI8deu9ZUBQlSArukPRA0auzpE/96MxP9R1P7bE
	 PkKv6/bZKnu9B8C349X8www13dlK8adKDoPCeRjKLMNkMaiblIA4AhnCNjuGE90z516cc
	 ufmhGUvqC4wMkqrSr89nPujDQFmUCXi5k7g+wo4YFXCHD4vWaGIo9d3OqiJhoZp1/eHcE
	 +paluzNWLPCIGm3FMWSPARtTEiUjC+5vsZhJf08QU9W/REK0tEO4cwPOovre6U+N12A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=k9OL5x0J;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1BA606A336
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1BA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=k9OL5x0J
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id A928344B93;
	Mon,  9 Nov 2026 09:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1794212727; bh=HW4U8zlRR0okOAzuZK996itHidUw8nOtyyXpnK9xiXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9OL5x0JvC0bFGWN83a64UqrsMjtXVEN9JJnZ1KAqP7OLqAES3pzsbxZkgwVrmwpg
	 sce3oVThLf8/dOO9tfvuLj5RxWbaM017x335slNbIHGurXPNiduX7bSmtDd8FlbNj5
	 DzU5ZQ3EyQ3jrJKPIE2p6/BczSq8SCJPOxr4RWUo=
Received: from suiko.ac2.se (suiko.ac2.se [IPv6:2001:6b0:e:2018::162])
	by mail.acc.umu.se (Postfix) with ESMTP id A210544B90;
	Mon,  9 Nov 2026 09:25:26 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id 98A5142B4B; Mon,  9 Nov 2026 09:25:26 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH v2 1/3] hwmon: (nct6775) Handle dual use registers
Date: Mon,  9 Nov 2026 09:25:09 +0100
Message-ID: <20261109082511.851377-2-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109082511.851377-1-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
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

The REG_TARGET register has different meaning, depending on if pwm is in
thermal_cruise or speed_cruise.

This means we can't assume it's always word sized, so we need to handle
it differently depending on which mode we're in.

The code already does this, but the register was configured as word
sized for the speed_cruise mode, which would do the wrong thing in
thermal_cruise mode.

Signed-off-by: Anton Lundin <glance@ac2.se>
---
 drivers/hwmon/nct6775-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 6e97e4f08b90..3515a962adac 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1188,15 +1188,13 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6106:
 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
 		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
-		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
-		  reg == 0x111 || reg == 0x121 || reg == 0x131;
+		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4;
 	case nct6116:
 	case nct6126:
 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
 		  reg == 0x26 || reg == 0x28 || reg == 0x59 || reg == 0x5b ||
 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 || reg == 0xe6 ||
-		  reg == 0xe8 || reg == 0x111 || reg == 0x121 || reg == 0x131 ||
-		  reg == 0x191 || reg == 0x1a1;
+		  reg == 0xe8;
 	case nct6775:
 		return (((reg & 0xff00) == 0x100 ||
 		    (reg & 0xff00) == 0x200) &&
-- 
2.47.3

