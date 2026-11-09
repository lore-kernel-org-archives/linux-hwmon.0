Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216467;
	b=pk7/H259VO8Q31ULMptec2xxvPfbsaPl8GPnH8MehvpsaJtTXWsyv9GLb2R+qK9C0h50
	 ArQgeCSDvWp8HMqPOcExgsKA75pH2jxCgIIJJCn2QrFyb5W1/BxJeTpTVB5gXKniX0Jyo
	 Mdqc4udWJrB2U3uJZ0PEZP0g1/50MKC8IkTO97rvkDe7h+UkjLjQseenySmG/n3W7MubT
	 AGbviMoNxOvW7RRCdC3MzK73swSLDM+EJDvCNZBCpegy/6NUfK4mBQL3V6Jd/M/aZ884U
	 6XUA+3PNIGCLwk5MyxHbsU6W8h2KKrq2VP5W/JBa3Qtxlxt9C/6n82ADfCuKZTr/6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216467;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=COKdZQL3jJUwS6T4HR9QIsBxi3XU0uMXPEwivp9Nz8E=;
	b=uX5PKbjXh2HFg7Lh/DYehLJoqhPwyLN9Q8/ElZpsA5kNetRfmd2WGBUwMADneUD8Qew0
	 m5mIkNC4C1fCf+kCg01R494zGaTZ6kCp8NtWqpLQipmN60m0Rp5m7gxtYsRxAux6mVfKB
	 DHofydtlG+M/KhNBZHz48YgCt47SnN1Qh4a+7leG7d29C41NCco2SYwZ3vMh/zlonSdLS
	 1ajlYtN8urmV1it2A/lNNNr5L2yKGpQlsGpZffKNvVRRuY0s6F8C8KhgPAF/8X84ZseV9
	 LDrY/Fp8FX1JGpm3hAB5F/uNcXAjZ7UMpsh72DUbuA3NEdclcXkpjd56P595DfzEnhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ut6QWepl;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CB1606A323;
	Mon,  9 Nov 2026 09:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CB1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ut6QWepl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ut6QWepltfWQqGGqVt0TGrW4yTVHkyBkz9AcBO0zBsb7AJL+lbNocdunU1I15xLxAkqZIDhQRPb28
	 ircgY+o2ngUWM3bqJTemJjWxJZx3mNZ8LPJ7Uh8umnZ25qyVcPZ3q5jMcptKOCyzQc3iu6LitXZXmi
	 96YynXLNcEmEkGhs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af1920fbe5-9ff9f;
	Mon, 09 Nov 2026 17:27:43 +0800 (CST)
X-RM-TRANSID:2ee16af1920fbe5-9ff9f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af1920eb3e-8a6b6;
	Mon, 09 Nov 2026 17:27:43 +0800 (CST)
X-RM-TRANSID:2ee16af1920eb3e-8a6b6
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (it87) Clamp voltage limits before multiplication
Date: Mon,  9 Nov 2026 17:27:42 +0800
Message-ID: <20261109092742.5237-1-zhujun2@cmss.chinamobile.com>
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

set_in() accepts an unsigned long, but in_to_reg() converts it to long
and multiplies it by 10 before clamping. Large positive limits can
become negative and select register zero instead of the maximum.

Keep the unsigned input type and clamp the voltage before scaling it by
the ADC resolution.

Fixes: ead8080351c9 ("hwmon: (it87) Add support for IT8732F")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/it87.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index bbb3f9788c2e..632d98ade940 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -738,8 +738,9 @@ static int adc_lsb(const struct it87_data *data, int nr)
 	return lsb;
 }
 
-static u8 in_to_reg(const struct it87_data *data, int nr, long val)
+static u8 in_to_reg(const struct it87_data *data, int nr, unsigned long val)
 {
+	val = min(val, 255UL * adc_lsb(data, nr) / 10);
 	val = DIV_ROUND_CLOSEST(val * 10, adc_lsb(data, nr));
 	return clamp_val(val, 0, 255);
 }

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



