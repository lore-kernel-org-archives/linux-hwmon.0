Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8711F3BB669
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102079; cv=pass; b=u/Yjl8dk6xVTjxoiTo72Ngg8CTKC7H/iXWwde9dOiiW/Ed4CMtZwnON5U915mjmjYL6N7qYbdQGiOYaiA+2fyi1HqzNncucGbX8/MgBrWaQ7UVD3aFVEAvZ719XTeTaNOpuGO1ZX6BV0hYQMNEMGzEIPh/lbCnYtLlkzU8BhXHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102079; c=relaxed/simple;
	bh=rdWB5ozj+spTYlkn8FMONqaJsNfKg3Tmj30iWcgt0Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=be/gMMD/Nr0rno4YXTW16BqjuF7u9ArFcnJe33/MoVsqH7Kl42IOK2Gn4u5/1fzHjZgOuGf98aVas/e3RoBTuCeLHk0V9DZyOvIo/qxk9qLpZ4PMkucU+NrG8rs1WWun7xT0yzMnCSuPG9hgjqvgLlE+87PitLbokxXEVAqAomY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcqyW5Ep; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcqyW5Ep"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836ce6cbe1eso26523167b3.1
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 08:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788102077; cv=none;
        d=google.com; s=arc-20260327;
        b=oFCADdRUsiDsIrZ/E3Nq5Nr5YkEGPa68IbSX7golMSVosdOvLZfFKZaMsyGF6MQNVv
         rxgqRnQ+JBilf6D3cZDb04z83S4LmeftQmOm5l4ngDDUU45gdubFOxOlzHrsAYCDH5Pj
         IRXt2V1pIB15auOe5W3Vxfp1gCONVlPqpWNYj360QFaQOojo9IoTyeuYsbA0odhf6crT
         z5RoQshXkH2pSuCImVkKfgFREaKHT/nj6E0snsfh326cXFVq7xn6fPOBW5X5sO/DpDBI
         LXMZLBu+1J5aIALuwGaMDtBUISYqy1oyJbQcAfr8TSvzFyhKTuw5qhYYUb4mI8DtKjOz
         3p8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        fh=2uOGr1lPw/G+435a6FxLGWNJTzNunALxnOeniu5XjZg=;
        b=F1maWi6TbNcQo5qjB+uCgI+GIbzqS5AIFoh5tluNAXuTgznJMX1J7Q4njWDNklt1SS
         CQvDPC1BF5BvUbMeQdomS4JvGGQ34tYm+Cbh7lz5zBt1SBEbyHV57xkTyVb8qURZyxWu
         FJK5JijMsamHxnOlcyZGkUTVDMa6xUkI+HG3iuRhrOB+OsvK1bwVOBdRmBVztokjqIEL
         5OJSyZ//qJWuCBsCbGyRWiWToruedArGxkH6aTiqaGSh7eL/fFJe1cI4mYqp48TtdopK
         c/ZdXWuq+cb1qf6aENF9uJ2+C2GQsH8b7cjGjN3As58ajgszojXH7kNR2yQVUCMxXquJ
         PbXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102077; x=1788706877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        b=hcqyW5EpqxVY+u4gsFV7QAE3W/RK2dORGQU5hcJ1iXuIJl9YaYWaVsdJOFq6GoEylA
         ZTooNmsoQjEbvXV1zRN+j/xLKJw9Xrl2D/X5bcHDZxjLyRaonZQd8Kff/q6RQzEUfXPp
         9EBZZeMUqgjD6gKCnMy2Zbt5DJf4lmjQI0RvGbfIRBCj02YPKUDo+/ckpPR7Ng+OR4ey
         lshtdwg56qC9JC7HZ7Cvri/mNnXfKDArLRraLCBY/kurPSsGkWOZtjjF3PqJUe35WzD9
         tfqKKUZ455UrxSks9pspl5oFkiykbcuOUJonf/HG/ERHyfIUL+alQOoTBvmnsZJ4QmJX
         8PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102077; x=1788706877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        b=MslJ5WfzcWL0xKgdoD119HCsgJQPGDm7O2jIarotghkxOpCWQs30rZJ+B5kJTD/gW3
         TDZUN+yo37+D0O9iS6zlC5Ygs6OceN38LR3ksrmuUq1lMX+QiuMFTkNBy87qPzoSunfG
         Zy6GqIilH/E/amJdKGftXw6+nXQEP3C8MeHegYvgW8RseM9Jfe+GqxmFUlGSnFzIExIO
         DtIIAKkN1DFKgylOYoaReVEUd5AVvMkk63kMO8Drw+/xtnBr1cEzRkpnmwJSeQsKoUzv
         Z6k5/0fX3OOLvCLAynBRJbChE3XIGI5CViyIZwQneQ5RTXfLh0ughJ67/pyeJPb2vt0r
         OPeg==
