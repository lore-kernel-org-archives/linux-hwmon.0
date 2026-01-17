Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCE2EB86C;
	Sat, 17 Jan 2026 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768683710; cv=pass; b=XOm+3DT7yvdL2XFnSU354qxIrt6YhVQe1njqaw8RcSDAQocHrwBBNCoQw/16O0SI7q7CW3wY63dhvzegx5cw9zM0AaXNzOasN+0sT2TSog2jkQU/O72fl/AacxCWYJLrrxg7gGF1ZfKy7ouNFRy+plktvD5qC2mYrS0l5kpOs6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768683710; c=relaxed/simple;
	bh=+xa2896bFLIWLOz2M1M8vSsDGJzYLsrwMxoEnIWsiVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iClpTkBdCrHH3MHQ8CPlPAZFrthnPO9nkSHmO+DJjCK+pTmGmTK47yWa28MTqg0ge1bsp57Rz1PP8+pVlUuLDwsORITuo1gBxGj/VqnChwe1YU2ewEdZKvuEhAtR4qIMLIcDXDBdYgOSiRpmXAGevX7W77vOLXBBTrxAb4FYghs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UoKo8Jy/; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UoKo8Jy/"
ARC-Seal: i=1; a=rsa-sha256; t=1768683688; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cZrDT7DC9IBzVrrbjy943WdlyZFS4Y5hF9rD7fa6swkf2AVCb9QtG1aGnHpHLMnsOgUDr5CEhsTzbSMa0VgedG/bOri3xsFJC061/7a/QoHKqxqVkqxBjfa32tkwy25XxkiMWiU8E/oVtiVv9XNkKvzfDFFijn6babSvj2lM7tU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768683688; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h1dCr+zTmMaCqhTNu/al8yUqFRf5hFYlViuuD/AC+n4=; 
	b=f7TV5Uw/7TXTI4xFOPLMtnFFxcqyjVscHEKMUCvCw891YvqA5778F44/L3Jpl8WuPoPwB09m3VaAC4/21PGT04fnPrVSD5fFRvq83jj5Z8qzbhlON4RWdxuGziNqNbXhgnEEcTXVGDt+/9UKk3WxcWMfs1iu45Oo9lJ7PgEpYPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768683687;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h1dCr+zTmMaCqhTNu/al8yUqFRf5hFYlViuuD/AC+n4=;
	b=UoKo8Jy//9AUPbYm1uIm0Sg750G9MwreGjP+nC13J+QzjS5BU+1ENOxZqozNDc1E
	DguZHkI3Y7sfatMq1iTsoIt6VEZ3jBfYnMSqQIJ6in3v91qQeXmMrm9RXgGJyfnEE01
	3CwJgzERVbZkTIv4cFdNys/RcQF0EqzvKGQmVn5I=
Received: by mx.zohomail.com with SMTPS id 176868368692034.492564732202254;
	Sat, 17 Jan 2026 13:01:26 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	Kurt Borja <kuurtb@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v10 7/7] platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
Date: Sun, 18 Jan 2026 05:00:48 +0800
Message-ID: <20260117210051.108988-8-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117210051.108988-1-i@rong.moe>
References: <20260117210051.108988-1-i@rong.moe>
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

 - fanX_div: internal RPM divisor
 - fanX_input: current RPM
 - fanX_max: maximum RPM
 - fanX_min: minimum RPM
 - fanX_target: target RPM (tunable, 0=auto)

Information from capdata00 and capdata_fan are used to control the
visibility and constraints of HWMON attributes. Fan info from capdata00
is collected on bind, while fan info from capdata_fan is collected in a
callback. Once all fan info is collected, register the HWMON device.

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v10:
- Remove fanX_enable due to semantic mismatch with HWMON ABI (thanks
  Kurt Borja)
  - By removing it, its functionality (stopping the fan) is hidden
    behind the module parameter "relax_fan_constraint", so that users
    won't accidentally stop the fan while in a default setup
- Mention fanX_target=0 means auto in documentation (ditto)
- Also accept retval=0 while setting the fan (ditto)
- Add fanX_div (thanks Derek J. Clark)
- Round down the written value of fanX_target to the nearest multiple of
  fanX_div, so that the stored value matches the effective value

Changes in v8:
- Refactor some statements to improve readability (thanks Ilpo Järvinen)
- Use more commonly used errno (ditto)
- Fix missing #include

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
 .../wmi/devices/lenovo-wmi-other.rst          |  14 +
 drivers/platform/x86/lenovo/Kconfig           |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 502 +++++++++++++++++-
 3 files changed, 507 insertions(+), 10 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 821282e07d93c..01d4711567380 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -31,6 +31,8 @@ under the following path:
 
   /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
 
