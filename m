Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8360830E0CC;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518103; cv=none; b=kLoZwcXksGCtYgrrcsFiQASo3pXS3XB6AgnGpEeRnYpgHN8km4xX+vlkHESJR0R3c4JaUoGfF/uUtq5OXbRCiXu9tKPCYGrIP8KUigbLJvotpFqkTLGHdOJtw4VZNJVV2vDR3Fe9zPuu00O+gBC5S1BO7p6Wg62iCFgwgPn6vXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518103; c=relaxed/simple;
	bh=YbKeTFGmIjfErUdrslRAuBtBdp6sN0mDb88fEJN6hEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7SIw/GyANurnpsVQLtvVEBQQC18vZ16bB6/4BckADDJgsPgNAKoPYJviAO3xiWQZGxjv7PuYRGw3/P2Gb9AduMvqE6BPH4S9Mrn6IlZi7NryPZv6WZP+JuaQvllrqGsh65wm0KsGR98VRWErQj1dsws6RVom+QkqD75H1lnFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnwWXPTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnwWXPTn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4645FC2BCC7;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777518103;
	bh=YbKeTFGmIjfErUdrslRAuBtBdp6sN0mDb88fEJN6hEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FnwWXPTnVooJRl4Qkri69NewSDTZR0p54ela1hNILsUUsLYO9uZRBRjScnLhBGw/m
	 wD7Cjtho6kqmAX1gi+DmFNYtCXh+0/FEffm1o5Qex1PP91UGMqEOouTou/qYExSTgS
	 HUcqKNKxF1ifk/VvzXSirLGlKLnIE+jiX1TuYTLA/sbMnwLK2Wgc/13gZX3lTsDTjR
	 dwQNCeb90kNcI0kv5SZl/Po5ZJ7k3TLSqN6Die6lSM6/9MjOGnfSXMxfPw0vUeIlan
	 eahQrkiL753sQyIL013JjqPaQtenBwDX/sLnsqzZbGQoMBOS57drUkNm1wl8WOR0tb
	 C+g+AWwzYyQ+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39694FF8875;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 11:01:36 +0800
Subject: [PATCH v2 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-add-e50sn12051-v2-3-d76fe42482ab@gmail.com>
References: <20260430-add-e50sn12051-v2-0-d76fe42482ab@gmail.com>
In-Reply-To: <20260430-add-e50sn12051-v2-0-d76fe42482ab@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777518101; l=3508;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=OGhWi+bekUqcc357O5gemEEvGFRmgZ9FlDjulLzIoNE=;
 b=uJvnntVQKU3Bo2r/cX5NSxmXbZXB8VKlkids9lilv/BClc9+tNqFScm8aXMOon2wPmrMAL7HJ
 U8TFTgpC71VB3NJ9YckxX/LNLw0eKhBMpaSk/ZgNThEO9QiktllivFa
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add the pmbus driver for Delta E50SN12051 600W Non-isolated
1/8th Brick DCDC Power Modules.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig      |  9 ++++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/e50sn12051.c | 59 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..4fbfcbc4a9c5 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -161,6 +161,15 @@ config SENSORS_DPS920AB
 	  This driver can also be built as a module. If so, the module will
 	  be called dps920ab.
 
+config SENSORS_E50SN12051
+	tristate "Delta E50SN12051 Power Modules"
+	help
+	  If you say yes here you get hardware monitoring support for Delta
+	  E50SN12051 Power Modules.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called e50sn12051.
+
 config SENSORS_INA233
 	tristate "Texas Instruments INA233 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..fc910bf34fe3 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
+obj-$(CONFIG_SENSORS_E50SN12051) += e50sn12051.o
 obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn12051.c
new file mode 100644
index 000000000000..3d61db949afb
--- /dev/null
+++ b/drivers/hwmon/pmbus/e50sn12051.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for E50SN12051
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info e50sn12051_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static const struct i2c_device_id e50sn12051_id[] = { { "e50sn12051", 0 }, {} };
+MODULE_DEVICE_TABLE(i2c, e50sn12051_id);
+
+static const struct of_device_id e50sn12051_of_match[] = {
+	{ .compatible = "delta,e50sn12051" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, e50sn12051_of_match);
+
+static int e50sn12051_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &e50sn12051_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static struct i2c_driver e50sn12051_driver = {
+	.driver = {
+		.name = "e50sn12051",
+		.of_match_table = e50sn12051_of_match,
+	},
+	.probe = e50sn12051_probe,
+
+	.id_table = e50sn12051_id,
+};
+
+module_i2c_driver(e50sn12051_driver);
+
+MODULE_AUTHOR("Kevin Chang <kevin.chang2@amd.com>");
+MODULE_DESCRIPTION("PMBus driver for E50SN12051");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.34.1


