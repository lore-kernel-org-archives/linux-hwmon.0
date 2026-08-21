Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3D3C1404
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348873; cv=none; b=ppABFFhv5EMUdWqE2OnFl7YZ3gyI5ysLle5606UsIRO0aFA0hKwFwBmxrcxrNNRe262zhx125GX1KudqHsuyQ3sUMTG8lF5ZocFSlSruByEc8P9Hp4b2hBeruLcN2xFl1lkj4iQGpYNFyJRfEr91wlmvFG2u7uVVFnpX5qQZWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348873; c=relaxed/simple;
	bh=Pr+KO7YvysTbeph7TGLEHTJkVKFWzI6sdg5T9h6pLyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKYmV9e6NruuFWxd3lbxE6gwfm9OIsIXr739YvRlt3XGFXxCowWIMA+dyJuFanZ4B+18GSSRvOmijvY3wIz4L1Tl5OBmJTs7OZP1y77awLsZRw3r3CxtvIyA+hsKuAIM5rI0C8K+LlWxV/6OapxPGWpoPD4i4vLJtxZxVwfoR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZiEdlEH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZiEdlEH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d530328efbso14107225ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348871; x=1787953671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnZI8+nc+Knc3+TFhQOTQt3dD43caZ7wHkTTDp8PK3I=;
        b=hZiEdlEHtZgWy0+CY1zyuzP1T3hicMxm/0Lz5eaTJ+rX3RdeYH20+3zviVquTxTyva
         DKRWdIZz9n21i4h0lblh1Nl9r91zpReZsBzT6wU7u4TUGPVWbw9gwbi8WV4i9RLYQebk
         bExfidGgKHDtdMJ7IgYQCpvASuBBVKt1Y5CMIHjpRFe7F8w7qV0AON0jNHAlteG2n/BY
         fF5wgwoe5p8dMdAYnC0yfZPpW5zbJM+ISmsm1iI+E7shvBVLvQ67VF0aoz+5rEoKZvBV
         gwzc7EpyQjk45SSPl4fO6iJOvpO7NMoBrozqZbp0KhWWSiuZ1OiMiKDUsCqTbJRPang1
         SfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348871; x=1787953671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnZI8+nc+Knc3+TFhQOTQt3dD43caZ7wHkTTDp8PK3I=;
        b=BYwrUF94WUAui0jJuvumYygkkzArDGk5TqEFi7+fMxfZvsmQokmgoYwGpIHd5js0tc
         U1hZYuYUjKwzOvCoha3CLP1gavUap2+ctohR7J4rOu7iiezDXSbZgcgb5m4NxslXPNDG
         Z8EjH9U89qATBKb4MUm+rUxFrCGKYqNjq6svcMsXDz2bHKvx7F6UK/azWj84dZgQ7M3F
         R5l5CuBjkxWLLSYaf5KgbhE5bZA1KbtXcrtAs6cuj2NUoRSA03PbUGXjX17HTUggmEmv
         oa0FkObrSk/MYXxrEybWG/JYZd174k/oUKZY6NA0Ap2xc1niVMDZf0sB095keMh0T5su
         hLZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+KdTQKYPgbGI1Rnkonj0iq0Nc+mySWPWcqqchhITlEE3uXC8SYyNZAC2ZgqCOplXYCO9SC+wxUqpfUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kh5bykKrFNGtRbIRmlo9X+scqxihmAhuC1iKoWZwdaDxat/Uok
	wrvndu3pQ/5zwpagIMAhpXY4eU8jFvghbJ62lQuqJW7HLSKcvUCNESGM
X-Gm-Gg: AR+sD101bp56z5HwsDOF03Zx1b8Et9sZLZw8Hewp+VvhOUY7yO7eRqj1us+IjJZRsaW
	ntG7EQ3YNM3cdg2Wt/ZJla95iKZO0nCCpd3er1zpYuYCORNgF7dGYm5oWFnzk0Q8hxRF8jGKBJT
	VWoMNjPSvEOOie7ez4DWWEXkZVmjHpC/AJ5V1tAHtGWMFRlfWEqP5rgjCPX7CHU2oRFa6lG7iia
	/Fxk/HaoularLr3DKy17nSgfOFYkrg7ZrKLX51U3vt6DxJyWPDJu2kjfb8C4fBd4xlRxv4oiM8O
	+SARzm7zNMEJcq7qai2VWRHe+w9/IXRcnQTPESc6aiQ2CdZX+GIMmE7jBR80Afqcu7lcp+ZvVyE
	I38yQ/Eu5r4RIpXao5eG9z37mgoGCfF9fGXIc73FvfQAq7Cpb+JOa02OcCdeE3G/pUxMe5GbOIx
	brOJ7j9CO0WB2U2dHJoL15WI+jX76RVxbfIK4ODTZ5s0AfyqR+qZVjyegMCLK1kPeBb4fS9yT3z
	rSneQzlEumDHolx1/s=
