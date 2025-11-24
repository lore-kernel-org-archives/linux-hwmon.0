Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04BE571;
	Mon, 24 Nov 2025 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015519; cv=pass; b=Rpigv52zHRJLFzSKD+yA26L/wyGSPO7epf34m8sScr/xlSnkrf+WCVc3mHWbrZbd5PGtjYy6QPPBTpP7egpBw19ODmDt2yxcsCJtn90FijVnPOkBFOBvd//sFNSfJjL+Q7tUib4Rxblii9NQfDWiMCTPjGjHYMEYXARsD5FOn20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015519; c=relaxed/simple;
	bh=OVbUzhbVHgVgsoerDRlXZNbFCiF6cGTrTZ7gIi3CTJc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=si1bh97Agu7UG5HfoUOY40kNBDFWVGP/EJoZizGR6Bn/xJAw0o7LXp+3obBuzEA+RQL7jUOT5YQCWsIp1DDL1wInmR2A0etYG/bQ4HQ3R1EdDYZePRRevERrBW1ZPikgDJPTjuLs4eQtJ2H99k9sjn3jEamZTFgutOeh34FqOQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pqXjyL2n; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pqXjyL2n"
ARC-Seal: i=1; a=rsa-sha256; t=1764015493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NLg5/I+b551T1A68PXBYnKPjJMBVCuLRmqVbPF8er+T96Cq+GZtkn0TiPTgl77udBagrjc9GNlnF7M6sbOP5gj8zqo7NyKFfJHKoVHZYIUPYciSe9FEV/cG897uPeIdU+0vXQDTXqbb8ich1if/rG/7VKcnBAbMrjDz4Nnzc0R4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764015493; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uDr5LshIZTraTwDovylsFAbSUgsqm83nrd7Y4y1kgKY=; 
	b=VnvwimYz4T+tjxd28AFdTuznhT5IL/M4IgzekbUb0dzem9Beadt5onLgvq25iM48QpYXK2RSBGHRb3a6K+9G2bvz8qPuPaXI+jQroPSYL7rkRqB0npT/CvwUszZNUmw+YX1LVVW8dKg2UtRRBjAwELJehBpcykaK/lemugISBAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764015493;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=uDr5LshIZTraTwDovylsFAbSUgsqm83nrd7Y4y1kgKY=;
	b=pqXjyL2nngj+drV54NpeU5YK50Vl24q+TMQviPRTpWLRGnzfTeQPE4+1kdlTNT5m
	hrJNd0Lp8KA/8RfJ+thZVtP3AydHXv8d4ARJdz/8s2D9MG+CUJv8TwmE3HMOu/5dba/
	5zeqJ35M7raKgRm9/YN0MSC9wq/W5b+dw1LpzqJ8=
Received: by mx.zohomail.com with SMTPS id 1764015490680960.0425815388929;
	Mon, 24 Nov 2025 12:18:10 -0800 (PST)
