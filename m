Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0C33D6C8;
	Tue, 25 Nov 2025 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100259; cv=pass; b=vEom97iNmmFlN/tV+KQzt41FXtJZqQAffls8WkkbqKGQ84zgnG8htLstjQon5jHoID4mfqYdwjq+XfwSBAcUBNUq1Iwbdq4CHW2zyXPRdXfSSkaRxE9ro3QrKFBnLbPV03QbvaY8Qva+UOYXBYMzHbsgny7Zrn569knMJbbWaBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100259; c=relaxed/simple;
	bh=VlgfJMWT4BzcqfmHexiDpMuTdDfx2MgxEIgm1Do2rtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NdiyKrrkdVsGCEcnoxLHWIQOcKXneY9/DMwrH39yMM+Lx/dMvdXmN16EsFRpXVsg/m/JEiyf5LCBSqg8yev7vhwUnbfgOmeDei1xQ7Tz62n4a/WOq2h08Q3EK2Ia8tYYneqeeqv2LqhPoffAVyiiGUIsbmwXX43nl9T9spB6wmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OMkC9aX4; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="OMkC9aX4"
ARC-Seal: i=1; a=rsa-sha256; t=1764100233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IHzhXryI/BbOkModwbafGs9Q4+EtrjDPT9m3Fl1FhkmZoPM3hwA1939KjA7YGLRwuK8PNUAC8MrioKFUejcPdZV21+7f/hIG4lPEiPwgeJ2fMuPliySAtJhgj+r/eMDCt8v6Uygsm5OJ1jr3jowx6AmyVQWSu6NvYhuAIkvWYlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764100233; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xTLjp27GfPUrFuQYU0yLw1kinj8oDtk+am2BdBHFuuo=; 
	b=hRhdtffiWvscTTg/Ll/+78hqIEGuDm7KTlqgjc0uL9F+NVbrFeySSf1+qiBEuWRPkbwh91OP8xvHJRpfADHjrjZqrEOz483XjjP7dOMEDuMikfr0mmwQ5gnSyGyaup1uB6yNaAoOFKVFz0NrgWcCj7Q+E/tckl2yVRMWcvbV3bg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764100233;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xTLjp27GfPUrFuQYU0yLw1kinj8oDtk+am2BdBHFuuo=;
	b=OMkC9aX4XUY1wiHsFPHE+oh4kS7NWg4TTawh9o3Zk7ZfnvX9zGhAWvau1xlwaALY
	19OhJHOF805h8Z+OpkM3wUbuts2R+bS8PLUSZOaCecNJtlFvFTpU+U7SPvDX7oR5SoF
	a/hxMrajIsGpruzMS1FLOBYoQU4rDIegTkuy9bPQ=
Received: by mx.zohomail.com with SMTPS id 1764100231340472.8958736371633;
	Tue, 25 Nov 2025 11:50:31 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v7 7/7] platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
Date: Wed, 26 Nov 2025 03:49:28 +0800
Message-ID: <20251125194959.157524-8-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125194959.157524-1-i@rong.moe>
References: <20251125194959.157524-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Register an HWMON device for fan reporting/tuning according to
Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
by lenovo-wmi-capdata. The corresponding HWMON nodes are:

 - fanX_enable: enable/disable the fan (tunable)
 - fanX_input: current RPM
 - fanX_max: maximum RPM
 - fanX_min: minimum RPM
 - fanX_target: target RPM (tunable)

Information from capdata00 and capdata_fan are used to control the
visibility and constraints of HWMON attributes. Fan info from capdata00
is collected on bind, while fan info from capdata_fan is collected in a
callback. Once all fan info is collected, register the HWMON device.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Fix formatting issues (thanks Ilpo Järvinen)
- Improve the readability of struct lwmi_fan_info's definition (ditto)

Changes in v4:
- Rework HWMON registration due to the introduction of [PATCH v4 6/7]
  - Collect fan info from capdata00 and capdata_fan separately
  - Use a callback to collect fan info from capdata_fan
  - Trigger HWMON registration only if all fan info is collected
  - Do not check 0x04050000.supported, implied by the presense of
    capdata_fan
