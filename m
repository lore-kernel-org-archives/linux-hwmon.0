Return-Path: <SRS0=mGkJ=BZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60981C433E3
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3573C2053B
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Aug 2020 22:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMYkv5b3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbgHOWAr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 18:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbgHOWAm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 18:00:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5ACCC0045BE;
        Sat, 15 Aug 2020 13:44:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v9so13433215ljk.6;
        Sat, 15 Aug 2020 13:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eje8R/nLTBp1HICGnjsyHqb4PcRj/UecQiuF1wSy1k=;
        b=iMYkv5b38SNFy0Wbhmv75t91DOESJVDpWB0dl8WUif5gy/q62UBVNhFoTpxH0jB0Pk
         37TrqNo/6WssTMrVLBYhc+Oj3Z3r3aQmu0Q4VuviU/o0FvB6s6OzKswJvjEV1vNegZf2
         xN+KBmI6xuu4MhpOdECCnvJhNqYsqg4mBSpTEpJbQtEaqlPe5Tw8jQqaXBoKatZMsGrn
         5lLbyLo+xxzjF/EBbIADHpw3lBg0Wb1za7Jw7joQrevGDEJ2blWU2utBMWYLiQwmqgkU
         xUQnZAP+QMiBHJ1JseFmE5/09ftu2pljfrFfHRGATuNth37Hw4jqtES0xVStxi9TwR+X
         IjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eje8R/nLTBp1HICGnjsyHqb4PcRj/UecQiuF1wSy1k=;
        b=QS+CZOCzjByZ79N9rMloalraGq0GQz88K5I09itpQJRyFPhWoz247Q5/90XApJAxNj
         flnTQhvDv+35/IqYHh17trY7JcUuIAy/24wJbVVg7p1JWV78v2vgkp8Q07aR124JaP2x
         C5M9kQtXb4t+bigHH7QdcGbOZJnriIq2+oAawi6FIJ66kmDVgyKDFKNTAxXhuWLW5np+
         681FG06U2oS5WLtKf/NkYn7eea8VI1ro4qzrJvSExmKn0KFDlXqaxlU97hynx/hxyt7O
         BEe/ujCwfHxQI23ulXpnJPze5IehFK8q+K77OaSrYU3FT+Pn0myMtUw8HM7DOT6hmjgP
         pmfw==
X-Gm-Message-State: AOAM532fN24d5P0cb8TDD7jm3wkUGCJRXSkrfUMwXbDPCEOXdZrAFwbN
        E8dhmJ4n3UYeGbhmMRX9aB0Nnz0VoeIMhC3Ad2w=
X-Google-Smtp-Source: ABdhPJyDXa3YZ+il7TlrZ8U7Ry6Asqa4yN3yT3IiO/BWVJveF/8mQ5YJDUtGBwSXxDxhSwZVM0x3es8ddOElkv1n5C4=
X-Received: by 2002:a2e:9a8e:: with SMTP id p14mr3720028lji.300.1597524278490;
 Sat, 15 Aug 2020 13:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200814194202.327141-1-jaap.aarts1@gmail.com>
 <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com>
 <CACtzdJ2cPfz7b6bEUsLB5k+JzXFPLLKxxaYRheFPAwV3UQiu5Q@mail.gmail.com>
 <92GG6DNvh8x8K43ZGnot6ASLNHBD7l6R6RiI-4jv-Lfki4_tM3IJxPYbp-xajRqMV84Nyw4sp3hZft36ulU2QnxCyhf52kEr6OYe9iujBTk=@protonmail.com>
 <CACtzdJ0Rdh5L_JEA0GN37AOyYOUGRf4yfbXD+AJCvxZdYdKQcg@mail.gmail.com>
In-Reply-To: <CACtzdJ0Rdh5L_JEA0GN37AOyYOUGRf4yfbXD+AJCvxZdYdKQcg@mail.gmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sat, 15 Aug 2020 22:44:27 +0200
Message-ID: <CACtzdJ1tgbDVxYkcWstkGkz3=E0BTugUT7B5OrxVo15YPU+M4A@mail.gmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

sorry forgot to reply to the question about the buffer sizes.
The reason they are different sizes (in theory) is because
I get the size for each buffer from  usb_endpoint_maxp.
I do not know whether or not these are the same. If you have
any experience with these functions and know they are always
the same I am willing to make them the same size.

