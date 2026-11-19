Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107643;
	b=E32dd1+vh7PiZ0m43uGZj9cQv505Xbu6O4dyP23YCqtkdVzfF4rDNfQzY0EgAfhTawHe
	 Q2G6D03zvcpLMlRLqNhbwwAOWKPPTP0dIqSErjLzopu+QGq12cqh0RZqELcvTgtlIIHKJ
	 FU9glOZGgYdmH5wwEhgcLdyRw4bjjkQ/gjkJgciysSbPdy3c25n7QwYEQWGy9O86a9qZ3
	 F7upX+YVHG8mtX314lW1rnaR8AzIQ7FLRsgNfZKV14uWPFKKGqJ8sHGLUVcotEvy+gcFm
	 jLgfvZWTZJ1MDLP5SVIo8/Rjb5oezrjTxSUHoQ1xf9wgFaAykXk9rjTE5lRP7hdnyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107643;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=em5c2RouMdJJdZn87M+wStT9NMk8Wtxv1uJhz1oWXqU=;
	b=jKqV3Mg/zLgWKJPLjOKr9HLQ//Ccq7vZcMpO/ruUjiMO32F0++H0PRVSCcoMKeVg3P2Z
	 0nMgqfPUvq27L2RCMaEz5TenlD4YI5auCe6kVuUqmxEPzZGQ6FwXmYCOZi2+IC+lSMwIm
	 x/3EqSsNU4dcDCOtWSHiQV0EZhSA5N7k7hyvlKPIp5KdO+BhJoMznzETWpaaY1EOezpmP
	 23FoqdaF5tgl1QA1kj9a+EW6BmbgXWKEA3nyfKoApYwJjQ4lfhyQSHoCs6HX0y+h5qAGx
	 j2j3T41Si9pAJFsEAK73OYrI6Ud7Tyv+vvNgv6RGOckdyTEJu2T/vKi7M8wXYAkbTMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGIu6xHm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA1606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGIu6xHm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537391F000C4;
	Thu, 19 Nov 2026 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107643;
	bh=em5c2RouMdJJdZn87M+wStT9NMk8Wtxv1uJhz1oWXqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGIu6xHmvAbMKy1g6uFtUfL7pLOU2nmf/gu2BV3kKSPNdUpxYGtfqKtXtd3yicosg
	 niw0ncEM0M1Z1b2G5VFtxN3eCPEsZjD6Rj5HXv/g7aNBmdfg+yWJGsMxIYxX68Hrql
	 mkP4hdeX1LOLizjfCV0TiRm+/EjHkZ4/r099wO2lGmKTCBDFq7WqH7wvGxdU3GXRn0
	 GIttV8A1WoqxfwTU2ELmIq5sCHL/IkN3VqtrXO0++kKsTVB/YOdR952+HcMIXt4JcZ
	 4cNBlBo5vNNcCI4K+V8LkeLQbPEpUhMWe3ppfIDFSdneVrhxDeixCJM6dzpWMjbhKw
	 +rmm9lyfXD+iA==
Message-ID: <sashiko-outbox-223610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119164708.1280862-2-benedikt.niedermayr@siemens.com>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
 <20261119164708.1280862-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:00:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a hardware monitoring driver for the embedded controller on
> Siemens SIMATIC IPC BX-54A systems.
>=20
> The driver binds to ACPI devices with HID prefix "110A" which is
> currently a registered PCI ID for Siemens [1].
>=20
> Looking at Dell, HP, Lenovo and ASUS this seems to be a common pattern
> where vendors define custom ACPI tables for platform-specific features
> that are not covered by standard ACPI tables (used by the ACPI EC
> driver at drivers/acpi/ec.c).
>=20
> [1] https://admin.pci-ids.ucw.cz/read/PC/110a
>=20
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119164708.1280=
862-1-benedikt.niedermayr@siemens.com?part=3D1

