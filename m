Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107124;
	b=NRtkMfVFzlsFF5eQcV0fan3q0i9VdzfriaDbYV2qu5/GAaz8BD+MV8mC/cBzHP9bhfGJ
	 ezJ1ZLxPVMSzXMecStT3n5Q/bqMrGVGdgOeY2Ad1YxeRYmyUhknDXPewuM1N6Q6hIzMSx
	 Ec5FJv+Nvw1/VLn8OftiWFOwMbhYo2sSpNavaVhLN9lvrqwrHEEz0yZnnt9P1xMPxKUGt
	 QCKOqAtKIhgPh13VT0Q6vWaLyC9hMt12GM+ggxGnDPeLNCGg/lwpVf53/HocjFsj2iMMG
	 j4UwidkoSIelL4vgupCvrqY/VFKJV+TX133vaV4MmAmO2F8ON0zBly2//uOJ86mV50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107124;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U0/PlzoB5j5ysoHayk8c7xIQkDUiuJaZm8G9tHFOp3M=;
	b=d9ijfmyETW1Jp0dKY8MmeEDkZugbCAIVysfyq2mhqPmVrKVn+UNsGasy5dy7sM9rryiZ
	 wGdVqxpnBlKvRm6t+Ikc09zasKCtOzEJYif9uOFrd8eHkVPDnQIJdBp7ryX1JXS6XbsRh
	 H7leRyVyZ535R3fFXrOIYfcVj61bvyFPTs8PbLQohFExgSJyyceKrvATuQRT98DT3EeOM
	 oUT100wX4i3vyiFehyTf91q7GdqIK8aTseBv+xW+ft7rM4vcDFCKZIQs5NnBzE4ySlpHN
	 CYRoXNV3ut0oQKCWJq97bJnrEgn5VEFPNefqH01u3QuVNfjgwPkDTpv0JEwVuVf0Hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGd8PaSp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2A606A335
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGd8PaSp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802A51F000C5;
	Thu, 19 Nov 2026 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107123;
	bh=U0/PlzoB5j5ysoHayk8c7xIQkDUiuJaZm8G9tHFOp3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lGd8PaSpE+feKR9WSLtgq9+zaL2781nv7+xA7RGMDmRyUe7wRfPzXxBUKvq4hE6AK
	 xySEaBOEWjy2o0XGY0GrYCkc3fT6ptKsV8Ls7xek+vQ7gWZGbJMO6Z4NUYsogHFqiA
	 OushjSHLd2CwiDr/1q23jL2qC9G3/hES8/5h2mYHZykzF0e/61FPogHSuFTDq6MrU3
	 3kSkG2Avip+5D3b1UfYSLch98leX1mZ5xXCP2vd05Yw7f83Lai/xs35RkAifWCKx28
	 25FMrozxY11Pl3z6ZfnCGVzPWGewAUEtCw8tpyYb+fKLZYXH7OH5VIY8jTjWbwv25q
	 2Bv96wAgCAu1Q==
Message-ID: <sashiko-outbox-223585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119164708.1280862-3-benedikt.niedermayr@siemens.com>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
 <20261119164708.1280862-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:52:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119164708.1280=
862-1-benedikt.niedermayr@siemens.com?part=3D2

