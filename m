Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831211;
	b=0nwlPfQNcRoA2t5GkODd9KH0/XBwgQh20g5jM+dnaCHfpOc1IYuzwUxfWbXzFr7RH8Xe
	 Bl+N1YONFASR5GkZUhHWILPrq0vHTXopw8NQa0uxB9GpmorYdZ5PJjjYmzoT6dSX7V6s0
	 Vj1ju/tU48KGOboJCN8FoKzBEI/LfxSx3uV9W19HtFNaSY2/vMYNAEl6jRWK9HZuhT2Py
	 O9WfeDaM8WTG6Q+S4DmxAovO6UaK0LPsQJpWuXA0NDWi2O+0opmAwn9tUmKZ993w7xQ3v
	 //n9KUFXNzdG9S9sAZuaXZ+ydWkU8K1MLee4ZpGooYbyrV2NEewg7QYMDUANpzbKqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831211;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1XajfE7+A+xfjngo4fAIdFfWgJtd/bx3PyOxyNhfQBA=;
	b=tOPcSuHapOxe9MazFdx2D8vjYMjM8E8hQC6ceiI1O4xKO/DfDgr1Y/kMHUe03u+VO/dM
	 enU24uR2TcEXVWVFBtuupcxy/E6ZaOEwepWTRJhJxNzKlsgwyd/jNjdFzo7/uFW3gVkh1
	 srrd0bLKZpCKg2Iw43UH6KXFksDQl0Vex+SWSUVEpdrRiZX5bgGlljZHeaH1xCsgUChsX
	 Nwj/iob1EXBBxpklzICbwOaPwzy/yi1i4bqjNY0Ys8+VWspblgmluWakKG50tvgyU0JXo
	 /Pffx82L0ENpYeYjKZJ0LiiQKNbtne3a6ZENmaeO+936rv/v2uf8exZ+2+BRg/HgTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CoigTeYe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52224606A31C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CoigTeYe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5BA1F000C4;
	Mon, 16 Nov 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831211;
	bh=1XajfE7+A+xfjngo4fAIdFfWgJtd/bx3PyOxyNhfQBA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CoigTeYeJbb7E+PyYWP8r45s010hFISF/3SUrXJqJQf1r+didZGlldZ+7YPCNKMNp
	 f/oPDGBJmrYRM1uowmPKsH2gbTNeNrFSVtU7g2Ah4enr6LKGB4tWtop2SMgIJchelX
	 Fiqx9uDpHDh0LJH03I2TNPi6h5ZJqtngZNGRtftbu45gkx3R27hT5e03D+M4siLjUa
	 gRBtrnnPPdqeV5eLYOwUgw9Et1tjCmQBgjwuPtz1kX0yVAU7WFlYG1P1E72+2Yba0g
	 7SYrhiygTlBfNSYxZ5hDFmMQIKgxxhw+sMsocjQH18X2+74gnUSmI/r/GQVn2EVWNv
	 DOCfPsL9d0h6A==
Message-ID: <sashiko-outbox-216996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] misc: amd-sbi: add DIMM thermal sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261116120228.865196-4-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
 <20261116120228.865196-4-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:13:29 +0000
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
> Report the TS0 and TS1 thermal sensors of up to 16 DIMMs as 32 hwmon
> temperature channels using SB-RMI mailbox command 0x48 with the Mode 1
> DIMM_ADDRESS encoding:
>=20
>   bit[7]   1 (Mode 1)
>   bit[6]   sensor select (0 =3D TS0, 1 =3D TS1)
>   bit[5]   reserved
>   bit[4]   DIMM slot
>   bit[3:0] memory channel
>=20
> Board DIMM n is reported on temp(n+1) (TS0) and temp(n+17) (TS1), where
> n =3D memory channel * DIMMs-per-channel + slot. With one DIMM per channel
> n is the memory channel; with two, the slots interleave (0x80, 0x90,
> [ ... ]
> complement value in 0.25 degC steps and is reported in millidegrees
> Celsius.
>=20
> Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120228.8651=
96-1-Akshay.Gupta@amd.com?part=3D3

