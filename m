Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B435AC3E
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449504; cv=pass; b=klCxx8lLEzdI7Iz+hx0tXg+YM6qlIZ3jliFChkFdj2y12z/dE70TvT75D+K+LdVRe3WqHzLP5UxsJ7BzzbrIzVVJTfDKeHb9xbDVn0/M5Os+My9Uhb9f8JURyiVL5v79ehRDuo/KRlYqXbGcksHsr6LVcwK6sC0x+yO41A7IiVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449504; c=relaxed/simple;
	bh=MNN0MxQutkVAICnu21/rtSu7MZP/rEU4Ta6qHPWAsoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhk3FrB2JSky8A6g/EW6gIe3X7WQOK+2zJLf0wFxCgZs8Z5ZTfUdiCKrRVoBUIQ8lEBiVnsB8p5fRwNXwHGEBEDo7OZfeDp2eAm9q5HvAMSBMl9VMN/OIh9FDP65M9NubaSkoVWMm4lFvzrVuIWQ6qLuNgcEb4JK32Um5AWA+gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFI7GPod; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFI7GPod"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d596a5be31so3403506a34.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449502; cv=none;
        d=google.com; s=arc-20240605;
        b=SYnJ/bYB2OkHzHGWNG+D/7Ct8dcgxmRG0caf21+tX5A1SGdaqoGZ/jVYEPjB9g6l2w
         kQjW24IhruJoT9i9IFibAFphfQhFpP83FcGVuU2dEWZ96MuqqF4uCqyst2GAgKugTB6+
         Nuvyh1ZhjqEZWqbNq3Mwgr7w/XjP3DDHpHFV/sITI7xaAxVC6FfYPq5DOEjPO/ERHtae
         BxJFw+/2uUBZTQstk+O7FR5LX3Rvgywyf1A3tr44dJQo4TiJdeurLqiK9d1XkL7/03kQ
         I8Q3ovpDcYACeWyg7LqEDSBGZnGK0oNm2sCGQjrls358j257UEfH/jJ5STkJM/ZIKxwv
         9lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        fh=qa+UmEjYpqL92kFrWNA4X5LPiJo7tZA+D4MOKKeuM7s=;
        b=WjjWOrYfwFaa+2LFjHjowTasodDEM7nFWRNL8WKSgZhtBV/U9/un5QilSHQAMmRBHi
         iWQCCuMXLOySFbl00PcmzpRtGVhKMUt1lfJdtfFDIm8Zz/oggNIsdOfCFXhfp2frUfPs
         60fPVLK/YUliO8CFFYS6J1UcLmIdNMp+7ihVKw6nx6pj2Q/ZXLOgtbOhwqzu42M/uh8k
         yO11lD0WCugyO+IcbHnfl9WJ5po7Yt7wT3xYIm1aldWnAmxAHB8gq5IcL3VIZ4jrT7Bf
         b4C08SZRmB0Hh8S0GwlFOpeZTYWd5fUfiLE2P0sRPWZSMi63OLfI0sootL8RJys6AAnl
         RA8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449502; x=1773054302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=nFI7GPodwr4K7PC1HWfUVpPzdSjla2PQOIxDuEcBwSuSUvTWuwE5h20gW/c+gCy4t2
         u7QR/gPdyhMLyDTWmpznLdei1863tjE2BSGZTCnbBiufkUiS8X2sFkbHvf3zZU+SGT85
         Zdsw87IoZOF0vQlTKF+4+Nc/XEH5dCA0fEA1vh1IIJpbkto5aoGMyyrDS+SrhIZjaZVs
         vRYmlqAhwrxFdRyUdJ/JrIG2/Gpu+z6egxQjMYD3S0qZzGC7YK/grNnR5wEECaM1p0lb
         LeT+svI9a4QLe600affzmHLczk+PGzyC1rZ0JbA9hsMhED94j2TQnwiOMoUmvSFiGP08
         Ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449502; x=1773054302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=c4yMi3o3CHAcvtEy0ExWM7F5hLcLVwxGiEHYI+5KqgWeTO12PY0jetk41z4pyzPAtc
         Pm0twSMMNArYrYb43XCf6NCb5p8MN+EYkbNPToRFKFtloow+DmgumZuhS9YBZsmgJhGj
         eVLhbqWFLvVm3WpKdYrGc59SCpOaJey+288v7lgnL5en1RQBzjBWmQVU7uVwS+c1nNFz
         nLVpX5NCcddhHYTyYkAMvEEq3fJMChL18t9SwcsgHj2VhP32b74I5H3RYmyjBiFMGE91
         lrxBcCH/x13QlwxRopGsy3FvssLUTmMkL5TlJDRYbHtTcKBb0wbF+2JsJ//MbFyd6W0U
         kyCg==
