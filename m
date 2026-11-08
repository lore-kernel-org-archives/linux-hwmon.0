Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131013;
	b=SjTgkZwwyyOg4qY5zChgAjou+8UnI6477gEc+Z4HpdvBvxDLUCx1gTTOs+1a80tT7VW4
	 iHgaRtv4HHeVd6/wMz6Yn3aYHuOltxIot5JLYAw7iyNyIpRoo/rZnT2ZffkeZoXxfeElr
	 sjam/z6Tms1PstGeuT/y5smxtVTLVQabjFA9w5Q7Y+2fda6iDL4C5f0NImbsdOd3m6WlD
	 GaSQe9NhEcmjlKCIJCxncOXgVoPJGL58WlsNmKAFYLNGwwq+JMyqczX7zKaDfFlRh3rnG
	 IekHUmC1ADvJzpcSCvgwOpLFNC6xl9/x2vze0I22nl2eiqrYM0EoPU095FxmPOaFcfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131013;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5ehhSx26kuX8KZdqD1AtnKrfAxmSRDxGoVOrkylGR9g=;
	b=nIGzTqd+19jnkjVYesbvIpw1gQNYnn5E2eLqMUTGKp6MbkH8gOALVxT5mG5ZJc9CIanT
	 3jihjFYDD7Y5rQIoY3vxP64QOT4hOq1YaArb43tcfIfcrYlsavM1W3fGMuyVUVXnvzxzp
	 smKnojXv44UwBIKj47kHD3/bMob6sBpJ7aA42qxn746kWF9NggMs+71LtGM9x3Bt53IAW
	 HQXqmwZz1GKq1nijmV8FJ1p/oUEz8RFl7E/tH/v9n0b5PRsBqBzueiGfl3SXGRVRpZxJj
	 v9TpmRvl6g6XR/as8goc8i6yqQXxZdCsda0XaBN4pxsVKzQLByo7YfrB6Ve7HcJtp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DlcBs/R6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA3606A322;
	Sun,  8 Nov 2026 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlcBs/R6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF071F008A5;
	Sun,  8 Nov 2026 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794131012;
	bh=5ehhSx26kuX8KZdqD1AtnKrfAxmSRDxGoVOrkylGR9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DlcBs/R6Xq4H+Yu5xcLvh7pfDFn/33H5JQMC1iU7YzyXI0sEnZ5QxShvEn0uUiiOh
	 9Us0C8qk8/QJ21sya6FQCsJz08QxEIPmPWJGqXmY870D6llmzMQijmJWPDU6NWYMip
	 lFiQznYplgzh8t3wjE3QUiJVnOi+EBGOPN5nqzxo/fHoD1JvnnTOVwoc7n2lPQ4p74
	 V/rraNwgbRYw9016DhJhEL06O9vCWHbKsxAkV4C0bpA4Nj73cuqz2vnArtkycbwUq1
	 nalTZ6jGxhr5UcfJ9g4ZKrVMQRuJmLAPkS3Mo5er5kEFQyjepjEsNS6nBN7bah5u7s
	 +Hb1y1zeEqakg==
Message-ID: <sashiko-outbox-203664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] regulator: sy7636a: bind to the I2C device
 directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261108093602.329554-4-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 09:43:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Bind the regulator to the chip directly, as the TPS65185 and FP9931
> drivers do, and have it create an auxiliary device for the hwmon driver,
> instead of simple-mfd-i2c creating a cell for each. Drop the MFD glue
> and header. It now probes before the GPIOs may be ready, so report the
> power good GPIO with dev_err_probe(). The hwmon driver then only
> accesses the chip after vin-supply is enabled.
>=20
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108093602.3295=
54-1-pmazzini@gmail.com?part=3D3

