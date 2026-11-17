Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939491;
	b=xT/nXMpWGMU8kjt/hRZidF9nFVUxL9c9O+YKDz3FYUw99zhSTE0q6wdQIplGmSZD59gp
	 OAgBjuNQxSEXTaNrWEmUBzUCaQROdDakysnge2HuSIXY5yD0D/7oz+N/ikNWNg2g4i8O+
	 Htt8uca+3rC/U2BG1Ojkq0k9mhHvQ4j2SOKIpdqkSuXohoX0QV5sneSAnR3c8R48UKCwl
	 TV2TNIibnQEJtnvO7KUrXAHk7ybod9CQ+Qc4RboiOuYJSUe7w20MEzFuKWhr6YlA180PQ
	 u+pARauO8pfGg6k/it5M3CwuwURo2Npvqx/92I1fqmcVep2Q+wsiXzTfJuJfV+4xRww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wLImR2XvAHxvUoX1O3pjt64H/bpUJjhoJnQ/bgE66us=;
	b=Wfno1Cb06amsiOY/s4ttDI8yDSKsUkw8mmASe0Av+ufrQZNLFFnSu3vXHxQsh2sJ+eNf
	 V+SaTT5g2SkA4dbSPkloVmuY1DQzeaJSjA+Kc3dZu72w1Mz0CS+UCYdLHueKTAOklt9cO
	 sJdlxf7EsA+I7kGPPWn1N6x2kEbsKEZBPmVL2hHpG+fCp8LEsjNtRtmjfHR4H0lVKKE17
	 QbJG7P4B6TUZB4xyAaIivYitV8yi/+w4aHmwC6lRhyTRKiY+Dzk3MZWehIKbcoWKigB2Q
	 i/+RDIG/qmmSUQM3FUZ0X+i5uow6zzGd5c1+2rV7jlPPU+PY73jwf7DtD/0Umsqa9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEuJ6HmE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1A8606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEuJ6HmE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B741F000C5;
	Tue, 17 Nov 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939491;
	bh=wLImR2XvAHxvUoX1O3pjt64H/bpUJjhoJnQ/bgE66us=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nEuJ6HmEGMOcjjTk+JnqwWonCEMR//qo+G788p7Tw5vwGCeDI1ad77rpr5noBh/en
	 MYZeI4gHWEVgIhIKeeox9O9hhGXSFENLx5eLd+Xzvk+5/8J/lzW6/vhu3+3+9gs6UY
	 Cjn/N07PJAe7SCAFu8dU5tK130cBWfwe3aCBElQGoZpoal1N7VtG5AWOANbpEFhGe4
	 iSO7F/u7kc//orWRgf2LLs59bEnH5xEX1eoKn2FUrJtch/AJWKaFGMfk9vU73eqJeY
	 fsTPM2epSG04IsYWPx15txPuVfs5pJlZ+W7ZbPoUSMCEsw7UfDEAPC7iPRtRWYpU3f
	 dRKGjOLeLfyXQ==
Message-ID: <sashiko-outbox-219328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] alpha: marvel: notify environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-4-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-4-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:18:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>=20
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D4