X-Forwarded-Encrypted: i=1; AJvYcCV8DhwyvU89Mr+PStOF3QCIG9wbDU6KT6SmJOC+5bFCPik0aGWsRmckJgRV+CwNzVYNECPxFq5u3lWD/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKb/LBbIomWfdVAMKiMYADuM2KGFeCPHn7Rosq5ei1tCuwaOG
	ZDK54kIFO5gw6Sayp+/saA92bnxndKsuh7x4F/HEDOuAWggVZTEgQv89XLPMG4eGIVJdQ8CUqJX
	sYR6OEEmcbPDCAu6SXF4w8YdGso8iw5g=
X-Gm-Gg: ATEYQzwCzi88kGw0oogAdmdkarH/8A+gqXWOY75AAP5UNV2xvcHfutyd4Fn2q3XX5SS
	CEVek6VGc14zfo6et3yircPDGJYYlLKpF98YFhoqRgJL2JTZplCOf8OSZenrwuHGeES0OMlAEEB
	RnzO/q6unxZpqxrCQPwXbXnbSblooDOg0k+Ph8nreina2fzXX/atLV/svijSXRxeTQpQyc8EFRh
	+CoZiG0tKT7sbPb81FwlH8wwYOfFEmoag41ZUh5JCHBXf0RXxF9DtOBrSOrHhp1AvwC6KiINixz
	HqGGZFsfgGpjsk89GY8FyLEFLgG369LzPYuVufgHCmTOp2QXgW7wc9GqcSbGejesO1c0mSqUG54
	=
X-Received: by 2002:a05:6870:ad08:b0:3e9:1643:5977 with SMTP id
 586e51a60fabf-41626e0fc5fmr6099442fac.18.1772449502199; Mon, 02 Mar 2026
 03:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com> <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
In-Reply-To: <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 19:04:51 +0800
X-Gm-Features: AaiRm52arKfwi8YCxjpEdTXQmweggZZESyxe8RNIzUhwuktCE_TgfQAoQ172OQc
Message-ID: <CALbr=LZ6Qu+oi0XiTZO4u+H2Jsv51jWazmK7xPt5EgK9DOy-hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 9:36 AM CET, Gui-Dong Han wrote:
> > Applying the following diff fixes the KASAN issue. It was just a minor =
bug.
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index a8cb90577d10..09b98f02f559 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
> >         devres_release_all(dev);
> >
> >         kfree(dev->dma_range_map);
> > +       kfree(dev->driver_override.name);
> >
> >         if (dev->release)
> >                 dev->release(dev);
> > @@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
> >         else
> >                 WARN(1, KERN_ERR "Device '%s' does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/core-api/kobject.rst.\n",
> >                         dev_name(dev));
> > -       kfree(dev->driver_override.name);
> >         kfree(p);
> >  }
>
> Yes, we must not access dev after the release callbacks has been called; =
no idea
> how this kfree() ended up below. Thanks for catching!
>
> > With this applied, along with the PCI driver diff from the WIP patch,
> > the issue is resolved. I tested this on PCI and both PoCs no longer
> > trigger KASAN. I also ran with other debug options enabled (lockdep,
> > sleep inside atomic, etc.) and hit no warnings.
> >
> > I was working on a similar patch recently, but your version is better.
> > Not returning the string directly provides better encapsulation and
> > makes the API much harder to misuse.
>
> Ah, right, I remember you mentioned that! If you want I can add your
> Co-developed-by: to this patch to account for your work.

That would be great, yes please. Thank you!

And thanks for all your hard work on this patch series, it's a really
solid improvement.
