Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD001FFC59
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948080; cv=none; b=S0QaMSkPwMumjTTC3bul4KkMaqfYQXl5f3BGX6jvguM6rroGQAK4fFhbJ3wo75cSLURX5oUdYD91h0La97TrJ7co/c3lZ0r0b+EkskSa/Xe5ATn5ggQ7r3CJAqQbsGZ6XIPhqas39mE2u4DxhYGmK7DNn00U5uiCQbiM5Bi2ryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948080; c=relaxed/simple;
	bh=k0FB2BPFHB1GKLfcdvJ9cPJHUCjk3QDaOncLv3OC1E8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJhtMm8FvN4HwiKOYvPQaRj94W5ZC/5GLXgZKQrBlvDvdFfi+MXnNmrGxEMO81D78ekAg4bChHAtjbT5/OVM3JZOWqXWrHVaUIUPSUI4Zcp22Lu/GsfX746loEWTZ6BXhk+j2N1MeacJJHel15uuWc77m09j5S7tME0KIGdY2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=US4RIag0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="US4RIag0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A457C19425;
	Sat, 16 May 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778948080;
	bh=k0FB2BPFHB1GKLfcdvJ9cPJHUCjk3QDaOncLv3OC1E8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=US4RIag0QkWpD7J3kYlCgQdlxBCWN8WEVKPaHgvb0OwZjOfExRSKeVoshYHkPah2n
	 AP1zcON6rvHmsuVEKtR/jafWUcOdo9OQ62g8NzdWL5epKLFjFRxX/EUrlMw0NjE0IH
	 uN4mWV5MCpk0ugG0m16KTcMynyAYkrLtL8fTKkhvrkQhGLKCX07/eyJjUGq0u3ogHO
	 t9VxZ8C4r8OrKObZNzRQlGidocj9G3hGuxK2E1j9DjCRd2My6/rmGSroxlmxw2I0rH
	 D2g6DFOt1r2BBJfl2FUgw2yATf1YC1EL8sMOxTE1vaEEgQlQaQ5QjG5N1mPk6GPR/X
	 eRv5JW2QfS1Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation: hwmon: lm75: document sysfs interface
Reply-To: sashiko-reviews@lists.linux.dev
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516161037.1486-1-eric039eric@gmail.com>
References: <20260516161037.1486-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 16:14:39 +0000
Message-Id: <20260516161440.3A457C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added sysfs-Interface documentation omits the `temp1_labe=
l` attribute.
--

commit 9ea544e30685306c26501a73ae7941baf5244e12
Author: Chen-Shi-Hong <eric039eric@gmail.com>

Documentation: hwmon: lm75: document sysfs interface

This commit adds a new sysfs-Interface section to the lm75 driver
documentation to describe the supported sysfs attributes.

> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508ef..cbf737948c1d8 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -181,3 +181,21 @@ is supported by this driver, other specific enhancem=
ents are not.
> =20
>  The LM77 is not supported, contrary to what we pretended for a long time.
>  Both chips are simply not compatible, value encoding differs.
> +
> +sysfs-Interface
> +---------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +temp1_input      temperature input
> +temp1_max        maximum temperature
> +temp1_max_hyst   maximum temperature hysteresis
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Should this section also document the temp1_label attribute?

Looking at drivers/hwmon/lm75.c, the driver exposes the temp1_label
attribute via HWMON_T_LABEL if a label device property is present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516161037.1486=
-1-eric039eric@gmail.com?part=3D1
