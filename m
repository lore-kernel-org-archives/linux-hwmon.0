Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4F92D7804
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550306; cv=none; b=JIv5P6jkNr+SUTzk3CSphVCl9ns/NJIBFttJYfzIq5QjkppFNg5OBFHF4VYnKofB7i9FymmObq3mO9SgT9uWb746Q0NtbV7RMpwsSi/81GMbQ5TV/Anbn9W4fXpLPQHCtpLJUNfq2k08fICbgb8ucYfE8mlacDbJgnKUfSnc0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550306; c=relaxed/simple;
	bh=8GA+44Msk8RirdcVaycxf84DP7nx2pqE+keaYyNzzKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jv3idUdMCLJ2fvV9nOaMs8rw/BVmrQfyXLac2oiMDar1ipGa29ttIXxOHhoP89/FSMmu6RagqUHpkbgIKqmnCX+WNi1imSFohzGbx3OQasYQOK//yMNqpKq98polGPqzT1iUWFx7nrwQ5J6uyLLtGQ2TNUzNsMRPKXEvAXqkinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XxF2RQgc; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XxF2RQgc"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c19d23b19so8401256c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 18:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778550302; x=1779155102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kexuGnZ7n87Q9HMmGJjCKYJSXcGHSGXz2FL5A1FkJjs=;
        b=XxF2RQgcq4UuWRom88oejx1V8nicopFsxpvN1xlg132Iu/4DoTjsYtOij6LWmyg44g
         wpKgPWYpoKkGdzsj/MWMcgzAxE12VY361m+Be3XheWYyN/LfdvUKLG5FVqqM0GRl73ut
         mWVu8wJ6NS3e1V4C87SCStLrZQtWPmyxUkq9NKocmpuSbAlgVJnWMFTQRFFaYMn+GoTZ
         THWZbbC6MBCd2lerR63MROYcd+B4nRlk+71ogD30hIOpFYetdZ1d3WUbsxRECGf179AN
         dcZk/sDcIRi5S7K2EuWwfVJcEcaudqPWMA3+wpq43ks1G2jrnSJQsYcFf7LcpqWCoVvH
         WDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550302; x=1779155102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kexuGnZ7n87Q9HMmGJjCKYJSXcGHSGXz2FL5A1FkJjs=;
        b=HEm9ANoa4/MGTn94iGUB0GcaIIwCGSHmfJ8yypnmUEcdaDH69+4m1fjJyx8YIa6gbm
         Tdw8EQ9SbRRdJ1oB42UV8Ej3hMPvLuy4HL/PoMA36/AKl+BNc9L5t7DV9uz5zWmxOi06
         Adgm78I6FAAl/ph0QOaSAQSu+rk4CbomqbWNfB6jxT3Fe6RiwrnARy/aNJoFPOmP1WuU
         eq+JraQp7xPsfuQ+oej9yrZlMt+r08EcyetM0jFqyDLbWZTM/WovGtEcCXWhQqJMk1MK
         h+xBGgsQN35GTKTpl6cfNhX2Sl6hjpkqNU2fXUm6jWN7z+zJ6wl8BLotROtwMsvU7cRy
         8imA==
X-Gm-Message-State: AOJu0YyEHopeXQcl2XO2Lvh5jqyJmsrF1d2d1Hr57uK18CmydOxq/rkk
	Ofx8YFG2fTnqBkwQ3s0qfKjWmB4u/oR8LUTxYdMslsJ8t57a81J97NgeeFm/ySYykww=
X-Gm-Gg: Acq92OHw2faZ6gyxeAvQvTccgecGimb/27en8zRPpuKsv/oBWnjI5jL95iyHXQKvWql
	GoDfEunW9BHwY2pD0leclOhVet0mEDTzCTug6JWpjoqV+ghXNASqC+x8vCeZ57yGWsdhVYyNV6o
	7LGnjV1M+/rBAJVRCdhVJF1TH7lWSCse4b9gXSBCqil8LLRUXVihEllcyT7Nh3gpDLn0ab2QHYC
	Ka3Lz/x+3kRb8a8BXz6LrE0OSEHW/nBeOnBsdoxiK3FqfOllFapRpEoB5onVu5joWv3UZWK4AUF
	j7gXZ8P+fkSgEPaxuz2jHeslExcJBKVlWfGeTB+bSgUJ3dexpSmVJ84tGDi4ki+C1KA6+nQPDLS
	dtCsTaOOjF+oliySfAmf38XvTLd5rmzVQPQGRAjmjGrPAcDsrQ9yUfWfE1VUxTw3rD4YgjUzr1g
	MYRgNf5P3HUEybB5XJpP0lbJ1Z/PtGH/6uCrVl
X-Received: by 2002:a05:7022:4182:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-131967d7b58mr12705209c88.4.1778550302351;
        Mon, 11 May 2026 18:45:02 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15815467eec.28.2026.05.11.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:01 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 18:44:28 -0700
