Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831113;
	b=a58nWKgQI4mJnGhsn8nqLXecUsTWNbKnBtfPoYhx/6J67HHWuZpyzK4dS33O79aXaKhx
	 H93Ovay6W1v/ZNAAHGzNQmvh2/BpSsctYat75WHuryLYX5E1VFcAJ8rKTFSNBEFPeqcfm
	 Xv8L5LbETG9+YzQoeRWdRbmajVaD1Ue7IHF2nm1buzu3PJSU+Jb6olRzboF0EsR63XjoL
	 eyrkfc+JJXWCi96PLQYOiBdxGRQdzIyTve67qmb3RCh/HP6+A5XmGzio875WwdRhX3j+c
	 j0RXVExWiwQgVy+N/ytBGTh2W+R6450qEprPLdGkIz4OWqr9RXEk+pr5ozJ0xOyJU0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RqIBwmZil6UD7c6qVH6LPAYY2xjgLQJ1H5yP6Dr2i1Y=;
	b=VhX5oLIgC75bK21N0CmrZkI2h/nf1nL6BRCBkWjqD7WS5cWZR22MIPYid3mXcD5uKUKc
	 oG7YsfiOj/9iS2aBKUAvC8ybFOqFaHeWqOeflkBIVZ+Y7IDelt3CK9gJ77m84xFBCJzJW
	 w8K4+Z6/+QLhvLhi8FSHLVmQ20KVQVqIca9Zi/xIBA0dXqfMHID17OZtAo31uAWMGO73c
	 UDSPvcUri9Hze0FfphxfyAcFj49nRJv41F1ToioAlhVxf+fGRaVt3n/HqlvJU13mYGfch
	 3aTzLa8xB6RICJ8w/P1jf/mJYYQfYdxzou6OuqnhwaCRfs9Tx6I3jrBfiQ0GFESZtAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd6DEFAo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17998606A330
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd6DEFAo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A431F000C4;
	Mon, 16 Nov 2026 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831112;
	bh=RqIBwmZil6UD7c6qVH6LPAYY2xjgLQJ1H5yP6Dr2i1Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Rd6DEFAot0+aDpqIwVmqOGZtg6upaJFJqazUDyvpfawNVS7rWj/saR8nIjpcq5hVr
	 or1xdeMxrQOhaR5QIS1HcEe6O+P/8M/MlV16ARXe/cRWxGCGM6sr/u11ipr+9uWgxI
	 Hj7xZuAI/HVxymiURjmpA/MFROLpvzv05tGbRSgADERQnjBYtmlFit9loDFKghAkT7
	 Q3n2RI/27SLQScU2q+uqlLaQ/C8ggHnkzJTLOb4OMMRoDQnGm33V8egYZYs8TjUsvA
	 C5EWMWKisWLurc34aOsUFEtK7Cn9PdrLXdvIJZ/SDvXmy95MpsiJ1+ESci1RGgZjEI
	 paTuwk0bEMi/w==
Message-ID: <sashiko-outbox-216990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] dt-bindings: hwmon: add DIMM thermal sensor
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261116120228.865196-3-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
 <20261116120228.865196-3-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:11:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Prathima Lk <Prathima.Lk@amd.com>
>=20
> The SB-RMI mailbox also reports the temperature of the TS0/TS1 thermal
> sensors on each DIMM (command 0x48, Mode 1 DIMM_ADDRESS). Boards differ
> in how many DIMMs are fitted per memory channel and which sensors are
> populated, so describe both in the binding.
>=20
> Add two optional properties:
>=20
>  - amd,dpc: uint8, DIMMs per channel, 1 or 2 (default 1).
>=20
>  - amd,dimm-ids: uint8 array of 1 to 32 unique Mode 1 DIMM_ADDRESS
>    values, one per sensor to report. Encoding: bit[7]=3D1 (Mode 1),
>    bit[6] sensor (0=3DTS0, 1=3DTS1), bit[5] reserved, bit[4] DIMM slot,
>    bit[3:0] memory channel. When absent, the TS0 and TS1 sensors of
>    all 16 DIMMs are reported.
>=20
> The allowed amd,dimm-ids values depend on amd,dpc: with one DIMM per
> channel 0x80-0x8f and 0xc0-0xcf; with two, 0x80-0x87, 0x90-0x97,
> 0xc0-0xc7 and 0xd0-0xd7. This rejects the reserved bit, a slot bit
> without a second DIMM, and channels above 7 with two DIMMs per channel.
>=20
> Also mention the DIMM sensors in the title and description and extend
> the example.
>=20
> Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120228.8651=
96-1-Akshay.Gupta@amd.com?part=3D2

