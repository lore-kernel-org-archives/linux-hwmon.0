Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BE3A718C
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683951; cv=none; b=j++7d59iT9PXs9g/frskkSGPjEmws2nTx0w6yUL5AICjgm6R5h91ngew64Td9E0yRb7TKRwuWU8BXkIUUntv+iYXQGdf7c2Fd81msPTQJsTxW6PSAJKtcAe31zZz5oKYu+HZu3KIxpi91rzNhgaOCwmYBkJc/+K1UjTX3Xntnlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683951; c=relaxed/simple;
	bh=BxFQJWsdGYdvEmrwchPa1bO5nqItJA79+oD0IucYtHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBFFyQGMjeoohjNHaPbXCgAvfT8sOltsKESjvXDA1bZYNdinWGIbx6m14f5x5TdN3sE40J2EEbZRiZVV6WCsdIFr96muRwn1hFtND4N3UbSloFVgwgUvkvdqSDWv9GIwrfFi5LGxBiTXkxgdYuVkYFh/OBQFZIrcqWjfprhAQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNdbNh9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNdbNh9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063021F00893;
	Fri,  5 Jun 2026 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780683949;
	bh=J8LDzZXIJS38UgOzacmHhy+es6UjK8vEsLVVz9vnVFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNdbNh9jRQTXjSCywVZVu7XAmAhPa+WbfnqNAMUK3RjaSeeSK/F/L0T5AuRlYGEcw
	 W/QZfCunbNcauCSPUZqJjgRxI/nx8GKzC0Cj6TyzIKmNW4ycmvOYMFk2ywiohZivc3
	 WB5TaQxvU/4fL9RpogpRrrkA03IY54izyaM58/UZ5cekTZNVXkTEGVeXCFpnSQKVEK
	 s95xvWwD5OCD3iJG2WL73Mw8Lo8agdo8xq/Ayq/OQ00CIuEpcXTX+Rxrse8uqcQUZj
	 v+ynFOqSaX4pRBLNDIQjNsTlJ1yu0tR1c4WBeR40T+/YUi23nxljAtEydXP6Qx/p8s
	 C6C01xZU9LjiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/9] platform/x86: dell-descriptor: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-2-W_Armin@gmx.de>
References: <20260605181433.188847-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 18:25:48 +0000
Message-Id: <20260605182549.063021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incorrect sizeof argument used in strncmp for object_signature vali=
dation.
- [Low] The interface version validation implicitly accepts version 2 witho=
ut documentation.
--

commit 5b70a5d7de7afeabc7feebda00fbadd39ea87afa
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-descriptor: Use new buffer-based WMI API

This commit updates the dell-descriptor driver to use the new buffer-based
WMI API. This allows supporting ACPI firmware implementations that do not
use ACPI buffers for the descriptor.

> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/pl=
atform/x86/dell/dell-wmi-descriptor.c
> index c2a1802027190..d1e751d430210 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c

[ ... ]

> @@ -88,77 +108,47 @@ bool dell_wmi_get_hotfix(u32 *hotfix)

[ ... ]

> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8p=
h)\n",
> -			buffer);
> -		ret =3D -EINVAL;
> -		descriptor_valid =3D ret;
> -		goto out;
> +	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signatu=
re))) {

[Severity: Low]
Is this using the correct size field? The strncmp compares object_signature
but passes sizeof(desc->vendor_signature) instead of
sizeof(desc->object_signature). While functionally benign right now since
both fields are exactly 4 bytes long, this looks like a copy-paste error
that could be fragile if the structure ever changes.

> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signatu=
re (%4ph)\n",
> +			desc->object_signature);
> +		descriptor_valid =3D -ENOMSG;
> +		return -ENOMSG;
>  	}
>  	descriptor_valid =3D 0;
> =20
> -	if (buffer[2] !=3D 0 && buffer[2] !=3D 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)=
\n",
> -			(unsigned long) buffer[2]);
> -
> -	priv =3D devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
> -	GFP_KERNEL);
> +	if (le32_to_cpu(desc->interface_version) > 2)

[Severity: Low]
Does this code intentionally change the supported version checks?
The previous code explicitly checked if the version was not 0 and not 1,
and warned otherwise. This new check implicitly accepts version 2 as a
valid, known version without warning.

Since the commit message doesn't mention adding support for a new interface
version, should this > 2 check be > 1 instead?

> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\=
n",
> +			 le32_to_cpu(desc->interface_version));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D1
