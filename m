Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216697;
	b=tET/eF7e/zDyOODq+uM/DQm88SzB76mF/xAwmuFBCXOfhamZTP6e/kpBAr08kbNdD3vm
	 Ip9NKCjz4/yvCK/dsZwERf+U6czCcOLPbbyCxBpoGjG4C/drWJ0HCTEzk1krtzYWCS5c4
	 BHyWcPjQI8N1nTt+jtPJpNRqz3hG5DqZqBvJbKnZv1XCs657eyu2XMQZBFCUVLAHFpJ4Q
	 79ULIEJylTCbzAYnT5iQqrYVGJ7noGFiBflPlqL8QDFwZ4ECNHIs6qGHbxuACHiQg2z9p
	 RZHixJ80RYWHd24uu+VGmPnDCXSLJTayMc9o6UWBxn5wbtfDhrOfBTR9atI5yqo4zYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216697;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UEkoYDZOcVKxuoW8wOq3CEGN4rx1+YBHcmQ67dl9SYg=;
	b=hDNziVLgApCF0b2vXwECl6oqYWm+qRxApubob0WUiuIXTEcIbJwgnFcEYJupZAi2GCj3
	 g/yh65352Tkr0Pf+sKTakGPwDKJ9SCNO7ozFBAKJapaDMkyJ/lOx2cPJiMv6WONKj2m5y
	 ipmRVEOF6PHhq7pZZcvS0wCm8kPg65ofjltokHIXDFAxyp0zgwKTBJQ2YYdgumnk4AXVY
	 ZWXn95VJp/mlJ9KekxRuL9yT/0UsL2+kIetNQtR9VSgYBYioexU3XB+BwpDBN44DK3RWT
	 JKM+LWM7HxTFBuVlPDLDXW43s4XqCw7n6f0NK4oom7Q9u7Nws6+NK+FSJwJKtaMHVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NToRjnAf;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C2C606A32A;
	Mon,  9 Nov 2026 09:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NToRjnAf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NToRjnAfXn401e/HdHQ93ymD6kEQfMgpkz84eqgEZv4HB0jBRMidO4GICFPez3V9GYQdYPOp5H7k7
	 XVNxTJOVHsqsRsvGy2kRuHRweSpiFhVZMVLnFZriiRVG5xlnDYdfHrRHK0rSTpVrP0XmzO4ApZNccf
	 rzFqknGzqurOlQ9M=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af192f3032-90783;
	Mon, 09 Nov 2026 17:31:34 +0800 (CST)
X-RM-TRANSID:2ee36af192f3032-90783
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af192f5d6d-8a83f;
	Mon, 09 Nov 2026 17:31:34 +0800 (CST)
X-RM-TRANSID:2ee66af192f5d6d-8a83f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83793) Prevent underflow when removing voltage offsets
Date: Mon,  9 Nov 2026 17:31:32 +0800
Message-ID: <20261109093132.5347-1-zhujun2@cmss.chinamobile.com>
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

The 5VDD and 5VSB limit conversion subtracts the voltage offset from an
unsigned value. A requested limit below the offset wraps and is clamped
to 255. For example, writing zero to in7_min selects the highest limit
instead of the lowest.

Limit the subtraction to the converted input so that values below the
offset select register zero.

Fixes: ddca933bd554 ("hwmon/w83793: Remove the description of AMDSI and update the voltage formula")
---
Validation: x86-64 and i386 driver objects built with W=1.
Source-extracted boundary tests passed on 32-bit and 64-bit;
the corresponding test fails on the base revision. I/O is mocked.
No physical sensor hardware or booted-kernel test was available.
OpenAI Codex assisted analysis, code, tests and changelog drafting.
The human submitter must review and add their Signed-off-by.

 drivers/hwmon/w83793.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index e1f2708b5db6..b1d390904fe4 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -991,7 +991,7 @@ store_in(struct device *dev, struct device_attribute *attr,
 	if (index > 2) {
 		/* fix the limit values of 5VDD and 5VSB to ALARM mechanism */
 		if (nr == 1 || nr == 2)
-			val -= scale_in_add[index] / scale_in[index];
+			val -= min_t(unsigned long, val, scale_in_add[index] / scale_in[index]);
 		val = clamp_val(val, 0, 255);
 	} else {
 		val = clamp_val(val, 0, 0x3FF);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.0



