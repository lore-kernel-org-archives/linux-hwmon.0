Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACAA345752;
	Mon, 12 Jan 2026 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239600; cv=none; b=rgZIrdjssKbuCBH07pW67GkDNE6jw/07h5aGFyMptmTIdx5AAekKFhz6R3uS58R7UqKEJqikrsI2gDHQ2XcX+RbMcJURixfWFQqbLnDyBWLJlPV/6DWmK5PXA/jweNuTyQMkrzN4r0lDUwuuS0hsNS4SCKxJ25t5VAOFPF4WP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239600; c=relaxed/simple;
	bh=9pKgj2WC9aYDN2ZJtJcRegy6+M/8JUuCdfinAKMm/b0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G43ar4/Kgxpq/Ksi38UHYt71m/dro0BPKSDyiYEdX+obDiyMFQSaYkApVeZSBfpVh/q/25NOk8ZGyU8RwIGk8BbEoitko3IOs4UN33LFwN0hlEG8M18hcJ1tWC+uOr9k+BpJgGSw+whZzE5Dhn59GoRzoWVV/2EY/K//NLSL90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea47DxXc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea47DxXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768239598; x=1799775598;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9pKgj2WC9aYDN2ZJtJcRegy6+M/8JUuCdfinAKMm/b0=;
  b=Ea47DxXcnEU2DG2Ka3W3NNeDfCMV8ags9rwL/1yioP69WlqFFF/0yklT
   +4y406QNIGrw/34nFpfK1FEdh10gH7Ttszz/JsegLVIpqSgr/n22P6KRB
   R3mDo3DEwYU9mfJF4iGABnhXjByoZGhjIxnbr25SSV4izQ+NO/zHzEiIV
   sTGGRC5Vrm9R1NoBSs5TzGgTB/M4o7Of1wiKbfu95WfN9sdKTU+TmOpK1
   BlMWsetzfgT+XNyTg3epy5RxZF3ter8n+HpM0iV2kL2eP7XzySz5DKKzL
   ErOAXzSjfI1ozdq84l8M92CRLgykyxdFHNXVfHCi3Gh4dmQszfLKsjJU6
   Q==;
X-CSE-ConnectionGUID: ueD+VGzdSdCDpsJwKD8vEg==
X-CSE-MsgGUID: iU5dgqSCSxGuFUHc4yFCLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68523334"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68523334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:39:57 -0800
X-CSE-ConnectionGUID: 9qqV9RgZRI2Dq8+WhDmPWQ==
X-CSE-MsgGUID: IOjdJpcWTTa1YuW6IcYa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="241678504"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:39:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 19:39:50 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v7 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
In-Reply-To: <20251125194959.157524-8-i@rong.moe>
Message-ID: <a1819ab7-a468-4446-750a-007187aefee7@linux.intel.com>
References: <20251125194959.157524-1-i@rong.moe> <20251125194959.157524-8-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1959647935-1768239590=:1026"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1959647935-1768239590=:1026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Nov 2025, Rong Zhang wrote:

