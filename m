Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925D2E8DEC;
	Tue, 28 Jul 2026 02:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204258; cv=none; b=ZjdcK5EyDjNDifdOUtrqfDjOODbRZUHP2taCKIEgBf8D3xLVj7UaCcsW7ZULagDeEa6umGHk8t8peqXP9aMcLHoqFha6QfIuaxKjry5sE7C/sGfoRhQpPsqIwrt0XNLanR/xQvgpRHkKEyRJqBO3LGv1KFPyYu9M7LvftkRuWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204258; c=relaxed/simple;
	bh=id18l/n98H8tyfI9RLPcGT6tyMpbURBn45soDKXQWfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JLc/Ej8UcAqjwKzxGjQ08BBSEr9nY/d7HlmbkJW72rxg6VSwYexrn5/noLfZY7eL/unJxvpzr27Q9YQSdWiWAINZafXYbEfbBGiefOzxsfZ45Ps3j+F4AFbMTc4pXnkLEP0oQD/ZOMMm3PlOk8ibgRAGof4+9ZJEXDGInLrvSpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNaWUgG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNaWUgG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F61F00A3D;
	Tue, 28 Jul 2026 02:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204256;
	bh=id18l/n98H8tyfI9RLPcGT6tyMpbURBn45soDKXQWfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UNaWUgG/VzoCcfQU61oP/jSyyzMkPHOxy7wQYIYedO3691aUzwFWIzv9aPzjAJYkm
	 FF+aGH96ZxNvfJR3gLW0cV7gZVvopWGaiPKtPyzfnxX2/XZYXSeF0yR8OgUoqfecLc
	 TKfPEWXvtkHP85XXlH63hHdUKv3ug20HfQceDLeNXKsTebO3Ak+/ksQT8CzNE6YnO6
	 xOjmxqOKVYL3/AnGLC1fVEWV6K5M9jCnyAWxEdWQMXfnNhaMf67nmi/k+4jLyIMW6S
	 P5DZHhDmiN82m1yN8UcuPrApn/e0LaN0o0roFID7msfk2VdCqUMNjrZDEG9JiTWBFI
	 GxZhT9QsYrqxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728015857.193890-3-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
 <20260728015857.193890-3-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 02:04:16 +0000
Message-Id: <20260728020416.894F61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device compatible support for TPS1689
>=20
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728015857.1938=
90-1-sbogdanov@baylibre.com?part=3D2

