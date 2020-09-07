Return-Path: <SRS0=GhbM=CQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E900C43461
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Sep 2020 18:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28E03206B5
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Sep 2020 18:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4CsrdQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgIGSCD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Sep 2020 14:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbgIGSB6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Sep 2020 14:01:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF4AC061573;
        Mon,  7 Sep 2020 11:01:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so4445184ljk.0;
        Mon, 07 Sep 2020 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LzbUe0TjVckY9Uxm4qZGSw6LPoqfUndzWY+aHlCfpNs=;
        b=g4CsrdQaSqTRqv2u3Xz8+2iHK2pzsMXRCDn1rQQB9JoKOXMeBN2iVlmNWGF/M0E/R8
         bN/8OCPWevAv/3YOAzVwdxdnf73a2NagU6pfzlYqqhYm+5dtJFmMRIw07n8NRQbZGu84
         Ww9To1b9LNre4ZCk2njYKqyzwadL+c46CWbBr7RyqxALZYKu7qpIrW5ZkyoXOPk7TrIi
         t+zefnJIju3Xr5foQyEB83eA1oyzSy2IIC39pW+wntizs7XNl/3CXM7YlEZmddbNRtET
         +aaK3+sCl1UV1qUqtWL9Is5OD+NWAH14XSo3ws38uuWEicV6OtoUTFbxKj6vBpgHdv9I
         iUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=LzbUe0TjVckY9Uxm4qZGSw6LPoqfUndzWY+aHlCfpNs=;
        b=qIib4dI/yBblgAWg7yBgHWbTeey0j3PX5EqiLpgWaHzmZezoGw7xxynufG4dzlR6x4
         HXzwrQq7M3DmOEo+dluq2xo6QtSGJ0Sem6eer8IYEY/VcfOlX6yFYp8r5F/vrmLQOxGT
         M+8nldXCtuIdDQY3Tziah1BBc40d//S8zM3eHLgsBC/l6gQVnJDelXNCEQy951WMotL4
         9buw8XOllKciwdv0qKiXIJUROBaIZ6qP6xvIo2/D0fflbfiOu2recmVTqDqSUuQ3CNlq
         kD+he/k2NiQsAL51WSK1YS+i0YKIm6OeCZN19eMY1DTbyutkSUdxtQWGR7ehOt834LvT
         6H/w==
X-Gm-Message-State: AOAM532B18QaLeiHXciu0/WiYp1jtZ2520+rWxXSFSllYlWlLfdQ4Fwy
        CSpZYAk/svHkLDkzL6moX2a5LBdjr6RN0zQWC8M=
X-Google-Smtp-Source: ABdhPJxkLhy8mzQt7rYLqSLwZ3Zl/gPC+OThqS/jmVGOqHT/RI1CMkJ22ncS1OS8deatiTSQEgodZbacXp1nGCUggl8=
X-Received: by 2002:a2e:6a09:: with SMTP id f9mr4786434ljc.432.1599501711146;
 Mon, 07 Sep 2020 11:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200822104401.60648-1-jaap.aarts1@gmail.com>
In-Reply-To: <20200822104401.60648-1-jaap.aarts1@gmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Mon, 7 Sep 2020 20:01:40 +0200
Message-ID: <CACtzdJ3oOV5AtBV_nrEUntemLfrb3QCRssB7nr4EVbU+-nLpsQ@mail.gmail.com>
Subject: Re: [PATCH V7] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello guenter and/or Barnab=C3=A1s (+ others),

Sorry for me being slow on my last patch, since the previous reviews ware
done within a week I just wanted to make sure this patch didnt slip under t=
he
radar.

Let me know if there is anything still to do, I couldnt find anything
I needed to do
on my end once everything is satisfying, but if there is some final step I =
would
appreciate if you let me know what that would be.

Kind redards,

Jaap Aarts


