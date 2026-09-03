Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CD4052D7;
	Thu,  3 Sep 2026 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453325; cv=none; b=muG/jWnopVm2seC9UmNwAtAcdDa800DeOL8T5hw8ISD4vV6XZGTGt1xul6Q7aGclg+q7tvo9qXW17vqtW3uIRS3FHGV++erMv8a9OJRPLm0MxSqzgfO8ohuUXDx1of103fX7OulyogD5I1aapFXOi+dTnXSxyRewD1n9tcPn2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453325; c=relaxed/simple;
	bh=4VgcqGwejHpXlI0fhcLml5Ty0iRHkq8/A0Kj2ugtbO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STNhTzemhy1ef9LcBK4laCUQ2F8qp8gZdIHiWphRKetAJR9aq0reYcZd/65+9aaP/QL+qa2TL6PQq7NDE262HAOXjQDrwVxeeoBJ2ZCeie8PThHtDwO3d7QYoEvjBFJNNyYrjUV5x+zYhJDUjZvDT28petgbs4hZeXn/V623AR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJn00D5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJn00D5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0C51F000E9;
	Thu,  3 Sep 2026 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788453324;
	bh=4VgcqGwejHpXlI0fhcLml5Ty0iRHkq8/A0Kj2ugtbO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJn00D5LHCNxJKO8OB0oD4jqtmpIcvs0FKWYL07kd8xyziZ1PcVIVLGJqrrvOyO6X
	 BmEKRU8wNOCpJepqx4LQvKCaa0mVKE6PkerBqdK04v2t1qGy9cyq3kzmWkhcmBQw2t
	 sB6E9oujzXL9p3jHW3gPcowbvTnOaQVpB7JmsCOMOGR85OPYgVpk18plFAtGbZGCz1
	 97uzgbxyhmG+2jWU0YOBSUV7F3jzL2l3gpQ7GsUEPThXoKdF4MsG2yf3XnsnRoGVMz
	 O8kOFhFN7wAQvwZbu0+RMK2EGNJ+nAvrw0DE16a591UIriRc9/meKuQmdJGJfNzOhZ
	 /IftCisocxTMA==
Date: Thu, 3 Sep 2026 17:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Message-ID: <20260903-rotten-judgingly-5655b33067a3@spud>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6/hMdV/OsdyQFZVD"
Content-Disposition: inline
In-Reply-To: <20260903133408.110847-2-changhuang.liang@starfivetech.com>

--6/hMdV/OsdyQFZVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6/hMdV/OsdyQFZVD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmhyAAKCRB4tDGHoIJi
0ux/AP91kU+PdujjA6iPz887aHKutbwu6u6M2sBSS0IoEsSS/wD8D6L6UV278fvm
MgP0qQVpRpxWTJIbBhkO1zR9Kljykw4=
=K3hZ
-----END PGP SIGNATURE-----

--6/hMdV/OsdyQFZVD--
