Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A939A04D
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454749; cv=none; b=rS9CwVQunpF2qhQjx8dWfP8Tnw0+abFcdf8rGGxiGcDR9CUZY7b+NHzx9xMCJecmOphyuQBjnQtbCK/EAB4Mk8m6MOjWmKw/kI+yXsfI2bS0nlzfzOVUa9UEv3XQUTnlEZddfC/452iEt08Mjk10yV1d3FPR6t5w9fi0wvWa3tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454749; c=relaxed/simple;
	bh=aiMJ9XVb/fAOPJP97f8qgEUMoha2rXmlKGPcHFDFMsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkFPcERYGdP35KIHLuOS6fFgKdWfPcRR2TQbIu9FqdIYZHcrqaDqPKd/uZizyOSoiZRFLTvp1as/pRsZP6M60n4rPGZLLSjWuTUnlgKKRhkEakA2C/rdMK6aVsmQemk7115uE5pc/KrvVRGIc5lifKxBvqbA1YklNzLp8AkDbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=T7zmyHGS; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="T7zmyHGS"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 72B145DF12
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:32:26 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 177C35E6F7
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:32:25 +0300 (EEST)
Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 889F71FF317
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:32:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790454743;
	bh=gi5IaO//agjFluDDPGgEQedzafbz2TDUY5ZwA983V9w=;
	h=Received:From:Subject:To;
	b=T7zmyHGS6l73Oentm2jUdfj1ObOJta+nW73lRS3VmOYOlSGcfpFFXI8RrfNGykhfV
	 YhO1tHp5ZA8XzoAEubCfVzDKrulu5FD4eLAsr2j1IYnLVoqLDcyw5PvS5ZEMbDH3n0
	 7i+MJFZAX5TV6bfGYUgkT7611hcL/sTukPVq1m0KKMo2Lsek0eTZzbhJLDbVEEC+Ez
	 a/RfQbJPiJPJd8tJrTs4zkai9qJH50wbDw2rgmHMFhrmwwh18UnStQ/hOZb/lBuZpi
	 N0mNz/JQ4mz60IZdv8LEEC1+3M7s/QNwNDz4ryfd1zO7sc3OsVn1UgKMdu2Fsluf81
	 Rv3rOTNphjRuw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.166) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f38.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f38.google.com with SMTP id
 d9443c01a7336-2d747ec6185so7474875ad.0
        for <linux-hwmon@vger.kernel.org>;
 Sat, 26 Sep 2026 13:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwvZ+cwDipZj8bAgBn7cbC9X9XtdqRegtWnoIbbC74MHEvhMxDInMrBknCg6XhYTS1J5W9SW/YDFtYDXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7p9HibEHkBW45fjWUq096Ab7SYT1aVrJlArd4Mw+POaCB6qUP
	J9sPzblKmz6Jw/BMBh+hnlfW37wY5xa8/cc0q6K7xzEk/D76f8O+KTYKPrUZo/mV3aTUpegQLH/
	bXCY7anKrbXaScG8xH1itTzNRv7nyv84=
X-Received: by 2002:a17:903:8c5:b0:2df:a0f0:6625 with SMTP id
 d9443c01a7336-2dfa0f06cf3mr27418185ad.17.1790454742029; Sat, 26 Sep 2026
 13:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 22:32:10 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
X-Gm-Features: AclHuK8q0fQxCqk1qcnBSwPLyStF_AWG-RRmHH1uGcw9vIsjPOLIKoaYK-sljEk
Message-ID: 
 <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win
 5
