Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B622D2397;
	Wed, 29 Apr 2026 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455726; cv=none; b=rQ9/sk0mUF1RIds2fWCBW3VsDwajghr1k9dnV8ywRf7PRn/UYb33+v4c15xo3hM5TvBfSoanmXKV6oO0p1NesWyr0ci4FTrTFeQkZ/W6YnwHPpNtmOMq8YGbj6N0VZhwGb0WUdk6PrDxP3BIB1+8JVeXW9uHDMdq1XtRnI48a4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455726; c=relaxed/simple;
	bh=T/qLh2DupgIrsjSNqn3yKpnc1y1Jix5B8y23UGV1XfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dp7MQterYOfYpS4hNhhiYqyz51K9Yk+xEgLyr6wVRX2XCvGCRkYrMi0O5153I1Zk9Mz84Gd0PNtsYvqcTr4tp3Ru6d4IhRY0H2+x329RdBv/na3YVAxJlUmxjoxfmXrmPlgMFSo3b6VFftO9CPl0l+jTALBLPc0pBASiVOJgSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZokkeA5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZokkeA5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE737C2BCF4;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777455726;
	bh=T/qLh2DupgIrsjSNqn3yKpnc1y1Jix5B8y23UGV1XfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RZokkeA5JXlISB6vdc25hSCLHlN6n4Juo5ieY0H3SI7uZPmW7K7nDzc1jdJoAIAVF
	 th1dnzxuUJEHPjt6yN7i52TPMeg1Gjc08NC9OIRE754yCdc/jmHp7Lg0ji0uoN8gPv
	 VzsfJjfsRA5MPDMuMKHliTPDdAZ08C5vS3Ig/d/c1qpZINgbS4sBFVicfcWBP7urIt
	 iVvCC8SWtjLpTjvmljKy70G7A3bkvFl5HALyXD2VLqE9kv2SC58YImH2XRiat7Hz0f
	 tgFcLVC3NL5QYZVTLnEfgP3iG5goHlCRvHJa5kmykf2PJzA3WNiykoMzLnwVl7zdpN
	 ti/ZRO8U7ZP/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56B0CCFA13;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 29 Apr 2026 17:42:00 +0800
Subject: [PATCH 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add-e50sn12051-v1-3-c101e6c80bbb@gmail.com>
References: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
In-Reply-To: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455724; l=3531;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oOfgVU8xJ23RAc8R7rLid7SuguEX/M0GzcoNaRye0hw=;
 b=jarYjTXPvj4km61NsJwQXm0GK3UGwAeHLJM7WJvJTCBuUOS1odnDwNauakyjdtfNNLzm/Vt9O
 ioWDlSYvmLVCWwPFk4kA4oIKYAPX397nkAtfhMtjgjx+2WjWUZzFn7c
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
 drivers/hwmon/pmbus/e50sn12051.c | 60 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

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
index 000000000000..56935e9543b6
--- /dev/null
+++ b/drivers/hwmon/pmbus/e50sn12051.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for E50SN12051
+ */
+
+#include <linux/debugfs.h>
+#include <linux/i2c.h>
+#include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
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

-- 
2.34.1


