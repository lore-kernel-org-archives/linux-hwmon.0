Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047134;
	b=Ue2v7jDcvCFm3HMbje/srlcYXHzdmD/KiRajtur9Uy5rWY8YqsbikDAJJBbvist3RB6K
	 9hv74RJHKx6h9xKR1tjcuphdl+r3pe+uzMd+7F8Z/GzyS9H5M96SXKKzysQvJAQB6vQXQ
	 +0rc1z1SZ41dUH+EEmZYt0IPy4jCDrGUV31naJJPjcYe75TaKpyyenanhPCbVzZGy/7vp
	 QiMdEFxL8/2dC3JKrXJkF6QLC6Wp6N/ZZKlzbhIuGvji0G7ujJud3MM2tOWEGeO0B2vQU
	 +V3B8GLynr9ua2DKnCA623TisHAKZBsZs+nCk0NzW5/W562fD8POAe3MbwUCmMtDe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047134;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iltHhQCpzmRBZSSoZJhfonq3uT6f7hh0VqAGNZ7zbk4=;
	b=WZifXEMbHqoVAyGmDBHL3EvfIpFNENe32whCtiLIj5fY7ANrvp3zzRWzHKJ8E3ZZSL4q
	 b3e5743Zyr0ITfu7IpTlGEEsUoT6MLazk/vkW/3ZQ2nHXuvpHJGe4Qg9DU36MVhIru4Q9
	 Gy8z9U7JTBJ/6bN337hjGjBvCpXaFkeLYx3peDcOUhA+dlU/THfE8tL6/SuM4kOQwdrns
	 4P95CH7ZAa0Rw/nNZc0swwoEgpLMAuj1J5Vc7Gf2B2WHyi75XRmzvoWtIuaSVK5mQ37nx
	 xtGy9fjsG2x7P2EBi5LerrHnVHIBHS2+Gnnf0NvWoflT/GbzGJ/wtXYZOT7wDU8zmKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvlmAFrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C5606A32F
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvlmAFrG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228791F000C8;
	Thu, 19 Nov 2026 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047134;
	bh=iltHhQCpzmRBZSSoZJhfonq3uT6f7hh0VqAGNZ7zbk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DvlmAFrGQNQTpZZzrVV+RXay6rq7xgDEhDq+P8J9IBjuCldywq4EeP3dC60Om1JID
	 oa68wi4k2rsIL31XSjSMa5fz8dZuWVZGbLa93CXnl2Q8ykHyi2I9bYKj0gRW1d3MA5
	 QyrdJHA1wC46el+3BwODk3f6QpjKUPkQI+V25hY1thQ+Flw9ipr5u0f5IRLawxz3Zf
	 a3ufSHLfs9x2GGGKBYsaO8kdM8G9zxGwdUtYUq7HcikxC9U9pcs6pqsNZp6JEir+s2
	 IdpRWR6667DqmDR/N7TxtFHxhWQt1o2HKdxiNaP49TUQgFTszoF7r9DwGJu0YcOEGV
	 5p9/D8XuJy63Q==
Message-ID: <sashiko-outbox-222234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] alpha: marvel: fix the environmental subpacket
 layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-1-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-1-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:12:13 +0000
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
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D1

