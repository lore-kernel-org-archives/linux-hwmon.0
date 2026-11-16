Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830815;
	b=tvtRwaPnx4GIHNbW1JkhxYz2eQpcZAeLRZ46KOnxWXVybQRmFGDZhCeFwmM6Qp0PSoIQ
	 UpbSmRUwsGxfKOnPziAZjq0Sutt6nx4WXpPenJ4FV5J/wxelu2w9QKURz9eJRKYY5euaI
	 bKsUfAdVALJepUKc+0JrYA+8qaujFV9eaXvQYy6S5nU01gvskA5CyMj4agScAOxNGDo5O
	 DyZEUYbOEKV57ShIYUOisEublRANU6zOnG930yKzmYDo91/SlMtixyJCwucrL9KrvhCmD
	 smizkb/WO2BO3BDP0VCbu8yeOzOTq1gZKy+O5pjNBzsWKWjuC9IvNkCpbf86uMIQbew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P9KmFTHqYexUk2bZI2fcf0Z2L6Sfjnc+B9kGzvpVC9M=;
	b=rAM/JGP0pY/rxJZWWsf9EQyMbrfdpKNIQek+5Bbh3nPI/PIe94h5UhDiOGjnSh9ISAY0
	 XKwEup55nt0l7wurDyXe3K7uoFX62KBsEmblOSySDyK7yBkYYNCERSqGC0fjzPqhz0hpm
	 ugVKS8LucMlY0RXQ9iRwAD4SGtIIc1wsLQ45RF0vQI1qOu3VhpLr9C76P7sg9Fy8KJvag
	 iWy5bxvlsJ8zVu0gRF3UfJiJ1p+ByLiQa1qWBtcgGisrxrIhbQnpz5+jxfv2Xop8V/eIy
	 IUMpZUyegN5L10O53QwtfrWjshKC8ckBfikIVm/zjAvMa20JNPrZ11/VfkvZYM1puYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpBri42c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7A606A329
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpBri42c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D2E1F000C5;
	Mon, 16 Nov 2026 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830815;
	bh=P9KmFTHqYexUk2bZI2fcf0Z2L6Sfjnc+B9kGzvpVC9M=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PpBri42c3yAGD5eTcJJG9q4pdDzQ+5nX7MCGAmDhI3wfQ5OaLp2AxoxuAILxsPqkz
	 aC6DDkBnAbJvuHTsht/zVbetVvJyzXuEU27N66YBxGLpqmjexnCIgEZruW+HLPf0SC
	 ihag4tDEgirAqm8ZqQPFDRT6+9f+IBnY61iLE1biEe8S2QE0kKGj8P4tkpkcjQ0LyU
	 5Wh1OPiQ19OUxgd/reGwNB/IsyOJeHaZQvg7RXRfPOCvwsgwybFma3Byoqp3Y0OSeU
	 epN49YfLoIR757EgeXLPUjYGKAiygM7Zi3tFa4H3kME2fJnbdnwAv1AEjkxgD/lN4e
	 9of7D2q6y3svQ==
Message-ID: <sashiko-outbox-216982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: Document the lenovo-shm-sensors driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261116120411.994284-3-lijq9@lenovo.com>
References: <20261116120411.994284-1-lijq9@lenovo.com>
 <20261116120411.994284-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:06:54 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Describe the Lenovo EC shared-memory window driver: which systems carry
> it, how the window is located through the SHAW registers, which
> attributes are exposed and in what units, and why the driver refuses to
> bind when the ACPI sensor interface is enabled.
>=20
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120411.9942=
84-2-lijq9@lenovo.com?part=3D2

