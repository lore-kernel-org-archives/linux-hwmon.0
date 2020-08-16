Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65484C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 19:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3551320866
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 19:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+N/eDa2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgHPTLb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 15:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgHPTLb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 15:11:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014FCC061786;
        Sun, 16 Aug 2020 12:11:31 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y2so6118607ljc.1;
        Sun, 16 Aug 2020 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9xELaxhSwN3Qs3FBQinUtIi3lBYmbmXSxPDV/snQ3xc=;
        b=m+N/eDa2PDSMrVjR/fs0xkmaNky8bVyKFQBNfLEKt5jZhX+C6S6liAbuNC/V6sBbvY
         dluoLpbvZtT2Rn841Jd7rv5xoGPB4nU1d8XiHNU4uo+xpi8IlIDqS5IICWGbku3T9eA8
         c0cAuGiG2YdHUwMOPu1Dl8gKG4OtCpBIM7mZQr3COLKEob6bum0EvmF4eh266y+6qlZy
         IEu4VU0ISylvmxyHJxBkTxekj1r8VZLYDPP8nQ6g9B4CkGf8RW9PbDAHRu3/ENRXvhBL
         SpzGA6a4Si8XS4Wg6fitSoef9V1O5Aqc4tOAgj5viHGvNvohBsnEsqqjUTx8uppEjbKf
         0/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9xELaxhSwN3Qs3FBQinUtIi3lBYmbmXSxPDV/snQ3xc=;
        b=Qb/jJlZf/aOeY4kRZGkm2lbdqpXQz6NorJ8+1fgyy4Yd5LtANlpNLHcna/cyNVbipL
         ld2CG4WU3yLcRvyQQymkcArBwUootXcrjf0ABVGrkSGnsvSS96zlN0g7ytpLpr/pv0Mz
         NPpKPWNqJmr8ixIsv9ftdW97nd9Mb6dKYyfepHb91UlFmWOh1mTl0ZypTcr90u4jn15o
         /u8egKYieEWIsj4RzMbAYYYmu56D3p/CDVWhhjaJs4nAP++4angd6LMPPiUvUny5xYHE
         X8pwCskTGmO4wNTlUKjq+PKGvtw8BiHMrB88068NXMjyQbq4cSsPh6t04ZU4P+VknvUx
         xBFQ==
X-Gm-Message-State: AOAM530LRNdRXiCMzNaoRfpYo8V6ruZ/wMxN/a+jOR7ILIcgV0gzRWrZ
        Q20NLeDFoC6WkXPs2TiYcWfr/fFLUqrqzuu9IjQ=
X-Google-Smtp-Source: ABdhPJxV8RZbeirR0TTSzwYmpWXw3SR34u9HgX4QKlWEd7KI6IVUpdYb9m0sadllfRbebyavxM+XOOsJtNIEou3HoWA=
X-Received: by 2002:a2e:3817:: with SMTP id f23mr5437690lja.118.1597605087936;
 Sun, 16 Aug 2020 12:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200816164616.417500-1-jaap.aarts1@gmail.com> <odhPvTQHPORgr-0oIThKQfchHX1_snHADl8aZCGSc771d492UJqUwFJEuC3PkRwlwQmxXU-OZJfvsvbvBFANCk_JO2yAfcXI82q3FyxwtF8=@protonmail.com>
In-Reply-To: <odhPvTQHPORgr-0oIThKQfchHX1_snHADl8aZCGSc771d492UJqUwFJEuC3PkRwlwQmxXU-OZJfvsvbvBFANCk_JO2yAfcXI82q3FyxwtF8=@protonmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 16 Aug 2020 21:11:16 +0200
Message-ID: <CACtzdJ2kbmKL6vhoF85vociG6TeJ1ZiuDEHAHmRJ0bJA_zSWDA@mail.gmail.com>
Subject: Re: [PATCH V6] hwmon: add fan/pwm driver for corsair h100i platinum
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

On Sun, 16 Aug 2020 at 20:17, Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.co=
m> wrote:
> [...]
> > +     retval =3D hwmon_init(hdev);
> > +     if (retval) {
> > +             dev_err(&interface->dev, "failed initialising hwmon %s:%d=
\n",
> > +                     hdev->config->name, retval);
> > +             kfree(hdev);
> > +             kfree(hdev->bulk_in_buffer);
> > +             kfree(hdev->bulk_out_buffer);
>
> I hope what I said wasn't confusing, but - like you said - if you use
> devm_* you don't need to explicitly free it. Furthermore, you access a po=
inter
> that has already been freed here.

well since I didn't put the device it wouldn't have been freed. This
in itself was a
mistake of course since I got the device I should put it as well.

> devm_k.alloc() and devm_kfree() OR k.alloc() and kfree(), do not mix the =
two.
> In case of failure I think it makes sense to free the resources either wa=
y, but
> it is not strictly necessary since devm resources will be freed when the =
device
> is gone.

I couldn't find any clear documentation on this, but since .disconnect
doesn't get
called if probe fails I can just restructure the code so I can call
astk_delete on
errors. This makes everything much cleaner and nicer.
> > +             goto exit;
> > +     }
> > +
> > +     usb_set_intfdata(interface, hdev);
> > +     mutex_init(&hdev->io_mutex);
> > +exit:
> > +     return retval;
> > +}
> > [...]
>
>
> Please think more about memory management and how it should work in this =
module.
> Only manage devm resources between "getting" and "putting" the device.
> Don't do it after "putting" or before "getting" the device.
> And please compile and test your code (among other things) before submitt=
ing as per
> https://www.kernel.org/doc/html/latest/hwmon/submitting-patches.html

Thanks for the link to the page, I did compile and test the code
before submitting, but I
must have ctrl-z ed or something for it not to compile. I always make
sure everything
works before submitting (at least setting mode, rpm, pwm and reading rpm).

After looking at the link a bit, I will try and write documentation
tomorrow, and see
how the MAINTAINERS file is structured to add myself.
After that I will post another version, if there is anything else let
me know so I can
incorporate it in the patch.

Kind Regards,

Jaap Aarts
