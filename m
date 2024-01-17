Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180531DFC7
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jan 2024 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491854; cv=none; b=RipcoWXetpHKc2JAo2W8MXBgz4AgEasNLzeLPhrWR4J0NtQGBIwCq8qn4z8xpgAX0v1/VscrktBndm1K8hboXa5NOaRaeEpkLiK1ggyFYFsIEPTV7cv+uSwITWo+cRVgMbqhjBHNRlXCL8SGrYgA5bgu9n6ZZHUfZafLqEebjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491854; c=relaxed/simple;
	bh=pTfztx2ZiRJwezRcJP06laRz8Itf7QlEbx3jpyO9d20=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Organization:Content-Transfer-Encoding; b=YCa/6+Yq7cqluZYHc+jwDeeKUQ1EUKKfE6if0UsyEtsLXAhRjDDKB3TNV9Gk3rZG3jgBgERNuzOI5V89+fGPEnq+1xvsb7KDYnHsdwmg39PuglefM98jAWSDy8RKcCHa+J6ZNxOGIVvFXBworZ743wLaxCCdhLflGp13a6l/oEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkQM+NlV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkQM+NlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705491853; x=1737027853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pTfztx2ZiRJwezRcJP06laRz8Itf7QlEbx3jpyO9d20=;
  b=HkQM+NlVNJVzn0WuKSV9fCs+lLAFse+/spSnQwZPhbNhpWxE/SxjIV0u
   5T2wyY1g7paSrUBFsazO1fqBD0eJi0QN7foUdfL2uTOm21jTg7YozZ+mg
   7T74DJzH7+9jtRKb/qujmsYj3FRFyNNOnCQRcAH7cz/+2Hsao0zbQ9VLi
   s4CJsdF//JeRHNmJpVYOnUvLxTvptVv14/D2fVlFXpYPuixsbG3GeEyt0
   2/xtxHNk5lXWSVmJlHFDbw1YmFtyxpEe2Are5jv9Kw0oGRVZqrtnoUFCm
   k9mmrJYhhGVvGqpWgG7Oa3yJI+oWPutpK7+FGqUC7kltIwr9JljNgaxkP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6850992"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6850992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="10890"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.230])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:44:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-hwmon@vger.kernel.org
Cc: jani.nikula@intel.com,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: put HWMON_CHANNEL_INFO() initializers in rodata
Date: Wed, 17 Jan 2024 13:44:05 +0200
Message-Id: <20240117114405.1506775-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

HWMON_CHANNEL_INFO() is supposed to be used as initializer for arrays of
const struct hwmon_channel_info *. However, without explicit const,
HWMON_CHANNEL_INFO() creates mutable compound literals, and the const
pointers point at the mutable data. Add const to place the data in
rodata.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/hwmon.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 8cd6a6b33593..c2c0da18dfa3 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -425,12 +425,12 @@ struct hwmon_channel_info {
 	const u32 *config;
 };
 
-#define HWMON_CHANNEL_INFO(stype, ...)	\
-	(&(struct hwmon_channel_info) {	\
-		.type = hwmon_##stype,	\
-		.config = (u32 []) {	\
-			__VA_ARGS__, 0	\
-		}			\
+#define HWMON_CHANNEL_INFO(stype, ...)		\
+	(&(const struct hwmon_channel_info) {	\
+		.type = hwmon_##stype,		\
+		.config = (const u32 []) {	\
+			__VA_ARGS__, 0		\
+		}				\
 	})
 
 /**
-- 
2.39.2

