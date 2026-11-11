Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379996;
	b=m8oULxl0LHCMLOmVNSVMGQhDmXUTmhF6eLmPWDEtYQD8xccHSAN/GfYKXx5JYw4T+GKQ
	 y1sNkMsrma/ulcR3IIPa2ryLmGlWyUvIR2JGpgVWghfCyZT0TFY139x0hmGb6SqzXQ6dJ
	 xUuYupoCPidgMi9WuVdRVSDVDOnoIstqQB/jCVMsHDG4oDNUCw1c0RIqjqoKoP1Ak6JzF
	 d7UXbZlnRnyF+TJYTPc225hcxFyAFdtt0XUz5QQ6fQ3tp09v3k0lr1FwywwkdDka4LX+N
	 qMV0AnFRZQ1K3WKYBguAlEmmGj59isRt6vf6FdB2FK4PmPxtoLgLpRvwGIn6BEBsFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379996;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vzVmZo5Yu8WbtnqnqJUDiuOMynld+P73JEtDj5C2IZg=;
	b=d0Aa7Et8d7R4O72aQiNUk0/+qYsGkHtFw36LxQxhe0iSxWccWXvoJzkdSDB02Z1p3ec1
	 br7fvLJyeHO7nsEgOYUT4q/OGG0OnpMSrTd6w7pJTWbcEQKd7mjAhZ4E6j5BKjIH9BqFI
	 vBTfquqIlFimZlF9fj9ofQI5n3Cd8sZxyD2IINmej6bD0Ooyjl11IT73JeumBMOdoOM2x
	 n1WKJjVI8LhNgIq/b04xNSIbHYb0k+XUgG6F5rngQYziJ2m2lZy+FnYxCMqUjQxSmEFIY
	 Wode8nmy3vHzlSszlEKRG2OsskG9lTIuByQowgNeZlV8u9xMpa1BdBtcVTBieS/Y4KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SaCAUyWt;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE90606A327;
	Wed, 11 Nov 2026 06:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SaCAUyWt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=SaCAUyWt+k6cdT0k38Rb85LQHeXIYw7opCwNWuNbS1HCsfP3IHuF8IPOeatQO5K9jDrJAAMyjoLMz
	 khNmkv9ftxeMxK9l5skM4yCSQ+aRHcBoXI89dJjAI+EZ3kSGtbIzrUxBllr/LD7AMXqCIeQMd4ZTzd
	 gTSg538tJCg7Jni4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af410d273b-d2d2c;
	Wed, 11 Nov 2026 14:53:14 +0800 (CST)
X-RM-TRANSID:2ee56af410d273b-d2d2c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af410d9a79-d1c6c;
	Wed, 11 Nov 2026 14:53:14 +0800 (CST)
X-RM-TRANSID:2eea6af410d9a79-d1c6c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: m.hulsman@tudelft.nl
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83791d) Clamp voltage limits before rounding
Date: Wed, 11 Nov 2026 14:53:13 +0800
Message-ID: <20261111065313.17748-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds the rounding adjustment before checking the register
range. For an unsigned sysfs input such as ULONG_MAX, this addition
wraps and selects zero instead of the maximum voltage limit.

Clamp the millivolt value to the representable range before rounding to
16 mV register units.

Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring driver for the Winbond W83791D")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83791d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 8bb457326c0b..41c73fca388d 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -207,7 +207,7 @@ static inline int w83791d_write(struct i2c_client *client, u8 reg, u8 value)
  * in mV as would be measured on the chip input pin, need to just
  * multiply/divide by 16 to translate from/to register values.
  */
-#define IN_TO_REG(val)		(clamp_val((((val) + 8) / 16), 0, 255))
+#define IN_TO_REG(val)		((clamp_val((val), 0, 4080) + 8) / 16)
 #define IN_FROM_REG(val)	((val) * 16)
 
 static u8 fan_to_reg(long rpm, int div)
-- 
2.51.0


