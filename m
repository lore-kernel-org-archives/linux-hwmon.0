Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794186261;
	b=WuEl9FtYhiCUMxdK+Amt7ovXjd3uDfC9+g6JFQTr4p6G3xeFSxVzZUOMaMN+fSdq11zb
	 E3+93DBjQj/gO8lUbIEyKv0d1Zhr6tjSSS1kt2E7MdicCDszUjReiW0Wp+eEK0TsyvZEO
	 2QdzNAtLmOOCl5GRI7H2QXKEb62uUFu+hjjZneVeIZsUOOMAuWdpijCb36yQNZNheNW0/
	 ceq68KlH1FB6YV1gNg2p4b62+rGBoyTqGj7cB7E/4GKgaSRxT4gRsn9nTZspblrM+tUxz
	 C/2nTgpjz4RC830LhWQhr5p41yrDPbc7DkC7oMQDkMcg5WQK1pgV7xoYC3KvKvfTS/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186261;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R1W2/oyTW42g6rxZBKRrRPY7fEm8KaH7537p/wlqW6o=;
	b=rPmHvmkkvSi3qKZV+cQldvS9uZVJPIlZolcKWcZK9B9zrfSNQW2DvWd1bh49myT3d7Q4
	 XQ2m2wkqr/PTryutBs3UZaNkDpQroblUkmRllGMswyZZ4l6ocSx4ul5c6A5khRvUvBzIS
	 q4q0Y5TtzKNuA2UA+HHKRFkmLR073g1HymABTLhlicPBqDpT4Gu7fTteOSGUq+voywjSs
	 0TIEHgvuC8hESRwk7tBqE5mSbTD7rGXbOCg8+QB00UHt8klvEnMWj8Gtj6n4zIT9OFoxR
	 DXcr0gPx/oCwmNhXQblR72sCqNcOAeNUiX/6gePkOhjbGWL7EQ1nl3Z7P+nR0SYtsng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+o0Q2b7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31E606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+o0Q2b7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035151F0089F;
	Mon,  9 Nov 2026 01:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794186261;
	bh=R1W2/oyTW42g6rxZBKRrRPY7fEm8KaH7537p/wlqW6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+o0Q2b7OM6LdBRRkZw4+aQNrjIBakGlG4bm5fWthy5dr+Q2bPE00NYNlmcL/3BIR
	 bC9yxtSTIRSVr53yFfzZdmP7j3lsEIEMUcOEBoktrIRjKqKFyB5W76YpK9uXFoO+Cm
	 pNxuyGjfIKiV3dn+JrGKPtkX5oGzphiHjKmFZCoxI+33ST27+DUsyplEtlZlG+oRbX
	 LkhBNWUhuVzQDHOg6JTdyfYWFp0g3YQDg9hrg1OIm1RirVMneI+vI7dQeRWwV1kC8A
	 jyC0CW62VHewkFJwAE4jlAo1fl9XYYcDdl0pnskCkiGSNnjYmYlwGYGYqyaL6Cc0s6
	 zCrY0EksLruOQ==
Message-ID: <sashiko-outbox-204277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 01:04:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LTC4284 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
>=20
> Note that this device has a MODE pin that is determined by differing
> voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
> controlled via software or GPIO.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-staging-lt=
c4284-v2-0-14a270a38f7b@analog.com?part=3D1

