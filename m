Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6176F39E6FC;
	Tue,  8 Sep 2026 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851489; cv=none; b=EL/RjfyfROg5da61fVl/HhPBSOnbhlB41iLDEQd/JH8iz7QnnoJ6DwO/VrsfssBAYQ40hFzmuHpvN0gzmDrfVwISpt3XS0OvZoc/vhCw4g6eajGa2jVcabf6p+gsGTQXvXUBywKLHgq6mA+X5zfsMTzRsHwPtoGjbiftYhO/kNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851489; c=relaxed/simple;
	bh=/9Ym75XeME1Y0dcoGFDLz+c+6z0X7bEn3pBNKlZ9/V4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VkTsa5aHRMCi8EhZpzS260VRQDBH2TOYwqFYil4RNfLpmy9GCKXxgFFY6rGYDL3/yBdL01t/oG9tV9HEr+F0r2sYd+V8fsXQKxB6Of1cWkrBuqG6KB7DmLLcaMdTy5aLB2OdhtLx6g7WLXUhJMJVoLur1loOIbfA5nEERPiSCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmxqUKsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmxqUKsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B406E1F00A3A;
	Tue,  8 Sep 2026 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788851488;
	bh=DQA1VZIYMizewXJWisCTGSjSetHTi03jFVqGjIKCsX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmxqUKsJLa6eyXJJmvnuvfHGHNZTy3YfHMf50zMhsHjQ6TJs1cwIysZNvg8ca4okw
	 uzWv9w7CZSKhL6sGKsSONCmLZ+xcVzHuYPhE6G2Fkb2fx9YpYXA7zhi37031guvQxc
	 KmbcqC70XXKbgG7Q2uRMBV08BJP8m38iqWJiqP2ar00PZ+WCXPwQ1wC1CTiB40RLpa
	 bMyWoP48XAz2fofQaeGXuxx1JxNZwLdyd48VRMDswfMRlZ3skMIxCqYfODynrQemkr
	 IKIHFHr9SV3FmAe02tgVWTIlXdMzJLlJONmhqYj+ar0oJ95xj6WoaLbJgUBZ6j89/t
	 8baP5uFLVD6og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260908-add-raa229639-and-raa229640-v2-2-83c75b61139d@gmail.com>
References: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
 <20260908-add-raa229639-and-raa229640-v2-2-83c75b61139d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:11:27 +0000
Message-Id: <20260908071127.B406E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added devices RAA229639 and RAA229640 are not documented =
in the supported chips list.
--

commit 1702c94b50317002cdd0b95f06c65c3af4214d35
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus/isl68137): Add Renesas RAA229639 and RAA229640

This commit adds support for the Renesas RAA229639 and RAA229640 PMBus
voltage regulator devices. It updates the existing raa_dmpvr2_2rail driver
variant by adding the corresponding device IDs and OF match entries.

> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl6813=
7.c
> index 2f7f825bfb69e..53b44775ba1e6 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D {
>  	{ .name =3D "raa229004", .driver_data =3D raa_dmpvr2_2rail },
>  	{ .name =3D "raa229141", .driver_data =3D raa_dmpvr2_2rail_pmbus },
>  	{ .name =3D "raa229621", .driver_data =3D raa_dmpvr2_2rail },
> +	{ .name =3D "raa229639", .driver_data =3D raa_dmpvr2_2rail },
> +	{ .name =3D "raa229640", .driver_data =3D raa_dmpvr2_2rail },

[Severity: Low]
Since these new devices are being added to the driver, should they also be
documented in the "Supported chips" list within
Documentation/hwmon/isl68137.rst alongside the existing parts?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-add-raa229=
639-and-raa229640-v2-0-83c75b61139d@gmail.com?part=3D2
