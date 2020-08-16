Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D7CC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 15:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 117AB20704
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 15:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuYIB0Z1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgHPP4E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 11:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgHPP4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 11:56:04 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB797C061786;
        Sun, 16 Aug 2020 08:56:03 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b11so7127687lfe.10;
        Sun, 16 Aug 2020 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+sSHMGJpL4kSPkNaqMdHX1Gw3wBpM+31ujMfFK2pCD0=;
        b=LuYIB0Z117yUYBovfsyvsUsbL5XFsE77LMkeMRMxEThk2SJANKO1lKFoNKOxikjig/
         de2/mtMuPJa5+nKQaJr7WNSsasSU1DDGUNfS/mBorWjMJdgNo1qEHAGP3eAlXvrmFgr4
         96m7EunRaB84K94YQQIXREl2mIiSlbSiXcwwkqWK/DRxfJO7kyh421dy9ByaJpMPQ7pr
         VxW8rkRZ03IYj5ElRCsRTTN1LojzpnKjXyDO91RCp5xiY/YF9eUHxhd4HODrx+qXK5cq
         0X5fgFKg+0V55+pOnVtqiHkq30F0zgGxPwlJokIh5U5OXwUWG+LzBN/6I/2ro9wT7xou
         2Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+sSHMGJpL4kSPkNaqMdHX1Gw3wBpM+31ujMfFK2pCD0=;
        b=S81DapMUf9dp9Omzsbu47iZ2lyRwCkMsoFLj/2H1HMsvh/aqWNZyotqNiBNSWwG4Ms
         hmlvnEYD+gsZ9vJJ6nXrqXbMr/7mDQi96VJitTFoWaMdhQ2qJla9pnT/2rYlz9WzLMWd
         9B5hAhX0iS2pW5B+mfVY2j+FRCnNXEc0TQzxxSiuO0z56hVa8TOnghIB9XIXhkh7tCfk
         fi6J1d5T73Q2+7pKZBKiSA+A+r/iU8K+NEj/PGNd0ZCQMQHoXoyYCOLF+/WhfmX1bZL3
         agQv38s0Bl0wcXhsnkBy4HkjWo/aF5r5egUlBt4yqICJbwae4V0317Jdz1gJOkFoiN8L
         e7KA==
X-Gm-Message-State: AOAM530BDlaMQdXlMsfPsEffqgW+9ZX5Rh4r2Ykwdr4sHMOr98HX37mD
        XSMXoGlaHo5dsjw4xM7AvtQxVuLSQvmycOdrKEQ=
X-Google-Smtp-Source: ABdhPJymJFpJJU22NralQjFEfKNz5Ke6xdOKxlTN5TdK8j/THqFUEk/Uka8DhnxSToYeKu5c4hlRoNj2/nwjqaKGACc=
X-Received: by 2002:a19:418a:: with SMTP id o132mr5658599lfa.63.1597593362157;
 Sun, 16 Aug 2020 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200816095500.123839-1-jaap.aarts1@gmail.com> <W-BU2h4EaZ7Mkux9N8n5gAkJqGXf2DjXOpj8ik1rbBrdMBvc_OyDzUfJZdtaZ_BXMd2qTtQksE9ptwMkYa_igP-QXqaYlDG5RaMUBVAaM54=@protonmail.com>
