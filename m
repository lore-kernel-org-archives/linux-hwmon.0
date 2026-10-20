Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485625;
	b=oqlYomU7sRHnb34ljVGDgQrPBQx+eIohDv3DnYTwP3z6lW3EpupQjaEU8QcqCR6QgIbF
	 HYXibvEqNhDTaDIaRT6Cxlkl1wvEK2HZhPIGtlED/vh2fpST+rnvjrVnBVE1MxV7CEWqk
	 qDAolCTgVNcvmtyhiAR6TCilGFY9q6321jMmGvm9PDmSCrWPfF1prQEEqABLcuehWOrsM
	 ndqCtX94ToPXEkMMQuQEtT29G7moHzMHge4a8Yl6c1RGFNA6uaofGCOoViQVaBzZAd4WT
	 2ikKP40szIZSgV6z9SwsTAxhPVO5ioXY8CDN3KJciqgR8sJ7MjYMjbxTM7/12/J5lWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485625;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hiW1FKH0id875geAezjD5qPEdfLGG3+PMbJTW3X4HIk=;
	b=ZRiUg4xXVDDNvV7LxXSZTwVXgVSzAy/KIhlzI4gPCsiC1HN1MRX7bErcajRCBcq1vgMy
	 HTJ0Goluqbz9EbqG7gqhdw1od+GoxZtrutjOxhl+uNIaEybyBccWNMIDr7931pfNNMydw
	 6d+iHNnu5gT0+COlxHgJ5phm8HyKRz/853vEgPhrQh139X6lHSXRSHWpRSee+PFWZQHYo
	 qx1NMqk+EQxp2tICXI8Txlx1B3QXKcYas+aKwExDoYjBliT2Fp6+pa0XRK/5D/26R97Ke
	 yfv7J3WACedC67J5V0Nl8RJNJMlLxIJsbGLmd3589NTXysVHeWT87YWaBbxySc1Kllg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlKjUJnv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233E606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlKjUJnv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F041F000C4;
	Tue, 20 Oct 2026 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485625;
	bh=hiW1FKH0id875geAezjD5qPEdfLGG3+PMbJTW3X4HIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HlKjUJnvucsgNZcRl/S5TI5bADsmt+l3OoqWpgpX9WJcZvj1w47IUe72DitAn3oE1
	 IEXcmF9LO/j5df9MJGSDIHTTO/N7vrlP0g+pz3NxXh+zEmRUnQGKxsKNAWihMxCJR+
	 Ssi6NHsMFiP+ygLLv18trTRQm/Kp+C7WliHz0BauFOt1BFvlAOiF1i9YcjXsI3ijWL
	 BJPLc9ELhrw4A4TnyP3DIvS9Ao9u2j940vEqD7Eg1r3dpgecBPGK8h9pcwLJiZCmTj
	 5Y1NcpQFzfELfMvZEvA1PdzF74fnvw+qXw9d/UnwVuOseCNIXYTJKGnEryIxClXnjg
	 /ASde/Qoi9ufA==
Message-ID: <sashiko-outbox-178597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:40:24 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v2-0-3396c3a08251@nexthop.ai?part=3D2