+Additionally, this driver also exports attributes to HWMON.
+
 LENOVO_CAPABILITY_DATA_00
 -------------------------
 
@@ -39,6 +41,14 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
 The LENOVO_CAPABILITY_DATA_00 interface provides various information that
 does not rely on the gamezone thermal mode.
 
+The following HWMON attributes are implemented:
+ - fanX_div: internal RPM divisor
+ - fanX_input: current RPM
+ - fanX_target: target RPM (tunable, 0=auto)
+
+Due to the internal RPM divisor, the current/target RPMs are rounded down to
+its nearest multiple. The divisor itself is not necessary to be a power of two.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
@@ -70,6 +80,10 @@ WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
 The LENOVO_FAN_TEST_DATA interface provides reference data for self-test of
 cooling fans.
 
+The following HWMON attributes are implemented:
+ - fanX_max: maximum RPM
+ - fanX_min: minimum RPM
+
 WMI interface description
 =========================
 
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index fb96a0f908f03..be9af04511462 100644
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
index c1cf2278369e1..874a277b6ae7c 100644
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
@@ -25,9 +34,11 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/gfp_types.h>
+#include <linux/hwmon.h>
 #include <linux/idr.h>
 #include <linux/kdev_t.h>
 #include <linux/kobject.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/platform_profile.h>
@@ -49,12 +60,26 @@
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
+#define LWMI_FAN_DIV 100
+
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
 static DEFINE_IDA(lwmi_om_ida);
@@ -67,19 +92,459 @@ enum attribute_property {
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
+};
+
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
+	"Do not enforce fan RPM constraint (div/min/max) "
+	"and enables fan tuning when such data is missing. "
+	"Enabling this may results in HWMON attributes being out-of-sync, "
+	"and setting a too low RPM stops the fan. Use with caution.");
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
+	if (!set) {
+		*val = retval;
+		return 0;
+	}
+
+	/*
+	 * It seems that 0 means "no error" and 1 means "done". Apparently
+	 * different firmware teams have different thoughts on indicating
+	 * success, so we accepts both.
+	 */
+	return (retval == 0 || retval == 1) ? 0 : -EIO;
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
+		case hwmon_fan_div:
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
+		/*
+		 * The EC has an internal RPM divisor (i.e., the raw register value is
+		 * RPM / fanY_div). For fanY_input, the WMI moethod reads the register
+		 * value and returns raw * fanY_div. For fanY_target, the WMI method
+		 * divides the written value by fanY_div before writing it to the EC.
+		 *
+		 * As a result, reading fanY_input always returns a multiple of fanY_div,
+		 * while writing to fanY_target loses the remainder.
+		 */
+		case hwmon_fan_div:
+			*val = LWMI_FAN_DIV;
+			return 0;
+		case hwmon_fan_input:
+			err = lwmi_om_fan_get_set(priv, channel, &retval, false);
+			if (err)
+				return err;
+
+			*val = retval;
+			return 0;
+		case hwmon_fan_target:
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
+		case hwmon_fan_target:
+			if (relax_fan_constraint) {
+				min_rpm = 1;
+				max_rpm = U16_MAX;
+			} else {
+				min_rpm = priv->fan_info[channel].min_rpm;
+				max_rpm = priv->fan_info[channel].max_rpm;
+			}
+
+			/* 0 means "auto". */
+			if (val != 0 && (val < min_rpm || val > max_rpm))
+				return -EINVAL;
+
+			/*
+			 * The effective fanY_target is always a multiple of fanY_div
+			 * due to the EC's internal RPM divisor (see lwmi_om_hwmon_read).
+			 *
+			 * Round down the written value to the nearest multiple of fanY_div
+			 * to prevent mismatch between the effective value and last_target.
+			 *
+			 * For relax_fan_constraint, skip this conversion as setting a
+			 * sub-fanY_div value is necessary to completely stop the fan on
+			 * some devices.
+			 */
+			if (!relax_fan_constraint)
+				raw = val / LWMI_FAN_DIV * LWMI_FAN_DIV;
+
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
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
+			   HWMON_F_MIN | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
+			   HWMON_F_MIN | HWMON_F_MAX),
+	NULL
 };
 
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
@@ -559,32 +1024,45 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
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
 
@@ -592,15 +1070,18 @@ static int lwmi_om_master_bind(struct device *dev)
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
 
@@ -665,5 +1146,6 @@ MODULE_IMPORT_NS("LENOVO_WMI_CD");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
 MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
 MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0

