Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50299345EAC
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424915; cv=pass; b=HrlDkeJKzsa2Jq0Sx6qIMbEsfOFQ3I0OiB8W1q7WohW41XatK3YiAKG+mQ2Ns76yCEb0i8OGLfruxez744GR5LgnIbArvaWKs6SMGAVB/4Af00r4S3q9E5kRN42qLM5MtJ7NleWUpL7RQi5+cB9bCJFpqmT1soww9VNpHll1cm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424915; c=relaxed/simple;
	bh=aNr9GYgdP+GbqHKodE3ZKcQDLBHMbLfgSHC1yg+XDUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgSyZPkYBjE7QgMabzQ6yph2q8sj6m4Wjp9Ph3OxvN/fN23qBRiY56PsYrcGmTiCMQ3ZO/wD6EcM6q2XdF5pzo3fUWxuIkNpGmC3AhWwhIs4gWNw3kjJ9KXiT0rLWZberRnT14KuYqtGq1RLnz3ipZBhd9eD8Ftyw2CjYzIEX6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4kdr6NP; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4kdr6NP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5335cf904so16354935ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 11:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787424914; cv=none;
        d=google.com; s=arc-20260327;
        b=FlGrgRWkNHu3mr/PviACd5dmgbU0jbXLHUPze7Ny53AzCWV3JO97r4A9ICroMR/6uE
         n339b7WMpj/hoYNMdMt7COQe6HenKhvf6W9ZpaqfgQeBg2NnufkQiRGotjE1m1Hkf3Na
         3td7j56J8t9GNuiMfyMMnkCcPUPe9Yct1XskWvwHjXWy0LSALll32BTgzCZ3l+kcmAKh
         t2FOT+nKajt0KTlQYxbLbnVU/Tlhayr1KxOwzbdG7b5lb1u4OjQqVQkKhu8TcUlPKvPh
         3YGwc1LDF3Izqyr0QkCKpfJmvsAd1HCNRx/mjm3ULDUjBWdWbyK7ZctJuxYik2NdBquk
         I/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        fh=ADHld9MuGx3cZ5+tu8frpHRzcwR7h5NDQ44dq3hp8rE=;
        b=XZMpkTddVGjQpnUvmiquF7GJOWj+u0Cgn7YGue+Rve6uqo46tWKOJe4UQfUSj7Ex+5
         ZOiSXid/OIPjRFNuQFCsPhvQcnx0822p4jUxpon76XTfPgZBcJ6l/tVB+5YjDc6juBxb
         l0fNjuP3226JSWgH+k3tTdJU04WnVvkUaWtWQ36sV9vQHVRVGF+y2G2pYKlphpwuRhBg
         UNcyFwnyYG5+M93ADHfTvYqlJY7uw4YaBfCebngE07Unttglh+y5IIjHnXbcqmPkNU3S
         zPMa7SdZv2cIiDjw4M8WgU0qsgq72i7WdiezPqJ84CTuzlcCCkoG5WQ8XK8AEC5f3+7P
         An4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787424914; x=1788029714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        b=R4kdr6NPKkVeCfqPggYDLKM75wkUoa8tof8xni4FWBDKyF/lqOmnvK4QAXea8g1A/Q
         LJ8yWt3I/WQ9pI4qwq6cUJizJRRavU1PQeBI5kdiPtfYGNaGGhLnQM0zln7Dkoh+TMwl
         0IsHAfYlKEntLuWSyj2JXcre2VB+TYcPh+g2G7QRHBOqTSSp2y+i5xlJn6wnP4a0TxTb
         6ppAvA0H/2GyYzPMFu/gHrhuYa9XilS0XBRhP8rVIAKdMC7SqAJiZbTqjCdzMbrs16+F
         1u2GHpG2fgYOWZYhgS7T7SJs6hyg5lVPWv+xZE77wltKtxvwS8Jfbmpvut/73y6UocMi
         hEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787424914; x=1788029714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        b=AAFR1AiJUekz3i6hbQoR55hzBcmXYR66Tmqb2+9l+kwKipJYK9TS4ib1M0HhNkXoKc
         DjRINpMm26mFWgAmDbIUj3GfbHXKqBsVXuF0+PBHqUvwkLszTYvtE8jbe7MIIawBGQ/6
         69T3jLvhqadxoQcJUbwr0xeMKejQDTqta6ET170wulOAhLYn9hxv08xvo9qCHBSnAwku
         iLaqWyhCwy+jGqHRjJFda/R4n1EnIz831hgiTuPj26Sq0ufhx81TNEJkyja0AEI6olrn
         1giOg5SY7YTWX39q2YPfVRGJAen0OA6qgge/8pFrBXQo7F38cMNAOheSulhhbAPcBP0l
         obeA==
