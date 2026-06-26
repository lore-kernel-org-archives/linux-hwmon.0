Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992D30EF91
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782448995; cv=pass; b=DzoPCyrhNL7FMVtiNk8Lf4hQH/tyocGMYWTcsEq8higZe37EyRSQBiB3b5fTaOWqZxoXS8Zss1aDXryVZJrLW7SX9cd1bAsu6dodq0fszp4G5OmU9b0t5Rwall4To9PZGtYFmESIdrUgMMfxSBhPNeBC+pfA3E2VFxoQzepuRqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782448995; c=relaxed/simple;
	bh=2W/kuKVfeIFApArreGCFdGTDVHQp13dJZqS8zZoDex0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQmiLoHbBDlPNqZ/F1Nx5j00mMsXl9x2Tl5I1UXuuCJ8+vW8I3b12d2Jon6fBvVxc0tWzs0tP4mZvIPgkH5HnNwnW3bvVbtU5qHpBUCfAuwpbsmRgnC/+NfIM9sXPWR+3uHiNjaYU5AjuL9vZjT1JEnWRFDPQ3xOvfBrohDrASw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh0VqIMe; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh0VqIMe"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8dd586317ccso6114556d6.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 21:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782448993; cv=none;
        d=google.com; s=arc-20260327;
        b=GPLvPP0O5jz82cZeNLBOeWBhdjlbTajlN9R7QRkeCviko5O99hFh8VzxXcNaUHWYYz
         DZhA5bpVTxqkOKUZL2zOiBYaVAxNIlHJeaQmkuFnmZQ0L9DsyZpC6Gn7BYg8lrVQqFng
         DSWrShjg5tdlFEKYhv+pTVWQ60eDPi5EYlSyi5SOgH9xRT0aFwHQE4hQI+o8ocWzxmEM
         0JA+bYf8p7sYJ3g4aU6+0Rri8wKkSDBVYMdZylNeeyI5Hvla0OgQVppYvx9eIvELKI+u
         Yw3lIFJIXEuXovTQSyNgoLHZrsbTrxAcn79KE6u8NQkCQxmeVFZ0AIy1+1rxaSCQoVV0
         zmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMNU8p8RGYYXsCQ9wCYNatXpyjUVL2iWRyo/FTX1ZqI=;
        fh=Dqm0F5kH+IFGCFyFQlZJM5XQx3pBh1159x+IRHTkOpU=;
        b=fl9o3aVsxKmKnx3Pso54a8tMVH5aNaH3bBFV0LZg6SXfnlnKoXEw4vfgF37P1OP7ay
         Z+b5kmJa2Ztk3So4sRc5HawmE5JaJZj9jo0UDkBAlqd9RjvIMMFotZaZLjg1/tWdcOQ5
         DFGB9SLaqAd8MGWrb3uBIy8SgkvfV5kk+OSXLQMf36hz9jr8zOIlqO1IXOp8K83VzrbN
         0MkMmchV5S4wokwmfwnKdEN8+ou823W/hG2WW/QLbeL01+MDFAI57R28Vm/RXTDa4STV
         vdOY+WohbAJFWTkB4f0nh5YW9VPDtyKbSDlUXqVscU6+B4IIjG9V29CNmehUHmWYY+6R
         d34g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782448993; x=1783053793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMNU8p8RGYYXsCQ9wCYNatXpyjUVL2iWRyo/FTX1ZqI=;
        b=nh0VqIMeDZt81TjTVIj6t9vH1W1VtT14IsBm5NGn928tGOOoGl3Ra21PtaZxbliZsY
         z3Df/gOMpw0ZlaKDX+PNG/D5o3o8kE9FhzVmmGJ1ntTIMXTQ5Xe4LIG+0NKZT/t2XxyC
         D3L4azMaNN0sDg24Kyn27noB3d1uwQtuO1m+vIKb4uVUuDs0qRNvMXWkofSPmoVjaeGq
         OlNJNHKiwMHd2qD3MtIg5RFvKYfQILucnNrqslOkIn8CLaGwBAqYBCn0Fgco57/Hne/H
         0i4fphg8IC/B4kFgCBWbJ1PVILkbi+UEP2FBnb2kxKJfdZ4sMqI1j36t9v2dF36WBetH
         a5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782448993; x=1783053793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMNU8p8RGYYXsCQ9wCYNatXpyjUVL2iWRyo/FTX1ZqI=;
        b=O3CQsNE3rt4s3N389DtsBvKWfvAyPs1xvRUq73epbPcBD8vLDy6JeNLXE8pdv6cPD1
         2J+HoZvYvqvGnI0TB9FTxnTXt/sfXbkP2B58I6+48CcM3J5YZz5WGWvgsnmCCb0e/KTr
         vHG3uADTxNPVWVBZEvVR1+iFE3IMV6bRnNfqOynkW3ecQYjbzs6GKrVR9KVJanZ57jOp
         RGd3rfTDrZ+jf4xMb9PuLYq+i/TWQsY4n/q+rovbAXUVETL+whEN62kbG2GiuYzuS3Es
         yVnsC3WBNGcFlCd120IuJNkNEGImKJJv9Q6Vcl11ZzYAQfGdjR4G7s5i/oUT5f4ZAoKt
         MRTw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1j0V8JghPLprnoDDdVvtIZ0Y/XYCnlk6bzndm45a/6LI1ZOFJzRov1dKFa81rCFlMGBBEYyYvXkSnMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPFffWRMoBB3lqE6iKtT7BcvF2WkUzI3XuqX1Idj5ATdK2kLR
	/kvkzTvSb+L5YSMiPX3iwARGlJFIO9FdaMZkvdknvsusvr4Gg2iT6tvc+xXJnlVYFgr0KcU8hzs
	2mELKLDRjRDnX/E9NPD1ktSnsWd2aYT8=
