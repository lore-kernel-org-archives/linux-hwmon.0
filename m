Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB4197A7D;
	Fri, 26 Jun 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489492; cv=none; b=XcHPwWEeuTWfHW/69PKv1GhVk/FTllNFgIz0U0+P4pSDsQy8vtuyo+0GolMwUzyDzb8oCkaLNJsNWxXveQC1NEgChEWQiNeLlYZoS6Sxvv20OP58S9Tv47WJYfij4BZSy77CQ+U1230OgKJ4JZTSs0i4pIse6gvw0/2QCAZhEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489492; c=relaxed/simple;
	bh=ymf3FOIcf52a9TFTCpmPCM1+wemED8VnRlwLGS90/kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s95RIl2pup8yRIBbTeRROC6SjgVuGNyuTjLQkzKcw+CJAVXYJYZWn4xuldLLGg3aSuH8C+bqffp5iM5kiz3F3CKwoER1h0vpcDOjkhs+0HRCT1ipVz+UImhdUg3bbWt7IFor5VEUZKEhRBi6y9IScAjSdtKJqsocBxWehzPVd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCRFkOhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCRFkOhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADD31F000E9;
	Fri, 26 Jun 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489491;
	bh=ymf3FOIcf52a9TFTCpmPCM1+wemED8VnRlwLGS90/kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCRFkOhnowwx2y/atLdS8QLo4O7S3J0AhMvmVWurQswYfz79vAp5l1HqAyxGiTi+S
	 fCo1YpftNwhLf7mANb0W7CxrRz0NQqA9TCHX0BxxjRIOBMq26WoK30wcKUMNOPZJ+l
	 ULy7A5YXNyLpYj5c+gyy2eOCxXlvtpLfDBuDwO9zvS4JLCcGEI0BkYoSWHIFEMTyii
	 d3inOEckPc6dxVXj11WZE+oC2dGBx7mFyP/t/TJ2BW3Cmw3T+j72WQUJiIZqMLSp/s
	 djWHjTr+h3oKlhbDfQiezor1jL/rAfuOgBfQjNAkpdWBknNB8APyIaruHRhCBnXi48
	 Y2U1ZUueSVmAA==
Date: Fri, 26 Jun 2026 16:58:06 +0100
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
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Message-ID: <20260626-roundish-grievous-f3b39f640326@spud>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVC28uf/wP5JRN7e"
Content-Disposition: inline
In-Reply-To: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>


--SVC28uf/wP5JRN7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SVC28uf/wP5JRN7e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6hjgAKCRB4tDGHoIJi
0glXAP9OL2VeUZrRfSRVN5xODRkdi1MZHnPu/UC6PtnS1Fah6wEAs0WUvkHzPfbc
7+IwMlgHd8XdRn+xjdfPrykFX6zaqwo=
=OjYs
-----END PGP SIGNATURE-----

--SVC28uf/wP5JRN7e--
