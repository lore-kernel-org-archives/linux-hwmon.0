Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74551775E;
	Fri,  2 Feb 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706858445; cv=none; b=Xfk13ku2IVoZ+qQosD3DupDNCS99MYmePTYCEB+aGtUlDyCjUfiQWLnwYzc2n2znCTDfvQXmadSQg3YEXq/oouIR9BNA4qVyxSrSlzGCRNB7subwQfpSThdEEkgTsSdUyopIJlfEerzcPPNpr/p+FZHwHTgFMZnnSMxpzzCA/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706858445; c=relaxed/simple;
	bh=qlntNth0RXcSnYhNbqtRg+OIdlLVtBaRFzpek3tUy5s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s+aQkv1+LgHOGbHnqm4wUUMVSfPtiwzV+K2y3pQUCb++6UXwBk34FtEA+t2/TZCeuPIzN4phy6krk8nJYsI0jVbWYTSVKBR7nrZy+m027kzlnrGXVt2Kcj+bKM9e9SiErZfI7MKuKhqP2LrqDzLdf0LIP9hXSlXPgepL7fh3wNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id YZV00129;
        Fri, 02 Feb 2024 15:19:29 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.34; Fri, 2 Feb 2024 15:19:28 +0800
From: Bo Liu <liubo03@inspur.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] hwmon: (max31760) convert to use maple tree register cache
Date: Fri, 2 Feb 2024 02:19:27 -0500
Message-ID: <20240202071927.41213-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
tUid: 2024202151929b4fb47d161eaa3d764adf7a3275918be
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/hwmon/max31760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 1b6f71bc61cb..127e31ca3c87 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -60,7 +60,7 @@ static const struct regmap_config regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x5B,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.volatile_reg = max31760_volatile_reg,
 };
 
-- 
2.18.2

