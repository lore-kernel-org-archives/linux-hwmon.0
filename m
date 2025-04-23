Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2981202C4A;
	Wed, 23 Apr 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410096; cv=none; b=TlkFje47VclnYnlfgq1/sNUJDErnFVm+VoDkw0YF5MP9f2YcfHmRfvWvNcrp3sKOQIIbBcK1aivnyq5V393rir13ye9hJ0bkbyiBHF52zfNRHkl2EJs4gjRgtqJMtwZX6aW9Qe2qYdAXWp6ta1FCTKTYOszmNc+Xfa7IWg5/gdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410096; c=relaxed/simple;
	bh=A0ne8vqICHUtsR49n4iOpmDCYmNxZVDz7o4X8BaCUUA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HXdwWpOtbCEhEkYvA39fyOkmPD/FFeMVcs5wX2Br3M4aGsgJ0zOJXD/adamBgvjIYaCDD6tPbeD1pF3mFfbk75AM78fXOrnFav8QE4L3D1Au7BqJq/pDzH/JXw6dVUpNVo9VfSgoaOgpxtDxfXszN4RVNvmESj+xDw4/1/6o6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNEjouHQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNEjouHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745410094; x=1776946094;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A0ne8vqICHUtsR49n4iOpmDCYmNxZVDz7o4X8BaCUUA=;
  b=KNEjouHQEM5kUTXCVCh61e04opxP7t14NsFInNbNHbXABnYe1K2rW2oC
   BBbB2vx87dJV9r0hDGeRFL7pja1P9Qqg97vLHpuWah2aTWtCU3weityaH
   F08ASx5NwWnnXA8E4B7dDsmkmWXZQ1m61yqowdYV+jpfxGI/Ki8Ag2yAY
   /GxuLufersyubq1A/OYIQYUcqg8/SZksMbtdU237jQBCQBoYx/UPfDY89
   JSOT3NedWivVDXnJ6GELpAPrRafda5g8WWpBoP6T+CV3WXEdSwclHlZae
   N/i53+RTlxeG0ez5KW6ESs+kfSPh5CH4piQGoXK4O9ZnkxKWm+hkySI/I
   A==;
X-CSE-ConnectionGUID: OKf1CckJRt+qMlpMPRzCxA==
X-CSE-MsgGUID: KU4xylETQJS8S0wdgNG1fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57988196"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57988196"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:08:13 -0700
X-CSE-ConnectionGUID: XYAUZl2IRDW8iDLVefCRDA==
X-CSE-MsgGUID: 5A2va2tETrK8W4ktoTuQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132217688"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:08:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Apr 2025 15:08:05 +0300 (EEST)
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
cc: Hans de Goede <hdegoede@redhat.com>, tomasz.pakula.oficjalny@gmail.com, 
    jdelvare@suse.com, linux@roeck-us.net, platform-driver-x86@vger.kernel.org, 
    piotr.krol@3mdeb.com, maciej.pijanowski@3mdeb.com, 
    linux-hwmon@vger.kernel.org, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v7 1/1] platform/x86: Introduce dasharo-acpi platform
 driver
In-Reply-To: <20250407125210.215794-2-michal.kopec@3mdeb.com>
Message-ID: <e10a94ae-745e-9ee0-11af-f6ca583d54b7@linux.intel.com>
References: <20250407125210.215794-1-michal.kopec@3mdeb.com> <20250407125210.215794-2-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-885999988-1745410086=:1158"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-885999988-1745410086=:1158
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Apr 2025, Micha=C5=82 Kope=C4=87 wrote:

