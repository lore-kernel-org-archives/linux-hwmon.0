Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655170;
	b=HNehLJrjLBnUuWylCeSDdvjCloDngPEYt8oHEK3VSQBFmarmzfb+J9tjeF6ueNkpql7K
	 bYwEZp7RPzxrOklWtJYKOHgqTQOVFtKwhN8El98QSv1mj8YZTmbNZmP0kIb9fe2DRWd5x
	 qD/PYlq3zLUHWB4zyCuQiRIDxjVqqT53OqqIxbx54AisFCWuhIzFHGP3WWEyADl6xk0wU
	 EXTPyxyUtxKl4NtGX1xlgd7uEu0mzmzigzSQkAQMh1nPAJXkLvzk5vJZQrxmrTn05Mfmf
	 1AJMdWO2gt3LCgmM3wvMg3rIB5unqPf4G3Z7ivhS3DUPg/TyyeqHVuNIKSVSxjqBHMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xXHl9+rrv798uc54pUSFZeqxtnhGCmQpw9vl8H8gxaw=;
	b=HgV+0joWh/8r0MiLgoYnNi8qaHmb0z1a/gfTD6Y2dFsmRsjP63TILoGQ+GrbbJxom2Jw
	 BUscaN9xnhTg2TTV+amevZqJrMNDDvW7JN0+YHDfmbZDoLtGEYTdOC01KjgX9N16oL4QM
	 8sRTK92vUZ/y7pn/2/Foj6S8NzjTdO8soyFmRn7YU5817LW6LDwXixEQYPKBxYyvWaI6y
	 kLo5VzmKcCX5uRmwEYM0TFYmYUxHlAQ3UNnSOCLQg+BJiGExmj3eP/ZxKOqsomFXVr+3e
	 1Ix617FgIBUdDKjxZusqxWN8iqoxBuahF8KzqTAn8wSbtvPj/rU2bkZ+9DNqViAC9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j3Qix/ji";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA9606A319
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3Qix/ji
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364811F000C1;
	Thu, 22 Oct 2026 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655169;
	bh=xXHl9+rrv798uc54pUSFZeqxtnhGCmQpw9vl8H8gxaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3Qix/jiAEyoPKIzrMVowk9VSc1OWQuKiEPcnetjYvrgow3NDto4kfiTT+TajIK2G
	 Xzh7FdK9RVo+jqnixTG4DA9n9L3y5reR6wQQ/k8njqoTZF5ebuE3p9ug77uz/owSAA
	 vgcMugjwNhYZPt/0UvT9IwAmPW70fyH8oSZTojc8NBtk7GnKM2qHkgSrC8Ozmr8Ol2
	 sPBcrNM2diOHaK7+wR1dtcTxFy9D14ukGPSTYGTdJ8jOnvegr7IiC1vUdmygb6vqbE
	 6i5l7LaL7CVTfpST4HNWg2ut8fnG17V8PqMgGHxmsDnxNjRSoTKLfd21DDquMbVyw2
	 9B2Mb2wzOwAdg==
Message-ID: <sashiko-outbox-181133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/7] RAS/AMD/ATL: Match AMD CPUs only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-5-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-5-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:46:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
> relies on the AMD northbridge cache for its node count and F4 devices.
> The cache uses fixed PCI slots that do not represent the Hygon topology.
>=20
> The cache is therefore discarded before ATL can register its decoder,
> so excluding Hygon from these feature matches does not disable a
> working address translation path.
>=20
> Qualify both feature matches with the AMD vendor. Hygon address
> translation will use the Hygon node interfaces in a separate series.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D4

