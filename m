Return-Path: <SRS0=mGkJ=BZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D90DC433E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A26320658
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="MdfNN1MR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbgHOWYa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 18:24:30 -0400
Received: from mail-40132.protonmail.ch ([185.70.40.132]:50033 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbgHOWY3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 18:24:29 -0400
Date:   Sat, 15 Aug 2020 18:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597517224;
        bh=xjNomp15ZBnLPa2p/arZ6AdRR5QNo/WDfk9EJzw56po=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MdfNN1MRmij4ltZn2/JkNIFy6VPaTxulGdQNDUDFJBlvp4MVNO4HhYyIVP4WuEygE
         Zr5cRDNiUq8eSv6U5q2HfbzU2KlQLm9faJsvDUvTAT4rdowgpOMntlHdROoDcWXxZa
         ss66m5KqNjclAKLX4D2w5GtW/h8Xh+xiaMJSt1FQ=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <92GG6DNvh8x8K43ZGnot6ASLNHBD7l6R6RiI-4jv-Lfki4_tM3IJxPYbp-xajRqMV84Nyw4sp3hZft36ulU2QnxCyhf52kEr6OYe9iujBTk=@protonmail.com>
In-Reply-To: <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com>
References: <20200814194202.327141-1-jaap.aarts1@gmail.com> <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com> <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> [...]
> > > +struct hydro_i_pro_device {
> > > +     struct usb_device *udev;
> > > +
> > > +     const struct device_config *config;
> > > +
> > > +     unsigned char *bulk_out_buffer;
> > > +     char *bulk_in_buffer;
> >
> > Any reason why these two have different sizes? You cast both to
> > 'unsigned char*' in set_fan_target_rpm(), set_fan_pwm_curve(), etc.
>
> I am not sure what you mean by this, I should probably make the type
> consistent between them, is that what you mean by "size"?
>

Oops, yes, I meant type, not size.


> [...]
> > > +struct curve_point {
> > > +     uint8_t temp;
> > > +     uint8_t pwm;
> > > +};
> > > +
> > > +struct hwmon_fan_data {
> > > +     char fan_channel;
> > > +     long fan_target;
> > > +     unsigned char fan_pwm_target;
> >
> > This is very nitpicky, but any reason why is it not 'uint8_t' like abov=
e?
> > This applies to other variables as well, I think some variables are too=
 big for what they store,
> > or have a sign, when they could be unsigned.
>
> I moved all the pwm values to u8, and a;ll rpm values to u16(as they
> can't be any bigger)
> I usually don't really write c code, all the different types for the
> same thing confuse me in
> which one to use.
>

Well, I personally try to use unsigned and the smallest integral type
that is acceptable in all the code I write - whenever possible.


> [...]
> > > +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> > > +                           struct hwmon_fan_data *fan_data, long val=
)
> > > +{
> > > +     int retval;
> > > +     int wrote;
> > > +     int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endp=
ointAddr);
> > > +     int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpo=
intAddr);
> > > +
> > > +     unsigned char *send_buf =3D hdev->bulk_out_buffer;
> > > +     unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> > > +
> > > +     fan_data->fan_pwm_target =3D val;
> > > +     fan_data->fan_target =3D 0;
> > > +
> > > +     send_buf[0] =3D PWM_FAN_TARGET_CMD;
> > > +     send_buf[1] =3D fan_data->fan_channel;
> > > +     send_buf[3] =3D fan_data->fan_pwm_target;
> > > +
> > > +     retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrot=
e,
> > > +                           BULK_TIMEOUT);
> > > +     if (retval)
> > > +             return retval;
> > > +
> > > +     retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrot=
e,
> > > +                           BULK_TIMEOUT);
> > > +     if (retval)
> > > +             return retval;
> > > +
> > > +     if (!check_succes(send_buf[0], recv_buf)) {
> > > +             dev_info(&hdev->udev->dev,
> > > +                      "[*] failed setting fan pwm %d,%d,%d/%d\n",
> > > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_bu=
f[3]);
> > > +             return -EINVAL;
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> >
> > The previous four functions are structurally more or less the same,
> > I think the USB related parts could be placed into their own dedicated =
function.
>
> I could, but the only part that could actually be split up is the usb_bul=
k_msg.
> If I would remove the error code that part could also be split up.
> Are there any conventions around what to log/not to log? Maybe it is best=
 to
> remove those log messages anyways.
>

What I had in mind was something like this:


// fill send_buf

retval =3D usb_transaction(...);

if (retval)
=09// dev_err(...), etc.

// process recv_buf if necessary


And that function would include the two calls to usb_bulk_msg(), and the
call to check_succes(). You could even write this function in such a way
that all locking is done only in that function minimizing the possibility
of locking related issues. But really, it's up to you.


> [...]
> > > +static void astk_disconnect(struct usb_interface *interface)
> > > +{
> > > +     struct hydro_i_pro_device *hdev =3D usb_get_intfdata(interface)=
;
> > > +
> > > +     dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
> >
> > In my opinion the style of the log messages is not consistent,
> > sometimes you use all-caps, sometimes it's all lowercase, sometimes
> > it has punctuation.
>
> Again I couldn't find anything on logging style within the kernel, I am l=
eaning
> towards just removing them all together. If you can find any logging styl=
e
> guide link me to it, if not I will just remove all the logs,
>

What I meant is that even in this single module, the style is not consisten=
t.
I don't suggest you get rid of them, just that you use a consistent style.

Another thing, if you want to log a failure, then it should be
dev_err() or dev_warn() depending on the severity - in my opinion.

https://www.kernel.org/doc/html/latest/process/coding-style.html#printing-k=
ernel-messages
talks about kernel messages.


> [...]


Barnab=C3=A1s P=C5=91cze
