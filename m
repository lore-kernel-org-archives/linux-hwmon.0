Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        benh@kernel.crashing.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v8 3/6] hwmon: occ: Add I2C transport implementation for SCOM operations
Date: Tue, 14 Feb 2017 14:34:20 -0600
In-Reply-To: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1487104463-4253-4-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to send SCOM operations over I2C bus. The BMC can
communicate with the Power8 host processor over I2C, but needs to use
SCOM operations in order to access the OCC register space.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/Makefile       |  2 +-
 drivers/hwmon/occ/occ_scom_i2c.c | 69 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_scom_i2c.h | 21 ++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h

diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 67b5367..9cc36e7 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o
+obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o occ_scom_i2c.o
diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
new file mode 100644
index 0000000..351cbc5
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.c
@@ -0,0 +1,69 @@
+/*
+ * occ_scom_i2c.c - hwmon OCC driver
+ *
+ * This file contains the functions for performing SCOM operations over I2C bus
+ * to access the OCC.
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "occ_scom_i2c.h"
+#include "scom.h"
+
+int occ_i2c_getscom(void *bus, u32 address, u64 *data)
+{
+	ssize_t rc;
+	__be64 buf;
+	struct i2c_client *client = bus;
+	struct i2c_msg msgs[2];
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	msgs[0].buf = (char *)&address;
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = sizeof(u64);
+	msgs[1].buf = (char *)&buf;
+
+	rc = i2c_transfer(client->adapter, msgs, 2);
+	if (rc < 0)
+		return rc;
+
+	*data = be64_to_cpu(buf);
+
+	return 0;
+}
+
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	u32 buf[3];
+	ssize_t rc;
+	struct i2c_client *client = bus;
+
+	/* send raw data, user can handle endian */
+	buf[0] = address;
+	buf[1] = data1;
+	buf[2] = data0;
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
+	if (rc < 0)
+		return rc;
+	else if (rc != sizeof(u32) * 3)
+		return -EIO;
+
+	return 0;
+}
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("I2C OCC SCOM transport");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
new file mode 100644
index 0000000..f84647d
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.h
@@ -0,0 +1,21 @@
+/*
+ * occ_scom_i2c.h - hwmon OCC driver
+ *
+ * This file contains function protoypes for peforming SCOM operations over I2C
+ * bus to access the OCC.
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __OCC_SCOM_I2C_H__
+#define __OCC_SCOM_I2C_H__
+
+int occ_i2c_getscom(void *bus, u32 address, u64 *data);
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
+
+#endif /* __OCC_SCOM_I2C_H__ */
-- 
1.8.3.1