X-Forwarded-Encrypted: i=1; AHgh+RqRzt02IrpCSzEx1WKZlOQGnxjauDkoGUniXUWOXPffh1gRxd7kt106TsU7rBDBo22TTsMsXXEIhWpeIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kby8Ck7WybDTi2TeQ/CXx0Nr8fz7ysbigLzV9pY5APHmgCgTEJ
	WbouNlcsKWhfIiGRLyhSZNml5j/xzPYm+gv2T5B1NWN3+DYymFqrT/sQZC5h5BX/+CT99LrWWW4
	6rOjJkyYWRdU4IhIpx/5CPVaBkZ0kXQw=
X-Gm-Gg: AR+sD11v3Ng9jeuQNSAfopbZrAFLFVE1HD3i5TIDJydjQaIS+cQJ9TeL+Vtl98kGDTM
	QjVVBMM0aqqZPGcaDqMZaCPUB8lGV+9mrxCnyOQ/sIJspMOw3OVDJ63coebHq+tuyX4pC+D+AnS
	JPobrw8qCdtxMEkjzh3/DSaFN7UMkTEDO0IxppvKhD3dF0QVAyLwVZpdVl5Pgd7de54K7mN81Pm
	09jHSPsv+ts3dU2NzvTn+RObgubLvmV8MUAeudVUOKEVZDQJCyGBnlZ7dYIuklGyGi1SLF+o97X
	YPO6ZJXwWePD+MBv83wWHQ2/ELWEPG/LrlhN/Ao2fgBOOReB8+3vCp9rFuEGPbB43VyFQmA1OR2
	HqlCsLyBUqG/9FyakZo1T8nL43jTcMEDLFRRf4kknx29HoSkXPJ8nXoe11tyJQmfvsrF4ctcVu8
	nkms7MO2b/exw=
X-Received: by 2002:a17:902:e943:b0:2d6:3c2f:69b with SMTP id
 d9443c01a7336-2d64af6f8cemr289247205ad.8.1787424913629; Sat, 22 Aug 2026
 11:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-2-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-2-mradityadash@gmail.com>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Sat, 22 Aug 2026 20:55:02 +0200
X-Gm-Features: AcwNN1XYCgUsRE1L2izsL95rXobTakiN25NcV7-_O-nIURiBuX2hxxdWaTEe8KQ
Message-ID: <CAGwozwEg060P820Kdi3bZ+nFfH6eGXEpx_5Dsnkn_rDsRoNLcA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go
 Full Speed control
To: Aditya Dash <mradityadash@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 23:47, Aditya Dash <mradityadash@gmail.com> wrote:
>
> Selected Legion Go firmware exposes Full Speed as Other Mode feature
> 0x04020000. Capability Data does not describe this feature, so
> lenovo-wmi-other currently ignores it.

Rephrase. Legion Go devices expose .... The current driver does not
handle this ..., add support for the Full Speed attribute ...

