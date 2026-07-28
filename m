Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61692D7DFE
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208925; cv=none; b=E8x+g/h9lKyf/6xLJBFpPc72IuC9t+t3RrdGuiz+x5WLONc3MxSTyu4Qmt6NokcG/gd8CQQaWCR3cz6bHviZFikAjdMh63Rh6VpcsZQ1/1Wkn51AMqhbYm0wZiIehSYTA2HZIJHGl0H0rJLXChNpMr+VKNQbb69ncZu51vRux4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208925; c=relaxed/simple;
	bh=b5iUaPykMognGAqkIcc921aTmwOiaNYqo0Lf/KHebxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbuBlv8Y5r9hOd4biOFShkdpZiHZl5nBCpzs3NkTRcnSgx6RTmZ8gaK/PhfVZB9DQZnsHEu7ZliMUqn/nmAFK1mRcD7GDfY6UXEDra2VG7ws6ssFXXY2C27En6d9OJO0HtFUGAYDLfPzwYq7FwxhQxpIvG7Cb4BSm11RiA1+sLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nr1c/jV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nr1c/jV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E5F1F000E9;
	Tue, 28 Jul 2026 03:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785208923;
	bh=b5iUaPykMognGAqkIcc921aTmwOiaNYqo0Lf/KHebxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nr1c/jV+87H/UYhpLSTniMZ9m7Mzk+3iN8UvbctH8Hz2p+WXjB5W1kXmAtXDKRUWb
	 7EIBJJfy2BEuf0vb7SDyHfk1zk6ZQMvegMAX9RjwdwPn5UHkb/JwpP8vNXO2ODqzyh
	 kJ46eBg6Q93qpjZfQ+/HEm9raBjR7WJMiGIg/MeHITTPo8w5da2cSFzBp6ISzhoz+V
	 v9GXBY6D6FsUUmYKfOl8oCF6zl5JITOKq8iegISjNLUMwnvpnJJOdjh8fRQz7n/7bv
	 vOo6eO4sNmnCRoPrIc/9ig/hqox2i9s94sZsl0H0680T0dQGtRBhF8TKocLu9oX9pD
	 zkBgUZccAzVgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2024
 Elite
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Lyon" <sean@seanlyon.dev>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260728031127.26553-1-sean@seanlyon.dev>
References: <20260728031127.26553-1-sean@seanlyon.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:22:02 +0000
Message-Id: <20260728032203.08E5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Kraken 2024 Elite (USB ID 1e71:3012) is protocol-compatible with the
> existing Kraken 2023 devices and works with the current Z53 code paths.
> Add its USB product ID and map it to the KRAKEN2023 kind.
>=20
> Tested on hardware: liquid temperature and pump/fan speeds read
> correctly (cross-checked against liquidctl), and PWM control of both the
> pump and fan channels works as expected.
>=20
> Signed-off-by: Sean Lyon <sean@seanlyon.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728031127.2655=
3-1-sean@seanlyon.dev?part=3D1

