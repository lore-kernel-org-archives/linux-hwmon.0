Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C6223F424
	for <linux-hwmon@vger.kernel.org>; Tue, 13 May 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135066; cv=none; b=lyZnIHhK0SedEmXB4P/RJNcSPrQtRveqkA9nmQrxEAQwitKvrd8VZ+1mhsGaQynPbX/nIksnPOLeTo8JDYbXXNBsPmyWDAi1N8+iSxuVhoIYr7ctbbc2z8rFtv1mDWoZ1BYM1BXVvtSmWTDmbXWUIV7ay/rbbPL6NrOGlQh2o2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135066; c=relaxed/simple;
	bh=gY0+lzBHxjGS8oAMdy4i3jHm+0ZUb1Gud0N76496ZYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qo0o8FOgpyepuciaosoU+fSBF+DOnqS4EBr0goRx5TJLyXwBL/VSsuFdBmQyPHBAxYN8YmIDsWxlSfaEn6ytK6EmO2egg+MZ3p4Fl5GH3d2l7N9HqUhNeAKQkds2t2G2JAPaEyJrixL/rboF2p2hz51AFBuUSQ/+N+bUVr70/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvU5kO6C; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvU5kO6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747135064; x=1778671064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gY0+lzBHxjGS8oAMdy4i3jHm+0ZUb1Gud0N76496ZYg=;
  b=YvU5kO6CAMy9r2Kg4Z4thpz2peq11Wv+55ggJJ742fEnNPlpXyktRmUZ
   ym+Xi9uVAlNNTHn+0RHWpm2tFp79KrxnRBLRNSedwrl1Dg2NuiOmjfmrR
   M+QTBGn3y0zDKf5pUh/uur7dDvsxVWrcer4RJEwvlw5Vh7gpNzmN61w+i
   rD549vuY5escTJ7+a3vm8NpyljAJTgDNdwC81zfC1KhzCFeGJtDqXu5HO
   tNmp4dQpNum9rcuN8vk9yBmPn8yAZIKRyyoqL3yo+EzucpDmP8cvM+kty
   zdTnjdpcWMOjonahzga9mqy0GOozMQA4mbXyYtThAnspSSG3TAYxSHeHP
   w==;
X-CSE-ConnectionGUID: R1KkWd5HRDuKhfsObMslOA==
X-CSE-MsgGUID: 0O2J0u0HR3WxfC9N2BmuLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74370980"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="74370980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 04:17:44 -0700
X-CSE-ConnectionGUID: hCCnSXOmRKy7hhfcrTl4aQ==
X-CSE-MsgGUID: d43umFUvTAmQfOa8rxseCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="174811890"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2025 04:17:42 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] hwmon: (lm75) Fix I3C transfer buffer pointer for incoming data
Date: Tue, 13 May 2025 14:17:39 +0300
Message-ID: <20250513111739.508886-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the I3C private transfer input buffer pointer for incoming data
instead of output buffer. For now this is harmless since both of those
pointers are union members but may confuse when reading the code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Build tested only.
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index d95a3c6c245c..9b4875e2fd8d 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -622,7 +622,7 @@ static int lm75_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
 		{
 			.rnw = true,
 			.len = 2,
-			.data.out = data->val_buf,
+			.data.in = data->val_buf,
 		},
 	};
 	int ret;
-- 
2.47.2

