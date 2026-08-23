Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228E2798F8;
	Sun, 23 Aug 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787513861; cv=pass; b=MLnsXUvQ5ZuOqwD/WlvVKNEI8c2xSsJtUhUSUNjurgKYZl/aRxacHYKKPLuDwPXgJa3Dj7mpcmpJMtHuSZ1VeaG5aKPQHPcVq0iOgaFgphg4BgQqxa9/HHdWICxm5MYFbidTBZ6H6g6Qea2HQDj5HhEtV6K0ruYyS4H7/iIs+G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787513861; c=relaxed/simple;
	bh=bAiHAReixFtpcHlW+VsThIabsxqRx9/76w+PXnWBhVE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VtlNFcMfeiNVhKbXvgCGUoUtLMY4IEK64rkJ2XddEtCFRkR0hx3ttZVP794t/3dx5RYC6M84cgFafLjhK2ZTi+Fa1NWJ/JqB/ozFHejof9C8huLHyASj/ShjW5bRJsM4ALvFaYuFltMcWQwEHyfAYqvmYMRW2KAR5QuCwSxOAZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=NQ3s9zo6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="NQ3s9zo6"
ARC-Seal: i=1; a=rsa-sha256; t=1787513835; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nWYEsloNRtF2/6MF63/rjT8qZfvGrq3urKzEQIYNejikcKPYV6HxfxK8y2GixuYIq84C26MXP8ifcriaQo9WucDgMUN40BNwFjJNgLtPrBr6AoluHTyNkSacJf4+EYpGD2rDrl4eifr5jXPDRwymUkH+WNDrtQhj6oui7SlXljA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787513835; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ixJ/17tbXgiE3w2WZkj8mELCwvbcDJWZHLD9OPH99Es=; 
	b=cHYX/SUR2QFUzEO1qO6tDmoh1E8u0sxrv2k9ODMSBU5e5lADbJy+h0mqlsHSzBkPp6Ff2XcgaCRMSGxJzjIlxhQO5ZjsVaAta0RqpseLzVw5bSmw6ZtFYchvozppC6x/bZ0fYA2ZDLHFcWwTBV2y5xFfc9jJQeVRxsH7eBb4czI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787513835;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=ixJ/17tbXgiE3w2WZkj8mELCwvbcDJWZHLD9OPH99Es=;
	b=NQ3s9zo6trjzI+e6AwEteDDfMscY2rWaFsRa10uDEpfQ/rd7I3sJL5tgZvXqhAhm
	XbbLzsqiZQyFJ3e90O++86FiZWLl8xVE6GGJ91iBFyuojK35VWZ1Yxe5vm+UURXRSnI
	BWBlkLH9KB9xdagErw3WkofhVwV/7fPZHkggxRag9YVU2XGE+AM7eLtaxVM78UCDC1B
	CMVmv0NfMlyewS1R0P/1nyY7o2lTzenohLhYkgBUjumInmcbgGcMc2gECQMk1z2sagU
	mNzQgyxA84VCvYVRR8Tz6sBa7tkPfEqax3R4TqwrkVnLrsNY54orE0F1NeAlbOD0YgH
	ENym3SK5DQ==
Received: by mx.zohomail.com with SMTPS id 1787513832172546.4160006730991;
	Sun, 23 Aug 2026 12:37:12 -0700 (PDT)
Message-ID: <3dca1e1efa285d8644b8ac681a5fb41742ce06a6.camel@rong.moe>
Subject: Re: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan
 controls
From: Rong Zhang <i@rong.moe>
To: Aditya Dash <mradityadash@gmail.com>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260821214728.87773-1-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 03:32:02 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Aditya,

On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
> Capability Data does not cover all fan controls on the Legion Go. Full
> Speed uses a separate Other Mode feature, some firmware exposes an RPM
> reading that Capability Data does not advertise,=C2=A0
>=20

"does not advertise"

Really? Please dump capdata via debugfs and attach it.

> and the custom fan table
> uses a separate Fan Method WMI interface.
>=20

The hwmon part of lenovo-wmi-other was done by me. Please CC me in your
next revision.

> Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWMON
> device. Patch 3 adds a Fan Method driver and attaches the ten curve point=
s
> to that device when both WMI interfaces belong to the same provider. Othe=
r
> Mode continues to work without Fan Method.
>=20
> The open question is how the firmware control range should map to HWMON.
> On the tested Legion Go 8APU1, values from 0 through 115 produce the
> observable fan response and correspond to Lenovo's 0 through 115 percent
> range. Lenovo software shows 0 through 100 percent to the user, and 115
> reaches the RPM observed in Full Speed mode. Firmware accepts values
> through 255, but no RPM increase was observed above 115.

This is what we've observed in Fan Test Data. We chose to enforce
constraints according to it and relax it when users set an module
parameter.

>=20
> This series keeps the native values unchanged and exposes the fixed
> temperatures as read-only automatic points. Should the driver map the
> effective 0 through 115 range to the standard HWMON 0 through 255 scale,
> or keep the native firmware values unchanged?

In your case, if there is no range data to query, I'd prefer enforcing 0-
100 by default and relaxing it=C2=A0when appropriate range data is provided=
 by
module parameters or DMI table.

The range should always map to hwmon pwm 0-255.

As far as I can recall, Derek once said that he planed to introduce fan
curve support for Legion Go, so I think he has some helpful ideas.

Thanks,
Rong

>=20
> Aditya Dash (3):
>   platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
>   platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
>   platform/x86: lenovo: Add Legion Go Fan Method curve driver
>=20
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |  14 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
>  7 files changed, 649 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
>=20
>=20
> base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