Message-ID: <121879331cae44a998ee1b18d661e3d65092e259.camel@rong.moe>
Subject: Re: [PATCH v6 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <2f77c928-b16e-1666-5e65-8f62a84c93fc@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>
	 <20251122184522.18677-8-i@rong.moe>
	 <2f77c928-b16e-1666-5e65-8f62a84c93fc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Nov 2025 04:12:13 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Ilpo,

Thanks for your review.

On Mon, 2025-11-24 at 18:58 +0200, Ilpo J=C3=A4rvinen wrote:
> On Sun, 23 Nov 2025, Rong Zhang wrote:
>=20
> > Register an HWMON device for fan reporting/tuning according to
> > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
> >=20
> >  - fanX_enable: enable/disable the fan (tunable)
> >  - fanX_input: current RPM
> >  - fanX_max: maximum RPM
> >  - fanX_min: minimum RPM
> >  - fanX_target: target RPM (tunable)
> >=20
> > Information from capdata00 and capdata_fan are used to control the
> > visibility and constraints of HWMON attributes. Fan info from capdata00
> > is collected on bind, while fan info from capdata_fan is collected in a
> > callback. Once all fan info is collected, register the HWMON device.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v4:
> > - Rework HWMON registration due to the introduction of [PATCH v4 6/7]
> >   - Collect fan info from capdata00 and capdata_fan separately
> >   - Use a callback to collect fan info from capdata_fan
> >   - Trigger HWMON registration only if all fan info is collected
> >   - Do not check 0x04050000.supported, implied by the presense of
> >     capdata_fan
> > - Drop Reviewed-by & Tested-by due to the changes, please review & test
> >=20
> > Changes in v3:
> > - Reword documentation (thanks Derek J. Clark)
> >=20
> > Changes in v2:
> > - Define 4 fan channels instead of 2 (thanks Derek J. Clark)
> > - Squash min/max reporting patch into this one (ditto)
> > - Query 0x04050000 for interface availability (ditto)
> >   - New parameter "expose_all_fans" to skip this check
> > - Enforce min/max RPM constraint on set (ditto)
> >   - New parameter "relax_fan_constraint" to disable this behavior
> >   - Drop parameter "ignore_fan_cap", superseded by the next one
> >   - New parameter "expose_all_fans" to expose fans w/o such data
> > - Assume auto mode on probe (ditto)
> > - Reword documentation (ditto)
> > - Do not register HWMON device if no fan can be exposed
> > - fanX_target: Return -EBUSY instead of raw target value when fan stops
> > ---
> >  .../wmi/devices/lenovo-wmi-other.rst          |  11 +
> >  drivers/platform/x86/lenovo/Kconfig           |   1 +
> >  drivers/platform/x86/lenovo/wmi-other.c       | 485 +++++++++++++++++-
> >  3 files changed, 487 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documenta=
tion/wmi/devices/lenovo-wmi-other.rst
> > index 821282e07d93..bd1d733ff286 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -31,6 +31,8 @@ under the following path:
> > =20
> >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribut=
e>/
> > =20
> > +Additionally, this driver also exports attributes to HWMON.
> > +
> >  LENOVO_CAPABILITY_DATA_00
> >  -------------------------
> > =20
> > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
> >  The LENOVO_CAPABILITY_DATA_00 interface provides various information t=
hat
> >  does not rely on the gamezone thermal mode.
> > =20
> > +The following HWMON attributes are implemented:
> > + - fanX_enable: enable/disable the fan (tunable)
> > + - fanX_input: current RPM
> > + - fanX_target: target RPM (tunable)
> > +
> >  LENOVO_CAPABILITY_DATA_01
> >  -------------------------
> > =20
> > @@ -70,6 +77,10 @@ WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> >  The LENOVO_FAN_TEST_DATA interface provides reference data for self-te=
st of
> >  cooling fans.
> > =20
> > +The following HWMON attributes are implemented:
> > + - fanX_max: maximum RPM
> > + - fanX_min: minimum RPM
> > +
> >  WMI interface description
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > =20
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index fb96a0f908f0..be9af0451146 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
> >  config LENOVO_WMI_TUNING
> >  	tristate "Lenovo Other Mode WMI Driver"
> >  	depends on ACPI_WMI
> > +	select HWMON
> >  	select FW_ATTR_CLASS
> >  	select LENOVO_WMI_DATA
> >  	select LENOVO_WMI_EVENTS
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index b3adcc2804fa..ce1ca13db4b5 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -14,7 +14,16 @@
> >   * These attributes typically don't fit anywhere else in the sysfs and=
 are set
> >   * in Windows using one of Lenovo's multiple user applications.
> >   *
> > + * Additionally, this driver also exports tunable fan speed RPM to HWM=
ON.
> > + * Min/max RPM are also provided for reference.
> > + *
> >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *   - fw_attributes
> > + *   - binding to Capability Data 01
> > + *
> > + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> > + *   - HWMON
> > + *   - binding to Capability Data 00 and Fan
> >   */
> > =20
> >  #include <linux/acpi.h>
> > @@ -25,6 +34,7 @@
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> >  #include <linux/gfp_types.h>
> > +#include <linux/hwmon.h>
> >  #include <linux/idr.h>
> >  #include <linux/kdev_t.h>
> >  #include <linux/kobject.h>
> > @@ -49,12 +59,26 @@
> >  #define LWMI_FEATURE_ID_CPU_SPL 0x02
> >  #define LWMI_FEATURE_ID_CPU_FPPT 0x03
> > =20
> > +#define LWMI_FEATURE_ID_FAN_RPM 0x03
> > +
> >  #define LWMI_TYPE_ID_NONE 0x00
> > =20
> >  #define LWMI_FEATURE_VALUE_GET 17
> >  #define LWMI_FEATURE_VALUE_SET 18
> > =20
> > +#define LWMI_FAN_ID_BASE 1
> > +#define LWMI_FAN_NR 4
> > +#define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> > +
> > +#define LWMI_ATTR_ID_FAN_RPM(x)						\
> > +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> > +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> > +	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> > +
> > +#define LWMI_FAN_STOP_RPM 1
> > +
> >  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> > +#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> > =20
> >  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> >  static DEFINE_IDA(lwmi_om_ida);
> > @@ -71,15 +95,439 @@ struct lwmi_om_priv {
> >  	struct component_master_ops *ops;
> > =20
> >  	/* only valid after capdata bind */
> > +	struct cd_list *cd00_list;
> >  	struct cd_list *cd01_list;
> > =20
> > +	struct device *hwmon_dev;
> >  	struct device *fw_attr_dev;
> >  	struct kset *fw_attr_kset;
> >  	struct notifier_block nb;
> >  	struct wmi_device *wdev;
> >  	int ida_id;
> > +
> > +	struct fan_info {
> > +		u32 supported;
> > +		u32 last_target;
> > +		long min_rpm;
> > +		long max_rpm;
> > +	} fan_info[LWMI_FAN_NR];
>=20
> I personally don't like this style at all because it makes finding the=
=20
> type of the variable harder with grep.

Make sense. Will add a `lwmi_' prefix to the struct name. Thanks.

> Add an empty line.

Will fix this and the following ones. Thanks.

Thanks,
Rong

> > +	struct {
> > +		bool capdata00_collected : 1;
> > +		bool capdata_fan_collected : 1;
> > +	} fan_flags;
> > +};
> > +
> > +/*
> > + * Visibility of fan channels:
> > + *
> > + * +-------------------+---------+------------------+-----------------=
------+------------+
> > + * |                   | default | +expose_all_fans | +relax_fan_const=
raint | +both      |
> > + * +-------------------+---------+------------------+-----------------=
------+------------+
> > + * | canonical         | RW      | RW               | RW+relaxed      =
      | RW+relaxed |
> > + * +-------------------+---------+------------------+-----------------=
------+------------+
> > + * | -capdata_fan[idx] | N       | RO               | N               =
      | RW+relaxed |
> > + * +-------------------+---------+------------------+-----------------=
------+------------+
> > + *
> > + * Note:
> > + * 1. LWMI_ATTR_ID_FAN_RPM[idx].supported is always checked before exp=
osing a channel.
> > + * 2. -capdata_fan implies -capdata_fan[idx].
> > + */
> > +static bool expose_all_fans;
> > +module_param(expose_all_fans, bool, 0444);
> > +MODULE_PARM_DESC(expose_all_fans,
> > +	"This option skips some capability checks and solely relies on per-ch=
annel ones "
> > +	"to expose fan attributes. Use with caution.");
> > +
> > +static bool relax_fan_constraint;
> > +module_param(relax_fan_constraint, bool, 0444);
> > +MODULE_PARM_DESC(relax_fan_constraint,
> > +	"Do not enforce fan RPM constraint (min/max RPM) "
> > +	"and enables fan tuning when such data is missing. "
> > +	"Enabling this may results in HWMON attributes being out-of-sync. Use=
 with caution.");
> > +
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & =
fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> > +/**
> > + * lwmi_om_fan_get_set() - Get or set fan RPM value of specified fan
> > + * @priv: Driver private data structure
> > + * @channel: Fan channel index (0-based)
> > + * @val: Pointer to value (input for set, output for get)
> > + * @set: True to set value, false to get value
> > + *
> > + * Communicates with WMI interface to either retrieve current fan RPM
> > + * or set target fan RPM.
> > + *
> > + * Return: 0 on success, or an error code.
> > + */
> > +static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel,=
 u32 *val, bool set)
> > +{
> > +	struct wmi_method_args_32 args;
> > +	u32 method_id, retval;
> > +	int err;
> > +
> > +	method_id =3D set ? LWMI_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
> > +	args.arg0 =3D LWMI_ATTR_ID_FAN_RPM(channel);
> > +	args.arg1 =3D set ? *val : 0;
> > +
> > +	err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, method_id,
> > +				    (unsigned char *)&args, sizeof(args), &retval);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!set)
> > +		*val =3D retval;
> > +	else if (retval !=3D 1)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attribut=
es
> > + * @drvdata: Driver private data
> > + * @type: Sensor type
> > + * @attr: Attribute identifier
> > + * @channel: Channel index
> > + *
> > + * Determines whether an HWMON attribute should be visible in sysfs
> > + * based on hardware capabilities and current configuration.
> > + *
> > + * Return: permission mode, or 0 if invisible.
> > + */
> > +static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmo=
n_sensor_types type,
> > +					u32 attr, int channel)
> > +{
> > +	struct lwmi_om_priv *priv =3D (struct lwmi_om_priv *)drvdata;
> > +	bool visible =3D false;
> > +
> > +	if (type =3D=3D hwmon_fan) {
> > +		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
> > +			return 0;
> > +
> > +		switch (attr) {
> > +		case hwmon_fan_enable:
> > +		case hwmon_fan_target:
> > +			if (!(priv->fan_info[channel].supported & LWMI_SUPP_MAY_SET))
> > +				return 0;
> > +
> > +			if (relax_fan_constraint ||
> > +			    (priv->fan_info[channel].min_rpm >=3D 0 &&
> > +			     priv->fan_info[channel].max_rpm >=3D 0))
> > +				return 0644;
> > +
> > +			/*
> > +			 * Reaching here implies expose_all_fans is set.
> > +			 * See lwmi_om_hwmon_add().
> > +			 */
> > +			dev_warn_once(&priv->wdev->dev,
> > +				      "fan tuning disabled due to missing RPM constraint\n");
> > +			return 0;
> > +		case hwmon_fan_input:
> > +			visible =3D priv->fan_info[channel].supported & LWMI_SUPP_MAY_GET;
> > +			break;
> > +		case hwmon_fan_min:
> > +			visible =3D priv->fan_info[channel].min_rpm >=3D 0;
> > +			break;
> > +		case hwmon_fan_max:
> > +			visible =3D priv->fan_info[channel].max_rpm >=3D 0;
> > +			break;
> > +		}
> > +	}
> > +
> > +	return visible ? 0444 : 0;
> > +}
> > +
> > +/**
> > + * lwmi_om_hwmon_read() - Read HWMON sensor data
> > + * @dev: Device pointer
> > + * @type: Sensor type
> > + * @attr: Attribute identifier
> > + * @channel: Channel index
> > + * @val: Pointer to store value
> > + *
> > + * Reads current sensor values from hardware through WMI interface.
> > + *
> > + * Return: 0 on success, or an error code.
> > + */
> > +static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +			      u32 attr, int channel, long *val)
> > +{
> > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +	u32 retval =3D 0;
> > +	int err;
> > +
> > +	if (type =3D=3D hwmon_fan) {
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			err =3D lwmi_om_fan_get_set(priv, channel, &retval, false);
> > +			if (err)
> > +				return err;
> > +
> > +			*val =3D retval;
> > +			return 0;
> > +		case hwmon_fan_enable:
> > +			*val =3D priv->fan_info[channel].last_target !=3D LWMI_FAN_STOP_RPM=
;
> > +			return 0;
> > +		case hwmon_fan_target:
> > +			if (priv->fan_info[channel].last_target =3D=3D LWMI_FAN_STOP_RPM)
> > +				return -EBUSY;
> > +
> > +			*val =3D priv->fan_info[channel].last_target;
> > +			return 0;
> > +		case hwmon_fan_min:
> > +			*val =3D priv->fan_info[channel].min_rpm;
> > +			return 0;
> > +		case hwmon_fan_max:
> > +			*val =3D priv->fan_info[channel].max_rpm;
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +/**
> > + * lwmi_om_hwmon_write() - Write HWMON sensor data
> > + * @dev: Device pointer
> > + * @type: Sensor type
> > + * @attr: Attribute identifier
> > + * @channel: Channel index
> > + * @val: Value to write
> > + *
> > + * Writes configuration values to hardware through WMI interface.
> > + *
> > + * Return: 0 on success, or an error code.
> > + */
> > +static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_t=
ypes type,
> > +			       u32 attr, int channel, long val)
> > +{
> > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +	u32 raw, min_rpm, max_rpm;
> > +	int err;
> > +
> > +	if (type =3D=3D hwmon_fan) {
> > +		switch (attr) {
> > +		case hwmon_fan_enable:
> > +			if (val =3D=3D 0)
> > +				raw =3D LWMI_FAN_STOP_RPM;
> > +			else if (val =3D=3D 1)
> > +				raw =3D 0; /* auto */
> > +			else
> > +				return -EINVAL;
> > +
> > +			goto fan_set;
> > +		case hwmon_fan_target:
> > +			if (val =3D=3D 0) {
> > +				raw =3D 0;
> > +				goto fan_set;
> > +			}
> > +
> > +			min_rpm =3D relax_fan_constraint
> > +					? LWMI_FAN_STOP_RPM + 1
> > +					: priv->fan_info[channel].min_rpm;
> > +			max_rpm =3D relax_fan_constraint
> > +					? U16_MAX
> > +					: priv->fan_info[channel].max_rpm;
> > +
> > +			if (val < min_rpm || val > max_rpm)
> > +				return -EDOM;
> > +
> > +			raw =3D val;
> > +fan_set:
> > +			err =3D lwmi_om_fan_get_set(priv, channel, &raw, true);
> > +			if (err)
> > +				return err;
> > +
> > +			priv->fan_info[channel].last_target =3D raw;
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] =
=3D {
> > +	/* Must match LWMI_FAN_NR. */
> > +	HWMON_CHANNEL_INFO(fan,
> > +			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> > +			   HWMON_F_MIN | HWMON_F_MAX,
> > +			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> > +			   HWMON_F_MIN | HWMON_F_MAX,
> > +			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> > +			   HWMON_F_MIN | HWMON_F_MAX,
> > +			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET |
> > +			   HWMON_F_MIN | HWMON_F_MAX),
> > +	NULL
> >  };
> > =20
> > +static const struct hwmon_ops lwmi_om_hwmon_ops =3D {
> > +	.is_visible =3D lwmi_om_hwmon_is_visible,
> > +	.read =3D lwmi_om_hwmon_read,
> > +	.write =3D lwmi_om_hwmon_write,
> > +};
> > +
> > +static const struct hwmon_chip_info lwmi_om_hwmon_chip_info =3D {
> > +	.ops =3D &lwmi_om_hwmon_ops,
> > +	.info =3D lwmi_om_hwmon_info,
> > +};
> > +
> > +/**
> > + * lwmi_om_hwmon_add() - Register HWMON device if all info is collecte=
d
> > + * @priv: Driver private data
> > + */
> > +static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
> > +{
> > +	int i, valid;
> > +
> > +	if (WARN_ON(priv->hwmon_dev))
> > +		return;
> > +
> > +	if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_=
fan_collected) {
> > +		dev_dbg(&priv->wdev->dev, "HWMON registration pending (00: %d, fan: =
%d)\n",
> > +			priv->fan_flags.capdata00_collected,
> > +			priv->fan_flags.capdata_fan_collected);
> > +		return;
> > +	}
> > +
> > +	if (expose_all_fans)
> > +		dev_warn(&priv->wdev->dev, "all fans exposed. Use with caution\n");
> > +
> > +	if (relax_fan_constraint)
> > +		dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with cau=
tion\n");
> > +
> > +	valid =3D 0;
> > +	for (i =3D 0; i < LWMI_FAN_NR; i++) {
> > +		if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> > +			continue;
> > +
> > +		valid++;
> > +
> > +		if (!expose_all_fans &&
> > +		    (priv->fan_info[i].min_rpm < 0 || priv->fan_info[i].max_rpm < 0)=
) {
> > +			dev_dbg(&priv->wdev->dev, "missing RPM constraint for fan%d, hiding=
\n",
> > +				LWMI_FAN_ID(i));
> > +			priv->fan_info[i].supported =3D 0;
> > +			valid--;
> > +		}
> > +	}
> > +
> > +	if (valid =3D=3D 0) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "fan reporting/tuning is unsupported on this device\n");
> > +		return;
> > +	}
> > +
> > +	priv->hwmon_dev =3D hwmon_device_register_with_info(&priv->wdev->dev,
> > +							  LWMI_OM_HWMON_NAME, priv,
> > +							  &lwmi_om_hwmon_chip_info,
> > +							  NULL);
> > +	if (IS_ERR(priv->hwmon_dev)) {
> > +		dev_warn(&priv->wdev->dev, "failed to register HWMON device: %ld\n",
> > +			 PTR_ERR(priv->hwmon_dev));
> > +		priv->hwmon_dev =3D NULL;
> > +		return;
> > +	}
> > +
> > +	dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
> > +}
> > +
> > +/**
> > + * lwmi_om_hwmon_remove() - Unregister HWMON device
> > + * @priv: Driver private data
> > + *
> > + * Unregisters the HWMON device if applicable.
> > + */
> > +static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
> > +{
> > +	if (!priv->hwmon_dev)
> > +		return;
> > +
> > +	hwmon_device_unregister(priv->hwmon_dev);
> > +	priv->hwmon_dev =3D NULL;
> > +}
> > +
> > +/**
> > + * lwmi_om_fan_info_init() - Initialzie fan info
> > + * @priv: Driver private data
> > + *
> > + * lwmi_om_fan_info_collect_cd00() and lwmi_om_fan_info_collect_cd_fan=
() may be
> > + * called in an arbitrary order. Hence, initializion must be done befo=
re.
> > + */
> > +static void lwmi_om_fan_info_init(struct lwmi_om_priv *priv)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < LWMI_FAN_NR; i++) {
> > +		priv->fan_info[i] =3D (struct fan_info) {
> > +			.supported =3D 0,
> > +			/*
> > +			 * Assume 0 on probe as the EC resets all fans to auto mode on (re)=
boot.
> > +			 *
> > +			 * Note that S0ix (s2idle) preserves the RPM target, so we don't ne=
ed
> > +			 * suspend/resume callbacks. This behavior has not been tested on S=
3-
> > +			 * capable devices, but I doubt if such devices even have this inte=
rface.
> > +			 */
> > +			.last_target =3D 0,
> > +			.min_rpm =3D -ENODATA,
> > +			.max_rpm =3D -ENODATA,
> > +		};
> > +	}
> > +
> > +	priv->fan_flags.capdata00_collected =3D false;
> > +	priv->fan_flags.capdata_fan_collected =3D false;
> > +}
> > +
> > +/**
> > + * lwmi_om_fan_info_collect_cd00() - Collect fan info from capdata 00
> > + * @priv: Driver private data
> > + */
> > +static void lwmi_om_fan_info_collect_cd00(struct lwmi_om_priv *priv)
> > +{
> > +	struct capdata00 capdata00;
> > +	int i, err;
> > +
> > +	dev_dbg(&priv->wdev->dev, "Collecting fan info from capdata00\n");
> > +
> > +	for (i =3D 0; i < LWMI_FAN_NR; i++) {
> > +		err =3D lwmi_cd00_get_data(priv->cd00_list, LWMI_ATTR_ID_FAN_RPM(i),=
 &capdata00);
> > +		priv->fan_info[i].supported =3D err ? 0 : capdata00.supported;
> > +	}
> > +
> > +	priv->fan_flags.capdata00_collected =3D true;
> > +	lwmi_om_hwmon_add(priv);
> > +}
> > +
> > +/**
> > + * lwmi_om_fan_info_collect_cd_fan() - Collect fan info from capdata f=
an
> > + * @dev: Pointer to the lenovo-wmi-other device
> > + * @cd_fan_list: Pointer to the capdata fan list
> > + */
> > +static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct=
 cd_list *cd_fan_list)
> > +{
> > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +	struct capdata_fan capdata_fan;
> > +	int i, err;
> > +
> > +	dev_dbg(dev, "Collecting fan info from capdata_fan\n");
> > +	if (!cd_fan_list)
> > +		goto out;
> > +
> > +	for (i =3D 0; i < LWMI_FAN_NR; i++) {
> > +		err =3D lwmi_cd_fan_get_data(cd_fan_list, LWMI_FAN_ID(i), &capdata_f=
an);
> > +		if (err)
> > +			continue;
> > +
> > +		priv->fan_info[i].min_rpm =3D capdata_fan.min_rpm;
> > +		priv->fan_info[i].max_rpm =3D capdata_fan.max_rpm;
> > +	}
>=20
> Add an empty line.
>=20
> > +out:
> > +	priv->fan_flags.capdata_fan_collected =3D true;
> > +	lwmi_om_hwmon_add(priv);
> > +}
> > +
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capda=
ta 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> >  struct tunable_attr_01 {
> >  	struct capdata01 *capdata;
> >  	struct device *dev;
> > @@ -559,32 +1007,45 @@ static void lwmi_om_fw_attr_remove(struct lwmi_o=
m_priv *priv)
> >  	device_unregister(priv->fw_attr_dev);
> >  }
> > =20
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=3D=3D=
=3D=3D=3D=3D=3D */
> > +
> >  /**
> >   * lwmi_om_master_bind() - Bind all components of the other mode drive=
r
> >   * @dev: The lenovo-wmi-other driver basic device.
> >   *
> > - * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to =
the
> > - * lenovo-wmi-other master driver. On success, assign the capability d=
ata 01
> > - * list pointer to the driver data struct for later access. This point=
er
> > - * is only valid while the capdata01 interface exists. Finally, regist=
er all
> > - * firmware attribute groups.
> > + * Call component_bind_all to bind the lenovo-wmi-capdata devices to t=
he
> > + * lenovo-wmi-other master driver, with a callback to collect fan info=
 from
> > + * capdata_fan. On success, assign the capability data list pointers t=
o the
> > + * driver data struct for later access. These pointers are only valid =
while the
> > + * capdata interfaces exist. Finally, collect fan info from capdata00 =
and
> > + * register all firmware attribute groups. Note that the HWMON device =
is
> > + * registered only if all fan info is collected. Hence, it is not regi=
stered
> > + * here. See lwmi_om_fan_info_collect_cd00() and
> > + * lwmi_om_fan_info_collect_cd_fan().
> >   *
> >   * Return: 0 on success, or an error code.
> >   */
> >  static int lwmi_om_master_bind(struct device *dev)
> >  {
> >  	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > -	struct lwmi_cd_binder binder =3D { 0 };
> > +	struct lwmi_cd_binder binder =3D {
> > +		.cd_fan_list_cb =3D lwmi_om_fan_info_collect_cd_fan,
> > +	};
> >  	int ret;
> > =20
> > +	lwmi_om_fan_info_init(priv);
> > +
> >  	ret =3D component_bind_all(dev, &binder);
> >  	if (ret)
> >  		return ret;
> > =20
> > +	priv->cd00_list =3D binder.cd00_list;
> >  	priv->cd01_list =3D binder.cd01_list;
> > -	if (!priv->cd01_list)
> > +	if (!priv->cd00_list || !priv->cd01_list)
> >  		return -ENODEV;
> > =20
> > +	lwmi_om_fan_info_collect_cd00(priv);
> > +
> >  	return lwmi_om_fw_attr_add(priv);
> >  }
> > =20
> > @@ -592,15 +1053,18 @@ static int lwmi_om_master_bind(struct device *de=
v)
> >   * lwmi_om_master_unbind() - Unbind all components of the other mode d=
river
> >   * @dev: The lenovo-wmi-other driver basic device
> >   *
> > - * Unregister all capability data attribute groups. Then call
> > - * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from=
 the
> > - * lenovo-wmi-other master driver. Finally, free the IDA for this devi=
ce.
> > + * Unregister all firmware attribute groups and the HWMON device. Then=
 call
> > + * component_unbind_all to unbind lenovo-wmi-capdata devices from the
> > + * lenovo-wmi-other master driver.
> >   */
> >  static void lwmi_om_master_unbind(struct device *dev)
> >  {
> >  	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > =20
> >  	lwmi_om_fw_attr_remove(priv);
> > +
> > +	lwmi_om_hwmon_remove(priv);
> > +
> >  	component_unbind_all(dev, NULL);
> >  }
> > =20
> > @@ -665,5 +1129,6 @@ MODULE_IMPORT_NS("LENOVO_WMI_CD");
> >  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> >  MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
> >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> >  MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
> >  MODULE_LICENSE("GPL");
> >=20
