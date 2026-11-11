Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379762;
	b=G482DJd3UTFg3+vf5nGtUsPGLe2RHC8s1ubHeHKbPOePkxyXZjrIYoF7OoKEDPxGjGbT
	 FBIDwuC0XqNDR13zA8cIXO0Ycnbd/2bm55zu08YMqAf7i8YbAkEDFR5jgXUDSryHiQZ9e
	 uSQmnfwxXnnNn6DeAGFX92V5itn6UhJCeSj02Xg0U9skq2MZzy9MWY8mTC1BhqwHi30UF
	 MAEhw9DAxZW5yrTffv2HFKUEildxEggpZTNoVMQTn5r5JDfd+n/B7704RI5vw7I9xkVFM
	 y+3lVFFzTnweADuJ6x0DcMb6LjPoDxKmOFqOVwmYkJcdNngr7be7msmD8zHg+FXlCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379762;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xkpj1lO79c1/TUpQnAIXl8Olf3PW+13rCgUHV46glFU=;
	b=4KlhgWNbWtARrsg4jv7JYYnDsTV7KInebbu7mfzawWZTgmVKIozTQqLZVa/YbJiyACI1
	 +J4RXfIaWjhSscddqSEnevyDbUqM4JibPkW4lW9bhNcttnGke6niVw2PfrLMtJ+g9JwGH
	 eJp2lMVpHrT5UUaKbbiuOSVmQ/rqoVVQh5wwIJo2zsK9Wxh1gKAfbQQq+KCHUXjHyGZBm
	 ud8dSOUeTFdyUuZYhQjwXJzLkGCJiFaJRYd7V2xbcYJaDRxKZ2NUE/lsYy7iUnCAuV6aN
	 JBhREly1LvPnUoOjGANbsTNxk7QzM7SWQrsGCD+d0aP8QYHM/T2nqG5xWnGkZxPhIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=y1TyqzF9;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61395606A320;
	Wed, 11 Nov 2026 06:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61395606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=y1TyqzF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=y1TyqzF93LV5bZ4GWt0vwxjLDwlzLgvODiGJ/yuIiJiiG0Zo2wCdA5GQ8FtAXSvhN6yPeXKOyr+Jb
	 GrEjd9DAvjyYa6NvhlIwqN7Q/I7YDs76xiGhXztOuEOvSPWBJmbNXnpIhefBuMWrIUqDk0xPykigbS
	 mS6WEEBMIGvrIf70=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af40fef726-d604d;
	Wed, 11 Nov 2026 14:49:19 +0800 (CST)
X-RM-TRANSID:2ee76af40fef726-d604d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af40feee84-d1f55;
	Wed, 11 Nov 2026 14:49:19 +0800 (CST)
X-RM-TRANSID:2ee46af40feee84-d1f55
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83793) Prevent underflow when removing voltage offsets
Date: Wed, 11 Nov 2026 14:49:17 +0800
Message-ID: <20261111064918.17360-1-zhujun2@cmss.chinamobile.com>
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

The 5VDD and 5VSB limit conversion subtracts the voltage offset from an
unsigned value. A requested limit below the offset wraps and is clamped
to 255. For example, writing zero to in7_min selects the highest limit
instead of the lowest.

Limit the subtraction to the converted input so that values below the
offset select register zero.

Fixes: ddca933bd554 ("hwmon/w83793: Remove the description of AMDSI and update the voltage formula")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
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
-- 
2.51.0


