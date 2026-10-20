Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518293;
	b=X9qH1EBIV68vme1dIetR7Nq8Lc6MutnGbkcJtzd4Yc+si/o1iNw8McnlNzmJbwzU0DXt
	 4AMM0dOfVoXrwYMGGZrmmFkj8FW4aTg73JLfggIdkkWF3sCLnqMV1QPy10afu+UGbcbHA
	 DxvlXjNSL3sJh+vlV3JEGPYAzRbRPrvND9BdTXOTb/hegaysjjJ71QuBwnagzcL9qLoo8
	 eIY5BiB15bdZ/3K3gnWjuvnuF71gFoKZkznkAu8dd2t4n4PS2RXptHsaJoLOrQ5uLyQLH
	 JdwWvytuo0GjOxfnnGjE3RkD0gPHPsgtbcrTXhMCO/1G33pygMcz90C9Skyfp4HO0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q0I+uxpZTnCULckeRrTmiVLwWKhkiAnFSdKp6u7Pi8g=;
	b=V43xVWTZXk7hJapjXCme0x2bK/B0OmiayJD4FGGD31Qm3u4cjrzh/n/xHKJyyl57Tok+
	 jwDiR879JAuuzw4glikjdCZY69Ba2cI72kxG7Wfx8HuRb5gQ4GiOh4fpZ2hw9mcrcTJft
	 ogLZ0A+qZq3Hi7H7oL5lqcAX7MgGrirU4CZfZqOD0Oa9lOm2QK6pEFjr5wyrzDsCrdRHK
	 y0067X7flCX391GGaYmK1GtCWp5uwNbRUso04B7c6cNhG4W3gMeyJ0Ru/NezCVqGo90RC
	 5H+7tC6+ZhOdcWyQtQxLIcyddShIQMTl/HP1gD8CtDVTI3onjquZ0tKoN9QKpa2dgHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax4nMmMT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649A606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax4nMmMT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07E91F000C9;
	Tue, 20 Oct 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792518293;
	bh=q0I+uxpZTnCULckeRrTmiVLwWKhkiAnFSdKp6u7Pi8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ax4nMmMTeUCvishhrMnfGSoUvSIG25nLWZm0qIl2dD1/FqXXGq12nrNvO4BTZq1UV
	 TMWslzbXN2JX6soC3cxCqM7FiJ4TEQ+xIdIcjnOZW/YePDafdm9k4WWrv+q4EI+aLJ
	 6BmULMpYD1ZFXc8RDUXoWzl6rwZSH/DflzEUxsdr5QBlVexfJj0z99na4hwxcYdtu6
	 hj2ERLRESGlcbPFBfUNx5y0atmpz8x8YIIS4j3DOJnLjtvM3hSchF89Rcr7IY1i5X2
	 41EjlA/l9qXFXPBgFXQwZg/fpGILUn6Vz5XqMXaOyqQ8x8sXWi/3xQ5nCLlRLpZjSn
	 +lrImVrlAgMgQ==
Message-ID: <sashiko-outbox-179442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:44:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Ximing Zhang <xzhangjr@gmail.com>
>=20
> coretemp_add_core() only logs create_core_data() failures, but
> coretemp_cpu_online() still records the CPU in pdata->cpumask. When an
> SMT sibling is processed later, the mask makes the driver skip sensor
> creation. The core interface then remains absent until all siblings are
> cycled or the module is reloaded.
>=20
> Package sensor creation is similarly attempted only when the hwmon
> device is first registered. A failure leaves the package interface
> absent for the lifetime of that device.
>=20
> Retry missing package and core sensors whenever an eligible CPU comes
> online. Determine whether a core sensor exists from its temperature data
> instead of the CPU mask, which continues to track CPUs available for MSR
> [ ... ]
> patched driver retried and exposed all five readable sensors. SMT sibling
> hotplug and 20 module unload/load cycles also retained the expected
> sensors.
>=20
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-coretemp-r=
etry-sensor-creation-v1-1-7dd4851a34dc@gmail.com?part=3D1

