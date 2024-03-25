Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD5B1BC37;
	Mon, 25 Mar 2024 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370524; cv=none; b=VQbTKkZiTYJ8ye0mvZK0VqxmVwnLXDqln9CdxzSJ35MTvbdkKanlmLXidYkf6kPn6TKBIGzwoz6Ud1RfMCaf6FQ/umHwpySTDiQiXx3XW6KSrIfUpTWhNMaEuhQrxsee5srKJmb7hqZn6tLvOe+Al3gkyfpmQi1zW1aoS0U7qZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370524; c=relaxed/simple;
	bh=i0tU8/jslENub8ambUGTS6pvJE+6XorTSNkMipA4ZBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naUq00SIN5MFgLnXL79eB1x+Gm3LNneYgXY4niGBlWbbbMFMFW8sZXKk6ZoJKfGscusOFMzQ35skmAyQFoNvXMKBwS3E2HKgfrvdbHHrPs1+XV1qBYP3YcpaHAnUqDcmezm7DrIbgC/p03kiawSp+/OTI1R2CrIOpEn7mnIPo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1rg/OJx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1rg/OJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711370522; x=1742906522;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i0tU8/jslENub8ambUGTS6pvJE+6XorTSNkMipA4ZBw=;
  b=T1rg/OJxPcRwVvsppyCx2w21DpGW4XIRu29UHiT8mrDUEWLaFNavXAkL
   7hOqixnMg1dSVxZCZ4h04qxTl9FnFbR4o3XfnOFMK3KGfmJGdyG9zOjBm
   6Fpua9CkAFy5aJIGPap03Vz6TeFi6dj5ZlQFCceROklj/sRhYq5NAWQNQ
   up/dOfIW05ublfhgRHAeD3zAmZILo3lPdMqxRaLB0v7CG9dUMJJFl1t4J
   TVHM4cXXNBLSyMNMUmhYSxrJjXTjO7+C2482oXAW1CYkTdsYoILmcCPjA
   4aubO+x6+xhNiLaafUWB1QeQhXFSnPMlDdshkRV6YOrpnK+gv7ZvC5i7f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6550865"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6550865"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 05:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070366"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="937070366"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 05:41:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2177F13F; Mon, 25 Mar 2024 14:41:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Radu Sabau <radu.sabau@analog.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 1/1] hwmon: pmbus: adp1050: Don't use "proxy" headers
Date: Mon, 25 Mar 2024 14:41:56 +0200
Message-ID: <20240325124156.3036266-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/pmbus/adp1050.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index 0a49bea8e13b..ea08554662d5 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -5,12 +5,10 @@
  * Copyright (C) 2024 Analog Devices, Inc.
  */
 #include <linux/bits.h>
-#include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+
 #include "pmbus.h"
 
 static struct pmbus_driver_info adp1050_info = {
-- 
2.43.0.rc1.1.gbec44491f096

