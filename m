Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B62FB084;
	Tue, 23 Sep 2025 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653880; cv=none; b=QJYw+Z2fA2fk4U4vkNpAOtuZqn38KbXXZ+DuraVfQetbfX16cO7K26WO/chy5WHLSyvFRI/oq6FSMnhm2CxWJLQTUPY4IyUqGXHooCYl553XJAsEnVfwBKphaXRP0eiNK5JAcSAKmf6FQOoM2F+q/aMWe8cbmYrW5XlMO/drYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653880; c=relaxed/simple;
	bh=DMHlHDxZJq8826pkA7imh+9YBvoNxSHcfIJNuXObSqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4dpL8OayRMc2gBrHTUAmaFf9lB13g23PUUrudvLHKBzr3unzo6WDtqY5oANZakeCGaQ2xMKFi64+iuAarTZpLeABXxKklQQuS+vZUEpyV2g3ySVfBfvnKdgO8y/bTrUu164bZY4NDT9NEHdS2xTC8cOKLchw0zZDVCcd7onwXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRXOFNzr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRXOFNzr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5461C4CEF5;
	Tue, 23 Sep 2025 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653880;
	bh=DMHlHDxZJq8826pkA7imh+9YBvoNxSHcfIJNuXObSqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRXOFNzrp5N0Q4F+50z5N7duXWW1Q7xJlSU1/9K0Fvrf3z2qc80HPuZFAWztjz2Ga
	 WGjQj65UzeIZDEvGX3Um782irxwgJ/RmrQ7wLBlHmUuUtXArhk6JVOPZXVeFcKfbVF
	 auZCfj72yv5OgMT4wPSxF+a0thmmnsRBsk0Oy9ru5stRk3LMUNGIq0mcpxJ26Ibu5o
	 mWBnE4OKS6yKmdpOCbnikMK1VYaEDwIxPvcbZq4MGHyzu/sX03S4ahLkq+BR0rTQdY
	 6qYd5GXMsXXTLWhLj9eAoDO7WrfHQbIvDJXt2c0Xx6YP8bT82YJYDyYc/Cp2+RJhJ4
	 a/c9Wotu9t2Sg==
Date: Tue, 23 Sep 2025 19:57:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, linux@roeck-us.net, jdelvare@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp5998
Message-ID: <20250923-hydrant-donator-fa075f9a31b1@spud>
References: <20250923090926.619-1-Yuxi.Wang@monolithicpower.com>
 <20250923090926.619-2-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mby3ndUEBZNACaRs"
Content-Disposition: inline
In-Reply-To: <20250923090926.619-2-Yuxi.Wang@monolithicpower.com>


--mby3ndUEBZNACaRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--mby3ndUEBZNACaRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLtswAKCRB4tDGHoIJi
0sxnAPwJpa3kcsqUQv1xptuuHfh4u0wq8sEjxbb3cZ05crJyHAEAuNvKAau/ArEG
8yOFrBFWCoRudNFCi2mGIXfmzwUM2As=
=18a5
-----END PGP SIGNATURE-----

--mby3ndUEBZNACaRs--