On Sat, 22 Aug 2020 at 12:47, jaap aarts <jaap.aarts1@gmail.com> wrote:
>
> Adds fan/pwm support for H100i platinum.
> Custom temp/fan curves are not supported.
>
> v7:
>  - redo memory management with regards to device setup. (no more use afte=
r
>    free, double frees, fixed sizeof)
>  - add myself to MAINTAINERS
>  - add documentation for this driver
>
> Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> ---
>  Documentation/hwmon/corsair_hydro_i_pro.rst |  54 ++
>  MAINTAINERS                                 |   6 +
>  drivers/hwmon/Kconfig                       |   7 +
>  drivers/hwmon/Makefile                      |   1 +
>  drivers/hwmon/corsair_hydro_i_pro.c         | 719 ++++++++++++++++++++
>  5 files changed, 787 insertions(+)
>  create mode 100644 Documentation/hwmon/corsair_hydro_i_pro.rst
>  create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c
>
> diff --git a/Documentation/hwmon/corsair_hydro_i_pro.rst b/Documentation/=
hwmon/corsair_hydro_i_pro.rst
> new file mode 100644
> index 000000000000..17d90d1b8e33
> --- /dev/null
> +++ b/Documentation/hwmon/corsair_hydro_i_pro.rst
> @@ -0,0 +1,54 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver corsair_hydro_i_pro
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Supported devices:
> +
> +  * Corsair H100i pro
> +
> +Author: Jaap Aarts
> +
> +Description
> +-----------
> +
> +This driver implements the hwmon interface for the corsair H100i pro.
> +Suppor for more All In One liquid coolers(AIOs) from this product range
> +should be supported, only testing and a new config should be required.
> +These AIOs can be controlled via USB, with control over fans, pumps, RGB
> +lighting, and temperature sensors.
> +Currently only fans are supported, but no custom fan curves are supporte=
d.
> +There is always one pump and 1-3 fans.
> +
> +The H100i pro configuration:
> +fans: 2
> +minrpm: 200,
> +maxrpm: 3000,
> +maxpwm 100,
> +device name: "corsair_H100i_pro",
> +
> +Usage Notes
> +-----------
> +
> +Since it is a USB device, hotswapping is possible. The device is autodet=
ected.
> +
> +Sysfs entries
> +-------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +fan[1-2]_input         Connected fan rpm.
> +fan[1-2]_target                Sets fan speed target rpm, when writing a=
nd if fan_mode is not
> +                       set to one returns -EINVAL.
> +                       When reading, it reports the last value if it was=
 set by the driver.
> +                       When the mode is not set to 1 (manual) read value=
 will be 0.
> +                       Otherwise returns an error.
> +fan[1-2]_min           Reports the minimum rpm value. for the H100i pro =
this is 200
> +fan[1-2]_max           Reports the maximum rpm value. for the H100i pro =
this is 3000
> +
> +pwm[1-2]                       Sets the fan speed. Values from 0-100, wh=
en writing and if
> +                       fan_mode is not set to one returns -EINVAL.
> +pwm[1-2]_enable                Set the mode for the fan.
> +                       0: no fan speed control (i.e. default fan profile=
)
> +                       1: manual fan control
> +                       2: default fan profile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0068bceeb61..0e7553a0e2e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4461,6 +4461,12 @@ L:       linux-hwmon@vger.kernel.org
>  S:     Maintained
>  F:     drivers/hwmon/corsair-cpro.c
>
> +CORSAIR-HYDRO-I-PRO HARDWARE MONITOR DRIVER
> +M:     Jaap Aarts <jaap.aarts1>@gmail.com>
> +L:     linux-hwmon@vger.kernel.org
> +S:     Maintained
> +F:     drivers/hwmon/corsair_hydro_i_pro.c
> +
>  COSA/SRP SYNC SERIAL DRIVER
>  M:     Jan "Yenya" Kasprzak <kas@fi.muni.cz>
>  S:     Maintained
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8dc28b26916e..9a721659313f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,6 +378,13 @@ config SENSORS_ARM_SCPI
>           and power sensors available on ARM Ltd's SCP based platforms. T=
he
>           actual number and type of sensors exported depend on the platfo=
rm.
>
> +config SENSORS_CORSAIR_HYDRO_I_PRO
> +       tristate "Corsair hydro HXXXi pro driver"
> +       depends on USB
> +       help
> +         If you say yes here you get support for the corsair hydro HXXXi=
 pro
