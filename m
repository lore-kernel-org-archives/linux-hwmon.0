Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016993C0601
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323424; cv=none; b=r/ougwZh0UEUG9Dg89z5dET8jASyYPAo8MDJsjcywM3Jw4l7cd6ffsAqRZVu7iaFPRwAl+E9ES8RiMshc3fnp44s10p0bMwvIdH1hT5JU/weqrypdn6Q2HeikUr3zDDxsDkrfOmQlKxtt/gHxY4ZGzUZPBeoSeD65Oheq+Ps7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323424; c=relaxed/simple;
	bh=tq3QF/exKgMgQlmDQDIs6OUVz0quYMpHKnDxL5FykCI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s6H7UaO/aGTkCdMF4qytIb0VZs5BChC/te4MPy3x1ItLj9u49WM/gW103ENYIcXdVmZ9tEwKUMLMF29ETfXQbTDsFNHnfauIUsa/x/w8HJI/+rBDOTiNJBs+PxJYNQA68XuBX03VJb/lL4QgBJxoyor4zk4hEoQBu87LpVAjrxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISbP+U3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISbP+U3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8D21F000C4;
	Sun, 18 Oct 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792323423;
	bh=90+OhBATKK9D8eVuWymj6GdfKFTNRZlfi2qIZDpp3r0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISbP+U3kkTcSkeBeA21ch+BQt9uTHU3L/6ahPNQKTN5Cs3A2sf27qlXMfp7j02He9
	 YCbuUbU/PlUBAYp6n+DITn7PRhmkyKwSCURnYgRgDriitQlOQGrGWorgKINCFizLNc
	 PO3h16lNquwq2thYqXk2B4zwGogTxjgSfI2MojVNxZYf6mC704cjLjSPwDKvFCcUsQ
	 s/siODQv+2zV81XeFOh0+/poTZIymE8rfTknV5cA8f81I9zjF7muX/OqH/b2qa1ssE
	 aONoJZKx76ZgAhTOoM985+XRWyFH0fKELaQtmbi2ukW4BHQmodErMtKFE24L7nQsEH
	 q9ACIiCdOaAlw==
Message-ID: <sashiko-outbox-176085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by
 modifying sysfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Garg" <aditya.garg@linux.dev>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261018113248.12243-1-aditya.garg@linux.dev>
References: <20261018113248.12243-1-aditya.garg@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 11:37:02 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The fan_control module parameter in the driver enables/disables the user's
> ability to manually modify the fan speeds. In case the user attempts to
> change the module parameter via sysfs rather than at the time of modprobe,
> changing fan speeds is still restricted.
>=20
> The reason behind this is because during probe the fan_control variable is
> used to restrict the user in the following two ways:
>=20
> 1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key =3D=3D 0)
> 		return -EOPNOTSUPP;
>=20
> Here, if disabled, the OS will return an error and will not allow changing
> the speeds.
>=20
> 2.	if (fan->attrs & BIT(attr)) {
> [ ... ]
> this patch removes the second check. Now, if the module parameter is chan=
ged
> via sysfs, the first check will pass and user will be able to modify the =
fan
> speeds.
>=20
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018113248.1224=
3-1-aditya.garg@linux.dev?part=3D1

