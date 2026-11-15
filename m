Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753758;
	b=Nmph/HLDr8kgWtXlS6L8jJ09Ocq4NGTDdxWXuJ41C53IFDbPsg/oAlyXvGOkNOuyyJ6o
	 4gOLzL2lB3+h/cd4+Ez3p0utszP5N1EZEfCoOQSGIJ/grZceODfKdUIT5zj1Y/5MrhT4k
	 zTtrv7RKp2X4F8sI9gUj94TkpcCCsqKQKDyIhHR+oZFVwwdgpQ7mh0IwbNHpQfTVAp/QO
	 wmwQXHR1+jE/01afPTQu+ZXJigXPlpWlwR0134mapJhlZb6o97MOK1aqx8qlQp9gzLcZt
	 eN5lQg0G3sN5NE5R98hQRxdjHyE9rmXiBh3Ek1/5n6QIf+aLVhG305zSQ8A181oOl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i8eT45ncSIbUqWvcs86TaMeI1dWfh4eHsmd3LqUmEEg=;
	b=lY7gDid/hthba8W09lTqH7cTUV/UeTVLt7aeTUjgMW1b1uD+W22w/v0sh0gnpW0ceCqg
	 GoJDhmy1znKSWgrwjQWAlgoL0AdZjczubMq+0f4xZk++DMOaggm5NIDRAherARFwNvfs+
	 fhJJGWhOHhLmgIGO0MlJcXklYMyKzTeymi6J5wKE79IgI0EeJpl/5hTu7a04EPir3DJQU
	 /0VyxjVIgwaNpRO0ZhSW2I+PswHwUX84+qcZNlrm3JZn38pAS/1V+Rp1VFZpLBdtUYgGE
	 ddgR35V8fsTCL4+TgCrJtNfT73gVNz73QTA+lx1GuBpPTsA4YR6jX1BX8/8dG3R1VuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJ99Ko1T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE51606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJ99Ko1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC11F000C4;
	Sun, 15 Nov 2026 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753757;
	bh=i8eT45ncSIbUqWvcs86TaMeI1dWfh4eHsmd3LqUmEEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QJ99Ko1TjSewrVhOfQHksnxr3+7jVPr0Bpe62ZvsoWNBO4bIb3QTZ0CtDT5GSpeSZ
	 pF5+hYgDyGrg0oEkbdraZqLE75P3i3RX1W2JYGRJdOEfvQnxpmDEBZJWXFiGp0dxBB
	 wHWBlqcp1tISlXxRfE4ChEw/9tlPbdWSpUvaF5E9eHCpXwB0hFeOczTTZ7vLsCXsSg
	 VFIMrM2CpPODFld6EUy6WMOm+gM5hYYLfNE+ZZzvK8D5k7zbaK0+ea4X5R8R6VVTO8
	 nVKzacnxxLqWoMqbeR42ltJaJtwTvOqJB6YmqrIK9NQb0HAxMD9T1DQl7KBs5pDwd9
	 5mn5wp7H1wZxw==
Message-ID: <sashiko-outbox-215588@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (asus-ec-sensors) Add support for PRIME
 Z590-A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115143708.492883-2-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
 <20261115143708.492883-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 14:42:37 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Kostiantyn Korn <korn@korn.im>
>=20
> Add support for the PRIME Z590-A board.
>=20
> Signed-off-by: Kostiantyn Korn <korn@korn.im>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115143708.4928=
83-1-eugene.shalygin@gmail.com?part=3D1

