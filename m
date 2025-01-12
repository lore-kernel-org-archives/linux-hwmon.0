Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3741465A5
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2025 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736679152; cv=none; b=Zh0Nzwtwf9sClq2wbWLnnBjIjs5pCIgyHLQGeykmB1AEwgZfuV+BMNm5kcCGtRkWS2Bl8Y68dkysiqdLZN/hSGHI8DFzscf3Ed7h5i68Z18Qz3QEdpfraRfk29tFIMDfGhtYSt3tQN4RwaLNdMKfBPCMx6mZDopZ2SAwp7AGlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736679152; c=relaxed/simple;
	bh=jWYXxQ1mQ7u/AJzuOnOm05rMV2+47UbaEn0XDShccII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSsPcDSkEAcoYXvogl7AoFWznLo1Mo8P80RpzRDgyjSPpxrwi13k9iUUcVhk37eaykQ+hrtHr0f8WSZ9Ybn5uwfOUc33/WIuk2eslB1mXRhGR9qOue8ndMTpppjEJ4DKU2u69B6owwTq1b+Z57DxxHwaMIwIAPoINaha0ei9vTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bT+MpJEX; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bT+MpJEX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736679147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LlzJOPZVNYhhIOwye2SmJi0akP2fxge6w1YCftf5b9c=;
	b=bT+MpJEXWJsQF36aVo/3rAE55JrbLjCkmdAGi9wgkJr8cmjGZgqlWumSCYpcJ3zgJLdGWc
	8BJklvKR/E7PMIg7LUozg4sMrxncjm+jfdRa/jD7JkcC4RluWZu0lan3SM8HwNBXRYmB0P
	X8HzBhazX/GX/MTn85Uql20vqG7meao=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Luca Tettamanti <kronos.it@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: Use str_enabled_disabled() and str_enable_disable() helpers
Date: Sun, 12 Jan 2025 11:51:28 +0100
Message-ID: <20250112105128.86653-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() and
str_enable_disable() helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwmon/asus_atk0110.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 1dc7e24fe4c5..8e039b8d4b34 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -17,6 +17,7 @@
 #include <linux/jiffies.h>
 #include <linux/err.h>
 #include <linux/acpi.h>
+#include <linux/string_choices.h>
 
 #define ATK_HID "ATK0110"
 
@@ -441,7 +442,7 @@ static void atk_print_sensor(struct atk_data *data, union acpi_object *obj)
 			flags->integer.value,
 			name->string.pointer,
 			limit1->integer.value, limit2->integer.value,
-			enable->integer.value ? "enabled" : "disabled");
+			str_enabled_disabled(enable->integer.value));
 #endif
 }
 
@@ -1074,8 +1075,7 @@ static int atk_ec_enabled(struct atk_data *data)
 		err = -EIO;
 	} else {
 		err = (buf->value != 0);
-		dev_dbg(dev, "EC is %sabled\n",
-				err ? "en" : "dis");
+		dev_dbg(dev, "EC is %s\n", str_enabled_disabled(err));
 	}
 
 	ACPI_FREE(obj);
@@ -1096,18 +1096,17 @@ static int atk_ec_ctl(struct atk_data *data, int enable)
 
 	obj = atk_sitm(data, &sitm);
 	if (IS_ERR(obj)) {
-		dev_err(dev, "Failed to %sable the EC\n",
-				enable ? "en" : "dis");
+		dev_err(dev, "Failed to %s the EC\n",
+				str_enable_disable(enable));
 		return PTR_ERR(obj);
 	}
 	ec_ret = (struct atk_acpi_ret_buffer *)obj->buffer.pointer;
 	if (ec_ret->flags == 0) {
-		dev_err(dev, "Failed to %sable the EC\n",
-				enable ? "en" : "dis");
+		dev_err(dev, "Failed to %s the EC\n",
+				str_enable_disable(enable));
 		err = -EIO;
 	} else {
-		dev_info(dev, "EC %sabled\n",
-				enable ? "en" : "dis");
+		dev_info(dev, "EC %s\n", str_enabled_disabled(enable));
 	}
 
 	ACPI_FREE(obj);
-- 
2.47.1