X-Gm-Gg: AfdE7ckJPSTmNfcCJeWKDHh4JJTUxt5+y4Dv2lwKsXicNRw0fT6gZ81WKHCFgBQD5Ry
	Oq8JXNnJrokpLQaPFYV3HxpznNJ2UzKln0RImlZ45l/M6zAFKBtSfZAJBslMIoS43uL0hq2HzIG
	eQOQMTuetEw2nNkleRGNLBP0bCl2h/WMnAzy97kXYiksv+ONBN99w9foX0y83XqVaDD+XJOkXsD
	xdM/zN73GSHoQc4JYEpfereppdjVajErMFOkBEdqf7xPux2wMWi2bDf1uocJFlVfJf+8FSUeEgc
	znA6W4HpL8peF/10HfvusHaJXvQn
X-Received: by 2002:a05:6214:d65:b0:8cc:ce03:c020 with SMTP id
 6a1803df08f44-8e6d50e1615mr92063466d6.20.1782448992833; Thu, 25 Jun 2026
 21:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
 <9d78023d-9a00-4bd5-839f-2a79aef4b7a8@roeck-us.net> <CAJvdc_fpMR1T-p0YWOcmFEZ+YB+LHAQtxRSgMCaDti3E0cLqGg@mail.gmail.com>
 <5cf25e6a-1d58-41c4-a628-3ff125ca5f42@roeck-us.net>
In-Reply-To: <5cf25e6a-1d58-41c4-a628-3ff125ca5f42@roeck-us.net>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Fri, 26 Jun 2026 10:13:01 +0530
X-Gm-Features: AVVi8Ce2S4rbbMZ8eAp2Z5uyZfCuPm7VvOlsXr_7mtQHNkhxYbOPs1VzlIdWoX8
Message-ID: <CAJvdc_c+MKRn+sUi7bBRTwrJk36j=8+rYqjJVcNvg_EH48H2ww@mail.gmail.com>
Subject: Re: [PATCH 0/7] hwmon: zero-initialization instead of memset
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, nuno.sa@analog.com, abdurrahman@nexthop.ai, 
	bartosz.golaszewski@oss.qualcomm.com, linusw@kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,
That makes complete sense.
I understand the risks of leaving padding bytes uninitialized now.
Thank you for taking the time to explain the rationale! it is a very
valuable learning experience.

Thanks & Regards
Manish Baing

On Fri, Jun 26, 2026 at 7:29=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 6/25/26 09:04, Manish Baing wrote:
> > Hi Guenter,
> >
> > Thank you for catching the struct padding risk. You are completely
> > right=E2=80=94Patch 7 (it87.c) would trigger a KMSAN uninit-value warni=
ng due
> > to the kmemdup() copy in platform_device_add_data(). I will drop that
> > patch entirely.
> >
> > I have audited the other six drivers in this series and verified that
> > their variables are never passed to memcmp(), kmemdup(), or hashed, so
> > the =3D {} initialization is perfectly safe there.
> >
> > While this does not fix an active bug, the goal is to follow a cleanup
> > pattern  recently discussed for the IIO subsystem [1],[2]
> > 1.Better performance: It removes the need for an extra function call.
> > Instead, the compiler clears the memory directly and more efficiently.
> > 2.Safer code: It prevents accidental memory leaks that happen when
> > developers make a typo in the sizeof() calculation.
> >
> > Would you be open to a v2 that includes just the six safe patches to
> > modernize these initializations?
> >
>
> Not really. I would not mind if there was a safe means to initialize
> a data structure without risking holes and without memset(). In the
> absence of that I rather play safe than sorry (and apparently we have
> a different opinion about the definition of "safe").
>
> Guenter
>
> > [1] https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-inste=
ad-of-memset-v1-0-ebb2d0a24302@baylibre.com/
> > [2] https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
> >
> > Thanks for your time and guidance,
> >
> > Thanks & Regards,
> > Manish
> >
> > On Sun, Jun 7, 2026 at 9:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 5/30/26 15:13, Manish Baing wrote:
> >>> Hi all,
> >>>
> >>> This patch series cleans up memory initialization across several
> >>> hardware monitoring (hwmon) drivers by replacing explicit memset() ca=
lls
> >>> with empty brace initialization (=3D {}).
> >>>
> >>> Following similar cleanups in the IIO subsystem [1], this series upda=
tes
> >>> these drivers to stop using memset() for stack memory initialization.
> >>> As noted in those discussions [2], using empty brace initialization (=
=3D {})
> >>> is the preferred approach.
> >>>
> >>> Beyond simple replacements, a few drivers (nct6683, nct6775-platform,=
 it87)
> >>> were using memset() inside a for-loop. To fix this, the variable
> >>> declarationwas moved directly inside the loop and zero-initialized th=
ere.
> >>> This safely resets the data on every iteration and makes the code muc=
h
> >>> cleaner.
> >>>
> >>> Testing:
> >>> - Compiled all modified files using `make W=3D1` with no warnings or =
errors.
> >>>
> >>> [1]: https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-in=
stead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
> >>> [2]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook=
/
> >>
> >> That discussion does not fully address a problem I had seen previously=
,
> >> where {} did _not_ zero-fill all holes, causing subsequent memcmp()
> >> failures on affected data structures. It took a lot a lot of debugging
> >> to find and fix that problem. Given that, I am not inclined to accept
> >> this series unless someone convinces me that it fixes an actual proble=
m
> >> _and_ that each and every instance of the changes is not used in a
> >> subsequent memcmp().
> >>
> >> Guenter
> >>
> >
>
