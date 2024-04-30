Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED812CD90
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475479; cv=none; b=dr1P7vw4Hn9odN3pzWwaQCPk4+4mC0AEW5ux2RjU/wwZdnnrrydcb/oUSLKUKTf2nwKCMAkRgBxcrfOY276euh2nmAC92PYkOLuPmyXd/r3F4+fmevKj1P5yjMqzCX4ixmnTcfO2QUfKwiYx57ltS9Og97aY3g5SGsVDYcJMwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475479; c=relaxed/simple;
	bh=KsDaP0lyWjz1SrzPP44Ii1ZoCRS2F54LyqXAHM/A0dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPh4Z4Ufj4y8/thq7NJQOEXrqrQZB+n9t6Uu10RrRU+2+WIWIsHENnWtRmrMhvax54M9zPr0CWw7V5434asNOUwiNGeiIVPfVVxWGfbYFF4/zUTJLypGnlRtkaYxNW3F2iDROo6rzc4+5SMunOgJIzGDszVlAUAukdDBt9J7sBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWwEpnDw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWwEpnDw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a51addddbd4so606686766b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714475476; x=1715080276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyetORnTDUNrOnzNlbupObt8ni5/iLDn6BO90IXhVeU=;
        b=lWwEpnDwPedy6AJ1ljdK9TmvpiwSZ6YtdFtgziM06QuIpzsDnfqlJHt34YguaaTFEM
         f9MU0uRUGGUj3rmoKFF3PHTGfyIyOwF0SLj1JQwLu2kWuxbivsMTB4nXGI+E4PZe+F3Z
         jf2GO1TDqQXmEDomBuXfVjJqEfHpbbRKBbgh55TyrIQgVIGTfWB/5ySX4xy7qYv5iRIF
         AlgXy7YnVEjmc5Blvc4LBirp2aTj654KCu4jdy5ZQCehKPgZxm7DwTZwarts23MZT3zT
         eOyvxHCuZ9jz9doxYC3iD7IBRawmRzzCYdkcFQdpuRgEmPHh8obb+VyzqlEBJ4mOaNUP
         iaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475476; x=1715080276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyetORnTDUNrOnzNlbupObt8ni5/iLDn6BO90IXhVeU=;
        b=ODCxjJbPzAjvFN4fp8NX8GSVMjXM8oFreJ2bEyFUrRWxqecffxKwzwxv8Kho0qzSO5
         kUxgCuaOXjp3XnLZoHLhwtlj6QFS37yhPz/kb6cvvB+yX7G4CYrzzB8888elLJBpm5Hg
         4J68qg6O0uyMFnp3Oj1Fu032GUSBC1vVJfWryCrwwsCRhSCFBUZsvWg/3JqF7f6sU6Jn
         k5AzPOtE60WK1Dgas2tRaC25TRkGJn8JnyYA6narnCRSq9snZ5/zs0xNi5hmneMQQYG0
         odtVtR/xpF9kU4kFPm4Z5m5MtJ6FkcUJeu8H6gwZxZqlm1/d2EY545ZUR1kivcoEHDzf
         Tdtg==
X-Forwarded-Encrypted: i=1; AJvYcCVlStP0apH3YugUn8UcDgpbqyhxP7FwcZaBfkh9Psk81eYkgr1M/l5UpLIIVO13O3UG6bk3u6ca0bQxa5F+/1W+dkq3Rv69iJ40mNY=
X-Gm-Message-State: AOJu0YyyXLs1zDpyqaAgkoheZSk7pDo8Q0XfVrJKqovGdqnqO3ClXJ7E
	xxCnpwSyfk3JOZEIrxUfbhlSJ08rdZOcYC4k8ipt43l6OCVnEHYLjbDoTgu3fLyx5PlmFG3ub3U
	v0KXIDkmWF+1wVW+HJu/qLYDGnUw=
X-Google-Smtp-Source: AGHT+IHHsOb1DTf1Whd4OAG0vi86vU1rL54dImEaiIDIK6OL8FU8rHcjtQz4TxPYK3w7RTWP7ohnHdF6mLi6dDzQLWQ=
X-Received: by 2002:a17:906:4115:b0:a52:58a7:11cf with SMTP id
 j21-20020a170906411500b00a5258a711cfmr10536141ejk.2.1714475476065; Tue, 30
 Apr 2024 04:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426141322.609642-1-lars.petter.mostad@appear.net>
 <56b04367-8b5a-4c73-a741-729c55daf83e@roeck-us.net> <558708ed-4a26-44bb-85f7-eb2f2ac943be@roeck-us.net>
In-Reply-To: <558708ed-4a26-44bb-85f7-eb2f2ac943be@roeck-us.net>
From: Lars Petter Mostad <larspm@gmail.com>
Date: Tue, 30 Apr 2024 13:11:05 +0200
Message-ID: <CAC-Dm243rwTcRS2_p989yUoFUjDoR4p9NGE-8WwwmaA6=Ko+4w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (emc1403) Decode fractional temperatures.
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2024 at 8:07=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Sun, Apr 28, 2024 at 11:00:47AM -0700, Guenter Roeck wrote:
> > On Fri, Apr 26, 2024 at 04:13:22PM +0200, Lars Petter Mostad wrote:
> > > Decode all diode data low byte registers.
> > >
> > All ?

> > What about the following ?
> >
> > 2c -> 2e
> > 2d -> 2f
>
> Also all other limit registers, and for those the write part is missing.

Yes, my intention was only to decode the (already non-zero) data registers,
not the limit registers.

> > > -   unsigned int val;
> > > +   unsigned int val, val_lowbyte;
> >
> > FWIW, this is wrong. The upper bit of the high byte is a sign bit
> > on emc1438.

Yes, I missed the sign bit in the datasheets. See my comment on patch for
emc1438. If I withdraw the EMC1438 patch, this will work for the current
chips with unsigned registers.

> >       retval =3D regmap_read(data->regmap, sda->index, &val);
> >       if (retval < 0)
> >               return retval;
> > -     return sprintf(buf, "%d000\n", val);
> > +
> > +     if (idx_lowbyte) {
> > +             retval =3D regmap_read(data->regmap, idx_lowbyte, &val_lo=
wbyte);
> > +             if (retval < 0)
> > +                     val_lowbyte =3D 0;
>
> This is an error and should be handled, not ignored.

My idea here was that if for some reason it manages to read the high byte b=
ut
not the low byte, I don't break anything. The output will be the same as be=
fore
the patch.

> > +     return sprintf(buf, "%d\n",
> > +                    (((val << 8) | val_lowbyte) * (u32)1000) >> 8);
>
> The u32 typecast is unnecessary and would interfer with negative temperat=
ures.

I put the u32 typecast there on the off chance that somebody will compile
this with a compiler with 16-bit ints (uClinux?), as C only guarantees 16 b=
its
for unsigned int. It would of course have to change if negative values are
to be supported.

Is it acceptable to handle the low byte for data registers only?

Should it be kept unsigned only (if dropping emc1438 patch)?

Regards,
Lars Petter
