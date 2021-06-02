Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21904C47092
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 10:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D766023F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 10:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhFBKui (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 06:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFBKtk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 06:49:40 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE6BC061344
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Jun 2021 03:47:53 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id v142so1784245oie.9
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Jun 2021 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cg0cU71JiGkReKNwYWu+jgy4YBtr5Slp6vbHdEwRGeM=;
        b=Pxq5KbqHnxdq4AjX4xr2xmdcwtgEQwz4r9RA7mPavy2TjNwMM54g5EIGqZ5eOabb7Y
         yzl+ORWFW7ic9s360qRAix+02ZRAKPrUPoc1WJyVDvsMxFDFqEsjwj6P5f3F4yUfCYU+
         BquH8SdOZk43KKiufs4DvEU0hbLCFPJG/nnxZ3xEYjIKqwxYQmO56+3RJd1E/xvGydu4
         TtoqGVqvn08fwUCK3pUXbMIVTLp65CBQVg9CSZPTQb8DwC3anrOFCLkyJF4prceKrzw9
         Zq/1ziTpsVEwlX1XWwOMuZle6Wb3QnNfqobFFf7S8H5mLYek2JokqjcQoVEfNFENbN0L
         Wj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Cg0cU71JiGkReKNwYWu+jgy4YBtr5Slp6vbHdEwRGeM=;
        b=A+IRhF2KLX8CYusBsPwRtx0ofrHeo0N/ykqC9bAw+AtzLLsT5Ian/rwIuB5JVxmQsp
         EtsHX0g9LO7RCDTQks6JxewiHJKUGbBYR59GEhojN7RspT1a+pV5HI3kpRk2upv1PLjX
         9roWuQn+MtR8xVQIdkkihGlaI2KcvME7dh1qgm1JAXX7HAFJnQavUS7zvlN9weET3LGx
         8Z6rNFuWI8cOpHOy7tU6tbgl3U2/hhfmyBMU7Bl7Jvggmy5aJYSM5vac6DqzV9olQXCt
         hMCz6sFMDJM5rJJBIpZiIjw3kipWVu+hQ+z9yLrB5cIy4lLvvXsPHMXEUvT1LedX/IAi
         mceA==
X-Gm-Message-State: AOAM533Jkw3Fbx/7ZAdJX8dCSyYDGQKEQMFz+4aqyyGMROrbg5jb1tMM
        gpkWg3hJw4n8XQk9iGAcOUc=
X-Google-Smtp-Source: ABdhPJwEBUNglEjdB3aGWh0QenddDrcTP9LlS/4CrFXPwfF5lO/+sfXrhFJWwp40xZQAUHh4aGWLEA==
X-Received: by 2002:a05:6808:87:: with SMTP id s7mr4593925oic.106.1622630872544;
        Wed, 02 Jun 2021 03:47:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l141sm4059642oib.44.2021.06.02.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:47:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:47:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?V=E1clav_Kubern=E1t?= <kubernat@cesnet.cz>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 3/7] hwmon: (max31790) Fix pwmX_enable attributes
Message-ID: <20210602104750.GD1865238@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-4-linux@roeck-us.net>
 <CABKa3nqZ0Z-Dce-W9RciyCGHgRaR_cVRPitP6=RV_P8BUbJgnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABKa3nqZ0Z-Dce-W9RciyCGHgRaR_cVRPitP6=RV_P8BUbJgnA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 01, 2021 at 10:01:20AM +0200, Václav Kubernát wrote:
> pwmX_enable 0 and 1 work fine, but it seems like RPM mode is currently
> still unusable. I am testing with Sunon PF36281BX-000U-S99. Setting
> almost any kind of RPM, from low (about 2500) and high (maximum is
> 23000), the RPM never stabilizes. I think this is mainly because the
> driver currently doesn't work with the "window" and "pwm rate of
> change" registers.
> 
Correct. I made the same observation. Please feel free to suggest attributes
or some other solution to address the above problems.

Thanks,
Guenter

