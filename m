Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64135E922;
	Fri, 29 May 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064330; cv=none; b=WYvRvVvn/lo38NkoHyDPNf5ryENC0IgoRXs6RcCxO6U8wnv1rqEQ6DfSjdLDgfdZFz7zZ1Ur1k1Ia5upOWWxBb+tK0cGRPTJlgfL8YETnQEM0st3xMk9998XsKmz3fhHuGPxt+bO84wn+Y4+WMwgoDM+HJihLSaarDSeddSGpw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064330; c=relaxed/simple;
	bh=iSiXxRrzhWzGZISK+Le9+bsD0Cr3fA711C3cf1cjna8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pif/pdWvmU5zPdJ8NQzc3cR0PfktCrZnp9Pi2pBoVIuZGgPxmOFipMKr+/Q+GWcPq+6s7SZZMkA1JXzhNikmpjD771RpYjFNGn5yfCT2IoZa61jF6Q7qZetJomkuQk9Jf8zoX2hfFacS7I0eIEQP8vOA6rzh2qplRGrIFryrie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 29 May
 2026 17:18:46 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 29 May
 2026 17:18:46 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] hwmon: it87: Clamp negative values to zero in set_fan()
Date: Fri, 29 May 2026 17:18:36 +0300
Message-ID: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

set_fan() parses user input with kstrtol() and passes the resulting
value to FAN16_TO_REG() on chips with 16-bit fan support.

Negative fan speeds are not meaningful and should be rejected before
conversion. Worst scenario, one may be able to abuse undefined
behaviour of signed overflow to possibly induce rpm * 2 == 0 in
FAN16_TO_REG(), thus causing a division by zero.

Instead, clamp val < 0 to zero and keep the conversion in its valid
input domain, avoiding unsafe arithmetic in the register conversion
path.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v2: as pointed out by sashiko-bot, returning with -EINVAL
goes against hwmon guidelines - therefore, just clamp the lower
bound and keep going. Commit description is adjusted accordingly,
as is the subject text.

v1: https://lore.kernel.org/all/20260529121141.1633588-1-n.zhandarovich@fintech.ru/
Sashiko AI review: https://lore.kernel.org/all/20260529125335.A47011F00893@smtp.kernel.org/

P.S. I've deliberately NOT addressed the pre-existing issues highlighted
by sashiko - that's for another time, I think.

 drivers/hwmon/it87.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5fd310662ee4..87edb1b6048b 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1412,6 +1412,9 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
+	if (val < 0)
+		val = 0;
+
 	err = it87_lock(data);
 	if (err)
 		return err;
