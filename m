Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DE595741;
	Tue,  8 Sep 2026 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890151; cv=none; b=g3MjabnamNW2pBxlCBzwH7Yomf0z3ZJfA/VAvM1MrC725ia1zgAXClIj3xAGWNXvfABXxjLgQDjKkvJITAyJ7gpI7ScrPOgielbbM1402F4XkZtzOlw4SlOlZQDHRn/g/cJ8n4ptX66tq6xbAOCHVfxeuOwMKqqcYI6ZDJB4f8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890151; c=relaxed/simple;
	bh=pL6X4+H1HRTFmUzZquYoWA+vA8llL1b++q+IS0wt0WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d74ad904+97IJlOLl2ra3XGilB561OxR3DXzWXAKOfIw8aOAX+LIPE/7SYU40ZRf66OQOaad/crFdFsvBPhFDxjTmWuv0tWW2bZR4Saq+SBOXV0XCHrvbaybuj9ya0//hXAAhojxvZHEQvjuXvITY/ylfJyRClHggZPej07mrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+V0cbt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+V0cbt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1401F1F00A3F;
	Tue,  8 Sep 2026 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890150;
	bh=pL6X4+H1HRTFmUzZquYoWA+vA8llL1b++q+IS0wt0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+V0cbt5sBZBlmAMr/pNoSfTcKuLf+bTaAO0EfRVEahoujoy8PKW/BitkIQUOEn2G
	 UYfRIzngOCn1suV4qvSncou5CbW6Zo2ybdumlrzt5vTxMUuB1s9/kqSvizee/YGa+t
	 KhJxtOEhsmnEgOlAakGffdhU2IT7ntzv/F38kXl+0YjfoH1kCQBtnCxJwvJwxNN0eO
	 avONiEJ12MWbYNOO6fz9kmg+sVtIap1T/xnSch91mADPah6LbTLiZZqNQA5cFlYZRz
	 OG9MtTBdsdNany5CxlAXqYdSgbYwtq7dZ93r0GnnN2PMSVkHZ9jHhoxTUSBJSXwn0i
	 nSZk762E2rzAg==
Date: Tue, 8 Sep 2026 18:55:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: add Lenovo Yoga
 Slim 7x Gen 11 EC
Message-ID: <20260908-duke-carry-344cf89b213b@spud>
References: <20260908091752.5508-1-okerixx@gmail.com>
 <20260908091752.5508-2-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXLwQtLx5yICgUWa"
Content-Disposition: inline
In-Reply-To: <20260908091752.5508-2-okerixx@gmail.com>

--xXLwQtLx5yICgUWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xXLwQtLx5yICgUWa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBMIgAKCRB4tDGHoIJi
0ubLAP9ImlOvimLhhhAqHp+sx/Yi9jZkYeJ8jkhv0ewec/8hNgD45RIi2wUn4YuM
Q6YZq3Y5ScDe8nCvyjC+EtD7gYSCCQ==
=oUob
-----END PGP SIGNATURE-----

--xXLwQtLx5yICgUWa--