> Tested-by: Václav Kubernát <kubernat@cesnet.cz>
> 
> st 26. 5. 2021 v 17:40 odesílatel Guenter Roeck <linux@roeck-us.net> napsal:
> >
> > pwmX_enable supports three possible values:
> >
> > 0: Fan control disabled. Duty cycle is fixed to 0%
> > 1: Fan control enabled, pwm mode. Duty cycle is determined by
> >    values written into Target Duty Cycle registers.
> > 2: Fan control enabled, rpm mode
> >    Duty cycle is adjusted such that fan speed matches
> >    the values in Target Count registers
> >
> > The current code does not do this; instead, it mixes pwm control
> > configuration with fan speed monitoring configuration. Worse, it
> > reports that pwm control would be disabled (pwmX_enable==0) when
> > it is in fact enabled in pwm mode. Part of the problem may be that
> > the chip sets the "TACH input enable" bit on its own whenever the
> > mode bit is set to RPM mode, but that doesn't mean that "TACH input
> > enable" accurately reflects the pwm mode.
> >
> > Fix it up and only handle pwm control with the pwmX_enable attributes.
> > In the documentation, clarify that disabling pwm control (pwmX_enable=0)
> > sets the pwm duty cycle to 0%. In the code, explain why TACH_INPUT_EN
> > is set together with RPM_MODE.
> >
> > While at it, only update the configuration register if the configuration
> > has changed, and only update the cached configuration if updating the
> > chip configuration was successful.
> >
> > Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
> > Cc: Václav Kubernát <kubernat@cesnet.cz>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  Documentation/hwmon/max31790.rst |  2 +-
> >  drivers/hwmon/max31790.c         | 41 ++++++++++++++++++++------------
> >  2 files changed, 27 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
> > index 54ff0f49e28f..7b097c3b9b90 100644
> > --- a/Documentation/hwmon/max31790.rst
> > +++ b/Documentation/hwmon/max31790.rst
> > @@ -38,7 +38,7 @@ Sysfs entries
> >  fan[1-12]_input    RO  fan tachometer speed in RPM
> >  fan[1-12]_fault    RO  fan experienced fault
> >  fan[1-6]_target    RW  desired fan speed in RPM
> > -pwm[1-6]_enable    RW  regulator mode, 0=disabled, 1=manual mode, 2=rpm mode
> > +pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
> >  pwm[1-6]           RW  read: current pwm duty cycle,
> >                         write: target pwm duty cycle (0-255)
> >  ================== === =======================================================
> > diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> > index 693497e09ac0..67677c437768 100644
> > --- a/drivers/hwmon/max31790.c
> > +++ b/drivers/hwmon/max31790.c
> > @@ -27,6 +27,7 @@
> >
> >  /* Fan Config register bits */
> >  #define MAX31790_FAN_CFG_RPM_MODE      0x80
> > +#define MAX31790_FAN_CFG_CTRL_MON      0x10
> >  #define MAX31790_FAN_CFG_TACH_INPUT_EN 0x08
> >  #define MAX31790_FAN_CFG_TACH_INPUT    0x01
> >
> > @@ -271,12 +272,12 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
> >                 *val = data->pwm[channel] >> 8;
> >                 return 0;
> >         case hwmon_pwm_enable:
> > -               if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
> > +               if (fan_config & MAX31790_FAN_CFG_CTRL_MON)
> > +                       *val = 0;
> > +               else if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
> >                         *val = 2;
> > -               else if (fan_config & MAX31790_FAN_CFG_TACH_INPUT_EN)
> > -                       *val = 1;
> >                 else
> > -                       *val = 0;
> > +                       *val = 1;
> >                 return 0;
> >         default:
> >                 return -EOPNOTSUPP;
> > @@ -307,23 +308,33 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
> >         case hwmon_pwm_enable:
> >                 fan_config = data->fan_config[channel];
> >                 if (val == 0) {
> > -                       fan_config &= ~(MAX31790_FAN_CFG_TACH_INPUT_EN |
> > -                                       MAX31790_FAN_CFG_RPM_MODE);
> > +                       fan_config |= MAX31790_FAN_CFG_CTRL_MON;
> > +                       /*
> > +                        * Disable RPM mode; otherwise disabling fan speed
> > +                        * monitoring is not possible.
> > +                        */
> > +                       fan_config &= ~MAX31790_FAN_CFG_RPM_MODE;
> >                 } else if (val == 1) {
> > -                       fan_config = (fan_config |
> > -                                     MAX31790_FAN_CFG_TACH_INPUT_EN) &
> > -                                    ~MAX31790_FAN_CFG_RPM_MODE;
> > +                       fan_config &= ~(MAX31790_FAN_CFG_CTRL_MON | MAX31790_FAN_CFG_RPM_MODE);
> >                 } else if (val == 2) {
> > -                       fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN |
> > -                                     MAX31790_FAN_CFG_RPM_MODE;
> > +                       fan_config &= ~MAX31790_FAN_CFG_CTRL_MON;
> > +                       /*
> > +                        * The chip sets MAX31790_FAN_CFG_TACH_INPUT_EN on its
> > +                        * own if MAX31790_FAN_CFG_RPM_MODE is set.
> > +                        * Do it here as well to reflect the actual register
> > +                        * value in the cache.
> > +                        */
> > +                       fan_config |= (MAX31790_FAN_CFG_RPM_MODE | MAX31790_FAN_CFG_TACH_INPUT_EN);
> >                 } else {
> >                         err = -EINVAL;
> >                         break;
> >                 }
> > -               data->fan_config[channel] = fan_config;
> > -               err = i2c_smbus_write_byte_data(client,
> > -                                       MAX31790_REG_FAN_CONFIG(channel),
> > -                                       fan_config);
> > +               if (fan_config != data->fan_config[channel]) {
> > +                       err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
> > +                                                       fan_config);
> > +                       if (!err)
> > +                               data->fan_config[channel] = fan_config;
> > +               }
> >                 break;
> >         default:
> >                 err = -EOPNOTSUPP;
> > --
> > 2.25.1
> >
