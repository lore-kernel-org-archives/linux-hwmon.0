Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC72FE595;
	Thu, 19 Feb 2026 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510782; cv=none; b=trZJ1sTrbp0HMgYEtgekWz5pTM9DtJlW+/GBNwqsiEjfVqg301sIvF0wMZjxKsHyGsoqgAD+xSFLjQb+t2VgUAUF5a3pE+KNhlRO6mz4C4s+Ie6g9uc7qVqxwwsfG+seFzHl6xjTVQsQ2d0SPO5nEirSqSTXJEaq4kUE4JyOtqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510782; c=relaxed/simple;
	bh=IRpBLuLzGHIddcMfQ75xS8Ln6pi7VinWgbojxD7TkzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVKyhswabczviM0Zj3BD/nJMRVFxAlP9i+3z9xhPkIgOJj1/MvD/pcGFrr1YwS4IuUOKNVVg4XbyykwrC9m2qBUbueeCfNphAAKJcaz5ffQEHPdpiehc6M7E3y47LaGZ1X0JMN0LgCopm5eBp+lg85pUxhLm9nL4Hz+OqgXhhCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJJrBORv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJJrBORv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771510780; x=1803046780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IRpBLuLzGHIddcMfQ75xS8Ln6pi7VinWgbojxD7TkzI=;
  b=FJJrBORvGc53yNR3B17XC5glGxehCt+B/1ZMg2+4p4Di5Fd5GNDlmjP0
   reQ33dXe1zMo8EvatgWwi+HJy2U3t/3c2KZ4VfffQyElQf/f4wmnMcxYc
   imNrxjQ70PjATol4AeNR3uwTjqZzVA3Xbm/Qvhj2bsUryQYwfCvO7D6Ce
   yLGgidZQeJzhz7cYvc0LXO7IvUuIDYW24yoo5R+c33WfCCSSlefB8G6g2
   dL9iB2zig12+/TqSKa/EaP7jfpmUn1bBXgLs7BWH+cZfw7SwHmUgRnFCI
   rmJ3CTOIr04UcLbHYvVe2UlQ1Imz+eozxQoKLtsasX4RKyr3U0k9LUbp3
   w==;
X-CSE-ConnectionGUID: nZ1g1xhJRwip9beOIwKfKQ==
X-CSE-MsgGUID: xY3qUmYYRLGHOEY4qSQA3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72299926"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72299926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:19:40 -0800
X-CSE-ConnectionGUID: 38MoKa7QTuGmazWhgjsUxg==
X-CSE-MsgGUID: Z1Ok0cYPTNKHdwZI5Loa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="237516998"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2026 06:19:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CD25C95; Thu, 19 Feb 2026 15:19:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v1 1/1] hwmon: (pmbus/tps25990) Don't check for specific errors when parsing properties
Date: Thu, 19 Feb 2026 15:19:36 +0100
Message-ID: <20260219141936.2259945-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of checking for the specific error codes (that can be considered
a layering violation to some extent) check for the property existence first
and then either parse it, or apply a default value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/pmbus/tps25990.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index c13edd7e1abf..05c6288ecafc 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -402,12 +402,18 @@ static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
-	u32 rimon = TPS25990_DEFAULT_RIMON;
+	const char *propname;
+	u32 rimon;
 	int ret;
 
-	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
-	if (ret < 0 && ret != -EINVAL)
-		return dev_err_probe(dev, ret, "failed to get rimon\n");
+	propname = "ti,rimon-micro-ohms";
+	if (device_property_present(dev, propname)) {
+		ret = device_property_read_u32(dev, propname, &rimon);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get %s\n", propname);
+	} else {
+		rimon = TPS25990_DEFAULT_RIMON;
+	}
 
 	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
-- 
2.50.1

