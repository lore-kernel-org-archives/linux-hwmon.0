Return-Path: <SRS0=mGkJ=BZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BE6C433E4
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CAE3205CB
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci+m7YM5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgHOVvD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 17:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgHOVuy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 17:50:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F262C02B8F0;
        Sat, 15 Aug 2020 05:31:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y2so3633149ljc.1;
        Sat, 15 Aug 2020 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RrMi1MqbXlIcaxZuOBs/M4a1YXwj1Dzj90t1UCF8Sug=;
        b=ci+m7YM5IOe6FPek7Zs1wMASEl3moRv+/tFWqoQYfpnrWHGtRMhVQjCbNLnPx02Lq3
         Oji2JmJJXZtN6i4iK+bBJj535SjU0i1agK3ENepY6cGq+8urT+BHbLLEX2ZS/T0rfXlz
         5iFlE/HPXjcWy7Lm9PSBfWSM0tnIoid3shw39jUTzN94vywZm3YpzzFrNS45IkZf9sGf
         /TcLFjEFiwYS5DjNmMlCNT0MTyhPio9ET7P71u9AKjPPKIiQ3ke/PKN36NDZfNgDuute
         rSd8k+OJjbsFMEcEhVvxV63U43emBQ9RjVPcHbL96c9nTQh/ibcZOH2sh0AbrjxtdiX3
         m3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RrMi1MqbXlIcaxZuOBs/M4a1YXwj1Dzj90t1UCF8Sug=;
        b=kLXhGhQ2QGhm/CmxwlYVyNZde+dKvhZmS2nBLzzOE1joY1aXbXmXVVi3NGtQ6vN6S+
         MIeQHIN9+lVJZBLP5X5477LpfnktMSAPL5kqRYEZEtu5Nxes5BQexZ+PeICCzCpMKTXI
         JrpEaxL3W16HtwnrBbVd14Q5DE9HLU/qNG3kcUKRAtj6eXcw8Cjx5bFq55qP+Jnn174L
         ts6uI1Lk8pxx5HSTxfGihgPjA0isrP7tRnNKjzVUVKKI5nL2gu5w1q8BaF7vCzVo28bB
         ZW7iS5fY+iUCnlOi4JflHEarB0cFZc8YNz1jA7JhgGv/lsydcfOr1R4JWujmhn8cvS6e
         JOcA==
X-Gm-Message-State: AOAM5328Mu9iEm9Cgq80RHy89nkB0udkc+rhj8vJQyKZPxU39QEu3lFI
        vUWeywh4zLVmPHdVeNErqueqQ4TAj9M+cjFIfKQ=
X-Google-Smtp-Source: ABdhPJx2eUOtlrq2a/7l6Tu0Wnv0I8FU84A8Zz0uYrfJMhW+eVnuovtSTyme4T33YJNxZEfvXnM3NVkWuPz92zsl62k=
X-Received: by 2002:a2e:3817:: with SMTP id f23mr3162713lja.118.1597494707708;
 Sat, 15 Aug 2020 05:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200814194202.327141-1-jaap.aarts1@gmail.com> <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com>
In-Reply-To: <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sat, 15 Aug 2020 14:31:36 +0200
Message-ID: <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 15 Aug 2020 at 01:30, Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.co=
m> wrote:
Thanks for the quick response, I implemented most of the
items you talked about.

