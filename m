Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5F43C055
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611803; cv=none; b=mAfmwppN2Sdnp9t9GEJnVnbeluA8pLhMZpt+a60aZ99RzueiavDrld3g4UWze10GP/QpFetXq6gZ4e3kRDBrEV3SwMYSweDYx+PuWMUSHvVlPkEXKvhl94jN2ON/xiev4578OLcCpLXveLJII238YE4QLYiEpOVTcGIaJsIQHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611803; c=relaxed/simple;
	bh=Ds+75YFJtGmNzjqrySoUqeWKNE3zaT0QFe2501lpVco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8tChpp11kWgQf1JNXu5WjKyQspzEmMxWhsbeqeSMLT+wCuOdQZoq6FZDKqWy4YbYOBXnuvgerU7RomVD/sm4Wx2X1nA8Q5fM2YYYfYQzYO+tzIwy3HorYbdw9WcnC+6uMHeg9CFKyPl+hTkmzS+k78ahvkI6Wu2/nbpFIi3pu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/LBNClY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/LBNClY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939E11F000E9;
	Tue, 16 Jun 2026 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611801;
	bh=WXEsEYBd80Ju0iS1nq7U/6iPmf9UbQ7yT3cD4UFpL78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/LBNClYmPZOerPYR2nMvXrEVXw7xnSqGqZ/uG5jabZO1dVZV/g3d/ljlouGm5XV/
	 6UNuHsk48DIaHunbqmcgzwTqYw3hJybRmUixOa7YFAaqf4ZlPirqmXkEMKLCRrbj0O
	 uG5RGveOA1/qgY/RCxkclMVG981QRCg455S9024ska6lWSPdQB8D+i94OA0KOPvJHm
	 MWuxfbbMRBsPjeRmDIfvxcWOd7jb9XVc0LCzvilbUO2FxjrkyMnAtLd1haDcXDLz4l
	 U76xu2lvopMY1cHEd93WYDggLgwUBgaSs/wa+P2Ps4glsBVniWFLmmscEKTMhPeRWr
	 3bHq0vB2KYCCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: coretemp: Fix documentation wording
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260616120643.29079-1-xzhangjr@gmail.com>
References: <20260616120643.29079-1-xzhangjr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:10:01 +0000
Message-Id: <20260616121001.939E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect capitalization introduced in documentation fix.
--

commit 6d16e0e40567aa60f1f239fdc56d9c06e86611fa
Author: Ximing Zhang <xzhangjr@gmail.com>

hwmon: coretemp: Fix documentation wording

This commit fixes two minor wording issues in the coretemp documentation by
adding a missing article and correcting sysfs capitalization.

> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coret=
emp.rst
> index f63b21f24d42c..5ce125b0be2ed 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -44,9 +44,9 @@ Temperature known as TjMax is the maximum junction temp=
erature of processor,
>  which depends on the CPU model. See table below. At this temperature, pr=
otection
>  mechanism will perform actions to forcibly cool down the processor. Alarm
>  may be raised, if the temperature grows enough (more than TjMax) to trig=
ger
> -the Out-Of-Spec bit. Following table summarizes the exported sysfs files:
> +the Out-Of-Spec bit. The Following table summarizes the exported sysfs f=
iles:

[Severity: Low]
This isn't a bug, but the capitalization of "Following" was retained after
adding "The", resulting in the grammatically incorrect phrase "The Following
table".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616120643.2907=
9-1-xzhangjr@gmail.com?part=3D1
