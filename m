Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F348AC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 00:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ3A3e (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 20:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3A3e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 20:29:34 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A38B197;
        Sat, 29 Oct 2022 17:29:27 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j130so10051143ybj.9;
        Sat, 29 Oct 2022 17:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vOazZ+hArbeXeFHlHwD96+0A2FKHLgPbJPcTvH4Qho=;
        b=Xwk4FJ79+kq6rwSaNQxWOK0WlD7My/69QuUTG4s5ZX91zJkCZwKDzULo0NH+Im8sld
         buJ/Tb43lv26zyedvKukcqolI6D1mCwqlOpMn7YaqIf9K01Isni0r4s8qU9bRHZRQaVP
         UJzj0SsBDLzOBm59rXJn0e7FiLzddgrZ9fQfvvUGK8wZoFQF8BWS7wT43tQHoELB/nx7
         WYdFSQZ1xt3uOMjJcPqbtfrwQt4QVKQxDOfQReDOiO3M0cpXyKn7VkU4EfuTH8zKdISn
         hKqcFlZviXlK0yfdcgaYJIOhxqvgU/u0zBE63nO+R6EhpR9cGFKS/LsfA9+uAGd7s/hb
         P0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vOazZ+hArbeXeFHlHwD96+0A2FKHLgPbJPcTvH4Qho=;
        b=e2Q+mLtv3t44h+JGicCAX6Ka7XKdZxl3JmH2/ZWE4J5Whcs56A0vNLNY158DJ5eiw6
         pMay3h68kYDIHT3YgRhcbCtp49lO14yufRMWNkdgRYQ0Ibnw1cY3zyvtM5p2Yb0LtG7Y
         IeFkcJ8duCdvKAtieZsF+u5Lx+KwKhENFhsUtR/S0m4zY2RYil+qIjHdfQH70AL3f//E
         M8oZOxLNLPFtx6QgdX+gGmNYcIXH/Hf2qEWEk4rPn1JT7y9QUHCE5UpPSmfhPJjjIGi9
         tFCREi0jQrwqL8VXmfW8oE9i4fMM82rlbrynHtMCo3S87DDJMJQZ/+A/05XQV2rIsinA
         +L7w==
X-Gm-Message-State: ACrzQf0Xu6/2XBoSWvzyjQpJ7wme3uKqYaKst7JSsAjXwNXX5chtz95y
        Jg7nnpExH3y9d9wpQt0cM4SFEoQbKgL5oPDdoEQ=
X-Google-Smtp-Source: AMsMyM5rOxVWIEDjD5u3eqrML0ArOAPNuBH/70Zf7h/S1LyCwBjNVMnwWyD5k0SRB5/FFS65XYAy9NrocMJw2TdbGA4=
X-Received: by 2002:a25:23cd:0:b0:6ca:f12e:1412 with SMTP id
 j196-20020a2523cd000000b006caf12e1412mr5905047ybj.180.1667089766335; Sat, 29
 Oct 2022 17:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221029225051.1171795-1-samsagax@gmail.com> <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
In-Reply-To: <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Sat, 29 Oct 2022 21:29:14 -0300
Message-ID: <CABgtM3jk4wuEMA1NL+WTySowokRD3XqzdSAUbkQCuLreSrvaJg@mail.gmail.com>
Subject: Re: [PATCH] Add OneXPlayer mini AMD board driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello, thanks so much to take the time for the feedback!
Maybe this one needs some clarification as for some design choices in
regards to some  of the structures you see. I know there is only one
board supported at the moment, but those structures are meant to be
the boilerplate for possibly more boards. I'm aware that these devices
are a mess and the EC registers are all over the place. I wanted to
make it easier for myself. That said I'll try to address some of the
concerns and redo the patcha according to standards :)

El s=C3=A1b, 29 oct 2022 a la(s) 20:30, Guenter Roeck (linux@roeck-us.net) =
escribi=C3=B3:
>
> On 10/29/22 15:50, Joaqu=C3=ADn Ignacio Aramend=C3=ADa wrote:
> > +
> > +static bool fan_control;
> > +module_param_hw(fan_control, bool, other, 0644);
>
> Runtime writeable parameter is unacceptable. Why would this be needed any=
way ?
> What is it supposed to accomplish that can not be done with a sysfs attri=
bute ?

