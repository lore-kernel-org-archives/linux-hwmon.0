Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9883DFC99;
	Fri, 26 Jun 2026 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459382; cv=none; b=OGJ3UAY5/ax/CnvCyZ/wrZwvomCVi/7m1dxh0qNAHSptg8bAnQCekMhRM/TxGiXRksCPUTTOSoOcOjQB+n3WGwO868+csQ5QBEDDiRckbUVf2twZMzcJPHT4hhvtqfG+p1w8Ss6xtMbNqfW2IafGu+3iYNSpKVr2GNtYQVeHITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459382; c=relaxed/simple;
	bh=xmFP05WHBPMyF35OklYGDV36v2RGs9esVzdp6NF1aYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPMEOr3g36DNKompH6IiX8iOnfMFP6Cf5PtMh6OoR4Vri2wo3l8+4KNo5fwmdyb6zwJP3TWvif42pcKCWIa7kq53U7+0YNlVxV67t8jx1bnKkT1c6ZZ33bq8+DjksQ3mQKflf9AslCPl4+DhGeLWrTFFe7Ve7ArLZySKqDifVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2bdpruW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2bdpruW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F621F000E9;
	Fri, 26 Jun 2026 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459381;
	bh=ZN5NHSpvmEE1VuRw+cfKRSbCpZ2feyx0jygJnNV3kGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h2bdpruWwlLfQA2O5ribVtDU5wxwAVJHZGxPSnlozAcKuG0qzoZlTcVICZ7GG3i5W
	 W3xu4jzbvzcZiVT6v+4Ilpnqp9CViDGcKiXfKk97mhkgknFuuY7H8SoYHXBYXJRRoU
	 UK4XgiqqZRRUrk3TNwWK28KLq/X36L7IIE1/jfyEWhRor7E8uVMV8mM9UO1ZR9eLHO
	 1uSxLiJBAsZ5akz80WzPbFV7IcrqSPLpZZDL/NJ5TQJgW6Sb2M4xcuIiYrbjD6ZGKX
	 Vq5q+cDCP8gXAN1bTUMpEHcwLOKptWSt3TvJ4F/gbKBIij1Syz4FIcRaxkVxtCyIYm
	 hLEg/sx8unNSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] doc: Add ROHM BD12780 and BD12780A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:36:20 +0000
Message-Id: <20260626073621.16F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect hwmon sysfs prefix documented for the BD12780A device.
--

commit f0582b872b8ac6d6f116162797af818e8508125f
Author: Matti Vaittinen <mazziesaccount@gmail.com>

doc: Add ROHM BD12780 and BD12780A

This commit updates the adm1275 hardware monitoring driver documentation to
include support for the ROHM Semiconductor BD12780 and BD12780A power switch
ICs.

> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm127=
5.rst
> index cf923f20fa523..8a793dd2b412b 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
[ ... ]
> @@ -67,6 +67,22 @@ Supported chips:
> =20
>      Datasheet: https://www.analog.com/media/en/technical-documentation/d=
ata-sheets/ADM1293_1294.pdf
> =20
> +  * ROHM Semiconductor BD12780
> +
> +    Prefix: 'bd12780'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/=
power/power_switch/bd12780muv-lb-e.pdf
> +
> +  * ROHM Semiconductor BD12780A
> +
> +    Prefix: 'bd12780'
               ^^^^^^^^^

[Severity: Low]
Is this prefix accurate for the BD12780A?

When the device is instantiated via Device Tree using the compatible string
"rohm,bd12780a", the I2C core's of_i2c_get_board_info() function extracts
this string, strips the vendor prefix, and sets client->name to "bd12780a".

The pmbus_do_probe() function then uses client->name to register the hwmon
device, which results in the prefix being "bd12780a" instead of the
documented "bd12780".

Could this cause issues for userspace tools relying on the documentation to
find the device?

> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/=
power/power_switch/bd12780amuv-lb-e.pdf
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D5
