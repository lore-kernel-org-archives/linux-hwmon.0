Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F96C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 14:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90BE7610A2
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 14:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhJMOkJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Oct 2021 10:40:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230015AbhJMOkI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Oct 2021 10:40:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476FF60C40;
        Wed, 13 Oct 2021 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634135885;
        bh=FJaeruQ6Tsmop2/Qhc/hCWMTG0qs0LMrMi/MFCblfeI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rOhfheJv2d+5X4qCcv9t4vBuffLTl7ay0bBcIxx6u7Xp+kkULpmL2hOaEV90apAhM
         WdoXGh5Zpha9RIBLF4riVQNVCmHbq9ekyOPT1ZJsTnYHNVuzmV0iP1dYg8IZPb6CnK
         mEhy2Hw9WU1YJP+Qw9AEx2VzIVvrgPtncFshAYC+EsWzn22N+5xOPwAOQgWRDUvwfg
         Cs815dWlurlqUYD39gst8/vOC0JdISAXHi/oYxHxBScey9zBxB8WHRc3YYzbV+OGLp
         +c9z1S/haw6UU9knKlYa///s5he6/BIx8GXlIWZBQ+FeyCXbNk5wVP3kbHZEi/Ha6t
         wRCNc/N5L0DQw==
Received: by pali.im (Postfix)
        id C4FDF7FF; Wed, 13 Oct 2021 16:38:02 +0200 (CEST)
Date:   Wed, 13 Oct 2021 16:38:02 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
Message-ID: <20211013143802.xdcnptvbwbfu7kog@pali>
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211011161101.s7lojsh2ugsnbuzh@pali>
 <06e2d014-2394-f1ff-225d-fc0afc4d6cf7@roeck-us.net>
 <80199757-dabe-cb34-ceb3-b5e134e730f0@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80199757-dabe-cb34-ceb3-b5e134e730f0@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Monday 11 October 2021 21:14:36 Armin Wolf wrote:
> Am 11.10.21 um 20:48 schrieb Guenter Roeck:
> > On 10/11/21 9:11 AM, Pali Rohár wrote:
> > > On Monday 27 September 2021 00:10:43 W_Armin@gmx.de wrote:
> > > > From: Armin Wolf <W_Armin@gmx.de>
> > > > 
> > > > The nominal speed of each fan can be obtained with
> > > > i8k_get_fan_nominal_speed(), however the result is not available
> > > > from userspace.
> > > > Change that by adding fanX_min, fanX_max and fanX_target attributes.
> > > > All are RO since fan control happens over pwm.
> > > > 
> > > > Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
> > > > 
> > > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > > ---
> > > >   Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
> > > >   drivers/hwmon/dell-smm-hwmon.c         | 61
> > > > +++++++++++++++++++++++---
> > > >   2 files changed, 58 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/Documentation/hwmon/dell-smm-hwmon.rst
> > > > b/Documentation/hwmon/dell-smm-hwmon.rst
> > > > index 3bf77a5df995..beec88491171 100644
> > > > --- a/Documentation/hwmon/dell-smm-hwmon.rst
> > > > +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> > > > @@ -34,6 +34,9 @@ Name                Perm    Description
> > > >   =============================== =======
> > > > =======================================
> > > >   fan[1-3]_input                  RO      Fan speed in RPM.
> > > >   fan[1-3]_label                  RO      Fan label.
> > > > +fan[1-3]_min                    RO      Minimal Fan speed in RPM
> > > > +fan[1-3]_max                    RO      Maximal Fan speed in RPM
> > > > +fan[1-3]_target                 RO      Expected Fan speed in RPM
> > > 
> > > Hello!
> > > 
> > > I do not know API / meaning of these 3 properties, so I looked into
> > > hwmon documentation at:
> > > https://www.kernel.org/doc/html/latest/hwmon/sysfs-interface.html#fans
> > > 
> > > And in documentation is written that both 3 properties (min, max and
> > > target) are RW.
> > > 
> > 
> > That is the expectation. That doesn't mean they _have_ to be RW.
> > It doesn't make sense to categorically demand that attributes are RW
> > if the hardware does not support it.
> > 
> > > I'm somehow lost as I have not fully understood what is the original
> > > meaning of these 3 properties. Guenter could you help?
> > > 
> > min: lower fan speed results in warning/error.
> > max: higher fan speed results in error
> > target: target fan speed. The controller should set the fan speed
> >     to this level.
> > 
> > > After reading I understood it as that these properties are for HW which
> > > supports controlling directly fan speed via RPM (and not PWM). And so
> > > user can set lower and upper limit of fan speed (via _min and _max) or
> > > can set exact RPM value (via _target).
> > > 
> > 
> > Not really. The controller can try to modify a pwm value to reach the
> > configured target fan speed. min/max values apply to both pwm and rpm
> > controlled fans.
> > 
> The reason i made fanX_target RO is that the SMM interface does not directly
> support
> setting the fan speed in rpm. Since the attributes should reflect the
> hardware implementation,
> making fanX_target RW would make no sense (at least to me).

Ok. Then patch seems to be fine.

