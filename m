Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515039;
	b=F4En/DD+XFKE3U5SgUgLg6lGrn6ln+qsKeYGO87GOoJBIDQIAOw6ORvATJ+1sgvTJ8ZA
	 EdMfWfKetY/mb2pXgmWznAUF+OzFNgup+x5o2rDtUVscFCaHy5X/WaY2jrY72i+Fn1h9D
	 7dGp/hGVrOq1sR2BQ/jenfFIelRW53hAwJdg7iLsdYOMVazJOQ7/Wj7ehl/ENpvnHqJmq
	 t3LQX3UBlwsES6DpnsCR0EwfJBqyMjNNbg9PQPEQDYe3zhJxcN1o5hmKNKgno/kY9c0RL
	 adwMejhmRKt6paspZHUtqP+zKVJnXkUspEYeXqUthVV/hjTu/Fj1cHfVMPD+N/2rwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515039;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ap7xpNJRFmWJ0NDR+GKQfsenEsjZkJcELbUE9V62sr0=;
	b=hL+Je2b6UYEETe51oPn49SCMznngCpil/8H8Ucz7AJcHi8a4NWskrHsPVl7SptOYaUTz
	 Fj6zcghuamh/7WxG3otdvtRjZetFMw/Wbo9hFLy1HKtVN8vWeu2yDGa3dEL7bZUb+Ei9D
	 FfHWxfli9Y91HsCpM+qtsIo+kX7J3u6f5z953dV4VE+BHq+iGTJYjJAWBA+Zhu/vJ3ntE
	 MYVVlOUSVJpc762R1lu+QCzVcBw/H5s6Cmh3nkPONTysGfVDoaDfrCyXV7tBX4slyKSu0
	 DYjyWG3LCVIVUerj2MHG14K2etWMhwdXtUjN33Ofa4yoWj+XNcNzBON4nCv5dAB3puw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A792D60A2608
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8611F000CA;
	Tue, 20 Oct 2026 16:50:39 +0000 (UTC)
Message-ID: <sashiko-outbox-179380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
 <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:50:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
> FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
> get their own compatibles.
>=20
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fs1603-v2-=
0-0986107a5cd2@nexthop.ai?part=3D2