X-Forwarded-Encrypted: i=1; AKwUvBwVmPTkAILJavsVWAhzcsd3unUQ0qmEvto5pwD8wbBKq535yr2e5iJ18CDB9GGc6jpfK9imkUIdJCpTVg==@vger.kernel.org
X-Gm-Message-State: AFuF++lnmsSvHGQNPMDeBJW/mGlb2QK51nd5qfMZT6Qv9DUIIVZfMpBP
	rmJXkqZCuB0973vw3Jog+yEPsDYbxtthUV0py4p9/RVn7aqweVidM5hvgT61wQq2M8BojszcUD3
	cjxsGC6BjaEh1xoOXaW8TScejB8dmx/4=
X-Gm-Gg: AYBFou1XduV9trbGMOJ+59gTC4kx3VY4lzTclEbgKC1k6pBuOK+FIN5cLtf7DQawLNf
	JWDBnnqKEQgMtUX/jN3bHvojCPeNjpAzuG4fVVbcr74AB4ZQZWJsHHel0xtp5z2UWyPQrTViejc
	I1qqq8qgCZXx4X0IJo7UUptGBXmkU+gJ9HQdGjhQVGNTjJjDTF1H143mCUyjFlXdzhiZruDsZ7V
	PUEAeEmiJpRkt7rfwRYMrZV7XpY24f7G9LgFbhLT2pOuXDufTE7mW09hbftRAgnDg2jaid+wqAc
	O0luo+aGoCEK5AwriVkwYUyvCxDKkuo0BhmXUL++ivg=
X-Received: by 2002:a05:690c:a1cd:b0:854:9062:73ae with SMTP id
 00721157ae682-85d6ea15febmr62989437b3.33.1788102077303; Sun, 30 Aug 2026
 08:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828105018.2392383-1-congnt264@gmail.com> <20260828110142.725E61F000E9@smtp.kernel.org>
 <b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net>
In-Reply-To: <b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sun, 30 Aug 2026 22:01:05 +0700
X-Gm-Features: AcwNN1XkumPf31B2w75HyCXH4F80TLKJg296rVJgGwLqokfmQZs_182PytFZij8
Message-ID: <CAJpJ=GtEXcxu+NCwVxx-N+MbX-LAuk7t_4Mm-_kfgUyxk__KOg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 10:58=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 8/28/26 04:01, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Converting to `devm_pm_runtime_enable()` and placing it at the=
 end of `probe()` incorrectly reverses the teardown order, causing PM runti=
me to be disabled too early. This leads to a regulator enable count leak an=
d exposes a sysfs race condition on driver unbind.
> > --
> >
> > commit 728a875c515df8244bd554b338f4f008d88b3b9e
> > Author: Cong Nguyen <congnt264@gmail.com>
> >
> > hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
> >
> > This commit changes the driver to use devm_pm_runtime_enable() during p=
robe
> > and removes the manual pm_runtime_disable() from gpio_fan_stop(). This =
ensures
> > PM runtime is automatically disabled on unbind, fixing an imbalance for
> > alarm-only fans.
> >
> >> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >> index 084828e1e2817..0bd5561b7a405 100644
> >> --- a/drivers/hwmon/gpio-fan.c
> >> +++ b/drivers/hwmon/gpio-fan.c
> >> @@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
> >>      mutex_lock(&fan_data->lock);
> >>      set_fan_speed(data, 0);
> >>      mutex_unlock(&fan_data->lock);
> >> -
> >> -    pm_runtime_disable(fan_data->dev);
> >>   }
> >>
> >>   static int gpio_fan_probe(struct platform_device *pdev)
> >> @@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *=
pdev)
> >>      }
> >>
> >>      pm_runtime_set_suspended(&pdev->dev);
> >> -    pm_runtime_enable(&pdev->dev);
> >> +    err =3D devm_pm_runtime_enable(&pdev->dev);
> >> +    if (err)
> >> +            return err;
> >
> > [Severity: High]
> > Does moving the pm_runtime_disable() action to the end of probe reverse=
 the
> > teardown order in a way that breaks unbind?
> >
> > Because devm unwinds in LIFO order, registering devm_pm_runtime_enable(=
) at
> > the end of gpio_fan_probe() means pm_runtime_disable() will execute fir=
st
> > during unbind. The cleanup action for gpio_fan_stop() is registered
> > earlier in probe via devm_add_action_or_reset(), so it will execute aft=
er
> > PM runtime has already been disabled.
> >
> > When gpio_fan_stop() calls set_fan_speed(..., 0), it invokes
> > pm_runtime_put_sync(). Since PM runtime is already disabled, this will
> > fail with -EACCES. This bypasses the runtime suspend callback, leaving =
the
> > hardware regulator permanently enabled and causing a regulator enable c=
ount
> > leak.
> >
> Seems to me that this will need a more comprehensive fix.

Confirmed, Sashiko's right. v1 registered devm_pm_runtime_enable() after
gpio_fan_stop()'s devm action, so LIFO teardown ran pm_runtime_disable()
first -- gpio_fan_stop()'s pm_runtime_put_sync() got -EACCES and never
reached the regulator disable.

v2 moves devm_pm_runtime_enable() earlier so gpio_fan_stop() runs first
again. Sending shortly.

thanks,
Cong

>
> Thanks,
> Guenter
>
> >>      /* If current GPIO state is active, mark RPM as active as well */
> >>      if (fan_data->speed_index > 0) {
> >>              int ret;
> >
>
