Received: from 1.mo584.mail-out.ovh.net (1.mo584.mail-out.ovh.net [178.33.248.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5419F464
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Apr 2025 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.248.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764719; cv=none; b=s/WQpxBy6c7XYPU8aA/e0tW7j0HLk6Ckrq+WPXAI3wkabw/gcjH2wDnVnm00i+tYTFVgmK6gJrlhRXlo9bCSfi+0h4kusXO5n9U95sUmTmxV0CVr2TSNfjT5xRtNliiwRDsVAq7qfyOlBBxouTTtoo+24eKtb6Pa7/FZXTlWH6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764719; c=relaxed/simple;
	bh=G1qCIgkbZnn+V9iSeRtkpCS/FFXeu2Ctkol40lQl3Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLxnKnRArNng1Q1RZdfBKoRAlKbiiIZZKs7gv5gXGJo4RiQ2iaA+/so++LBueeO63tsPEzEz8lpRdDLw2oTP574nf9H7ixb59IkFU/IjGj8dgrHi+7xOz1dxJeCIw+jV0ye67Y46ySBn0ZWySa38R1f2+fEoP1/wXRs3/MMn1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=VoF9OkPJ; arc=none smtp.client-ip=178.33.248.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="VoF9OkPJ"
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.2.78])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4ZTZYl27TMz1VKb
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Apr 2025 10:27:55 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hwnh4 (unknown [10.110.113.80])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 28C111FED7;
	Fri,  4 Apr 2025 10:27:54 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-hwnh4 with ESMTPSA
	id MTczIii072eAdwAAFqhOfw:T2
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 04 Apr 2025 10:27:54 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S004450c9fc5-8234-465e-a6bd-b018655ed3e6,
                    1ACEDA468B0737788FFD4D5BBF4CC5986193201C) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:89.64.23.248
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v6 1/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri,  4 Apr 2025 12:27:37 +0200
Message-ID: <20250404102737.81767-2-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404102737.81767-1-michal.kopec@3mdeb.com>
References: <20250404102737.81767-1-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12982470351793753362
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefhhfdtgeeuleethedvkeejkeejvddvhfeftefhueefhffhheeileeivdfffeenucffohhmrghinhepuggrshhhrghrohdrtghomhenucfkphepuddvjedrtddrtddruddpkeelrdeigedrvdefrddvgeekpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=rC0jdZVknTwbI4xsVDKay3FeWN3kbu5WZ+x0UsWjjmk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743762475; v=1;
 b=VoF9OkPJG0+EIaKMGzKVXSBfMm6xu1sljd733KYn8xETvDktYxqkf7Xk7kTU/j3PaU7gSUeD
 APLD9zdiok0nNfkuRX6My6wc99RWBiqhkFw9p/i75wcbdYmLlU9xKs0uSQ+KPxi3qK1Y973q5Qn
 RFVr8McV5bKRCm4jDDh8hwZGSuwe6yyPOgdUFCIAwYf/c3Z40cT7RCSl2dnxWj738gxZH1cGmdN
 uqFMJdajtz33bzTODmRl+lhjLSKzGTfEwuwloNrEfWs6TbOvqY0ZcM8RXN0wvyn7g2ND79hN0lM
 T30BQ8enpXjjFxw/lIt5o2YCOsl1r6aham8QcWF8E71bw==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 357 ++++++++++++++++++++++++++++
 4 files changed, 376 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 00e94bec401e..6d2e0909ac63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6404,6 +6404,12 @@ F:	net/ax25/ax25_out.c
 F:	net/ax25/ax25_timer.c
 F:	net/ax25/sysctl_net_ax25.c
 
+DASHARO ACPI PLATFORM DRIVER
+M:	Michał Kopeć <michal.kopec@3mdeb.com>
+S:	Maintained
+W:	https://docs.dasharo.com/
+F:	drivers/platform/x86/dasharo_acpi.c
+
 DATA ACCESS MONITOR
 M:	SeongJae Park <sj@kernel.org>
 L:	damon@lists.linux.dev
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..8168c5274a08 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
 	  To compile this driver as a module, choose M here: the module
 	  will be called lenovo-wmi-camera.
 
+config DASHARO_ACPI
+	tristate "Dasharo ACPI Platform Driver"
+	depends on ACPI
+	depends on HWMON
+	help
+	  This driver provides HWMON support for devices running Dasharo
+	  firmware.
+
+	  If you have a device with Dasharo firmware, choose Y or M here.
+
 source "drivers/platform/x86/x86-android-tablets/Kconfig"
 
 config FW_ATTR_CLASS
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..3ca53ae01d93 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 # Inspur
 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
 
