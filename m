Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475EDC8EA;
	Fri,  1 Dec 2023 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gopnhae7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36824C433C7;
	Fri,  1 Dec 2023 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701446881;
	bh=d/08iXOBweGKjvzeBse92aGDvcp1s3i+5SpPnyoDhjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gopnhae7f4ZBBzXjZmJ8RtunpsSQFs9yEjMom25qdT+I6mp9n8Cre0bGN9lRC4RtK
	 JF5hmjUnbaPro2a0HXGOkqnMCIsyX1SK1LBfhwbSviErdouy7rBviUHEBLeEFSTijz
	 qIQwEhRs3f5lsjSnz98tvgaz/pBxfBd5LcVd4IXdHMSkLOpZhEwQCQmNZAaxOm07XO
	 Cj0QB9QdPDXie0P2WM5tyEwsQA2ZPNQG5VdUm8Rmmyin8szu/P46/hhhctgzVwoDU/
	 B+g+KUS1qyONU7mEcTk48gGEoyIpXIEpEs1GvuMdABspvxumgAJgi7GZ4h5ZBzSh4K
	 Cdz4c6b8vP9Kg==
Date: Fri, 1 Dec 2023 16:07:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Increase max number of io-channels
Message-ID: <20231201-spousal-outage-c8c5ec1fca80@spud>
References: <441d9babc7042892350a58ba4300df4761876ae3.1701334008.git.michal.simek@amd.com>
 <20231130-power-rubbed-fbf64a8c6978@spud>
 <074cb071-2a3d-4c9b-89ba-d215a3624b6b@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="089BzLmiPUjI3fx5"
Content-Disposition: inline
In-Reply-To: <074cb071-2a3d-4c9b-89ba-d215a3624b6b@amd.com>


--089BzLmiPUjI3fx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 09:35:27AM +0100, Michal Simek wrote:
>=20
>=20
> On 11/30/23 15:58, Conor Dooley wrote:
> > On Thu, Nov 30, 2023 at 09:46:54AM +0100, Michal Simek wrote:
> > > arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts is defining 30 chan=
nels
> > > that's why increase it.
> > > But AMS binding defines 51 channels
> > > Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
> > > that's why increase number to 51.
> >=20
> > Please write commit messages for bindings in terms of how they relate to
> > some hardware. In this case I think it would be sufficient to say that
> > the Analog Monitoring system has 51 channels, the opening sentence about
> > the dts as justification provides no actionable information.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> v2 sent.

I wasn't requesting a v2 FWIW. "$file uses 30 channels" rather than
rephrasing it in terms of the hardware actually having 51 channels just
annoyed me, that's all.

--089BzLmiPUjI3fx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoE3AAKCRB4tDGHoIJi
0htzAP0cOVLgxVE33YuXQA6ip9kEABi2FUj1VukVCiHIHTK77QEAr7zoWm8Mc4YC
DSRCWd6uHwdNq5vULwzOo6IThJj63ws=
=G3fr
-----END PGP SIGNATURE-----

--089BzLmiPUjI3fx5--
