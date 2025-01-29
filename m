Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7D915B102;
	Wed, 29 Jan 2025 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164043; cv=none; b=db/y2eCQSgW4m8Kq4RWeb6ZHa6Mf4Gl4ynyotjO2q1nQJCvTCESr4Fj5YC+I6yOp0NSJQ4YMuLMKc7PLc9ldEnAgukqmwBwfIPxKHLAEWXw9cmbI/PtVBj7b4k+Lt75eEkjjqSAMdhTJKHkZzOxYzjmp71ejAhzWC97d13ZntII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164043; c=relaxed/simple;
	bh=zbcMbQ9t/cyVVXS+L5s1JmeFHntC1ivSHMYA0kAZako=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWPPFcmoKbuLUCGAA6tgUr4Y/VCeiNljt/B2rpbjlu6iAs1DONj8/tNHnIIWhXsGwptzWmK5aI0GXBIhLuysmveheFzvZGCmVpp8OSJ2/7plICrXeehxlHg83TGoGVYHPdj1esWGi8YSEE2/o32PbNAOkjDiEFPxqXJEhEy/bk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klJZPxl0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klJZPxl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738164042; x=1769700042;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zbcMbQ9t/cyVVXS+L5s1JmeFHntC1ivSHMYA0kAZako=;
  b=klJZPxl0yClz4jGfJUFgXU0+NILogfQe+3m2OaoTS2DgOiNTP9D2ddyF
   NT0FrvZG17g1lx+sQ5csabCs02daWEjzyDVBMEUABJEOQNWSA0Xmmd738
   w1Unwpn5VumuwVvSQL4etd/r0R7gIpFL2esuh86sLB38jywh/p+RsnQwC
   44udJOYmvoM8GGhD76oCQg4VfaRYAfJ3acqJKwSVcJxTmj4g7q2jCDSbf
   20rwPscA+L4JJzDhfq/QsCLx/GcfuAPg1HiezawPLZh3h8K0Eao0zBmQr
   TN1C8/ReVvX5PznyJZcS8TdRLRsKYRPxTkgt5gu/Dl9f5m3wyccmFbGYU
   A==;
X-CSE-ConnectionGUID: /4NBxs1KR+G0pfdvp0MU3Q==
X-CSE-MsgGUID: IlDKq1b6RAKo0IwknumGPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37878898"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="37878898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 07:20:41 -0800
X-CSE-ConnectionGUID: +x1/4nCHSsOBO5kSWxlkkQ==
X-CSE-MsgGUID: wsWu4Z1NRT2CIUWshFfibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146258295"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2025 07:20:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B8A44303; Wed, 29 Jan 2025 17:20:37 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tim Harvey <tharvey@gateworks.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] hwmon: (gsc) drop unneeded assignment for cache_type
Date: Wed, 29 Jan 2025 17:20:36 +0200
Message-ID: <20250129152036.1797725-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

REGCACHE_NONE is the default type of the cache when not provided.
Drop unneeded explicit assignment to it.

Note, it's defined to 0, and if ever be redefined, it will break
literally a lot of the drivers, so it very unlikely to happen.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/gsc-hwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
index 14a6385cd7cc..0f9af82cebec 100644
--- a/drivers/hwmon/gsc-hwmon.c
+++ b/drivers/hwmon/gsc-hwmon.c
@@ -47,7 +47,6 @@ static const struct regmap_bus gsc_hwmon_regmap_bus = {
 static const struct regmap_config gsc_hwmon_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.cache_type = REGCACHE_NONE,
 };
 
 static ssize_t pwm_auto_point_temp_show(struct device *dev,
-- 
2.43.0.rc1.1336.g36b5255a03ac