On Sat, 15 Aug 2020 at 22:31, jaap aarts <jaap.aarts1@gmail.com> wrote:
>
> > [...]
> > > > > +struct curve_point {
> > > > > +     uint8_t temp;
> > > > > +     uint8_t pwm;
> > > > > +};
> > > > > +
> > > > > +struct hwmon_fan_data {
> > > > > +     char fan_channel;
> > > > > +     long fan_target;
> > > > > +     unsigned char fan_pwm_target;
> > > >
> > > > This is very nitpicky, but any reason why is it not 'uint8_t' like above?
> > > > This applies to other variables as well, I think some variables are too big for what they store,
> > > > or have a sign, when they could be unsigned.
> > >
> > > I moved all the pwm values to u8, and a;ll rpm values to u16(as they
> > > can't be any bigger)
> > > I usually don't really write c code, all the different types for the
> > > same thing confuse me in
> > > which one to use.
> > >
> >
> > Well, I personally try to use unsigned and the smallest integral type
> > that is acceptable in all the code I write - whenever possible.
>
> I think I kinda got the hang of it now. There are so many options like
> and son have very weird names like uintN_t. The naming of char
> also confuses me, it feels like I am using strings as byte arrays.
> As long as I keep using uN from now on it will be fine I think.
>
> [...]
> > > > > +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> > > > > +                           struct hwmon_fan_data *fan_data, long val)
> > > > > +{
> > > > > +     int retval;
> > > > > +     int wrote;
> > > > > +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> > > > > +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> > > > > +
> > > > > +     unsigned char *send_buf = hdev->bulk_out_buffer;
> > > > > +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> > > > > +
> > > > > +     fan_data->fan_pwm_target = val;
> > > > > +     fan_data->fan_target = 0;
> > > > > +
> > > > > +     send_buf[0] = PWM_FAN_TARGET_CMD;
> > > > > +     send_buf[1] = fan_data->fan_channel;
> > > > > +     send_buf[3] = fan_data->fan_pwm_target;
> > > > > +
> > > > > +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
> > > > > +                           BULK_TIMEOUT);
> > > > > +     if (retval)
> > > > > +             return retval;
> > > > > +
> > > > > +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> > > > > +                           BULK_TIMEOUT);
> > > > > +     if (retval)
> > > > > +             return retval;
> > > > > +
> > > > > +     if (!check_succes(send_buf[0], recv_buf)) {
> > > > > +             dev_info(&hdev->udev->dev,
> > > > > +                      "[*] failed setting fan pwm %d,%d,%d/%d\n",
> > > > > +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > >
> > > > The previous four functions are structurally more or less the same,
> > > > I think the USB related parts could be placed into their own dedicated function.
> > >
> > > I could, but the only part that could actually be split up is the usb_bulk_msg.
> > > If I would remove the error code that part could also be split up.
> > > Are there any conventions around what to log/not to log? Maybe it is best to
> > > remove those log messages anyways.
> > >
> >
> > What I had in mind was something like this:
> >
> >
> > // fill send_buf
> >
> > retval = usb_transaction(...);
> >
> > if (retval)
> >         // dev_err(...), etc.
> >
> > // process recv_buf if necessary
> >
> >
> > And that function would include the two calls to usb_bulk_msg(), and the
> > call to check_succes(). You could even write this function in such a way
> > that all locking is done only in that function minimizing the possibility
> > of locking related issues. But really, it's up to you.
>
> I ended up putting everything strictly USB into this function, and everything
> driver protocol related outside of it, so `check_succes()` is put outside
> because there is nothing inherently USB about it.
> I also dont want to put the locking in the USB function, because some
> "transactions" require multiple usb messages. These are not implemented
> yet but from what I remember most RGB light effects need this.
> I don't know if I will ever implement this since the LED subsystem is very
> primitive for this, but I want to keep the door open.
>
> > > [...]
> > > > > +static void astk_disconnect(struct usb_interface *interface)
> > > > > +{
> > > > > +     struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
> > > > > +
> > > > > +     dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
> > > >
> > > > In my opinion the style of the log messages is not consistent,
> > > > sometimes you use all-caps, sometimes it's all lowercase, sometimes
> > > > it has punctuation.
> > >
> > > Again I couldn't find anything on logging style within the kernel, I am leaning
> > > towards just removing them all together. If you can find any logging style
> > > guide link me to it, if not I will just remove all the logs,
> > >
> >
> > What I meant is that even in this single module, the style is not consistent.
> > I don't suggest you get rid of them, just that you use a consistent style.
> >
> > Another thing, if you want to log a failure, then it should be
> > dev_err() or dev_warn() depending on the severity - in my opinion.
> >
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#printing-kernel-messages
> > talks about kernel messages.
>
> yeah I read that already, doesn't really talk much about what should
> be logged/should not.
> I ended up just making them more consistent, after noticing other
> drivers used %s I figured
> I could do that too, and made the messages a bit nicer too.
>
> > [...]
>
> I got everything compiling, I have to restart, then I will test and
> send in a new patch
>
> Kind regards,
>
> Jaap Aarts
