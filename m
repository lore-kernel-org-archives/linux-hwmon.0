Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385950;
	b=OuyFSaZe/91mlJKwV+9lu+rgm2nivsaPe12fA0C4fGuGSRSOcqaA712yHHeT6UhwApcE
	 KZvxJ2EL1+vhBlRKhKEXZdpoozwf4CwmNlAzDvVl0pAq2018yUidgprvRmeF04VNcK8ku
	 m5vm7shRVUXnmZ9JSFLYgM7KtdXFL2IT+iS4wvgUXJB71TVx8m2yA6uGzd4dAPGvl37rD
	 zq4RBf5yme8yhjPRqRtz8+ysw8pWBtf1qreAVwsdw4o3Pgxy5AiLJIIhnKy/8NJH9lgtl
	 BI4sVKFgiV91rBKWTbUI0wimefPxYtPikYenKTkVAkXC4WM0ztscxugeHirlXdE7R7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X3vmlMwXta9FrJuBaKgx1GyqJ3msxWev6rBlNGmnvKM=;
	b=mecHJ1ZOsHm/e+WpZyKS855ZruxInKQDeAoqIuEpFMWEjA0SuzcUK4J6NIRoBk8Oizj8
	 xEBdwgZzOdOfJGBEX+A7baGXh9KSlQZx5Px6zDGoYUXmNB2CtgmTmQPHA6L2YCoBSY9fW
	 o8NlKnryry/uKBGWTThs8rLx99gM6h964G92P+5V0VsrYbHX2BZ52XWzo1mBJm73cROl+
	 aVOcd0g6snC8tTjWhCvO8oDgY5qUSdkafGD8hypFJVnLArpX+2+dYfTknTgGBLTWJg7i9
	 p7u3MtWuhE6AchuCVtnckt2ueg7yZgsU9//upTM233pIwAiWFjVI3szu27m5+OUMqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2Q32utZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC60606A324
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2Q32utZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE431F00A06;
	Wed, 11 Nov 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385950;
	bh=X3vmlMwXta9FrJuBaKgx1GyqJ3msxWev6rBlNGmnvKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2Q32utZoHoFQH+1eowzug08oaWQGh7jUPNN1oZYBrGznqhAhSjiieTmAksLnq3xP
	 CKu2otVbxlaldVny1H2AytZt07NvPNZYxtqYmjjp65WDmw9AVmI6NrLe7yh80i1J96
	 4sbQkyiPbBu+wqLG7HkwYF3wpDQgazBvawhni5O0bl48C9cCeku2grebr6A0MZoKGa
	 SZfJ7RZ9P6bICFUiWA9NsWbtplxjV/myUvmWIY9fhlnVFOXs0Os/u1JVXkj57U/UsT
	 9l2a5utEUXraMDC/pYI8C/77Wmo5bDRQkWBW7hsBLXmzZgvq5Nsz9u3YK9xsCW3dPR
	 932BE0qcA8gDQ==
Message-ID: <sashiko-outbox-208609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] hwmon: (nct6683) Add customer ID for ASRock B850
 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-2-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-2-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:32:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The ASRock B850 Steel Legend WiFi has an NCT6686D with customer ID
> 0x164a, so the driver only probes on it with the force module parameter.
>=20
> Add the customer ID so the driver probes on this board by default.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D1

