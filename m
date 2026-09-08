Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CE4EA365
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861346; cv=none; b=spy9siS2VvrW7AvVhvj1Hrd59GJpWH4YfO4Yf8qwCKd4MRRm9GzDq/CTjPsKec6hQAb2VHnom2O5BHV7iwMd+zyEe89F2t8ydJEXF6P5OVwXVaGsawHNMnusryb50db2zp35CvzhM8FHvKOX0caINoScbtzcpPHtS/JnhamX6Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861346; c=relaxed/simple;
	bh=3hgBwYKOEkPWeAC2FdDDTU/ptoZGUmUNA2sKh6UmLcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DpKmMxYVx/77CU64q91Uf1d6Q0nRxM5bQdUa1bMDurubv6x4NWuP0hzPm5ecS6Wbv3JZvB7GvWGNe8NQncGZppXvkW+JxklOUoEyfE2aJvPcQgEau3iXlj/1mEX4UjMJ09UMFG7cQGHONNjycab+21oHY9NXu3YA5qPJ9kYqVac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDDA1F00A3D;
	Tue,  8 Sep 2026 09:55:45 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908094717.2224803-1-sergiomelas@gmail.com>
References: <20260908094717.2224803-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:55:44 +0000
Message-Id: <20260908095545.2CDDA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant DMI quirk entry for 'Yoga 14cACN 2021'
--

commit 634b305e1f54cec1238a122131d8de1e78a97b9f
Author: Sergio Melas <sergiomelas@gmail.com>
hwmon: (yogafan) Add support for new Lenovo models

This commit adds DMI quirk entries to map the correct ACPI paths and
configurations for new Lenovo laptop models. It maps specific configurations
for Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub, and Yoga 740-15IML models based
on DMI product family matching.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 48fa5148d9e2c..2f86a8f6e0aeb 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -189,6 +194,30 @@ static const struct hwmon_chip_info yoga_fan_chip_in=
fo =3D {
>  };
> =20
>  static const struct dmi_system_id yogafan_quirks[] =3D {

[ ... ]

> +	{
> +		.ident =3D "Yoga 14cACN 2021",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
> +		},
> +		.driver_data =3D (void *)&yoga_8bit_fans_cfg,
> +	},

[Severity: Low]
Is this explicit entry for the Yoga 14cACN 2021 necessary?

Looking further down in the yogafan_quirks array, there is a generic fallba=
ck
match for Lenovo Yoga devices:

static const struct dmi_system_id yogafan_quirks[] =3D {
    ...
    {
        .ident =3D "Lenovo Yoga",
        .matches =3D {
            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
            DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
        },
        .driver_data =3D (void *)&yoga_8bit_fans_cfg,
    },
    ...
};

Since dmi_first_match() performs substring matching, and the generic fallba=
ck
maps to the exact same yoga_8bit_fans_cfg configuration, won't omitting this
new block naturally fall through to the correct behavior without adding
redundant entries to the array?

>  	{
>  		.ident =3D "Lenovo LOQ 15IAX9",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908094717.2224=
803-1-sergiomelas@gmail.com?part=3D1
