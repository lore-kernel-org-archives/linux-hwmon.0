Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94F3BBFD7;
	Mon,  6 Jul 2026 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354344; cv=none; b=MK0Z5MTaf3F3snoxIguhUBAwqutcbkyjDMd1aWIbPndMxPR0NlEYpQlbh73zPJTI17pn/UhDVRVfipAHsMaKx0iTdcsyUuzcvcsb2/hZn0rz5wUFB6FVR0Tl+OIRxOPSKNvhJAUMnH3KVOilToIAnh/0qi4hXDzEiHXncpzNfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354344; c=relaxed/simple;
	bh=9y9AnzA8elN53Bv3CegBb4VkUsDiKKoF6V+JECsDJe4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J5WqYJaGwI7YMPFhN1lDn03rbTTDx9vz/BMsZ+QHHRzDTaw25z2b8JARUYTHcRQPoqB1Rk4GL8dLY97IvHLTvxh3Rd0QaSIQX+KPpDdL2H7dGsOG5VQc/RTNgP6tlyrVaUwVexJXe4B7QgFlVozgQn+dDMZYoEkwtObqhTQ5sLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UI9ih44v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UI9ih44v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783354344; x=1814890344;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9y9AnzA8elN53Bv3CegBb4VkUsDiKKoF6V+JECsDJe4=;
  b=UI9ih44vvJ/ptXStyU1rBmKC3jNMfmFGuESeHCj6ltVY7h7QR7lATlY6
   A+xppMtV6ury3IskP30bLUWwOy/qrioWdxxK7dOh1iGZEL+fxV8dLlydh
   dmBf24dO3rt1rLl0Qahq1+f2lvgQhdRiEJWrOYDUbVqhRyBSLfmUdUvuj
   z9gfyyPmxZwePwKRNaY8A2lWWBlvB+Vajm3y6qwquC4zcbIzENxgT+j13
   p1koahxnD+bEzeEUAm9bKaOCeXaQghp/2+SBr0d+i8MO3mfzYiygEPK+6
   noj63JMmz9cfBizNS8/U58tAVGYpUxxh+PgDMxzkWny6J7DhfK0Q4+Er3
   A==;
X-CSE-ConnectionGUID: Ol0D6uMNSLmrRLqA1PeuOg==
X-CSE-MsgGUID: n4S/dAkTTs+3znUXY68W1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94351137"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94351137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 09:12:23 -0700
X-CSE-ConnectionGUID: yjHmDXoAQhaG1HMBMr+2Ug==
X-CSE-MsgGUID: ozGKKmB0Qiy8pAeHPZ1aPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249308266"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.95])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 09:12:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 Jul 2026 19:12:13 +0300 (EEST)
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
cc: sre@kernel.org, Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
    gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com, 
    priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v4 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
In-Reply-To: <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
Message-ID: <eb7ebc45-f76a-4d5d-31f5-46f95e6977e6@linux.intel.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com> <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1175465363-1783354333=:1195"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1175465363-1783354333=:1195
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 6 Jul 2026, Daniel Lezcano wrote:

> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
>=20
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
>=20
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
>=20
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/Kconfig                |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
>  2 files changed, 132 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index 10f905d7d6bf..121043348740 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
>  =09depends on ARCH_QCOM || COMPILE_TEST
>  =09depends on I2C
>  =09depends on INPUT
> +=09depends on HWMON
>  =09select INPUT_SPARSEKMAP
>  =09select LEDS_CLASS
>  =09select NEW_LEDS
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694..fc480f093238 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -21,6 +22,7 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/pm.h>
> +#include <linux/units.h>
> =20
>  #define T14S_EC_CMD_ECRD=090x02
>  #define T14S_EC_CMD_ECWR=090x03
> @@ -67,6 +69,13 @@
>  #define T14S_EC_EVT_KEY_FN_F11=09=09=090x7a
>  #define T14S_EC_EVT_KEY_FN_G=09=09=090x7e
> =20
> +#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
> +#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
> +#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
> +#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
> +#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
> +#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
> +
>  /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
>  #define T14S_EC_BLINK_RATE_ON_OFF_MS=09=09500
> =20
> @@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
>  =09struct t14s_ec *ec;
>  };
> =20
> +struct t14s_ec_hwmon_sys_thermx {
> +=09const char *label;
> +=09int reg;
> +};
> +
> +struct t14s_ec_hwmon {
> +=09struct t14s_ec_hwmon_sys_thermx *sys_thermx;
> +};
> +
>  struct t14s_ec {
>  =09struct regmap *regmap;
>  =09struct device *dev;
> +=09struct t14s_ec_hwmon ec_hwmon;
>  =09struct t14s_ec_led_classdev led_pwr_btn;
>  =09struct t14s_ec_led_classdev led_chrg_orange;
>  =09struct t14s_ec_led_classdev led_chrg_white;
> @@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, voi=
d *data)
>  =09return IRQ_HANDLED;
>  }
> =20
> +static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
> +=09=09=09=09=09enum hwmon_sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (attr =3D=3D hwmon_temp_input ||
> +=09=09    attr =3D=3D hwmon_temp_label)
> +=09=09=09return 0444;
> +=09=09break;
> +=09default:
> +=09=09return 0;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +=09=09=09=09     u32 attr, int channel, const char **str)
> +{
> +=09struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (attr =3D=3D hwmon_temp_label) {
> +=09=09=09*str =3D ec->ec_hwmon.sys_thermx[channel].label;
> +=09=09=09return 0;
> +=09=09}
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return -EOPNOTSUPP;
> +}
> +
> +static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +=09=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (attr =3D=3D hwmon_temp_input) {
> +=09=09=09ret =3D t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, =
&value);
> +=09=09=09if (ret)
> +=09=09=09=09return ret;
> +=09=09=09*val =3D value * MILLIDEGREE_PER_DEGREE;
> +
> +=09=09=09return 0;
> +=09=09}
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_ops t14s_ec_hwmon_ops =3D {
> +=09.is_visible =3D t14s_ec_hwmon_is_visible,
> +=09.read =3D t14s_ec_hwmon_read,
> +=09.read_string =3D t14s_ec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] =3D {
> +=09HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info =3D {
> +=09.ops =3D &t14s_ec_hwmon_ops,
> +=09.info =3D t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +=09struct device *dev;
> +=09struct t14s_ec_hwmon_sys_thermx sys_thermx[] =3D {
> +=09=09{ .label =3D "soc",=09.reg =3D T14S_EC_SYS_THERM0 },
> +=09=09{ .label =3D "keyboard",=09.reg =3D T14S_EC_SYS_THERM1 },
> +=09=09{ .label =3D "base",=09.reg =3D T14S_EC_SYS_THERM2 },
> +=09=09{ .label =3D "charging",=09.reg =3D T14S_EC_SYS_THERM3 },
> +=09=09{ .label =3D "qtm",=09.reg =3D T14S_EC_SYS_THERM6 },
> +=09=09{ .label =3D "ssd",=09.reg =3D T14S_EC_SYS_THERM7 },
> +=09};
> +
> +=09ec->ec_hwmon.sys_thermx =3D devm_kmemdup_array(ec->dev, sys_thermx,
> +=09=09=09=09=09=09     ARRAY_SIZE(sys_thermx),
> +=09=09=09=09=09=09     sizeof(sys_thermx[0]), GFP_KERNEL);
> +=09if (!ec->ec_hwmon.sys_thermx)
> +=09=09return -ENOMEM;
> +
> +=09dev =3D devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> +=09=09=09=09=09=09   &t14s_ec_chip_info, NULL);
> +
> +=09return PTR_ERR_OR_ZERO(dev);
> +}
> +
>  static int t14s_ec_probe(struct i2c_client *client)
>  {
>  =09struct device *dev =3D &client->dev;
> @@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> +=09ret =3D t14s_ec_hwmon_probe(ec);
> +=09if (ret < 0)
> +=09=09return ret;
> +
>  =09ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>  =09=09=09=09=09t14s_ec_irq_handler,
>  =09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1175465363-1783354333=:1195--
