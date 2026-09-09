Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF54493D3D
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994703; cv=none; b=Fwm0tZuE0snKDQkoqkZh10Uv7qGp0UOrpNUkH5Qh3A0Os14AFUQ7YSszOZ77CLc/ZpsMwebBMFj9vfEneZyaj+SoNbW6nNL0SsM0ylbKdA60OiAzI4XSpYmv3otYe4ZF2HF6xwapsiw4DXK7gt7nEDVoRy5i69lO6+deuZpWyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994703; c=relaxed/simple;
	bh=85yRN7D4l20hvo7xBWIvs7ka6k15Fg1SiN53nJroILQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lefCEOgv2CmE3AmtS0qBbuFftHXFu2zdd3wFmiURTKgFQkmopfwzII9FQvr8v8JpkKlJqfQZS2F4GZKhVy3AkAAfQ6M7KCwIW2Kxpc7jAWmE1mu/b/pJWNzTv7C4OKhgwSyfGpHaN8t8MTjUPTbqXXLnq/t8EWUIzfLXktQ+e0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Alzl9m5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Alzl9m5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250701F00893;
	Wed,  9 Sep 2026 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994677;
	bh=pWQaV3XSbjzGLgD+WxK30ifOP4cbnh2Q3TetufaPjT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Alzl9m5ETJjGpKioyAPLqJAi8QZx+Hm57X4njsl5SDWCwTETNsM7zEpjIBRTgzJob
	 Vs7YrsBRyfcx3yzixccNIWwWtyETDEel+K4onZlkX1so93UColJe7NCw1Cob2CPFdL
	 mVaXlA/PyIgxpoEMnV6R4D0ta8jjMXuV281htokw7LT72/DxTcWaMzFGvAxmzFnF/N
	 0/ucKSMXNXoHcJ7H4U/vIJl1/H5fgk4Ax0d82CRrnfCGI8omYXcFIOTPT6uyDF1guh
	 Tax3aeu890RAGAv3SFHYk6yVJMEIUFiCR+xmcUFz/nNJ7ZvVXyYP+UPBChQnRBBICf
	 nilBLXPhU4wgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-5-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-5-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:57:56 +0000
Message-Id: <20260909225757.250701F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unsupported threshold attributes are unconditionally exposed in =
sysfs, violating hwmon is_visible semantics.
--

commit 7ed3607652912ec9e3313daf244c76341872a2fc
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: report temperature and voltage thresholds via hwmon

The firmware capability response carries per-board temperature
(min/max/crit) and voltage (min/max) thresholds. These are parsed and
exposed through the hwmon interface, returning -ENODATA if the firmware
did not report them.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index c8e7ff1d36fc1..7dc4d705f5662 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -7,16 +7,6 @@
>  #include "fbnic.h"
>  #include "fbnic_mac.h"
> =20
[ ... ]
>  static umode_t fbnic_hwmon_is_visible(const void *drvdata,
>  				      enum hwmon_sensor_types type,
>  				      u32 attr, int channel)
>  {
>  	return 0444;
>  }

[Severity: Medium]
Does this unconditionally expose sysfs attributes even when they are not
supported by the firmware?

Since this patch introduces threshold values that might be missing and
represented by FBNIC_SENSOR_NO_DATA, the hwmon is_visible callback should
return 0 for those unsupported attributes rather than having the read
callback unconditionally return -ENODATA. Creating sysfs entries that
cannot be read clutters sysfs and violates the expected hwmon API contract.

Could fbnic_hwmon_is_visible be updated to inspect the cached capabilities
via drvdata and return 0 when the corresponding threshold is set to
FBNIC_SENSOR_NO_DATA?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D4
