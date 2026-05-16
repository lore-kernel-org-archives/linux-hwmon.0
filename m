Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C237BE8E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934362; cv=none; b=MsKXEpdqib+H+J/zQB2J3h6v/xFWjcsL4Qj45CnrQvEFiJ2elOY+R1MibAIRUUutK46Cm0B4YoEaVdm0bKtsA2+kGHgel1R/+ASLu22xC0rYflc1Q5a2GMC1KUGgrNTDNnYE3FS95D4M3YeQnAzEjEN8OIOq03PXzFRhHRJayjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934362; c=relaxed/simple;
	bh=TiUxjS4T/MLbcGALje09hm7FmXpNXFQIoX2sC3rexmI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qVkJWNU+nygugfIAOZt/6w89cFeAmL2D/R2PEI0cppCTAKw6bDtAImfjdVPReWb0lKBaF+0T4Leds2HS0YkxxgwoSHwDDcdnzJgsczJ5lSvqvuk6CPtOnEqgvF6Nxstw4/+VPh9lPR59BnT+yYARSPSNkRmY9ipJ+OL6918KJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zpa+KJ/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zpa+KJ/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C85C19425;
	Sat, 16 May 2026 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778934362;
	bh=TiUxjS4T/MLbcGALje09hm7FmXpNXFQIoX2sC3rexmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Zpa+KJ/8dFlEfO+qxsTbMDPKAMXDx3/V6kKOdkVlU2rayealgWt1bT4r1ukQV7Lr2
	 sNb/VB+PhkyxO72dc2Q21Bk616vRGE2oikqkmQIP1JegRs/ZkrXECYuS56//MOdSnS
	 3KhairM3Rvx94C3+aS2mljqC4hHGmtX5PFgRiuwStMZr8ZaGTkt0N9Cv641jBAbCoF
	 BAHOFWwhxYtIA7ZpUrQ3hu2S7QUNQqrt9M1I/X0fc9rGSMkZbsExGHUjcozp6As41G
	 yfpT/4CQkKsrRY5j00tBEi0KB9QTzhrZ4HrsRCT1BLFvy8esRRT6Z3zUXZ9oMgNm0r
	 KBxT1FwvcbPPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (coretemp) fix coding style issues
Reply-To: sashiko-reviews@lists.linux.dev
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516114253.5466-3-bakshansky.lists@gmail.com>
References: <20260516114253.5466-3-bakshansky.lists@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 12:26:01 +0000
Message-Id: <20260516122602.56C85C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] A blank line was incorrectly added inside a contiguous block of dec=
larations in `create_core_attrs()`, splitting the variable declarations.
--

commit fd6a696ecbdee696c6e67fb77fb06e3c1baa31cc
Author: Roman Bakshansky <bakshansky.lists@gmail.com>

hwmon: (coretemp) fix coding style issues

This commit addresses several coding style warnings reported by checkpatch.=
pl.
It updates header inclusions, adds missing blank lines, combines split stri=
ngs,
and reorders the __initconst attribute.

> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index c722b1d8e4804..a79c2d65a2bee 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
[ ... ]
> @@ -424,6 +423,7 @@ static ssize_t show_temp(struct device *dev,
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev)
>  {
>  	int i;
> +

This isn't a bug, but does this newly added blank line split a contiguous
block of variable declarations?

The static array rd_ptr is also a variable declaration, so this separates it
from the int i declaration. It looks like checkpatch.pl might have misparsed
the complex function pointer array declaration as a statement.

>  	static ssize_t (*const rd_ptr[TOTAL_ATTRS]) (struct device *dev,
>  			struct device_attribute *devattr, char *buf) =3D {
>  			show_label, show_crit_alarm, show_temp, show_tjmax,
>  			show_ttarget };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516114253.5466=
-1-bakshansky.lists@gmail.com?part=3D2
