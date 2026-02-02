Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836BA3101B9
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019482; cv=none; b=WJvgiIe37KfeR5m9WYcO9rKMLhgpqGGPivUmb7qlJZfSe21G4tH6U1KpI51rsmAO3rxre+X8n8ZcypXaw7T1/INGyS+aQX3iMJwOkhj415/FBxCzenddID+28XHy4cCv7FqQ9RBHj4rlwDOpDRKbJVNh/Tu2c+EP19UDyGCf28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019482; c=relaxed/simple;
	bh=1YjBFMlMygrwfnk4BEfelTSmkv7l652jlGdUz7B943w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U2SJXVzet/IP5tIZrixNhiCn1aZ9UWnQcBouaKKYPGfSNiiEZp6LlWeSN39vhAAWe8s2vE1e/Jk9JiFjxvbh5oR6OZ7RcxbXKh9rrwAukwt6PI3glCoEcZ0HmNatKpN81ip/MYypdSUc822Hr3u7UzeYW0/H+Nw1NLeyME7BwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr2EZx3I; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr2EZx3I"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8220bd582ddso2353462b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 00:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019481; x=1770624281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucnn95nrk17FbulixZ/28n+yr+SHkegFd7cld6WxCEE=;
        b=cr2EZx3IJJaNkkjfwV6gZDLbBBtMaGHqrg5B4vmn1jgP43542H6YhEkm7iqhvXgh0D
         aT165cih33r3z7ouNJRsSei51oJuQiaRcR4wVZ0ZWbv9dlQpn6AAwpSf+MEzFh/hLvvk
         5QlFEkqq5noEWkgs80eM78g2XBiBW0DgMP8XNk9SWQKwygq0jq+7tblSRu9Y/RMQLDlH
         KdbcST0lEErIMv2C+0hjdoqslWATJbCirBJzK5228MFRkds7lKkosp2R8Iif7zGFZ4C6
         Xm7gYVAXma+nAquyxhNpwOmoV0U32BAPs09hjPc8VYh7VoNTopk0kxhPgJf970sKUT3T
         dN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019481; x=1770624281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucnn95nrk17FbulixZ/28n+yr+SHkegFd7cld6WxCEE=;
        b=GnBhPcjAJWv+28ogM+OhCFenEflbwwjSIshM0jFr8Vdr92pWZxyrDfKWxOg0mPAVg7
         Li64424n5kKiDnWhNqlMIlAvFlqEN2BNXFJt4RL3ZMIZxiv0+1hORedcTU/AFXq0RzAi
         y/ucw2m6uRdwMf3re9DTyhZDc60VFgrqBfPcOLpgpvKW34cH8WogwGx7nPywMaKmPnm2
         XwkK23EKtfrrI+f8c0zkGofC2BNRI+1lI3bpeG74n2bHRQYGr1YvCQsGxOjgTGdDhfPc
         1MUekrcd382o70GUCCeHI53jpJwBo6L2c0iPKQALb9Eji71XILHpTY1+DTEQjQBOV6y7
         PDEw==
X-Gm-Message-State: AOJu0YygVwWqxQkjjFc8/E2eTX55IoxiaUgAx2bhMd/41dX26EBNFgwj
	HmTLQ4s8RW0CElJI7U287uhoshE4gywW7cDEtYRt4x8OXNODbUVQRRBD
X-Gm-Gg: AZuq6aJoNYHbqIpJygAyWdSDYfT78AQgU3WTIFFYUn5JmYg0dOvy1ZPRwXfNvA8RUSz
	H6T57Rpzkq9C3CE03HR9bHLfiSxU1+ECpfVnIxfzYPRHGWIabHY7txqFXtblJibs9bJAhKT1sAZ
	GVQp2hAOYNAPeTh/qpuZ0nSUP1TanGnmU2uDTsNEKCGfzgg1nMSWAm6LEnpu5+NFcdSve7IM0AW
	YWVfMwuHVjmpAQE6sU5gNv5TUzBT4DY6Io6fEZFoXc4ELBNcEYtz0BRSq/DMVDnZKKVhv6jLjCi
	Ik1ifAnfJgMIhn2k+ATNeFycqeJIbFBgSLgAKOqCIwrAMm44tyrtR9jvhtcgDUhtEda4hY3U0FW
	WdS91djxx7itCU5kwE1AXHcxxpK4BB+pjOB4QiKsliJbRbAmScL2FAJPLGdsiWTUwrsrqdsEAbw
	g0godO8iLP39EhGfhWXLOzRQkLJU0wGNBASA==
