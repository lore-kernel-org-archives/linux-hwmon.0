Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578554;
	b=UgXrUQGgblXgztZ+BXxXb0ONua2f/Efrigfa9Vltw0Lp1CSy9aTwFwtdbM1x8LFpje8x
	 B3cA8MTz/Sg/iAfMGgBLycc+QjpBWXWD2pFT7UrfTLMMW+DSkJSn+SfpfIZ3eRvbs7Ib+
	 JDJ9H1P4cH+5kAOIf0jwTTQUjfjgyl74MxLEeM/QFVBhIrh2cR0DHdWDtcUxaOmdWP53a
	 zctganxVh1I8iJtiKkyhdncZbdskpPYOODSf+YT/KrY3VGFE5d1Y3YC8psmYVsIRZB/Zo
	 Tsjf/1FsaMsCcmz75yL9JmHpL4yMtAeDbP0GLz3phKu8+dVq4Ms9mLN/SO3s3GMJOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wI38djHFER4sirgSi/9RzocZ3BRmNKkbanvqgWhDxHk=;
	b=NI5qPwUb/YqvHoVpe6z7yj7v2aYXH9dzWn6MtFDmfmqvYeVGtGSppnOMBVDGcyMhdM8n
	 xsa28MiQxURxRKsn8pOJr7DB57QnsswTFkYfAkQNsNBxR0oD7BATt8XZYLq7o0e7qbFFs
	 fwqcL4xiVGpN1JkOCYCtKBCQadtjSls0GYho7kFicxW6lpXRPKt5qdf6D3cUlMTxFPMDn
	 lEuqBJNftjrbghgFlcTbUubRVoklAeUQKVRBCnPPj+gVt2RcqETyd36zp/HEXgg+73MFV
	 JI8HuPxWJHspl6b36WzGNNTbmc9LVsuVBep49qswAWh44HE9qHcN4bZL4eUFJrjVx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID0orXuu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F87606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID0orXuu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860C51F000C1;
	Mon,  2 Nov 2026 00:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793578553;
	bh=wI38djHFER4sirgSi/9RzocZ3BRmNKkbanvqgWhDxHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ID0orXuumk0NN0YQ8gIHUdhv9s/jZejtwVrX6w5ZaCbfjuyTP8GFtJ7cuk6XBTsyO
	 47AYgTJBd0bl7c2UWGBdiHSz9NK4lQ8+Tbr8Z+7+arfO34h5sWKlgNbq/yEA5PweiP
	 JPdwm3W2Xsn0Xfk5MCGdrThZFmBWrUijEsrLDU8MydEBVw+wBx8tm5NefZRzzHe3pR
	 TVwA7VlymnCz2l31yALhO+iI+rML2YpGJMynf1DhGhP/oUYHcaqbEh9yU1q64QKL7D
	 vvKyAF7SadsAbu3hrvGOVJPQA1wUsU+NKYDDhWsTS2eEdjIopFSoe0U3uXPe5CWB4g
	 10gvwos622u8w==
Message-ID: <sashiko-outbox-192791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (it87) Add support for IT8607E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ismael Ojeda Perez" <iojedaperez@proton.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <179357826986.881874.2370184949108951928@proton.me>
References: <179357826986.881874.2370184949108951928@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 00:15:53 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The IT8607E is the Super I/O of the Intel NUC6i3SYB and, according to
> Intel's product specification, the NUC6i5SYB (BIOS SYSKLi35.86A). Its
> environment controller is hidden from ACPI (HHMD._STA returns 0), so the
> chip is only reachable through the LPC configuration ports, and the ACPI
> resource check must be bypassed with ignore_resource_conflict=3D1.
>=20
> No datasheet is available. The register layout was compared against the
> IT8603E, and the BIOS fan setup (IT8607PeiInit and FanPei PEI modules of
> SYSKLi35.86A.0071) was disassembled to confirm it programs the same
> "newer autopwm" registers (0x68-0x6d for pwm2). Features are therefore
> copied from the IT8603E.
>=20
> Tested on a NUC6i3SYB (BIOS SYSKLi35.86A.0042, chip ID 0x8607, rev 2):
> temperatures agree with coretemp, +3.3V reads 3.31 V, the 3VSB and VBAT
> inputs read plausible values, fan2 tach and pwm2 respond to the
> automatic-curve registers (start 74 C, full speed 92 C, as programmed by
> the BIOS) and to manual mode, and the original values are restored.
>=20
> The tachometer was not compared with an external tachometer and the
> voltage scaling was not compared with a multimeter; the values above are
> only cross-checked against coretemp and the expected rail voltages.
>=20
> Signed-off-by: Ismael Ojeda Perez <iojedaperez@proton.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179357826986.881874=
.2370184949108951928@proton.me?part=3D1

