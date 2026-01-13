Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF036A02E
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331746; cv=none; b=RieAvT6HITtOMjLh6+M2zd6RKXedr+Gg7S7NwIMkz1xbXT35BmVoHieHGeXuqPwjmP1clun6THxs7l7btwfPayccc2Agan/Vw1IH+dBZk1noVqZcIwfDpuItsnfT4/ckfKkqRc/5rCK1ZL/LEnKjyNz4oruuBd+alr7QfvUT9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331746; c=relaxed/simple;
	bh=cb27y+8EtEUs8RwU9R0BjoJdYClZyIdMMjL8HNTjTiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGBN5+ZAtgQaC916N8hvVqodGZZDEkay7MIcSmhvae1PsM9V/N18XhdRX1XT0daKZQhuazjfmYa13MvyffiFLJWzOpY61GSRlVlJFmq3LLWpkJuf57fnx5ckw9mghCERM6uzKuswhZdox98xrBWSG9nnNW6sJPdCChPxWmKwwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxgdgPL+; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxgdgPL+"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-121bf277922so9453565c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768331744; x=1768936544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpOaHGEAgQJqZnuoKb07PfkKcZZdWnIZRIfjyoaqZlc=;
        b=CxgdgPL+42wmxaWHdNwU338UcF8ol5O4bSV2rtV+58KYepkGHBL5O+G1/drGtSrdFT
         oVGip7QaeNctcg2eYU9c9d1CaG7jQqFDyRYpmY/yh30cSIp+JzrCGFwZzUuKCN2ou2Rv
         JB4Qs79HmjTie4KdCnbLRhObWc3L0f5B4XCk6pKWpmA0VyIqXCLfYIMkJY/ElK/AbXAB
         VPVO8swOlj1DYTTgSCts9kgGvaM63WXpwmot/yOOGqREgAs2JpiAI0x0gQWxUqy6nWQM
         24s0aLquvzgU3x3yvevUegIgwKpSag82vG4frZNtz/GUHtOURnua1JMBvzsgHSFxgvdI
         jwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768331744; x=1768936544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dpOaHGEAgQJqZnuoKb07PfkKcZZdWnIZRIfjyoaqZlc=;
        b=HPofckz5v5WonuD2t78fJuqudQzdRZIghtorrqfcUSb/1T1u98bqPvunpRETSNoYwT
         1OHQbWomPpV8MzD7ZGg8ePreGDjShvbBaYfPfIS+LtmaJM092MxZbAM/p4JG9rlTXQ5K
         FDeVWvP0OifOXJks9RdYOvqTVPmnbyKDo+b0ZaYov6ASNz5Zeg0Sm0pCSnse0GmyIPkp
         c2Hw6Enc5CYczbjfTsvpVEDAki2XsJCjCMsLX0Rgfzrz0jA0CqJrNb1IuFQ99W/ViC+q
         a5+elFhoH5O6Pr6w924xAqeF668yvnrGSJSAL6wo3wVapLpOXqQs1nO9OiRlLqIhacE5
         sMVw==
X-Gm-Message-State: AOJu0YxRPgYVY6dHZjXe/llBTeKMM1rLTuASs38YcFg3+XFSxjYgjLpE
	N1ZgIMKfLJf2pXkSkn7KYkkNf9+hTCiHSUX7a7knT2Uh4RqFJKTSJ40Mlhs3jU2lSDrkO4b02CR
	9bnlAG1qRqWCFPPWzOXJ92sVXtN6OExU=
X-Gm-Gg: AY/fxX55GlAWAfElgVLMG17wv7O7vn/uxmoXFL+Zm2ycsrVTejetsk1t4q7Vee3q1X/
	xsRJlZfccewSw66lcbJpyfejkxVJWGIJOViMd3j75L1GW7RPnyr8ppr/DgQZUcmmqGRXPPc45ee
	atSA6MXuzNMGIhsuJnNHbDMJS3TLMPlHFPyFPTA91Z6i8795VKui0XJTYy67stxo8bZwQB3NlkZ
	oIbMbyvNjTSxt1VttHnYyk94TTDWljLykDlu7FYxGQGA6HB7oIocuy4KAKNVEU0O7GnxnGl
X-Received: by 2002:a05:701a:ca0e:b0:11a:4ffb:9849 with SMTP id
 a92af1059eb24-12336a46b88mr146860c88.21.1768331743909; Tue, 13 Jan 2026
 11:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com> <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
In-Reply-To: <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 13 Jan 2026 22:15:26 +0300
X-Gm-Features: AZwV_QhfR7J7Jcg3llYrtvkv4je-pn0MwKOzjJ98berg4Wd3UBGt0j6pLPHcoYg
Message-ID: <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:30=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/10/26 09:19, Tinsae Tadesse wrote:
> > SPD5118 DDR5 temperature sensors may be temporarily unavailable
> > during s2idle resume. Ignore temporary -ENXIO and -EIO errors during re=
sume and allow
> > register synchronization to be retried later.
> >
> > Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> > ---
> >   drivers/hwmon/spd5118.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> > index 5da44571b6a0..ec9f14f6e0df 100644
> > --- a/drivers/hwmon/spd5118.c
> > +++ b/drivers/hwmon/spd5118.c
> > @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
> >   {
> >       struct spd5118_data *data =3D dev_get_drvdata(dev);
> >       struct regmap *regmap =3D data->regmap;
> > +     int ret;
> >
> >       regcache_cache_only(regmap, false);
> > -     return regcache_sync(regmap);
> > +     ret =3D regcache_sync(regmap);
> > +     if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
> > +             dev_warn(dev, "SPD hub not responding on resume (%d), def=
erring init\n", ret);
> > +             return 0;
> > +     }
> > +     return ret;
> >   }
> >
> >   static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5=
118_resume);
>
>
> Based on the subsequent exchange, this is not the appropriate solution.
> The problem is that the i2c controller suspends too early. It should susp=
end
> later instead. Alternatively, this driver should suspend early, but it do=
es
> not look like respective PM operations are available.
>
> I would suggest to try replacing DEFINE_SIMPLE_DEV_PM_OPS() in drivers/i2=
c/busses/i2c-i801.c
> with SET_LATE_SYSTEM_SLEEP_PM_OPS() or similar.
>
> Guenter
>

Hi Guenter,

I tested changing the i801 SMBus controller to use
SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
change, spd5118 resume failures (-ENXIO)
still persist, suggesting PM ordering alone is insufficient and other
firmware interactions are involved.
