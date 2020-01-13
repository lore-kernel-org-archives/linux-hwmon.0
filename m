Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F7C33CA9
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 16:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06F4821556
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578931423;
	bh=neJb72YXp6s8khd3M+sDHOIXDMZ+inlm1nduyUTfmJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0Qz5ok4GeQKNzCZHxtpS2De8A03yXs/F973jH5O94L/DcSbrhnoI0a+30m2kmGKbf
	 pzN06O2/QA6TqWCLi8VwxMrL/fuK4Eaeg3TmLDmOTMqTvnxFyEHDAkA3F/Ptu4nivb
	 n5MbCkOSkYdADwTvREXlSqebkKh+ObUDkGkCVCmc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgAMQDm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 11:03:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:58808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgAMQDm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 11:03:42 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E0C921569;
        Mon, 13 Jan 2020 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578931421;
        bh=neJb72YXp6s8khd3M+sDHOIXDMZ+inlm1nduyUTfmJ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fuCbOrbFfPqtssGmTY+U7q71BYXLE5zG0A39Bn4/Sf6BM8VDQndXRlTSLCTd8Qaj1
         P8n3y//pF25mCeIok2S4hMs4zchCaaHxB3SgtxK4ic5Pu0175Ct0uO9C9Oru8gfSRm
         5ltopaqpvVWDB61dl06alcECfrut3x2GkJPpve8Y=
Received: by mail-qk1-f178.google.com with SMTP id w127so8907042qkb.11;
        Mon, 13 Jan 2020 08:03:41 -0800 (PST)
X-Gm-Message-State: APjAAAXFlrziIhK7etczCXKPIzIVFW1SuIyoUDI6Gk5pV9zCOQ9YdCai
        MTV7trrb9fxL8OGbAPptjXT/CgMWj9kmGIWaag==
X-Google-Smtp-Source: APXvYqzfaLWR9NE8f7Lx5aPC8z78SAai6ksBMPH1TFuK29zEkpH5PZGXT/fOSQi9p9fQpHTMeB5ZGo8bgzDKGyS8Dqs=
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr15480464qkl.119.1578931420737;
 Mon, 13 Jan 2020 08:03:40 -0800 (PST)
MIME-Version: 1.0
References: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
 <1577023823-9615-2-git-send-email-akinobu.mita@gmail.com> <20200108161331.GA18546@bogus>
 <CAC5umygcuGTKw=8NO+yM4z=MpAiw62Eo6p0vky_soTRmn0Y1Wg@mail.gmail.com>
In-Reply-To: <CAC5umygcuGTKw=8NO+yM4z=MpAiw62Eo6p0vky_soTRmn0Y1Wg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 13 Jan 2020 10:03:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLDz+zk0Ah4YN1EUm_qzFjbjLFmcoKUX1ZGGeZpAzdeNA@mail.gmail.com>
Message-ID: <CAL_JsqLDz+zk0Ah4YN1EUm_qzFjbjLFmcoKUX1ZGGeZpAzdeNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to stop fan on shutdown
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Linux HWMON List <linux-hwmon@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 9, 2020 at 11:07 PM Akinobu Mita <akinobu.mita@gmail.com> wrote=
:
>
> 2020=E5=B9=B41=E6=9C=889=E6=97=A5(=E6=9C=A8) 1:13 Rob Herring <robh@kerne=
l.org>:
> >
> > On Sun, Dec 22, 2019 at 11:10:22PM +0900, Akinobu Mita wrote:
> > > The pwm-fan driver leaves the fun running when shutting down the syst=
em.
> > > (On the other hand the gpio-fan driver stops it.)
> >
> > Seemms like we should have consistent behavior independent of what the
> > underlying implementation uses. Is there actually a case you'd want to
> > leave the fan on? It seems strange to disable in suspend and leave on i=
n
> > shutdown.
>
> I agree.  I was trying to keep the current behavior unchanged, so I added
> "disable-state-shutdown" property.  But I can't think of any case we want
> to leave the fun on in shutdown.
>
> So it's better to change the shutdown behavior and remove the option
> completely or add "retain-state-shutdown" property instead.
> (The "retain-state-shutdown" property is inspired by gpio-leds)

I would just turn off the fan in shutdown and see if anyone complains.

> > Wouldn't the shutdown state depend if the PWM off state is high or low?
> > IIRC, i.MX PWM has a quirk that the PWM disabled state is high. Doesn't
>
> It could be possible to affect the shutdown behavior for pwm-fan.
> There are three i.MX PWM drivers (pwm-imx1, pwm-imx27, and pwm-tpm).
> Do you remember which one actually have such limitation?

No. I believe the fix was to use pinctrl modes to force the state. And
I think the issue was for suspend rather than shutdown (but it seems
unlikely you'd want the fan off in suspend and on in shutdown).

>
> Maybe it should be handled by the PWM controller/chip driver and PWM core=
.
> From the perspective of PWM user drivers for now, we have nothing to do
> other than setting duty cycle zero and then disable PWM for stopping the
> pwm-fan.
>
> > it also depend on what the PWM driver does in shutdown?
>
> I think so.  But as far as I can see, no PWM drivers implement shutdown
> callback.

Do they need to? I'd assume most SoC's are powered off or put in reset
which makes the PWN pin go low.

Rob