> Register an HWMON device for fan reporting/tuning according to
> Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>=20
>  - fanX_enable: enable/disable the fan (tunable)
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable)
>=20
> Information from capdata00 and capdata_fan are used to control the
> visibility and constraints of HWMON attributes. Fan info from capdata00
> is collected on bind, while fan info from capdata_fan is collected in a
> callback. Once all fan info is collected, register the HWMON device.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v7:
> - Fix formatting issues (thanks Ilpo J=C3=A4rvinen)
> - Improve the readability of struct lwmi_fan_info's definition (ditto)
>=20
> Changes in v4:
> - Rework HWMON registration due to the introduction of [PATCH v4 6/7]
>   - Collect fan info from capdata00 and capdata_fan separately
>   - Use a callback to collect fan info from capdata_fan
>   - Trigger HWMON registration only if all fan info is collected
>   - Do not check 0x04050000.supported, implied by the presense of
>     capdata_fan
> - Drop Reviewed-by & Tested-by due to the changes, please review & test
>=20
> Changes in v3:
> - Reword documentation (thanks Derek J. Clark)
>=20
> Changes in v2:
> - Define 4 fan channels instead of 2 (thanks Derek J. Clark)
> - Squash min/max reporting patch into this one (ditto)
> - Query 0x04050000 for interface availability (ditto)
>   - New parameter "expose_all_fans" to skip this check
> - Enforce min/max RPM constraint on set (ditto)
>   - New parameter "relax_fan_constraint" to disable this behavior
>   - Drop parameter "ignore_fan_cap", superseded by the next one
>   - New parameter "expose_all_fans" to expose fans w/o such data
> - Assume auto mode on probe (ditto)
> - Reword documentation (ditto)
> - Do not register HWMON device if no fan can be exposed
> - fanX_target: Return -EBUSY instead of raw target value when fan stops
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  11 +
>  drivers/platform/x86/lenovo/Kconfig           |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 489 +++++++++++++++++-
>  3 files changed, 491 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 821282e07d93..bd1d733ff286 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -31,6 +31,8 @@ under the following path:
> =20
>    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>=
/
> =20
> +Additionally, this driver also exports attributes to HWMON.
> +
>  LENOVO_CAPABILITY_DATA_00
>  -------------------------
> =20
> @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
>  The LENOVO_CAPABILITY_DATA_00 interface provides various information tha=
t
>  does not rely on the gamezone thermal mode.
> =20
> +The following HWMON attributes are implemented:
> + - fanX_enable: enable/disable the fan (tunable)
> + - fanX_input: current RPM
> + - fanX_target: target RPM (tunable)
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
> =20
> @@ -70,6 +77,10 @@ WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
>  The LENOVO_FAN_TEST_DATA interface provides reference data for self-test=
 of
