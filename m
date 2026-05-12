Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9F3A16A1
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625960; cv=none; b=iSh2PUb/Z5rxek+MZhx+PUn+5kfdfvIqL9S7rnGnuElbtMn1AhwrN6lhfXlyeGWSP+oJk+BUgyInep+KjLsQINfCrUOVeXFQrOzl+RIdsu8srlVgbKgU9TLxsHgNyhZUSwct4zDLGqLjqWnfQKEKD6/v2EyzpTHQCM/oS4WcetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625960; c=relaxed/simple;
	bh=pUiEfcCfnEGpaYyu1itUP1RAq5pOXa7mpRzkPvwUdpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmy66b6qnl6O2fW3dquqMbr3PdB6YEKL/Gayta25U9wJKdNF1bC19VvmGzKoAmRdBjlSv9kJ+m5/2WfDkq0yBbil2va6bTuX0CVTSepS5/BpOwg8IEYQcuaal5EaWluwpI0WRNuBbPNKCdkfp9AYtIE6DIHj0OdJm+hfa8/YuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Lw6/OliU; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Lw6/OliU"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c1a170a50so8352249c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778625958; x=1779230758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT/mutnGmK8Up0UnCY7rXFLVvKBtcvY8x5SL6VqMtVI=;
        b=Lw6/OliULw0YzkDMLnw8i5QFGoO1I29YJY+DSJqDc7WMir3iJi5i5gO1tzw7v60/31
         vsXGrM92mr0wzrsdor9W0QkEDkoSf5c0RpGHI9U6Up4QweLp3zP8OQ0ES5PRYaJnBTI7
         jrT9SARrhzPVHky92jOWlKBjvZJyw8qmyK2ZUCV6kSE1Cj+fWHHEQoYxF4cx3bC2LZcg
         DzKMoMJGY9vWUHt/ABqmyqu7akE8r1mF7hJ1qhRfsSdT+4ovClrJwUh6TtohtAaKEHNK
         A7efjYpk/nrDs47Y0vF4nux99PcqipuGlmgvGPgIAU5idyXk+nrhyJe1aUogOpxS6qsZ
         yWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625958; x=1779230758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT/mutnGmK8Up0UnCY7rXFLVvKBtcvY8x5SL6VqMtVI=;
        b=Igwyh2geqUeVl4vtxiapSybX0VYiNK61GP2ule6/sr09CWUeSeJ65w/vntAZjKmltH
         M1jZQ5aMymSNSr9JiZBTo1GIf1xWjy+NuISrhwaM+yX3UZ+zXJgNdpRl4jwhhhj7Fqch
         2Qisa2pMJwmqCM+owQOdpC9gqsZ05HF3p9KNvIT1isVoxjMURHw5M2xcmyL4qvh3yWWF
         ZfQSrp4kYCvr4Gdfn0FPglJRcOvlOYPtX7tEtbMzGbLWfe+v9CW8C/znaLOnmKAhkt4E
         7UYmL38dbtw11DHwyQFaHq6MSglHoqO2ASPehtfzMKcMZusqpVCD9FpdAp8GFr/dwqlZ
         eBng==
X-Gm-Message-State: AOJu0Yyz89/bvNUy8a9hLBC1U8ffpuNGkGKO3RrTYJEW5H4LkriRpiOV
	W28nB+2u2Ipx4+Z4AMNFEZJDNyUa8izyr8R2T7NrF4IPqPK4/4CJJYTFeYqoN217XjU=
X-Gm-Gg: Acq92OFmU4xVwEaIu3lHMnQCl0l5BN0Bq9uA0nZUUWOA0OTdkKD4lBeW6Nap5Jdnh2a
	k2sr0LosPXXEPJJuoZH8q8N7dfmaII1S9j+ASKk5Oqc4Ebv7hyILcVGbMpEhsj4rbxvY9NtBKgK
	hWEgrhtaKjgkN5a4ktdHzbTrd/p/8vgksMNDOz3s99FT8crmksLpjXIAvRan68BVhyp9w2LUWrC
	YfYvoC3HMbiHmhYMCIk5QxAqDg5fyB7lsbqCPGkrHFqu1d2Mx4hmZPvXjSg8JnECXsAxiOEJyga
	alw8f0qi3NBr3MeTvpeLpi2IkqgD5tgGq8pOYXTmFPBOGJ+6nI1Iv/Q024bjYjbxIXCWdVGjxXt
	eZix3NX3Kbsex976UNYIA6lEdk346EiIgNDvuj/16owChkeV10kGv9VW7MPsrZhyKh3T5tuDE38
	KooTwJ8jKHVcV3P++HJFBpw8l5hg==
X-Received: by 2002:a05:7022:fa9:b0:12c:8b9:71d9 with SMTP id a92af1059eb24-1349ac708b6mr205908c88.27.1778625957697;
        Tue, 12 May 2026 15:45:57 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm25351543c88.8.2026.05.12.15.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:45:57 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 15:45:53 -0700
Subject: [PATCH v2 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-d1u74t-v2-2-431d00fbb1c4@nexthop.ai>
References: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
In-Reply-To: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778625955; l=8281;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=pUiEfcCfnEGpaYyu1itUP1RAq5pOXa7mpRzkPvwUdpA=;
 b=A29rSO/7fq7BJIVxEMiBEcKASvHDtimAaXDcaMBRB0vwWcxbYxeQJvCobBHpquKHfYIgmZDuu
 Nnx7FP++pBRA9pv8MGPGKEhSgb3Ug2RCEwAQsjigPh6sgQ9zaYmvqqS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add PMBUS driver for Murata D1U74T power supplies.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@intel.com/
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/d1u74t.rst | 97 ++++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |  1 +
 MAINTAINERS                    |  7 +++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/d1u74t.c   | 85 ++++++++++++++++++++++++++++++++++++
 6 files changed, 200 insertions(+)

diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
new file mode 100644
index 000000000000..7362e56e76a7
--- /dev/null
+++ b/Documentation/hwmon/d1u74t.rst
@@ -0,0 +1,97 @@
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
index b2040011a386..28ca8e035312 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6803,6 +6803,13 @@ S:	Maintained
 F:	Documentation/hwmon/crps.rst
 F:	drivers/hwmon/pmbus/crps.c
 
+MURATA D1U74T PSU DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/d1u74t.rst
+F:	drivers/hwmon/pmbus/d1u74t.c
+
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>
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