X-Received: by 2002:a05:6a21:6b05:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-392e0024999mr10957213637.18.1770019480817;
        Mon, 02 Feb 2026 00:04:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:61bf:a770:ed27:c783:3591:cfc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm13596938a12.17.2026.02.02.00.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:04:40 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers
Date: Mon,  2 Feb 2026 13:33:55 +0530
Message-Id: <20260202080355.53061-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
XDPE1A2G7B controllers.

XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_MODE
command.
XDPE1A2G7B controller supports Linear and VID Data format for VOUT using 
VOUT_MODE command.

In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_version
is supported:
Vout = 5mV * (VID-1) + 195mV

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 drivers/hwmon/pmbus/Kconfig      |   9 +++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/pmbus.h      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c |   4 ++
 drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 +++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..c6750bce446d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -684,6 +684,15 @@ config SENSORS_XDPE152
 	  This driver can also be built as a module. If so, the module will
 	  be called xdpe152c4.
 
+config SENSORS_XDPE1A2G7B
+	tristate "Infineon XDPE1A2G7B"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDPE1A2G5B and XDPE1A2G7B.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdpe1a2g7b.
+
 config SENSORS_XDPE122
 	tristate "Infineon XDPE122 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..620f24baa289 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
+obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
 obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..3ddcb742d289 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
 
 enum pmbus_data_format { linear = 0, ieee754, direct, vid };
-enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
+enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
 
 /* PMBus revision identifiers */
 #define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..4d7634ee6148 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x0 && val <= 0xd8)
 			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
 		break;
+	case nvidia195mv:
+		if (val >= 0x01)
+			rv = 195 + (val - 1) * 5;  /* VID step is 5mv */
+		break;
 	}
 	return rv;
 }
diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
new file mode 100644
index 000000000000..79b12b56e7b6
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
+ * and XDPE1A2G7B Controllers
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define XDPE1A2G7B_PAGE_NUM 2
+#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step is 5mV */
+
+static int xdpe1a2g7b_identify(struct i2c_client *client,
+			       struct pmbus_driver_info *info)
+{
+	u8 vout_params;
+	int i, ret, vout_mode;
+
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode >= 0 && vout_mode != 0xff) {
+		switch (vout_mode >> 5) {
+		case 0:
+			info->format[PSC_VOLTAGE_OUT] = linear;
+			return 0;
+		case 1:
+			info->format[PSC_VOLTAGE_OUT] = vid;
+			break;
+		default:
+			return -ENODEV;
+		}
+	}
+
+	for (i = 0; i < info->pages; i++) {
+		/* Read the VOUT_MODE register for VID Code Type. */
+		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
+		if (ret < 0)
+			return ret;
+
+		vout_params = ret & GENMASK(4, 0);
+		switch (vout_params) {
+		case XDPE1A2G7B_NVIDIA_195MV:
+			info->vrm_version[i] = nvidia195mv;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static struct pmbus_driver_info xdpe1a2g7b_info = {
+	.pages = XDPE1A2G7B_PAGE_NUM,
+	.identify = xdpe1a2g7b_identify,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
+};
+
+static int xdpe1a2g7b_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id xdpe1a2g7b_id[] = { { "xdpe1a2g5b" },
+						      { "xdpe1a2g7b" },
+						      {} };
+
+MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
+
+static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] = {
+	{ .compatible = "infineon,xdpe1a2g5b" },
+	{ .compatible = "infineon,xdpe1a2g7b" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
+
+static struct i2c_driver xdpe1a2g7b_driver = {
+	.driver = {
+		.name = "xdpe1a2g7b",
+		.of_match_table = of_match_ptr(xdpe1a2g7b_of_match),
+	},
+	.probe = xdpe1a2g7b_probe,
+	.id_table = xdpe1a2g7b_id,
+};
+
+module_i2c_driver(xdpe1a2g7b_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

