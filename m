Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793306107;
	b=4wdKSGxDEWsT2EpXKqAWkCR179fc4NrleXTsmaPFsjIcBqYrl+Xcl2Rx302whexnobQO
	 gFDN6pYs8UJJbsW8PsE9NbEiIfyxKpSf/64gPdZaU8S9SYAGgoYIB3PfB+AJdA2HMy7x5
	 tJFQ6NAmTRiOvujOK8F8xBot61tbiculRTgb++ftnf+cam/nhZ3TNyWFZtVtXbSVF9HRK
	 aXqs5xJJikhHZgOffmWEnyweuny7QoksrgihCbm3S7nk6GsqJ65pvCCC82GdditVVJkeM
	 W6U+CBYTRWbUmVRFBzXtqHSRzIqKmKGn/3uIPfO4bpbbKKllc4eBfcuwoLeI5so04Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wV0jAZkoNRSmCucNjo6hSl/i5bAlJ4AOy7rZeNtsLuc=;
	b=H9OoTDpUwgQQOD+ySl2R5mYGpoWK+lpVwg/ReIxZ7qb9RRLI/+GdeK+3QnGX099c33QQ
	 dEp7pA3iQEcOmfDbKetu2/LaF9jfR+AEfx44zLtGLTHQBjMIMfnUhZ/ewkhCv6Rkkr4s1
	 harqvy+dtN0Uv3LJUf+0Pu6K3LoS/32TeHT1k9iQJzZUKez0Wh2f19gSA0pNo8Tu/F33f
	 fTCG/nJgMFQiRbjCIAN2E101VoYwwm3Ke6DnZ3a29dqhTtEyQYQILsEs9mnNIArBDrUUz
	 Po5y9+lVlPq2xPgcox1buZt3WsHujK25mWHzxBtUwukEflN29RVxsxbmQtlZ63s2eKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3stLgwm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55A60A262F
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 20:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA55A60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3stLgwm
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso48012e0c.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 13:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793306106; cv=none;
        d=google.com; s=arc-20260327;
        b=kCaU6m4KXf2+cd0P37B+t3aTJ3aSZERV5bBrtVdjtCD95xeTzycuj/2pg0n9k6x37M
         En0iss+U/WrC2KpVaLta+1WviRhyl5eJ9D8KYx6Tz/hGltfhiM9imQIv3NKyTFwKizIV
         iqeoeBo7OG6w3djCL9Yz1d11wQ2fRsJUIogMTEXrs9xu3rmx0TDYzeO0fvFI9t3d+KO0
         Cp0MlJkxqbuKecNNPaczyrWRfN6MkM80piLXhiPMDW5NdTxqrxLglcaQvfVU/F0pXCeL
         D3zp+g9UAyThXwioOgQJ4VM3QZE9L9FrtgjKfdTU5kb32o/jbm7k+qZwk+mFy4/vg79D
         BSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wV0jAZkoNRSmCucNjo6hSl/i5bAlJ4AOy7rZeNtsLuc=;
        fh=hXpIlXERyF5mkMCQUTBAiEvzfGEOkx83ifC2/79at4I=;
        b=h+arLLwQb6vNQQlldwddaHNxAQG0LZsx9mTze8tBkeNKTDzzBQj1gnRbmRPWPXkEjY
         01tz/6BOimonS+6oQY2Jdh6uBZHlZe95zMS/k5EL5jPACw91icRXiQuIR9KCPduolLW0
         IbZJdKpS7sWLEgFbRqEqq4E89+JiVMzzCpNJ3/2zXGSpRrmsQkAO7efYojilj5Ozo1YQ
         zcs9F8OzsAIy0MemVj2WPzelkQ9D7lA95LYrpqME1ehGS9pzKJtm1Mi8bJgr1lijybDU
         J2hH3Vugex69r47hbFswjWVwiw5yJmi3MKwS4t9QzEX0PKhFBInztHLZBmCgt4+2iY/X
         eObw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793306106; x=1793910906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wV0jAZkoNRSmCucNjo6hSl/i5bAlJ4AOy7rZeNtsLuc=;
        b=I3stLgwmuyQ6kFl1cF1ki58BRkP0lybVH3vSh0255GidOA4EJhvX6YSP3+WmcIoJhj
         Crh+jVB3l7oE3UUrMFAvT3IdW8jvKM3RRkwQMihhRIrjl7O6OByO2WGcmel91nsQDRyz
         akTEDpVQdPazPpkyQcFGw7nyLsx3qBu6kU8S7wSntfl38imXo3NxN/G9jORpqfCyeapt
         JwagMVB2Hv7arapldBA2UTQuS2uQotOPe4AQOQzAsptASkJO7dK0LOCe9YU+rGlr4Lcj
         vbH87fv2Yngtt0wQ6So/hSYEHq0Fy5qZlRFr+xf1mL3HJg2xQAXvm51cBQ0mIkKwpW5f
         E/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306106; x=1793910906;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wV0jAZkoNRSmCucNjo6hSl/i5bAlJ4AOy7rZeNtsLuc=;
        b=cAgf7f/QzYLH65jhbKWQjUdo6P6Bwpk7Blxc6akBAWzkkMZfmmqpY967A4ZelwJk7t
         g6s3cWU3t2VLr12gQeGVbWq2LRxWJNyDa1EakBxd1wrRjgijZZGz1uySHi0Uorm4+ISw
         7UiO6VBE8/gdavk81Q175Q8XAO/eAaEKF4I6ae/5gHrMplKEVE40bCSX4f893fY/dHfZ
         bSXovwwfBck6i6v/JXoOzlTCJhndMhmU57HmNOCGzzH5KFmrHupZ4VCI7Bt7IKsYY1me
         3k5rtwzr+LPi6xSn0aie925tRfMH/flHNGuPMA+a4pCXDBctyEDMRCe2yM6GsXyQnSFr
         PEwA==