Is meant for safety, I suppose, but you are right that it is better to
have the parameter non-writable at runtime.
The goal is to be able to use the fan readings without allowing the
pwm to be used unless you really know what you are doing, but I guess
there is no point in having this if already is the pwm_enable
attribute.

> > +struct oxp_ec_sensor_addr {
> > +     enum hwmon_sensor_types type;
> > +     u8 reg;
> > +     short size;
> > +     union {
> > +             struct {
> > +                     u8 enable;
> > +                     u8 val_enable;
> > +                     u8 val_disable;
> > +             };
> > +             struct {
> > +               int max_speed;
> > +             };
> > +     };
> > +};
> > +
> > +
>
> Extra empty line.

Removed. Thanks.

> > +/* AMD board EC addresses */
> > +static const struct oxp_ec_sensor_addr amd_sensors[] =3D {
> > +     [oxp_sensor_fan] =3D {
> > +             .type =3D hwmon_fan,
> > +             .reg =3D 0x76,
> > +             .size =3D 2,
> > +             .max_speed =3D 5000,
> > +     },
> > +     [oxp_sensor_pwm] =3D {
> > +             .type =3D hwmon_pwm,
> > +             .reg =3D 0x4B,
> > +             .size =3D 1,
> > +             .enable =3D 0x4A,
> > +             .val_enable =3D 0x01,
> > +             .val_disable =3D 0x00,
> > +     },
>
> I don't see the point of this data structure. There is just one
> entry. Why not use defines ?

It is one entry now, but i figured in a while there will be other
boards to support with different values. Having this structure seems
easier for future updates.
I can remove it and only use defines for now.

> > +     {},
> > +};
> > +
> > +struct ec_board_info {
> > +     const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
> > +     enum board_family family;
> > +     const struct oxp_ec_sensor_addr *sensors;
> > +};
> > +
> > +static const struct ec_board_info board_info[] =3D {
> > +     {
> > +             .board_names =3D {"ONE XPLAYER", "ONEXPLAYER mini A07"},
> > +             .family =3D family_mini_amd,
> > +             .sensors =3D amd_sensors,
> > +     },
>
> There is just one family. What is the point of this data structure ?

It is meant for expansion on other boards. I only own a OXP mini AMD,
but others exist with their own quirks. For example, the same device
but with Intel CPU has completely different EC registers, values and
ranges.
I guess i can remove the whole "family" thing and bring it back when
it is appropriate.

> > +     {}
> > +};
> > +
> > +struct oxp_status {
> > +     struct ec_board_info board;
> > +     struct lock_data lock_data;
> > +};
> > +
> > +/* Helper functions */
> > +static int read_from_ec(u8 reg, int size, long *val)
> > +{
> > +     int i;
> > +     int ret;
> > +     u8 buffer;
> > +
> > +     *val =3D 0;
> > +     for (i =3D 0; i < size; i++) {
> > +             ret =3D ec_read(reg + i, &buffer);
> > +             if (ret)
> > +                     return ret;
> > +             (*val) <<=3D i*8;
>
> space between i and 8

Ok. Will remove.

> > +             *val +=3D buffer;
> > +     }
> > +     return ret;
>
>         return 0;
>
> > +}
> > +
> > +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> > +{
> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     int ret =3D -1;
>
> unnecessary (and bad) variable initialization

Ok. Will improve on this.

> > +
> > +     if (!state->lock_data.lock(&state->lock_data)) {
> > +             dev_warn(dev, "Failed to acquire mutex");
> > +             return -EBUSY;
> > +     }
> > +
> > +     ret =3D ec_write(reg, value);
> > +
> > +     if (!state->lock_data.unlock(&state->lock_data))
> > +             dev_err(dev, "Failed to release mutex");
> > +
> > +     return ret;
> > +}
> > +
> > +/* Callbacks for hwmon interface */
> > +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> > +                                     enum hwmon_sensor_types type, u32=
 attr, int channel)