> > + *
> > + * Note: fan curve control has not been implemented
> > + */
> > +
> > +#include <linux/errno.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb.h>
> > +
> > +struct device_config {
> > +     u16 vendor_id;
> > +     u16 product_id;
> > +     u8 fancount;
>
> I think you could be more consistent. Later in the code you use 'uin8_t'.
> I'd choose one type of fixed-width integer (either {u,s}N or [u]intN_t),
> and stick with it.

Changed all the int values to be the correct size and using uN.

> > +     const struct hwmon_channel_info **hwmon_info;
> > +};
> > +
> > +struct hydro_i_pro_device {
> > +     struct usb_device *udev;
> > +
> > +     const struct device_config *config;
> > +
> > +     unsigned char *bulk_out_buffer;
> > +     char *bulk_in_buffer;
>
> Any reason why these two have different sizes? You cast both to
> 'unsigned char*' in set_fan_target_rpm(), set_fan_pwm_curve(), etc.

I am not sure what you mean by this, I should probably make the type
consistent between them, is that what you mean by "size"?

> As far as I see every device has two buffers for bulk in/out operations.
> Isn't it possible that - when multiple processes - try to interact with
> the sysfs attributes, more than one USB transactions use the same IO
> buffers? I suspect that could lead to data corruption.

Yes, I switched to using just a mutex, I saw this being used in the
usb_skel driver. I was told earlier to remove the mutex and keep the
semaphore, but a mutex makes more sense to me as well.
Fixed 2 bugs along the way!

> > +};
> > +
> > +struct hwmon_data {
> > +     struct hydro_i_pro_device *hdev;
> > +     int channel_count;
> > +     void **channel_data;
>
> Why is this 'void**'? As far as I see this could be 'struct hwmon_fan_dat=
a**'.

No, I will have to add something like `hwmon_pump_data` for pump informatio=
n.
This will also have to use fan/rpm hwmon interfaces so will share the same
channel range as `hwmon_fan_data`. This way I can just use channelnr as ind=
ex.
If I made pump a separate array/value(it's almost always one pump) I could =
no
longer just use channelnr as index.
If you are against this then I can change it, but it is a deliberate
choice to make it
void and not an accident.

> But personally I'd use the "flexible array member" feature of C to deal w=
ith this,
> or even just a static array that's just big enough.

The "flexible array member" seems to give little benefit over what I
am doing right
now. Since there are at most 3 fans and 1 pump in a realistic
configuration a static
array doesn't seem that bad actually.

> > +};
> > +
> > +struct curve_point {
> > +     uint8_t temp;
> > +     uint8_t pwm;
> > +};
> > +
> > +struct hwmon_fan_data {
> > +     char fan_channel;
> > +     long fan_target;
> > +     unsigned char fan_pwm_target;
>
> This is very nitpicky, but any reason why is it not 'uint8_t' like above?
> This applies to other variables as well, I think some variables are too b=
ig for what they store,
> or have a sign, when they could be unsigned.

I moved all the pwm values to u8, and a;ll rpm values to u16(as they
can't be any bigger)
I usually don't really write c code, all the different types for the
same thing confuse me in
which one to use.

> > +     long mode;
>
> If the only valid modes are 0, 1, and 2, why the 'long'?

Also moved to u8.

> > +}
> > +
> > +static const struct device_config *get_device_configuration(u16 vendor=
_id,
> > +                                                         u16 product_i=
d)
> > +{
> > +     const struct device_config *config;
> > +     int i =3D 0;
> > +     int n =3D ARRAY_SIZE(config_table);
> > +     for (i =3D 0; i < n; i++) {
> > +             config =3D &config_table[i];
> > +             if (config->vendor_id =3D=3D vendor_id &&
> > +                 config->product_id =3D=3D product_id) {
> > +                     return config;
> > +             }
> > +     }
> > +     return config;
> > +}
> > +
>
> I think this can be gotten rid of by utilizing the "driver_info" field of=
 the
> usb_device_id struct as seen in drivers/usb/serial/visor.c. That way you =
could
> store a pointer or an index, and there would be no need to do any lookup.=
 Like this:
>
> { USB_DEVICE(VID, PID), .driver_info =3D (kernel_ulong_t) &config_table[0=
] }

That is nice!

> > +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> > +                          struct hwmon_fan_data *fan_data,
> > +                          struct curve_point point[7])
> > +{
> > +     int retval;
> > +     int wrote;
> > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > +
> > +     memcpy(fan_data->curve, point, sizeof(fan_data->curve));
> > +
> > +     send_buf[0] =3D PWM_FAN_CURVE_CMD;
> > +     send_buf[1] =3D fan_data->fan_channel;
> > +     send_buf[2] =3D point[0].temp;
> > +     send_buf[3] =3D point[1].temp;
> > +     send_buf[4] =3D point[2].temp;
> > +     send_buf[5] =3D point[3].temp;
> > +     send_buf[6] =3D point[4].temp;
> > +     send_buf[7] =3D point[5].temp;
> > +     send_buf[8] =3D point[6].temp;
> > +     send_buf[9] =3D point[0].pwm;
> > +     send_buf[10] =3D point[1].pwm;
> > +     send_buf[11] =3D point[2].pwm;
> > +     send_buf[12] =3D point[3].pwm;
> > +     send_buf[13] =3D point[4].pwm;
> > +     send_buf[14] =3D point[5].pwm;
> > +     send_buf[15] =3D point[6].pwm;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 16, &wrote=
,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 4, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     if (!check_succes(send_buf[0], recv_buf)) {
> > +             dev_info(&hdev->udev->dev,
> > +                      "[*] failed setting fan curve %d,%d,%d/%d\n",
> > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[=
3]);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> > +                           struct hwmon_fan_data *fan_data, long val)
> > +{
> > +     int retval;
> > +     int wrote;
> > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> > +
> > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > +
> > +     fan_data->fan_target =3D val;
> > +     fan_data->fan_pwm_target =3D 0;
> > +
> > +     send_buf[0] =3D RPM_FAN_TARGET_CMD;
> > +     send_buf[1] =3D fan_data->fan_channel;
> > +     send_buf[2] =3D (fan_data->fan_target >> 8);
> > +     send_buf[3] =3D fan_data->fan_target;
>
> As far as I see 'fan_data->fan_target' is an unsigned 16 bit number, so a=
nything that is
> out of range should be rejected  - preferably in hwmon_write() - with -EI=
NVAL in my opinion,
> since 'fan_data->fan_target' may not accurately represent the state of th=
e hardware
> if other values are allowed.
>
> The lack of range checking applies to other parts of the code as well.

I put range checks around all input -> fan/pwm target conversions, if
you found any other
places let me know.

> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     if (!check_succes(send_buf[0], recv_buf)) {
> > +             dev_info(&hdev->udev->dev,
> > +                      "[*] failed setting fan rpm %d,%d,%d/%d\n",
> > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[=
3]);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> > +                            struct hwmon_fan_data *fan_data, long *val=
)
> > +{
> > +     int retval;
> > +     int wrote;
> > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> > +
> > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > +
> > +     send_buf[0] =3D PWM_GET_CURRENT_CMD;
> > +     send_buf[1] =3D fan_data->fan_channel;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 2, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     if (!check_succes(send_buf[0], recv_buf) ||
> > +         recv_buf[3] !=3D fan_data->fan_channel) {
> > +             dev_info(&hdev->udev->dev,
> > +                      "[*] failed retrieving fan rmp %d,%d,%d/%d\n",
> > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[=
3]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     *val =3D ((recv_buf[4]) << 8) + recv_buf[5];
> > +     return 0;
> > +}
> > +
> > +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> > +                           struct hwmon_fan_data *fan_data, long val)
> > +{
> > +     int retval;
> > +     int wrote;
> > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> > +
> > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > +
> > +     fan_data->fan_pwm_target =3D val;
> > +     fan_data->fan_target =3D 0;
> > +
> > +     send_buf[0] =3D PWM_FAN_TARGET_CMD;
> > +     send_buf[1] =3D fan_data->fan_channel;
> > +     send_buf[3] =3D fan_data->fan_pwm_target;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     if (!check_succes(send_buf[0], recv_buf)) {
> > +             dev_info(&hdev->udev->dev,
> > +                      "[*] failed setting fan pwm %d,%d,%d/%d\n",
> > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[=
3]);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
>
> The previous four functions are structurally more or less the same,
> I think the USB related parts could be placed into their own dedicated fu=
nction.

I could, but the only part that could actually be split up is the usb_bulk_=
msg.
If I would remove the error code that part could also be split up.
Are there any conventions around what to log/not to log? Maybe it is best t=
o
remove those log messages anyways.

> > +
> > +     data->channel_count =3D hdev->config->fancount;
> > +     data->channel_data =3D
> > +             devm_kzalloc(&hdev->udev->dev,
> > +                          sizeof(char *) * data->channel_count, GFP_KE=
RNEL);
>
> This should be 'sizeof(fan)' or 'sizeof(struct hwmon_fan_data*)', no?

Irrelevant since I moved to a fixed-size array.

> > +
> > +     /* For each fan create a data channel a fan config entry and a pw=
m config entry */
> > +     for (fan_id =3D 0; fan_id <=3D data->channel_count; fan_id++) {
> > +             fan =3D devm_kzalloc(&hdev->udev->dev,
> > +                                sizeof(struct hwmon_fan_data), GFP_KER=
NEL);
> > +             fan->fan_channel =3D fan_id;
> > +             fan->mode =3D 2;
>
> Can't it be queried what the mode actually is?

Maybe?? I don't actually know, would take some debugging/wireshark to
figure out.
(there were some problems with wireshark and starting the windows
driver from what I
remember, so might not be possible to find out) by default it uses the
dafault profile
present in the driver. Only if another program interferes with the
device would this not
match.

> > +
> > +     hwmon_info->ops =3D &i_pro_ops;
> > +     hwmon_info->info =3D hdev->config->hwmon_info;
> > +
> > +     data->hdev =3D hdev;
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(
> > +             &hdev->udev->dev, "driver_fan", data, hwmon_info, NULL);
>
> Personally, I'd choose a different name, since "driver_fan" is not really
> descriptive.

I just made the name be part of the device config, this way its device
specific.

> > +     {},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(usb, astk_table);
> > +
> > +static int init_device(struct usb_device *udev)
> > +{
> > +     int retval;
> > +
> > +     /*
> > +      * This is needed because when running windows in a vm with propr=
ietary driver
> > +      *and you switch to this driver, the device will not respond unle=
ss you run this.
>           ^
> Very nitpicky, but a space is missing there.

I knew I missed one of them! :(

> > +     }
> > +
> > +     hwmon_init(hdev);
> > +
> > +     usb_set_intfdata(interface, hdev);
> > +     sema_init(&hdev->limit_sem, 8);
> > +exit:
> > +     return retval;
> > +}
> > +
> > +static void astk_disconnect(struct usb_interface *interface)
> > +{
> > +     struct hydro_i_pro_device *hdev =3D usb_get_intfdata(interface);
> > +
> > +     dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
>
> In my opinion the style of the log messages is not consistent,
> sometimes you use all-caps, sometimes it's all lowercase, sometimes
> it has punctuation.

Again I couldn't find anything on logging style within the kernel, I am lea=
ning
towards just removing them all together. If you can find any logging style
guide link me to it, if not I will just remove all the logs,

> > [...]
> > +static int __init hydro_i_pro_init(void)
> > +{
> > +     return usb_register(&hydro_i_pro_driver);
> > +}
> > +
> > +static void __exit hydro_i_pro_exit(void)
> > +{
> > +     usb_deregister(&hydro_i_pro_driver);
> > +}
> > +
> > +module_init(hydro_i_pro_init);
> > +module_exit(hydro_i_pro_exit);
>
> Any reason for not using the module_usb_driver() macro?

Just didn't know it existed.

Once you reply to my open comments I will send in V4,
if it's prefered to just add V4 not and address those comments later
let me know and I will just post them.

Kind regards,

Jaap Aarts
