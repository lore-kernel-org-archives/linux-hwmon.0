Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379981;
	b=GaJbg7fq4dDug1lCxmh7z92QiJr61IcQvJhTfDY3l7ocDvI3A9UEpB/Vl3jVc3jyT6SW
	 7KLhxwuCJodYWLQE2naeHEigQz775SoojxoNJJrVWk6Y/CFmzwcX8NYJGrmYiEJJ2OFY+
	 9Vx4yuyZKa9a0kKCn/GoNjr85p2CQZkSbGmWgBDAnP9a8hMb661RFNvnXxBgfUgYmwJ7b
	 wfR6HhUOSd8HHd3UbBErrCjfTCiJqK0US9Kab+w9rIzUdho2qRcJ0gxuWyN7P1H834ClI
	 smbF4+wsI+tKwDHt6riNz087b9iUnvRKWB4Uu3m4ZOT09L7yFMKjK8RR23+r3DeenjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379981;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yBLNo7WeQn9QK386bwMLZP4emjRwzO2CgH1zd30UBnA=;
	b=yM9RcDqv6N/8Lbd51R6Tg1Bop2g9fQMN4ZYlK6cZBhxIQWuCD4LvwHVMMew5/9YrRFp/
	 6u6ugsrkmRTs4my8nGyTSEQaiNGBqToFCqiZsGdCVJ/YoMotSG5wyPeBWO1DnpK5Vr0zz
	 DzRAD9+gXl7hlQqX9eD2TFx91brm7YWq/XwC6wHeMjjkpzesydjCNb+Yk+lid7ubFB6+O
	 4Y+lZc1Ihp2uz5OrsogtRrWPG4NJZROBZDjv8R9mw13rqLij4IhntuAtW4NLLymcba8Kt
	 0NKFcTzCglgsB+19gzht4PL+hdZdRL1yfLac7yft9/+lnXkj3h5gAkItKk5c9H7ys9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rQ1nWOx5;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B30606A330;
	Wed, 11 Nov 2026 06:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B30606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rQ1nWOx5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rQ1nWOx5GsROHjInyd4AimNHjiNMfDP8GKNPzvKELPjfGDz4Sj0DWDD6J7z39hmVKtW0jrKokEok+
	 gC5kV/iBk0mc3CQ+7AcHdkDqyawV3UOOMzfnJoq9iEIml9/JNuG+qzhH+o8GedO5Dj6kX84n3aI5jk
	 jMu45FJVFGm57k6U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af410c3674-114e3;
	Wed, 11 Nov 2026 14:52:58 +0800 (CST)
X-RM-TRANSID:2ee26af410c3674-114e3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af410c91ea-d2319;
	Wed, 11 Nov 2026 14:52:58 +0800 (CST)
X-RM-TRANSID:2ee26af410c91ea-d2319
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: r.marek@assembler.cz
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (w83793) Clamp temperatures before rounding
Date: Wed, 11 Nov 2026 14:52:57 +0800
Message-ID: <20261111065257.17708-1-zhujun2@cmss.chinamobile.com>
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

TEMP_TO_REG() applies its rounding adjustment to an unrestricted long.
LONG_MIN minus 500 and LONG_MAX plus 500 overflow before the register
range is enforced, potentially selecting the opposite end of that range.

Clamp the input to the requested temperature range before adding the
rounding adjustment.

Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/w83793.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index e1f2708b5db6..012544b044bb 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -199,6 +199,7 @@ static inline long TEMP_FROM_REG(s8 reg)
 
 static inline s8 TEMP_TO_REG(long val, s8 min, s8 max)
 {
+	val = clamp_val(val, min * 1000, max * 1000);
 	return clamp_val((val + (val < 0 ? -500 : 500)) / 1000, min, max);
 }
 
-- 
2.51.0