> > +{
> > +     switch (type) {
> > +             case hwmon_fan:
> > +                     return S_IRUGO;
> > +             case hwmon_pwm:
> > +                     return S_IRUGO | S_IWUSR;
>
> Please use 0444 and 0644 directly. Checkpatch will tell.

Oh. I did as the documentation suggested. I must confess I didn't run
checkpatch, will don in the next submission.

> > +             default:
> > +                     return 0;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_typ=
es type,
> > +             u32 attr, int channel, long *val)
>
> Align continuation line with '('. Checkpatch will tell.

Will do. I guess my vim settings are messed up.

> > +{
> > +     int ret =3D -1;
> > +     const struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     const struct ec_board_info *board =3D &state->board;
> > +
> > +     switch(type) {
> > +             case hwmon_fan:
> > +                     switch(attr) {
> > +                             case hwmon_fan_input:
> > +                                     ret =3D read_from_ec(board->senso=
rs[oxp_sensor_fan].reg,
> > +                                                     board->sensors[ox=
p_sensor_fan].size, val);
> > +                                     break;
> > +                             case hwmon_fan_max:
> > +                                     ret =3D 0;
> > +                                     *val =3D board->sensors[oxp_senso=
r_fan].max_speed;
> > +                                     break;
> > +                             case hwmon_fan_min:
> > +                                     ret =3D 0;
> > +                                     *val =3D 0;
> > +                                     break;
>
> If fan_max and fan_min are not sent to/from the EC, do not provide the at=
tributes.

They are not, but they are in the spec of the fan (in the attached
sticker, that is). Should I keep it if it's not read directly but has
a known value?

> > +                             default:
> > +                                     dev_dbg(dev, "Unknown attribute f=
or type %d: %d\n", type, attr);
>
> missing break;
Ooops, sorry. Will improve on this one.

> > +                     }
> > +                     return ret;
> > +             case hwmon_pwm:
> > +                     switch(attr) {
> > +                             case hwmon_pwm_input:
> > +                                     ret =3D read_from_ec(board->senso=
rs[oxp_sensor_pwm].reg,
> > +                                                     board->sensors[ox=
p_sensor_pwm].size, val);
> > +                                     if (board->family =3D=3D family_m=
ini_amd) {
> > +                                             *val =3D (*val * 255) / 1=
00;
> > +                                     }
> > +                                     break;
> > +                             case hwmon_pwm_enable:
> > +                                     ret =3D read_from_ec(board->senso=
rs[oxp_sensor_pwm].enable, 1, val);
> > +                                     if (*val =3D=3D board->sensors[ox=
p_sensor_pwm].val_enable) {
> > +                                             *val =3D 1;
> > +                                     } else {
> > +                                             *val =3D 0;
> > +                                     }
>
> Unnecessary { }. Checkpatch would tell.
>
> I don't see the point of this code. Why have board->sensors[oxp_sensor_pw=
m].val_enable
> to start with ? It is 1. Can the EC return something else ? If so, what i=
s the
> rationale to map it to 0 ?
>
The enable/disable values are configurable, since they can vary from
board to board. AMD happens to be just 1 and 0, so it fits in this
case. My goal is to map them to 1 and 0 to be exposed in the same way
across all devices. That way userspace tools like fancontrold can use
this interface as is.

> > +                                     break;
> > +                             default:
> > +                                     dev_dbg(dev, "Unknown attribute f=
or type %d: %d\n", type, attr);
>
> missing break;
Oops, will correct. Thanks

> > +                     }
> > +                     return ret;
> > +             default:
> > +                     dev_dbg(dev, "Unknown sensor type %d.\n", type);
> > +                     return -1;
>
> bad error code.
Should I return EINVAL in this case? Seems appropriate reading error
code headers.

> > +     }
> > +}
> > +
> > +static int oxp_pwm_enable(const struct device *dev)
> > +{
> > +     int ret =3D -1;
>
> Unnecessary (and bad) variable initialization.

Ok. Will improve.

> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     const struct ec_board_info *board =3D &state->board;
> > +
> > +     if (!fan_control) {
> > +             dev_info(dev, "Can't enable pwm, fan_control=3D0");
> > +             return -EPERM;
> > +     }
> > +
> > +     ret =3D write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
> > +             board->sensors[oxp_sensor_pwm].val_enable);
> > +
> > +     return ret;
>
> ... and unnecessary variable.
Then I would just  do
    return write_to_ec():
as stated below.

> > +}
> > +
> > +static int oxp_pwm_disable(const struct device *dev)
> > +{
> > +     int ret =3D -1;
>
> Unnecessary initialization, and bad error code.

Seems like I really like to mess this up, really... Sorry.

> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     const struct ec_board_info *board =3D &state->board;
> > +
> > +     if (!fan_control) {
> > +             dev_info(dev, "Can't disable pwm, fan_control=3D0");
> > +             return -EPERM;
> > +     }
>
> I really don't see the point of the "fan_control" module parameter.
> One can set it to 1 (or true) to enable the pwm_enable attribute,
> or set it to 0 to disable it. It is effectively the same as just
> another attribute, forcing users to write two attributes instead
> of one. That really doesn't make sense.
>
Ok. I can remove the `fan_control` parameter entirely and just leave
it to the userspace to handle pwm_enable without any other safeguards.

> > +
> > +     ret =3D write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
> > +             board->sensors[oxp_sensor_pwm].val_disable);
> > +
> > +     return ret;
>
> Just
>         return write_to_ec(...);
>
> would do. There is no need for the ret variable. Same elsewhere.
>
Same as above, so I'll just do this.

> > +}
> > +
> > +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +             u32 attr, int channel, long val)
> > +{
> > +     int ret =3D -1;
>
> bad error code.
Ok. Will improve on this.

> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     const struct ec_board_info *board =3D &state->board;
> > +
> > +     switch(type) {
> > +             case hwmon_pwm:
> > +                     if (!fan_control) {
> > +                             dev_info(dev, "Can't control fans, fan_co=
ntrol=3D0");
> > +                             return -EPERM;
> > +                     }
> > +                     switch(attr) {
> > +                             case hwmon_pwm_enable:
> > +                                     if (val =3D=3D 1) {
> > +                                             ret =3D oxp_pwm_enable(de=
v);
> > +                                     } else if (val =3D=3D 0) {
> > +                                             ret =3D oxp_pwm_disable(d=
ev);
> > +                                     } else {
> > +                                             return -EINVAL;
> > +                                     }
>
> Unnecessary { }, and the single return on error instead of
>                                                 ret =3D -EINVAL;
> is inconsistent.
Ok. Will improve on this one.

> > +                                     return ret;
> > +                             case hwmon_pwm_input:
> > +                                     if (val < 0 || val > 255)
> > +                                             return -EINVAL;
> > +                                     if (board->family =3D=3D family_m=
ini_amd)
> > +                                             val =3D (val * 100) / 255=
;
> > +                                     ret =3D write_to_ec(dev, board->s=
ensors[oxp_sensor_pwm].reg, val);
> > +                                     return ret;
> > +                             default:
> > +                                     dev_dbg(dev, "Unknown attribute f=
or type %d: %d", type, attr);
> > +                                     return ret;
> > +                     }
> > +             default:
> > +                     dev_dbg(dev, "Unknown sensor type: %d", type);
>
> break missing
Oops... noted.

> > +     }
> > +     return ret;
> > +}
> > +
> > +/* Known sensors in the OXP EC controllers */
> > +static const struct hwmon_channel_info *oxp_platform_sensors[] =3D {
> > +     HWMON_CHANNEL_INFO(fan,
> > +             HWMON_F_INPUT | HWMON_F_MAX | HWMON_F_MIN),
> > +     HWMON_CHANNEL_INFO(pwm,
> > +             HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>
> bad alignment. Please use checkpatch --strict and fix what it reports.
Will do, sorry.

> > +     NULL
> > +};
> > +
> > +static const struct hwmon_ops oxp_ec_hwmon_ops =3D {
> > +     .is_visible =3D oxp_ec_hwmon_is_visible,
> > +     .read =3D oxp_platform_read,
> > +     .write =3D oxp_platform_write,
> > +};
> > +
> > +static const struct hwmon_chip_info oxp_ec_chip_info =3D {
> > +     .ops =3D &oxp_ec_hwmon_ops,
> > +     .info =3D oxp_platform_sensors,
> > +};
> > +
> > +/* Initialization logic */
> > +static const struct ec_board_info * __init get_board_info(struct devic=
e *dev)
> > +{
> > +     const char *dmi_board_vendor =3D dmi_get_system_info(DMI_BOARD_VE=
NDOR);
> > +     const char *dmi_board_name =3D dmi_get_system_info(DMI_BOARD_NAME=
);
> > +     const struct ec_board_info *board;
> > +
> > +     if (!dmi_board_vendor || !dmi_board_name ||
> > +         (strcasecmp(dmi_board_vendor, "ONE-NETBOOK TECHNOLOGY CO., LT=
D.") &&
> > +          strcasecmp(dmi_board_vendor, "ONE-NETBOOK")))
> > +             return NULL;
> > +
> > +     /* Match our known boards */
> > +     /* Need to check for AMD/Intel here */
> > +     for (board =3D board_info; board->sensors; board++) {
> > +             if (match_string(board->board_names,
> > +                              MAX_IDENTICAL_BOARD_VARIATIONS,
> > +                              dmi_board_name) >=3D 0) {
> > +                     if (board->family =3D=3D family_mini_amd &&
> > +                                     boot_cpu_data.x86_vendor =3D=3D X=
86_VENDOR_AMD) {
> > +                             return board;
> > +                     }
> > +             }
> > +     }
> > +     return NULL;
>
> Why not use a dmi match table for the above code ?
I could use a dmi match table.

> > +}
> > +
> > +static int __init oxp_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device *hwdev;
> > +     const struct ec_board_info *pboard_info;
> > +     struct oxp_status *state;
> > +
> > +     pboard_info =3D get_board_info(dev);
> > +     if (!pboard_info)
> > +             return -ENODEV;
> > +
> > +     state =3D devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL=
);
> > +     if (!state)
> > +             return -ENOMEM;
> > +
> > +     state->board =3D *pboard_info;
> > +
> > +     state->lock_data.mutex =3D 0;
> > +     state->lock_data.lock =3D lock_global_acpi_lock;
> > +     state->lock_data.unlock =3D unlock_global_acpi_lock;
> > +
> > +     hwdev =3D devm_hwmon_device_register_with_info(dev, "oxpec", stat=
e,
> > +                                                     &oxp_ec_chip_info=
, NULL);
> > +
> > +     return PTR_ERR_OR_ZERO(hwdev);
>
> This only configures a hwmon driver and thus should reside in the hwmon
> subsystem/directory.

For now yes, it only provides hwmon. I'll move to it then.

> > +}
> > +
> > +static const struct acpi_device_id acpi_ec_ids[] =3D {
> > +     /* Embedded Controller Device */
> > +     { "PNP0C09", 0 },
> > +     {}
> > +};
>
> I am not sure if this works. There are other drivers mapping to the same =
ACPI ID;
> those may refuse to load if this driver is in the system. We had problems=
 with
> this before, so I am very concerned about side effects.

So should I just remove this and go for the DMI match table instead?

> > +
> > +static struct platform_driver oxp_platform_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "oxp-platform",
> > +             .acpi_match_table =3D acpi_ec_ids,
> > +     },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(acpi, acpi_ec_ids);
> > +module_platform_driver_probe(oxp_platform_driver, oxp_platform_probe);
> > +
> > +MODULE_AUTHOR("Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com=
>");
> > +MODULE_DESCRIPTION(
> > +     "Platform driver that handles ACPI EC of OneXPlayer devices");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.38.1
> >
>

Thanks very much for taking the time.

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