> > > >   pwm[1-3] RW      Control the fan PWM duty-cycle.
> > > >   pwm1_enable                     WO      Enable or disable
> > > > automatic BIOS fan
> > > >                                           control (not supported
> > > > on all laptops,
> > > > diff --git a/drivers/hwmon/dell-smm-hwmon.c
> > > > b/drivers/hwmon/dell-smm-hwmon.c
> > > > index 774c1b0715d9..476f2a74bd8c 100644
> > > > --- a/drivers/hwmon/dell-smm-hwmon.c
> > > > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > > > @@ -76,6 +76,7 @@ struct dell_smm_data {
> > > >       int temp_type[DELL_SMM_NO_TEMP];
> > > >       bool fan[DELL_SMM_NO_FANS];
> > > >       int fan_type[DELL_SMM_NO_FANS];
> > > > +    int *fan_nominal_speed[DELL_SMM_NO_FANS];
> > > >   };
> > > > 
> > > >   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> > > > @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const
> > > > void *drvdata, enum hwmon_sensor_types
> > > >               if (data->fan[channel] && !data->disallow_fan_type_call)
> > > >                   return 0444;
> > > > 
> > > > +            break;
> > > > +        case hwmon_fan_min:
> > > > +        case hwmon_fan_max:
> > > > +        case hwmon_fan_target:
> > > > +            if (data->fan_nominal_speed[channel])
> > > > +                return 0444;
> > > > +
> > > >               break;
> > > >           default:
> > > >               break;
> > > > @@ -740,6 +748,25 @@ static int dell_smm_read(struct device
> > > > *dev, enum hwmon_sensor_types type, u32 a
> > > > 
> > > >               *val = ret;
> > > > 
> > > > +            return 0;
> > > > +        case hwmon_fan_min:
> > > > +            *val = data->fan_nominal_speed[channel][0];
> > > 
> > > When fan is turned off then it has speed 0 RPM. So should not be minimal
> > > fan speed always hardcoded to zero?
> > > 
> > 
> > No. Fans can be turned off on most systems/controllers. This means the
> > "minimum" fan speed would always be 0, and the attribute would be
> > worthless. In other words, "fan turned off" is always an exception.

Ok!

> I am not sure if we can assume that the fans will have 0 rpm when turned
> off.

E6440 reports 0 rpm when fan is turned off.

> Maybe some notebook model defines 100 rpm as "turned off"?

I really do not know.

> In this case we should trust the nominal speed for "off" rather than assume
> its 0 rpm.
> > > > +
> > > > +            return 0;
> > > > +        case hwmon_fan_max:
> > > > +            *val =
> > > > data->fan_nominal_speed[channel][data->i8k_fan_max];
> > > > +
> > > > +            return 0;
> > > > +        case hwmon_fan_target:
> > > > +            ret = i8k_get_fan_status(data, channel);
> > > > +            if (ret < 0)
> > > > +                return ret;
> > > > +
> > > > +            if (ret > data->i8k_fan_max)
> > > > +                ret = data->i8k_fan_max;
> > > > +
> > > > +            *val = data->fan_nominal_speed[channel][ret];
> > > > +
> > > >               return 0;
> > > >           default:
> > > >               break;
> > > > @@ -889,9 +916,12 @@ static const struct hwmon_channel_info
> > > > *dell_smm_info[] = {
> > > >                  HWMON_T_INPUT | HWMON_T_LABEL
> > > >                  ),
> > > >       HWMON_CHANNEL_INFO(fan,
> > > > -               HWMON_F_INPUT | HWMON_F_LABEL,
> > > > -               HWMON_F_INPUT | HWMON_F_LABEL,
> > > > -               HWMON_F_INPUT | HWMON_F_LABEL
> > > > +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN |
> > > > HWMON_F_MAX |
> > > > +               HWMON_F_TARGET,
> > > > +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN |
> > > > HWMON_F_MAX |
> > > > +               HWMON_F_TARGET,
> > > > +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN |
> > > > HWMON_F_MAX |
> > > > +               HWMON_F_TARGET
> > > >                  ),
> > > >       HWMON_CHANNEL_INFO(pwm,
> > > >                  HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > > > @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct
> > > > device *dev)
> > > >   {
> > > >       struct dell_smm_data *data = dev_get_drvdata(dev);
> > > >       struct device *dell_smm_hwmon_dev;
> > > > -    int i, err;
> > > > +    int i, state, err;
> > > > 
> > > >       for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
> > > >           data->temp_type[i] = i8k_get_temp_type(i);
> > > > @@ -926,8 +956,27 @@ static int __init
> > > > dell_smm_init_hwmon(struct device *dev)
> > > >           err = i8k_get_fan_status(data, i);
> > > >           if (err < 0)
> > > >               err = i8k_get_fan_type(data, i);
> > > > -        if (err >= 0)
> > > > -            data->fan[i] = true;
> > > > +
> > > > +        if (err < 0)
> > > > +            continue;
> > > > +
> > > > +        data->fan[i] = true;
> > > > +        data->fan_nominal_speed[i] = devm_kmalloc_array(dev,
> > > > data->i8k_fan_max + 1,
> > > > + sizeof(*data->fan_nominal_speed[i]),
> > > > +                                GFP_KERNEL);
> > > > +        if (!data->fan_nominal_speed[i])
> > > > +            continue;
> > > > +
> > > > +        for (state = 0; state <= data->i8k_fan_max; state++) {
> > > > +            err = i8k_get_fan_nominal_speed(data, i, state);
> > > > +            if (err < 0) {
> > > > +                /* Mark nominal speed table as invalid in case
> > > > of error */
> > > > +                devm_kfree(dev, data->fan_nominal_speed[i]);
> > > > +                data->fan_nominal_speed[i] = NULL;
> > > > +                break;
> > > > +            }
> > > > +            data->fan_nominal_speed[i][state] = err;
> > > > +        }
> > > >       }
> > > > 
> > > >       dell_smm_hwmon_dev =
> > > > devm_hwmon_device_register_with_info(dev, "dell_smm", data,
> > > > -- 
> > > > 2.20.1
> > > > 
> > 
> 
