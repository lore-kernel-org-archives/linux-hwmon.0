Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D2E55C;
	Fri, 27 Feb 2026 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772160679; cv=none; b=nI2xBDpfNN58HQYxpb85h2V8IRBpSSeUbAlRhusH2v9KExWrM4aLA8tqE+Zk83mALbq805++xgiwSUS2368jLubpNjG9lGgUbHtPQl98QTDmYZVLvbSmqUJndht8UsA9MfBlcpeyAvbuQ859oHH8P0SVnJMV+yPirTXHbaslaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772160679; c=relaxed/simple;
	bh=t23RoTFT17DW5CuBc2E5u8D+wo/zxD+e7t5CxfKSF/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+8krMR7fw1t1VUF7vZDNT3dLP4eVB3DESDRYAJ75iJPiLgkAKGwpluN4Dtgg70NJS4BBT6Bd9kZ0zKi1AHdyUWdP8q6N99u3ScG0NFeJxc52qgvFjiCBzxO4J1uBiQ4v+uCh94XHw8DVB18d2c+Zx4VbyvSRs0uaDmG8EvrUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=enW3DPzk; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="enW3DPzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1772160611;
	bh=bGP9udQb2JF/inR+4b280FWoHP0MIscXRCEUp8RHOJM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=enW3DPzk48g9TDuE4JZHW6uHJ/gyq0XoiWE1Sw53BV5nFuUDvJ8hxWD1HXniMhvv9
	 B2Gl5CMiKu5sek5gjsxnjMom50F+gY5HsxxQ2baayMHkmCTY1GSOHt/kjUCQ+wCB6U
	 g3iQMjRiF8DmPQM8fBwz92KB12XGL+Evut/H+uNU=
X-QQ-mid: esmtpgz13t1772160605t143123b4
X-QQ-Originating-IP: rQbBnuhpH7EhtgySgt0d5wjM22huTwmw9MHAwX9Rbbk=
Received: from uos-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Feb 2026 10:50:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10883806231518884948
EX-QQ-RecipientCnt: 11
From: Morduan Zang <zhangdandan@uniontech.com>
To: devnull+cryolitia.gmail.com@kernel.org
Cc: CoelacanthusHex@gmail.com,
	Cryolitia@gmail.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	marcin@stragowski.com,
	Morduan Zang <zhangdandan@uniontech.com>
Subject: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel ec_read/ec_write
Date: Fri, 27 Feb 2026 10:49:45 +0800
Message-ID: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nb940SUM1Q7XMxEYvUvO0Np7AU7hjocIf/8WijRXthF8Q8CDnAjjr6Wj
	lwTiIQcZlUb2GUlbCZP22RrCOGQDbHXyJfbqQNuzLy7/VXdI7ucehIbgOFbCYED5MePNriB
	5YZGT23b1eXxZCAtpaL8QtQPcoggfnAGtjgn6qyC5mRXtV+iCCSgJpcjRPqoTHHY2qYeuy2
	Yknfrk/mDewbOXb7gvJLBbR8Ix3DCgvORoZ4arg214SOUaQsnNN8nc2fqNITFQXDwAnFDkF
	5KVN9ahPPSDgISwsW3TpEJrw8Zz+IVTdezM2a8rsC+eY6yyKAbQq+4sFeK9cPOP1JnN+xZa
	0Qjlo9R6UxZSpxpy9TRnAReuu1/WRj3IdOpxBAa0hgM6R9xqoZ9PDw53hEk52SexPWwatgA
	B3c+kSvk2QfJj+9nLpovN4uNt/xeOX0ZWna+q3hL3z/ku+TMVemq90dprNfy7SJi9ZKiloF
	PGZxuoqKxO4089UdjQzzrjVkdfFUiXf4+sC08Ck1s+emsBGJVL3wrdiWC4DTj03AML156aP
	lE70oWArcHqqe4Jg/xa+u2XLjnifKcVMD/+YYw9OTDfPpZn2/NDeWHy7uyZ2zM7p1soNEZo
	WoZi7wk6ifUpxncR/0yHRRd2075Mi1sl+4IrJtoF6dYkLWwR5EVRNmiLjMIp+XcAmz4LPat
	c/kG2tX1Zbfhmuy6huhYKVvUqaMUHz6f404vhD761LXe3lx6FM2vKNWf2qIkeE7BhGqYyKx
	qnCXUqQIrG57s8IAPx5jfHJU4Zcm/9LxC/th7en13qWnkypVIoqBbUjrTvjVD9WvLQFYZV/
	OPKLZwE6ILJyhNcySCyAAQ1/gJ/FyvsR9nZQGGsKjvsGTv0TJMwHE5unoYSmb4+VO3lSElA
	CuIvLxJ046LsMNVD6QHGngHpJlL47bnqn6kqU8N4Q77suuMvgFizjZnUeu4C9/umnTJgMUr
	JGSVNZL6lO+xJWQfEaPP0kFfFRd/IMfHsln/fxU+LjaLz+MhGaQDf+n8I8iJgVOSm2mkWz1
	nMsw5dphHn+nT8WL1P3I0NOR8nDDvWnD70sCgS1w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Replace the custom gpd_ecram_read() and gpd_ecram_write() functions that
use direct I/O port access (inb/outb) with the kernel's standard ec_read()
and ec_write() functions. This provides better abstraction, improves code
maintainability, and ensures compatibility across different kernel
versions.

Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
---
 drivers/hwmon/gpd-fan.c | 37 +++----------------------------------
 1 file changed, 3 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 1729729b135f..c44957b7fd91 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/acpi.h>
 
 #define DRIVER_NAME "gpdfan"
 #define GPD_PWM_CTR_OFFSET 0x1841
@@ -243,44 +244,12 @@ static const struct gpd_fan_drvdata *gpd_module_drvdata[] = {
 // Helper functions to handle EC read/write
 static void gpd_ecram_read(u16 offset, u8 *val)
 {
-	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
-	u16 data_port = gpd_driver_priv.drvdata->data_port;
-
-	outb(0x2E, addr_port);
-	outb(0x11, data_port);
-	outb(0x2F, addr_port);
-	outb((u8)((offset >> 8) & 0xFF), data_port);
-
-	outb(0x2E, addr_port);
-	outb(0x10, data_port);
-	outb(0x2F, addr_port);
-	outb((u8)(offset & 0xFF), data_port);
-
-	outb(0x2E, addr_port);
-	outb(0x12, data_port);
-	outb(0x2F, addr_port);
-	*val = inb(data_port);
+	*val = ec_read(offset, val);
 }
 
 static void gpd_ecram_write(u16 offset, u8 value)
 {
-	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
-	u16 data_port = gpd_driver_priv.drvdata->data_port;
-
-	outb(0x2E, addr_port);
-	outb(0x11, data_port);
-	outb(0x2F, addr_port);
-	outb((u8)((offset >> 8) & 0xFF), data_port);
-
-	outb(0x2E, addr_port);
-	outb(0x10, data_port);
-	outb(0x2F, addr_port);
-	outb((u8)(offset & 0xFF), data_port);
-
-	outb(0x2E, addr_port);
-	outb(0x12, data_port);
-	outb(0x2F, addr_port);
-	outb(value, data_port);
+	ec_write(offset, value);
 }
 
 static int gpd_generic_read_rpm(void)
-- 
2.50.1

