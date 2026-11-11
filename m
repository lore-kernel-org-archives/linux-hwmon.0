Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385995;
	b=bETINJ3jmxjbhN3y8KyMIJDy+6EGTRVPadCaPll5nScIMrm2oeFXglHqKpH1bDNB3pZY
	 ObzkFSM9y9nxnQ1h3s3zucp1vEYUSyU50UfwXi4OCmNQsq2mFkgWgFivG7ce0dmREogDP
	 u1z/KmVJ1RfDOhzut8WRT7FcOrUWXOk1OdIxfUrfplJei0DLvPqCCieHf05W4icukbP1L
	 Kru4mvfqxcZxHY2FxTapWDDi1zAfvgptKLKcjOy5Fy+zWJxRGyPDdEbcwdZ+H85ZxSUFh
	 /yL04BAebjUJTi5/A7vvP6JCqGYMKwt9VB4MpZ5iDDOtuyDrdoNHPNxd4XgRMtW/UDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385995;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l1ek/fqlB3D7DNxQv3oLggvpsZprJE5RW0dDqEfyUGg=;
	b=IfD6iDlP4EBnSnAqmJxgt8BpRK8cgTUXaF8rFqusRIXAV//sPPUNBtDSaD7zl2pswmoy
	 mycF2L6dJaALu6BSP+ZPxI/cMT5ahih5VVrmJ05Cwu9JoqCENjxe3L+dfG601ZLV/L0Rg
	 vGec5i211VMQfvrdYs5XsrdPTp9Qj7R3N5KW8LCmpWiWDkDQXxzDZIIqXXrsPi69XKVOF
	 rZhd+hPJ2uz/k299jbKaWaBZWAr8oZxZ7Tqaye54p5hbNefZT0uCgio3QHeKdCAV3ZPg5
	 GjLRarko7FLbNWlapCU8IFeqAeWN+b7Qg/gZ0fEu9eTsXB2s66zJ6O2GJwg0WwckqXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+5+croI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A330606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+5+croI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4A91F00A06;
	Wed, 11 Nov 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385994;
	bh=l1ek/fqlB3D7DNxQv3oLggvpsZprJE5RW0dDqEfyUGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+5+croIC5EehivvC3ynvd2IYMZenkHHinnx2hjUcWH7pSZ2T9/wdB2Gpb3vS5AQU
	 HbbWfuQR5Rm5ui9e+ul51TK3N/CvPCQPMCeKW6vulAGUIK7iQ7Zb/kEpiRo5tWw3R8
	 KId+9w97w7QUOhy38IlQx58da3k5OvKE5giFq3H914vOyPSwZCnIZkKgQhe2WfvKha
	 fLSzq24PER/bR8pE6xQFl9A5MI/hTNvDSrKmKU68nBmGIh0Gwb6k49u8gPTJgc7Ejl
	 4cyElS/8PB0Jr2N2Ci3Kp3CdKJfg99K6VPez23n1w4cnP7SjGwXd+zP+5CqGsXzTur
	 Z2VoilAOkhB5Q==
Message-ID: <sashiko-outbox-208612@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] hwmon: (nct6683) Name the sensors of the ASRock
 B850 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-6-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-6-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:33:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The inputs are labeled after the monitoring source of the EC, such as
> "Thermistor 14" or "VIN5", which says nothing about what they measure.
> The UEFI setup of this board names them on its H/W Monitor page.
>=20
> Add a per-board table of sensor names keyed on the monitoring source and
> fill it in for the ASRock B850 Steel Legend WiFi. Sources without an
> entry keep their generic name.
>=20
> The CPU temperature matches k10temp and the voltages match their nominal
> values. Which thermistor is the M/B one was inferred from the readings.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D5