> Probe the feature during HWMON setup on those products. If the read
> succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
> selects Full Speed, and value 2 returns fan control to firmware automatic
> mode. Reject all other values.
>
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |   7 ++
>  drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 011054d64eac..75f2deaaef16 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -49,6 +49,13 @@ The following HWMON attributes are implemented:
>  Due to the internal RPM divisor, the current/target RPMs are rounded down to
>  its nearest multiple. The divisor itself is not necessary to be a power of two.
>
> +Legion Go fan controls
> +----------------------
> +
> +On supported Legion Go models, Other Mode feature ``0x04020000`` controls
> +Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
> +enables Full Speed, and value 2 returns fan control to firmware.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..c180933e1d18 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -32,6 +32,7 @@
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -83,6 +84,7 @@ enum lwmi_feature_id_psu {
>         LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =  0x02,
>  };
>
> +#define LWMI_FEATURE_ID_FAN_FULLSPEED 0x02
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>
>  #define LWMI_TYPE_ID_CROSSLOAD 0x01
> @@ -102,6 +104,10 @@ enum lwmi_feature_id_psu {
>  #define LWMI_CHARGE_TYPE_STANDARD      0x00
>  #define LWMI_CHARGE_TYPE_LONGLIFE      0x01
>
> +#define LWMI_ATTR_ID_FAN_FULLSPEED                                     \
> +       lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_FULLSPEED, \
> +                    LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>         lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>                      LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> @@ -115,6 +121,50 @@ enum lwmi_feature_id_psu {
>
>  static DEFINE_IDA(lwmi_om_ida);
>
> +static const struct dmi_system_id lwmi_fan_dmi_table[] = {
> +       {
> +               .ident = "Lenovo Legion Go 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8ARP1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8ASP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8AHP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +               },
> +       },
> +       {}
> +};

Why DMI match?

> +
> +static bool lwmi_fan_supported(void)
> +{
> +       return dmi_check_system(lwmi_fan_dmi_table);
> +}

Why not cap match? My version might help you:
https://github.com/anatase-org/patchwork/commit/3d326d36ac8839f5d6f1d3ab1885322bbdf4a3cb

Best,
Antheas

> +
>  enum attribute_property {
>         DEFAULT_VAL,
>         MAX_VAL,
> @@ -144,6 +194,7 @@ struct lwmi_om_priv {
>         int ida_id;
>
>         struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> +       bool fullspeed_supported;
>
>         struct {
>                 bool capdata00_collected : 1;
> @@ -237,6 +288,38 @@ static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val,
>         return (retval == 0 || retval == 1) ? 0 : -EIO;
>  }
>
> +static int lwmi_om_fullspeed_get(struct lwmi_om_priv *priv, long *enable)
> +{
> +       struct wmi_method_args_32 args = {
> +               .arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +       };
> +       u32 value;
> +       int ret;
> +
> +       ret = lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_GET,
> +                                   (u8 *)&args, sizeof(args), &value);
> +       if (ret)
> +               return ret;
> +
> +       if (value > 1)
> +               return -ERANGE;
> +
> +       *enable = value ? 0 : 2;
> +       return 0;
> +}
> +
> +static int lwmi_om_fullspeed_set(struct lwmi_om_priv *priv, bool fullspeed)
> +{
> +       struct wmi_method_args_32 args = {
> +               .arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +               .arg1 = fullspeed,
> +       };
> +
> +       /* The WMI method has no return value. */
> +       return lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_SET,
> +                                    (u8 *)&args, sizeof(args), NULL);
> +}
> +
>  /**
>   * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
>   * @drvdata: Driver private data
> @@ -255,6 +338,10 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
>         struct lwmi_om_priv *priv = (struct lwmi_om_priv *)drvdata;
>         bool visible = false;
>
> +       if (type == hwmon_pwm && priv->fullspeed_supported && channel == 0 &&
> +           attr == hwmon_pwm_enable)
> +               return 0644;
> +
>         if (type == hwmon_fan) {
>                 if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>                         return 0;
> @@ -311,6 +398,9 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>         u32 retval = 0;
>         int err;
>
> +       if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0)
> +               return lwmi_om_fullspeed_get(priv, val);
> +
>         if (type == hwmon_fan) {
>                 switch (attr) {
>                 /*
> @@ -366,6 +456,17 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>         u32 raw, min_rpm, max_rpm;
>         int err;
>
> +       if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0) {
> +               switch (val) {
> +               case 0:
> +                       return lwmi_om_fullspeed_set(priv, true);
> +               case 2:
> +                       return lwmi_om_fullspeed_set(priv, false);
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
>         if (type == hwmon_fan) {
>                 switch (attr) {
>                 case hwmon_fan_target:
> @@ -420,6 +521,7 @@ static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] = {
>                            HWMON_F_MIN | HWMON_F_MAX,
>                            HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
>                            HWMON_F_MIN | HWMON_F_MAX),
> +       HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>         NULL
>  };
>
> @@ -440,6 +542,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +       long enable;
>         int i, valid;
>
>         if (WARN_ON(priv->hwmon_dev))
> @@ -458,6 +561,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>         if (relax_fan_constraint)
>                 dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with caution\n");
>
> +       priv->fullspeed_supported =
> +               lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +
>         valid = 0;
>         for (i = 0; i < LWMI_FAN_NR; i++) {
>                 if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> @@ -474,7 +580,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>                 }
>         }
>
> -       if (valid == 0) {
> +       if (valid == 0 && !priv->fullspeed_supported) {
>                 dev_warn(&priv->wdev->dev,
>                          "fan reporting/tuning is unsupported on this device\n");
>                 return;

This log is a wart. You dmi match anyway. Preferably, you would cap
match. Even then, silently dropping the unsupported features is
preferrable.

> --
> 2.55.0
>
