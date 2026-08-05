Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455843FD04
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930817; cv=none; b=e9TF/1oBtpdbkg8EheGN2dGXAwKEup9TKfFcbUrQHHKf4Ra5xooZUuQSKFiYmHbe0g5bqcm++0hmwFj+0OFNbHXPX1hM0JQ75CECeDabuEqH4zDTSfwxY20Zq0jX0T8iPZnEwGg3fttDq0fNk4EJNgGXayLSqUHDcn/XrHARHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930817; c=relaxed/simple;
	bh=e4Gwlqr6LtwhMycGRIbAW5pAJuE+jLgEMN/9h13znJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+7bcY0LhLHtikQY7BCA/IC9zNw72z/62CVsGGbscx0IXMqndmtKexGgySCkhsbIzmqOpnVycsaEio/a2yr5/y5AYYmXlQW3mykHbZ5/YaeivHomPrEH2DJliDPmXhQGj95QXtKxg1bmIDk8Ap+323rZgPWMlODtg8a3g2B2I+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJGCBe5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJGCBe5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75751F01558
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785930815;
	bh=KsdFDkxZFSRpjNSIFYzJhF5uwTw9ei74CtBcPGhq/ys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IJGCBe5D8yp+aKUbrYNYjW67BprE7MZNBG/yTMldzS1x5xI6pLkBaRuHfdxnmwF7I
	 05VSywRYvQkrn/4I/hSZ2saj4O6asqV3cwNJouYt5DwK++enk5gKyPv43GgxhBQvM+
	 +h6fi6StBhW9uEm1GiUHPwYM9vjKKmNP8C34/qXXm4gJp1TrI50Y4BWs6J4e8gqBgY
	 SRC+Diih7pQTIDLQol7wteR6uEQQKieGP42bRnkfkOUTbU6aXcbaqlhj+UMxl+McQH
	 Qq3hhHM3xhZhe6VcIv8vnyLTyIu9HSwhAcLrxq8VOzc9lYNBUU0SYF3/gxBYwqbKsa
	 vmj3OpE4ugLhg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0117dda13so825478e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 04:53:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSHNuVrIvfE/D+XoF/NDqzPp227fDSttpllSvd3gDNOjxBdqfEGE0QZu/o+U4Vf+TXkSl7k/7mcTaApg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFpA5dE+GB+nBy1k1YFp8cIi28d0NPQMMUxqIG+GjEa0879L4
	OM5vR00gxedJNiZHKpQw2CMufzE+bDizb7CIQXBFU0DUl6aHwEvATQ1NrF2XJ06FXd3QUvV37fv
	dXze1kIxFyGyVKczNuh5Dus+Unakjf24=
X-Received: by 2002:a05:6512:1291:b0:5a8:88f8:9ed4 with SMTP id
 2adb3069b0e04-5b2f4cc941fmr890956e87.30.1785930814327; Wed, 05 Aug 2026
 04:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12947893.O9o76ZdvQC@rafael.j.wysocki> <5123895.31r3eYUQgx@rafael.j.wysocki>
 <7011fec6-f2ac-4ceb-bdb9-adbccdabf6d8@arm.com>
In-Reply-To: <7011fec6-f2ac-4ceb-bdb9-adbccdabf6d8@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 5 Aug 2026 13:53:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iH0oewk3EVjRKsJqaOC23LdKURzttCgEoJqLqeobPBrA@mail.gmail.com>
X-Gm-Features: AUfX_mw20zt4kk615xQBvkDFqHuKufWwS4uG5fQtYpkLpCPJc9iwToqxu3CsJBo
Message-ID: <CAJZ5v0iH0oewk3EVjRKsJqaOC23LdKURzttCgEoJqLqeobPBrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Revert "thermal/drivers/hwmon: Cleanup coding
 style a bit"
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Armin Wolf <w_armin@gmx.de>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 12:32=E2=80=AFPM Lukasz Luba <lukasz.luba@arm.com> w=
rote:
>
>
>
> On 8/4/26 21:09, Rafael J. Wysocki wrote:
> > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >
> > Revert commit 030a48b0f6ce ("thermal/drivers/hwmon: Cleanup coding styl=
e
> > a bit") that introduced a use-after-free into the error path of
> > thermal_add_hwmon_sysfs() by removing a valid check from it.
> >
> > Link: https://lore.kernel.org/linux-hwmon/20260803183915.4ED7D1F000E9@s=
mtp.kernel.org/
> > Cc: All applicable <stable@vger.kernel.org>
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >   drivers/thermal/thermal_hwmon.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_=
hwmon.c
> > index 597c33c8a555..ec73d03a1e60 100644
> > --- a/drivers/thermal/thermal_hwmon.c
> > +++ b/drivers/thermal/thermal_hwmon.c
> > @@ -212,7 +212,8 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
> >       if (new_hwmon_device)
> >               hwmon_device_unregister(hwmon->device);
> >    free_mem:
> > -     kfree(hwmon);
> > +     if (new_hwmon_device)
> > +             kfree(hwmon);
> >
> >       return result;
> >   }
>
> LGTM, a tricky plumbing. I'm sorry for being late with review.

No worries.

> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

And thanks!