> Introduce a driver for devices running Dasharo firmware. The driver
> supports thermal monitoring using a new ACPI interface in Dasharo. The
> initial version supports monitoring fan speeds, fan PWM duty cycles and
> system temperatures as well as determining which specific interfaces are
> implemented by firmware.
>=20
> It has been tested on a NovaCustom laptop running pre-release Dasharo
> firmware, which implements fan and thermal monitoring for the CPU and
> the discrete GPU, if present.
>=20
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>
>=20
> Address Ilpo's review
>=20
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>
> ---
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/Kconfig        |  10 +
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/dasharo-acpi.c | 357 ++++++++++++++++++++++++++++
>  4 files changed, 376 insertions(+)
>  create mode 100644 drivers/platform/x86/dasharo-acpi.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00e94bec401e..6d2e0909ac63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6404,6 +6404,12 @@ F:=09net/ax25/ax25_out.c
>  F:=09net/ax25/ax25_timer.c
>  F:=09net/ax25/sysctl_net_ax25.c
> =20
> +DASHARO ACPI PLATFORM DRIVER
> +M:=09Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>
> +S:=09Maintained
> +W:=09https://docs.dasharo.com/
> +F:=09drivers/platform/x86/dasharo_acpi.c
> +
>  DATA ACCESS MONITOR
>  M:=09SeongJae Park <sj@kernel.org>
>  L:=09damon@lists.linux.dev
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..8168c5274a08 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called lenovo-wmi-camera.
> =20
> +config DASHARO_ACPI
> +=09tristate "Dasharo ACPI Platform Driver"
> +=09depends on ACPI
> +=09depends on HWMON
> +=09help
> +=09  This driver provides HWMON support for devices running Dasharo
> +=09  firmware.
> +
> +=09  If you have a device with Dasharo firmware, choose Y or M here.
> +
>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
> =20
>  config FW_ATTR_CLASS
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..3ca53ae01d93 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)=09+=3D toshiba_acpi.o
>  # Inspur
>  obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)=09+=3D inspur_platform_profile.o
> =20
> +# Dasharo
> +obj-$(CONFIG_DASHARO_ACPI)=09+=3D dasharo-acpi.o
> +
>  # Laptop drivers
>  obj-$(CONFIG_ACPI_CMPC)=09=09+=3D classmate-laptop.o
>  obj-$(CONFIG_COMPAL_LAPTOP)=09+=3D compal-laptop.o
> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/d=
asharo-acpi.c
> new file mode 100644
> index 000000000000..f3f01d4604b5
> --- /dev/null
> +++ b/drivers/platform/x86/dasharo-acpi.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Dasharo ACPI Driver
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +enum dasharo_feature {
> +=09DASHARO_FEATURE_TEMPERATURE =3D 0,
> +=09DASHARO_FEATURE_FAN_PWM,
> +=09DASHARO_FEATURE_FAN_TACH,
> +=09DASHARO_FEATURE_MAX
> +};
> +
> +enum dasharo_temperature {
> +=09DASHARO_TEMPERATURE_CPU_PACKAGE =3D 0,
> +=09DASHARO_TEMPERATURE_CPU_CORE,
> +=09DASHARO_TEMPERATURE_GPU,
> +=09DASHARO_TEMPERATURE_BOARD,
> +=09DASHARO_TEMPERATURE_CHASSIS,
> +=09DASHARO_TEMPERATURE_MAX
> +};
> +
> +enum dasharo_fan {
> +=09DASHARO_FAN_CPU =3D 0,
> +=09DASHARO_FAN_GPU,
> +=09DASHARO_FAN_CHASSIS,
> +=09DASHARO_FAN_MAX
> +};
> +
> +#define MAX_GROUPS_PER_FEAT 8
> +
> +static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_G=
ROUPS_PER_FEAT] =3D {
> +=09[DASHARO_FEATURE_TEMPERATURE] =3D {
> +=09=09[DASHARO_TEMPERATURE_CPU_PACKAGE] =3D "CPU Package",
> +=09=09[DASHARO_TEMPERATURE_CPU_CORE] =3D "CPU Core",
> +=09=09[DASHARO_TEMPERATURE_GPU] =3D "GPU",
> +=09=09[DASHARO_TEMPERATURE_BOARD] =3D "Board",
> +=09=09[DASHARO_TEMPERATURE_CHASSIS] =3D "Chassis",
> +=09},
> +=09[DASHARO_FEATURE_FAN_PWM] =3D {
> +=09=09[DASHARO_FAN_CPU] =3D "CPU",
> +=09=09[DASHARO_FAN_GPU] =3D "GPU",
> +=09=09[DASHARO_FAN_CHASSIS] =3D "Chassis",
> +=09},
> +=09[DASHARO_FEATURE_FAN_TACH] =3D {
> +=09=09[DASHARO_FAN_CPU] =3D "CPU",
> +=09=09[DASHARO_FAN_GPU] =3D "GPU",
> +=09=09[DASHARO_FAN_CHASSIS] =3D "Chassis",
> +=09},
> +};
> +
> +struct dasharo_capability {
> +=09unsigned int group;
> +=09unsigned int index;
> +=09char name[16];
> +};
> +
> +#define MAX_CAPS_PER_FEAT 24
> +
> +struct dasharo_data {
> +=09struct platform_device *pdev;
> +=09int caps_found[DASHARO_FEATURE_MAX];
> +=09struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_=
PER_FEAT];
> +};
> +
> +static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum=
 dasharo_feature feat, int cap)
