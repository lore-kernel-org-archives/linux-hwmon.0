Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E53C65FE
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693869; cv=none; b=chYOkDnvzTwowEWvzl2P8/zA+dEqSGvU6zZ6JhwXv/Hw7utoUWXPyMtUJI/uxIXj51j9yj+kxEv3YkZuhAb29h6jBq7G+OcWK5ytZfRN08Rrti9+Xjst9e20hFOf/90CGAqS7EdQFNAJDE43UM+o15Oa//WrI5Vy5FhfM4QTcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693869; c=relaxed/simple;
	bh=8HNYl6wEltJeL3WRHcJlYYTwZNpHr/PziTla01mHJ90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TRIU8KehMjDPdI4/EiSqbpS57mCiI7cVEF2tL4orFzE6KgEFSAyfM7koRX4MBpLdx6xpPL/2JztlplzTqSnJ/WPvxzrlMHW6Lfo8bIMIvZRhiJOTuwca9zSHC7Oi1AzgUBdtRVkKIcFd1q9kvc4iTzJQZA+StwN7UUuUOZE+rVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm9iP4Gs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm9iP4Gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313591F00893;
	Fri,  5 Jun 2026 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693868;
	bh=8HNYl6wEltJeL3WRHcJlYYTwZNpHr/PziTla01mHJ90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cm9iP4GsSOnqItR3mQux2llIv0krB5QbO9zWQitN6a8fLInHpJkbrcGnhHibdzpys
	 T1fDNpZOgMh0F+vQzWH72hZTn0NDwkozBaeqdTXsCqnQyWmu13AHzTaUSa4VuJ5UXr
	 HaUwOdA1InuTZfB9wfIXzaNTxSzmyTyInQPDLjMTZwxoDYI0PI+DVItRdq2Eptyc1i
	 tCxeCPCx2oCt2JpRd3+XRKm4iITePLKtqJU0JyszQSzFrlo/HN1gJD46E+rCbvyEnJ
	 SbIpxfKfrIKBRGiZqYv9hYdIWn0fZ99bTui0I1l5BuH3wyOoFqccOE4JdQX+N/zh9D
	 AjY5k7F032XDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] platform/wmi: Make sysfs attributes const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-9-W_Armin@gmx.de>
References: <20260605205937.530897-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:11:07 +0000
Message-Id: <20260605211108.313591F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D8