>  cooling fans.
> =20
> +The following HWMON attributes are implemented:
> + - fanX_max: maximum RPM
> + - fanX_min: minimum RPM
> +
>  WMI interface description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index fb96a0f908f0..be9af0451146 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
>  config LENOVO_WMI_TUNING
>  =09tristate "Lenovo Other Mode WMI Driver"
>  =09depends on ACPI_WMI
> +=09select HWMON
>  =09select FW_ATTR_CLASS
>  =09select LENOVO_WMI_DATA
>  =09select LENOVO_WMI_EVENTS
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c1cf2278369e..e54343b10f2e 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -14,7 +14,16 @@
>   * These attributes typically don't fit anywhere else in the sysfs and a=
re set
>   * in Windows using one of Lenovo's multiple user applications.
>   *
> + * Additionally, this driver also exports tunable fan speed RPM to HWMON=
=2E
> + * Min/max RPM are also provided for reference.
> + *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *   - fw_attributes
> + *   - binding to Capability Data 01
> + *
> + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> + *   - HWMON
> + *   - binding to Capability Data 00 and Fan
>   */
> =20
>  #include <linux/acpi.h>
> @@ -25,6 +34,7 @@
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
> +#include <linux/hwmon.h>
>  #include <linux/idr.h>
>  #include <linux/kdev_t.h>
>  #include <linux/kobject.h>
> @@ -49,12 +59,26 @@
>  #define LWMI_FEATURE_ID_CPU_SPL 0x02
>  #define LWMI_FEATURE_ID_CPU_FPPT 0x03
> =20
> +#define LWMI_FEATURE_ID_FAN_RPM 0x03
> +
>  #define LWMI_TYPE_ID_NONE 0x00
> =20
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> =20
> +#define LWMI_FAN_ID_BASE 1
> +#define LWMI_FAN_NR 4
> +#define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> +
> +#define LWMI_ATTR_ID_FAN_RPM(x)=09=09=09=09=09=09\
> +=09(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |=09\
> +=09 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |=09\
> +=09 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +
> +#define LWMI_FAN_STOP_RPM 1
> +
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> +#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> =20
>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>  static DEFINE_IDA(lwmi_om_ida);
> @@ -67,19 +91,447 @@ enum attribute_property {
>  =09SUPPORTED,
>  };
> =20
> +struct lwmi_fan_info {
> +=09u32 supported;
> +=09u32 last_target;
> +=09long min_rpm;
> +=09long max_rpm;
> +};
> +
>  struct lwmi_om_priv {
>  =09struct component_master_ops *ops;
> =20
>  =09/* only valid after capdata bind */
> +=09struct cd_list *cd00_list;
>  =09struct cd_list *cd01_list;
> =20
> +=09struct device *hwmon_dev;
>  =09struct device *fw_attr_dev;
>  =09struct kset *fw_attr_kset;
>  =09struct notifier_block nb;
>  =09struct wmi_device *wdev;
>  =09int ida_id;
> +
> +=09struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> +
> +=09struct {
> +=09=09bool capdata00_collected : 1;
> +=09=09bool capdata_fan_collected : 1;
> +=09} fan_flags;
>  };
> =20
> +/*
> + * Visibility of fan channels:
> + *
> + * +-------------------+---------+------------------+-------------------=
----+------------+
> + * |                   | default | +expose_all_fans | +relax_fan_constra=
int | +both      |
> + * +-------------------+---------+------------------+-------------------=
----+------------+
> + * | canonical         | RW      | RW               | RW+relaxed        =
    | RW+relaxed |
> + * +-------------------+---------+------------------+-------------------=
----+------------+
> + * | -capdata_fan[idx] | N       | RO               | N                 =
    | RW+relaxed |
> + * +-------------------+---------+------------------+-------------------=
----+------------+
> + *
> + * Note:
> + * 1. LWMI_ATTR_ID_FAN_RPM[idx].supported is always checked before expos=
ing a channel.
> + * 2. -capdata_fan implies -capdata_fan[idx].
> + */
> +static bool expose_all_fans;
> +module_param(expose_all_fans, bool, 0444);
> +MODULE_PARM_DESC(expose_all_fans,
> +=09"This option skips some capability checks and solely relies on per-ch=
annel ones "
> +=09"to expose fan attributes. Use with caution.");
> +
> +static bool relax_fan_constraint;
> +module_param(relax_fan_constraint, bool, 0444);
> +MODULE_PARM_DESC(relax_fan_constraint,
> +=09"Do not enforce fan RPM constraint (min/max RPM) "
> +=09"and enables fan tuning when such data is missing. "
> +=09"Enabling this may results in HWMON attributes being out-of-sync. Use=
 with caution.");
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & fa=
n) =3D=3D=3D=3D=3D=3D=3D=3D */
> +
> +/**
> + * lwmi_om_fan_get_set() - Get or set fan RPM value of specified fan
> + * @priv: Driver private data structure
> + * @channel: Fan channel index (0-based)
> + * @val: Pointer to value (input for set, output for get)
> + * @set: True to set value, false to get value
> + *
> + * Communicates with WMI interface to either retrieve current fan RPM
> + * or set target fan RPM.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u=
32 *val, bool set)
> +{
> +=09struct wmi_method_args_32 args;
> +=09u32 method_id, retval;
> +=09int err;
> +
> +=09method_id =3D set ? LWMI_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
> +=09args.arg0 =3D LWMI_ATTR_ID_FAN_RPM(channel);
> +=09args.arg1 =3D set ? *val : 0;
> +
> +=09err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, method_id,
> +=09=09=09=09    (unsigned char *)&args, sizeof(args), &retval);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (!set)
> +=09=09*val =3D retval;
> +=09else if (retval !=3D 1)
> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +
> +/**
> + * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
> + * @drvdata: Driver private data
> + * @type: Sensor type
> + * @attr: Attribute identifier
> + * @channel: Channel index
> + *
> + * Determines whether an HWMON attribute should be visible in sysfs
> + * based on hardware capabilities and current configuration.
> + *
> + * Return: permission mode, or 0 if invisible.
> + */
> +static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_=
sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09struct lwmi_om_priv *priv =3D (struct lwmi_om_priv *)drvdata;
> +=09bool visible =3D false;
> +
> +=09if (type =3D=3D hwmon_fan) {
> +=09=09if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
> +=09=09=09return 0;
> +
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_enable:
> +=09=09case hwmon_fan_target:
> +=09=09=09if (!(priv->fan_info[channel].supported & LWMI_SUPP_MAY_SET))
> +=09=09=09=09return 0;
> +
> +=09=09=09if (relax_fan_constraint ||
> +=09=09=09    (priv->fan_info[channel].min_rpm >=3D 0 &&
> +=09=09=09     priv->fan_info[channel].max_rpm >=3D 0))
> +=09=09=09=09return 0644;
> +
> +=09=09=09/*
> +=09=09=09 * Reaching here implies expose_all_fans is set.
> +=09=09=09 * See lwmi_om_hwmon_add().
> +=09=09=09 */
> +=09=09=09dev_warn_once(&priv->wdev->dev,
> +=09=09=09=09      "fan tuning disabled due to missing RPM constraint\n")=
;
> +=09=09=09return 0;
> +=09=09case hwmon_fan_input:
> +=09=09=09visible =3D priv->fan_info[channel].supported & LWMI_SUPP_MAY_G=
ET;
> +=09=09=09break;
> +=09=09case hwmon_fan_min:
> +=09=09=09visible =3D priv->fan_info[channel].min_rpm >=3D 0;
> +=09=09=09break;
> +=09=09case hwmon_fan_max:
> +=09=09=09visible =3D priv->fan_info[channel].max_rpm >=3D 0;
> +=09=09=09break;
> +=09=09}
> +=09}
> +
> +=09return visible ? 0444 : 0;
> +}
> +
> +/**
> + * lwmi_om_hwmon_read() - Read HWMON sensor data
> + * @dev: Device pointer
> + * @type: Sensor type
> + * @attr: Attribute identifier
> + * @channel: Channel index
> + * @val: Pointer to store value
> + *
> + * Reads current sensor values from hardware through WMI interface.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +=09=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +=09u32 retval =3D 0;
> +=09int err;
> +
> +=09if (type =3D=3D hwmon_fan) {
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_input:
> +=09=09=09err =3D lwmi_om_fan_get_set(priv, channel, &retval, false);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +
> +=09=09=09*val =3D retval;
> +=09=09=09return 0;
> +=09=09case hwmon_fan_enable:
> +=09=09=09*val =3D priv->fan_info[channel].last_target !=3D LWMI_FAN_STOP=
_RPM;
> +=09=09=09return 0;
> +=09=09case hwmon_fan_target:
> +=09=09=09if (priv->fan_info[channel].last_target =3D=3D LWMI_FAN_STOP_RP=
M)
> +=09=09=09=09return -EBUSY;
> +
> +=09=09=09*val =3D priv->fan_info[channel].last_target;
> +=09=09=09return 0;
> +=09=09case hwmon_fan_min:
> +=09=09=09*val =3D priv->fan_info[channel].min_rpm;
> +=09=09=09return 0;
> +=09=09case hwmon_fan_max:
> +=09=09=09*val =3D priv->fan_info[channel].max_rpm;
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return -EOPNOTSUPP;
> +}
> +
> +/**
> + * lwmi_om_hwmon_write() - Write HWMON sensor data
> + * @dev: Device pointer
> + * @type: Sensor type
> + * @attr: Attribute identifier
> + * @channel: Channel index
> + * @val: Value to write
> + *
> + * Writes configuration values to hardware through WMI interface.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_typ=
es type,
> +=09=09=09       u32 attr, int channel, long val)
> +{
> +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +=09u32 raw, min_rpm, max_rpm;
> +=09int err;
> +
> +=09if (type =3D=3D hwmon_fan) {
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_enable:
> +=09=09=09if (val =3D=3D 0)
> +=09=09=09=09raw =3D LWMI_FAN_STOP_RPM;
> +=09=09=09else if (val =3D=3D 1)
> +=09=09=09=09raw =3D 0; /* auto */
> +=09=09=09else
> +=09=09=09=09return -EINVAL;
> +
> +=09=09=09goto fan_set;
> +=09=09case hwmon_fan_target:
> +=09=09=09if (val =3D=3D 0) {
> +=09=09=09=09raw =3D 0;
> +=09=09=09=09goto fan_set;
> +=09=09=09}
> +
> +=09=09=09min_rpm =3D relax_fan_constraint
> +=09=09=09=09=09? LWMI_FAN_STOP_RPM + 1
> +=09=09=09=09=09: priv->fan_info[channel].min_rpm;
> +=09=09=09max_rpm =3D relax_fan_constraint
> +=09=09=09=09=09? U16_MAX
> +=09=09=09=09=09: priv->fan_info[channel].max_rpm;

