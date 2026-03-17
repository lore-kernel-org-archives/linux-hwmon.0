Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB1B395256
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736588; cv=none; b=rhDkeNhfF5ufGn2MCCXRFF/Dr1vXGGEz+7RlG3wgumtB69EIH77Tb9keGpgUr8K2uOTQLp//dcw5/78BcTyQL0CX7kRo51zpjMMlLpC+6Ppd3cFm1VgGQlqBZmiXEldZrV1wKZ4JZDohkxYT9gczpAdG5Gnj1rCYkhGSwxREsdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736588; c=relaxed/simple;
	bh=1IbAI1LF70M+Kjw+h3BaLZwBsh7cf418N6PFDl+oOnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7nfew/Uo9R/y/VMisq1r08MUZtqU2p9PxGfRheWaU2euCcop1Hlew+TMcGx0xoAs8DkCVy/vtFtECFyh25GWCYQg6BnIHg4pz/zN1wDOM+LQes+IwhbV11GjUKLKzVUBlFhVklC6SqKH+k+jYLFQnPMtnDTdTw0fX4W2sO5c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56af30dde0cso2063933e0c.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736586; x=1774341386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idH2bB7nbOzzZw2WFTC74GwVow5g1kiitlzGsuFZK5o=;
        b=srhdXJgGaFrebQDPnbMdPgwRVFjPjwuXxH1O59Jb1VFdIzrWPYG2MA2B0Mgvb7SQEx
         6CXYQshWjkD6fwZ/NcoT7zkHmmT7ShiP9NgvnNLvqsoaEYAx/mRj+jgNd8S0Jpeg2xBv
         VaZpxZ35nlFTHd71SPq0KtF11RePHaRQwHHWX6d97hL5KM7iL4ECrTCwh68filUTu6fY
         oJp9jbj99i1BECAnr0xN/xmrQCyrXu61ayPMhD0v30x/UYHioaRbv0jqYie+JAYkQqP2
         JB2eP8jmfqpie+7c7J54BD8A+5+nbbX1vnZaQZZYphRKTTQhEm84sv26TD352qYLllO2
         Jlzw==
X-Forwarded-Encrypted: i=1; AJvYcCUF259BLhwi70kVmKnT5s7uJRolxLN/VlAd/NESviIUPj32v+/DEjYULYQ/XBdHUkedvFbLFW/3rjoTVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrRELFzWt9ar8bpW56KY8vEba6xLU/+u2oIl+fahQ+NQqm5md3
	vW34rQzwo9v3/tfGYrSzW5fTgg5sMM9mf9PnXgYLph+VuWt0RAcr0lQh6Nm80hsh
X-Gm-Gg: ATEYQzwCf4iGF9cuA+g8JSsAd8pWhtecAa7xjXfAz4sN3q1asAkJSQW6yDdrYgXbwIQ
	9u6Fn4bGHcDHoE4XbbLV9kbLR+qYmanIP8rU5Uw+pqnUaDIrVWh8Qc+93QzTQsy6HNLfhDLKiFv
	JmyB2UMkn2qMFUHo5aa46NiZ2Tg5OJUWDENXiCBl9u99JmlnSZ3XQCVnCYpY5XIOfg3beljo6E4
	D/JS0wMSyKzq/bmZ4SglajZHTRDbsDyqI8kzPAX0OdAbXzGHdAWOryaRKGrCjQsLqM4h9anJ/r6
	DXDfoxEQDOyErPoyAnH9fJ7wgXzoANXrG64nXjkLxnMws0mLbzKPfxAwEhftJcgrKjfpO4zUWv7
	enxGi4kEBO2uTB2Xo98o/QN9YJacvH3XnDu9tMf5wjpN6XH51BAIh/ePEcT6BnjlhgWyXq4jpjJ
	Tqm9ijbAlF8q/jTJbZo2QJT71sD0AD46OoUk2k6qvWlAb1q+SKqS48Xk3BVnTj
X-Received: by 2002:a05:6123:2c:b0:56b:8023:b89e with SMTP id 71dfb90a1353d-56b8023c032mr2717413e0c.6.1773736585686;
        Tue, 17 Mar 2026 01:36:25 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4634177esm9617113e0c.6.2026.03.17.01.36.24
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:36:25 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5fff52ab292so1344971137.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrV6Fwg51M8mkrN0DeW4ddm0W66ivk1PeEGRbe1WCTyZV84e+J508qD83kWUIP7uJmx9/ITrf6V9oS6w==@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-6020e2129e6mr6024902137.10.1773736584585; Tue, 17 Mar 2026
 01:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
X-Gm-Features: AaiRm50LJFP1R3ITAUSRjqb1napf13plX5N5KjefHP89RPorlF5H9VKuGn2urAs
Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Tue, 17 Mar 2026 at 00:57, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct platform_driver *pdrv = to_platform_driver(drv);
> > +     int ret;
> >
> >       /* When driver_override is set, only bind to the matching driver */
> > -     if (pdev->driver_override)
> > -             return !strcmp(pdev->driver_override, drv->name);
> > +     ret = device_match_driver_override(dev, drv);
> > +     if (ret >= 0)
> > +             return ret;
> >
> >       /* Then try to match against the id table */
> >       if (pdrv->id_table)
>
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
>
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
>
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
>
>     sh: platform_early: remove pdev->driver_override check
>
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
>
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
>
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
>
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;

Nice catch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
