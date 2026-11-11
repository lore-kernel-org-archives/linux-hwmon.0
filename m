Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415330;
	b=p3u/h4Qzc+foPAmy5LVHRwuKOmLwlXfn1y+4dnABTRzwJmOjyOdKBmj48qtX8XHfYmuT
	 htX2TIsVF2ZVxnU/3RFeAUbx6+wLmFBLDuvHEXRjwzMvICgVK8sS4DVKeswIE/9lH5/ed
	 Fz5lrTP0E4lxxAbI/OhnX5Z4AXm5uLAKKwW5ZZaUyI23RrWQIX20Y1fxmiPq4/yDg/fRK
	 /jVsiczguLqhLhFxQ4w9OgHB8s0gwQjTIFiBL4MILY6ae4uYT10x+QroZGROv8I6fHiz3
	 TrNgQVO+VgsRLme4etQOypC5A1XazlHGlgOp5SeJET8t7zlr1iNOLaIF0NzxRSuKHtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415330;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JqQCWuEarmUjVJdZqljVT1EQqbNJ3oN1Mdp73+O5rFY=;
	b=QXu+Dg3uDXEQRMwqcZQclu2jtDJRA+Nvrvu7yqfnGcdHE0P2kzU8zUUHYhR/AbXYbJca
	 ADfIjA71n3iqXFXJsMbpD4/2OUfLoy2rLhCFNG+jQTTQmsLEsCj2ycZWGFJsqRo50C559
	 BdwUgMLOJjpwBCAs0IQeUpVpzIeoKZqFT97OeV/3TLTKgXXfMaQGbg8JTOQIjgFqC2TM2
	 FCaDYXRE0VJjVk8VUeHTCq+k7UnHcadf7NOd6+bl3iizmgaXS1fAYHO8rWEXxpbeV/B02
	 PRTqqQl5hF9LIFbAr8lmCZz5ZvjM1Xr69ti3CT+kCC++fl36a8p8hb7qZ0Hqh6xkbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NoWa54ki;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A03606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NoWa54ki
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C8C1F00A05;
	Wed, 11 Nov 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415330;
	bh=JqQCWuEarmUjVJdZqljVT1EQqbNJ3oN1Mdp73+O5rFY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=NoWa54ki/brJiQ6iS9nRrVR5ArS3YrDO4IZojULNpjWz4LVPBI7oq/5WKwyL935uj
	 axDccFzHzX1Q+AxM0gwcNBdSonHXohMMtBzBfJSGgF7vXAQuIIUwGTlObKWCrH+akc
	 7Vfmd4trTLt9kcOynjjuxxFDHgJsCResX49vzJWFa+ZqrxjiixSAa5pJI0PSVRTg5y
	 sZBoWvMxrBi15B53FUXgEoQzEBJof/HvISh/T4gvumTRdWTQAeFAJWYVEQ1obUlUW9
	 tGiLcQ6Pt1nSFot3SimV21YpUlk+b9PxvWpjWZH9NSWIeLrIvKnQsxQ+2MymSRgfCB
	 Qpplu2Qs84QDw==
Message-ID: <sashiko-outbox-209308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:42:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
>=20
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111161619.2321=
41-1-robert.marko@sartura.hr?part=3D2

