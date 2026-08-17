Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212B3BD241;
	Mon, 17 Aug 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962373; cv=none; b=rFum9RPcM3/x9saWkSxtLOD4VKd/OnwDEciTJL/UGA6v+L0Q8TfG3JESw1ssADxOB6qmiS2H6jN1U9E5/N2qfe1YN3cNnC56XntvnrHT6MrnSNddY3Cmoid5iAM+NBEdVTlidiwH3WKr/5CGaInNxZBa1WeC0UIuUZ/4GxuGcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962373; c=relaxed/simple;
	bh=1RX2eLojAdhpWUR9ZjX+txjrrpdb5xxf9atUyL05z0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MRlhIOUjLpFtzlhpRl5cOr1FfRxlkd4DHt4xU4I8DG0hOL00Eqpjbt3RvqoQ1xC9HYwJ3TezV8/cSlQfHgw7pFXOcOi9a7ZgYPPYma5G3I4AMV/lYDgbvQSpqYrBE0a5n3ke35CVHRsaoeFhJw5hK64gwHtxKcbhv98/uA+mzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6G25kgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6G25kgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81A41F000E9;
	Mon, 17 Aug 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786962372;
	bh=1RX2eLojAdhpWUR9ZjX+txjrrpdb5xxf9atUyL05z0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I6G25kgXHZtp7lmo/TNYCaC7Sc5AmMVo2XlTYCCSafweGurXzSWCSTCtXXBQz80d3
	 nqF1ptQ5DADUitingQdS02SzAR/KwBDDWJRhSjfkOS91SeKsT9jFuJ2bTeIzT7VeNV
	 P2zRgLa1uomVgfJjTqWX96+6Gt2jhoxfQNgmdoTQ3cggFecFgE7gNF72hqxgjb9z+o
	 KN4Vu/lfED2LhGJA4TH02DoZnt/zCN1GFGot9nhy19nNwapVsvLuQgHNt8HuSuJKo3
	 68qGUYfON3EIy3vUF0W8iAsibfrtvuXhWNfPWrMFxXYDVEwUd5Ks6oEVI6DCy0C30S
	 +mpmDkjuyL5cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260817101455.3526260-4-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:26:11 +0000
Message-Id: <20260817102611.D81A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Extend the existing TPS25990 driver to support the TPS1689 eFuse,
> as both devices share the same command interface and functionality.
>=20
> Update the documentation to include TPS1689 support.
>=20
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817101455.3526=
260-1-sbogdanov@baylibre.com?part=3D3