> +         range of devices.
> +
>  config SENSORS_ASB100
>         tristate "Asus ASB100 Bach"
>         depends on X86 && I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index a8f4b35b136b..3bad054054fe 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)  +=3D w83793.o
>  obj-$(CONFIG_SENSORS_W83795)   +=3D w83795.o
>  obj-$(CONFIG_SENSORS_W83781D)  +=3D w83781d.o
>  obj-$(CONFIG_SENSORS_W83791D)  +=3D w83791d.o
> +obj-$(CONFIG_SENSORS_CORSAIR_HYDRO_I_PRO)      +=3D corsair_hydro_i_pro.=
o
>
>  obj-$(CONFIG_SENSORS_AB8500)   +=3D abx500.o ab8500.o
>  obj-$(CONFIG_SENSORS_ABITUGURU)        +=3D abituguru.o
> diff --git a/drivers/hwmon/corsair_hydro_i_pro.c b/drivers/hwmon/corsair_=
hydro_i_pro.c
> new file mode 100644
> index 000000000000..42869f32a7bd
> --- /dev/null
> +++ b/drivers/hwmon/corsair_hydro_i_pro.c
> @@ -0,0 +1,719 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid cool=
ers.
> + * Copyright (c) Jaap Aarts 2020
> + *
> + * Protocol partially reverse engineered by audiohacked
> + * https://github.com/audiohacked/OpendriverLink
> + */
> +
> +/*
> + * Supports following liquid coolers:
> + * H100i platinum
> + *
> + * Other products should work with this driver with slight modification.
> + *
> + * Note: platinum is the codename name for pro within the driver, so H10=
0i platinum =3D H100i pro.
> + * But some products are actually called platinum, these are not intende=
d to be supported (yet).
> + *
> + * Note: fan curve control has not been implemented
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +struct device_config {
> +       const u16 vendor_id;
> +       const u16 product_id;
> +       const u8 fancount;
> +       const u16 rpm_min;
> +       const u16 rpm_max;
> +       const u8 pwm_max;
> +       const char *name;
> +       const struct hwmon_channel_info **hwmon_info;
> +};
> +
> +struct hydro_i_pro_device {
> +       struct usb_device *udev;
> +
> +       const struct device_config *config;
> +
> +       unsigned char *bulk_out_buffer;
> +       unsigned char *bulk_in_buffer;
> +       size_t bulk_out_size;
> +       size_t bulk_in_size;
> +       char bulk_in_endpointAddr;
> +       char bulk_out_endpointAddr;
> +
> +       struct usb_interface *interface; /* the interface for this device=
 */
