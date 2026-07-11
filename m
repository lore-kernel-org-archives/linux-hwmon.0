Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFDB33CE9A
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764402; cv=none; b=oBslXx3vnn8CSF7zz87Oo2oHIQb9o8X/WBhdQia3pRAcGtCqznZNuHqWYF0bqIjeIspELqlkfKnd5seQMZvs87qJzoz2R3XLoXGUTpfDb712YvhV0nPTgMT47G2XvOVefH9DWzQj9BVSGxw/FBLCPbso21oFa8sFVvnFf026l5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764402; c=relaxed/simple;
	bh=2uGhn1UwhP9dlmCGwWAtwq29YZsTDQnOu//QjrISM98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ersIpDM+DrZ+YDKN0QzDHyGXp6qrRvW5UPJDGqILHP9TK5tK4Y3v5xb3BiFo8uT3JmWxINkZ2zQe/wqSw+IZTfZKLAeOkx3TTkgB6XzFfe9S/p9iHz2CpLAavoZHcde+tazl8YNC/XbbN5gNtbqRckYuUPtVwiaykRmOC1spkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR9P0q+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR9P0q+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E951F000E9;
	Sat, 11 Jul 2026 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783764400;
	bh=Fy5ajEP6yUWrFlEw+GXFvB5fcQSFacUKe2N7Gx9eWto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OR9P0q+nL1mWe3EnLeG4E+IvzDvfgHg8P2xGa/5qIrwld8VQmJG9FNriQltl5ZxYR
	 ceAGVF0v8FYP5xkrOxker8/W/B0Xvl8MuH5T2VeJa9C17S2W0lT3XvKmRoJiruwS52
	 z+WQj90S5Xsc0xz1R7xmfPjGTf4TUniRifM0FpC0CuiHNf3IqsMNI5dl9qI5NC5nzE
	 zPR1ZFRUJlVe2deNA4H3E0j0SXbhuBgyhUSTaikqPrqS+EjLKkY0cw3T7xX7VtzOfo
	 HQo/MsMgxdfO1n4kYxqmPl2ydq1bW7tHtJ6Phcuebd6FdXCqaYQI/vmzPoe9SCR3xv
	 LPePmCjjHmBTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) detect unconnected physical
 sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711095917.568925-1-eugene.shalygin@gmail.com>
References: <20260711095917.568925-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:06:40 +0000
Message-Id: <20260711100640.B6E951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The static array `temperature_blank_values` is missing the `const` =
qualifier.
--

--- Patch [1]: [PATCH] hwmon: (asus-ec-sensors) detect unconnected physical=
 sensors ---
commit 674d66473a7b251333e25248978dffdc28c7dbcd
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) detect unconnected physical sensors

This commit adds detection for unconnected physical temperature sensors by
checking for specific blank values (-62, -60, -40) returned by the EC
register. If a sensor is unconnected, it now returns -ENODATA to hwmon.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..f178570110c1d 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -67,6 +67,13 @@ static char *mutex_path_override;
>  /* Moniker for the ACPI global lock (':' is not allowed in ASL identifie=
rs) */
>  #define ACPI_GLOBAL_LOCK_PSEUDO_PATH	":GLOBAL_LOCK"
> =20
> +/*
> + * The values for temperature sensor readings without physical sensors c=
onnected.
> + * The value varies across generations and is seemingly defined by the E=
C chip
> + * used in the given board.
> + */
> +static s32 temperature_blank_values[] =3D {-62, -60, -40};

[Severity: Low]
This isn't a bug, but should this array be declared with the const
qualifier? Without it, the array will be placed in the writable data
section rather than the read-only memory section.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711095917.5689=
25-1-eugene.shalygin@gmail.com?part=3D1
