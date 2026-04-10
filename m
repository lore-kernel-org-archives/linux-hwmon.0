Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B53A783C
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815175; cv=pass; b=AioVFw67MlbGHFTzg2KK2JhLE4lrdyLBoMmz/SF+U2eoSaZvzXYYzOyovgcitUPO1qXxxWzKSn4H3DherYvOmcJvDrkdr3D6NUchVEAYbSmBJzpK41C77j7GFJOFEGXwY4Fjs5ueuKfWgf7ApoQViD76SNMuQGm7ZMaxeCI9bTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815175; c=relaxed/simple;
	bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+Xnu9SBFwS5xUJ4smqvjGKWUfHUCGisUg9tK4cl6iCPfPjsqseEVEmsg0+7P3mBm5oNull7p2ugO3can+5Mg4k2d3inq0o4ulh8AYrV3C9T7l+2yO+dNAahAAfdZ0vZFlVUf0a/DSWlf3ObMlgH6OWy0maRfsOyTPDFNcpBElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rErJRG4Z; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rErJRG4Z"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a7109f568so21619297b3.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 02:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815173; cv=none;
        d=google.com; s=arc-20240605;
        b=XnGwHyrC1k9qcjuBqAZpZGk1Pyb2dI+tVMcEnm42wFp8Itte91ljP8ZfeE4kKJRyyr
         TdNwLeEKmhSfRXdBOo6KPDleumC1nLVH37/wYGzujWWAMDrzAkPgsuRxQ8CPU1MLjmE8
         F8rfpaf3gA5acez8ny3eu9UCIt/7GAQ44zAbGxFOqxzGMabtcmYfHUGozz+iqS29Jm2/
         IsSjcHomt38zYeu6/Lo3HEntyqn930IPi0ItUzDPaG7RXIGBFPwavgH1J5QgD8OWBruV
         3y9ZtGoTxB4xGbXF/omXpBxr4ooZhbSnGO3YdKq1IflWA1nni+4X8gCPYeyVlY1SQggX
         n4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        fh=S9qHnmUrlXIjBwW/qDyWASZrEJ1m3VsSW45DeX7gll8=;
        b=fYR/rmYQi4GCyuzXxJ9UbSa7Ks3RDTWDiE0cjDCxuXcPAzX+oAK96Teif3D7hYIA/K
         YuhImCILp5dVRuXaqrAl1v44AJ7egJewvRwiD6/jndMtginAlKBmSUGgj38u5UKDJ6CN
         rV1ZOUIb4rxj/ySnD0UP4jvNtvbUFShIqI7wf84PAWiRGHuDp8EYbRO2DPj9wc5GWvt3
         JZC4suT4SORXkB0+iEu5SU/vFKxeyS58uMWBSCLAwdWxIZR8pXOh3nWFQjoJEDxc2HVO
         7LLkFNBygFp/TE8jdaP/Ft9WYi4NGomI6MLOtIBhNM/eRpeEaHD/y6b3Cni6I77X4P6u
         DfGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815173; x=1776419973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=rErJRG4ZXVbUQMFbRFnmhepxOtcXBpodg5RLaOgBH+BoRSymMMJ7ImR40QJedCzbyW
         tMf1Kw0G48yG1WZj+bNeo4MywgSjIiHC6+mdUiWs/1trlCFn5wz1/AAEssiw7iJpV45I
         HfNU8cXmReN8Nsez829lTb/TBvUrr77OsqHawEgFSQ6vY1oOAVLWJ0U/Z4+fMTe/VFCg
         IR23/Yp54EUoq9dhxidWHZuyoQIaTlIzdzfge5/sD4+zoIksk5Yd0vqptdZ4fGSwlDMf
         y/S/uZCe8K9ouwDdws1zrrxjoze6PKxwMOQ8PgDitKmFK8vgUphQisVdc+pg/trHdpwt
         wTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815173; x=1776419973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=nmBXdKZA8yzEDyl3mYuwndjHP9sdQeTPNoFdcNfAVcpsIkwKqT4SdCHmOnzFbCsq5g
         02QNvDBZknPcDfjE0qa9YxEYS9qsq1DgLGqlo+0lQIVTmSWgoLhakE/RmQ4gYs8Gg3oR
         8Dg3kogMuq8+6xLY5oTaW6VmfmyDrL9+06u83Z1iUVKZicZydqCDh3KgOyftgLHJDnto
         TZntnbnN25HWPpvzf3J8Kkn2ST6DApKWIKxRKzW7YrO5vFwCb05/U87XvIjfep5/JuJO
         13TiwjPoWIsUKgTGMnSKTHu5Y79aJWRkx7ZHRn1Njkn8wtq2+i24CCYjShHmi2UkitU9
         5sqw==
