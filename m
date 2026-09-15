Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6944028C4
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 03:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444562; cv=pass; b=a1Wi/IMXmgiTFWKBxwee/T8ea2lN8bZ8jzU4A2sLaTxumrSA8TnCB/9mdbn+6cMIjZzhNCwK3AraWGKUZ1B3Opsh7i4Vhr+F2JRsBtN/uKJZzW+5kSs2sHlNsH9fmCaSUvGKWpKXxwABFNqRnh5AS6uu6f4/KwF+RjemAFEx+cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444562; c=relaxed/simple;
	bh=IQ8qzRaj8tpoW8rhpnZaW1weLubpSHwKHelZMz6tzLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWE+7dpdQm5wtty0pU2e6k3yuou2g6Gll5iYjFyGdNb4khu12i6xsLqpbXo5J9/uRwGGuLDWCD6C8nu4laaPs8JUAB73dCPVOukbxZ/KgoabFz2bsQEdtAk1+kH4Pnftagz1AGrdKOXW5klU/DxeyPOdfp8bv50wDiggPpNJH28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcTGU1dQ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcTGU1dQ"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac6090so26125987b3.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 20:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789444559; cv=none;
        d=google.com; s=arc-20260327;
        b=p0gGfWYZ20NHXGS5QACY5HvJmWyu6mI6E8IC/ZyZalswIQNhqVRTZzOKIRTzAGP5np
         ymnio7Zw02YN3nusEaHf8PLDLS4sUdV8XYn5Fw40RJsRO9gCy8oJ4fbqaUp6wDcdJmos
         Wtwp4nAQXL+qEk0o5lrh1s5EARhUF1SJwJ7BtL4tk+xhNxAgfq7YDHUOmXtEC2a/w9c9
         q7eztvNkX9EQsxDJEng+CjFUuU7n8TtsEXJl7Qpv19UvhzPShblNwURvu67gI4pzo8e5
         WTng1kltLcFoRisHEHi29qqLJ/ferKo6LLlu2ZFKdjZCW3bAo9D6nOxOE7T7SMuccXdy
         LGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        fh=kX8ReOIVDObd9+MsT1TESMhclhh7k0QWMwenzSCShvA=;
        b=VmRbSIAaTtlIF14Hxi2CkzplOkYrM1KjBDntrt7T/lZ043vQqgF6KYBlnt1aFa/nDK
         HGdEA2q/mFMed2he/WQhxGZzlThPJ0Aa1oaoO95IP8A5tpQYbY6LQO/Ii/s2tlzKyDqj
         o+VaV+oEJb3nZ5iF1m2xPgWgsB9bXv88Ego3zW9kXPZfsGr4KBChJw4fEaRNXPSUdS7V
         9Amn8M276KMZDRctoue0M+Y0lrvkPh5yh9gDYo8QrEFTrRLlqyFwMhw5rbqm36UC/C5G
         BZ+W2JywXwYXPJtjSnCzNERN7q1im9bKvMLvpWOuIpdrwtplJsSyriNZH136ZMDlGocE
         5T1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444559; x=1790049359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        b=QcTGU1dQUv1oNo96CC5Vs0PfG+Orbp+0mINQuUW26XAsULHKYyYIRCkMDrJ67pme8t
         xaOkUc2F1pZk7Pqsfkz9++vqsao/ysg1pxxEq7Xdyei+ZeM8+iHsaSJgYnQStbmmO3Hm
         vZ5OdVAvrUPkth24bG/Lqy5eUQ4UjNYFAK52n+efm3xqX9POJN8BYcSN91SVNvF7TyUr
         BD36TjQA4wC8+BPvuCO5v7UikKiLeQ9sifZjtJrczNyRPRVtIaYD9mj7Lph6PbRklts8
         UfPThKedX4zO45jO4lk0PXzOo9XDB1igcSN3VWaynCugKHcr5L/q9BYU3tGkrTil8TZz
         yYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444559; x=1790049359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        b=oF1/JCs59HaXxz71hbRetEMeE48j7yFRMPFyBSoPv51dOvzP+t/z5CW0qaGcPj+iQ1
         hWmBVwqIM6lBnHajI+biPCWgxOHbES9lfvnxwfJiIWJHHpeq2NrM0+s13XV4k52RImha
         iJHojsGAQPHxi81smPwLbkJxYIHIPZJFE9XQlK66l5ecdoSYqRQH6+u/HSVZYMtcfZ9O
         U9qmY53yK/YtqbPKwfIqFjOnIxEB3p4Xg76p46ifFtBMQmbS7d2JyiE5bLh79XxxtyId
         INRWQKpU8jvKZMXUPIweHheZwdYRgfZaO8d+qlubMpUG8i1O/Rz+dNnmYUNGE2aOBRd9
         QwyA==