X-Received: by 2002:a17:90a:e7c5:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-395c34f47cbmr15716824a91.8.1787348870524;
        Fri, 21 Aug 2026 14:47:50 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:49 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method curve driver
Date: Sat, 22 Aug 2026 03:17:27 +0530
Message-ID: <20260821214728.87773-4-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821214728.87773-1-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Legion Go firmware keeps its custom fan curve in a separate Fan Method WMI
interface. Method 5 returns ten control values and ten temperatures, while
Method 6 replaces the complete table.

The GUID also appears on Lenovo systems with a different table layout.
Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
same ten-point layout and Method 6 request.

The curve applies to the same fan as the existing Other Mode attributes.
Add a separate WMI driver and attach the ten automatic-point pairs to the
HWMON device that Other Mode already provides. Match devices from the same
WMI provider. Other Mode continues to work without Fan Method. Probe does
not invoke either method.

Validate both counts, every control value, and the complete temperature
table before using a Method 5 reply. A point write holds the mutex while
it reads the current table, changes one control value, and submits the
complete Method 6 request. The other values remain unchanged.

The HWMON mapping is not clear. On the tested Legion Go 8APU1, the fan
responds to values from 0 through 115. This is Lenovo's 0 through 115
percent range. Lenovo software shows 0 through 100 percent to the user,
and 115 reaches the RPM observed in Full Speed mode. Firmware accepts
values through 255, but values above 115 caused no observed RPM increase.

This RFC exposes the firmware values unchanged. The fixed temperatures are
read-only.

Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
 .../wmi/devices/lenovo-wmi-other.rst          |   3 +
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/lenovo/Kconfig           |  11 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c       |  97 ++++-
 7 files changed, 520 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
 create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c

diff --git a/Documentation/wmi/devices/lenovo-wmi-fan-method.rst b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
new file mode 100644
index 000000000000..67c9a92ed992
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==================================
+Lenovo Fan Method WMI Driver
+==================================
+
+WMI GUID ``92549549-4BDE-4F06-AC04-CE8BF898DBAA``
+
+The Lenovo Fan Method interface provides a ten-point firmware fan table on
+Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2, Legion Go S 8ARP1, and
+Legion Go S 8APU1 products.
+
+The driver adds ``pwm1_auto_point1_*`` through
+``pwm1_auto_point10_*`` to the HWMON device that the Lenovo Other Mode driver
+owns. The temperature attributes are fixed and read-only. They contain points
+from 10 through 100 degrees Celsius in 10-degree steps.
+
+Each ``pwm1_auto_point*_pwm`` attribute is read-write and passes a firmware
+control value from 0 through 255 without scaling. On the tested Legion Go
+8APU1, the hardware responds from 0 through 115, corresponding to Lenovo's
+0 through 115 percent range. Lenovo software shows 0 through 100 percent to
+the user, and 115 percent reaches the RPM observed in Full Speed mode. The
+firmware accepts values through 255, but values above 115 caused no observed
+RPM increase.
+
+A control-value read validates both ten-entry tables before returning data. A
+point write reads the current table, changes one control value, and submits the
+complete request. It preserves the other nine control values and all returned
+temperatures.
+
+The Fan Method and Other Mode drivers use separate modules and WMI devices.
+The component framework associates devices that belong to the same WMI
+provider. Fan Method curve attributes are absent when either interface is not
+available.
diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index c93e9e6f3fd0..34352dbd6fb9 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -60,6 +60,9 @@ Some Legion Go firmware does not advertise fan 1 RPM through Capability
 Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
 ``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
 