> +       struct mutex io_mutex;
> +};
> +
> +#define MAX_FAN_COUNT 2
> +#define MAX_PWM_CHANNEL_COUNT MAX_FAN_COUNT
> +
> +struct hwmon_data {
> +       struct hydro_i_pro_device *hdev;
> +       u8 channel_count;
> +       void *channel_data[MAX_PWM_CHANNEL_COUNT];
> +};
> +
> +struct curve_point {
> +       u8 temp;
> +       u8 pwm;
> +};
> +
> +#define FAN_CURVE_COUNT 7
> +
> +struct hwmon_fan_data {
> +       u8 fan_channel;
> +       u16 fan_target;
> +       u8 fan_pwm_target;
> +       u8 mode;
> +       struct curve_point curve[FAN_CURVE_COUNT];
> +};
> +
> +static struct curve_point quiet_curve[FAN_CURVE_COUNT] =3D {
> +       {
> +               .temp =3D 0x1F,
> +               .pwm =3D 0x15,
> +       },
> +       {
> +               .temp =3D 0x21,
> +               .pwm =3D 0x1E,
> +       },
> +       {
> +               .temp =3D 0x24,
> +               .pwm =3D 0x25,
> +       },
> +       {
> +               .temp =3D 0x27,
> +               .pwm =3D 0x2D,
> +       },
> +       {
> +               .temp =3D 0x29,
> +               .pwm =3D 0x38,
> +       },
> +       {
> +               .temp =3D 0x2C,
> +               .pwm =3D 0x4A,
> +       },
> +       {
> +               .temp =3D 0x2F,
> +               .pwm =3D 0x64,
> +       },
> +};
> +
> +#define DEFAULT_CURVE quiet_curve
> +
> +static const struct hwmon_channel_info *dual_fan[] =3D {
> +       HWMON_CHANNEL_INFO(
> +               fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN | HWMON=
_F_MAX,
> +               HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN | HWMON_F_MA=
X),
> +       HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +                          HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +       NULL
> +};
> +
> +static const struct device_config config_table[] =3D {
> +       {
> +               .fancount =3D 2,
> +               .rpm_min =3D 200,
> +               .rpm_max =3D 3000,
> +               .pwm_max =3D 100,
> +               .name =3D "corsair_H100i_pro",
> +               .hwmon_info =3D dual_fan,
> +       },
> +};
> +
> +#define BULK_TIMEOUT 100
> +
> +enum opcodes {
> +       PWM_FAN_CURVE_CMD =3D 0x40,
> +       PWM_GET_CURRENT_CMD =3D 0x41,
> +       PWM_FAN_TARGET_CMD =3D 0x42,
> +       RPM_FAN_TARGET_CMD =3D 0x43,
> +};
> +
> +#define SUCCES_LENGTH 3
> +#define SUCCES_CODE 0x12, 0x34
> +
> +static bool check_succes(enum opcodes command, char ret[static SUCCES_LE=
NGTH])
> +{
> +       char success[SUCCES_LENGTH] =3D { command, SUCCES_CODE };
> +
> +       return memcmp(ret, success, SUCCES_LENGTH) =3D=3D 0;
> +}
> +
> +static int acquire_lock(struct hydro_i_pro_device *hdev)
> +{
> +       int retval =3D usb_autopm_get_interface(hdev->interface);
> +
> +       if (retval)
> +               return retval;
> +
> +       return mutex_lock_interruptible(&hdev->io_mutex);
> +}
> +
> +static int transfer_usb(struct hydro_i_pro_device *hdev,
> +                       unsigned char *send_buf, unsigned char *recv_buf,
> +                       int send_len, int recv_len)
> +{
> +       int retval;
> +       int wrote;
> +       int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> +       int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> +
> +       retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, =
&wrote,
> +                             BULK_TIMEOUT);
> +       if (retval)
> +               return retval;
> +       if (wrote !=3D send_len)
> +               return -EIO;
> +
> +       retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, =
&wrote,
> +                             BULK_TIMEOUT);
> +       if (retval)
> +               return retval;
> +       if (wrote !=3D recv_len)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> +                            struct hwmon_fan_data *fan_data,
> +                            struct curve_point point[static FAN_CURVE_CO=
UNT])
> +{
> +       int retval;
> +       unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +       unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +       send_buf[0] =3D PWM_FAN_CURVE_CMD;
> +       send_buf[1] =3D fan_data->fan_channel;
> +       send_buf[2] =3D point[0].temp;
> +       send_buf[3] =3D point[1].temp;
> +       send_buf[4] =3D point[2].temp;
> +       send_buf[5] =3D point[3].temp;
> +       send_buf[6] =3D point[4].temp;
> +       send_buf[7] =3D point[5].temp;
> +       send_buf[8] =3D point[6].temp;
> +       send_buf[9] =3D point[0].pwm;
> +       send_buf[10] =3D point[1].pwm;
> +       send_buf[11] =3D point[2].pwm;
> +       send_buf[12] =3D point[3].pwm;
> +       send_buf[13] =3D point[4].pwm;
> +       send_buf[14] =3D point[5].pwm;
> +       send_buf[15] =3D point[6].pwm;
> +
> +       retval =3D transfer_usb(hdev, send_buf, recv_buf, 16, 3);
> +       if (retval)
> +               return retval;
> +
> +       if (!check_succes(send_buf[0], recv_buf)) {
> +               dev_warn(
> +                       &hdev->udev->dev,
> +                       "failed setting fan pwm/temp curve for %s on chan=
nel %d %d,%d,%d\n",
> +                       hdev->config->name, fan_data->fan_channel, recv_b=
uf[0],
> +                       recv_buf[1], recv_buf[2]);
> +               return -EINVAL;
> +       }
> +
> +       memcpy(fan_data->curve, point, sizeof(fan_data->curve));
> +
> +       return 0;
> +}
> +
> +static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> +                             struct hwmon_fan_data *fan_data, u16 val)
> +{
> +       int retval;
> +       unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +       unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +       send_buf[0] =3D RPM_FAN_TARGET_CMD;
> +       send_buf[1] =3D fan_data->fan_channel;
> +       send_buf[2] =3D (val >> 8);
> +       send_buf[3] =3D val;
> +
> +       retval =3D transfer_usb(hdev, send_buf, recv_buf, 4, 3);
> +       if (retval)
> +               return retval;
> +
> +       if (!check_succes(send_buf[0], recv_buf)) {
> +               dev_warn(
> +                       &hdev->udev->dev,
> +                       "failed setting fan rpm for %s on channel %d %d,%=
d,%d\n",
> +                       hdev->config->name, fan_data->fan_channel, recv_b=
uf[0],
> +                       recv_buf[1], recv_buf[2]);
> +               return -EINVAL;
> +       }
> +       fan_data->fan_target =3D val;
> +       fan_data->fan_pwm_target =3D 0;
> +
> +       return 0;
> +}
> +
> +static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> +                              struct hwmon_fan_data *fan_data, long *val=
)
> +{
> +       int retval;
> +       unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +       unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +       send_buf[0] =3D PWM_GET_CURRENT_CMD;
> +       send_buf[1] =3D fan_data->fan_channel;
> +
> +       retval =3D transfer_usb(hdev, send_buf, recv_buf, 2, 6);
> +       if (retval)
> +               return retval;
> +
> +       if (!check_succes(send_buf[0], recv_buf) ||
> +           recv_buf[3] !=3D fan_data->fan_channel) {
> +               dev_warn(
> +                       &hdev->udev->dev,
> +                       "failed retrieving fan pwm for %s on channel %d %=
d,%d,%d/%d\n",
> +                       hdev->config->name, fan_data->fan_channel, recv_b=
uf[0],
> +                       recv_buf[1], recv_buf[2], recv_buf[3]);
> +               return -EINVAL;
> +       }
> +
> +       *val =3D ((recv_buf[4]) << 8) + recv_buf[5];
> +       return 0;
> +}
> +
> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +                             struct hwmon_fan_data *fan_data, u8 val)
> +{
> +       int retval;
> +       unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +       unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +       send_buf[0] =3D PWM_FAN_TARGET_CMD;
> +       send_buf[1] =3D fan_data->fan_channel;
> +       send_buf[2] =3D val;
> +
> +       retval =3D transfer_usb(hdev, send_buf, recv_buf, 3, 3);
> +       if (retval)
> +               return retval;
> +
> +       if (!check_succes(send_buf[0], recv_buf)) {
> +               dev_warn(
> +                       &hdev->udev->dev,
> +                       "failed setting fan pwm for %s on channel %d %d,%=
d,%d\n",
> +                       hdev->config->name, fan_data->fan_channel, recv_b=
uf[0],
> +                       recv_buf[1], recv_buf[2]);
> +               return -EINVAL;
> +       }
> +       fan_data->fan_target =3D 0;
> +       fan_data->fan_pwm_target =3D val;
> +
> +       return 0;
> +}
> +
> +static umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types t=
ype,
> +                               u32 attr, int channel)
> +{
> +       switch (type) {
> +       case hwmon_fan:
> +               switch (attr) {
> +               case hwmon_fan_input:
> +                       return 0444;
> +               case hwmon_fan_target:
> +                       return 0644;
> +               case hwmon_fan_min:
> +                       return 0444;
> +               case hwmon_fan_max:
> +                       return 0444;
> +               default:
> +                       break;
> +               }
> +               break;
> +       case hwmon_pwm:
> +               switch (attr) {
> +               case hwmon_pwm_input:
> +                       return 0200;
> +               case hwmon_pwm_enable:
> +                       return 0644;
> +               default:
> +                       break;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +                      u32 attr, int channel, long val)
> +{
> +       struct hwmon_data *data =3D dev_get_drvdata(dev);
> +       struct hydro_i_pro_device *hdev =3D data->hdev;
> +       struct hwmon_fan_data *fan_data;
> +       int retval =3D 0;
> +
> +       switch (type) {
> +       case hwmon_fan:
> +               switch (attr) {
> +               case hwmon_fan_target:
> +                       fan_data =3D data->channel_data[channel];
> +                       if (fan_data->mode !=3D 1)
> +                               return -EINVAL;
> +
> +                       val =3D clamp_val(val, hdev->config->rpm_min,
> +                                       hdev->config->rpm_max);
> +
> +                       retval =3D acquire_lock(hdev);
> +                       if (retval)
> +                               goto exit;
> +
> +                       retval =3D set_fan_target_rpm(hdev, fan_data, val=
);
> +                       if (retval)
> +                               goto cleanup;
> +
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +               break;
> +       case hwmon_pwm:
> +               switch (attr) {
> +               case hwmon_pwm_input:
> +                       fan_data =3D data->channel_data[channel];
> +                       if (fan_data->mode !=3D 1)
> +                               return -EINVAL;
> +
> +                       val =3D clamp_val(val, 0, hdev->config->pwm_max);
> +                       retval =3D acquire_lock(hdev);
> +                       if (retval)
> +                               goto exit;
> +
> +                       retval =3D set_fan_target_pwm(hdev, fan_data, val=
);
> +                       if (retval)
> +                               goto cleanup;
> +
> +                       break;
> +               case hwmon_pwm_enable:
> +                       fan_data =3D data->channel_data[channel];
> +
> +                       switch (val) {
> +                       case 2:
> +                       case 0:
> +                               retval =3D acquire_lock(hdev);
> +                               if (retval)
> +                                       goto exit;
> +
> +                               retval =3D set_fan_pwm_curve(hdev, fan_da=
ta,
> +                                                          DEFAULT_CURVE)=
;
> +                               if (retval)
> +                                       goto cleanup;
> +                               fan_data->mode =3D val;
> +                               break;
> +                       case 1:
> +                               retval =3D acquire_lock(hdev);
> +                               if (retval)
> +                                       goto exit;
> +
> +                               if (fan_data->fan_target !=3D 0) {
> +                                       retval =3D set_fan_target_rpm(
> +                                               hdev, fan_data,
> +                                               fan_data->fan_target);
> +                                       if (retval)
> +                                               goto cleanup;
> +                               } else if (fan_data->fan_pwm_target !=3D =
0) {
> +                                       retval =3D set_fan_target_pwm(
> +                                               hdev, fan_data,
> +                                               fan_data->fan_pwm_target)=
;
> +                                       if (retval)
> +                                               goto cleanup;
> +                               }
> +                               fan_data->mode =3D 1;
> +                               break;
> +                       default:
> +                               return -EINVAL;
> +                       }
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +cleanup:
> +       mutex_unlock(&hdev->io_mutex);
> +       usb_autopm_put_interface(hdev->interface);
> +exit:
> +       return retval;
> +}
> +
> +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +                     u32 attr, int channel, long *val)
> +{
> +       struct hwmon_data *data =3D dev_get_drvdata(dev);
> +       struct hydro_i_pro_device *hdev =3D data->hdev;
> +       struct hwmon_fan_data *fan_data;
> +       int retval =3D 0;
> +
> +       switch (type) {
> +       case hwmon_fan:
> +               switch (attr) {
> +               case hwmon_fan_input:
> +                       fan_data =3D data->channel_data[channel];
> +
> +                       retval =3D acquire_lock(hdev);
> +                       if (retval)
> +                               goto exit;
> +
> +                       retval =3D get_fan_current_rpm(hdev, fan_data, va=
l);
> +                       break;
> +               case hwmon_fan_target:
> +                       fan_data =3D data->channel_data[channel];
> +                       if (fan_data->mode !=3D 1) {
> +                               *val =3D 0;
> +                               goto exit;
> +                       }
> +                       *val =3D fan_data->fan_target;
> +                       goto exit;
> +               case hwmon_fan_min:
> +                       *val =3D hdev->config->rpm_min;
> +                       goto exit;
> +               case hwmon_fan_max:
> +                       *val =3D hdev->config->rpm_max;
> +                       goto exit;
> +
> +               default:
> +                       return -EINVAL;
> +               }
> +               break;
> +       case hwmon_pwm:
> +               switch (attr) {
> +               case hwmon_pwm_enable:
> +                       fan_data =3D data->channel_data[channel];
> +                       *val =3D fan_data->mode;
> +                       goto exit;
> +               default:
> +                       return -EINVAL;
> +               }
> +               goto exit;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       mutex_unlock(&hdev->io_mutex);
> +       usb_autopm_put_interface(hdev->interface);
> +exit:
> +       return retval;
> +}
> +
> +static const struct hwmon_ops i_pro_ops =3D {
> +       .is_visible =3D hwmon_is_visible,
> +       .read =3D hwmon_read,
> +       .write =3D hwmon_write,
> +};
> +
> +static int hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +       u8 fan_id;
> +       struct device *hwmon_dev;
> +       struct hwmon_fan_data *fan;
> +       struct hwmon_data *data;
> +       struct hwmon_chip_info *hwmon_info;
> +
> +       data =3D devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL=
);
> +       if (!data)
> +               return -ENOMEM;
> +       hwmon_info =3D
> +               devm_kzalloc(&hdev->udev->dev, sizeof(*hwmon_info), GFP_K=
ERNEL);
> +       if (!hwmon_info) {
> +               devm_kfree(&hdev->udev->dev, data);
> +               return -ENOMEM;
> +       }
> +
> +       /* You did something bad!! Either adjust  MAX_FAN_COUNT or the fa=
ncount for the config!*/
> +       WARN_ON(hdev->config->fancount >=3D MAX_PWM_CHANNEL_COUNT);
> +       data->channel_count =3D
> +               clamp_val(hdev->config->fancount, 0, MAX_PWM_CHANNEL_COUN=
T);
> +
> +       /* For each fan create a data channel a fan config entry and a pw=
m config entry */
> +       for (fan_id =3D 0; fan_id < data->channel_count; fan_id++) {
> +               fan =3D devm_kzalloc(&hdev->udev->dev, sizeof(fan), GFP_K=
ERNEL);
> +               if (!fan)
> +                       return -ENOMEM;
> +
> +               fan->fan_channel =3D fan_id;
> +               fan->mode =3D 0;
> +               data->channel_data[fan_id] =3D fan;
> +       }
> +
> +       hwmon_info->ops =3D &i_pro_ops;
> +       hwmon_info->info =3D hdev->config->hwmon_info;
> +
> +       data->hdev =3D hdev;
> +       hwmon_dev =3D devm_hwmon_device_register_with_info(
> +               &hdev->udev->dev, hdev->config->name, data, hwmon_info, N=
ULL);
> +       if (IS_ERR(hwmon_dev))
> +               return PTR_ERR(hwmon_dev);
> +
> +       dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->=
name);
> +       return 0;
> +}
> +
> +#define USB_VENDOR_ID_CORSAIR 0x1b1c
> +#define USB_PRODUCT_ID_H100I_PRO 0x0c15
> +/*
> + * Devices that work with this driver.
> + * More devices should work, however none have been tested.
> + */
> +static const struct usb_device_id astk_table[] =3D {
> +       { USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
> +         .driver_info =3D (kernel_ulong_t)&config_table[0] },
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(usb, astk_table);
> +
> +static int init_device(struct usb_device *udev)
> +{
> +       int retval;
> +
> +       /*
> +        * This is needed because when running windows in a vm with propr=
ietary driver
> +        * and you switch to this driver, the device will not respond unl=
ess you run this.
> +        */
> +       retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, =
0x40,
> +                                0xffff, 0x0000, 0, 0, 0);
> +
> +       /*this always returns error, but it required for propper initiali=
sation*/
> +       if (retval !=3D -EPIPE)
> +               return retval;
> +
> +       return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40=
,
> +                              0x0002, 0x0000, 0, 0, 0);
> +}
> +
> +static int deinit_device(struct usb_device *udev)
> +{
> +       return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40=
,
> +                              0x0004, 0x0000, 0, 0, 0);
> +}
> +
> +static void astk_delete(struct hydro_i_pro_device *hdev)
> +{
> +       usb_put_intf(hdev->interface);
> +       mutex_destroy(&hdev->io_mutex);
> +       usb_put_dev(hdev->udev);
> +}
> +
> +static int astk_probe(struct usb_interface *interface,
> +                     const struct usb_device_id *id)
> +{
> +       struct usb_device *udev =3D usb_get_dev(interface_to_usbdev(inter=
face));
> +       struct hydro_i_pro_device *hdev;
> +       int retval;
> +       struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +       hdev =3D devm_kzalloc(&udev->dev, sizeof(*hdev), GFP_KERNEL);
> +
> +       if (!hdev) {
> +               retval =3D -ENOMEM;
> +               goto exit;
> +       }
> +
> +       hdev->config =3D (const struct device_config *)id->driver_info;
> +       /* You should set the driver_info to a pointer to the correct con=
figuration!!*/
> +       WARN_ON(!hdev->config);
> +
> +       hdev->udev =3D udev;
> +       hdev->interface =3D usb_get_intf(interface);
> +       mutex_init(&hdev->io_mutex);
> +
> +       retval =3D usb_find_common_endpoints(interface->cur_altsetting, &=
bulk_in,
> +                                          &bulk_out, NULL, NULL);
> +       if (retval) {
> +               astk_delete(hdev);
> +               goto exit;
> +       }
> +
> +       /*
> +        * set up the endpoint information
> +        * use only the first bulk-in and bulk-out endpoints
> +        */
> +       hdev->bulk_in_size =3D usb_endpoint_maxp(bulk_in);
> +       hdev->bulk_in_buffer =3D
> +               devm_kzalloc(&hdev->udev->dev, hdev->bulk_in_size, GFP_KE=
RNEL);
> +       hdev->bulk_in_endpointAddr =3D bulk_in->bEndpointAddress;
> +       if (!hdev->bulk_in_buffer) {
> +               astk_delete(hdev);
> +               goto exit;
> +       }
> +
> +       hdev->bulk_out_size =3D usb_endpoint_maxp(bulk_out);
> +       hdev->bulk_out_buffer =3D
> +               devm_kzalloc(&hdev->udev->dev, hdev->bulk_out_size, GFP_K=
ERNEL);
> +       hdev->bulk_out_endpointAddr =3D bulk_out->bEndpointAddress;
> +       if (!hdev->bulk_out_buffer) {
> +               astk_delete(hdev);
> +               goto exit;
> +       }
> +
> +       retval =3D init_device(hdev->udev);
> +       if (retval) {
> +               astk_delete(hdev);
> +               goto exit;
> +       }
> +
> +       retval =3D hwmon_init(hdev);
> +       if (retval) {
> +               astk_delete(hdev);
> +               goto exit;
> +       }
> +
> +       usb_set_intfdata(interface, hdev);
> +exit:
> +       return retval;
> +}
> +
> +static void astk_disconnect(struct usb_interface *interface)
> +{
> +       struct hydro_i_pro_device *hdev =3D usb_get_intfdata(interface);
> +
> +       dev_info(&hdev->udev->dev, "removed hwmon for %s\n",
> +                hdev->config->name);
> +       deinit_device(hdev->udev);
> +       usb_set_intfdata(interface, NULL);
> +       astk_delete(hdev);
> +}
> +
> +static int astk_resume(struct usb_interface *intf)
> +{
> +       return 0;
> +}
> +
> +static int astk_suspend(struct usb_interface *intf, pm_message_t message=
)
> +{
> +       return 0;
> +}
> +
> +static struct usb_driver hydro_i_pro_driver =3D {
> +       .name =3D "hydro_i_pro_device",
> +       .id_table =3D astk_table,
> +       .probe =3D astk_probe,
> +       .disconnect =3D astk_disconnect,
> +       .resume =3D astk_resume,
> +       .suspend =3D astk_suspend,
> +       .supports_autosuspend =3D 1,
> +};
> +
> +module_usb_driver(hydro_i_pro_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
> +MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
> --
> 2.28.0
>
