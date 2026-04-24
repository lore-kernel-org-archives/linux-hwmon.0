Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3A4A21
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776990880; cv=none; b=QMuCOC/lGxbe9M4xlSFx6O9p9ogou7Dty2Pn3eOgyGDyQS/KMP1OON9EYGCaiPoZUrgaop67tFpmEc5EcfVIvZM6mNi1rcq0Ik7HvtWVxBPQkQZq3b0AfJrTpazFOnzmWxWRYAt0B5qWbfQD96hdsIO3svGTZvahYPbkysPWMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776990880; c=relaxed/simple;
	bh=O4AeGi15BmU4VofmQ77/xMEzA8IzvnhK7dFOC5iRUxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hwCX6+BiHUK+lOXmNQGc36Gngsi4LC0MnZlmxsb44EEoU9OOxqHBx8JbzNjfEdLSet6yhYJoilBlWLO3Nur09+XLdUqcqPgL/ESj0bKKiZIY8vCNAVoG9bd5L2hhhzpJCi46m6BUCUJr9HnQHuaZo2jllmBEAa4Rr1mCYdVq7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwO5VSOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwO5VSOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE1AC2BCAF;
	Fri, 24 Apr 2026 00:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776990879;
	bh=O4AeGi15BmU4VofmQ77/xMEzA8IzvnhK7dFOC5iRUxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IwO5VSOo1/bScBcNeMDyDzg6ivlZgAjxczzhJsQtRCPP52QKShXCCwPx+fNQamAEP
	 iroPFKR33wR45q4lO4fA/wsVtchoipaSrkjHTx7zbQYjxmWXbME+M3S474qMT3kGDu
	 wJPlm9/AcVqBWuld63Dqrgo9FIe74CPrQRvI0feqfKIaBl6daiIYLyPPthklposkfa
	 a+l0kNiG49y9wqASLxnAO/A9EX6NnDBu/wSqlIeuna9bGI8eYVlz1i4K1xzkkkfmYd
	 +yOreTFvrlIMkTLpzPmNeaUTWRB6SDX95FDxvLV/ju53Z051JxtVCdCCnZD562lXrx
	 rbvXhhlZ40N3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/13] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-11-akhilrajeev@nvidia.com>
References: <20260423085718.70762-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 00:34:39 +0000
Message-Id: <20260424003439.CEE1AC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Type mismatch when retrieving match data for ACPI devices instanti=
ated via PRP0001 (OF compatible strings).
--

commit 333ca78106137e8c6bbf34e1b45a4801fdfbbebe
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI ID for Tegra410

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index b90756ade2db6d..e63822df2ae48e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1847,11 +1847,12 @@ static const struct of_device_id dw_i3c_master_of=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> =20
> -static const struct acpi_device_id amd_i3c_device_match[] =3D {
> +static const struct acpi_device_id dw_i3c_master_acpi_match[] =3D {
>  	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> +	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
>  	{ }
>  };

This isn't a regression from this commit, but I noticed a potential issue
with how ACPI match data is extracted in dw_i3c_common_probe():

drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_probe() {
    ...
	if (has_acpi_companion(&pdev->dev)) {
		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
	} else if (pdev->dev.of_node) {
		drvdata =3D device_get_match_data(&pdev->dev);
		if (drvdata)
			quirks =3D drvdata->flags;
	}
    ...
}

If an ACPI device is instantiated using the standard PRP0001 mechanism, it
maps to OF compatible strings like "altr,agilex5-dw-i3c-master". In this
scenario, has_acpi_companion() evaluates to true, but device_get_match_data=
()
will return the pointer to altr_agilex5_drvdata from the OF match table.

Could this direct cast of the pointer to an unsigned long bitmask cause
unintended quirk flags to be interpreted as true depending on memory layout?

Would it be safer to unify the match data format to always use struct
pointers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D10
