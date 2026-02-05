Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D4222575;
	Thu,  5 Feb 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770316825; cv=none; b=mAvy3d0L5pGmfe4qPGLBdUfWAkBTCSkPRd3MWjtYdcTc46xPAVoZ/7BLesoshVeXKWD8I/ze51Ig7wYS0FRZIw4fE9XGvi7+1ugUn6NJg2U28k6zLKvVZPVIZ3PQeGs99kuGbCa9zl48mHKNPN5Qq/pahi5UUm3MzhMPW1EAPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770316825; c=relaxed/simple;
	bh=S+i5FblNJQbHGB/LuAZ6zsUMPn9TsCtgzHeSToD4PCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IncxmFfPXOseSnYsNdMqCefwziYdNYjaSwONFIv9tSy5gKKhneQKZE0rl+1/bERqs/q+dY6g+yhGvCy0AxZ1X8lgKDc3kG2ggERV5SrWsbqRujfMPpYwWP4rUgInDy0Oqu6g78rhSkF25dyfXloky/XSVaAbAW+LWzsazxu+9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ+h2QpK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ+h2QpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23774C4CEF7;
	Thu,  5 Feb 2026 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770316824;
	bh=S+i5FblNJQbHGB/LuAZ6zsUMPn9TsCtgzHeSToD4PCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQ+h2QpKxywhjtLFJndMJSrGY3FE8lfZhQcGwpAhQZmMcZfHsZ7GKXdl0l6WYurG4
	 4m+UTwuj3aOFD3d81oq58zzwSExoT13JN1mbIqKH83611ggOmXNZTUitsunBjc7lOx
	 2Lv5EXrRBcY0hIwJiWUyz9+zzefhwRHb8Llwx5uXPE86IOBFXZdjG5Dq6cjTpUdYro
	 h0d4XZt2jp4KecQ2UYEMTrLMCGsjVrHoXHc9/useRiwLauL0VVB+mCzBczZ+H5VDHq
	 /pbZcsxP+A2QUjyq5PuLlEQSidbY/oPWrNYzCKf2c96Gg4i2Yr1y0mGe2ZiU5cG+5o
	 PlDiwJvhWt9iA==
Date: Thu, 5 Feb 2026 18:40:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add Delta Q54SN120A1
 and Q54SW120A7
Message-ID: <20260205-quiet-preface-cfcb1fc456d4@spud>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nm8/3iV4YSXnfxTq"
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>


--nm8/3iV4YSXnfxTq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nm8/3iV4YSXnfxTq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTkEwAKCRB4tDGHoIJi
0kIFAP4pVB/Z6rbrb1UXk3+anmTyqg3Nn3SNiS4jTV9ektmi7AD7BJUBfcMUmXdr
IIwbKPlN05tf8q0VjPFP4UntIN/RXQs=
=WXdw
-----END PGP SIGNATURE-----

--nm8/3iV4YSXnfxTq--
