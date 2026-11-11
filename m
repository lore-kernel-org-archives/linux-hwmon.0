Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368188;
	b=KhcXSwGdXe5wHmgpgxPvqgn1oT1C9A/Z3QcastOQgfqMQTtK0z9wQEfKYZI43CmyHMQ1
	 KEloonok4RItJXI/qYn+WxyHV+W5kSeRaNOTOaKcWXc/SMDlpsk0lOI4x5IwmwGobmM2s
	 QCfcfIw+0+5b1izGYAAmZ8QQGBFLYdNeZpXcztbFKV07aKJyOaXw3/5NqX/OesRdcwUGN
	 w7LsOKsBCPuNva1uRnyeDgG1PgUo0W1WwKMwKgHIJz15tQqJdUiwJMD2D9gyWX6xPTi3P
	 5ZwJII8T4dlyaUriXh5Sq04ulIHNlOmNKsVX177CHswsUy0UiYIeDTix46f/PhHSGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368188;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h+asT6Z6u2feDlgtLUhSK+NEqUgeX4OV2tY+xo+MfSE=;
	b=XU34FSVM+dKtskbJk3Pz0L0tszypoDbP3GukGCk7exWVtEW9E6ni4bUV7Ko/JngfCo2U
	 WwuTOhW2R5zMB8JsgycGMAQOs8iqFPKapW71U1bOj8ffw/XgMF5TGXduXOBj/W4W3oCLe
	 65F2TPyGsSB8ZrFibhJV7uPRf4JSX3vX6oYv8lHEfQ89s1mMIYxF7QfKaowBorgvzBYwa
	 zAJ7/1YRqvRe5BLVK329bqxsMH0npuu3uNH3s2tBiAVhEvO6CZVNoOQY/MjhHCmkzvRSv
	 oafl/hB1um08zo3g36DA7loMtBh7cjnkyHYpW+45s3Bbv7j4CNl/J4xQNemhV5czh8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=D7LtlWdB;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB31606A31C;
	Wed, 11 Nov 2026 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB31606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=D7LtlWdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=D7LtlWdBqsM14Qxp/UAaofNttIDNF8Pw8qAafLYh3xXuQVSb1XdMCstU9SdQLgAlkN45OMnnFs7CX
	 x/ZdHhgBg1eSM7mfUAEO2nMajeiN5kjzFSLf6RS6mKXOjIET2UiUXs7nocMFtyeKzsQv67pFxSzDBI
	 oVwOCv1H35FHQ/Gg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af3e2b9fe8-d15d0;
	Wed, 11 Nov 2026 11:36:25 +0800 (CST)
X-RM-TRANSID:2ee56af3e2b9fe8-d15d0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af3e2b886d-cc97f;
	Wed, 11 Nov 2026 11:36:25 +0800 (CST)
X-RM-TRANSID:2eea6af3e2b886d-cc97f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
Date: Wed, 11 Nov 2026 11:36:23 +0800
Message-ID: <20261111033623.12046-1-zhujun2@cmss.chinamobile.com>
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

store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
multiplies it by 100 before clamping. Large limits can therefore wrap to
a low register value. For example, 4294967296 mV becomes zero on a
64-bit system.

Keep the input as an unsigned long and bound it to the register range
before scaling.

Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and NCT6779D")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
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
 
-- 
2.51.0


