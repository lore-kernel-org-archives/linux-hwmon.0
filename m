Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380002;
	b=jhaQlK7Joz9bL3pZDLmJ2xC7x8jh9pLw6hC1UJfCpSwjPxfSGYu5VHQFjEbA0yyAWeKv
	 KQcRMFyn+EM2YUekQzjZoWPJoXMHuVU9VUaCER8KE0EVIQEwcBR2gRrq27jXr+WR+Fs3x
	 9fFrwSc3gC12wQyTmacfbLwR6jOap56kc+cZ+/Lim3aL03d0H/wCo57w5Xez9zItWlV0v
	 CYZ9TL8FScFdwazxLUoltGdhnzAuBjp8+iv0sRwBsVWBEyyKJtDwzmEZ4RmPP8voZuZ/+
	 1Oi+DtsSGjMcyIuDRypptJSpC0Fbejp8Eb8pXv+B3ulKPHLTOl92JdV15TDWbKEy+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380002;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=noRZhU2ixu+Fhe7+HzZCd5lKFvGp2TNLAVj105V1WjE=;
	b=EQyVUc49IDZSUuRQW6sBHyZQkmtEmQw1cX6sI/PDHwNrIBCa4Hwq4ghNnp16xSJgjFMw
	 X6FF/mxCF2IZ4mPu7W/Bw0zTKvvcf79M4FzQNF0rEvaXeygTfkI6d+6UdfxJFBpk7tQI0
	 oaeJErS5ulveiZ1Ix9792Knyr/1utL05uhiXYBndzqpbW99nBLG91ZVEHx8ij3HeEP+8+
	 BjA+ZchYeSKMxi1T/LQZdz/inKg7UDZ6+IpcC0SpOOdxyDRR5IUf6pg/59Monxen3mpAL
	 gtfnxnkTNjZq88m8tKSy8u6WzlPKFKLA/RqDV1nd3JGLXrxfnbOxCFnskWiFHn0PSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KDkfM335;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF8E606A327;
	Wed, 11 Nov 2026 06:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF8E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KDkfM335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=KDkfM335jSXDZa1RQojQFXTuP8DjtzVfbjIni/7zXK3iXT5+ub+EZ4TfE9BNu8y6/9jlFp8tL4fo6
	 o2GqsVExbkqghCHDdL345Y5kxL8MXZN6enLAokpnfiDwGK/gbf3qKQmFxUUDtMxvKOCG+l+mirPjIT
	 X5hhwWjSsH/0/uGw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af410de67f-114ee;
	Wed, 11 Nov 2026 14:53:19 +0800 (CST)
X-RM-TRANSID:2ee26af410de67f-114ee
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af410de076-d2147;
	Wed, 11 Nov 2026 14:53:19 +0800 (CST)
X-RM-TRANSID:2ee46af410de076-d2147
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Date: Wed, 11 Nov 2026 14:53:18 +0800
Message-ID: <20261111065318.17761-1-zhujun2@cmss.chinamobile.com>
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

IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
ULONG_MAX wrap, so an excessive voltage limit can select register zero
instead of 255.

Clamp to the 0..2040 mV register range before rounding to 8 mV units.

Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83l786ng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index d16afda34e41..0cd545011e73 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -101,7 +101,7 @@ static int temp_from_reg(int val)
  * in mV as would be measured on the chip input pin, need to just
  * multiply/divide by 8 to translate from/to register values.
  */
-#define IN_TO_REG(val)		(clamp_val((((val) + 4) / 8), 0, 255))
+#define IN_TO_REG(val)		((clamp_val((val), 0, 2040) + 4) / 8)
 #define IN_FROM_REG(val)	((val) * 8)
 
 #define DIV_FROM_REG(val)	(1 << (val))
-- 
2.51.0


