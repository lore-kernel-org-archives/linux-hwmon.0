Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA37331EAE
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355493; cv=none; b=ihIIqPpEa/Us062zzdvF3/zI6jHA6seUJVrtUcfy9GsM1y/NfO7lTHAuMUom95cnpQxUyppH/gh1Auvh9jz9BdUlBgeo39/MvEQVfomHfncfZOh6JvlmBAjD+Zt+PJzzZltw+P6Z5jDAy8IwBWJMV+7/UVdQwerYoASNW683loA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355493; c=relaxed/simple;
	bh=ThJfzaWJCJMOjUhwp/Kw+c4fTXu3as5mY48cS3xaR38=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H8SYCofMr4i4388lSlZhSeSyiV4QJR9MNyCrm/XU588qIDruIsFKG7NWiXWUAkGk9QBDppSC3xMM01a/TAjC4YR3jRx6NvHEREOBwYTextHI7x2WjfLMb0Ny1Qjvmq6ziSiqzx2UhXaBKXZqHSYBG6snlUB4xmueCeiz65/bcGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2ozIWwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2ozIWwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CCF1F000C4;
	Sun, 18 Oct 2026 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792355492;
	bh=fx/mhwodHcMpoh9qu7lVGy6CBHASUXkZHz+Ci1gM1UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2ozIWwgt8ASZaaRtqft667tvmNUgWzLjkSZJIUBqNrwuPzcx7ojVOysrB+V0Dy5W
	 ntY2U7IjrRJO1kvY7/Zi6PcJFbPKXBElfJu9r9/MB4FklkKZv/266OY+BhAAcuXQ7n
	 BK8Oa5oj/hzfcX3H6DYoGWRQYruEAjR0FiveHhyTevDUyBcOPJn38EMuomuNvTVfE8
	 dnHokB1hDJLfKAlYCEL/LssmYpFNF2KgngZE55EO9FFj6vtP24OfEScl3BNDbB9xgP
	 QrDLllwexg/YESeN9SZB4fo57XizVLax0zBKKNjKTbCTuHoUprquh2sdhM4HITjviS
	 BsNy6Oa3es/Ng==
Message-ID: <sashiko-outbox-176366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS PRIME B760M-K
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXNhZiBOdXJpIEJlcnRpemxpb8SfbHU=?= <ycistak@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261018202934.1111462-1-ycistak@gmail.com>
References: <20261018202934.1111462-1-ycistak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 20:31:31 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ASUS PRIME B760M-K (DDR5 variant) is missing from asus_msi_boards[],
> while its DDR4 sibling, the PRIME B760M-K D4, is already listed. Without
> the entry, the driver does not use the AsusMbSwInterface ACPI method to
> access the Super I/O chip, and no fan, voltage or board temperature
> sensors are available on this board.
>=20
> With the board added, the chip is detected:
>=20
>   nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>=20
> and fan speeds, voltages and the SYSTIN, CPUTIN and AUXTIN temperatures
> are reported (BIOS version 1838).
>=20
> The missing entry was found with the help of an LLM, and the change was
> tested on the board above.
>=20
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlio=C4=9Flu <ycistak@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018202934.1111=
462-1-ycistak@gmail.com?part=3D1

