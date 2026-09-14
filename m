Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A343CEF8
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382555; cv=pass; b=SqY7x69PN8sy2hSIsVrxrIt0onme/LMU7RPZ8YxvJWBJowD2memjfugKhg9QSBYLdC7F4panCDaeJ3x9MIXDfULOj7SwjWM3f6UNfjDsDumSh+QZnVlZ0RY0gfP5nUcLygJOVOJQVicQehGf3YAunIJ9v0CTQZCaz5VOmLON0YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382555; c=relaxed/simple;
	bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NquXNLxT83mopkgb00YHgGImz3HqxU02pFRoWAE1Y/3MZ5ZBiuM8ZEjQ2B7TQJxmZgLDDCsBz3LeBgKMV0PZDG/mNH4GjJqN2ShTKY2fa1O+FM1TYnoRhGGGxCk0bJDHm+/JzUUFNXkDmyV9p94y2Q9nhzC9KcMSqjAcSiYk6R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ifj0LWdG; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ifj0LWdG"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac6072so12963277b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 03:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382553; cv=none;
        d=google.com; s=arc-20260327;
        b=Nh2EBlNp2Z/yh7wSaHfhM6IUZIjljvmQF/guTEknW42FZXutzarSj0D88emB34vBNi
         Cxjcj6Nuy+ighdhmEWXtTiT8DdnqOJ4st8xxzSiIuoXeo/Xu2G+snMiMsII6esYn+RHw
         jM+VFb+Xh/j1fNme/9Gdu8Ltcx4JVnbjOXHZC78kIZdBae46o+7z/D0+bzdwmxF6Qlpu
         7ZvLVoi9R0CX23JvQBxbAYvcrJLAY9unuWtjcRx/f6JatRCld5wESBqL7HJsUSZhwzmj
         XDtNJrU6a/cQefL2+0cy7jcUrlZLZ4H38NpLciYMjchZi/LyVLaJOtmCUOU8vMzV9rbp
         3e6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        fh=MOrQ7Mg3rPP2nWm7rRoHN3cJJuL0/I2wlTZS1N91iZU=;
        b=nhWyR+4T65ZlPJdW4E5o6dKSqPIEQ/ODvg9I9WqLi3JHDRApn8aNjyfYaUc4MktOcK
         3SJgvpFqigOMZMJPqUGX9galNdtpnGBOpgA36X26sthrQIHTzJlgTNrP4dw7KQXXye2D
         FFhUQqzPuvxmSlJ7t0Tpcz/L29mIt2sPq/7keGCRMErAvuHwJtOVZHSF2HwfDDOdoBAy
         fIt2ofr3LOWvmrFvyrmdHUeg+xdS2fXiZdEH+VpQLgsS7KGfuF/bHZM0Ug5AxCGWjYRA
         wtnVwOJjJCTYsYj3g/3nJoFBw8mrrWhYnSO1P530txFnlQPTmUSBq+4MgLo8QklEqthw
         SGcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382553; x=1789987353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        b=Ifj0LWdGH+S3rfrHyiBtQrObYWeEe3+NcWCykRqDuivoTIYGSyNNHpdBe+/zwDkkFs
         74mryv4YCjoiB2IUA9m64DswCg4jEYToYLNhfPSoqvNC5E/2Xh9169ncHKQtYaADJ++1
         ZYPc88FkiuV0tDlJeg/3esOqbmgzfXQbhOBhvgAiO/w0wH4ro5HyYB+4VB64A/p6Ddc5
         EkRkbhfABQimGN1o3XGz8PvKqswSh7ZxMqk8FKuaDSgyjwFnuuriuhGsFx4naB0C7qUz
         nkFPXBOmErZxKN2+TqCZiIKtafwqDTzYBoqog7/jzm/byzNgCZc2H6u2OA5GieMBI60n
         HpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382553; x=1789987353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        b=ccUnT85s1yC6E0cOJsZ+SlsRdusa4C5m2w/u0LMiK7rH9DVL+x075dB2e6M2Z7VElp
         1Hc4yfPKp/6uOXLuX0uBoQ7FtURN/tbkfI86PNgR0IU2S9bCN98LuKIA8W0SDL7HYZeS
         QCd0cbGGRtHCmYjXzrPhr9WwjvCgGdSBy247WrYycAxHlcZhHAgwkweJ0MjJFTkvENM8
         ctHH5OlyLhH8NXktBg9t6Tt3UD26pR3CT8YHuaQErrQkfbtqsHCJ38+/nlu0HwzYDXXQ
         K/ogNgE3HYLDvk+Xo5wSMM6S8qg9bE2Oh44rMGKlxDgLhSOZytXQkxf/k/0otaL7sdVo
         Bpqg==
X-Forwarded-Encrypted: i=1; AKwUvBzRQrAT7poGWGXNwYSNwx73I7v+/ET9ceWu0LHflx9ZyI/uOtKw/SNKNtNxJt7jFNeJ0kR94hY0q+ncUg==@vger.kernel.org
X-Gm-Message-State: AFuF++lNRRG2VTsUTXFyvKsGrWAtKoZWASiMARQp1D90En+f4Pwmvimx
	3+Vj0jl4QdE6/1MNJKy34S5+mblT6KLxoXMl0YDeblKCM7bMsFLvTuzm5XQ2yizyKRDE7Q0q8zD
	0Iq9uxoEPEICY1GY4bBQ227wvRsccos6ZX04n
X-Gm-Gg: AYBFou3NnH3FPHkK/55ryw8cjowI9Ig03yb9FjG8qqFaFsNinOSZaedV2TQClPuNwzx
	WaPxt2NU+1mNogI3pEe/1lXIun/OHnJQz8xFcFafdYee8o1G5KHb4OBv38/Q0/jO30xF4rVw9M4
	Bxh+vEDSKtGdRnZdX3hgz/dh1mjRYkcLsUyGOpeTBKha/gUiOM6CuCALz7GgDBiRByvDZnRp1Pt
	HHazW8ypV2mPFGkchMfrQ+11RyRzRqY9dtMa2EukjKVYvfl7RCwrxWZTr8UZ+FGAP6EtoEcEVA4
	f4u/ifo64TBT/aoazjYYr/OLetmGdb/kU0/kzgS6S1nqF+2OSgkgSVbBT7wqlBRE14lTabcrJkS
	UUMnQz2zx+H0p
X-Received: by 2002:a05:690c:a5c1:b0:873:5c7b:c109 with SMTP id
 00721157ae682-88d23a93ae9mr3186947b3.65.1789382553231; Mon, 14 Sep 2026
 03:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901155648.1538876-1-congnt264@gmail.com> <20260901160931.DD3811F00A3D@smtp.kernel.org>
 <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
In-Reply-To: <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Mon, 14 Sep 2026 17:42:21 +0700
X-Gm-Features: AcwNN1Xp6V1imZJqUrnncRhJzwCc7a07hx1hIztm_bzgAQo-zBxQwj_SL_Ey-Dw
Message-ID: <CAJpJ=Gsj2-m6kCc-jT8KiP2tGUDxKZ45ZdaZ+HXvOU3wH_ww8A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 9/1/26 09:09, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [High] The interrupt handler unconditionally returns IRQ_HANDLED whil=
e registered as IRQF_SHARED, neutralizing spurious interrupt detection and =
risking a CPU lockup.
> >
>
> As I suspected. This interrupt must not be configured as IRQF_SHARED.

Agreed, sent as v2 -- drops IRQF_SHARED too.

thanks,
Cong

>
> Thanks,
> Guenter
>
