Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3DB38B;
	Mon,  4 Dec 2023 00:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u96FDR0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA749C433C8;
	Mon,  4 Dec 2023 00:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701650016;
	bh=FBE+wmFVYShGVCpLx7uHDO2IcJ2dlGbSbjadaW8ZRD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u96FDR0H+oO30Gc6/kZVY5SGUwkV6sw5vWhbObLWwBqYCE/geVOiXbyDASSVQmIN1
	 nCFZkNdMh+LPpY0qBVShREbVRyKOIvQ2PG31xvfywKzBCwyx45261wGJ1d/WCrA/8P
	 4ZdjbumvabO0BrWl2tzSPk4dS4YfQjARiUde2RdzreOZutCAGkOujRRvm1ych08Y8n
	 eMhEMRL1e0Sp40IcKUzR9pjraVsyxMuf/1qdAjutoNpbZrLqYiD0BHSIkr5bi54Nhv
	 SzZfMZFrfbP12OkE7DFCnz68i0QnrZR349Vf7oH5K4LQRNEgk1zHHAH6SCSxscDDpj
	 8eOXIeobNpbzA==
Date: Mon, 4 Dec 2023 00:33:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: Increase max number of io-channels
Message-ID: <20231204-nag-silenced-8261c06e84e4@spud>
References: <5110a313a5ce52ce6d7b5cb6b08368d42063dc30.1701419691.git.michal.simek@amd.com>
 <3d90a57d-0149-4d4b-8ffc-af26a87132a3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J39E23deplzer59T"
Content-Disposition: inline
In-Reply-To: <3d90a57d-0149-4d4b-8ffc-af26a87132a3@roeck-us.net>


--J39E23deplzer59T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 09:15:40AM -0800, Guenter Roeck wrote:
> On Fri, Dec 01, 2023 at 09:35:00AM +0100, Michal Simek wrote:
> > The Analog Monitoring System (AMS) defines 51 channels
> > (Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml)
> > that's why increase number to 51.
> >=20
> > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Applied to hwmon-next. If there are still concerns about the commit messa=
ge
> please let me know and I'll drop it until resolved.

You're good. I did ack the v1 wording even if I didn't like it, didn't
feel it was worth one resend, definitely not requesting _two_ resends.

--J39E23deplzer59T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW0eWAAKCRB4tDGHoIJi
0kpHAPkBm6qXx16nMSZzzsahoA4H10KUF5tXA13dbIb63fKuCQEAzEjWKeOZnavV
T44EEA8kt5AfgkWCSaHxhc9RTjcYcAM=
=Jkdr
-----END PGP SIGNATURE-----

--J39E23deplzer59T--
