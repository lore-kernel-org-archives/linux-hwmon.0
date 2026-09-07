Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B448095F
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781124; cv=none; b=lTdtq2LnxWNoxWQJ/4JZ2V+vVtXjaOvleR/+MIS5oV30yi5xz7LJFP33HJzO55cczUMgGEn2SdyG+1daU11hH/ajAcOm6A5VyqYVIaQExxu+J2WfNrV2ChDMOLQm7mBHO5OakNUPi+Lpa1V8BZ5W2/01Qb6b91L2ab7iED3ga3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781124; c=relaxed/simple;
	bh=az2ezwEhiZDN73vMMAySHhRha8dEZKK/RZzkRyqp8vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkTDS+UUryRjx+CPsgf3O859qE/2k9Wbf2MijxZlCUc8dQiD6qEJrV7H/dRuknT40FzeX7wOUiPSAk5CUJHhGedO4hIhPDgpV+F2qNP9U/VIlGR9YIcuss5KvGOLyZKE4jTlt9li4EjI2VSML1iGGR2Fq99nd5OLPgzh6Bceczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKIkmofa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKIkmofa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3823B1F00A3A;
	Mon,  7 Sep 2026 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781123;
	bh=GeR9X9ciwh2kO1dNijmWY/tIvUhVR/aYNvsZQRYS47o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKIkmofahyZzlf2HdnVHg/es20ciEzFE1PXQwIWiXVs6jdVjNrKeN2tM8/YlkbfPw
	 ulb8uobvlornu4KcLHVgKoMbO/yqrzexeLJDe/lASRs/61noA/loMG2CgVZ+16gF1Z
	 PBrEpntj4f3ljp2uOvGQQYA26MMSl+0WRScOgncrYaqbAfLMLDo9PlTw8YGRTmWey0
	 pGORFDLAqnTvyLOGs8KtaCkCtV9fvpiBe7lqniYo7ZNrVDhRMzsYdmQD0GSLhKoPl4
	 PzVOa5MmnIBK28WnBfLEAVI8wsnKxJDbCHUnJRe9tGOHcsLMljpWHmWAWc8xnTL/FZ
	 4vQ7XrAHiWLEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260907112929.1531690-1-sergiomelas@gmail.com>
References: <20260907112929.1531690-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:38:42 +0000
Message-Id: <20260907113843.3823B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DMI quirk entry for 'Yoga 14cACN 2021' is completely redundant =
and duplicates the fallback generic 'Lenovo Yoga' configuration.
--

commit 11ad066ce5492c24b9a778e999582125b519d21a
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for new Lenovo models
   =20
Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML, leveraging DMI product family matching.

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
Is this specific DMI entry necessary?

Since DMI_MATCH performs a substring match, it appears any system with a
product family containing "Yoga 14cACN 2021" would already match the
generic "Yoga" fallback entry located later in this same array.

Because both entries map to the exact same yoga_8bit_fans_cfg driver data,
does this addition provide any functional benefit, or does it just
duplicate the existing fallback behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907112929.1531=
690-1-sergiomelas@gmail.com?part=3D1