> +{
> +=09struct acpi_object_list obj_list;
> +=09union acpi_object obj[2];
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09u64 count;
> +
> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D feat;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D cap;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D ACPI_HANDLE(&data->pdev->dev);
> +=09status =3D acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -ENODEV;
> +
> +=09return count;
> +}
> +
> +static int dasharo_read_channel(struct dasharo_data *data, char *method,=
 enum dasharo_feature feat, int channel, long *value)
> +{
> +=09struct acpi_object_list obj_list;
> +=09union acpi_object obj[2];
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09u64 val;
> +
> +=09if (feat > ARRAY_SIZE(data->capabilities))
> +=09=09return -EINVAL;
> +
> +=09if (channel > data->caps_found[feat])
> +=09=09return -EINVAL;
> +
> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D data->capabilities[feat][channel].group;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D data->capabilities[feat][channel].index;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D ACPI_HANDLE(&data->pdev->dev);
> +=09status =3D acpi_evaluate_integer(handle, method, &obj_list, &val);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -ENODEV;
> +
> +=09*value =3D val;
> +=09return 0;
> +}
> +
> +static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +=09=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct dasharo_data *data =3D dev_get_drvdata(dev);
> +=09long value;
> +=09int ret;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09ret =3D dasharo_read_channel(data, "GTMP", DASHARO_FEATURE_TEMPERA=
TURE, channel, &value);
> +=09=09if (!ret)
> +=09=09=09*val =3D value * MILLIDEGREE_PER_DEGREE;
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09ret =3D dasharo_read_channel(data, "GFTH", DASHARO_FEATURE_FAN_TAC=
H, channel, &value);
> +=09=09if (!ret)
> +=09=09=09*val =3D value;
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09ret =3D dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM=
, channel, &value);
> +=09=09if (!ret)
> +=09=09=09*val =3D value;
> +=09=09break;
> +=09default:
> +=09=09return -ENODEV;
> +=09=09break;
> +=09}
> +
> +=09return ret;
> +}
> +
> +static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +=09=09=09=09     u32 attr, int channel, const char **str)
> +{
> +=09struct dasharo_data *data =3D dev_get_drvdata(dev);
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (channel >=3D data->caps_found[DASHARO_FEATURE_TEMPERATURE])
> +=09=09=09return -EINVAL;
> +
> +=09=09*str =3D data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].=
name;
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09if (channel >=3D data->caps_found[DASHARO_FEATURE_FAN_TACH])
> +=09=09=09return -EINVAL;
> +
> +=09=09*str =3D data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].nam=
e;
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_=
sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09const struct dasharo_data *data =3D drvdata;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (channel < data->caps_found[DASHARO_FEATURE_TEMPERATURE])
> +=09=09=09return 0444;
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
> +=09=09=09return 0444;
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
> +=09=09=09return 0444;
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static const struct hwmon_ops dasharo_hwmon_ops =3D {
> +=09.is_visible =3D dasharo_hwmon_is_visible,
> +=09.read_string =3D dasharo_hwmon_read_string,
> +=09.read =3D dasharo_hwmon_read,
> +};
> +
> +// Max 24 capabilities per feature
> +static const struct hwmon_channel_info * const dasharo_hwmon_info[] =3D =
{
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL),
> +=09HWMON_CHANNEL_INFO(pwm,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info dasharo_hwmon_chip_info =3D {
> +=09.ops =3D &dasharo_hwmon_ops,
> +=09.info =3D dasharo_hwmon_info,
> +};
> +
> +static void dasharo_fill_feature_caps(struct dasharo_data *data, enum da=
sharo_feature feat)
> +{
> +=09struct dasharo_capability *cap;
> +=09int cap_count =3D 0;
> +=09int count;
> +
> +=09for (int group =3D 0; group < MAX_GROUPS_PER_FEAT; ++group) {
> +=09=09count =3D dasharo_get_feature_cap_count(data, feat, group);
> +
> +=09=09if (count <=3D 0)

This relates to the previous line, it's sort of error handling so please=20
remove the empty line between them.

> +=09=09=09continue;
> +
> +=09=09for (unsigned int i =3D 0; i < count && cap_count < ARRAY_SIZE(dat=
a->capabilities[feat]); ++i) {

This exceeds 100 chars which is the current hard limit for code line=20
lengths.

I suggest you make that cap_count check a separate if () check, I'm not=20
sure though if it should just goto to the final assignment of the function=
=20
as there's nothing more to do here in these loops if the array fills up
(or break the inner loop, that reads a few counts unnecessarily in the=20
outer loop but I guess this is just a safety check that is never=20
supposed to match anyway so doesn't matter much I think which way it is=20
done).

> +=09=09=09cap =3D &data->capabilities[feat][cap_count];
> +=09=09=09cap->group =3D group;
> +=09=09=09cap->index =3D i;
> +=09=09=09scnprintf(cap->name, sizeof(cap->name), "%s %d", dasharo_group_=
names[feat][group], i);

This too is beyond 100 chars.

After you've addressed these, please add:

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

> +=09=09=09cap_count++;
> +=09=09}
> +=09}
> +=09data->caps_found[feat] =3D cap_count;
> +}
> +
> +static int dasharo_probe(struct platform_device *pdev)
> +{
> +=09struct dasharo_data *data;
> +=09struct device *hwmon;
> +
> +=09data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +=09data->pdev =3D pdev;
> +
> +=09for (unsigned int i =3D 0; i < DASHARO_FEATURE_MAX; ++i)
> +=09=09dasharo_fill_feature_caps(data, i);
> +
> +=09hwmon =3D devm_hwmon_device_register_with_info(&pdev->dev, "dasharo_a=
cpi", data,
> +=09=09=09=09=09=09     &dasharo_hwmon_chip_info, NULL);
> +
> +=09return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static const struct acpi_device_id dasharo_device_ids[] =3D {
> +=09{"DSHR0001", 0},
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(acpi, dasharo_device_ids);
> +
> +static struct platform_driver dasharo_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "dasharo-acpi",
> +=09=09.acpi_match_table =3D dasharo_device_ids,
> +=09},
> +=09.probe =3D dasharo_probe,
> +};
> +module_platform_driver(dasharo_driver);
> +
> +MODULE_DESCRIPTION("Dasharo ACPI Driver");
> +MODULE_AUTHOR("Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>");
> +MODULE_LICENSE("GPL");
>=20

--=20
 i.

--8323328-885999988-1745410086=:1158--
