Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63333BCD0A
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341976; cv=none; b=EgEsowbmJ68ocpjVSU5UIN+o+3Ee+hMeGCljo4KpgZZFWKbUKijgYbhhW3bOmcX2UJtDImx0VvIt9x2C7G+yVbCHvs3tMd3PKDDpRUZXHj8A665GM46iX8TUkmcPGVohUUyTUmh+5XSx/+20Ud3ZD24r2hO2GvY+D3lRjHTLZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341976; c=relaxed/simple;
	bh=xLcgXt48tmVJjDotIeBimNDDcEXfgX4J2XIdxm7TWzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tG+DQnNF41wMg8wRZRgxbvHh/fcwvO2xsrKEx64R3763HuShu5h+GH+00v14Ufl90pYeWuasmr7hy9UxSa1CRw1e4+tUFH/ZO2l+oMLJjTCwS8iGZmPmShNOFuqjvvr8xutXN88PPZ9It+fxiKB5oHfFl/NnJUnCBpN7o+zj58M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftbtz0kc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftbtz0kc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390D21F000FF;
	Sun, 13 Sep 2026 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789341972;
	bh=xLcgXt48tmVJjDotIeBimNDDcEXfgX4J2XIdxm7TWzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftbtz0kcnN4N/9HOTHh7v/G3mkdn0u4v1v3011xMa1nZSzMGhG+65wHAW6mFaNVEa
	 pBoj05ftgbfMqTvPLFp/U+A3JunKbVuXR8iB+uZ3Oq0///d/IHThI0UZDTys3/eaYe
	 FmB5JD0mtTYRUEtnrsR7/JovN+mWo/41cuJUOVowRKzOeHxaWsDhvHSRXVGItVcWoZ
	 Jn+08PRAvAnV3Yct6ZH9stqUo6P/vB9gx+gWHLqKDkmlf0p4CeyllMmDa8iG+JWLTm
	 zpLt8F620bcTcZAvunjopbchDGRC1tXoikNKPyFs0O7pP7eslqiVMUXlYIl3aTph6B
	 bLrwqME78fZ7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ACPI: sbs: add battery hook mechanism for
 SBS-registered batteries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jordan Brough" <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260913231410.416922-2-jordan@brough.org>
References: <20260913231410.416922-1-jordan@brough.org>
 <20260913231410.416922-2-jordan@brough.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 23:26:11 +0000
Message-Id: <20260913232612.390D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> drivers/acpi/battery.c provides a battery_hook_register()/unregister()
> mechanism that lets other drivers (e.g. hwmon drivers exposing vendor-
> specific charge control) attach extra power_supply properties to an
> ACPI Control Method Battery (HID PNP0C0A, "CmBatt").
>=20
> Some machines instead expose their battery through the ACPI Smart
> Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
> which has no equivalent hook point. On these machines a hwmon driver
> has no supported way to attach additional properties to the battery's
> power_supply device.
>=20
> Add a parallel sbs_battery_hook_register()/unregister() mechanism to
> drivers/acpi/sbs.c, mirroring the existing CmBatt hook API in name and
> behavior so that callers can support both battery registration paths
> symmetrically. This is purely additive: no existing hook consumer or
> code path in drivers/acpi/battery.c is touched, and sbs.c's own
> behavior is unchanged for any driver that does not call the new API.
>=20
> This is a prerequisite for hwmon/applesmc gaining
> charge_control_end_threshold support, since the Intel MacBook hardware
> being targeted registers its battery via SBS, not CmBatt.
>=20
> Signed-off-by: Jordan Brough <jordan@brough.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913231410.4169=
22-1-jordan@brough.org?part=3D1