X-Gm-Message-State: AFq9FYLlp9pmwKEm5e8VBZAvSQbwdqNURuvWptCGn7iGzxYC+3o/poGp
	FdKVox26mql1RXYBWa2O59jPEyOHJuHfgBulFsCov1UW5ejPQ4F+I6+29bVrK+4uPPKTE+4e+ws
	ia4+9ztJoBlws1JzE/rvPt+yiAgzPYVSdKwThjBg=
X-Gm-Gg: AYBFou2m5SmOHEb0xAY57kLrmL07REQcSmxwbQGmvj2+C7QjaNML5MSm2zZ0HWExS0K
	X2uTqHyzCxPoniYue1xCipT0WulPfnOhsrXEHmfpzB8LOm+3pX7bbMnryFC/86RO5v2g+CHS4To
	upBI9SNKkAEDsG8WpENa4x+e2NcQlZyUqKeCsXFsqgGHEZ4UgVjnqgr54LRCtSugwhl5fXa6wCe
	4VnS8nKGdw6UA0bnX3RMoOv5f899y8iuOxxkfVfy56siJKui5XMVmbHgJOUoJinmNZtyUkx9zqx
	ATHI/drGs3XRtkiZc22IAUgor7eZLgxd60PKkjUGFpchyKwPRbCeBY0oMH/JHhpfGmAcYm10a4Z
	5mLHHNAJ24g3Z5wlSwhmQm7hlST8ppz45P8huKIpu6ojc59iYQtzjNZ6oztm/id5wLZc0xX1XNO
	wK/ml2yjjE8K94
X-Received: by 2002:a05:6102:8097:b0:7c3:3890:6076 with SMTP id
 ada2fe7eead31-7d0725cfd65mr214492137.6.1793306105545; Thu, 29 Oct 2026
 13:35:05 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 15:35:05 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 15:34:22 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: LIght JUNction <lightjunction.me@gmail.com>
Date: Thu, 29 Oct 2026 15:35:05 -0500
X-Gm-Features: AclHuK-pC9PW7iAnXLN_O4M5k0COMI-fqZCQi-poa9mgUL3D71BBt8UElVd0XeU
Message-ID: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
Subject: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

From: LIghtJUNction <lightjunction.me@gmail.com>

The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
board GM6PX0X, and BIOS N.1.09MRO07.

The driver checks the firmware project ID and fan capability before
registering the device. It uses only ECRR reads and exposes standard
hwmon temperature and fan input attributes. It does not write EC
registers or expose fan controls. Fan counters are sampled high/low/high
to reject a high-byte rollover.

Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=1, loaded
beside the installed sensor module, provided all four readings, and
unloaded without removing the existing module. Other systems and BIOS
versions have not been tested.

Assisted-by: Codex:GPT-6
Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
---
AI assistance: Codex was used to draft the read-only driver, its Kconfig
and Makefile integration, documentation, and commit message. The request
was to prepare a hwmon submission for the locally verified GM6PX0X using
the firmware read interface and no EC writes.

