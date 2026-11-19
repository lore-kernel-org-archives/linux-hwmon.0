Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119118;
	b=WFu16jt8ca243ecgjYYCJDQxgHQso+7Lo0AdNyRkmzBz7iojNKrasoY9w6l499/E868x
	 8awG9PBIoLn71KwIfSV9N7dBoaT4uycEWiXwku7ThlwBTR9xJqSd1kG+iWNnaeAuQqjsL
	 Y05DisKlFExx99i6fa/I943IrG30EqXdvwkiclAagF6rFqhq4w/BgHlZEMV3KpTzdOx0J
	 FpmI/JbjvbkH7v+djayHCgxRnIPe13WdSu8t6NEWVAoGxIGEk4IcwPKXEtlH1WXjA4UG4
	 iFlcULExUO9NNXev9s+GPWO0S8PlmpG4a1x5eUfgl+HRTInuXL2oZ7W/5JuNoj7Rxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119118;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qzGYurCs0bEp/Hmvgf/46DDScKQa2ArE0czTe0Grnuo=;
	b=v/sXN+2rOLdHq7ye1x2LMd0m9aXFzYECOBmI0YHXsLKcJu0RAM/rClBEN8s0ac7RpTga
	 9D3anxdJMkWM3KtMnxAq6WwyBuOEpY6zvnk/BhM4o7jv5OvOvvdpIgZ7xJZolo4oW54Ti
	 1A0ZhQprB3kFnaiuEcV45hmLn0TdudrrpIpo2368f2hLhar8h5xTJGO0MNSD+OSeVC3RG
	 wWsHmxGqDkeVq1Vr4nxDtbt9AQ0hj2C43c0sQSMu1aY8OqImSLeXgVxz9Q1c0fFXR5WMF
	 DRPFwMSkqPuB/d/nL5PNUEt2g9/e6Ibjwzd9qMUU+vDWaa8ZnBWhSN8vj+iPEDHiGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsXW7hZA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95F606A33F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 20:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsXW7hZA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FAF1F000C6;
	Thu, 19 Nov 2026 20:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118643;
	bh=qzGYurCs0bEp/Hmvgf/46DDScKQa2ArE0czTe0Grnuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsXW7hZA2YV6r6RDpaEu9P6/GPN/wrQJEMC3skqtVYDqja9JB8OqECZvQVEDgYIvV
	 tHfZ5QEBsaeWGrThGI6KK3Itm5ERr1qFkDNrm5Ii8a/eCxS1qbaDYGUVl+7aKtnu7q
	 /Q589mhWYiQaM+Vlcg4dBjdX68r/OMMXLyFUHB+yxoVQycGAK2LfAI2jFFSsSCC1oW
	 5zhpdD5sjq3YmGaKdh4rxJQUU0bl0mn5//hfpIl93odVlF9fTf58lIcXnp8fEeDnZW
	 55bdYYuL9Vr2UlJPpWHeeW8fFbZ5urdgIqVxu+Dl+oWHIjkGcTJH4/gWoB/D1xtp98
	 t3z7qh80MXy5w==
Message-ID: <sashiko-outbox-224005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: add Raspberry Pi PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v4-1-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
 <20261119-hwmon-da9091-v4-1-0d6e345c3666@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 20:04:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a hwmon driver for the PMIC found on the Raspberry Pi 5.
> The PMIC exposes voltages, currents and temperatures exclusively
> through the VideoCore firmware mailbox interface (property
> 0x0003009f).
>=20
> Requires a sufficiently recent Raspberry Pi firmware that
> implements the structured PMIC ADC property.
>=20
> The driver:
> - is instantiated at runtime by the raspberrypi-firmware driver
>   (same pattern as the Pi 5 RTC driver)
> - reads all channels in a single batch mailbox call
> - uses a short refresh-on-read cache
> - exposes the sensors via the standard hwmon sysfs interface
>=20
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v4-0-0d6e345c3666@gmail.com?part=3D1

