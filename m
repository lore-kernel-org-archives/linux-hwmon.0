Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2224364E83;
	Tue, 20 Jan 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933892; cv=pass; b=bSoLBFFFhFjRWve5QwZY7Z/3+fUY4uuwEZ0Z/B/XDE7pFhogSp6vJ47RPt+Vq6tnlz7+UUA4L3XuBhpnJCDyXArqi+eDU1jJesGz5Xg5NodoEPJpSYA545MhPDi56r/Qjx3VvvdFe2IxWzosjefYQU/atxEr68y/5kh9Uk58LwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933892; c=relaxed/simple;
	bh=CHeVfbMa6tvnRD5GKkDb3wuYjdoXX99FUCVoGMyekws=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SGiLdMZqatiOXtLDTpQe2SzrV+K+8+NoGyvAy8L2dmqSUqp7lU20up+/1yTf+B+fXJPyn8DG60gMyhCeJDDQDnHAEPmyr109SSqdpaKbdd2bWxwmLVn4eerxOIIM9KXhdkGpDfe8dsdY3QBFVOEZQ12e8Tcacb1V1h7pKF7SKL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LzJkQM1A; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LzJkQM1A"
ARC-Seal: i=1; a=rsa-sha256; t=1768933868; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N17icuqakTe8/qyYPfzZPTMZH1KMXlj7oZB6o5hYLMF7Pp/j64aOhtigJRkoMB8d51/tLvQ1/LQnzvwKFzRWFWL2B69RKdYSEVRUE9jXhLYBXiwJZMEt1SsfUlViBKQ7wrtf7FKRwt9xa9XmfEJ2B9UdxXHvitodDIywXJCL2l4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768933868; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oFKD8PD0jDgrUZ9C2fIuuTFN4h8W74kZYTpHt2sMTSM=; 
	b=Y8QrwxR1FT69d8wyyTT+Txa+kj2JFNtOqzQNQCJFNfkhCiwnTWAfAeFm1myAxU6LFSL+GK1p3FMe/rjf84I1HH/SSeU2wB++CFyv8s46z+xhZXJxgPhCwOwaLTBnpz4tMGItTcSaZr2YQV2Zsfvv9M4r1MU/1KP97aIWIajj63o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768933867;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=oFKD8PD0jDgrUZ9C2fIuuTFN4h8W74kZYTpHt2sMTSM=;
	b=LzJkQM1AfvDHKmrFPx5aOlda+gk301HuuZNsqi52Pm4pdq0tlBKAEaXoMIAftmch
	L9ClcH5NDKwf5Wj7KRaw/H1nWAzdc1nTLEZs2qIIo7WLmdKjpnRoGkPsasFJ6d7M3fM
	I1wVdLfKM1DFTDbLuCOLfk+yDrKUt3OG3cSYsmZ8=
Received: by mx.zohomail.com with SMTPS id 17689338660237.585207430595688;
	Tue, 20 Jan 2026 10:31:06 -0800 (PST)
Message-ID: <71935526c5cc6580a1b7ccf3446adca16387eef2.camel@rong.moe>
Subject: Re: [PATCH v10 2/7] platform/x86: Rename lenovo-wmi-capdata01 to
 lenovo-wmi-capdata
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kurt Borja
	 <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, LKML
	 <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
In-Reply-To: <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com>
References: <20260117210051.108988-1-i@rong.moe>
	 <20260117210051.108988-3-i@rong.moe>
	 <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Jan 2026 02:26:01 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Ilpo,

On Tue, 2026-01-20 at 16:48 +0200, Ilpo J=C3=A4rvinen wrote:
> On Sun, 18 Jan 2026, Rong Zhang wrote:
>=20
> > Prepare for the upcoming changes to make it suitable to retrieve
> > and provide other Capability Data as well.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/Kconfig           |   4 +-
> >  drivers/platform/x86/lenovo/Makefile          |   2 +-
> >  .../lenovo/{wmi-capdata01.c =3D> wmi-capdata.c} | 124 +++++++++-------=
--
> >  .../lenovo/{wmi-capdata01.h =3D> wmi-capdata.h} |  10 +-
> >  drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
> >  5 files changed, 78 insertions(+), 73 deletions(-)
> >  rename drivers/platform/x86/lenovo/{wmi-capdata01.c =3D> wmi-capdata.c=
} (60%)
> >  rename drivers/platform/x86/lenovo/{wmi-capdata01.h =3D> wmi-capdata.h=
} (60%)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index d22b774e0236f..fb96a0f908f03 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -233,7 +233,7 @@ config YT2_1380
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called lenovo-yogabook.
> > =20
> > -config LENOVO_WMI_DATA01
> > +config LENOVO_WMI_DATA
> >  	tristate
> >  	depends on ACPI_WMI
>=20
> This series is in the review-ilpo-next branch now. Thanks to all who have=
=20
> participated in getting it into shape!
>=20
> While reading it through once again while applying, I start to wonder if=
=20
> this config would be better named as LENOVO_WMI_CAPDATA ?

Thanks for your suggestion. I've sent a v11 series with consistent
naming for kmod, Kconfig, export namespace and driver.

Thanks,
Rong
