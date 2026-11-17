Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959338;
	b=oboA9pesaGd7YU1aTOWaFiVUroEiE7hBuKZjBFBtz3CLDwDUHKi0H7TSzExW5lIRq9V1
	 Si5uixDVoAz72AQ2dwHXn9QW/+4wyGmgDm++pu9aGzxXAYxY9HKLIsrw+a0lexhlZpZMI
	 WivnAuhQ7HOwYrJ92ElquF1XZY/6KdolwNOoGhBOkHqZf8uClVF3/LLYiiGpGfe21fuce
	 Jm6o7xzY8baj2v+Fh+A6AggI4vJj7vA0oFur7iHD0Ml6K8vlsZRjQf9OkVmu6CN1i05Vj
	 yq6VOHFIlojoVMiCfEtM7jSELCAlTAaJepyrwD7TNIGU8gu30LAhG/4SIKuntngst2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eG4ck/VNiTKTLtqBSC4GLLWlq99RQ4/IwVUtmFwXS+4=;
	b=DvA+kvPbwIQHM2YiBZmstOKAO+OgpbuGq0qjZycn4KJIM7ci8XXZ0FYHP73QVG+Zn8fH
	 7ETbEz9qgVslMXaF3WnoLSLJIqjN68+f22QAUh4MelFHuGoBiObmCJwcWAEeZtEnC3x+a
	 SLIVXHdJJImokd5JCpy81aq68J6znakGHIzcEvhnDmy3okBDjJcLLGsuDP0ayXfwOr1uA
	 M1Vnoo/aAkGf2pJZgMEYm6i3A/7p/kksGzoqX7YlCLPw2vrTcWvtfFgeIH2eauMzRcsbh
	 AeCbfkKXSNsmUvBWlVs5FeaZ43WIC7uwhXsJqQ3TrbyBFqmjy0l96zKqhofri5Zjl9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVhX9H1L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4966606A32C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVhX9H1L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5161F000C4;
	Tue, 17 Nov 2026 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959338;
	bh=eG4ck/VNiTKTLtqBSC4GLLWlq99RQ4/IwVUtmFwXS+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eVhX9H1LN5mIcGA34eJ7Oq+nXmXGQnjJHPS6k+AkIECIDXElKefZfzKFe44nR14uA
	 Gn7iJZrwp1Gy42d5WmY1EsJR8eyjpf0QymX/alWdttUOchkt7wF1ecoES2eczBOfoH
	 jKwOT+B5MFA0MX52UjhiUAjY2tqDNNhgP+A1HIZgGvoCia6MLunKwWSQGMyYvSxkYC
	 by6saQ7XOmAdgxwevWTWRHYF+7dHBCFIx+8AbsNe10TOOzZX576KYUPBbFwZ6cRzDQ
	 4AJQEhQBcylxU/nKjXmuY9IyHH0OXueDi4zPQSjlxAKIlan0jmBW/mKXPZF3Mgm+BS
	 9jtuHwoN3sSfQ==
Message-ID: <sashiko-outbox-219814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add TI TPS389006/TPS389008
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luna Hart" <lhart.opensource@witekio.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-lhart-dev-tps38900x-v2-1-e5730523d3ee@witekio.com>
References: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
 <20261117-lhart-dev-tps38900x-v2-1-e5730523d3ee@witekio.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 23:48:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Luna Hart <lhart.opensource@witekio.com>
>=20
> Add a binding for the TI TPS389006 and TPS389008 I2C voltage
> supervisors and monitors, which provide 6 and 8 voltage inputs
> respectively. Each input may be described by an optional child node,
> containing additional properties including the label and voltage
> monitoring range. Inputs that are not connected can be marked with
> status set to "disabled".
>=20
> Based on an earlier binding by Flaviu Nistor.
>=20
> Signed-off-by: Luna Hart <lhart.opensource@witekio.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-lhart-dev-=
tps38900x-v2-0-e5730523d3ee@witekio.com?part=3D1

