Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717017;
	b=rfDET77QYJ6UZ0IwVGwMdxmiQY3VAQlm8hnfBIH7LzawJUWybBlWQoaenuNyyJhRjMZS
	 tFRm5pi6BaSThOJnf26zbwDy2sJ002yWwBvMsAdNxOVec4birXp4yNDYlNxZ3I4aeh+xa
	 g24Xbf9VOYYHO376cbjEFdSzKN5JjnWpIY1+zG3FSXpymU3FGreQhzDpJ6LYe9Ao1YzS1
	 YZoQEc7KrnDWe7g6XnJrx4NbKmCTdzXAfM/H7ySmjrxYWpivhHOYYp4zVtDMn1pF3Ac6H
	 1vYylCZc2msiCq9jYMtVFPHe0CbqvV0Xf8WqqMy5kG0ts9RfIzklZU0wGkoIFwhcvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717017;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q+qYKMFaZD/TV56p1fh9OSQvh3VexnN84qAmSkyiOho=;
	b=dhl4ZMm4afvcSwN6OjrswPtntTAR4P8eZN9jXSID3ZGQHFluA2PymUc8KpMtcvZ0PuUn
	 5zLwA2gqjO8sk3O/ONnJHge5hQz8Y4D1XyXFHifwu3V2zkHIMfTJbR8RBkxbDVqeJbtO6
	 SIBv68vkNr+dTctgEAAqjbUvrSlSCnbiv1W+ARaH8R6yKWZmFPQfAS/A//lIOERREwF9w
	 NFSaOOBrSIDQqy6pCuG13pukeKnpU4bJXw30SARkHD0qdlnldEEnC7OEiTCv1hA/k49gQ
	 Fufi89pLllrxrOQ/DNeupoYjnzXUwwzx4L0JoZNJxDdXqAUqj5+lZ3nYvNpwmG84Llw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5x4oZ95;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3A606A339
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5x4oZ95
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31151F000C1;
	Tue,  3 Nov 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717016;
	bh=q+qYKMFaZD/TV56p1fh9OSQvh3VexnN84qAmSkyiOho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5x4oZ95daHpwgQ2YFrfT2VUD/NrqBnxUdex3+DZAMQKzckz1HRSak2FTMMAMidtW
	 qGN/q72TRYUvcYEhz8Gc5vzVecdEG2AiLulP4wV5ywy1lURoL85bhr2VviLlkgDX4K
	 VM2TkcUASO2qEDmRYiuXtQRE586SXqqLAvKgroRjD3kByCQPD42pwcfPkyFyV68drZ
	 74tg0dOBp5PxO4m3V7WAYvUwV2L8UUY+C7GonXmZ/v4UQZfJNRKyqJMoJXOHnshKNG
	 gYn/ptQkC43Y0S3gEb9h40Qc+YnyG2H8lTIFw55BLcHqjfiM5Qj7LKF150BWbyMCIA
	 ihLEbXTDMT9fg==
Message-ID: <sashiko-outbox-195470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] dt-bindings: iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261103-pac1711-v5-4-71c20101a52e@microchip.com>
References: <20261103-pac1711-v5-0-71c20101a52e@microchip.com>
 <20261103-pac1711-v5-4-71c20101a52e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:43:36 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> This is the device tree schema for Microchip PAC1711, PAC1721, PAC1811 and
> PAC1821 single-channel power monitor with accumulator. The PAC1711 and
> PAC1721 devices use 12-bit resolution for voltage and current measurements
> and 24 bits for power calculations, while PAC1811 and PAC1821 have 16-bit
> resolution and use 32 bits for power calculations. The 56-bit accumulator
> register accumulates power (energy) or current (Coulomb counter).
>=20
> PAC1711 and PAC1811 measure up to 42V Full-Scale Range, respectively 9V f=
or
> PAC1721 and PAC1821.
>=20
> The accumulation-source property aims to specify what kind of hardware is
> intended to be used/available for the user. There are two main cases here:
> - the user wants to measure also the current/power consumed before the
> driver insertion (e.g. from the boot to user control) and if this is a
> runtime setting, the hardware accumulator will be reset by the default
> configuration the driver starts with.
> - the driver does not know what type of hardware it's dealing with. In
> case the part is monitoring the charge/discharge current it does not
> make sense in user-space to change the accumulator to calculate energy.
> Same if the hardware is intended to calculate energy it does not make
> sense in user-space to change to Coulomb counter. Changing the setting
> from one mode to another will reset the hardware accumulator inside the
> chip.
>=20
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-pac1711-v5=
-0-71c20101a52e@microchip.com?part=3D4