Subject: [PATCH 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-d1u74t-v1-2-623c2bc1532a@nexthop.ai>
References: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
In-Reply-To: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550299; l=8057;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=8GA+44Msk8RirdcVaycxf84DP7nx2pqE+keaYyNzzKA=;
 b=UxvQKVD046/J9KK1fnfW0gRoNRK/36foCFIwEaQMsSinWPUuofZBGieYEj+mTgqO+JswwMIWE
 32Xv1igd5DyAIaqSlHeYRiI9HQyZLri5JB24hDfn4AVlMYmTz0niJ6Z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add PMBUS driver for Murata D1U74T power supplies.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/d1u74t.rst | 97 ++++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |  1 +
 MAINTAINERS                    |  2 +
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/d1u74t.c   | 85 ++++++++++++++++++++++++++++++++++++
 6 files changed, 195 insertions(+)

diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
new file mode 100644
index 000000000000..f7786ebba0b4
--- /dev/null
+++ b/Documentation/hwmon/d1u74t.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver d1u74t
+==================
+
+Supported chips:
+
+  * Murata D1U74T
+
+    Prefix: 'd1u74t'
+
+    Addresses scanned: -
+
+    Datasheet: Only available under NDA.
+
+Authors:
+    Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+
+Description
+-----------
+
+This driver implements support for Murata D1U74T Power Supply with
+PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max		Maximum input current
+curr1_max_alarm		Input maximum current high alarm
+curr1_crit		Critical high input current
+curr1_crit_alarm	Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output maximum current high alarm
+curr2_crit		Critical high output current
+curr2_crit_alarm	Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical input over voltage
+in1_crit_alarm		Critical input over voltage alarm
+in1_max			Maximum input over voltage
+in1_max_alarm		Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit		Critical input over voltage
+in2_crit_alarm		Critical input over voltage alarm
+in2_lcrit		Critical input under voltage fault
+in2_lcrit_alarm		Critical input under voltage fault alarm
+in2_max			Maximum input over voltage
+in2_max_alarm		Maximum input over voltage alarm
+in2_min			Minimum input under voltage warning
+in2_min_alarm		Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max	Maximum rated input power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_crit 		Critical temperature
+temp[1-3]_crit_alarm	Critical temperature alarm
+temp[1-3]_max		Maximum temperature
+temp[1-3]_max_alarm	Maximum temperature alarm
+temp[1-3]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target		Fan 1 target.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..97b1ef65b1c1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -60,6 +60,7 @@ Hardware Monitoring Kernel Drivers
    corsair-psu
    cros_ec_hwmon
    crps
+   d1u74t
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index b6a055fbb870..8f443a2f0e45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6808,6 +6808,8 @@ M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
+F:	Documentation/hwmon/d1u74t.rst
+F:	drivers/hwmon/pmbus/d1u74t.c
 
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..ee93b22d2887 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -113,6 +113,15 @@ config SENSORS_CRPS
 	  This driver can also be built as a module. If so, the module will
 	  be called crps.
 
+config SENSORS_D1U74T
+	tristate "Murata D1U74T Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Murata
+	  D1U74T Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called d1u74t.
+
 config SENSORS_DELTA_AHE50DC_FAN
 	tristate "Delta AHE-50DC fan control module"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..8cf7d3075371 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -76,3 +76,4 @@ obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
 obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
+obj-$(CONFIG_SENSORS_D1U74T)	+= d1u74t.o
diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
new file mode 100644
index 000000000000..3127e0e5a23d
--- /dev/null
+++ b/drivers/hwmon/pmbus/d1u74t.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2026 Nexthop Systems.
+ */
+
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+static const struct i2c_device_id d1u74t_id[] = {
+	{ "d1u74t" },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, d1u74t_id);
+
+static struct pmbus_driver_info d1u74t_info = {
+	.pages = 1,
+	/* PSU uses default linear data format. */
+	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_TEMP |
+		   PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		   PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_FAN12 |
+		   PMBUS_HAVE_STATUS_FAN12,
+};
+
+static int d1u74t_probe(struct i2c_client *client)
+{
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	struct device *dev = &client->dev;
+	int rc;
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
+
+	if (rc != 9 || strncmp(buf, "Murata-PS", 9)) {
+		buf[rc] = '\0';
+		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc,
+				     "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (strncmp(buf, "D1U74T-W", 8)) {
+		buf[rc] = '\0';
+		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
+				     buf);
+	}
+
+	rc = pmbus_do_probe(client, &d1u74t_info);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to probe\n");
+
+	return 0;
+}
+
+static const struct of_device_id d1u74t_of_match[] = {
+	{
+		.compatible = "murata,d1u74t",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, d1u74t_of_match);
+
+static struct i2c_driver d1u74t_driver = {
+	.driver = {
+		.name = "d1u74t",
+		.of_match_table = d1u74t_of_match,
+	},
+	.probe = d1u74t_probe,
+	.id_table = d1u74t_id,
+};
+
+module_i2c_driver(d1u74t_driver);
+
+MODULE_AUTHOR("Abdurrahman Hussain");
+MODULE_DESCRIPTION("PMBus driver for Murata D1U74T-W power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.53.0

