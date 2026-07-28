Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78BB224234
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198896; cv=none; b=UaN5ZZmK3QvmLvkLOwGRpzObMrAhvB3sRlgdR1JhcKRSRlcmbJiv/bgLoOdxG7IzAHXqHAGMEvxHLJ/Undpizgif8JHVImh2Xf2qZ5OS8ThXZShB1GXFKtLsSZt6ECOtbMMB0TjZDLVdw9H0cK5C9M9QxfO2sQzhd/JvMPQ/uio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198896; c=relaxed/simple;
	bh=HsyUQg/uzNcJ5BeYENM7Ou0ZXsx4wdP2KM4noiwjgcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pzyr1HwWJ5Ruko8NzMKfpcQAwdpocSKwZkfpu09Z8AmMwjE6LjWq6VgcefF2lBvmChPIg7aLT8tnw6LAqPx0dQ1OUoSkm1/UH7BTc6w1LYpy4zwEPz5cQlYRKhraugVjgmhbbwispTYSi6FRb69wtMC6v7nX4JwV/ZmpjzCtIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6NPNC35; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6NPNC35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD951F00A3A;
	Tue, 28 Jul 2026 00:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198894;
	bh=HsyUQg/uzNcJ5BeYENM7Ou0ZXsx4wdP2KM4noiwjgcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6NPNC35NXpH5khkPQuLHQdLWPWnyg3VzVqUmCSqZ9IzGj3RA079lK34IYnkpkWOQ
	 KENpkVwzJ8LStKYNvOfTfGsZQitw3qybwEi9Ni4Xx/9Y8TLjg+F0I+WS5PAXURaR1c
	 jikCi9i0O8DWn5Gk22nmwVdlu3HhyNCE+ur3hUugQvjNAphLsbu3IvWC4kg1HFurG7
	 X6ur9WHvs2xKKr5hVbijh7tenLTIYl03Fo0GASZjKzrd88oftY+gIHdxm2YzrzbdxQ
	 obuHwiyZcgMioi8xWHzXfqUFhWfX/pYayUm6mNywsQRmTs67IMBYdLjqsBDkaGqcxW
	 iQ/pI3HsQKW4g==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 2/8] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-2-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-2-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:34:53 +0000
Message-Id: <20260728003454.0FD951F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> adt7470_temp_write() and adt7470_pwm_write() update the driver's
> cached values (temp_min, temp_max, pwm_input, pwm_enable) before issuing
> the corresponding regmap_write(), and never check whether the write
> succeeded before committing that update. If the I2C transaction fails,
> the function correctly propagates the error to the caller, but the cache
> silently keeps the new value, which was never actually applied to the
> hardware. Subsequent reads then report a value that does not match the
> device state.
>=20
> Reorder both write paths to update the cache only after a successful
> regmap_write(), so the cache always reflects what was actually
> written to the hardware.
>=20
> Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D2

