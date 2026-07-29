Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA423388E66
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785351248; cv=none; b=qtpvoy0gE1gJ05ibGfID+8tdQA3IHy/2SVPO1/sFXJz93DV5WGqj+uh0AjoN1T8hdPhUsVQNIbRVMtP3SN6K/Rp1crc8+x+SlYVcKVST3xzIJ+bTCjqvGd9RQUam1fpSufpxdaTguMZhwHluQ2l2W69xT1AGBT8LeiZQKkzaYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785351248; c=relaxed/simple;
	bh=6zoZdSWUFC1Yh/KwmZfkp6cyAs6Uo+5LNkUL0WNS86U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDXbyPTgIVfL1RgNGVfzVuoFMPqRUoeqSwJ02DqYvKlmWbIPctdu72J5NmqLVctP3Ri3cvbA5yl6K/2YXW7s5c9lhH+z1qKfXxEvTWb3XxE4BpOeg97Vy//CfCDYyDmHy6jvhVfT1tmAyByYfLjhJbqaYudP3xgHE2DXNC800+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nu2b1DVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nu2b1DVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C421F000E9
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785351246;
	bh=jXQpDWqAb74OqEJpx4DwK5i29N3oHNBajY8MDldAJI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nu2b1DVon6yP9gCT0EmEj/VW7jjj9PYZH4YPz2Pmv2w06qJOSMECnrakW2mFX5XXO
	 qIoTef2Ra+R5xrWk1jHN3PScRK7VgqGGrWesSgSYZ/ruZXUWt5FOr2GllbjOfM4p5E
	 mAly2BjbjHfO2hIXjZp+MgvZ0KTk1L+pmG6DkdRsoV9o7Ut/EHQXSujlXaFUudKPsI
	 en+5u25ZqTIibZOkUnCEZvVrDoF32vGKM8Ep63oLeVyiN1hWEh3QLiyz4AvouHryvK
	 ZnHC7C9xgwwxNrYTP+7wK6b3L+mj2Y/cVprZlfxhuiAUyiKBo5TTRW15h0i5enJKwe
	 20gBR/xhYewKQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c62764c7cso408001fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 11:54:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YzFV1t7sSElVJRKDX91ojFJm+O4bXwYCGk7fmaRBYdovv2lJeRi
	pPEBO05AQ1rRv26lRlcIK1/42F17vbV+jQqBxU1CpnzpPxeNzXwNDo3/z8BxzDzozT2eSlhoRb3
	5XIlLPVAacVzpAWJlshBV1Ud7udjQYx4=
X-Received: by 2002:a2e:a547:0:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-39f604633f8mr7411561fa.0.1785351244980; Wed, 29 Jul 2026
 11:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJZ5v0gcatfUYocWViAZjs=BkqSz-JK+bECm2cpanv9NrWgfnw@mail.gmail.com>
 <ab8b093b-46e6-4738-afcf-4b97c9ad5af9@googlemail.com>
In-Reply-To: <ab8b093b-46e6-4738-afcf-4b97c9ad5af9@googlemail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 29 Jul 2026 20:53:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hw0Zhr190_V=OenLZGtOsTvb7T6UA7BPU_qoLbHa2tDA@mail.gmail.com>
X-Gm-Features: AUfX_mxP7-FuMFrOAKn4CTf3Evrj9-SzgxgmNPJSqCXGuO3DOKWs4bnn3-Ps8sg
Message-ID: <CAJZ5v0hw0Zhr190_V=OenLZGtOsTvb7T6UA7BPU_qoLbHa2tDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
To: Oliver Freyermuth <o.freyermuth@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, 
	Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 28, 2026 at 11:26=E2=80=AFPM Oliver Freyermuth
<o.freyermuth@googlemail.com> wrote:
>
> Dear hwmon devs,
> (please keep me in CC, I am not subscribed to the list),
>
> after upgrading my systems to kernel 7.1.5 which incorporates this change=
 (Arch and Gentoo), I have for now become aware of two places with userspac=
e fallout from this change:
>
> * KDE / Plasma System Monitor
>    Report: https://bugs.kde.org/show_bug.cgi?id=3D523588
>    Corresponding userspace code: https://invent.kde.org/plasma/ksystemsta=
ts/-/blob/46f7e842767774b96bcd22edec0636a267151475/plugins/lmsensors/lmsens=
ors.cpp
>
>    As Plasma System Monitor remembers the (full) hwmon sensor name in all=
 widgets and thermal zone IDs may change depending on module load order, se=
nsors are lost both after upgrade to 7.1.5 and at "random" boots after (whe=
never init order changes for some reason).
>
> * (good old) gkrellm
>    Report: https://git.srcbox.net/gkrellm/gkrellm/issues/98
>    As shown in the report, gkrellm remembers the full hwmon sensor name a=
nd hence is affected both when upgrading to 7.1.5 and also at "random" boot=
s after (whenever init order changes for some reason).
>
> My custom Conky script followed the established practice of these tools a=
nd also broke, but in my case, I fixed it myself by just ignoring the therm=
al zone ID if present
> ( https://github.com/olifre/conky-themes/commit/6d015b9d9eae21ffab8c5571c=
387534bb93cbc50 ).
>
> As I do not use Gnome or other system monitoring tools, I do not know if =
the fallout is larger than this,
> but given that lmsensors returns the new names with thermal zone ID inclu=
ded, it seems likely other tools suffer from similar problems.

Thanks for the report, we'll clearly need to do something about this.

I'll see what can be done and figure out something.

Thanks!
