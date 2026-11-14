Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678252;
	b=brt+FTtFHAoIAT5rymgEFUZRC6nAh3Jmq748DBPZ6zg7zASqDpTix8GuvK27GroGO9q4
	 nstVx/pVLj9QfSGQdGcfM6z5BjPFlXZq8wGP/oARlaXK6Nens9kfTKsSd04juEg49mEqr
	 wx96V1akYSg9tqOwMalYZPpoMqQybBBeO/IgiJnVHTN785BsJbomcmqmo42iFvOPfydXF
	 MLRcx1bDZXWq8qH4/TK8+wZ9QseOraAT+M9NItSPQErXim9inMvnydAHeIPS5+zU2FMDW
	 kRQ4ZJo0BFmVMfzUW9o8RBERbWN+pNgOQ7EoZuj1J1q17VUT9mbHny3lJghAVBoFWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678252;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TFHG8/dag25hgjymussGUmpLJUJA769I059LiiHAwkw=;
	b=4LYpN/HGGV/fvHB0osaQDjHbOTnlHd663gXIR6sur/aN6EpGbIFTGYfDDjejorMQL7HG
	 HKb6BXofbsb5nR5/4/8t/5NvDywGJO0I6kttg0dqfiBne7TGqPasatFNxkXLBJrFfOHSF
	 xSzYofFLGCE/1FvZDfUKDR0SgjLW0i/O9lnVKBfk/y8q+lqcPeIBc3A4n8dCFffOprXwq
	 YPuN71eZrOdNVeCkNloI1m5ZRVTAszlRCG2VOvpZ8Zc3H4mKl7W3K3WWM6qw1/aDNkrQQ
	 cp1KESOVECTQaoe2e9O+N26ZOd6UcohM8FcGwYQCHNM5Kg/LeXFQLg9zCoNKWuXyB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWMMDbfN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F0606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWMMDbfN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA77D1F000C4;
	Sat, 14 Nov 2026 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678251;
	bh=TFHG8/dag25hgjymussGUmpLJUJA769I059LiiHAwkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GWMMDbfNlBz/pRYhyfHXnUqRq1Efn/u+9t1mbA3rQrvueIhw/epm/ST04i5f7acr0
	 Sv05lba/zQJRuT3HbsToNmzEEiF/orML4MPWVVjWtWEVSrrIKWk1TaE3ah0/DKeB7Y
	 g3w6Qvx/Tu2qLZ1NsWdiVtoV+TV39eqI+BRtwExRVHrLuR2yTkECpa72AVI+0wMfmV
	 wtKm08rZlSC9MY5TXahlCveBBss8SW4ZfUYjy+89MxQv8CbkxyfEaP3DiKXx54KiJ4
	 CXVG2B0dNUyhaKiW3VyGPh5bordfc6DyA5tzUai227XKwS4cGGXFSjPUgUrK3PB8qO
	 m9rJOl7uTBNzA==
Message-ID: <sashiko-outbox-214851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] alpha: marvel: fix the environmental subpacket
 layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-2-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-2-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:44:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>=20
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>=20
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D2