- Drop Reviewed-by & Tested-by due to the changes, please review & test

Changes in v3:
- Reword documentation (thanks Derek J. Clark)

Changes in v2:
- Define 4 fan channels instead of 2 (thanks Derek J. Clark)
- Squash min/max reporting patch into this one (ditto)
- Query 0x04050000 for interface availability (ditto)
  - New parameter "expose_all_fans" to skip this check
- Enforce min/max RPM constraint on set (ditto)
  - New parameter "relax_fan_constraint" to disable this behavior
  - Drop parameter "ignore_fan_cap", superseded by the next one
  - New parameter "expose_all_fans" to expose fans w/o such data
- Assume auto mode on probe (ditto)
- Reword documentation (ditto)
- Do not register HWMON device if no fan can be exposed
- fanX_target: Return -EBUSY instead of raw target value when fan stops
---
 .../wmi/devices/lenovo-wmi-other.rst          |  11 +
 drivers/platform/x86/lenovo/Kconfig           |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 489 +++++++++++++++++-
 3 files changed, 491 insertions(+), 10 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 821282e07d93..bd1d733ff286 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -31,6 +31,8 @@ under the following path:
 
   /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
 
+Additionally, this driver also exports attributes to HWMON.
+
 LENOVO_CAPABILITY_DATA_00
 -------------------------
 
@@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
 The LENOVO_CAPABILITY_DATA_00 interface provides various information that
 does not rely on the gamezone thermal mode.
 
+The following HWMON attributes are implemented:
+ - fanX_enable: enable/disable the fan (tunable)
+ - fanX_input: current RPM
+ - fanX_target: target RPM (tunable)
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
@@ -70,6 +77,10 @@ WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
 The LENOVO_FAN_TEST_DATA interface provides reference data for self-test of
 cooling fans.
 
+The following HWMON attributes are implemented:
+ - fanX_max: maximum RPM
+ - fanX_min: minimum RPM
+
 WMI interface description
 =========================
 
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index fb96a0f908f0..be9af0451146 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
 config LENOVO_WMI_TUNING
 	tristate "Lenovo Other Mode WMI Driver"
 	depends on ACPI_WMI
+	select HWMON
 	select FW_ATTR_CLASS
 	select LENOVO_WMI_DATA
 	select LENOVO_WMI_EVENTS
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c1cf2278369e..e54343b10f2e 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -14,7 +14,16 @@
  * These attributes typically don't fit anywhere else in the sysfs and are set
  * in Windows using one of Lenovo's multiple user applications.
  *
+ * Additionally, this driver also exports tunable fan speed RPM to HWMON.
+ * Min/max RPM are also provided for reference.
+ *
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ *   - fw_attributes
+ *   - binding to Capability Data 01
+ *
+ * Copyright (C) 2025 Rong Zhang <i@rong.moe>
+ *   - HWMON
+ *   - binding to Capability Data 00 and Fan
  */
 
 #include <linux/acpi.h>
@@ -25,6 +34,7 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/gfp_types.h>
+#include <linux/hwmon.h>
 #include <linux/idr.h>
 #include <linux/kdev_t.h>
 #include <linux/kobject.h>
@@ -49,12 +59,26 @@
 #define LWMI_FEATURE_ID_CPU_SPL 0x02
 #define LWMI_FEATURE_ID_CPU_FPPT 0x03
 
+#define LWMI_FEATURE_ID_FAN_RPM 0x03
+
 #define LWMI_TYPE_ID_NONE 0x00
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
+#define LWMI_FAN_ID_BASE 1
+#define LWMI_FAN_NR 4
+#define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
+
+#define LWMI_ATTR_ID_FAN_RPM(x)						\
+	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
+	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
+	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
+
+#define LWMI_FAN_STOP_RPM 1
+
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
 static DEFINE_IDA(lwmi_om_ida);
@@ -67,19 +91,447 @@ enum attribute_property {
 	SUPPORTED,
 };
 
