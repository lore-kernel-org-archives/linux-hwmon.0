Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785184;
	b=NQiwF+xCaA4CHWOnTnYF/eo5VdQwaRs/a8yJVZt4lQmbAyP1DMSpOBcdHJTIWAK3NsKg
	 OUdAqKY6/W+TU4mpuWzgMSRjxFR2qa+qE/jCjb7oTCwdvVEopakZ1/P5Sa9oa+1F6mP8h
	 +BSnyM/Eisjeo0hE916tAp8zKNd++HNKgdHzv7utVl3//ByS6lm2h8TmAxWF904eff5RT
	 YY5tac09rtTk+bFZo5kFz5cQ5aWrkh4H+W705UtfFIaNALjak+WtfFFssHqwbLeYZBQrg
	 /Q4arncxgr4CbWBWlvhUoBrcQqPvTp5IttHGu0SzWpH3AUCrste4ul8U48jzqvsE50A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785184;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d9gwMoyXTaDSKNyesdLh3/igAdahnpb8+FxZuEN7WrE=;
	b=Kx6niuGKgjVT0qH8Vbf1QcrhiWbUzz7oCbXb3LMZoNne4a+MUrz+HdDaXNiwCNaiWsTG
	 Hq9sote3qHPKFaiWyZZpuq7KYdYhUD3nUeZlY7B0he3YlfjLx0ZDD84oVD6lATL2ZRtnz
	 +Hlszfl3YKJ2UlkKYDY/u3ZPrIZyIFFE2WTtql8eojtyWuT1EDy+58p2ISxAr8vVHId80
	 IKlYq22GTotnKY1bDjvSw4oaQUAFxPBmEsKhQBIoWbl4mZD8/0zjUeuTEcLYoRZGlCKZN
	 UbeOGXb4MY+vrzfdolENlnP3ipx0WPL5CDFbh9Z8Z/D0ydpUGtVr5Grn3jQep3poL1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hi7Gvw5T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82797606A326
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hi7Gvw5T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AE01F00A02;
	Wed,  4 Nov 2026 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785184;
	bh=d9gwMoyXTaDSKNyesdLh3/igAdahnpb8+FxZuEN7WrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hi7Gvw5TyKX0vD/Qdbz3AhOQ9Ro86xZ3T/4ZiPAgJBUmvKPxul6yjCJ0RcG3hZwER
	 2rf+rtSg7PlFq6BFji/y+o9GfqQGvu2uoGVce/Tuoj/gXOEliRll8HOa/AlDH08yTd
	 q+WZA9iKtm2KdnGlsbf2DGMZ93vFvbtOtvYPFg/ylz4SW+fUEVoUZ8gPsE3m1V3kVU
	 ewxM/yGoKtkd1hU7k9mDVLn1z3uCeNfhbC82iqNAg/jNu8Q7V2Imutmst1c2UARit+
	 ZpQI1Glnpuu9vZ1RoLohoApBLh5duRnmPhEt1lniU1hTjAThJQQCrNsjIADzRVM45m
	 A/SGVen7oJ3SA==
Message-ID: <sashiko-outbox-196978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/mp2975) Get vout fault limits dynamically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261104093213.2422350-1-fradensky@nvidia.com>
References: <20261104093213.2422350-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 09:39:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The over- and under-voltage fault limits of the tracking mode are
> relative to the voltage reference, which follows the VID/AVS requests
> issued to the device and therefore changes at runtime.
>=20
> The driver reads the voltage reference once during probe and derives the
> limits from that snapshot, which the PMBus core caches in addition. As a
> result in2_crit and in2_lcrit reflect the operating point at probe, rather
> than the thresholds the device enforces. On systems where the device
> supplies the CPU core voltage, in2_crit was reported anywhere between
> 1.15V and 1.70V across identical systems, causing false over-voltage
> reports once the CPU voltage exceeded the value latched at probe.
>=20
> Read the voltage reference and the over-voltage offset selector whenever
> a limit is requested, and mark both limits with pmbus_set_update(), so
> that the core does not cache them. The voltage reference is available on
> [ ... ]
> voltage reference, while a negative value would be reported as a read
> error.
>=20
> Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp29=
75 controller")
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104093213.2422=
350-1-fradensky@nvidia.com?part=3D1

