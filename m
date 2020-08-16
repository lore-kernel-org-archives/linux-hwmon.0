Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7D8C433E1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 08:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75FFB2065C
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 08:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvV1nBSA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgHPI5g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 04:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgHPI5a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 04:57:30 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032EDC061756;
        Sun, 16 Aug 2020 01:57:29 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so14252438ljj.4;
        Sun, 16 Aug 2020 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vht/FYsZLtRZGhv6782u04fHW1FAakWgqE0fZEBG0Js=;
        b=TvV1nBSAfwi7uZLPdw7J5VJCTaaD9XnKkYSzZWt4BjpRDaYqc65NpRygHMW8v+cE1S
         Tea+7SgUrMrxUFoZwbO3Z/Yy5SA7AHh0Pj6t3LyAxWfHaFhccxYbtde7Lsmpwe7DQmf+
         QPd8sETWIV+Z3q9//9hfbobT4tFzpEAwKP1NembMbmo9G0f/BO5BSD/EK6IYumFo1Mtr
         cK0UG08JLiPx7eMpJ46QpWyBAxGLvalU4AyBq8bJ1vU4XuTheqf85RJWD8f4yhbFe2Id
         IgR1uFYepybVl9aiLd79BAt4ukVEP/ZszJauFaAEsHyoGio5VMo7vk6zXIGyAhh5pc5X
         6enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vht/FYsZLtRZGhv6782u04fHW1FAakWgqE0fZEBG0Js=;
        b=pUT5Kr5lSEUsgOJKRosnWGqEpEweu6OvjqFE5HVucTUhMzPrRK3njPVOI5vL+JSyHo
         DU+FIC22WJC4QhaxKxOIXn0YjPFKXpkVkQkp0nyvpkdwrqpIZA4VV1pmpw4fL1W/Iij0
         MidwyXOm/XcvAdxyb1b+c8sXGVoDqLfQRh7QSVvs3MhhAGRScqSzpG8wBg65sZM5w6uD
         IxJLb/lg9kYbDOJIm63ZqootFccoynkN6e2Y0pq+S9uBohkMtez09XAGNzuZys1xkEZ5
         +6w47z2pume374nIfvWWpwFGgIWE3m8tg5kIzWXsLKdxawTV4Ht4MwQjZLBYIakDOgeX
         MVbw==
X-Gm-Message-State: AOAM533BXQIV7luLlhO4k8/UL6lYJMtzN3CmczuBdrdK2aOtukZ9hSjz
        jBX8R136nGmTgi860mWlXtHZwyiTcA/8263prhQ=
X-Google-Smtp-Source: ABdhPJztw64c+96u6E+wIr4YGMp/9XSz/3CNwdeeejNkXIrzQZl5Djcl3LSx5sR7ANia5p5xn8zSlygWe6b1wOc+jvM=
X-Received: by 2002:a05:651c:1b4:: with SMTP id c20mr5035572ljn.432.1597568248144;
 Sun, 16 Aug 2020 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200815211617.86565-1-jaap.aarts1@gmail.com> <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
In-Reply-To: <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 16 Aug 2020 10:57:16 +0200
Message-ID: <CACtzdJ1NihomZ3Ws0A_LtHjdsuJT4=dpfsTU37HGCWJp99tmKg@mail.gmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
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

On Sun, 16 Aug 2020 at 00:54, Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.co=
m> wrote:
> [...]
> > +static int transfer_usb(struct hydro_i_pro_device *hdev,
> > +                     unsigned char *send_buf, unsigned char *recv_buf,
> > +                     int send_len, int recv_len)
> > +{
> > +     int retval;
> > +     int wrote;
> > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpoi=
ntAddr);
> > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpoin=
tAddr);
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, =
&wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, =
&wrote,
> > +                           BULK_TIMEOUT);
> > +     if (retval)
> > +             return retval;
> > +     return 0;
>
> The preceding 5 lines could be simplified to the following:
>
> return usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
>                     BULK_TIMEOUT);
>
> And if you don't use 'wrote', you can simply pass 'NULL' as the 5th argum=
ent of
> usb_bulk_msg(). Although you should either check the value or set 'recv_b=
uf' to
> all zeroes in the calling function to avoid the possibility of a failed t=
ransaction
> being recognized as successful.

I ended up using `wrote`, so I still need those lines now.

