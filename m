Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01633B9610
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026558; cv=none; b=fXI3DLKvGSadDmG+Ab8Cpm/4MNzN03MrSMljL8EVJmCU5TuuLkfVv1rAtFTAiNVgyaw9mMSbNVtFn0CfseeBxpWGhtjT06FJd4T6jE7ndYEPrkoOQo7lDTy0yRJcsj4E2bR7CldUGssOKPkRwOiZUiVsedtOAHKg/mrEFZZbiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026558; c=relaxed/simple;
	bh=slV74hITbJAth9NXLCIK51dcXWeVqMEFVItzzyr7qB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=riofexwTj4yzcmpn2WakKILwPc3l8+kKgtsWfjF7Nt2wrmCmKXcf6MOPkuZHaO+xiYbP7LPn0SpQLgvSy9IjVc/9WHTQ+TzhL9+hoQF8EAJQV2Mc5CdOjLnPxgfXi/+d09teeQyEFEc+uQHQAACYhh7cxtfEpJj0S19JRBycqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb6/4w5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb6/4w5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F211F000FF;
	Thu, 10 Sep 2026 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026556;
	bh=7XAlsgSQ7nqKFjEMGsltugMQwp0W+eJ2LVC2hsLDPCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xb6/4w5rVdFTHAdoltp4YGGKG4yvo6HfNIsaLyj8G4xOp2Nmt+3XVsiXkDVhM8HWK
	 6KgTR4xqxgXzKobf9ucl6WoWyAwP832XiFpAwagLOTuXNhusv7nuVRP7q86e8k0kCJ
	 APehvrq3hZJ0hkcCMy3tMzYBm3lmqbO30V7jN6ow2JpXcqrWFYrWj/RkEUIAhW8Z1H
	 RbnztD9Qvb4398y7LNLNgDMnvwVN7fEtCkJXsqSdlDcXRAkwgCP1rWfSjf0nthlbgT
	 JOuSm/58jaVv0kzbcWHZlruc62DwvDe1zb6UMlxVhR2maeqxvZhRVstV46MsTC7+Wo
	 6yhE0caEWZycQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] Documentation: hwmon: (yogafan) adjust table
 alignment for long model name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910074505.1077544-1-sergiomelas@gmail.com>
References: <20260910074505.1077544-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 07:49:16 +0000
Message-Id: <20260910074916.93F211F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch silently introduces undocumented model additions and m=
odifications to the hardware support table, which contradicts the commit me=
ssage.
--

commit ecc05eb9d5cd9f6474be8ef3ef43d5a812bf701e
Author: Sergio Melas <sergiomelas@gmail.com>

Documentation: hwmon: (yogafan) adjust table alignment for long model name

This commit updates the reStructuredText table layout in the yogafan
documentation to accommodate a longer product family string for the newly
added IdeaPad 3 15ALC6 Ub model, preventing Sphinx build warnings.

> Update the reStructuredText table layout and column separators to
> accommodate the longer product family string for the newly added IdeaPad
> model (IdeaPad 3 15ALC6 Ub). This prevents Sphinx build warnings and
> maintains proper visual alignment.

> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafa=
n.rst
> index 9ff5db5dc08ce..239c7b5761caf 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -85,28 +85,30 @@ immediately to ensure the user knows the fan has stop=
ped.
> =20
>  ::
> =20
> - MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
> - -----------------------------------------------------------------------=
-----------------------------
> - 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100

[ ... ]

> + MODEL (DMI PN) | FAMILY / SERIES     | EC OFFSET | FULL ACPI OBJECT PAT=
H          | WIDTH  | MULTiplier
> + -----------------------------------------------------------------------=
--------------------------------
> + 82N7           | Yoga 14cACN 2021    | 0x06      | \_SB.PCI0.LPC0.EC0.F=
ANS        |  8-bit | 100
> + 81TD           | Yoga 740-15IML      | 0x06      | \_SB.PCI0.LPCB.EC0.F=
ANS        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 Ub | 0x06      | \_SB.PCI0.LPC0.EC0.F=
ANS/FA2S   |  8-bit | 100

[Severity: Medium]
The commit message states this patch only adjusts table alignment to
accommodate the newly added IdeaPad 3 15ALC6 Ub model. However, it appears
this patch also silently adds an entirely new model (81TD | Yoga 740-15IML)
and modifies the name of an existing model (Yoga 14cACN to Yoga 14cACN 2021=
).
Should these unrelated hardware support additions and modifications be split
into a separate patch or explicitly mentioned in the commit message to
accurately reflect the changes made?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910074505.1077=
544-1-sergiomelas@gmail.com?part=3D1
