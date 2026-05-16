Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED83DD85A
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933782; cv=none; b=kx/sfv0ZbKdks7YU0w1inZGFvX9DGcfht9rs8kStSsXYAvQrATCwv5lN7glh6vA3odjgqZHwdAcUvBwwDGytj4Wpzu44Yzk/3mZLST2PPggiS7GFuaLpi6woS4UsgxZbLX9Dd4X0xAf4rGB4qZIZWn8wiSRP3MfhSLXSnbtxoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933782; c=relaxed/simple;
	bh=SL7s83SxEWFI9hIJQAe2/kxGjIjdClsMFF8K0lGsf5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f7W1gCA8G+ucpjcd8T2hVdQDxH+bRmqQQ6266c40ihQmeshNkhSp40YOrHWo2Git58NaSoSLDmgWh4gm8s/Nr/pHKwfP5dBMUfU7vogfr57bWrfRNiHmtX2cSBJfD7URLLCPXGdMIJkCPu/FNtgQtK8bRJOXlUUmczIrJzrOcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKvwBnTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKvwBnTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9DAC19425;
	Sat, 16 May 2026 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778933782;
	bh=SL7s83SxEWFI9hIJQAe2/kxGjIjdClsMFF8K0lGsf5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eKvwBnTZiAeRZvjxELMpe6HubLIY/tkeNItuQZOraU8HtuHhllEfxeWJJtjCxKCaX
	 kPCSjASf4JKzrSD9zDvqAvyv+jVmzxazo7xuDyocwvUyereV6MWTV9lcLG9aTSUEnF
	 BORV9VnJ5CxumywUCS/v59dzgw4WFqxV380BWRvFxxDCJEQayN8NlRgCsv2HKv08UM
	 w2yg4sF3YQuz3NJDe2KeqO4qkYx1n/4FuGvgjUcNuHVX3uixNtDFaEg/AhS93hFm2i
	 b/1o7r/UuJmNcBYgUb2R5dCBLgN6RIRsIceeDUJCJxOdIeed32oh3M9aVwsnDjRy1D
	 h6eXj1/Av942g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (coretemp) replace hardcoded core count with
 dynamic value
Reply-To: sashiko-reviews@lists.linux.dev
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516114253.5466-2-bakshansky.lists@gmail.com>
References: <20260516114253.5466-2-bakshansky.lists@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 12:16:21 +0000
Message-Id: <20260516121622.1E9DAC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] If `topology_num_cores_per_package()` evaluates to 0, an integer u=
nderflow occurs leading to an out-of-bounds write and kernel panic.
- [High] Using the global `topology_num_cores_per_package()` limits the per=
-package array size, preventing sensor initialization on heterogeneous pack=
ages or during CPU hot-add.
--

commit d686b3577dd2107e7452adf6a949cc0720d2213a
Author: Roman Bakshansky <bakshansky.lists@gmail.com>

hwmon: (coretemp) replace hardcoded core count with dynamic value

This commit replaces the hardcoded limit of 512 cores per package with
a dynamic value. It uses topology_num_cores_per_package() to allocate
only the needed amount of memory for core_data.

> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 6a0d94711eadb..c722b1d8e4804 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c

[ ... ]

> @@ -485,13 +484,7 @@ init_temp_data(struct platform_data *pdata, unsigned=
 int cpu, int pkg_flag)
>  	struct temp_data *tdata;
> =20
>  	if (!pdata->core_data) {
> -		/*
> -		 * TODO:
> -		 * The information of actual possible cores in a package is broken for=
 now.
> -		 * Will replace hardcoded NUM_REAL_CORES with actual per package core =
count
> -		 * when this information becomes available.
> -		 */
> -		pdata->nr_cores =3D NUM_REAL_CORES;
> +		pdata->nr_cores =3D topology_num_cores_per_package();

Since topology_num_cores_per_package() returns a global value that is set
once during boot, could this prevent sensor initialization on heterogeneous
packages or during CPU hot-add?

In asymmetric multi-package architectures where a secondary package has more
cores than the primary, or when virtual CPUs are hot-added, pdata->nr_cores
would be capped at the primary package's boot core count. When initializing
extra cores, ida_alloc_max() would enforce this bound and return -ENOSPC,
silently dropping temperature sensors for valid cores.

Additionally, could topology_num_cores_per_package() return 0 if the CPU
topology is broken or misconfigured by a hypervisor?

> +		pdata->core_data =3D kzalloc_objs(struct temp_data *,
> +						pdata->nr_cores);
>  		if (!pdata->core_data)
>  			return NULL;

If pdata->nr_cores is 0, kzalloc_objs() will allocate 0 bytes and return the
kernel's ZERO_SIZE_PTR instead of NULL, bypassing this error check.

Later in this function, the index is allocated:

	} else {
		tdata->index =3D ida_alloc_max(&pdata->ida, pdata->nr_cores - 1, GFP_KERN=
EL);

If pdata->nr_cores is 0, the maximum bound (0 - 1) evaluates to -1, which
implicitly casts to UINT_MAX. ida_alloc_max() would accept this large bound
and return a valid index.

		if (tdata->index < 0) {
			kfree(tdata);
			return NULL;
		}
		pdata->core_data[tdata->index] =3D tdata;

Could this result in an attempt to write to the ZERO_SIZE_PTR address,
causing an unhandled page fault and kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516114253.5466=
-1-bakshansky.lists@gmail.com?part=3D1