+struct lwmi_fan_info {
+	u32 supported;
+	u32 last_target;
+	long min_rpm;
+	long max_rpm;
+};
+
 struct lwmi_om_priv {
 	struct component_master_ops *ops;
 
 	/* only valid after capdata bind */
+	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
 
+	struct device *hwmon_dev;
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 	struct notifier_block nb;
 	struct wmi_device *wdev;
 	int ida_id;
+
+	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
+
+	struct {
+		bool capdata00_collected : 1;
+		bool capdata_fan_collected : 1;
+	} fan_flags;
 };
 
+/*
+ * Visibility of fan channels:
+ *
+ * +-------------------+---------+------------------+-----------------------+------------+
+ * |                   | default | +expose_all_fans | +relax_fan_constraint | +both      |
+ * +-------------------+---------+------------------+-----------------------+------------+
+ * | canonical         | RW      | RW               | RW+relaxed            | RW+relaxed |
+ * +-------------------+---------+------------------+-----------------------+------------+
+ * | -capdata_fan[idx] | N       | RO               | N                     | RW+relaxed |
+ * +-------------------+---------+------------------+-----------------------+------------+
+ *
+ * Note:
+ * 1. LWMI_ATTR_ID_FAN_RPM[idx].supported is always checked before exposing a channel.
+ * 2. -capdata_fan implies -capdata_fan[idx].
+ */
+static bool expose_all_fans;
+module_param(expose_all_fans, bool, 0444);
+MODULE_PARM_DESC(expose_all_fans,
+	"This option skips some capability checks and solely relies on per-channel ones "
+	"to expose fan attributes. Use with caution.");
+
+static bool relax_fan_constraint;
+module_param(relax_fan_constraint, bool, 0444);
+MODULE_PARM_DESC(relax_fan_constraint,
+	"Do not enforce fan RPM constraint (min/max RPM) "
+	"and enables fan tuning when such data is missing. "
+	"Enabling this may results in HWMON attributes being out-of-sync. Use with caution.");
+
+/* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
+
+/**
+ * lwmi_om_fan_get_set() - Get or set fan RPM value of specified fan
+ * @priv: Driver private data structure
+ * @channel: Fan channel index (0-based)
+ * @val: Pointer to value (input for set, output for get)
+ * @set: True to set value, false to get value
+ *
+ * Communicates with WMI interface to either retrieve current fan RPM
+ * or set target fan RPM.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
+{
+	struct wmi_method_args_32 args;
+	u32 method_id, retval;
+	int err;
+
+	method_id = set ? LWMI_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
+	args.arg0 = LWMI_ATTR_ID_FAN_RPM(channel);
+	args.arg1 = set ? *val : 0;
+
+	err = lwmi_dev_evaluate_int(priv->wdev, 0x0, method_id,
+				    (unsigned char *)&args, sizeof(args), &retval);
+	if (err)
+		return err;
+
+	if (!set)
+		*val = retval;
+	else if (retval != 1)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
+ * @drvdata: Driver private data
+ * @type: Sensor type
+ * @attr: Attribute identifier
+ * @channel: Channel index
+ *
+ * Determines whether an HWMON attribute should be visible in sysfs
+ * based on hardware capabilities and current configuration.
+ *
+ * Return: permission mode, or 0 if invisible.
+ */
+static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	struct lwmi_om_priv *priv = (struct lwmi_om_priv *)drvdata;
+	bool visible = false;
+
+	if (type == hwmon_fan) {
+		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_enable:
+		case hwmon_fan_target:
+			if (!(priv->fan_info[channel].supported & LWMI_SUPP_MAY_SET))
+				return 0;
+
+			if (relax_fan_constraint ||
+			    (priv->fan_info[channel].min_rpm >= 0 &&
+			     priv->fan_info[channel].max_rpm >= 0))
+				return 0644;
+
+			/*
+			 * Reaching here implies expose_all_fans is set.
+			 * See lwmi_om_hwmon_add().
+			 */
+			dev_warn_once(&priv->wdev->dev,
+				      "fan tuning disabled due to missing RPM constraint\n");
+			return 0;
+		case hwmon_fan_input:
+			visible = priv->fan_info[channel].supported & LWMI_SUPP_MAY_GET;
+			break;
+		case hwmon_fan_min:
+			visible = priv->fan_info[channel].min_rpm >= 0;
+			break;
+		case hwmon_fan_max:
+			visible = priv->fan_info[channel].max_rpm >= 0;
+			break;
+		}
+	}
+
+	return visible ? 0444 : 0;
+}
+
+/**
+ * lwmi_om_hwmon_read() - Read HWMON sensor data
+ * @dev: Device pointer
+ * @type: Sensor type
+ * @attr: Attribute identifier
+ * @channel: Channel index
+ * @val: Pointer to store value
+ *
+ * Reads current sensor values from hardware through WMI interface.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
+	u32 retval = 0;
+	int err;
+
+	if (type == hwmon_fan) {
+		switch (attr) {
+		case hwmon_fan_input:
+			err = lwmi_om_fan_get_set(priv, channel, &retval, false);
+			if (err)
+				return err;
+
+			*val = retval;
+			return 0;
+		case hwmon_fan_enable:
+			*val = priv->fan_info[channel].last_target != LWMI_FAN_STOP_RPM;
+			return 0;
+		case hwmon_fan_target:
+			if (priv->fan_info[channel].last_target == LWMI_FAN_STOP_RPM)
+				return -EBUSY;
+
+			*val = priv->fan_info[channel].last_target;
+			return 0;
+		case hwmon_fan_min:
+			*val = priv->fan_info[channel].min_rpm;
+			return 0;
+		case hwmon_fan_max:
+			*val = priv->fan_info[channel].max_rpm;
+			return 0;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+/**
+ * lwmi_om_hwmon_write() - Write HWMON sensor data
+ * @dev: Device pointer
+ * @type: Sensor type
+ * @attr: Attribute identifier
+ * @channel: Channel index
+ * @val: Value to write
+ *
+ * Writes configuration values to hardware through WMI interface.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
+	u32 raw, min_rpm, max_rpm;
+	int err;
+
+	if (type == hwmon_fan) {
+		switch (attr) {
+		case hwmon_fan_enable:
+			if (val == 0)
+				raw = LWMI_FAN_STOP_RPM;
+			else if (val == 1)
+				raw = 0; /* auto */
+			else
+				return -EINVAL;
+
+			goto fan_set;
+		case hwmon_fan_target:
+			if (val == 0) {
+				raw = 0;
+				goto fan_set;
+			}
+
+			min_rpm = relax_fan_constraint
+					? LWMI_FAN_STOP_RPM + 1
+					: priv->fan_info[channel].min_rpm;
+			max_rpm = relax_fan_constraint
+					? U16_MAX
+					: priv->fan_info[channel].max_rpm;
+
+			if (val < min_rpm || val > max_rpm)
+				return -EDOM;
+
+			raw = val;
+fan_set:
+			err = lwmi_om_fan_get_set(priv, channel, &raw, true);
+			if (err)
+				return err;
+
+			priv->fan_info[channel].last_target = raw;
+			return 0;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] = {
+	/* Must match LWMI_FAN_NR. */
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
+			   HWMON_F_MIN | HWMON_F_MAX),
+	NULL
+};
+
+static const struct hwmon_ops lwmi_om_hwmon_ops = {
+	.is_visible = lwmi_om_hwmon_is_visible,
+	.read = lwmi_om_hwmon_read,
+	.write = lwmi_om_hwmon_write,
+};
+
+static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
+	.ops = &lwmi_om_hwmon_ops,
+	.info = lwmi_om_hwmon_info,
+};
+
+/**
+ * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
+ * @priv: Driver private data
+ */
+static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
+{
+	int i, valid;
+
+	if (WARN_ON(priv->hwmon_dev))
+		return;
+
+	if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_fan_collected) {
+		dev_dbg(&priv->wdev->dev, "HWMON registration pending (00: %d, fan: %d)\n",
+			priv->fan_flags.capdata00_collected,
+			priv->fan_flags.capdata_fan_collected);
+		return;
+	}
+
+	if (expose_all_fans)
+		dev_warn(&priv->wdev->dev, "all fans exposed. Use with caution\n");
+
+	if (relax_fan_constraint)
+		dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with caution\n");
+
+	valid = 0;
+	for (i = 0; i < LWMI_FAN_NR; i++) {
+		if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
+			continue;
+
+		valid++;
+
+		if (!expose_all_fans &&
+		    (priv->fan_info[i].min_rpm < 0 || priv->fan_info[i].max_rpm < 0)) {
+			dev_dbg(&priv->wdev->dev, "missing RPM constraint for fan%d, hiding\n",
+				LWMI_FAN_ID(i));
+			priv->fan_info[i].supported = 0;
+			valid--;
+		}
+	}
+
+	if (valid == 0) {
+		dev_warn(&priv->wdev->dev,
+			 "fan reporting/tuning is unsupported on this device\n");
+		return;
+	}
+
+	priv->hwmon_dev = hwmon_device_register_with_info(&priv->wdev->dev,
+							  LWMI_OM_HWMON_NAME, priv,
+							  &lwmi_om_hwmon_chip_info,
+							  NULL);
+	if (IS_ERR(priv->hwmon_dev)) {
+		dev_warn(&priv->wdev->dev, "failed to register HWMON device: %ld\n",
+			 PTR_ERR(priv->hwmon_dev));
+		priv->hwmon_dev = NULL;
+		return;
+	}
+
+	dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
+}
+
+/**
+ * lwmi_om_hwmon_remove() - Unregister HWMON device
+ * @priv: Driver private data
+ *
+ * Unregisters the HWMON device if applicable.
+ */
+static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
+{
+	if (!priv->hwmon_dev)
+		return;
+
+	hwmon_device_unregister(priv->hwmon_dev);
+	priv->hwmon_dev = NULL;
+}
+
+/**
+ * lwmi_om_fan_info_init() - Initialzie fan info
+ * @priv: Driver private data
+ *
+ * lwmi_om_fan_info_collect_cd00() and lwmi_om_fan_info_collect_cd_fan() may be
+ * called in an arbitrary order. Hence, initializion must be done before.
+ */
+static void lwmi_om_fan_info_init(struct lwmi_om_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < LWMI_FAN_NR; i++) {
+		priv->fan_info[i] = (struct lwmi_fan_info) {
+			.supported = 0,
+			/*
+			 * Assume 0 on probe as the EC resets all fans to auto mode on (re)boot.
+			 *
+			 * Note that S0ix (s2idle) preserves the RPM target, so we don't need
+			 * suspend/resume callbacks. This behavior has not been tested on S3-
+			 * capable devices, but I doubt if such devices even have this interface.
+			 */
+			.last_target = 0,
+			.min_rpm = -ENODATA,
+			.max_rpm = -ENODATA,
+		};
+	}
+
+	priv->fan_flags.capdata00_collected = false;
+	priv->fan_flags.capdata_fan_collected = false;
+}
+
+/**
+ * lwmi_om_fan_info_collect_cd00() - Collect fan info from capdata 00
+ * @priv: Driver private data
+ */
+static void lwmi_om_fan_info_collect_cd00(struct lwmi_om_priv *priv)
+{
+	struct capdata00 capdata00;
+	int i, err;
+
+	dev_dbg(&priv->wdev->dev, "Collecting fan info from capdata00\n");
+
+	for (i = 0; i < LWMI_FAN_NR; i++) {
+		err = lwmi_cd00_get_data(priv->cd00_list, LWMI_ATTR_ID_FAN_RPM(i), &capdata00);
+		priv->fan_info[i].supported = err ? 0 : capdata00.supported;
+	}
+
+	priv->fan_flags.capdata00_collected = true;
+	lwmi_om_hwmon_add(priv);
+}
+
+/**
+ * lwmi_om_fan_info_collect_cd_fan() - Collect fan info from capdata fan
+ * @dev: Pointer to the lenovo-wmi-other device
+ * @cd_fan_list: Pointer to the capdata fan list
+ */
+static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *cd_fan_list)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
+	struct capdata_fan capdata_fan;
+	int i, err;
+
+	dev_dbg(dev, "Collecting fan info from capdata_fan\n");
+
+	if (!cd_fan_list)
+		goto out;
+
+	for (i = 0; i < LWMI_FAN_NR; i++) {
+		err = lwmi_cd_fan_get_data(cd_fan_list, LWMI_FAN_ID(i), &capdata_fan);
+		if (err)
+			continue;
+
+		priv->fan_info[i].min_rpm = capdata_fan.min_rpm;
+		priv->fan_info[i].max_rpm = capdata_fan.max_rpm;
+	}
+
+out:
+	priv->fan_flags.capdata_fan_collected = true;
+	lwmi_om_hwmon_add(priv);
+}
+
+/* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
+
 struct tunable_attr_01 {
 	struct capdata01 *capdata;
 	struct device *dev;
@@ -559,32 +1011,45 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 	device_unregister(priv->fw_attr_dev);
 }
 
+/* ======== Self (master: lenovo-wmi-other) ======== */
+
 /**
  * lwmi_om_master_bind() - Bind all components of the other mode driver
  * @dev: The lenovo-wmi-other driver basic device.
  *
- * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to the
- * lenovo-wmi-other master driver. On success, assign the capability data 01
- * list pointer to the driver data struct for later access. This pointer
- * is only valid while the capdata01 interface exists. Finally, register all
- * firmware attribute groups.
+ * Call component_bind_all to bind the lenovo-wmi-capdata devices to the
+ * lenovo-wmi-other master driver, with a callback to collect fan info from
+ * capdata_fan. On success, assign the capability data list pointers to the
+ * driver data struct for later access. These pointers are only valid while the
+ * capdata interfaces exist. Finally, collect fan info from capdata00 and
+ * register all firmware attribute groups. Note that the HWMON device is
+ * registered only if all fan info is collected. Hence, it is not registered
+ * here. See lwmi_om_fan_info_collect_cd00() and
+ * lwmi_om_fan_info_collect_cd_fan().
  *
  * Return: 0 on success, or an error code.
  */
 static int lwmi_om_master_bind(struct device *dev)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
