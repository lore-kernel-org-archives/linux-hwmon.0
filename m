Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C71F4C96;
	Sun,  5 Jul 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262454; cv=none; b=QH/WGo8FM1n4X20qVS66CDiMsrtBJcE85RYjCPO4ueO6E15MqvLEPfP0FRFJkRHgBpixFIjoSY1G/qcY8NOsfHqll+A0CdZrbbR6wkNbDQMsfzabGpVLfvEEJTJOddPO7WBH8GHdzKctPui27lltEwRSLcXEJ7kBwvIjzTIjIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262454; c=relaxed/simple;
	bh=K7ZchmKtqLw/VLeOij+5v+pzaug/zC7GnO1AFQXGn+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1zL3HxV2s3ydDho5fjftU7E7Yfbeilh8fIL9VTxXdrYzgwXfa8nOmkdqnoUtJKG9xl1eWYIS1eQ00ttxFFa0wUMH6mc7f+kfqbMda0t7abLaVhGS4pkR9T4nMPOk6TlnGSrl7c4c4CAtvLF6EBRt2PfyfnxLBfnaz+n2lCQ2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGa/7CQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGa/7CQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C341A1F000E9;
	Sun,  5 Jul 2026 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262452;
	bh=K7ZchmKtqLw/VLeOij+5v+pzaug/zC7GnO1AFQXGn+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGa/7CQf1ANNFg8pVeMouauE8RMKDJkWHsxiwJmQWjAIRzr65oWtpFtmSH/UYh5+j
	 gw3p1WKLa80RcEmJuokxg/uNder535GHnL+V/iRLtHHI1qLRb0UqYm8crC/jnewDWM
	 EcJwLjLTUTIcm9OQAaBSNNNLBxbUHvUkdrpI+XaG0JkDB5iMBawJ1zZnRJdzl0RtcY
	 +9G4biQ7HckxQ+b289MCU3pIe5ctkh/1eW+X168qYtn+kW1A5qY4d/kLsJTqWEQmCG
	 4ADqwjCB7vw3vKM7Jyq2GA49bP7ZrBc5CrfQFWJWw61+3gBnN69OXGAm0fHSvwlioW
	 ybU4t3kic4vAw==
Date: Sun, 5 Jul 2026 15:40:48 +0100
From: Conor Dooley <conor@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Message-ID: <20260705-panning-decompose-92295a425e60@spud>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/RpRisE3gS1H3rlQ"
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-1-wenswang@yeah.net>

--/RpRisE3gS1H3rlQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/RpRisE3gS1H3rlQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakps8AAKCRB4tDGHoIJi
0m0pAP48+WeBMJ28PyrVs2G7B29N9fZv/4cc1n82Pz4F8hjWTwD8DXk3kfFfp4EX
8PbZrIXzF1wKPRjaHKGJlB5rUf6fcAo=
=2z0T
-----END PGP SIGNATURE-----

--/RpRisE3gS1H3rlQ--