Put ? to the preceeding line, and : likewise

> +
> +=09=09=09if (val < min_rpm || val > max_rpm)
> +=09=09=09=09return -EDOM;

I suppose normally -EINVAL would be used (EDOM is used whopping zero=20
times under pdx86 dir).

> +
> +=09=09=09raw =3D val;
> +fan_set:
> +=09=09=09err =3D lwmi_om_fan_get_set(priv, channel, &raw, true);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +
> +=09=09=09priv->fan_info[channel].last_target =3D raw;
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] =3D =
{
> +=09/* Must match LWMI_FAN_NR. */
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09=09   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> +=09=09=09   HWMON_F_MIN | HWMON_F_MAX,
> +=09=09=09   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> +=09=09=09   HWMON_F_MIN | HWMON_F_MAX,
> +=09=09=09   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> +=09=09=09   HWMON_F_MIN | HWMON_F_MAX,
> +=09=09=09   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> +=09=09=09   HWMON_F_MIN | HWMON_F_MAX),
> +=09NULL
> +};
> +
> +static const struct hwmon_ops lwmi_om_hwmon_ops =3D {
> +=09.is_visible =3D lwmi_om_hwmon_is_visible,
> +=09.read =3D lwmi_om_hwmon_read,
> +=09.write =3D lwmi_om_hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info lwmi_om_hwmon_chip_info =3D {
> +=09.ops =3D &lwmi_om_hwmon_ops,
> +=09.info =3D lwmi_om_hwmon_info,
> +};
> +
> +/**
> + * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
> + * @priv: Driver private data
> + */
> +static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
> +{
> +=09int i, valid;
> +
> +=09if (WARN_ON(priv->hwmon_dev))
> +=09=09return;
> +
> +=09if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_=
fan_collected) {
> +=09=09dev_dbg(&priv->wdev->dev, "HWMON registration pending (00: %d, fan=
: %d)\n",
> +=09=09=09priv->fan_flags.capdata00_collected,
> +=09=09=09priv->fan_flags.capdata_fan_collected);
> +=09=09return;
> +=09}
> +
> +=09if (expose_all_fans)
> +=09=09dev_warn(&priv->wdev->dev, "all fans exposed. Use with caution\n")=
;
> +
> +=09if (relax_fan_constraint)
> +=09=09dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with c=
aution\n");
> +
> +=09valid =3D 0;
> +=09for (i =3D 0; i < LWMI_FAN_NR; i++) {
> +=09=09if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> +=09=09=09continue;
> +
> +=09=09valid++;
> +
> +=09=09if (!expose_all_fans &&
> +=09=09    (priv->fan_info[i].min_rpm < 0 || priv->fan_info[i].max_rpm < =
0)) {
> +=09=09=09dev_dbg(&priv->wdev->dev, "missing RPM constraint for fan%d, hi=
ding\n",
> +=09=09=09=09LWMI_FAN_ID(i));
> +=09=09=09priv->fan_info[i].supported =3D 0;
> +=09=09=09valid--;
> +=09=09}
> +=09}
> +
> +=09if (valid =3D=3D 0) {
> +=09=09dev_warn(&priv->wdev->dev,
> +=09=09=09 "fan reporting/tuning is unsupported on this device\n");
> +=09=09return;
> +=09}
> +
> +=09priv->hwmon_dev =3D hwmon_device_register_with_info(&priv->wdev->dev,
> +=09=09=09=09=09=09=09  LWMI_OM_HWMON_NAME, priv,
> +=09=09=09=09=09=09=09  &lwmi_om_hwmon_chip_info,
> +=09=09=09=09=09=09=09  NULL);
> +=09if (IS_ERR(priv->hwmon_dev)) {
> +=09=09dev_warn(&priv->wdev->dev, "failed to register HWMON device: %ld\n=
",
> +=09=09=09 PTR_ERR(priv->hwmon_dev));
> +=09=09priv->hwmon_dev =3D NULL;
> +=09=09return;
> +=09}
> +
> +=09dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
> +}
> +
> +/**
> + * lwmi_om_hwmon_remove() - Unregister HWMON device
> + * @priv: Driver private data
> + *
> + * Unregisters the HWMON device if applicable.
> + */
> +static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
> +{
> +=09if (!priv->hwmon_dev)
> +=09=09return;
> +
> +=09hwmon_device_unregister(priv->hwmon_dev);
> +=09priv->hwmon_dev =3D NULL;
> +}
> +
> +/**
> + * lwmi_om_fan_info_init() - Initialzie fan info
> + * @priv: Driver private data
> + *
> + * lwmi_om_fan_info_collect_cd00() and lwmi_om_fan_info_collect_cd_fan()=
 may be
> + * called in an arbitrary order. Hence, initializion must be done before=
=2E
> + */
> +static void lwmi_om_fan_info_init(struct lwmi_om_priv *priv)
> +{
> +=09int i;
> +
> +=09for (i =3D 0; i < LWMI_FAN_NR; i++) {
> +=09=09priv->fan_info[i] =3D (struct lwmi_fan_info) {
> +=09=09=09.supported =3D 0,
> +=09=09=09/*
> +=09=09=09 * Assume 0 on probe as the EC resets all fans to auto mode on =
(re)boot.
> +=09=09=09 *
> +=09=09=09 * Note that S0ix (s2idle) preserves the RPM target, so we don'=
t need
> +=09=09=09 * suspend/resume callbacks. This behavior has not been tested =
on S3-
> +=09=09=09 * capable devices, but I doubt if such devices even have this =
interface.
> +=09=09=09 */
> +=09=09=09.last_target =3D 0,
> +=09=09=09.min_rpm =3D -ENODATA,
> +=09=09=09.max_rpm =3D -ENODATA,
> +=09=09};
> +=09}
> +
> +=09priv->fan_flags.capdata00_collected =3D false;
> +=09priv->fan_flags.capdata_fan_collected =3D false;
> +}
> +
> +/**
> + * lwmi_om_fan_info_collect_cd00() - Collect fan info from capdata 00
> + * @priv: Driver private data
> + */
> +static void lwmi_om_fan_info_collect_cd00(struct lwmi_om_priv *priv)
> +{
> +=09struct capdata00 capdata00;
> +=09int i, err;
> +
> +=09dev_dbg(&priv->wdev->dev, "Collecting fan info from capdata00\n");
> +
> +=09for (i =3D 0; i < LWMI_FAN_NR; i++) {
> +=09=09err =3D lwmi_cd00_get_data(priv->cd00_list, LWMI_ATTR_ID_FAN_RPM(i=
), &capdata00);
> +=09=09priv->fan_info[i].supported =3D err ? 0 : capdata00.supported;
> +=09}
> +
> +=09priv->fan_flags.capdata00_collected =3D true;
> +=09lwmi_om_hwmon_add(priv);
> +}
> +
> +/**
> + * lwmi_om_fan_info_collect_cd_fan() - Collect fan info from capdata fan
> + * @dev: Pointer to the lenovo-wmi-other device
> + * @cd_fan_list: Pointer to the capdata fan list
> + */
> +static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct c=
d_list *cd_fan_list)
> +{
> +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +=09struct capdata_fan capdata_fan;
> +=09int i, err;
> +
> +=09dev_dbg(dev, "Collecting fan info from capdata_fan\n");
> +
> +=09if (!cd_fan_list)
> +=09=09goto out;
> +
> +=09for (i =3D 0; i < LWMI_FAN_NR; i++) {
> +=09=09err =3D lwmi_cd_fan_get_data(cd_fan_list, LWMI_FAN_ID(i), &capdata=
_fan);
> +=09=09if (err)
> +=09=09=09continue;
> +
> +=09=09priv->fan_info[i].min_rpm =3D capdata_fan.min_rpm;
> +=09=09priv->fan_info[i].max_rpm =3D capdata_fan.max_rpm;
> +=09}
> +
> +out:
> +=09priv->fan_flags.capdata_fan_collected =3D true;
> +=09lwmi_om_hwmon_add(priv);
> +}
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capdata=
 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> +