+# Dasharo
+obj-$(CONFIG_DASHARO_ACPI)	+= dasharo-acpi.o
+
 # Laptop drivers
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
new file mode 100644
index 000000000000..041dc44797dc
--- /dev/null
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Dasharo ACPI Driver
+ */
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+enum dasharo_feature {
+	DASHARO_FEATURE_TEMPERATURE = 0,
+	DASHARO_FEATURE_FAN_PWM,
+	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_MAX
+};
+
+enum dasharo_temperature {
+	DASHARO_TEMPERATURE_CPU_PACKAGE = 0,
+	DASHARO_TEMPERATURE_CPU_CORE,
+	DASHARO_TEMPERATURE_GPU,
+	DASHARO_TEMPERATURE_BOARD,
+	DASHARO_TEMPERATURE_CHASSIS,
+	DASHARO_TEMPERATURE_MAX
+};
+
+enum dasharo_fan {
+	DASHARO_FAN_CPU = 0,
+	DASHARO_FAN_GPU,
+	DASHARO_FAN_CHASSIS,
+	DASHARO_FAN_MAX
+};
+
+#define MAX_GROUPS_PER_FEAT 8
+
+static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PER_FEAT] = {
+	[DASHARO_FEATURE_TEMPERATURE] = {
+		[DASHARO_TEMPERATURE_CPU_PACKAGE] = "CPU Package",
+		[DASHARO_TEMPERATURE_CPU_CORE] = "CPU Core",
+		[DASHARO_TEMPERATURE_GPU] = "GPU",
+		[DASHARO_TEMPERATURE_BOARD] = "Board",
+		[DASHARO_TEMPERATURE_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_PWM] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_TACH] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+};
+
+struct dasharo_capability {
+	unsigned int group;
+	unsigned int index;
+	char name[16];
+};
+
+#define MAX_CAPS_PER_FEAT 24
+
+struct dasharo_data {
+	struct platform_device *pdev;
+	int caps_found[DASHARO_FEATURE_MAX];
+	struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_PER_FEAT];
+};
+
+static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum dasharo_feature feat, int cap)
+{
+	struct acpi_object_list obj_list;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+	u64 count;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = feat;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = cap;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = ACPI_HANDLE(&data->pdev->dev);
+	status = acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	return count;
+}
+
+static int dasharo_read_channel(struct dasharo_data *data, char *method, enum dasharo_feature feat, int channel, long *value)
+{
+	struct acpi_object_list obj_list;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+	u64 val;
+
+	if (feat > ARRAY_SIZE(data->capabilities))
+		return -EINVAL;
+
+	if (channel > ARRAY_SIZE(data->capabilities[feat]))
+		return -EINVAL;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = data->capabilities[feat][channel].group;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = data->capabilities[feat][channel].index;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = ACPI_HANDLE(&data->pdev->dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	*value = val;
+	return 0;
+}
+
+static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = dasharo_read_channel(data, "GTMP", DASHARO_FEATURE_TEMPERATURE, channel, &value);
+		if (!ret)
+			*val = value * MILLIDEGREE_PER_DEGREE;
+		break;
+	case hwmon_fan:
+		ret = dasharo_read_channel(data, "GFTH", DASHARO_FEATURE_FAN_TACH, channel, &value);
+		if (!ret)
+			*val = value;
+		break;
+	case hwmon_pwm:
+		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
+		if (!ret)
+			*val = value;
+		break;
+	default:
+		return -ENODEV;
+		break;
+	}
+
+	return ret;
+}
+
+static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel >= data->caps_found[DASHARO_FEATURE_TEMPERATURE])
+			return -EINVAL;
+
+		*str = data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].name;
+		break;
+	case hwmon_fan:
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_TACH])
+			return -EINVAL;
+
+		*str = data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].name;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	const struct dasharo_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->caps_found[DASHARO_FEATURE_TEMPERATURE])
+			return 0444;
+		break;
+	case hwmon_pwm:
+		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			return 0444;
+		break;
+	case hwmon_fan:
+		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops dasharo_hwmon_ops = {
+	.is_visible = dasharo_hwmon_is_visible,
+	.read_string = dasharo_hwmon_read_string,
+	.read = dasharo_hwmon_read,
+};
+
+// Max 24 capabilities per feature
+static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
+	.ops = &dasharo_hwmon_ops,
+	.info = dasharo_hwmon_info,
+};
+
+static void dasharo_fill_feature_caps(struct dasharo_data *data, enum dasharo_feature feat)
+{
+	struct dasharo_capability *cap;
+	int cap_count = 0;
+	int count;
+
+	for (int group = 0; group < MAX_GROUPS_PER_FEAT; ++group) {
+		count = dasharo_get_feature_cap_count(data, feat, group);
+
+		if (count <= 0)
+			continue;
+
+		for (unsigned int i = 0; i < count && cap_count < ARRAY_SIZE(data->capabilities[feat]); ++i) {
+			cap = &data->capabilities[feat][cap_count];
+			cap->group = group;
+			cap->index = i;
+			scnprintf(cap->name, sizeof(cap->name), "%s %d", dasharo_group_names[feat][group], i);
+			cap_count++;
+		}
+	}
+	data->caps_found[feat] = cap_count;
+}
+
+static int dasharo_probe(struct platform_device *pdev)
+{
+	struct dasharo_data *data;
+	struct device *hwmon;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->pdev = pdev;
+
+	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i)
+		dasharo_fill_feature_caps(data, i);
+
+	hwmon = devm_hwmon_device_register_with_info(&pdev->dev, "dasharo_acpi", data,
+						     &dasharo_hwmon_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static const struct acpi_device_id dasharo_device_ids[] = {
+	{"DSHR0001", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, dasharo_device_ids);
+
+static struct platform_driver dasharo_driver = {
+	.driver = {
+		.name = "dasharo-acpi",
+		.acpi_match_table = dasharo_device_ids,
+	},
+	.probe = dasharo_probe,
+};
+module_platform_driver(dasharo_driver);
+
+MODULE_DESCRIPTION("Dasharo ACPI Driver");
+MODULE_AUTHOR("Michał Kopeć <michal.kopec@3mdeb.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0

