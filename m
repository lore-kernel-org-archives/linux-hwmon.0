Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B04A3D35;
	Thu,  3 Sep 2026 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457393; cv=none; b=A4Lv3IPyVhPdzACyeUllEU55fO5G49alJNsOdpYvZ+ScW3EzKU0JNvRTt0ES/bf9hxGc+1TVtD9j9oy/Sj19ZzmJlPNb+7BD97FfFqn6D24Osl/DxXuAi1ee+zuy7rUo5h8zyKDtshR0olWA9mEcDNSnPS37pJA8UztBenGJyOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457393; c=relaxed/simple;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGsfpl8viV+q/Qv8HGqFRNUSrihabgQiiYINqk29dxUEoc7cBYC/6e3j95RB37twJZakrptnFwETB6asPwqG8RV/ma2/HjIUWzfNNegcwEVKoYyNnYD8xzdhc8iAB9ooog+CeUTM7XCvsvBo2OcigEINFT/cz2IgwJSMlUdFHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG3I0jS6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG3I0jS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F81F000E9;
	Thu,  3 Sep 2026 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457392;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iG3I0jS6ZHTha1IW2rCS0eScKYZtyUujA70ocylueLet1hFh+DjLNFd956URbpOE8
	 JRSx/+luzRm0armEHasBKTtiLbokj/goAb3J9bHseVU+SwUZsUg4cxDVK+FLXM6ysh
	 m9V5qce9cvT1NR+8eKrEJipUz/L9xOG+7C6UHFGRbND3mzF+HQg7+CN8/QLPnzt+9r
	 qnjwDhQmNbXpE8M/sHGbhh2k/3uut+449wzf940H7uq0yPzsjHzzSeKWPRcINcO4rJ
	 nk0tzCVgPhYhCLx66uKLWbmdey9qzsw7fM+0WHJ4kkthz9w4S44lazpYgO3QFbh0l8
	 AmbqcadSMzJTg==
Date: Thu, 3 Sep 2026 18:43:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <20260903-magical-stopwatch-05e1a8be6fd8@spud>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpJjSe/VbDY80SOp"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>

--SpJjSe/VbDY80SOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SpJjSe/VbDY80SOp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmxqgAKCRB4tDGHoIJi
0j+jAQD8wrE09OV3X86Bngo1gmedxzYJrUI0492AHQUpCyME4wD/b483lktimFdV
N+9+LIBwWe0Ngow1TyKs9btPQpBogAQ=
=fY2z
-----END PGP SIGNATURE-----

--SpJjSe/VbDY80SOp--