To: alexei.solcanu@pm.me
Cc: Guenter Roeck <linux@roeck-us.net>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179045474385.550029.16433498102517972861@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 22:12, Alexei Solcanu via B4 Relay
<devnull+alexei.solcanu.pm.me@kernel.org> wrote:
>
> From: Alexei Solcanu <alexei.solcanu@pm.me>
>
> The GPD Win 5 uses gpd_duo_drvdata, which exposes a single fan and pwm
> channel: pwm1 writes the same duty cycle to both fans, and fan1_input
> only reads the first fan's RPM.
>
> The two fans have independent registers. Fan 1 uses duty cycle 0x047A
> and RPM 0x0478/0x0479, fan 2 uses duty cycle 0x047B and RPM
> 0x0476/0x0477. A duty cycle of 0 returns that fan to EC control.
>
> Add separate board data for the Win 5 and register fan1/pwm1 and
> fan2/pwm2, one channel per fan. Boards with a single fan are unchanged.
>
> This changes behaviour on the Win 5: pwm1 and pwm1_enable now control
> only the first fan. The second fan stays under EC control unless pwm2
> and pwm2_enable are used.
>
> The GPD Duo keeps a single channel, since it is untested and its
> second fan's RPM register is unknown.
>
> Tested on a GPD Win 5 (G1618-05).
>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> ---
>  Documentation/hwmon/gpd-fan.rst |  14 ++--
>  drivers/hwmon/gpd-fan.c         | 146 +++++++++++++++++++++++++++-------------
>  2 files changed, 107 insertions(+), 53 deletions(-)
>
> diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
> index b27657d3305..6c8569c5f64 100644
> --- a/Documentation/hwmon/gpd-fan.rst
> +++ b/Documentation/hwmon/gpd-fan.rst
> @@ -28,6 +28,7 @@ Currently the driver supports the following handhelds:
>   - GPD Win Max 2 2025 (HX370)
>   - GPD Win 4 (6800U)
>   - GPD Win 4 (7840U)
> + - GPD Win 5
>   - GPD Micro PC 2
>
>  Module parameters
> @@ -59,23 +60,26 @@ Sysfs entries
>
>  The following attributes are supported:
>
> -fan1_input
> +fan[1-2]_input
>    Read Only. Reads current fan RPM.
>
> -pwm1_enable
> +pwm[1-2]_enable
>    Read/Write. Enable manual fan control. Write "0" to disable control and run
>    at full speed. Write "1" to set to manual, write "2" to let the EC control
>    decide fan speed. Read this attribute to see current status.
>
>    NB: In consideration of the safety of the device, when setting to manual mode,
>    the pwm speed will be set to the maximum value (255) by default. You can set
> -  a different value by writing pwm1 later.
> +  a different value by writing pwm[1-2] later.
>
> -pwm1
> +pwm[1-2]
>    Read/Write. Read this attribute to see current duty cycle in the range
> -  [0-255]. When pwm1_enable is set to "1" (manual) write any value in the
> +  [0-255]. When pwm[1-2]_enable is set to "1" (manual) write any value in the
>    range [0-255] to set fan speed.
>
>    NB: Many boards (except listed under wm2 above) don't support reading the
>    current pwm value in auto mode. That will just return EOPNOTSUPP. In manual
>    mode it will always return the real value.
> +
> +fan2_input, pwm2_enable and pwm2 only exist on devices with two fans
> +(GPD Win 5).
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index b3b75f99f58..e03b0dde66f 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -31,6 +31,7 @@ enum gpd_board {
>         win4_6800u,
>         win_max_2,
>         duo,
> +       win5,
>         mpc2,
>  };
>
> @@ -40,9 +41,11 @@ enum FAN_PWM_ENABLE {
>         AUTOMATIC       = 2,
>  };
>
> +#define GPD_MAX_FANS   2
> +
>  struct gpd_fan_data {
> -       enum FAN_PWM_ENABLE pwm_enable;
> -       u8 pwm_value;
> +       enum FAN_PWM_ENABLE pwm_enable[GPD_MAX_FANS];
> +       u8 pwm_value[GPD_MAX_FANS];
>         const struct gpd_fan_drvdata *drvdata;
>  };
>
> @@ -55,6 +58,8 @@ struct gpd_fan_drvdata {
>         const u16 manual_control_enable;
>         const u16 rpm_read;
>         const u16 pwm_write;
> +       const u16 rpm2_read; // Second fan, 0 if there is none
> +       const u16 pwm2_write;
>         const u16 pwm_max;
>  };
>
> @@ -82,6 +87,20 @@ static struct gpd_fan_drvdata gpd_duo_drvdata = {
>         .pwm_max                = 244,
>  };
>
> +static struct gpd_fan_drvdata gpd_win5_drvdata = {
> +       .board_name             = "win5",
> +       .board                  = win5,
> +
> +       .addr_port              = 0x4E,
> +       .data_port              = 0x4F,
> +       .manual_control_enable  = 0x047A,
> +       .rpm_read               = 0x0478,
> +       .pwm_write              = 0x047A,
> +       .rpm2_read              = 0x0476,
> +       .pwm2_write             = 0x047B,
> +       .pwm_max                = 244,
> +};
> +
>  static struct gpd_fan_drvdata gpd_win4_drvdata = {
>         .board_name             = "win4",
>         .board                  = win4_6800u,
> @@ -214,7 +233,7 @@ static const struct dmi_system_id dmi_table[] = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>                         DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
>                 },
> -               .driver_data = &gpd_duo_drvdata,
> +               .driver_data = &gpd_win5_drvdata,
>         },
>         {
>                 // GPD Pocket 4
> @@ -290,13 +309,29 @@ static void gpd_ecram_write(const struct gpd_fan_drvdata *drvdata, u16 offset, u
>         outb(value, data_port);
>  }
>
> -static int gpd_generic_read_rpm(struct gpd_fan_data *data)
> +static int gpd_num_fans(const struct gpd_fan_drvdata *drvdata)
> +{
> +       return drvdata->pwm2_write ? 2 : 1;
> +}
> +
> +static u16 gpd_rpm_reg(const struct gpd_fan_drvdata *drvdata, int channel)
> +{
> +       return channel ? drvdata->rpm2_read : drvdata->rpm_read;
> +}
> +
> +static u16 gpd_pwm_reg(const struct gpd_fan_drvdata *drvdata, int channel)
> +{
> +       return channel ? drvdata->pwm2_write : drvdata->pwm_write;
> +}

in my view adding all these functions is unneeded complexity. There
should be some simpler ternary way.

> +
> +static int gpd_generic_read_rpm(struct gpd_fan_data *data, int channel)
>  {
>         const struct gpd_fan_drvdata *drvdata = data->drvdata;
> +       u16 reg = gpd_rpm_reg(drvdata, channel);
>         u8 high, low;
>
> -       gpd_ecram_read(drvdata, drvdata->rpm_read, &high);
> -       gpd_ecram_read(drvdata, drvdata->rpm_read + 1, &low);
> +       gpd_ecram_read(drvdata, reg, &high);
> +       gpd_ecram_read(drvdata, reg + 1, &low);
>
>         return (u16)high << 8 | low;
>  }
> @@ -315,18 +350,19 @@ static int gpd_wm2_read_rpm(struct gpd_fan_data *data)
>                         gpd_ecram_write(drvdata, pwm_ctr_offset, 0xB8);
>         }
>
> -       return gpd_generic_read_rpm(data);
> +       return gpd_generic_read_rpm(data, 0);
>  }
>
> -// Read value for fan1_input
> -static int gpd_read_rpm(struct gpd_fan_data *data)
> +// Read value for fanN_input
> +static int gpd_read_rpm(struct gpd_fan_data *data, int channel)
>  {
>         switch (data->drvdata->board) {
>         case win4_6800u:
>         case win_mini:
>         case duo:
> +       case win5:
>         case mpc2:
> -               return gpd_generic_read_rpm(data);
> +               return gpd_generic_read_rpm(data, channel);
>         case win_max_2:
>                 return gpd_wm2_read_rpm(data);
>         }
> @@ -349,19 +385,20 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>         return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>  }
>
> -// Read value for pwm1
> -static int gpd_read_pwm(struct gpd_fan_data *data)
> +// Read value for pwmN
> +static int gpd_read_pwm(struct gpd_fan_data *data, int channel)
>  {
>         switch (data->drvdata->board) {
>         case win_mini:
>         case duo:
> +       case win5:
>         case win4_6800u:
>         case mpc2:
> -               switch (data->pwm_enable) {
> +               switch (data->pwm_enable[channel]) {
>                 case DISABLE:
>                         return 255;
>                 case MANUAL:
> -                       return data->pwm_value;
> +                       return data->pwm_value[channel];
>                 case AUTOMATIC:
>                         return -EOPNOTSUPP;
>                 }
> @@ -378,13 +415,13 @@ static inline u8 gpd_cast_pwm_range(const struct gpd_fan_drvdata *drvdata, u8 va
>         return DIV_ROUND_CLOSEST(val * (drvdata->pwm_max - 1), 255) + 1;
>  }
>
> -static void gpd_generic_write_pwm(struct gpd_fan_data *data, u8 val)
> +static void gpd_generic_write_pwm(struct gpd_fan_data *data, int channel, u8 val)
>  {
>         const struct gpd_fan_drvdata *drvdata = data->drvdata;
>         u8 pwm_reg;
>
>         pwm_reg = gpd_cast_pwm_range(drvdata, val);
> -       gpd_ecram_write(drvdata, drvdata->pwm_write, pwm_reg);
> +       gpd_ecram_write(drvdata, gpd_pwm_reg(drvdata, channel), pwm_reg);
>  }
>
>  static void gpd_duo_write_pwm(struct gpd_fan_data *data, u8 val)
> @@ -397,10 +434,10 @@ static void gpd_duo_write_pwm(struct gpd_fan_data *data, u8 val)
>         gpd_ecram_write(drvdata, drvdata->pwm_write + 1, pwm_reg);
>  }
>
> -// Write value for pwm1
> -static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
> +// Write value for pwmN
> +static int gpd_write_pwm(struct gpd_fan_data *data, int channel, u8 val)
>  {
> -       if (data->pwm_enable != MANUAL)
> +       if (data->pwm_enable[channel] != MANUAL)
>                 return -EPERM;
>
>         switch (data->drvdata->board) {
> @@ -410,25 +447,27 @@ static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
>         case win_mini:
>         case win4_6800u:
>         case win_max_2:
> +       case win5:
>         case mpc2:
> -               gpd_generic_write_pwm(data, val);
> +               gpd_generic_write_pwm(data, channel, val);
>                 break;
>         }
>
>         return 0;
>  }
>
> -static void gpd_win_mini_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE pwm_enable)
> +static void gpd_win_mini_set_pwm_enable(struct gpd_fan_data *data, int channel,
> +                                       enum FAN_PWM_ENABLE pwm_enable)
>  {
>         switch (pwm_enable) {
>         case DISABLE:
> -               gpd_generic_write_pwm(data, 255);
> +               gpd_generic_write_pwm(data, channel, 255);
>                 break;
>         case MANUAL:
> -               gpd_generic_write_pwm(data, data->pwm_value);
> +               gpd_generic_write_pwm(data, channel, data->pwm_value[channel]);
>                 break;
>         case AUTOMATIC:
> -               gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> +               gpd_ecram_write(data->drvdata, gpd_pwm_reg(data->drvdata, channel), 0);
>                 break;
>         }
>  }
> @@ -440,7 +479,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>                 gpd_duo_write_pwm(data, 255);
>                 break;
>         case MANUAL:
> -               gpd_duo_write_pwm(data, data->pwm_value);
> +               gpd_duo_write_pwm(data, data->pwm_value[0]);
>                 break;
>         case AUTOMATIC:
>                 gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> @@ -455,11 +494,11 @@ static void gpd_wm2_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>
>         switch (enable) {
>         case DISABLE:
> -               gpd_generic_write_pwm(data, 255);
> +               gpd_generic_write_pwm(data, 0, 255);
>                 gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
>                 break;
>         case MANUAL:
> -               gpd_generic_write_pwm(data, data->pwm_value);
> +               gpd_generic_write_pwm(data, 0, data->pwm_value[0]);
>                 gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
>                 break;
>         case AUTOMATIC:
> @@ -468,19 +507,20 @@ static void gpd_wm2_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>         }
>  }
>
> -// Write value for pwm1_enable
> -static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE enable)
> +// Write value for pwmN_enable
> +static void gpd_set_pwm_enable(struct gpd_fan_data *data, int channel, enum FAN_PWM_ENABLE enable)
>  {
>         if (enable == MANUAL)
>                 // Set pwm_value to max firstly when switching to manual mode, in
>                 // consideration of device safety.
> -               data->pwm_value = 255;
> +               data->pwm_value[channel] = 255;
>
>         switch (data->drvdata->board) {
>         case win_mini:
>         case win4_6800u:
> +       case win5:
>         case mpc2:
> -               gpd_win_mini_set_pwm_enable(data, enable);
> +               gpd_win_mini_set_pwm_enable(data, channel, enable);
>                 break;
>         case duo:
>                 gpd_duo_set_pwm_enable(data, enable);
> @@ -491,10 +531,15 @@ static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE en
>         }
>  }
>
> -static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
> +static umode_t gpd_fan_hwmon_is_visible(const void *hwmon_data,
>                                         enum hwmon_sensor_types type, u32 attr,
> -                                       __always_unused int channel)
> +                                       int channel)
>  {
> +       const struct gpd_fan_data *data = hwmon_data;
> +
> +       if (channel >= gpd_num_fans(data->drvdata))
> +               return 0;
> +
>         if (type == hwmon_fan && attr == hwmon_fan_input) {
>                 return 0444;
>         } else if (type == hwmon_pwm) {
> @@ -511,14 +556,14 @@ static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
>
>  static int gpd_fan_hwmon_read(struct device *dev,
>                               enum hwmon_sensor_types type, u32 attr,
> -                             __always_unused int channel, long *val)
> +                             int channel, long *val)
>  {
>         struct gpd_fan_data *data = dev_get_drvdata(dev);
>         int ret;
>
>         if (type == hwmon_fan) {
>                 if (attr == hwmon_fan_input) {
> -                       ret = gpd_read_rpm(data);
> +                       ret = gpd_read_rpm(data, channel);
>
>                         if (ret < 0)
>                                 return ret;
> @@ -529,10 +574,10 @@ static int gpd_fan_hwmon_read(struct device *dev,
>         } else if (type == hwmon_pwm) {
>                 switch (attr) {
>                 case hwmon_pwm_enable:
> -                       *val = data->pwm_enable;
> +                       *val = data->pwm_enable[channel];
>                         return 0;
>                 case hwmon_pwm_input:
> -                       ret = gpd_read_pwm(data);
> +                       ret = gpd_read_pwm(data, channel);
>
>                         if (ret < 0)
>                                 return ret;
> @@ -547,7 +592,7 @@ static int gpd_fan_hwmon_read(struct device *dev,
>
>  static int gpd_fan_hwmon_write(struct device *dev,
>                                enum hwmon_sensor_types type, u32 attr,
> -                              __always_unused int channel, long val)
> +                              int channel, long val)
>  {
>         struct gpd_fan_data *data = dev_get_drvdata(dev);
>
> @@ -557,17 +602,17 @@ static int gpd_fan_hwmon_write(struct device *dev,
>                         if (!in_range(val, 0, 3))
>                                 return -EINVAL;
>
> -                       data->pwm_enable = val;
> +                       data->pwm_enable[channel] = val;
>
> -                       gpd_set_pwm_enable(data, data->pwm_enable);
> +                       gpd_set_pwm_enable(data, channel, data->pwm_enable[channel]);
>                         return 0;
>                 case hwmon_pwm_input:
>                         if (!in_range(val, 0, 256))
>                                 return -EINVAL;
>
> -                       data->pwm_value = val;
> +                       data->pwm_value[channel] = val;
>
> -                       return gpd_write_pwm(data, val);
> +                       return gpd_write_pwm(data, channel, val);
>                 }
>         }
>
> @@ -581,8 +626,9 @@ static const struct hwmon_ops gpd_fan_ops = {
>  };
>
>  static const struct hwmon_channel_info *gpd_fan_hwmon_channel_info[] = {
> -       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> -       HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> +       HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +                          HWMON_PWM_INPUT | HWMON_PWM_ENABLE),

Are you sure the correct number of fans are populated for each device
because of the visible entry? If yes, it is fine for this hunk. If no,
needs dynamic population for the struct in probe.

You also add a board match for win5, but doesnt the duo have two fans?
I think we had this discussion last year and I said two fans more
complexity lets leave it. But if we do it properly this time lets do
it properly.

Verify which duo-like devices implement two fans, it should be all of
them. I think Cryolitia has a Duo. Win Max 3 according to my GPD
contact has a duo layout. Unfortunately, I have no users so no DMI. So
it is at least Duo, Win Max 3, and Win5. Then make it so only these 3
devices (which should need no separation) report two fans and two fan
speeds throughout the driver.

Best,
Antheas

>         NULL
>  };
>
> @@ -619,8 +665,10 @@ static void gpd_fan_reset_hardware(void *pdata)
>         struct gpd_fan_data *data = pdata;
>
>         if (data) {
> -               data->pwm_enable = AUTOMATIC;
> -               gpd_set_pwm_enable(data, AUTOMATIC);
> +               for (int i = 0; i < gpd_num_fans(data->drvdata); i++) {
> +                       data->pwm_enable[i] = AUTOMATIC;
> +                       gpd_set_pwm_enable(data, i, AUTOMATIC);
> +               }
>         }
>  }
>
> @@ -654,8 +702,10 @@ static int gpd_fan_probe(struct platform_device *pdev)
>                 return -EINVAL;
>
>         data->drvdata = match;
> -       data->pwm_enable = AUTOMATIC;
> -       data->pwm_value = 255;
> +       for (int i = 0; i < gpd_num_fans(match); i++) {
> +               data->pwm_enable[i] = AUTOMATIC;
> +               data->pwm_value[i] = 255;
> +       }
>
>         dev_set_drvdata(dev, data);
>
>
> --
> 2.55.0
>
>
>

