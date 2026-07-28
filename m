Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC75338593;
	Tue, 28 Jul 2026 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255756; cv=none; b=D3FoZpeLpZm28HSd9EvFiD2Ls53BEKoy2+Zgmg0LCC2oj5nXBkq9INp+XPsl2OZRRASRR+bUTfafQe+INAgCpY+IMkSWC40XHOXeLKwp0FJUO0XWJm1Woi3XIU9fs+FbZMynul61s9VoRekHeuQgicxZxMW+xv8RNy2DCjgwpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255756; c=relaxed/simple;
	bh=ZMbUX/s4RV13PfrtoB29C0w4goDoVqTw1InpakiVsBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qF0ttTfEn5PJIRQQJYCtY8RW1jD7WeXpTzw0ipNVNSxbjkG81m7vPcVio9YMn9SCvgugQURhOzIY2vkORlrX7Zmv45SCbD3611cZL94CK1R+AJq6X7o/p+LhWZ//sm7wtkGGYu5oo+GQFaXGPZ1bs2zl7GCYbKqs6HWyK+b5r8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asJPGdUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asJPGdUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9771F00A3A;
	Tue, 28 Jul 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255754;
	bh=ZMbUX/s4RV13PfrtoB29C0w4goDoVqTw1InpakiVsBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asJPGdUVpFBZYrfLeKC9HzdjgCc4lpVIgMm9CtTAvITQFsPWgOm1AE7Vrru/Qyh9D
	 5rTpW8m3N7UzhhXLZ2M0KZGYZDJJQLRX0+S/egYgjtRJYjqEgywKBTQtcBYyE+GxTf
	 CeZNC3yHKL6JzLJhHIWvYUorxRolnLvOiA1sNqJnt2K9wXZnIVCIwliSe/vcesI+qQ
	 enqGMYA4RNKRnAHwuwDQcZgiLP9PRm8XrZzYdIF3t3Nz/mmpPvG9BMWfAdD3UnEF4c
	 56Qvb25p3WfR8uZicd8XktUTVjChUZ0fDc8XgD6n4EOZRWENrDqXHj+yWVzHExugJ+
	 JjnDkfyQYCDzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: (pmbus/core) fix regulator enable/disable
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-hwmon-max20826-support-v1-1-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-1-224766e0acd1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:22:33 +0000
Message-Id: <20260728162233.AD9771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> pmbus_update_byte_data() can return the value of PMBUS_OPERATION which
> can be different than 0 and that can mess with the regulator core
> given _regulator_disable() explicitly checks for ret =3D=3D 0 in order to
> call _regulator_handle_consumer_disable().
>=20
> Fixes: ddbb4db4ced1 ("hwmon: (pmbus) Add regulator support")
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-hwmon-max2=
0826-support-v1-0-224766e0acd1@analog.com?part=3D1