X-Forwarded-Encrypted: i=1; AKwUvBxdl05XhYJuzQ2w7WO1bdnMeo0CW+pqFuExP3lXgexV1x2ZHFozKjLvTrJ59non2cedwHXLC0mNmCCLYA==@vger.kernel.org
X-Gm-Message-State: AFuF++lWiTD0zV4Z9gECik+eYdX4111v+TwVcZ5VnXLE51272kXXAUwx
	yzOTgLCX3sPbH4wySOalyuWQ74LzTN2oVOKK+nlWBq5k9K0NCxhnhR4tQRokmLaPnRMEdc+l1BY
	OARGphFznzeL8/d+I7nc+qnV10tC/p6E=
X-Gm-Gg: AYBFou2wzN0F+UCRj13ssaDKB9gNTdMzA9bsd95eggRQAskGj88H6TVWODGfjoh5Fa4
	hPLYOsLPdFgFNGaYv1XpnkqObJGJBoHI2qCNNduUhKflSW0wvL9FqabbwrAdsnohXkM2JUYaRPg
	7GEAMisx/y0dVhrYV8MVROw5bI5g15Wprb7p/fK6Ok1JYQ628KOAsc7dgR+Ej25dBUSmhjDCv16
	r0ieXSHxxS5JzelD7Iq+S6W6br6lXe4pgX1OhoIzGrR3U/W5C6bWpELrO0OhsSCjk0otrEzI/oC
	Rm49OkVb1Rx0ew/oubeHluJJA3KyzCyvQphmChX4p/2Qzjshthx3L2Op5ekCqFMEhw==
X-Received: by 2002:a05:690c:a79c:b0:873:5c7b:c0fc with SMTP id
 00721157ae682-88d22cdc932mr13897057b3.52.1789444558685; Mon, 14 Sep 2026
 20:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914115448.2039438-1-congnt264@gmail.com> <44026532-e454-458a-847a-9e66e7ddc3ad@roeck-us.net>
In-Reply-To: <44026532-e454-458a-847a-9e66e7ddc3ad@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Tue, 15 Sep 2026 10:55:47 +0700
X-Gm-Features: AcwNN1UQndXSIj7-fzZashgJyte07l53UHSD32h1DonXihx6AU1VTZUaNN2VuGI
Message-ID: <CAJpJ=Gvz0_kFZ2UWKA5qss07z+jbOdf7BqLEnpt7F673ZgE30Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:40=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 9/14/26 04:54, Cong Nguyen wrote:
> > fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
> > it. free_irq() (via devm) only waits for an in-progress IRQ handler,
> > not queued work -- a pending alarm_work can run after fan_data is
> > devm-freed, dereferencing it in fan_alarm_notify().
> >
> > Cancel it via a devm action registered before devm_request_irq(), so
> > teardown frees the IRQ first, then cancels whatever's already queued.
> >
> > Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> > Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel=
.org
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >   drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> > index 084828e1e281..b1b57bb63a33 100644
> > --- a/drivers/hwmon/gpio-fan.c
> > +++ b/drivers/hwmon/gpio-fan.c
> > @@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
> >
> >   static DEVICE_ATTR_RO(fan1_alarm);
> >
> > +static void gpio_fan_cancel_alarm_work(void *data)
> > +{
> > +     struct gpio_fan_data *fan_data =3D data;
> > +
> > +     cancel_work_sync(&fan_data->alarm_work);
>
> I think this still leaves a window on teardown, if an interrupt happens a=
fter
> the work was canceled. I would suggest to use disable_work_sync() instead=
.
>
> Thanks,
> Guenter

Makes sense, sent as v2 -- disable_work_sync() instead.

thanks,
Cong

> > +}
> > +
> >   static int fan_alarm_init(struct gpio_fan_data *fan_data)
> >   {
> > -     int alarm_irq;
> > +     int alarm_irq, err;
> >       struct device *dev =3D fan_data->dev;
> >
> >       /*
> > @@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan=
_data)
> >               return 0;
> >
> >       INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> > +
> > +     /*
> > +      * Register before devm_request_irq() below: LIFO teardown must f=
ree
> > +      * the IRQ (stopping new schedule_work() calls) before this cance=
ls
> > +      * whatever alarm_work is already queued or running.
> > +      */
> > +     err =3D devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
> > +                                     fan_data);
> > +     if (err)
> > +             return err;
> > +
> >       irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
> >       return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
> >                               IRQF_SHARED, "GPIO fan alarm", fan_data);
>