X-Forwarded-Encrypted: i=1; AJvYcCW7fJ081Pv7z0Ao9/77igp/kImb9EazpzqlQwmmnNwFEsuJLnsiW2nQ/5MFtwFWEqjh0gqgHVBcb9y7Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmJtwRjLOT42uUq7NRL4EYG3P3eeojmz5lJlWDnf4zOs1topP
	KVzajVDTmYRmbLeKtHro1XkdmOdEDNms71m38oTV4zCOSVnP9r3jZOTDF7uVatJ4muKt0WrVH52
	1+AcTajAOrQ2j9Cq07atBUftE61CbHeI=
X-Gm-Gg: AeBDievfh1iRSO2RkUvfcGGaBDOP28sHugraOaa+vYPmhy1Ukp3iQpXLW6qSRf8GHvk
	TvaD/FiPH2PeeIt8kQp1T12fMWetoAYG5EYYuDJkAv+YurSq1hqQQBvWLlaBt7Miv9UuYWAhu86
	fxEsLNNoHyhTzNYf3l7jyss+kdSYNWEarp7Ov2wzyzEvFOqJHfrQ+p/hJDKNdp8sNNKY1sbkcfR
	z4prLkAcoqygU2o0q+R4m51TAi+/CRfzqKkR4W3c/MNGwDlhb2cORy/gWfAdffEy7NmkZ0j2J6Z
	m7xYAHp/p3kVmsIRkuvvtb2Txj+/IhchxvdBQk5i3g==
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7af6f907f77mr24281587b3.12.1775815173216; Fri, 10 Apr 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408053037.1867092-1-a0282524688@gmail.com>
 <20260408053037.1867092-2-a0282524688@gmail.com> <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
In-Reply-To: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 10 Apr 2026 17:59:22 +0800
X-Gm-Features: AQROBzChhaENjKRgm1eiXEkKC5Ek3HBghHXiZXP2Ngye9h9-wWZ61ho7Hz-V2Tw
Message-ID: <CAOoeyxXqUbdd3Y0VorzVVOARVpoEkx033sYrv5Hs4tRfst2tOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and
 drop IDA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bart, all,

Thanks for the review.

Bartosz Golaszewski <brgl@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Apr 8, 2026 at 7:31=E2=80=AFAM <a0282524688@gmail.com> wrote:
> >
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
> > and an IDA to manage subdevice IDs.
> >
> > Switch the core implementation to use the managed
> > devm_mfd_add_devices() API, which simplifies the error handling and
> > device lifecycle management. Concurrently, drop the custom IDA
> > implementation and transition to using pdev->id.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> This does result in a nice code shrink but I'd split this commit into
> two: one switching to using MFD_CELL_BASIC() with hard-coded devices
> IDs and one completing the transition to devres.
>


You are right that this change is trying to do too much at once, and
splitting it as you suggested would make the series much cleaner.

After looking more closely at the ID handling and hotplug
implications, I realized that switching to devm_mfd_add_devices() and
dropping the IDA is not a good fit for this driver. The current
mfd_add_hotplug_devices() path uses PLATFORM_DEVID_AUTO, which gives
globally unique device IDs and avoids sysfs name collisions. If we
switch to devm_mfd_add_devices() with fixed IDs, multiple identical
NCT6694 devices can end up registering subdevices with the same
platform device names, which would break hotplug support when more
than one device is present.

So I think it is better not to pursue this direction further.

For the next revision, I will drop this part of the change and keep
the existing MFD core logic, including the IDA usage. The series will
focus on adding the nct6694-hif MFD driver only, and I will add the
IDA initialization there as needed.

Thanks again for the suggestion and review.


Best regards,
Ming
