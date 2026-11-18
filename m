Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994344;
	b=fECZYQQWpzA6WcfIQGeKfTA8XBhm0UbDzjZ4kCiHM+SxwJNzIV9R9d8nwfO1OSZAhY/t
	 Ctkju2+hGnn3Y73PfgJMceqST1ymXsOu5IfIT9SdczGpJG9tmCvqsWPyKGlHHr3dlr7rt
	 IdL1Ku46k/pk3Wm3BpfAiqJMj5by1sG3xyppyjhrx49mQce7KYF7VPICNCH4Xp1xd9yGn
	 cuCXgWWOEp25G5KEKbGq+a8eD9ujrxvebp2HM+kUlGRONQZEW8l5I7mWL16BU/KgovUNE
	 Za9Popy2HIsl1skR3NRhEQaSBZcshiBUj8xRdJ3Oxz8F7zIDPDECMVrmMMeTn9M0I+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994344;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lgIZyzHKGoL4QRQsJgrlQHh6XDztb9LuD51Ctub4Txo=;
	b=uSej28NgfvIxWCVbXYXdsGTikqdPY+JHTKYQoeYKrvdz0Ya2FGaqYhCimbbPrlDDvpIj
	 8JLffp0TdezEfS3kqugjpLGcZSBxmT3jf3YUFuGxABRe/DmDH6R20jKPfadSW4rgDzXkf
	 AslpjyeqUVbJVbAzKN9Ic9DH9FlUaRosV8caEqXiE9FonC6AbOq7zfWrVBEpCTM2xnAKJ
	 a6e+Gh7+fSr+dW0CI7QLDm9mbGWf5iJupCNRZpRubVHLIfsEVQCStMDJ3TgRMXsMk3Hvd
	 Nr/jYUZtuoGHqcbka9bN4m8LClkQ4dzI9hw/rmr7b5i1+ALHCpZ96D0vvKh8DAPjM5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUyTCPx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21A606A334
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUyTCPx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46AD1F000C8;
	Wed, 18 Nov 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994344;
	bh=lgIZyzHKGoL4QRQsJgrlQHh6XDztb9LuD51Ctub4Txo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUyTCPx8rFAnYkQYyvVLgi39A0hpxnQsFMZXbGPnk7GgA9NYUzNlpbiEq5lIkzFa8
	 vsq56T+ViuLMxJHov68P2zoPUBN9zXnSknBdb6rs+/PApJQTqapx+SIlExTIktVxbr
	 dPOBkbthR6ItL0CzmZwtcvzju7kg3qqIsERV9/jGj9uWPdVFtm1jWxpOfF+RBbCDJN
	 F6YONeog0oEXu+PjiV2yfqwzk9B9excC7lqu7Lt0rDlijrAP/PkCxc3bPK3c7vNPII
	 OcYgW+LvD8oEkT/mn6ZTdMmKJgy4+QGHvc6KNo+XEA4DyYOp3zOEsprVry+1gzt4ll
	 FNnYHiO9ACnbA==
Message-ID: <sashiko-outbox-220576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VsOtdG9yIEh1Z28gU2lsdmE=?= <vitorhg20080@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118092928.163553-1-vitorhg20080@gmail.com>
References: <20261118092928.163553-1-vitorhg20080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:32:23 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The ads7871 probe() ignores the spi_setup() error return value
> and it attempts to write to registers even if spi_setup() fails.
>=20
> Return the setup error before accessing any registers.
>=20
> AI was used for peer-review the patch.
>=20
> Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
>=20
> Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118092928.1635=
53-1-vitorhg20080@gmail.com?part=3D1