+When the separate Lenovo Fan Method driver binds to the same WMI provider, it
+adds ten automatic fan-curve points to this HWMON device.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 3820b286f09f..8612c2323540 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14689,6 +14689,7 @@ M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/wmi/devices/lenovo-wmi-fan-method.rst
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/x86/lenovo/*
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 4443f40ef8aa..e69942ce3093 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -276,3 +276,14 @@ config LENOVO_WMI_TUNING
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-wmi-other.
+
+config LENOVO_WMI_FAN_METHOD
+	tristate "Lenovo Fan Method WMI Driver"
+	depends on DMI
+	depends on LENOVO_WMI_TUNING
+	help
+	  Say Y here to add the firmware fan table on supported Lenovo
+	  Legion Go products to the Lenovo Other Mode HWMON device.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-fan-method.
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 91a9370f11b3..171a19e01479 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -17,6 +17,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
 lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
+lenovo-target-$(CONFIG_LENOVO_WMI_FAN_METHOD)	+= wmi-fan-method.o
 
 # Add 'lenovo' prefix to each module listed in lenovo-target-*
 define LENOVO_OBJ_TARGET
diff --git a/drivers/platform/x86/lenovo/wmi-fan-method.c b/drivers/platform/x86/lenovo/wmi-fan-method.c
new file mode 100644
index 000000000000..4f29c4134caf
--- /dev/null
+++ b/drivers/platform/x86/lenovo/wmi-fan-method.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Fan Method WMI interface driver.
+ *
+ * This driver exposes the firmware fan table through HWMON automatic-point
+ * attributes on selected Lenovo Legion Go products.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/wmi.h>
+
+#define LENOVO_FAN_METHOD_GUID "92549549-4BDE-4F06-AC04-CE8BF898DBAA"
+
+#define LENOVO_FAN_METHOD_GET_CURVE	5
+#define LENOVO_FAN_METHOD_SET_CURVE	6
+#define LENOVO_FAN_CURVE_POINTS		10
+#define LENOVO_FAN_CURVE_REPLY_SIZE	88
+#define LENOVO_FAN_CURVE_WRITE_SIZE	64
+
+#define LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET	0
+#define LENOVO_FAN_REPLY_SPEED_OFFSET		4
+#define LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET	44
+#define LENOVO_FAN_REPLY_TEMP_OFFSET		48
+
+#define LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET	2
+#define LENOVO_FAN_WRITE_SPEED_OFFSET		6
+#define LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET	26
+#define LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET	27
+#define LENOVO_FAN_WRITE_TEMP_OFFSET		31
+#define LENOVO_FAN_WRITE_TRAILER_OFFSET		51
+#define LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET	53
+
+#define LENOVO_FAN_WRITE_TEMP_TYPE		1
+#define LENOVO_FAN_WRITE_TRAILER		0x5a
+#define LENOVO_FAN_WRITE_TRAILER_VALUE		100
+
+static const struct dmi_system_id lwmi_fan_dmi_table[] = {
+	{
+		.ident = "Lenovo Legion Go 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go S 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go S 8ARP1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go 8ASP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go 8AHP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
+		},
+	},
+	{}
+};
+
+static const u16 lwmi_fan_temperatures[LENOVO_FAN_CURVE_POINTS] = {
+	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
+};
+
+struct lwmi_fan_method_curve {
+	u16 speed[LENOVO_FAN_CURVE_POINTS];
+	u16 temperature[LENOVO_FAN_CURVE_POINTS];
+};
+
+struct lwmi_fan_method_priv;
+
+struct lwmi_fan_method_attr {
+	struct device_attribute dev_attr;
+	struct lwmi_fan_method_priv *priv;
+	u8 index;
+};
+
+struct lwmi_fan_method_priv {
+	struct wmi_device *wdev;
+	struct mutex lock; /* Serializes all Fan Method calls. */
+	struct lwmi_fan_method_attr point_attrs[LENOVO_FAN_CURVE_POINTS * 2];
+	struct attribute *attrs[LENOVO_FAN_CURVE_POINTS * 2 + 1];
+	struct attribute_group group;
+};
+
+static int lwmi_fan_method_get_curve(struct lwmi_fan_method_priv *priv,
+				     struct lwmi_fan_method_curve *curve)
+{
+	u8 input[] = { 1, 1 };
+	struct wmi_buffer in = {
+		.length = sizeof(input),
+		.data = input,
+	};
+	struct wmi_buffer out = {};
+	const u8 *buffer;
+	int ret, i;
+
+	ret = wmidev_invoke_method(priv->wdev, 0,
+				   LENOVO_FAN_METHOD_GET_CURVE, &in, &out,
+				   LENOVO_FAN_CURVE_REPLY_SIZE);
+	if (ret)
+		return ret;
+
+	buffer = out.data;
+	if (get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET) !=
+	    LENOVO_FAN_CURVE_POINTS ||
+	    get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET) !=
+	    LENOVO_FAN_CURVE_POINTS) {
+		ret = -ERANGE;
+		goto out_free;
+	}
+
+	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
+		u32 speed = get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_OFFSET +
+					       i * sizeof(u32));
+		u32 temperature =
+			get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_OFFSET +
+					   i * sizeof(u32));
+
+		if (speed > U8_MAX || temperature != lwmi_fan_temperatures[i]) {
+			ret = -ERANGE;
+			goto out_free;
+		}
+
+		curve->speed[i] = speed;
+		curve->temperature[i] = temperature;
+	}
+
+out_free:
+	kfree(out.data);
+	return ret;
+}
+
+static int lwmi_fan_method_set_curve(struct lwmi_fan_method_priv *priv,
+				     const struct lwmi_fan_method_curve *curve)
+{
+	u8 buffer[LENOVO_FAN_CURVE_WRITE_SIZE] = { 0xff, 0x01 };
+	struct wmi_buffer in = {
+		.length = sizeof(buffer),
+		.data = buffer,
+	};
+	int i;
+
+	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
+			   buffer + LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET);
+	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
+		put_unaligned_le16(curve->speed[i],
+				   buffer + LENOVO_FAN_WRITE_SPEED_OFFSET +
+				   i * sizeof(u16));
+
+	buffer[LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET] = LENOVO_FAN_WRITE_TEMP_TYPE;
+	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
+			   buffer + LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET);
+	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
+		put_unaligned_le16(curve->temperature[i],
+				   buffer + LENOVO_FAN_WRITE_TEMP_OFFSET +
+				   i * sizeof(u16));
+
+	buffer[LENOVO_FAN_WRITE_TRAILER_OFFSET] = LENOVO_FAN_WRITE_TRAILER;
+	put_unaligned_le16(LENOVO_FAN_WRITE_TRAILER_VALUE,
+			   buffer + LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET);
+
+	return wmidev_invoke_procedure(priv->wdev, 0,
+				       LENOVO_FAN_METHOD_SET_CURVE, &in);
+}
+
+static ssize_t lwmi_fan_method_pwm_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct lwmi_fan_method_attr *point_attr =
+		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
+	struct lwmi_fan_method_priv *priv = point_attr->priv;
+	struct lwmi_fan_method_curve curve;
+	int ret;
+
+	guard(mutex)(&priv->lock);
+
+	ret = lwmi_fan_method_get_curve(priv, &curve);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", curve.speed[point_attr->index]);
+}
+
+static ssize_t lwmi_fan_method_pwm_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct lwmi_fan_method_attr *point_attr =
+		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
+	struct lwmi_fan_method_priv *priv = point_attr->priv;
+	struct lwmi_fan_method_curve curve;
+	unsigned long pwm;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &pwm);
+	if (ret)
+		return ret;
+	if (pwm > U8_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&priv->lock);
+
+	ret = lwmi_fan_method_get_curve(priv, &curve);
+	if (ret)
+		return ret;
+
+	curve.speed[point_attr->index] = pwm;
+	ret = lwmi_fan_method_set_curve(priv, &curve);
+
+	return ret ? ret : count;
+}
+
+static ssize_t lwmi_fan_method_temp_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct lwmi_fan_method_attr *point_attr =
+		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
+
+	return sysfs_emit(buf, "%u\n",
+			  lwmi_fan_temperatures[point_attr->index] * 1000);
+}
+
+#define LWMI_FAN_METHOD_POINT_NAMES(_point) \
+	"pwm1_auto_point" #_point "_pwm", \
+	"pwm1_auto_point" #_point "_temp"
+
+static const char * const lwmi_fan_method_attr_names[] = {
+	LWMI_FAN_METHOD_POINT_NAMES(1),
+	LWMI_FAN_METHOD_POINT_NAMES(2),
+	LWMI_FAN_METHOD_POINT_NAMES(3),
+	LWMI_FAN_METHOD_POINT_NAMES(4),
+	LWMI_FAN_METHOD_POINT_NAMES(5),
+	LWMI_FAN_METHOD_POINT_NAMES(6),
+	LWMI_FAN_METHOD_POINT_NAMES(7),
+	LWMI_FAN_METHOD_POINT_NAMES(8),
+	LWMI_FAN_METHOD_POINT_NAMES(9),
+	LWMI_FAN_METHOD_POINT_NAMES(10),
+};
+
+#undef LWMI_FAN_METHOD_POINT_NAMES
+
+static void lwmi_fan_method_attrs_init(struct lwmi_fan_method_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
+		struct lwmi_fan_method_attr *pwm = &priv->point_attrs[i * 2];
+		struct lwmi_fan_method_attr *temp = &priv->point_attrs[i * 2 + 1];
+
+		sysfs_attr_init(&pwm->dev_attr.attr);
+		pwm->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2];
+		pwm->dev_attr.attr.mode = 0644;
+		pwm->dev_attr.show = lwmi_fan_method_pwm_show;
+		pwm->dev_attr.store = lwmi_fan_method_pwm_store;
+		pwm->priv = priv;
+		pwm->index = i;
+		priv->attrs[i * 2] = &pwm->dev_attr.attr;
+
+		sysfs_attr_init(&temp->dev_attr.attr);
+		temp->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2 + 1];
+		temp->dev_attr.attr.mode = 0444;
+		temp->dev_attr.show = lwmi_fan_method_temp_show;
+		temp->index = i;
+		priv->attrs[i * 2 + 1] = &temp->dev_attr.attr;
+	}
+
+	priv->group.attrs = priv->attrs;
+}
+
+static int lwmi_fan_method_master_bind(struct device *dev)
+{
+	struct lwmi_fan_method_priv *priv = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, &priv->group);
+}
+
+static void lwmi_fan_method_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, NULL);
+}
+
+static const struct component_master_ops lwmi_fan_method_master_ops = {
+	.bind = lwmi_fan_method_master_bind,
+	.unbind = lwmi_fan_method_master_unbind,
+};
+
+static int lwmi_fan_method_component_compare(struct device *dev, void *data)
+{
+	struct device *master = data;
+
+	return dev->driver &&
+		!strcmp(dev->driver->name, "lenovo_wmi_other") &&
+		dev->parent == master->parent;
+}
+
+static int lwmi_fan_method_probe(struct wmi_device *wdev, const void *context)
+{
+	struct component_match *master_match = NULL;
+	struct lwmi_fan_method_priv *priv;
+
+	if (!dmi_check_system(lwmi_fan_dmi_table))
+		return -ENODEV;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	mutex_init(&priv->lock);
+	lwmi_fan_method_attrs_init(priv);
+	dev_set_drvdata(&wdev->dev, priv);
+
+	component_match_add(&wdev->dev, &master_match,
+			    lwmi_fan_method_component_compare, &wdev->dev);
+	if (IS_ERR(master_match))
+		return PTR_ERR(master_match);
+
+	return component_master_add_with_match(&wdev->dev,
+					       &lwmi_fan_method_master_ops,
+					       master_match);
+}
+
+static void lwmi_fan_method_remove(struct wmi_device *wdev)
+{
+	component_master_del(&wdev->dev, &lwmi_fan_method_master_ops);
+}
+
+static const struct wmi_device_id lwmi_fan_method_id_table[] = {
+	{ LENOVO_FAN_METHOD_GUID, NULL },
+	{}
+};
+
+static struct wmi_driver lwmi_fan_method_driver = {
+	.driver = {
+		.name = "lenovo_wmi_fan_method",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_fan_method_id_table,
+	.probe = lwmi_fan_method_probe,
+	.remove = lwmi_fan_method_remove,
+	.no_singleton = true,
+};
+
+MODULE_DEVICE_TABLE(wmi, lwmi_fan_method_id_table);
+module_wmi_driver(lwmi_fan_method_driver);
+
+MODULE_AUTHOR("Aditya Dash <mradityadash@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Fan Method WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index b4be7739b243..72d3510b17b2 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -192,11 +192,13 @@ struct lwmi_om_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 	struct wmi_device *wdev;
+	const struct attribute_group *fan_method_group;
 	int ida_id;
 
 	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
 	bool fullspeed_supported;
 	bool fan0_input_fallback;
+	bool fan_method_group_added;
 
 	struct {
 		bool capdata00_collected : 1;
@@ -542,6 +544,31 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
 	.info = lwmi_om_hwmon_info,
 };
 
+static int lwmi_om_fan_method_group_add(struct lwmi_om_priv *priv)
+{
+	int ret;
+
+	if (!priv->hwmon_dev || !priv->fan_method_group ||
+	    priv->fan_method_group_added)
+		return 0;
+
+	ret = sysfs_create_group(&priv->hwmon_dev->kobj,
+				 priv->fan_method_group);
+	if (!ret)
+		priv->fan_method_group_added = true;
+
+	return ret;
+}
+
+static void lwmi_om_fan_method_group_remove(struct lwmi_om_priv *priv)
+{
+	if (!priv->hwmon_dev || !priv->fan_method_group_added)
+		return;
+
+	sysfs_remove_group(&priv->hwmon_dev->kobj, priv->fan_method_group);
+	priv->fan_method_group_added = false;
+}
+
 /**
  * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
  * @priv: Driver private data
@@ -550,9 +577,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 {
 	u32 rpm;
 	long enable;
-	int i, valid;
+	int i, ret, valid;
 
-	if (WARN_ON(priv->hwmon_dev))
+	if (priv->hwmon_dev)
 		return;
 
 	if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_fan_collected) {
@@ -592,7 +619,8 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 		}
 	}
 
-	if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
+	if (valid == 0 && !priv->fullspeed_supported &&
+	    !priv->fan0_input_fallback && !priv->fan_method_group) {
 		dev_warn(&priv->wdev->dev,
 			 "fan reporting/tuning is unsupported on this device\n");
 		return;
@@ -609,6 +637,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 		return;
 	}
 
+	ret = lwmi_om_fan_method_group_add(priv);
+	if (ret)
+		dev_warn(&priv->wdev->dev,
+			 "failed to register Fan Method attributes: %d\n", ret);
+
 	dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
 }
 
@@ -623,6 +656,7 @@ static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
 	if (!priv->hwmon_dev)
 		return;
 
+	lwmi_om_fan_method_group_remove(priv);
 	hwmon_device_unregister(priv->hwmon_dev);
 	priv->hwmon_dev = NULL;
 }
@@ -1801,10 +1835,44 @@ static const struct component_master_ops lwmi_om_master_ops = {
 	.unbind = lwmi_om_master_unbind,
 };
 
+static int lwmi_om_fan_method_component_bind(struct device *component,
+					     struct device *master, void *data)
+{
+	const struct attribute_group *group = data;
+	struct lwmi_om_priv *priv = dev_get_drvdata(component);
+	int ret;
+
+	if (!group)
+		return -EINVAL;
+
+	priv->fan_method_group = group;
+	lwmi_om_hwmon_add(priv);
+	ret = lwmi_om_fan_method_group_add(priv);
+	if (ret)
+		priv->fan_method_group = NULL;
+
+	return ret;
+}
+
+static void lwmi_om_fan_method_component_unbind(struct device *component,
+						struct device *master, void *data)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(component);
+
+	lwmi_om_fan_method_group_remove(priv);
+	priv->fan_method_group = NULL;
+}
+
+static const struct component_ops lwmi_om_fan_method_component_ops = {
+	.bind = lwmi_om_fan_method_component_bind,
+	.unbind = lwmi_om_fan_method_component_unbind,
+};
+
 static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 {
 	struct component_match *master_match = NULL;
 	struct lwmi_om_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1816,16 +1884,31 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
+	ret = component_add(&wdev->dev, &lwmi_om_fan_method_component_ops);
+	if (ret)
+		return ret;
+
 	lwmi_cd_match_add_all(&wdev->dev, &master_match);
-	if (IS_ERR(master_match))
-		return PTR_ERR(master_match);
+	if (IS_ERR(master_match)) {
+		ret = PTR_ERR(master_match);
+		goto err_component;
+	}
+
+	ret = component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
+					      master_match);
+	if (ret)
+		goto err_component;
+
+	return 0;
 
-	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
-					       master_match);
+err_component:
+	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
+	return ret;
 }
 
 static void lwmi_other_remove(struct wmi_device *wdev)
 {
+	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
 	component_master_del(&wdev->dev, &lwmi_om_master_ops);
 }
 
-- 
2.55.0

