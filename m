Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D63750DC
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477661; cv=none; b=JqWXksj/9GAlnDKTwA06QImYOw805FDnOmuTzY/2SnPXI+z/MBDkNONfLusPgck0JrypLL5iGJwL//c/MqAM6RQGqH+gsCGNyy7YyWVZpbN2+UYcI748SOpSQbGQQ0/jAqxUiEwAtlAcVcZ/3Q16bE4GgMT6PHHQLR1ZIgXf16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477661; c=relaxed/simple;
	bh=IjpCpD52YU6pGlQcBsqaIi8bq/aSminH5YnJ4evU3LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nayUrv0B5AOFiQa2lHddho9+J/sZaxxCCDfEGqmq66i8apWwsS8Er1dRZl/IVank8sc/AI7pkbKjEITS4kIPqtcBJHWJWbAUoJ9DK/h6VyhPswQhJrFrd+ukvu3jok70v9B83LPBzOGzRTLEOVuPUcqbKDL6NK5iq5ATixx4VYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=erq.se; spf=pass smtp.mailfrom=erq.se; dkim=pass (2048-bit key) header.d=erq.se header.i=@erq.se header.b=v0rN2LjC; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=erq.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erq.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erq.se header.i=@erq.se header.b="v0rN2LjC"
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 0D666536CC5
	for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 10:57:51 +0200 (CEST)
Received: from s979.loopia.se (unknown [172.22.191.6])
	by s807.loopia.se (Postfix) with ESMTP id F26A45369FC;
	Wed, 03 Jun 2026 10:57:50 +0200 (CEST)
Received: from localhost (unknown [172.22.191.6])
	by s979.loopia.se (Postfix) with ESMTP id EECDA10BC478;
	Wed, 03 Jun 2026 10:57:50 +0200 (CEST)
X-Virus-Scanned: amavis at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s470.loopia.se (amavis); dkim=pass (2048-bit key)
 header.d=erq.se
Received: from s934.loopia.se ([172.22.191.6])
 by localhost (s470.loopia.se [172.22.190.34]) (amavis, port 10024) with LMTP
 id rnBLSqqntYHX; Wed,  3 Jun 2026 10:57:50 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: linux@erq.se
X-Loopia-Originating-IP: 90.231.188.7
Received: from mailcluster.loopia.se (90-231-188-7-no600.tbcn.telia.com [90.231.188.7])
	(Authenticated sender: linux@erq.se)
	by s934.loopia.se (Postfix) with ESMTPSA id 5B54B917F0F;
	Wed, 03 Jun 2026 10:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erq.se;
	s=loopiadkim1730905327; t=1780477070;
	bh=DfRHJZNTyZzXhbdNvzVS48VKE6A5+WSVffQOzFCpioQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v0rN2LjCtmGNSkr3UYrq0UY9tjQs2r52vqar3tLrASEwugSCEjchRl7CRRLp5jkxC
	 RlLIkF44j/byw/+y++qxjn2cTzusEOsOGR/6Z72aD7eD9HiP57pBeXHfLU+N4FqHRm
	 EeCdZ++mbjVs1IvNcjhYLAdkfU9uADJ/qJVm7FVRHUd2H6c6Bq6/TmcqodhFPVdcQj
	 c82iNPhK+rqWIEB5SC/3UmEMTmOr8gOHAUfHiw9NyMPKbYvV0tP2THic635qtKu8WW
	 1Y065O41N8Xus+KspLFnCFY5774TxNb3aE6f5JqUJtJjgS3naK1qxGQBgqPsaDOOgA
	 VJnyYKYSvvQvg==
From: Daniel Nilsson <linux@erq.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Daniel Nilsson <linux@erq.se>
Subject: [PATCH 1/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351
Date: Wed,  3 Jun 2026 10:57:12 +0200
Message-ID: <20260603085712.659432-2-linux@erq.se>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260603085712.659432-1-linux@erq.se>
References: <20260603085712.659432-1-linux@erq.se>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
modules from Flex to the pmbus driver.

Signed-off-by: Daniel Nilsson <linux@erq.se>
---
 Documentation/hwmon/pmbus.rst | 9 +++++----
 drivers/hwmon/pmbus/pmbus.c   | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index a8e01a5b96da..23c42c312274 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -3,17 +3,18 @@ Kernel driver pmbus
 
 Supported chips:
 
-  * Flex BMR310, BMR453, BMR454, BMR456, BMR457, BMR458, BMR480,
-    BMR490, BMR491, BMR492
+  * Flex BMR310, BMR316, BMR321, BMR350, BMR351, BMR453, BMR454,
+    BMR456, BMR457, BMR458, BMR480, BMR490, BMR491, BMR492
 
-    Prefixes: 'bmr310', 'bmr453', 'bmr454', 'bmr456', 'bmr457', 'bmr458', 'bmr480',
+    Prefixes: 'bmr310', 'bmr316', 'bmr321', 'bmr350', 'bmr351',
+    'bmr453', 'bmr454', 'bmr456', 'bmr457', 'bmr458', 'bmr480',
     'bmr490', 'bmr491', 'bmr492'
 
     Addresses scanned: -
 
     Datasheets:
 
-	https://flexpowermodules.com/products
+	https://flex.com/products/power-modules/product-selector
 
 
   * ON Semiconductor ADP4000, NCP4200, NCP4208
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index d1844c7a51ee..8121e5fac240 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -215,6 +215,10 @@ static const struct pmbus_device_info pmbus_info_one_status = {
 static const struct i2c_device_id pmbus_id[] = {
 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
 	{"bmr310", (kernel_ulong_t)&pmbus_info_one_status},
+	{"bmr316", (kernel_ulong_t)&pmbus_info_one},
+	{"bmr321", (kernel_ulong_t)&pmbus_info_one},
+	{"bmr350", (kernel_ulong_t)&pmbus_info_one},
+	{"bmr351", (kernel_ulong_t)&pmbus_info_one},
 	{"bmr453", (kernel_ulong_t)&pmbus_info_one},
 	{"bmr454", (kernel_ulong_t)&pmbus_info_one},
 	{"bmr456", (kernel_ulong_t)&pmbus_info_one},
-- 
2.51.2