-	struct lwmi_cd_binder binder = {};
+	struct lwmi_cd_binder binder = {
+		.cd_fan_list_cb = lwmi_om_fan_info_collect_cd_fan,
+	};
 	int ret;
 
+	lwmi_om_fan_info_init(priv);
+
 	ret = component_bind_all(dev, &binder);
 	if (ret)
 		return ret;
 
+	priv->cd00_list = binder.cd00_list;
 	priv->cd01_list = binder.cd01_list;
-	if (!priv->cd01_list)
+	if (!priv->cd00_list || !priv->cd01_list)
 		return -ENODEV;
 
+	lwmi_om_fan_info_collect_cd00(priv);
+
 	return lwmi_om_fw_attr_add(priv);
 }
 
@@ -592,15 +1057,18 @@ static int lwmi_om_master_bind(struct device *dev)
  * lwmi_om_master_unbind() - Unbind all components of the other mode driver
  * @dev: The lenovo-wmi-other driver basic device
  *
- * Unregister all capability data attribute groups. Then call
- * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from the
- * lenovo-wmi-other master driver. Finally, free the IDA for this device.
+ * Unregister all firmware attribute groups and the HWMON device. Then call
+ * component_unbind_all to unbind lenovo-wmi-capdata devices from the
+ * lenovo-wmi-other master driver.
  */
 static void lwmi_om_master_unbind(struct device *dev)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
 
 	lwmi_om_fw_attr_remove(priv);
+
+	lwmi_om_hwmon_remove(priv);
+
 	component_unbind_all(dev, NULL);
 }
 
@@ -665,5 +1133,6 @@ MODULE_IMPORT_NS("LENOVO_WMI_CD");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
 MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
 MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0

