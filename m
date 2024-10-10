Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED91C3305
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559922; cv=none; b=IBVPQffqIwY4rrvpWiAz+ZCt4klZN41dMIWyqnYsh39c0GQz5+vCV99osqSZmQcjT8N77VC17/qEPX2o0ozw+fkmRuYytzlQHZozkh1JJZCL4jZ7y+OnpEogd7UmZ0wQOAfb6Qx0H4lBvT40/555EQ23bOo0367Bnh44M2YBp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559922; c=relaxed/simple;
	bh=SL4PpqPcOP4nmL+EwVGUfYGarLV2YKWOxHHwDGCeykE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBXm9paDsRHtLSabAQdvRs0pVFlhBD7R9m5cZoefRZD+5HtGPEFtiKUtRdAN2j5eHBSNHpPzsEqesEtJ6eabXmiNn/+Qr2ihlXqLPODjElNM57DXT5w4hZeS4Bzu4xRjeXRO/U9ENVOm/i/MnuKWBr9yxqM7GdVPw8yE2zD5ibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPSCq4FLLz6LCtJ;
	Thu, 10 Oct 2024 19:27:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A11414011A;
	Thu, 10 Oct 2024 19:31:56 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 10 Oct
 2024 13:31:55 +0200
Date: Thu, 10 Oct 2024 12:31:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>, Tim Harvey <tharvey@gateworks.com>,
	Jean Delvare <jdelvare@suse.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
	<trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Michael Walle <mwalle@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>, Ivor Wanders <ivor@iwanders.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/9] hwmon: Add and use helper hwmon_visible_0444
Message-ID: <20241010123154.000031eb@Huawei.com>
In-Reply-To: <fa07443e-4ca7-4bd3-b027-c16a1a60edc4@gmail.com>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
	<5ae4e8b9-1442-4764-9a16-db08d099a1e6@roeck-us.net>
	<fa07443e-4ca7-4bd3-b027-c16a1a60edc4@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 10 Oct 2024 07:44:31 +0200
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 10.10.2024 00:19, Guenter Roeck wrote:
> > On 10/9/24 13:02, Heiner Kallweit wrote: =20
> >> Several drivers simply return 0444 in their is_visible callback.
> >> Add a helper in hwmon core for this use case to avoid code duplication.
> >>
> >> There are more drivers outside drivers/hwmon which would benefit
> >> from this helper as well.
> >>
> >> Heiner Kallweit (9):
> >> =A0=A0 hwmon: Add helper hwmon_visible_0444
> >> =A0=A0 hwmon: i5500_temp: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: surface_fan: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: sl28cpld: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: gsc: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: powerz: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: raspberrypi: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: intel-m10-bmc: Use new helper hwmon_visible_0444
> >> =A0=A0 hwmon: nzxt-kraken2: Use new helper hwmon_visible_0444
> >>
> >> =A0 drivers/hwmon/gsc-hwmon.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 9 +--=
------
> >> =A0 drivers/hwmon/hwmon.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 7 +++++++
> >> =A0 drivers/hwmon/i5500_temp.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 8 +----=
---
> >> =A0 drivers/hwmon/intel-m10-bmc-hwmon.c |=A0 9 +--------
> >> =A0 drivers/hwmon/nzxt-kraken2.c=A0=A0=A0=A0=A0=A0=A0 |=A0 9 +--------
> >> =A0 drivers/hwmon/powerz.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 8 +-------
> >> =A0 drivers/hwmon/raspberrypi-hwmon.c=A0=A0 |=A0 8 +-------
> >> =A0 drivers/hwmon/sl28cpld-hwmon.c=A0=A0=A0=A0=A0 |=A0 9 +--------
> >> =A0 drivers/hwmon/surface_fan.c=A0=A0=A0=A0=A0=A0=A0=A0 | 10 +---------
> >> =A0 include/linux/hwmon.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 2 ++
> >> =A0 10 files changed, 17 insertions(+), 62 deletions(-)
> >> =20
> >=20
> > I really don't want to add such hwmon-specific but at the same time
> > generic helpers. If such a helper is made available in the core kernel,
> > I'll be happy to accept patches using it, but otherwise please refrain
> > from submitting such patch series.
> >  =20
> What would you consider a suited place, drivers/base or fs/sysfs or lib o=
r .. ?
> For enum hwmon_sensor_types we have to include linux/hwmon.h. None of the=
se
> places has any hwmon code, and I would expect concerns if generic core co=
de
> includes subsystem headers.

I don't see this as particularly generic.=20

For normal attribute handling with fixed permissions you'd just not provide
an is_visible function and hardcode the permissions in the attribute.

Maybe there are other users that need an is_visible callback?

Jonathan
>=20
> > Thanks,
> > Guenter
> >  =20
>=20
>=20

