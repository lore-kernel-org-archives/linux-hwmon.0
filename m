Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730066;
	b=j00TmYPNEgujdPUZeqEXPQmDVKkdYW36TNs1dURvPnxxBL9poQlEMZYAgC1vupNAmvso
	 4TdwnuAmBsc0Ikm0IF0kON1bSwn3MqvoZ459jJ9pjXBTWkOnpdqPJw3Uh31Bu/5sE2OuV
	 KplG3Fn6PCR/a4lrBeRGrQgBrMK8utGIw711nCRMN/ZK6xcyvN0mzAsiBaxDp7xDgTBC7
	 N1h3rz+wQDi2h+SR+UeAhDc00kmZKgrig8tdjhYTg33HaAkLaMxDuJCLbbgJb6R8JwNRM
	 G0T7DOPBH2Sr0YJ2eclb4Z/FvQcICbFfuvd6QA3WqsoPj7g234XN+MJwaaW74KWzFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730066;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=51E1DywHuqLSWeHiaWi4v1KEepXlEkZd2BgltXsjrBQ=;
	b=UnPY2wvVQiOqL0pc1/PxOvCA55Es06Pw/v+jpb2XBcWSxf8UAUu7SYuyfaTTSlQ27CmD
	 mQ6jvVlFWOrKiqmOi+3TMbw1I5fQwWNoO1QmPJpIawis6RTGqW6d714JENkovv1RbidmP
	 RBEBH3aUWQE28sRd6927FmrjRk/I18SS+Ru829fbMsfup1yqeApVBjEfBrUSc/fPqXLnV
	 DQLyR71m+Wg1cKh/Tnnt+e31odHIVTSMwlpTJ0l9wl+NUqhJw+Ma/l7KJKAiv7aIoljpq
	 H3av8lt96oyFc2j2fWxyiW/gusA1W3/2LMz3BtSVMkZxUK9OkE2mkt2rTTqo3kjBdcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUmeAZvb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF8606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUmeAZvb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E791F000C5;
	Sun, 15 Nov 2026 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730066;
	bh=51E1DywHuqLSWeHiaWi4v1KEepXlEkZd2BgltXsjrBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eUmeAZvbdojPyf8DtseUfIRRWiL94TQ5hYh/gFoaxAwyEnETOBZHu8XT8bR4t5ora
	 rPQ3g4hpd/y8Nn3v7eYXeCk7bWY9ljNL4Q8gFqe4omhQ+xkfL96zBFg2XzA7dXvnkx
	 r8SWSCH1CxC0MPdwe7miLHNqjrV6jXtuPt//2JN38aItNiqvRZda8woMBrQJBQQhyd
	 v3eYpAQj3i4IWZo8hNuZkOU4iu8H3fgyxgW6aB5/TXV8gtGJOl2hzYYAro8jgJsCI0
	 M1gLojKR2QTSf7x43ztE9dBo22aUzyGXrYHmrPTv+EfXcb+xwjCEcvufv5ga09CZkZ
	 iXRBRt3w8puFQ==
Message-ID: <sashiko-outbox-215284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (nct6775) Fix incorrect struct cast in beep
 callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziheng Wei" <zihengw03@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115080203.910033-2-zihengw03@163.com>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-2-zihengw03@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:07:45 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On big-endian architectures, writing the in[1-*]_beep, fan[1-*]_beep
> and temp[1-*]_beep sysfs attributes in the nct6775 hardware monitoring
> driver always changes channel 0 due to an incorrect struct downcast in
> the beep store callbacks.
>=20
> The driver defines these sysfs attributes using SENSOR_TEMPLATE(),
> which initializes them as struct sensor_device_attribute (where the
> index is a 32-bit int). However, the sysfs store callbacks
> nct6775_store_beep() and store_temp_beep() incorrectly downcast the
> attribute to a struct sensor_device_attribute_2 (where the index is
> an 8-bit u8).
>=20
> Because both structs start with struct device_attribute,
> container_of() resolves to the same base address. On big-endian
> architectures, reading the 8-bit index field from the memory layout
> of a 32-bit int fetches the most significant byte (which is 0),
> rather than the intended channel number.
>=20
> This type mismatch causes all beep writes to change the beep setting
> of channel 0, regardless of which channel the user targeted.
>=20
> Fix the type casts in the two store callbacks.
>=20
> Not runtime-tested: the only big-endian machine available to me (s390x
> under QEMU) cannot build the platform driver (no HAS_IOPORT).
>=20
> Fixes: 30846993047b ("hwmon: (nct6775) Add support for beep attributes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115080203.9100=
33-1-zihengw03@163.com?part=3D1

