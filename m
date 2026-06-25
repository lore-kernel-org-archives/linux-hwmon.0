Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18231684B0;
	Thu, 25 Jun 2026 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405274; cv=none; b=S1tM83PEEsNnx/GcPRi3eq/sWVWgYYXCo4SF0vlqy+JLqdEptqx2Oj4igBrInvxhgQWWNEmsgx+K1Jeb9KH5DMuE/j3ReCTFZ86QHnnlgv5KSCi4+gr/bDOR9m5yxIXfPFV1LFgXe8MQc9Ih48k+Tnvk1OeAbS4HG1Ibar/tCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405274; c=relaxed/simple;
	bh=4G/LNNM3b1qOUplHc09UGSAyOeAo6risik2UZldc5cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck7GLBPrXtJf0P5LrdmQwq+w9Jf7Nxj22FFUevPblJTeqG2WJwcSVJjzSeCQZ5bk0UozAUbZvzTg0TjCqE8LV5gLkXccCN23Q8eZ5HZ0nRA0feT0AWp8W7Zyp0p/xvQd4muJGRwnQ9FbqfMqghJabplufHB0O1Ey4Px2PUX6esA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqM+geLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqM+geLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7DC1F000E9;
	Thu, 25 Jun 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782405273;
	bh=4G/LNNM3b1qOUplHc09UGSAyOeAo6risik2UZldc5cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hqM+geLqLtKDwoPOmnGlO2HR7UprnhmjwnNic+QGVqzdjMYYukmI7R9J3ZlbCZHp7
	 jRT/oKg0HSN59NQxPPvSj5FjNTjI9kXZAky9dTz9GivTeu+g6dn4BHdlgAvCMqZHpO
	 xz3babkj8FJhZ1Zy0jneHq1qubU9o2ZROWVeuyp6FfMMn4L9sFkdeIcpNG55Gx+W2n
	 H+Z2PaCnl5iBcEG9Iq9LqehHdJjKOVGcwBu6dMesbUWAtcX2dEJ0J+8pd+Bn/MvXTQ
	 Xy1FkfPRszFXjTcywC06S7EZ1vCUtlqRJSgOLJOUqvRf22SXFpSWe1b+ZP7V4jKblL
	 xOQYjrptDfBvw==
Date: Thu, 25 Jun 2026 17:34:28 +0100
From: Conor Dooley <conor@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com, dongxuyang@eswincomputing.com
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260625-koala-dedicator-96bd3057cf48@spud>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061147.1631-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3lS29/ShfriVpN9k"
Content-Disposition: inline
In-Reply-To: <20260625061147.1631-1-hehuan1@eswincomputing.com>


--3lS29/ShfriVpN9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3lS29/ShfriVpN9k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1YlAAKCRB4tDGHoIJi
0uV2AQDAPqTMDCyZZXKg5nEtT4hV/Ay+5GSNwwpMf3sXlpRKrAD+OZ1q0Rf1kP/G
LIHn6CDZjB3hAcU0yy5MmB7afhU+LQk=
=t2nx
-----END PGP SIGNATURE-----

--3lS29/ShfriVpN9k--
