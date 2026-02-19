Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6B72622;
	Thu, 19 Feb 2026 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510538; cv=none; b=rdZPmfcYwRdAtskewiFdPPhX0P5T4ZbtbLB+YkxeYMyUHOZATGv5D37IMOMsI9JHJIZ7958Onc5+Jo4yvPpHRBAwtKHAtdeRQAeA4R59zyvqo2FXxyyf2N4XHmVbIen4XYXVZN2Fsvp5ybwmAqmHEpZ9nI+yuRJrfOgn7jq/FM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510538; c=relaxed/simple;
	bh=2V3owxPSjB1+q6E8Ac4rwhxAfiqj0jsT6YrI60GI9PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYNMjai4gGFr86cb82Q+N+b/RR1SJwm5XUdGIDFbAWb7s+QZVoMTRRkK1PVsm3fEe/DUJta6TtlGb5kBrYmt+XvC6FnNjSgAS3h4eOiiI/PZuKpnBbGwvC0DmgZ+xEGXVdq4ziHcA3uRO8oq9u1OygIyXK/mNdA94Zy01m8CntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLs16+yV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLs16+yV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771510537; x=1803046537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2V3owxPSjB1+q6E8Ac4rwhxAfiqj0jsT6YrI60GI9PU=;
  b=mLs16+yVpU/4Iu32+hZTHce3U8gU5hOK+mC1KSsPgvn9sNxgvUEyNziB
   nnL2bYDKci1RE8yOZ+WJ9Z9nhBr3F9DBhOR57XD0AtXTrenzQ1U36Vm/N
   wsuiHB7PlhZJ9TJKeeTEKQChNEX8bpgjF8ZETJAdg5y9qBa8rldx1uEcd
   13E5lcYkl71ggHASYZKLzIT3QNYHZrv1SOOvs5TuaLgjgW+Xal0d4GfNv
   Sq4vlc2z5UA0rNEItd26eGsfYhs0pqkS4eJ0FkPbx/bEMNIF6RL6SUt0T
   YbyZfhCewI3vA/v/IrMUyS3heChwYXJUYnjJss3G9Aw2TihPNCspjNU45
   g==;
X-CSE-ConnectionGUID: DFEFpKMaRZWZnO2dTLaImw==
X-CSE-MsgGUID: oK63cdpTRD2y/pDekodUHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83701377"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="83701377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:15:36 -0800
X-CSE-ConnectionGUID: dOKCjuZFQmWwRjMyR8HOtw==
X-CSE-MsgGUID: O0Ul+o10QNWcrUQmRPDRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="212759906"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 06:15:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0C02195; Thu, 19 Feb 2026 15:15:34 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 1/1] hwmon: (ina233) Don't check for specific errors when parsing properties
Date: Thu, 19 Feb 2026 15:15:32 +0100
Message-ID: <20260219141532.2259642-1-andriy.shevchenko@linux.intel.com>
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
 drivers/hwmon/pmbus/ina233.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
index dde1e1678394..6ee1bce32755 100644
--- a/drivers/hwmon/pmbus/ina233.c
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -82,6 +82,7 @@ static int ina233_read_word_data(struct i2c_client *client, int page,
 static int ina233_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	const char *propname;
 	int ret, m, R;
 	u32 rshunt;
 	u32 max_current;
@@ -111,27 +112,28 @@ static int ina233_probe(struct i2c_client *client)
 
 	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
 	/* read rshunt value (uOhm) */
-	ret = device_property_read_u32(dev, "shunt-resistor", &rshunt);
-	if (ret) {
-		if (ret != -EINVAL)
-			return dev_err_probe(dev, ret, "Shunt resistor property read fail.\n");
+	propname = "shunt-resistor";
+	if (device_property_present(dev, propname)) {
+		ret = device_property_read_u32(dev, propname, &rshunt);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s property read fail.\n", propname);
+	} else {
 		rshunt = INA233_RSHUNT_DEFAULT;
 	}
 	if (!rshunt)
-		return dev_err_probe(dev, -EINVAL,
-				     "Shunt resistor cannot be zero.\n");
+		return dev_err_probe(dev, -EINVAL, "%s cannot be zero.\n", propname);
 
 	/* read Maximum expected current value (uA) */
-	ret = device_property_read_u32(dev, "ti,maximum-expected-current-microamp", &max_current);
-	if (ret) {
-		if (ret != -EINVAL)
-			return dev_err_probe(dev, ret,
-					     "Maximum expected current property read fail.\n");
+	propname = "ti,maximum-expected-current-microamp";
+	if (device_property_present(dev, propname)) {
+		ret = device_property_read_u32(dev, propname, &max_current);
+		if (ret)
+			return dev_err_probe(dev, ret, "%s property read fail.\n", propname);
+	} else {
 		max_current = INA233_MAX_CURRENT_DEFAULT;
 	}
 	if (max_current < 32768)
-		return dev_err_probe(dev, -EINVAL,
-				     "Maximum expected current cannot less then 32768.\n");
+		return dev_err_probe(dev, -EINVAL, "%s cannot be less than 32768.\n", propname);
 
 	/* Calculate Current_LSB according to the spec formula */
 	current_lsb = max_current / 32768;
-- 
2.50.1

