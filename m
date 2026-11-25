Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609146;
	b=ynFa6Ycqvvjlywojj2a15A5GmUCo9D59W4BBa1pacYIjEM4jDvoRaGCfsmyad3xH4P55
	 UND1RNX7B97Y/KkLLY7M0lMJcyU7CPTW1UwYMS4Oax8Lpx0HGFNu3GrYX0FSIhTgk7GNr
	 R0u77dQBVlOy7P581Bsu1rl0d4rwgpLC0n1ngJx9DQyyGYkgXo5WyKrm/Mnv19Kw+k62K
	 hhInKb29xxKgL9dW3mwxYROinnSlgff3wpSkJGPK534KvUsxTwcDWgsM93OQHUmcy4SNe
	 zSBMBMg8EGQf09OL14CZbpzE69MOR/liIifIJCAlzUFqBWJhY61a6cJhlmNdsLvx2Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=03P5WqdoxN73wyHcm4a56sj2Oupy9QmDKczBXmZfefc=;
	b=YdlfKDlSmE3gK/hAtiOdWQvD4ndBmeZpkHWRT8m++0/2ve3zJHcKuWlzu0xpid5mqZvv
	 nmqgt2cy6CHpnwW9m0rcpjwwfm5LD7MvzY9glIXw7+2OVsYOs0HCUF5i3Q8HFCYRKyLbS
	 wsSA6YO/gRCD+BgWtQ3h5oJlKa5hPwSlkHNmK3vz5kfgYorpq15dqmJW/YUUwDH5gNXb7
	 27VgXx/+dAedtzlKE+Im4iegZGnTbNNY3kAukc+nDlN9pQqqBP7CxqiwZVZY6nK8XYXqs
	 2eFfteiCpWYsRQrXD8s4OVk4rI0Kj51GxwV0kAtmMbAUYCWa50gMq5i2P2F1r/XnviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRDV7BQ5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3ED606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRDV7BQ5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BE11F000D1;
	Wed, 25 Nov 2026 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609146;
	bh=03P5WqdoxN73wyHcm4a56sj2Oupy9QmDKczBXmZfefc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JRDV7BQ5yBg2ZyqwlkkCtmX4CYgJc5NWL+DPDdpac+e8glBO6OV6uVx1LwUwz2XTi
	 zFwZ4NzCkeRhYMjqoP2evEyzH6BRo3LKwFpr6SphjEfE8mesxVBWIWmbOBSTIkM352
	 mNJeChX8Yo19d7Y8tZYzkOBahuYz0NWyZjMOSUAirD9J6g49ARZ8iX9M3J+sfdeJAR
	 CU7yiM1kuFXk/PK4esjLu9UwYI+yUc85jRsm2OAFvqbjUnJ+JZVV7hpOWL6foDYORr
	 yjR+SgXAFGXS7q6gHjF+WaXDmQMDCjrdsp4e4zVLvI4nxHKw6mww0m/bZCd/gcFZwn
	 f4ZjfGrl+akTw==
Message-ID: <sashiko-outbox-233350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drivers/hwmon: Remove wrong comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Juergen Gross" <jgross@suse.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261125121643.25427-1-jgross@suse.com>
References: <20261125121643.25427-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:19:06 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In drivers/hwmon/coretemp.c drop mentioning rdmsr/wrmsr in a comment,
> as it was incorrect in this regard.
>=20
> Suggested-by: Asaf Nuri Bertizlioglu <asafbertizlioglu@gmail.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125121643.2542=
7-1-jgross@suse.com?part=3D1
