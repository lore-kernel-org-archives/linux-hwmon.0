Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461088;
	b=AOrP5i4PipwViiFepKYF5xYeAFnF8ExMQ2l0fOogr7nMoqyRUSyRdH8+esmbP+GCJyXO
	 /y9fIg1ylIUnuftZLkgfTfKr1G8fmvV+AQuekkaW2tgNzx3/1Kwe51WPHdvnQoH1zcBaK
	 X+fFCRCMothhZrNgY2eUGFxZeDLR70bO/S53Cdro0gcUqrBpb+eyKIF7N1/4NZNpWl9kf
	 6Vqv7NBmcJAsCMifCTDdIucv9pkl4LU68lNcfkMh4I/RtOQVYPEdVIa3gQoB8IoxV761e
	 LWvkUQDSZb4ZJBmSzZDhQWUyHDCEa7yaGzMfeSiATyJj5swYCu17/cIuk6+UI7CTKiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461088;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zB/6P6PBAwXESrgGR87fzS0I0A9EM5HSHUj5uEhPwCQ=;
	b=0l6u+oNA0bY3D4LmAAwLFzLDSuseeCFYaNkCbPH2KEXKIuQ9RDHxs7/J4UxOnnWzpo3X
	 nEXRbBTFTOBX1hdZJTHavPB33lNeK2KN1NEBmfUojmkKqyclJOnYpW1hjY+JbOhFME3Tc
	 SO4kWNfZ/lkFrnxJBPC5PIH0RKz1D/aGtVkTwk/GhOi90vAOz9Kdq2XJGZDg5ADOu15M3
	 ettyEsJcWgPcW5Egv8uYbE68K1rXsbpBk9uE6H8RUSSrVaR+R8YUnWKGRu9kj9GeQ+Jut
	 tOd2pqHFJEaDjcaAvhGIIIlj4lHORfYg0JVnc72jldT3Ddqc7nl7jRel4kglOPOYJ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv6lL1Zw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B2606A31F
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv6lL1Zw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8446A1F000C1;
	Sat, 31 Oct 2026 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793461087;
	bh=zB/6P6PBAwXESrgGR87fzS0I0A9EM5HSHUj5uEhPwCQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Tv6lL1ZwA+rUqcUXDzikhSpChmEnhvECTimeLznXWdohasniG687GI3AkNedq1KH3
	 JQk536B/Fij1ppwbciPPQhKpUWvNSpUNg/maYKlKGTdQ3xKY7U5Rt8MHzcbKasO8N6
	 72HLytjLivQKVx4gaaXy94wq0xrr3xXB7VifJQlHkK+YmaaE25aYVFvKjBtgSMaXTe
	 TuYA17ruFqv5PJx4cgndLq30nPWxaj6UugEm0u2TDb7yXA0s4d4k5cK4TOyiczJlHJ
	 apbOdVrnAkDUfozqE2sMbFtiI/cVcdwdReVJd7lNqs5Ds5bl19Eo9Z25+TIddVzwrh
	 6zEZ3IjDDBWjw==
Message-ID: <sashiko-outbox-192022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (coretemp) Check for NULL platform device in
 hotplug callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031153528.3195123-2-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
 <20261031153528.3195123-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 15:38:07 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> coretemp_get_pdev() returns NULL when topology_logical_die_id(cpu) is
> negative (such as -ENODEV or -ERANGE from topology_get_logical_id() on a
> firmware/hardware APIC ID mismatch) or exceeds max_zones (for example,
> under asymmetric or anomalous ACPI die topologies where
> topology_max_packages() * topology_max_dies_per_package() is smaller
> than the logical die count).
>=20
> Commit 6d03bbff456b ("hwmon: (coretemp) Simplify platform device
> handling") pre-allocated zone_devices[0 .. max_zones - 1] during module
> init and dropped the NULL checks on pdev in coretemp_cpu_online() and
> coretemp_cpu_offline(), passing pdev unconditionally to
> platform_get_drvdata(). When coretemp_get_pdev() returns NULL,
> platform_get_drvdata(pdev) dereferences &pdev->dev and triggers a kernel
> NULL pointer dereference.
>=20
> Check for a NULL pdev and return 0 in both coretemp_cpu_online() and
> coretemp_cpu_offline() before calling platform_get_drvdata(). Returning
> 0 in coretemp_cpu_online() ignores the unmapped CPU without blocking CPU
> bringup or tearing down valid thermal zones on other dies.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 6d03bbff456b ("hwmon: (coretemp) Simplify platform device handling=
")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031153528.3195=
123-1-linux@roeck-us.net?part=3D1

