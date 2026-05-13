Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D273A3A05CC
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668395; cv=none; b=H3I9p0GUP/fpJ+POyqRpDBAkh7ISPoVuQ1XOAcNCPnuQ9zcuBkUJ3Z4KlT+WxXK1EGoBwkUhtz62/Z+gwjfqNKmba23ZwBwZMqdGzyCIyFEMpxbfRbqdBHc6xgQfWlqJg/X0REDRQarqqGwWBVswOgVYj6VKv4Vfj9xPZEGEZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668395; c=relaxed/simple;
	bh=P7MMDmiLhHVYqHcAu7ClvEhUdbQ9lZdUJ0RVW3bvNEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBe/KN7urbryWvhlXPxm2BHp9Wq6wIh6/Fzi3eiC5lh8FamSasG9n9XZ2oHHKcFiSpe6TP38nEaQtbcxXqbz8ezf3MZCv2qkEx8uymSLNnnVsDXhAoXu3CiM1qqGc9pd2AheGIulV3oOs9ziaig5sLz24tAbVmy5RB8ZMTYomck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=GKMBhCTP; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="GKMBhCTP"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f30a4601bbso7067296eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778668388; x=1779273188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjSuZ8ZvzPBcac4mqsLo92B5VD+KUuH8Di4sSdgtVhs=;
        b=GKMBhCTPhi0Lv43JcBbynx/+SIS37E0cY1LlV/3yRNRIFCAdJoROHy+ipoODa3pUUO
         +eklFJJru5ullLUzixLFf/Cf2Oko+aDmM7YQut046j7mB5RcvclhxTfnjUFY7zB2ipUm
         LzRf2BdEI5kIiXOQ9qrBHmSdhLszARdG53Po9GseQkQIpC5SgUK2Jea+t8tMexpvmSAv
         63PSnLEAR4L+gzpGZ3gtc3AQr/rhxrcQpTlheLuU9tOV14wadbaH1NuBtBqxWDi8b/Ws
         7Kqwt/mIqrbwIDMGLNyUaR7neYYoffdmMEAAsBaJlUZ/VSmnJfDlVBaKwFnnTUDZDxs8
         YDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668388; x=1779273188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjSuZ8ZvzPBcac4mqsLo92B5VD+KUuH8Di4sSdgtVhs=;
        b=LhoBu5PGsukV5OMWuHah8769kNXOhnVbWgyDsChQ0O4CBT4f42BmNkdCN2q7LFjdpp
         WHsKc54XyyTkd5b7MnuQ7B9XpfnapwFbqTy2yKGfCdA1Wl2bvwXFveUB/xoI1E/UuiGf
         CsH0lSAe6w2C9MManXs4SQ2shDFy80Z2Gmb6JmI/jczB74Yr16nMqa2LtDxPP/eR2t2B
         Naci5ai3PSlMODx/Kf/dC3QaLQetd1SzCgY+YB4yigWrl7pEum6l/cZCeZQnPVSYrGhC
         FYhlA7ruuT7468rJT4sMdCVsS7n/nY8qF6uzDjF7/C1Pw6NBJv9dueOkYlzj/HlKqGJz
         2rKQ==
X-Gm-Message-State: AOJu0Ywz/pVCTgRayjlehRVGAUjIURg111hxOv1+wHL4ugZN1KMjlxVx
	6x8ykCz6I3mbO1uwy4V0m7OBBF8Qg36RHlcncgO9WPCX89jOroHXqKvHVch6O+i92qE=
X-Gm-Gg: Acq92OFUIA/KJ5R/wYFvF722ZznFzG/BFDOhbGJ795LRfpFSucgC+fwywbCe/lVX5j5
	MkH8jmM5bKgdw2Puo7vsedWnAQR6xBc36ozNp2Ad81wq4W3p2oGKDMCUr5t1wntOI84MA39JGx3
	U3qRPCnCiJ2dLaO2XzxFECbMG6AJfmq4T4jjvFow/J3bQLW3Xgod+HzFohXxiQhJjPK+thApsPg
	BqSOJ2+U/ou2SbAAQk4unsc7qMqZuUQ4ObdSacjmNyNneO7XPzeAh/N0bi+ugD2LJA0hpXz/uBr
	mSNmJk/HB9BTzypMx1Gc2zDGtXlKoI80l4chd9Q9WQMDpVAlWZ1R7eFqBhjqoX5pnGu/adHk9PE
	CjTFZwNpWk1mXAcae4WH5MnqxXVT7Nn4ngYSXt43xxkbf87Wtq3KIaaVrVh+Ah5M0lD9/ihbbHx
	73I17y+T2L1XJQ1BYWnO7zNbD1EQ==
X-Received: by 2002:a05:7301:1f0a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-301556533acmr1054256eec.16.1778668387835;
        Wed, 13 May 2026 03:33:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm22241537eec.2.2026.05.13.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:33:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 13 May 2026 03:33:03 -0700
Subject: [PATCH v3 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-d1u74t-v3-2-27bcd6852c45@nexthop.ai>
References: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
In-Reply-To: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778668384; l=7520;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=P7MMDmiLhHVYqHcAu7ClvEhUdbQ9lZdUJ0RVW3bvNEI=;
 b=0jJGtU80Ci+mMBa6gRShJgussIla2YCfCk8TOXc6DdFw6BPReqShDPp9zPpnkt7P8wF7xbSQp
 jepHNpto/63CbhYiPk8f32TtiUI7ChPbGfd5FGD+7sGH4wTUH6VpurB
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add PMBUS driver for Murata D1U74T power supplies.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@intel.com/
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/d1u74t.rst | 81 +++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |  1 +
 MAINTAINERS                    |  7 ++++
 drivers/hwmon/pmbus/Kconfig    |  9 +++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/d1u74t.c   | 86 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 185 insertions(+)

diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
new file mode 100644
index 000000000000..2856aba97c3a
--- /dev/null
+++ b/Documentation/hwmon/d1u74t.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver d1u74t
+====================
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
+curr1_alarm		Input current alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output current high alarm
+curr2_crit		Critical high output current
+curr2_crit_alarm	Output current critical high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_alarm		Input voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_alarm		Output voltage alarm
+in2_rated_min		Minimum rated output voltage
+in2_rated_max		Maximum rated output voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power alarm
+power1_rated_max	Maximum rated input power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_max		Maximum temperature
+temp[1-3]_max_alarm	Maximum temperature alarm
+temp[1-3]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning
+fan1_fault		Fan 1 fault
+fan1_input		Fan 1 speed in RPM
+fan1_target		Fan 1 target
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
index b2040011a386..3106cf725dfc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18249,6 +18249,13 @@ F:	drivers/mux/
 F:	include/dt-bindings/mux/
 F:	include/linux/mux/
 
+MURATA D1U74T PSU DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/d1u74t.rst
+F:	drivers/hwmon/pmbus/d1u74t.c
+
 MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER
 M:	Bin Liu <b-liu@ti.com>
 L:	linux-usb@vger.kernel.org
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
index 000000000000..286ba492e336
--- /dev/null
+++ b/drivers/hwmon/pmbus/d1u74t.c
@@ -0,0 +1,86 @@
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
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n",
+				     buf);
+	}
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc,
+				     "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (rc < 8 || strncmp(buf, "D1U74T-W", 8)) {
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