>  struct tunable_attr_01 {
>  =09struct capdata01 *capdata;
>  =09struct device *dev;
> @@ -559,32 +1011,45 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_=
priv *priv)
>  =09device_unregister(priv->fw_attr_dev);
>  }
> =20
> +/* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=3D=3D=3D=
=3D=3D=3D=3D */
> +
>  /**
>   * lwmi_om_master_bind() - Bind all components of the other mode driver
>   * @dev: The lenovo-wmi-other driver basic device.
>   *
> - * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to th=
e
> - * lenovo-wmi-other master driver. On success, assign the capability dat=
a 01
> - * list pointer to the driver data struct for later access. This pointer
> - * is only valid while the capdata01 interface exists. Finally, register=
 all
> - * firmware attribute groups.
> + * Call component_bind_all to bind the lenovo-wmi-capdata devices to the
> + * lenovo-wmi-other master driver, with a callback to collect fan info f=
rom
> + * capdata_fan. On success, assign the capability data list pointers to =
the
> + * driver data struct for later access. These pointers are only valid wh=
ile the
> + * capdata interfaces exist. Finally, collect fan info from capdata00 an=
d
> + * register all firmware attribute groups. Note that the HWMON device is
> + * registered only if all fan info is collected. Hence, it is not regist=
ered
> + * here. See lwmi_om_fan_info_collect_cd00() and
> + * lwmi_om_fan_info_collect_cd_fan().
>   *
>   * Return: 0 on success, or an error code.
>   */
>  static int lwmi_om_master_bind(struct device *dev)
>  {
>  =09struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> -=09struct lwmi_cd_binder binder =3D {};
> +=09struct lwmi_cd_binder binder =3D {
> +=09=09.cd_fan_list_cb =3D lwmi_om_fan_info_collect_cd_fan,
> +=09};
>  =09int ret;
> =20
> +=09lwmi_om_fan_info_init(priv);
> +
>  =09ret =3D component_bind_all(dev, &binder);
>  =09if (ret)
>  =09=09return ret;
> =20
> +=09priv->cd00_list =3D binder.cd00_list;
>  =09priv->cd01_list =3D binder.cd01_list;
> -=09if (!priv->cd01_list)
> +=09if (!priv->cd00_list || !priv->cd01_list)
>  =09=09return -ENODEV;
> =20
> +=09lwmi_om_fan_info_collect_cd00(priv);
> +
>  =09return lwmi_om_fw_attr_add(priv);
>  }
> =20
> @@ -592,15 +1057,18 @@ static int lwmi_om_master_bind(struct device *dev)
>   * lwmi_om_master_unbind() - Unbind all components of the other mode dri=
ver
>   * @dev: The lenovo-wmi-other driver basic device
>   *
> - * Unregister all capability data attribute groups. Then call
> - * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from t=
he
> - * lenovo-wmi-other master driver. Finally, free the IDA for this device=
=2E
> + * Unregister all firmware attribute groups and the HWMON device. Then c=
all
> + * component_unbind_all to unbind lenovo-wmi-capdata devices from the
> + * lenovo-wmi-other master driver.
>   */
>  static void lwmi_om_master_unbind(struct device *dev)
>  {
>  =09struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> =20
>  =09lwmi_om_fw_attr_remove(priv);
> +
> +=09lwmi_om_hwmon_remove(priv);
> +
>  =09component_unbind_all(dev, NULL);
>  }
> =20
> @@ -665,5 +1133,6 @@ MODULE_IMPORT_NS("LENOVO_WMI_CD");
>  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>  MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
>  MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
>  MODULE_LICENSE("GPL");
>=20

This series seems generally fine, thanks for the work. I noticed a few=20
nits while passing once again through this so please address them still.

--=20
 i.

--8323328-1959647935-1768239590=:1026--
