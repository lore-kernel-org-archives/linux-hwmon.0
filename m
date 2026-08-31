Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59A43231D;
	Mon, 31 Aug 2026 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194171; cv=none; b=hn21deYdwwkxJTzWKVcKHvqRohGcAURCmTpOmQ4A4uze1ZZ0aQmvuctooM9qHsH/tsFWUTjYCEbVtg8wcTgE7DdO7ndz2M7MweX82kKBHphaEHXuil5Q2OM+MuOzUtgYs4aksUrX2KzQIdJekcfrGozGU8N+87yKk1g+zvnADy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194171; c=relaxed/simple;
	bh=Zep91UknR1Xmifoa/6qd2WDhqbF8uqCzMpSws/DllS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/vvjofvKlz2E0qoX4IiiAio2jSeH6ajx/2ySJCUq7eRx5txml2cUBS98GZJ+sSyTiTtRgMI6k2IIJdY/Qnjl5qBf2F4a2D8/KTERco7KxVtQUeLmaoOCsZ2v7Q2u8IkevPtWXwQIloQuEexvpuN8hpzJtMNlPHH/H1QHjVv3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zi4ZSpen; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zi4ZSpen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685481F000E9;
	Mon, 31 Aug 2026 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194169;
	bh=Zep91UknR1Xmifoa/6qd2WDhqbF8uqCzMpSws/DllS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zi4ZSpengbZNKMPwMjtzGtl9VjskOv7VV3iklMAuT9+jVvhLmXIHpIqL11tpZN/MH
	 0zqkiVn1uQbsxtDUf6YaN4TAnBpG3NK+js7BFS0beZgd8MbOFagErk3KVY1YuAZ37k
	 dEfCADpeseqtCCCHqTNa/GkykzT5xdRU1+0QZnLWiercttcSq2eQviT3yoyY+UrxL0
	 VV35upd6c29/WrZeNyij+yPvAp1hiuw+gxIVhS1TOG+tnvdfBxuM2g1QYKg9ILuPse
	 Zvl9ipsk9VkBvcoxg0Gtr0GG30aCwsm81ZpAII5U/3IZRPuaOPbvEWysL3UjP1ofrV
	 LJwKMIBnhYhmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260831-ctl2301-v4-5-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-5-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:36:08 +0000
Message-Id: <20260831163609.685481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
> and 8. Use a 25 mA drive strength, which is supported for both K3 IO
> voltage domains, and leave board-specific IO voltage selection to board
> files.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D5

