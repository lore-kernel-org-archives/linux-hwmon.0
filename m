Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36325 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752896AbdAZXTp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2017 18:19:45 -0500
From: eajames.ibm@gmail.com
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, =wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, benh@kernel.crashing.org,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v4 3/6] hwmon: occ: Add I2C transport implementation for SCOM operations
Date: Thu, 26 Jan 2017 17:19:15 -0600
Message-Id: <1485472758-11003-4-git-send-email-eajames.ibm@gmail.com>
In-Reply-To: <1485472758-11003-1-git-send-email-eajames.ibm@gmail.com>
References: <1485472758-11003-1-git-send-email-eajames.ibm@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to send SCOM operations over I2C bus. The BMC can
communicate with the Power8 host processor over I2C, but needs to use SCOM
operations in order to access the OCC register space.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/occ_scom_i2c.c | 77 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_scom_i2c.h | 26 ++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h

diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
new file mode 100644
index 0000000..74bd6ff
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.c
@@ -0,0 +1,77 @@
+/*
+ * occ_scom_i2c.c - hwmon OCC driver
+ *
+ * This file contains the functions for performing SCOM operations over I2C bus
+ * to access the OCC.
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
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
+	u64 buf;
+	struct i2c_client *client = bus;
+	struct i2c_msg msgs[2];
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	msgs[0].buf = (char *)&address;
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = client->flags & I2C_M_TEN;
+	msgs[1].flags |= I2C_M_RD;
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
+EXPORT_SYMBOL(occ_i2c_getscom);
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
+EXPORT_SYMBOL(occ_i2c_putscom);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("I2C OCC SCOM transport");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
new file mode 100644
index 0000000..945739c
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.h
@@ -0,0 +1,26 @@
+/*
+ * occ_scom_i2c.h - hwmon OCC driver
+ *
+ * This file contains function protoypes for peforming SCOM operations over I2C
+ * bus to access the OCC.
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
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
1.9.1

