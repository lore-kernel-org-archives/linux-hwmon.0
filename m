Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C133A711;
	Thu, 19 Feb 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509998; cv=none; b=aUJduGdIc29i8u3FfnEk9N4PnwPtwIctGBTSRLAHLS+BYSbgw3qTjO24EhVxGMr/mtgAgipS3qpPcLovvzf9XfimJlBxHSf+pfMK5okUD0+prXiFSvfOTkWmp0G2Du63qwz01V7b9fuyaMNNOalqVZJa52yaIlXNKYIxn8mhP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509998; c=relaxed/simple;
	bh=IhI3L3rAWYl4pNKbiKS7sS+Pb5jF4gnLyZSTl98SmpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAH+Yep3p9qzi+KpTfTyLDfEkRW0kSIGY+52ZNT9QU8tK1nvTkR5Y7Wt2kpGOpVDiLSFWYX0+74GX3buS6AeMnWcO4N5SfXjdQQe3dD7Lw5hRnHv/Tbh8nXnkZwOsREG1TyvwlH+cxRtq4MUkyUSgya4lWjqXYmYy3PA6W1mm0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcMDN2W9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcMDN2W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771509995; x=1803045995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IhI3L3rAWYl4pNKbiKS7sS+Pb5jF4gnLyZSTl98SmpQ=;
  b=kcMDN2W9pr94KuedpELk5NBK+8QZOUyc+DxTEx6SLYa4xdnvAPpZEGDp
   SG94N3FoNehAMXrFrvL3LQmU5Fq7E9OC4+swajO/vSaPspzM2V/1EGVMJ
   EsLiYyu77sodafEnBDw3B+bQ3x4nW94nnb5MZ0SdtN55nsOXgeYcDLab0
   B9S1cjXDOnYpdJxt1E05d6AJVjBUimg6DRSLrBnbTINZBj/5Zm0mMbj2M
   TnhTwGO8YWGk25vxK/1+oeWvKrALYj468YHJII0XIfRDkDLNXTCktyQd5
   Ir5PTcYmzmvLFP06W7aAFAXODTWF6/LcR43y0lZUQyqi3hlGHc+zV5lOk
   Q==;
X-CSE-ConnectionGUID: sOb+qwSnRqW8KMQgc7l/DA==
X-CSE-MsgGUID: mjfBSSrXTPCzTz8lrjasdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95212441"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="95212441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:06:17 -0800
X-CSE-ConnectionGUID: lqT8Vh8kQQOEufhfyOw52g==
X-CSE-MsgGUID: mLgUEBQ3QHmEaf0HUQLCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="218656746"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 06:06:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F82795; Thu, 19 Feb 2026 15:05:33 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors when parsing properties
Date: Thu, 19 Feb 2026 15:05:32 +0100
Message-ID: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
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
 drivers/hwmon/isl28022.c | 42 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index c2e559dde63f..c69ff4a46525 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -337,21 +337,28 @@ DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
  */
 static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
 {
+	const char *propname;
 	u32 val;
 	int err;
 
-	err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
-	if (err == -EINVAL)
+	propname = "shunt-resistor-micro-ohms";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 10000;
-	else if (err < 0)
-		return err;
+	}
 	data->shunt = val;
 
-	err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
-	if (err == -EINVAL)
+	propname = "renesas,shunt-range-microvolt";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 320000;
-	else if (err < 0)
-		return err;
+	}
 
 	switch (val) {
 	case 40000:
@@ -375,20 +382,19 @@ static int isl28022_read_properties(struct device *dev, struct isl28022_data *da
 			goto shunt_invalid;
 		break;
 	default:
-		return dev_err_probe(dev, -EINVAL,
-				     "renesas,shunt-range-microvolt invalid value %d\n",
-				     val);
+		return dev_err_probe(dev, -EINVAL, "%s invalid value %u\n", propname, val);
 	}
 
-	err = device_property_read_u32(dev, "renesas,average-samples", &val);
-	if (err == -EINVAL)
+	propname = "renesas,average-samples";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 1;
-	else if (err < 0)
-		return err;
+	}
 	if (val > 128 || hweight32(val) != 1)
-		return dev_err_probe(dev, -EINVAL,
-				     "renesas,average-samples invalid value %d\n",
-				     val);
+		return dev_err_probe(dev, -EINVAL, "%s invalid value %u\n", propname, val);
 
 	data->average = val;
 
-- 
2.50.1

