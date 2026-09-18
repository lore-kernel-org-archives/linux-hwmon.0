Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8082472557
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754366; cv=none; b=J2Nmh95L+aHIrNRWv9tuDoDNXGrE/hRA4A1vyLamqicOA5OeHcI07WvsL9sAHK8vZuXBimV6YiJfdZIQtE3n+cGH2csMwibGBMrs+kGtlyE3DBra5++RIRqiYalmEYG+L62vCSFBo2wCzfkRZAbKhI0sR4T8EQ5FHX3EajOKYGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754366; c=relaxed/simple;
	bh=GdMq8hso6usaa5GFOuvcYPalFu3ofIgpWJLjvsELFrg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFHRg9XqBIwqRQUSw2TCbkxh5ImBl50OXA2a0/KadKAuc/caUcfV/WRIbI669nNs01DrExB3arteqrxYN7ddEuWs5Aur+wvVEdJdxZCaclvxtsHXQJoYrzb9/uCmYlwQ8PC26RI4T+JshjEIvdC/sa0qq7Lz6jwxrxgtiUQVCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyZNZIfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyZNZIfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C271F000FF;
	Fri, 18 Sep 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754365;
	bh=GdMq8hso6usaa5GFOuvcYPalFu3ofIgpWJLjvsELFrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jyZNZIfM+kRnmIt/rpbiL/PwBRrCsrpL5x8TQI3ouxei2m8kBqyr8u/e026wTMZzk
	 h8ScwndkvtNkXYEf95eN9RNzg+XMJWwU19/Czw/vWHvO7S8hUBZX7/jeHWKcBlqiqJ
	 OnqeAna7RweGGSKiHpY/YKf4oE4UPdk3oj+NMXuROBfVlS+sMOxRzi8Jiigf36FuB0
	 zny/hC+2SQn3B6xvjeBLrJBVlz8zLtp2TCNGUUex21u2tDkTW55Lx6jH9F8ePlJvUY
	 iktkxDVQ8eaYrXCqdP0HZHiPFQLsnZ0LGRC7yi+qDiZfM7U3kxe33CuS8wOK2j4JwU
	 OEq5tdsneoQVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ACPI: battery: add unified battery hook
 mechanism for ACPI and SBS batteries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jordan Brough" <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260918175052.85461-2-jordan@brough.org>
References: <20260918175052.85461-1-jordan@brough.org>
 <20260918175052.85461-2-jordan@brough.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:59:24 +0000
Message-Id: <20260918175925.43C271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> drivers/acpi/battery.c provides a battery_hook_register()/unregister()
> mechanism that lets other drivers (e.g. platform and hwmon drivers
> exposing vendor-specific charge control) attach extra power_supply
> properties to an ACPI Control Method Battery (HID PNP0C0A).
>=20
> Some machines instead expose their battery through the ACPI Smart
> Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
> which has had no equivalent hook point.
>=20
> Extract the battery hooking implementation out of drivers/acpi/battery.c
> into a shared helper in drivers/acpi/battery_hook.c, built directly into
> the ACPI core (acpi.o). Both drivers/acpi/battery.c and drivers/acpi/sbs.c
> now register their power_supply devices with this shared hook
> infrastructure via battery_hook_add_battery() and
> battery_hook_remove_battery().
>=20
> This unifies the hooking interface across both battery drivers so
> callers only need to register a single struct acpi_battery_hook without
> needing to know or care whether the underlying hardware exposes a Control
> Method Battery or an SBS battery.
>=20
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Jordan Brough <jordan@brough.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175052.8546=
1-1-jordan@brough.org?part=3D1