> > +}
> > +
> > +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> > +                          struct hwmon_fan_data *fan_data,
> > +                          struct curve_point point[7])
> > +{
> > +     int retval;
> > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > +
> > +     memcpy(fan_data->curve, point, sizeof(struct curve_point) * 7);
> > +
>
> Personally, I'd use 'sizeof(fan_data->curve)' here. And consider making t=
hat
> seven a named constant.

You told me I should be consistent with `sizeof` using variables vs types?
I agree that it should be `sizeof(fan_data->curve)`, that's what I used bef=
ore.

> [...]
> > +     if (!check_succes(send_buf[0], recv_buf)) {
>
> Any reason why you don't check recv_buf[3] as in get_fan_current_rpm()?
> (same applies to set_fan_pwm_curve() and set_fan_target_rpm())

Yes, the device simply doesnt return them, I had the expected bytes returne=
d
wrong as well, they should be 3.

> [...]
> > +
> > +static int hwmon_write(struct device *dev, enum hwmon_sensor_types typ=
e,
> > +                    u32 attr, int channel, long val)
> > +{
> > +     struct hwmon_data *data =3D dev_get_drvdata(dev);
> > +     struct hydro_i_pro_device *hdev =3D data->hdev;
> > +     struct hwmon_fan_data *fan_data;
> > +     int retval =3D 0;
> > +
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_target:
> > +                     fan_data =3D data->channel_data[channel];
> > +                     if (fan_data->mode !=3D 1)
> > +                             return -EINVAL;
> > +
> > +                     if (val < (2 ^ 16) - 2)
>
> Did you intend to write 2 to the power of 16? Because 2^16 is not that.
> 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
> (you may need to include linux/bits.h for the latter)

I should not do things at night, I did mean 1<<16, although BIT(16) is
probably nicer. I thought about casting it to u8/u16 and checking if it
is still the same, but just comparing it to `BIT(16)-1` gives clearer
intentions.

> But something like this is my suggestion:
>
> if (val < 0 || 0xFFFF < val)
>         return -EINVAL;
>
> Though, I suspect the fans won't go up to 60000 RPM or so.

Just tried, the device has failsafes for this :) invalid argument is return=
ed.

> [...]
> > +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type=
,
> > +                   u32 attr, int channel, long *val)
> > +{
> > +     struct hwmon_data *data =3D dev_get_drvdata(dev);
> > +     struct hydro_i_pro_device *hdev =3D data->hdev;
> > +     struct hwmon_fan_data *fan_data;
> > +     int retval =3D 0;
> > +
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_input:
> > +                     fan_data =3D data->channel_data[channel];
> > +
> > +                     retval =3D acquire_lock(hdev);
> > +                     if (retval)
> > +                             goto exit;
> > +
> > +                     retval =3D get_fan_current_rpm(hdev, fan_data, va=
l);
> > +                     if (retval)
> > +                             goto cleanup;
> > +
> > +                     goto cleanup;
>
> The preceding 3 lines can be replaced by a single 'break' given that the
> 'goto exit' is replaced by a 'break' after the 'switch (attr)'

That sounds alright.

> [...]
> > +     /* You did something bad!! Either adjust  max_fan_count or the fa=
ncount for the config!*/
> > +     WARN_ON(hdev->config->fancount >=3D max_pwm_channel_count);
>
> If this warning is triggered, then that leads to the overflow of 'data->c=
hannel_data' later on.

I am just going to clamp this just like the rpm/pwm values.

> > +     data->channel_count =3D hdev->config->fancount;
> > +
> > +     /* For each fan create a data channel a fan config entry and a pw=
m config entry */
> > +     for (fan_id =3D 0; fan_id < data->channel_count; fan_id++) {
> > +             fan =3D devm_kzalloc(&hdev->udev->dev,
> > +                                sizeof(struct hwmon_fan_data), GFP_KER=
NEL);
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
> > +     dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->=
name);
> > +}
> > +
>
> There is absolutely no error checking in hwmon_init().
>
>
> > +const int USB_VENDOR_ID_CORSAIR =3D 0x1b1c;
> > +const int USB_PRODUCT_ID_H100I_PRO =3D 0x0c15;
>
> I think these should be either - preferably - #define's or 'static' at le=
ast.
>
>
> > +/*
> > + * Devices that work with this driver.
> > + * More devices should work, however none have been tested.
> > + */
> > +static const struct usb_device_id astk_table[] =3D {
> > +     { USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
> > +       .driver_info =3D (kernel_ulong_t)&config_table[0] },
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
> > +      * and you switch to this driver, the device will not respond unl=
ess you run this.
> > +      */
> > +     retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, =
0x40,
> > +                              0xffff, 0x0000, 0, 0, 0);
> > +     /*this always returns error*/
> > +     if (retval)
> > +             ;
>
> Shouldn't you check if it's the "good" kind of error?

probably yeah, I still have no idea why the error occurs,but it is required=
 when
switching from windows driver to linux.

> > +
> > +     retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, =
0x40,
> > +                              0x0002, 0x0000, 0, 0, 0);
> > +     return retval;
> > +}
> > +
> > +static int deinit_device(struct usb_device *udev)
> > +{
> > +     return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40=
,
> > +                            0x0004, 0x0000, 0, 0, 0);
> > +}
> > +
> > +static void astk_delete(struct hydro_i_pro_device *hdev)
> > +{
> > +     usb_put_intf(hdev->interface);
> > +     usb_put_dev(hdev->udev);
> > +     kfree(hdev->bulk_in_buffer);
> > +     kfree(hdev->bulk_out_buffer);
> > +     kfree(hdev);
> > +}
> > +
>
> I think you should call mutex_destroy() in astk_delete().
>
>
> > +static int astk_probe(struct usb_interface *interface,
> > +                   const struct usb_device_id *id)
> > +{
> > +     struct hydro_i_pro_device *hdev =3D
> > +             kzalloc(sizeof(struct hydro_i_pro_device), GFP_KERNEL);
>
> I think this should be modifed to use 'sizeof(*ptr)' as per
> https://www.kernel.org/doc/html/latest/process/coding-style.html#allocati=
ng-memory
> (and everything else that uses the same pattern)

Aah ok, you just told me to be more consistent so I moved everything
to sizeof(type)
while it should have been all to sizeof(var).

> [...]
Ok, I fixed all of the issues, I also made the input prm/pwm clamped
by min/max values
I manually tested.
