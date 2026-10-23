Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747244;
	b=igYl4R/5AzKKBVuG/cHocd1U1U78XT9cGDeijFp3Bnjx5qaQDp0Ra2LeD1GDjJx3Pp4y
	 2wX54ixwNmaWpgGJCuj7cKRjjP9qyC6SXB0SWZg9ajH2XE7mhh5JYaQYICj6wXl8/0alf
	 LFWnE65ma7S8UAp/fNdjsO7LjnZDI5TOEokMu4jf/ahbZci/Juikmy2yMFhGbE9q+ubLM
	 iMlxTbwGP/ugOkQudt3s1nXYqw8eWqr0UCtoS/TQ4/aX7GWciqC/TDZqU727QChlHgLY1
	 HBZf58q6FodTeQCb7lD5wfYQ7FGldTR2l9AxtVhgLx8Og8SVUy1FCeC1qy58W8ctDwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a5LUh8TWNmQvN40JKhbZylmjNISPkirspdoj5hTuXzI=;
	b=zll86fIfS8d/TNlbus47yNWxaDPKZmr76V87ZJQsYNanUXJeZxLvGQhkQ+sH6Ovy1L6W
	 33dDUs7NmmmJp+nYuRJJ7W67gnY3bU76gCEw70XTu1jkrCd+ynyI222AhYSUK0RcHa1yj
	 ghSwWm67WIFIh6CuwKjlaOCoRn/6RwPBIJjrd+TPV966CXKpMJ6loym47nmrF71AwKSbm
	 K9YAtU852mdWY3CQf1+N9F1Hwvk7Obp1QZyGccy1yHNcGkKgolKaJ0C6fEiMSF6/r3tqI
	 iQhRswLgtbNPY0dUxYmE7TmozyOu4R9M9fWk1oeIfJk04+rAEU6MnRdYUEYEeJMKvUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClELmPO6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364D606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClELmPO6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AD21F01825;
	Fri, 23 Oct 2026 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747243;
	bh=a5LUh8TWNmQvN40JKhbZylmjNISPkirspdoj5hTuXzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ClELmPO6gtPWpXxR3j3XjMF3bKxyB3C4R6EcvDxVkvVe3MZ1xIRdnSqRx9+KoeO/b
	 XG3Gg9Palv7hEC7hYyBxE2JjMDhXndPbcRpl0lQErODfqNLMamwAw4477mRucn4AbJ
	 Lzp5SgD74hlQHNDR1+XSDMYxl1IBuvQyDxukjtgDhhJg1GkbBkc8LqihMoM3I1NYdF
	 R90Whnmx7MuhIMBFy04yC3Ira32UnoRU4sVoi/eH3Iv55WpLmefvX/2JrZ3tf4d0jJ
	 Loy2f7+XfmK657o5OfqY4eVSWTYu5wnpQa8t/+7A7APSKW3n1lh8aX5u4rvKa0S+cK
	 AQOG4mZ4tmPvw==
Message-ID: <sashiko-outbox-182572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:20:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add MAX31875 compatible string to lm75 dt-bindings.
>=20
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023091550.1494=
-1-johnerasmusmari.geronimo@analog.com?part=3D1

