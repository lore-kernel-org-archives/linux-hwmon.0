Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466124;
	b=xt5TYaVZQtz8HyM7xWQ5AmFmbGBUEpb6B3QGgfAmfaSUDEZIqae57sUqWd2cn9e0Gu3S
	 JdZKBeeE4ywmHg91s+yVQ1hE9rctUBlB0BfT6aftaVsrNrXFBBxhLblFF9s5DW8ClsAvR
	 8DIvNnzSZzvhM2M2hJfo4bMMPN4D0YWgvnsESu2Qozir3WgYXP1niqtDRa2vtVjY2zCy4
	 H3ALh4rWESbkzB+J/Pi+hDl8YVw8zihBftjiEJzhXaiu5spYEleud68wO/0EICU0fom39
	 DBtl7CEFR8srhPBY6FSbGBvlnILs9FZAyqLpGZJqXcumh5elC/ZFxoMK67u5rCR+J5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466124;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GnMJ7so1gxHRSw1zSla/QP8Psx53sO/IjejunaQuAvc=;
	b=DNzb2w/uz4sQHAys7qIoZUqWKedPn4Zpg4AWNG6SoKLA9eQVupuYqEF9CsDg8RLl4Xqr
	 x4na2cNm35abDeC7YeKWgOmGVeU7vRRhTpTtgKasySjuLVkJ6Rm1RwCg2ZjWShEbOKh3e
	 irUrghT/lt22tVaKYTUV/sS1zoXA2XsZqV0kh42wYICZxyTtWhegBS34X6sKjW/IHopgS
	 mrt/cFq8Q/tv0tKrf33c/OigmyWiHx65x87rel63vXvBNjr7QcOl6wGmTOwF8gTX4ap80
	 u02nLycT68zjXEp5jVSnaITKW4mEDj/E9iI+ElpOkMHa3ssnulv5LQwW1PscSlOQacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0qVMxDX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3CC606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0qVMxDX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8DA1F000C1;
	Sat, 31 Oct 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466124;
	bh=GnMJ7so1gxHRSw1zSla/QP8Psx53sO/IjejunaQuAvc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=n0qVMxDX6l83rfik4WnC1OWhn1bHOpzGgdvkTW+Eqr5gfkZIu2top43M7Tt39Tebs
	 EHbIqmQ4JKViwo3QH2Ed6uxTMSAzwStuKDQVRjOs8MKMpB41O3dlKPiaEFOXecAVGS
	 XOXr4tcOjuelaIePRvGpwDSpUV9kBfHsB+XyWgkDmLFRwOFRNcBGTyIdUp8cpXklm3
	 a0JQdhkM0FrY8qyhadGMpSMGUXU6jCDFCkV65mjd6OxFHkxt+DNSKqXtOpseuN05NP
	 kCBpzuDYR+DHN751KLq3mrzKMbLu0wLLm0LyUkBQaw2TV4wRIA4Ir4TCAeqxtL59u6
	 +ihFOemWvNx9g==
Message-ID: <sashiko-outbox-192053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (acpi_power_meter) Check for 32-bit and
 64-bit unknown ACPI values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031165447.1771473-4-linux@roeck-us.net>
References: <20261031165447.1771473-1-linux@roeck-us.net>
 <20261031165447.1771473-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 17:02:03 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> According to the ACPI specification (Section 10.4), ACPI Power Meter
> objects (_PMC capability fields, _PMM, _GHL, _PAI) report unknown or
> unavailable integer values using an integer with all bits set, which can
> be either U32_MAX (0xffffffff) or U64_MAX (0xffffffffffffffff) depending
> on the DSDT revision.
>=20
> Currently, only hwmon_power_average checks both 32-bit and 64-bit
> unknown sentinels:
> - power1_cap_hyst_show() only compares res->caps.hysteresis against the
>   32-bit UNKNOWN_HYSTERESIS (0xffffffff), so a 64-bit U64_MAX sentinel
>   bypasses the check, overflows when multiplied by 1000, and emits a
>   bogus number instead of "unknown".
> - power1_accuracy_show() does not check for unknown sentinels at all,
>   formatting 0xffffffff as "4294967.295%".
> - power_meter_read() does not check min_avg_interval, max_avg_interval,
> [ ... ]
>   sampling_time is unknown.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031165447.1771=
473-1-linux@roeck-us.net?part=3D3

