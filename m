Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B51C6F76
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732191508; cv=none; b=qSp4GQziHV/1U1UDi1+iBbCHY+Mqc9SHtIVZR9PakAQkT+vFNr0O70+OY6OHhD1PfpJn0tUF+dEKgeGG1NFb5QSg2yA7B6DxJcTuaeKGK1ikqDCT+FGqWkjaS87A1nKhyzrHP5LtzhVleQyQrAk1av9XxF870mzhpQ29Spy1Jhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732191508; c=relaxed/simple;
	bh=w1GT8u9LhZuFjvunp8xyoZ0ltpUBijG3KqDlLJrGbcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wk2/KLLaV56yhTHFSJm7FJ/vGOGyqbQuD0omgS9bBh0/YixrqEjoodlx8/Zyc5/A7iw1Nlb0xa5/rctZRv4TK/a4YWVFy7Cz3kGAGJ1Ia5az6B3Dk9pb7Qd7VqrqpKrdObZf2PpVOwiXjZqpwIJ36PU3ZKw5XBHdoWjE5qC2LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKBUSNNh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKBUSNNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732191507; x=1763727507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w1GT8u9LhZuFjvunp8xyoZ0ltpUBijG3KqDlLJrGbcY=;
  b=PKBUSNNhM3NdO5fEegnzbb7thT25B9s4luLUsA9XbS1ueV4BjJ0Zl8y/
   7CPCzudaifQJNj3XiLzxKWsVpogyzdS5cq4aLMlg+RlUH5ypTPv/V5n30
   3GVkq9WcODCbEySeg/JEF1SNNfimQ+h5DSTKGKvRAy9hOGIpCJMKrH7hd
   xa2djfNUJPZxx5rSwpldshNvFVMeIXAR+WtX/dHFvXihqWmenLxSbwJKL
   Nzkrkr2lJSqGNEYjuR8HL5I/ZKKIj6FLvN5GFPNcc4QrZbgHlLRkTj+cv
   gGz4riOpCWp4LxRz6g4CWZ9Aa01MfAF/q9DDpNAUN2yMii3r+uNegT+e8
   g==;
X-CSE-ConnectionGUID: 66fgeexxRfC63mYCGIDWEg==
X-CSE-MsgGUID: rDyzNxrgTvSD9JwgaHqepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49825295"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="49825295"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 04:18:26 -0800
X-CSE-ConnectionGUID: Rh4lGZiTS32H8l9ZqoXe0Q==
X-CSE-MsgGUID: BR4gJesbQ1KPhvcrmEj3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="94689093"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2024 04:18:25 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] hwmon: (tmp108) Do not fail in I3C probe when I3C regmap is a module
Date: Thu, 21 Nov 2024 14:18:19 +0200
Message-ID: <20241121121819.393104-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I3C device probe fails when CONFIG_REGMAP_I3C=m:

	p3t1085_i3c 0-23615290090: error -ENODEV: Failed to register i3c regmap

Fix this by using the IS_ENABLED(CONFIG_REGMAP_I3C) macro in the code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/hwmon/tmp108.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 1f36af2cd2d9..3dcbbb05ab2b 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -452,7 +452,7 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
 	struct device *dev = i3cdev_to_dev(i3cdev);
 	struct regmap *regmap;
 
-#ifdef CONFIG_REGMAP_I3C
+#if IS_ENABLED(CONFIG_REGMAP_I3C)
 	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
 #else
 	regmap = ERR_PTR(-ENODEV);
-- 
2.45.2