In-Reply-To: <W-BU2h4EaZ7Mkux9N8n5gAkJqGXf2DjXOpj8ik1rbBrdMBvc_OyDzUfJZdtaZ_BXMd2qTtQksE9ptwMkYa_igP-QXqaYlDG5RaMUBVAaM54=@protonmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 16 Aug 2020 17:55:50 +0200
Message-ID: <CACtzdJ3t_yZ+kru0djW3D8zf33eU6xOdP+TErCFCMf3zX7ycaA@mail.gmail.com>
Subject: Re: [PATCH V5] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 16 Aug 2020 at 17:23, Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.co=
m> wrote:
>
> Hello,
>
> I added a couple notes about the code inline.
>
>
> > [...]
> > +#define MAX_FAN_COUNT 2
> > +#define MAX_PWM_CHANNEL_COUNT MAX_FAN_COUNT
> > +
> > +struct hwmon_data {
> > +     struct hydro_i_pro_device *hdev;
> > +     int channel_count;
>
> This is a nitpick, but the 'channel_count' value comes from the 'fancount=
'
> of an entry of 'config_table', which has type 'u8', so I don't see any ne=
ed for
> it to be an 'int'.

In practice this will indeed never go above u8, even with a pump, didn't ca=
tch
that one

> [...]
> > +static const struct device_config config_table[] =3D {
> > +     {
> > +             .vendor_id =3D 0x1b1c,
> > +             .product_id =3D 0x0c15,
>
> If I see it correctly, you never use 'vendor_id', nor 'product_id', right=
?

This was a really sloppy patch apparently. Those were only there for findin=
g
them, so they should indeed go now.

> [...]
> > +
> > +     send_buf[0] =3D PWM_FAN_TARGET_CMD;
> > +     send_buf[1] =3D fan_data->fan_channel;
> > +     send_buf[2] =3D fan_data->fan_pwm_target;
> > +     dev_info(&hdev->udev->dev, "debug:%d,%d,%d", send_buf[0], send_bu=
f[1],
> > +              send_buf[2]);
> > +     dev_info(&hdev->udev->dev, "val:%d", fan_data->fan_pwm_target);
>
> This should be dev_dbg() in my opinion if you intend to have such message=
s.

Those weren't even supposed to go in :(

> [...]
> > +                     retval =3D acquire_lock(hdev);
> > +                     if (retval)
> > +                             goto exit;
> > +
> > +                     retval =3D set_fan_target_pwm(hdev, fan_data, val=
);
> > +                     if (retval)
> > +                             goto cleanup;
> > +
> > +                     break;
> > +             case hwmon_pwm_enable:
> > +                     fan_data =3D data->channel_data[channel];
> > +
> > +                     switch (val) {
> > +                     case 2:
> > +                     case 0:
> > +                             retval =3D acquire_lock(hdev);
> > +                             if (retval)
> > +                                     goto exit;
> > +
> > +                             retval =3D set_fan_pwm_curve(hdev, fan_da=
ta,
> > +                                                        DEFAULT_CURVE)=
;
> > +                             if (retval)
> > +                                     goto cleanup;
> > +                             fan_data->mode =3D 0;
>
> This could be 'fan_data->mode =3D val', no?

I didnt think about that, the mode can be read from userspace and
when userspace sets it to 2 they probably expect to read 2.
I usually try to use constants as much as possible instead of using
variables when the value is known, but I missed this when merging
the statements.

> [...]
> > +static int hwmon_init(struct hydro_i_pro_device *hdev)
> > +{
> > +     u8 fan_id;
> > +     struct device *hwmon_dev;
> > +     struct hwmon_fan_data *fan;
> > +     struct hwmon_data *data;
> > +     struct hwmon_chip_info *hwmon_info;
> > +
> > +     data =3D devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL=
);
> > +     hwmon_info =3D devm_kzalloc(&hdev->udev->dev,
> > +                               sizeof(struct hwmon_chip_info), GFP_KER=
NEL);
>
> I think you missed this 'sizeof' when coverting to 'sizeof(*ptr)'.

Yes, I did indeed mist that one :/

>[...]
> > +             fan->fan_channel =3D fan_id;
> > +             fan->mode =3D 0;
> > +             data->channel_data[fan_id] =3D fan;
> > +     }
> > +
> > +     hwmon_info->ops =3D &i_pro_ops;
> > +     hwmon_info->info =3D hdev->config->hwmon_info;
> > +
> > +     data->hdev =3D hdev;
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(
> > +             &hdev->udev->dev, hdev->config->name, data, hwmon_info, N=
ULL);
> > +     if (IS_ERR(hwmon_dev))
> > +             return PTR_ERR(hwmon_dev);
> > +
> > +     dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->=
name);
> > +     return 0;
> > +}
>
> It is still possible that hwmon_init() leaks memory on failure.

you mean the allocated memory doesn't get deallocated until
the driver detaches? I can't free the memory myself because
when the driver does detach it will double-free.
I have looked at how other drivers handle this, none of them
deallocate any memory.
If you mean error check the allocations, I added those now.

> [...]

Kind regards,

Jaap Aarts
