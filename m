Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358C4C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Feb 2022 23:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbiBLXeu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Feb 2022 18:34:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbiBLXet (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Feb 2022 18:34:49 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51A85FF2B;
        Sat, 12 Feb 2022 15:34:44 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d27so21045862wrc.6;
        Sat, 12 Feb 2022 15:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5jgdcp0ayEZuo3C2MvhANngRDpudrMRaNowCUHa/s98=;
        b=gaGvQU2iy5bu2YFQH5CbfCX30I+jKNOIrxtedwM2uyEe0HPxXum0flrmpVAFJLPDZR
         CQjs7zdFZuGCc2bmC/CWUxJcAUGK/wm/bO/nU4pdcNh8ssLtvXMfY6GNHZZINDUgfcof
         yAeCiQXTDP09onQvHSAw7mrm0Vl49cm2uIkFt6v6qlWJie6h0CA0LoTjhBgWGaTyHlp6
         CxFWEdY6TALaBz3f6zA31Us3CoM27/SKGFyNoSlI1Gp4pSpAyDl2hAwuiosBZA+SpXWd
         pN2BxR//PeOK9ZdC+k4ITuKIJIim21bmASn/Iam7SDv8psnbc1e8/7Grx61gc838+gdO
         mNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5jgdcp0ayEZuo3C2MvhANngRDpudrMRaNowCUHa/s98=;
        b=Rt+9KRNrWSs1b6bMgZNnHFJc9g0IBt0NinvAN+1ZfCFtZtPEy044oofT+zfRTtc1w6
         gv2g+O+xebNkVgyPqeny24nTySH2DMVVW79zVYzwtz4n8/zhVxxVCBGVquy/qcHmGZlf
         XrbnTfHpzE1c8j1tn8yEOImjvXBn1XqR1WRqMqENK+tosPwFVLO5yKrGi789+I6nm6eX
         gGIATl2MEdDUWBx78Uz8bVqqWC+9VQo5dW5NXKUYRE11kEIf3oVysopHzMIhr66+ftFT
         YPkmf7LIMR6Zc1Keqf6vMk0w/BIDsSTp9QABfnGrDRfHEFewp5nRernJCWdC2oM2S5OY
         bnkg==
X-Gm-Message-State: AOAM532/BL88n5PC3HlnzOfE+C/5QHwnyzobm3pYdQ6c0hI/zxxKs+8E
        9GRu1/EuU2aeS4GxSUf58GmgbIxIjCCH4R6L8fA=
X-Google-Smtp-Source: ABdhPJwSbzFO/sSyhmPRbS6SS1nGVIGFiQPghmGPMK0UgPOW6IT0Bgn165Uzk/Ted8qLRgT+DG5lPidMXZMSp0Ahob0=
X-Received: by 2002:a5d:43c4:: with SMTP id v4mr6087474wrr.181.1644708883269;
 Sat, 12 Feb 2022 15:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20220206022023.376142-1-andrew.smirnov@gmail.com> <258c224c-c543-1756-4c1e-fe9d81e24e4c@roeck-us.net>
In-Reply-To: <258c224c-c543-1756-4c1e-fe9d81e24e4c@roeck-us.net>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Sat, 12 Feb 2022 15:34:31 -0800
Message-ID: <CAHQ1cqHysnfmJif4FqKeO2NV1H9euBq4jtMgeHZ1ihkFfQ8w3w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Feb 6, 2022 at 9:51 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/5/22 18:20, Andrey Smirnov wrote:
> > Add a driver exposing various bits and pieces of functionality
> > provided by Steam Deck specific VLV0100 device presented by EC
> > firmware. This includes but not limited to:
> >
> >      - CPU/device's fan control
> >      - Read-only access to DDIC registers
> >      - Battery tempreature measurements
> >      - Various display related control knobs
> >      - USB Type-C connector event notification
> >
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Mark Gross <markgross@kernel.org>
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: linux-kernel@vger.kernel.org (open list)
> > Cc: platform-driver-x86@vger.kernel.org
> > Cc: linux-hwmon@vger.kernel.org
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > ---
> >
> ...
>
>  > +config STEAMDECK
>  > +       tristate "Valve Steam Deck platform driver"
>  > +       depends on X86_64
>  > +       help
>  > +         Driver exposing various bits and pieces of functionality
>  > +     provided by Steam Deck specific VLV0100 device presented by
>  > +     EC firmware. This includes but not limited to:
>
> There seems to be some indentation issue.
>
>  > +         - CPU/device's fan control
>  > +         - Read-only access to DDIC registers
>  > +         - Battery tempreature measurements
>  > +         - Various display related control knobs
>  > +         - USB Type-C connector event notification
>  > +
>  > +     Say N unless you are running on a Steam Deck.
>  > +
>
> This doesn't depend on hwmon, yet it fails if devm_hwmon_device_register_with_info()
> returns an eror. That has a couple of problems: if HWMON=n, it won't compile,
> and if STEAMDECK=y and HWMON=m it won't compile either. You'll have to provide
> some dependency against HWMON to make this work.
>
> ...
>

Yeah, my bad, will fix.

> > +
> > +static int steamdeck_read_fan_speed(struct steamdeck *jup, long *speed)
> > +{
> > +     unsigned long long val;
> > +
> > +     if (ACPI_FAILURE(acpi_evaluate_integer(jup->adev->handle,
> > +                                            "FANR", NULL, &val)))
> > +             return -EIO;
> > +
> > +     *speed = val;
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +                  u32 attr, int channel, long *out)
> > +{
> > +     struct steamdeck *sd = dev_get_drvdata(dev);
> > +     unsigned long long val;
> > +
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             if (attr != hwmon_temp_input)
> > +                     return -EOPNOTSUPP;
> > +
> > +             if (ACPI_FAILURE(acpi_evaluate_integer(sd->adev->handle,
> > +                                                    "BATT", NULL, &val)))
> > +                     return -EIO;
> > +             /*
> > +              * Assuming BATT returns deg C we need to mutiply it
> > +              * by 1000 to convert to mC
> > +              */
> > +             *out = val * 1000;
> > +             break;
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_input:
> > +                     return steamdeck_read_fan_speed(sd, out);
>
> There is a bit of inconsistency here: All other atributes are handled directly,
> except for this one, yet there isn't really a difference in the actual operation.
> Maybe I am missing something. What is the reason for using a function here
> but not for the other attributes ?
>

It is also used to initialize "fan_target" to its initial value in
steamdeck_probe(). There's no ACPI method to read set fan target
speed, so I have to cache it in "fan_target".

> > +             case hwmon_fan_target:
> > +                     *out = sd->fan_target;
> > +                     break;
> > +             case hwmon_fan_fault:
> > +                     if (ACPI_FAILURE(acpi_evaluate_integer(
> > +                                              sd->adev->handle,
> > +                                              "FANC", NULL, &val)))
> > +                             return -EIO;
> > +                     /*
> > +                      * FANC (Fan check):
> > +                      * 0: Abnormal
> > +                      * 1: Normal
> > +                      */
> > +                     *out = !val;
> > +                     break;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> > +                         u32 attr, int channel, const char **str)
> > +{
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             *str = "Battery Temp";
> > +             break;
> > +     case hwmon_fan:
> > +             *str = "System Fan";
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +steamdeck_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > +                   u32 attr, int channel, long val)
> > +{
> > +     struct steamdeck *sd = dev_get_drvdata(dev);
> > +
> > +     if (type != hwmon_fan ||
> > +         attr != hwmon_fan_target)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (val > U16_MAX)
> > +             return -EINVAL;
>
> This accepts negative values, and it expects the user to find
> valid ranges. I suggest to use clamp_val() instead.

Will do.
