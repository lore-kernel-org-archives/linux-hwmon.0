Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB737C912;
	Tue, 16 Jun 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625267; cv=none; b=ZWVkP2EtG7z1jeXeGZpAct/AwLkQJKIjO5pD8BO+J1biYnzitJyrlLD1THrwpczFP+UqGB6oAB7LIsdH3RM5Th7ZFQ6TjvgaEW3/6WPJ6ucU4pF8vJrMdSq/n7KPdLqZ5ICiAQI70wlktSU2wE7Ww/nmwxP52IaFHXuehvBPLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625267; c=relaxed/simple;
	bh=QBjVo2zzn1Kn7IGgiO7mxSw2ZUJvQWD1odSvlENLqsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIJ9tljdWAvHlFYB6ho0owJVqCdAoi6tYrpQjxnQVo+FDunRNpHkYX8XEXSWrwxn9YemV6kgtO0hXMtnlV46+qzJ1d+64HZMSoSqf3yKCF5IoxJTILkHK3uk790G+i8CNCjDCMkk6/6eRVtLFcPgLdvRBrzQY7RTJ6G0FNNkkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlZnatzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlZnatzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472161F00A3A;
	Tue, 16 Jun 2026 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625266;
	bh=QBjVo2zzn1Kn7IGgiO7mxSw2ZUJvQWD1odSvlENLqsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlZnatzGdCrMlHJbb+GpNWCeVvAEeeC/c9XoMO5xpXUky3VN4XloFbpON3+NaQS3f
	 XBn5j+tZ3owI66oV2Weteg/BpDnj69hLWE6eHYaJPBCclKuuP+JMr6EWO1UIXHXVuf
	 Ygqh1C1iX27mGV6X3ARAVF2nx3Y8DjqD5sem4EJa7ZkIaiN1kg7tSJgNsEoh0srAwj
	 s9qcRq+37qM2qyvcA7VkFikamycoH7bUWpi0kyw7PlEa1T4FAtODh2B+RkDDSlu8Xv
	 00t63bM0LoZaoXlfv5cIlVgy10qPnK/HFNh9Tr5CKnvHe3+FpMsuxou+wfdkPXex0n
	 T/2oxiujkwxAQ==
Date: Tue, 16 Jun 2026 16:54:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Message-ID: <20260616-evident-cactus-206a56be1a3a@spud>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GN06vLtt+WHGTz46"
Content-Disposition: inline
In-Reply-To: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>


--GN06vLtt+WHGTz46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--GN06vLtt+WHGTz46
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFxrAAKCRB4tDGHoIJi
0g0UAQCxBb9zT7Q/M3t88hubq/v0Sx42Phn9fxE8y3D5/zP6FwD/fF75pHKXAdCS
PBgg5vF1HnKLx6b07G/pGgm3aFy+xQk=
=7KBU
-----END PGP SIGNATURE-----

--GN06vLtt+WHGTz46--
