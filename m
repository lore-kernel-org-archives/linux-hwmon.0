Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0451D54FA
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330806; cv=none; b=DTbFnI8FVgYvqAiuY8s334iss/GW5b6hxqHK/WboMYWDLcfBydGNTAVTf2VGMmLgmRLkrKWuQHx9rbQUcyIVnOc5y+U9McFuhsb8ie0io/H5atPe6jNBRLZpJhY58pIwwgaYmoHNNzk3FnnODqwL6O5D9ReE3Bkg7sWlvUSbL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330806; c=relaxed/simple;
	bh=QS1YzeJzCYZWRVxUkcjbRKw2OMriWGpqbmIyHRvV2kI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pnORR07yoijYXpbU+MaMzXkM/MUob9fI5MfTWhLH1hD1qo5P+wFTV7Fuzv0GC0iQIzW1G6F2dtDVbodIZpaaaWtBbH/PxERvpfbi8EvLFzqT3Xg7sCrKfI69c0kekuOgg4csSWHrn1vyWVQZdpwTPbDMpSwD69dp6WPhP17eL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C523iVNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C523iVNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94C21F0089B;
	Tue,  6 Oct 2026 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791330805;
	bh=QS1YzeJzCYZWRVxUkcjbRKw2OMriWGpqbmIyHRvV2kI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C523iVNaCWrcOsYnpnEXQ+E0Jq3EHvG1nb0Z3wIZNLdijHTKu70weIh7alSkpBtva
	 TRfbyDvn9p/Bi2jEsdV6h5EdtlawXyNpuGwq2ZOb5wO7hj4iZPBQBEZiwLFXJ95BG+
	 tko3H4T7dsjcOw2gyYgqEJuSwgh/ono3xCtF0r2X1hQYjYQz/rODL1vay7RAF/q6Bz
	 enQJROa8LLWMvU9QRQwZhdqGJvwtXPvGT0qxzwpq07lFDDIGt1uoJS6ZOyd7e7e+rn
	 0InorYBmPFj1dBRuGGwVAiljJl46O+tGVz4N0X1cxNAJhameGWPcJQdwE16rdibo0p
	 /JxgbSrLLq69g==
Message-ID: <sashiko-outbox-162534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix 18.45 TW bug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261006234618.10943-1-W_Armin@gmx.de>
References: <20261006234618.10943-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 23:53:24 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ACPI specification says:
>=20
> "If an error occurs while obtaining the meter reading or if the value
> is not available then an Integer with all bits set is returned"
>=20
> This integer can also be 64-bit wide on ACPI 2.0 and later systems,
> so we have to check for that too.
>=20
> Compile-tested only.
>=20
> Reported-by: Grant Slater <github@firefishy.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/460
> Fixes: 1fefca6c57fb ("hwmon: (acpi_power_meter) Fix 4.29 MW bug")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006234618.1094=
3-1-W_Armin@gmx.de?part=3D1

