Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416095;
	b=LdhwO4qNcjnH7yOMdPLXxYlNjRi/6262mRtmiy2ewlHQq/+O/Ez3IF8upYVAeErHkZYn
	 E3e+5S0u+d2PTYhDabIBh5tAtqGKUnjvTfJjLz+sNjRpkRbHK2MrWTi72kfssefn+/Lot
	 jZkG/rRFYkHplESRwFQnlOva+Ots5h2PaJ6fd/rU9+Ovp89evBadTfV0f2XpWEmX3NkiM
	 hvNi+L41nvYVeiNqNaB2tGayVccQYiX20MhkaTOlhroYOYg2DEkx5ySYHJ2qTbaZC7n0V
	 XEvEhue9GOfTkcj4+Jis9uFIXiUtyKT62t6C+Apb1JI40s8eElqUjEeSWOzGXjI4KFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aAGHPr1LreVbBDyQLHF3IE9p3mZBvm+26ttRUUJeNhg=;
	b=ZtQqkdcmhTrdMqx37r4dNLKxfTcN/yo9sL9lswh48o8SPLSQNxeHgGSyYwzQQqJMjNx2
	 1TOOxpgy7IoFzjzshcIepPdE5oHIs7rOfIZMsMGZyw1Wy1C9Q9NgpAyQa+Q6iOFnuaN/W
	 uR+a5fQxdVPt6DehBBgtkrT0N/wplJ9rnW+XyT1dY8rL4ioQjGK4mVziKt0Qm2gBj79IX
	 27xcP1kfxWFrAQBaPsgvhbLxd5+UxnZchZRuxRUdCccudvCRY6REBJpGwLrN2iJZ0MiWj
	 fDKUvP4FulQUTnvqOo1cpA3sfmFIeke8jd22Ow5i9xp5Jb4020q8pmHM0iiqUqoLhKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6n3K9g0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD15606A32A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6n3K9g0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6721F00A06;
	Wed, 11 Nov 2026 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416094;
	bh=aAGHPr1LreVbBDyQLHF3IE9p3mZBvm+26ttRUUJeNhg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=T6n3K9g0gYrjGzAgF4gr9CFq8cQGln9mu5NErWaW4wXyFhCVlk3t+uyyBdriBzXny
	 L2rvKSXvUS+NbBxqELmcTfHCNgBP/Q+wc3EmbZbm/s1eDJR3A7w1qbu9+GDp3F4I0c
	 ejGpi48aK6kdllSCRzJaFpt/PKecGGTVV6wpL5qWQcCpHaQVGOP2uwKvPa0EyY1Qh8
	 fPzp6FTtC+TJjoB8fcfAkcz2u78r7Nt4ic1fq7Crc70ObLahYfvsubNodyPDOhQrjC
	 36MyEbKM1CwQewDJVZKf5thgg4KZPpMvKb+oUuS7SabS14nGwIrcBkaggoQr/MeGFX
	 eo8A5IB70pz7w==
Message-ID: <sashiko-outbox-209339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261111161619.232141-4-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:54:54 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LAN969x provides a PWM fan output and tachometer input in a register
> block separate from the temperature sensor. Describe it as its own
> fan-controller node and keep the temperature sensor compatible.
>=20
> Connect the EV23X71A fan to the controller and route its pins. Use a
> 25 kHz normal-polarity PWM for the board low-side FET. Set cooling
> levels so the fan starts at full speed.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111161619.2321=
41-1-robert.marko@sartura.hr?part=3D4

