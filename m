Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796D20F077;
	Mon, 13 Jan 2025 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788356; cv=none; b=n0FVTr0zP4xH3u1yZV/s4bnOoHiqM+cvLOsjr8LoF/xj8A0tnKNoqFzRVenqXpSFyGD81RBPWnH25YmxFe5vMBNA3w0hZ1nH7IaD6msUmJ8Dn/cAkCbU21CAeoumIkIzFwrZQnwA7hRvMnUW+ZzmZTd+vQQ3lMSAHdrNn65OL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788356; c=relaxed/simple;
	bh=p7KTq7ocGVxzf3s383nFbxujoDj1GKtU7clsCOG54u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfE6O+oACj2X/F9I7ZiBzUdKFEWjdseWgXw2HlzdqiOuDNg22Uo175wWclxUpKzKCYr/ClA/pE/jFxmW/1qIMg+2gMPB8h66K0vq9cET+E23X8uHwFEQ2pdhPtBe+JBxrxmPOGuINKlKN67chAyhCC6Cra6Hb2D8fO9eU0gK3wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sL/TBU25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sL/TBU25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B946C4CED6;
	Mon, 13 Jan 2025 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736788356;
	bh=p7KTq7ocGVxzf3s383nFbxujoDj1GKtU7clsCOG54u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sL/TBU252fL3QsrYN9X3y7uxE9NGxJf7rzeb9OZVYXsdXDn5f2zfI1lLAIhdBQPsF
	 PRxdBC/wp6uw5do3cPFstt37seqzkdbj0a0odDs99vE2p/ukfOCpYSveKGQFE3AgUv
	 jAp6FMADZSBTW4k71Oacljkz/3V0XehbpbX8zsA0BOJARixUX2D1eHENxWK7H2dl1A
	 WJOmlFn2Wwt4VRMp7IHKk63q5QuU3A8BwC2x0I65TLxFYQWojKOmdcwat3Yrm17bzY
	 hj6mqX0Tunqi/C1oDiQUQHVLxkzY+IIBAFtsSPgtzxv+Vj6jn2UuQvesEmAAqI8758
	 wo8wAxpKKeCbQ==
Date: Mon, 13 Jan 2025 17:12:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
Message-ID: <20250113-unmoving-drinking-eced6d36979e@spud>
References: <20250113035023.365697-1-wenliang202407@163.com>
 <20250113035023.365697-2-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c3POeVvxXWnGjl+N"
Content-Disposition: inline
In-Reply-To: <20250113035023.365697-2-wenliang202407@163.com>


--c3POeVvxXWnGjl+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:50:22AM +0800, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
>=20
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
>=20
> The new features added to sq52206 compared to ina238 do not
> affect the differences in hardware properties.The properties
> described in the ina2xx.yaml are applicable to the sq52206.

This blurb is a bit confusing, as it makes it seem like the devices are
compatible. The driver patch, however, suggests otherwise. Please
mention in your commit message what differs between the new device
you're adding and existing ones.

>=20
>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> index 05a9cb36cd82..f0b7758ab29f 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - silergy,sq52206
>        - silergy,sy24655
>        - ti,ina209
>        - ti,ina219
> --=20
> 2.43.0
>=20

--c3POeVvxXWnGjl+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VJfwAKCRB4tDGHoIJi
0oaHAQCoWfl0mlNHCGFkaAdZCQu7IHIHt608QqlbkAxErUkqVwEAkxyeq51nQsP5
1K/qssUOYXHNQXidC3nxwYYljDE1TQw=
=m461
-----END PGP SIGNATURE-----

--c3POeVvxXWnGjl+N--