Validation is limited to an external-module W=1 build and runtime reads on
the laptop and BIOS listed above; no full kernel-tree build was performed.
checkpatch --strict reports no errors and one advisory about a new
MAINTAINERS entry. The general HWMON entry covers these paths.

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/mechrevo-ec.rst |  31 +++
 drivers/hwmon/Kconfig               |  11 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/mechrevo-ec.c         | 290 ++++++++++++++++++++++++++++
 5 files changed, 334 insertions(+)
 create mode 100644 Documentation/hwmon/mechrevo-ec.rst
 create mode 100644 drivers/hwmon/mechrevo-ec.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79..6bd4ece 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
    mc34vr500
    mcp3021
    mcp9982
+   mechrevo-ec
    menf21bmc
    minisforum-um780xtx
    mlxreg-fan
diff --git a/Documentation/hwmon/mechrevo-ec.rst
b/Documentation/hwmon/mechrevo-ec.rst
new file mode 100644
index 0000000..91ffd77
--- /dev/null
+++ b/Documentation/hwmon/mechrevo-ec.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+MECHREVO GM6PX0X EC
+=======================
+
+Supported systems:
+
+  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
+  * BIOS N.1.09MRO07
+
+The driver exposes two EC temperatures and two fan speeds through hwmon. It
+uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. Temperatures
+are reported in millidegrees Celsius and fan speeds in RPM. The CPU and GPU
+temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU and GPU fan
+counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/``0x046b``,
+respectively.
+
+Each successful ECRR read is followed by a 6 to 12 ms delay. Fan reads sample
+the high byte before and after the low byte and retry up to three times if the
+high byte changes. The EC updates independently, so the driver cannot provide
+an atomic snapshot of the two bytes.
+
+At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and bit 6 of
+the capability byte at ``0x078e``. It only binds the exact DMI identity and
+BIOS version listed above. Other models and BIOS versions have not been
+validated.
+
+The driver is read-only. It does not call the firmware write method, change EC
+configuration, or expose fan-control attributes. Values above 125 degrees C
+are reported as unavailable; zero is passed through as read from firmware.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e..7e397c2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
 	  This driver can also be built as a module. If so, the module
 	  will be called hp_wmi_sensors.

+config SENSORS_MECHREVO_EC
+	tristate "MECHREVO GM6PX0X EC sensors"
+	depends on X86 && ACPI
+	help
+	  If you say yes here you get read-only temperature and fan speed
+	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIOS
+	  N.1.09MRO07, using its firmware ACPI method.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called mechrevo_ec.
+
 endif # ACPI

 endif # HWMON
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345e..ac362a1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
 obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
 obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
+obj-$(CONFIG_SENSORS_MECHREVO_EC)	+= mechrevo-ec.o

 # Native drivers
 # asb100, then w83781d go first, as they can override other drivers' addresses.
diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.c
new file mode 100644
index 0000000..d4a3430
--- /dev/null
+++ b/drivers/hwmon/mechrevo-ec.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define MECHREVO_ECRR_DELAY_MIN_US	6000
+#define MECHREVO_ECRR_DELAY_MAX_US	12000
+#define MECHREVO_RPM_ATTEMPTS		3
+
+struct mechrevo_ec_data {
+	acpi_handle inou;
+	/* Serialize the three ECRR calls that make up one fan sample. */
+	struct mutex rpm_lock;
+};
+
+static const struct dmi_system_id mechrevo_ec_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+					"Kuangshi16Pro Series GM6PX0X"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
+			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
+
+static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 address,
+				 u8 *value)
+{
+	union acpi_object argument = {
+		.integer.type = ACPI_TYPE_INTEGER,
+		.integer.value = address,
+	};
+	struct acpi_object_list arguments = {
+		.count = 1,
+		.pointer = &argument,
+	};
+	unsigned long long raw;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(data->inou, "ECRR", &arguments, &raw);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* Match the delay used by the in-tree Uniwill ECRR transport. */
+	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US);
+	if (raw > 255)
+		return -ERANGE;
+
+	*value = raw;
+	return 0;
+}
+
+static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int channel,
+				 long *value)
+{
+	u16 address;
+	u8 raw;
+	int ret;
+
+	switch (channel) {
+	case 0:
+		address = 0x043e;
+		break;
+	case 1:
+		address = 0x044f;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = mechrevo_ec_read_byte(data, address, &raw);
+	if (ret)
+		return ret;
+	if (raw > 125)
+		return -ENODATA;
+
+	*value = raw * 1000;
+	return 0;
+}
+
+static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int channel,
+				long *value)
+{
+	u16 high_address, low_address;
+	u8 high, low, check;
+	int attempt, ret;
+
+	switch (channel) {
+	case 0:
+		high_address = 0x0464;
+		low_address = 0x0465;
+		break;
+	case 1:
+		high_address = 0x046c;
+		low_address = 0x046b;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* The EC can update between byte reads; reject a high-byte rollover. */
+	mutex_lock(&data->rpm_lock);
+	for (attempt = 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
+		ret = mechrevo_ec_read_byte(data, high_address, &high);
+		if (ret)
+			goto out_unlock;
+
+		ret = mechrevo_ec_read_byte(data, low_address, &low);
+		if (ret)
+			goto out_unlock;
+
+		ret = mechrevo_ec_read_byte(data, high_address, &check);
+		if (ret)
+			goto out_unlock;
+
+		if (high == check) {
+			*value = ((long)high << 8) | low;
+			ret = 0;
+			goto out_unlock;
+		}
+	}
+	ret = -EAGAIN;
+
+out_unlock:
+	mutex_unlock(&data->rpm_lock);
+	return ret;
+}
+
+static umode_t mechrevo_ec_is_visible(const void *data,
+				      enum hwmon_sensor_types type,
+				      u32 attr, int channel)
+{
+	if (channel < 0 || channel > 1)
+		return 0;
+
+	if (type == hwmon_temp)
+		return attr == hwmon_temp_input || attr == hwmon_temp_label ? 0444 : 0;
+	if (type == hwmon_fan)
+		return attr == hwmon_fan_input || attr == hwmon_fan_label ? 0444 : 0;
+
+	return 0;
+}
+
+static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long *value)
+{
+	struct mechrevo_ec_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_temp && attr == hwmon_temp_input)
+		return mechrevo_ec_read_temp(data, channel, value);
+	if (type == hwmon_fan && attr == hwmon_fan_input)
+		return mechrevo_ec_read_fan(data, channel, value);
+
+	return -EOPNOTSUPP;
+}
+
+static int mechrevo_ec_read_string(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, const char **value)
+{
+	if (channel < 0 || channel > 1)
+		return -EOPNOTSUPP;
+
+	if (type == hwmon_temp && attr == hwmon_temp_label)
+		*value = channel ? "GPU EC" : "CPU EC";
+	else if (type == hwmon_fan && attr == hwmon_fan_label)
+		*value = channel ? "GPU fan" : "CPU fan";
+	else
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct hwmon_ops mechrevo_ec_hwmon_ops = {
+	.is_visible = mechrevo_ec_is_visible,
+	.read = mechrevo_ec_read,
+	.read_string = mechrevo_ec_read_string,
+};
+
+static const struct hwmon_channel_info * const mechrevo_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info mechrevo_ec_chip_info = {
+	.ops = &mechrevo_ec_hwmon_ops,
+	.info = mechrevo_ec_hwmon_info,
+};
+
+static int mechrevo_ec_probe(struct platform_device *pdev)
+{
+	struct mechrevo_ec_data *data;
+	struct device *hwmon_dev;
+	u8 project, capability;
+	acpi_status status;
+	int ret;
+
+	if (!dmi_check_system(mechrevo_ec_dmi_table))
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->rpm_lock);
+	status = acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
+	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "missing INOU.ECRR method\n");
+
+	ret = mechrevo_ec_read_byte(data, 0x0740, &project);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read EC project ID\n");
+	ret = mechrevo_ec_read_byte(data, 0x078e, &capability);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read EC fan capability\n");
+	if (project != 0x10 || !(capability & 0x40))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "unsupported EC project or fan layout\n");
+
+	platform_set_drvdata(pdev, data);
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "mechrevo",
+							 data,
+							 &mechrevo_ec_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver mechrevo_ec_driver = {
+	.probe = mechrevo_ec_probe,
+	.driver = {
+		.name = "mechrevo-ec-hwmon",
+	},
+};
+
+static struct platform_device *mechrevo_ec_device;
+
+static int __init mechrevo_ec_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(mechrevo_ec_dmi_table))
+		return -ENODEV;
+
+	ret = platform_driver_register(&mechrevo_ec_driver);
+	if (ret)
+		return ret;
+
+	mechrevo_ec_device = platform_device_register_simple("mechrevo-ec-hwmon",
+							     PLATFORM_DEVID_NONE,
+							     NULL, 0);
+	if (IS_ERR(mechrevo_ec_device)) {
+		ret = PTR_ERR(mechrevo_ec_device);
+		platform_driver_unregister(&mechrevo_ec_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit mechrevo_ec_exit(void)
+{
+	platform_device_unregister(mechrevo_ec_device);
+	platform_driver_unregister(&mechrevo_ec_driver);
+}
+
+module_init(mechrevo_ec_init);
+module_exit(mechrevo_ec_exit);
+
+MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0
