Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88242A9C;
	Thu,  7 Dec 2023 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsPhzS8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B9DC433C8;
	Thu,  7 Dec 2023 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701979527;
	bh=ZuLoiw1NYaGVr+kvGugUqnXifo1hF2+hifnZiWIiLTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsPhzS8oX8ysFJbnZcJ+Sln6ssoSMvSW4666hoJMvzrpoBYgDKy876U+qPa+DO7lc
	 wSYZ2KxMCbuRxto9EmMWEGrQEExy28T8b6C50EOyaxdadUImJ+1BGr9JB3vfrqRN2x
	 6Nz77vSGqPDje88XjsYkH1VqdjkyOQi5NZLMNch7FlFjM50GHoQdfBZSZBY5YXtCS7
	 hxdMGu+amX57xLlXgDWRBZa36KwIguVoXe49LdnuPcmbQ7CP5Zgm3d1ZymOAsmkUgM
	 K1Fbdzlq4lXU6eQzoZsx+h1Q0J9ZJiUyF9P8oCc0EPPA4LFRW2NV08KZ7RriIpli9r
	 7h4Hqx9UJZX/g==
Date: Thu, 7 Dec 2023 20:05:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/5] hwmon: Add support for Amphenol ChipCap 2
Message-ID: <04475f91-bdce-4677-894c-74c2bb8233d9@sirena.org.uk>
References: <20231020-topic-chipcap2-v3-0-5b3bb50a5f0b@gmail.com>
 <20231020-topic-chipcap2-v3-5-5b3bb50a5f0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="skxAi3lmk/Z+j09s"
Content-Disposition: inline
In-Reply-To: <20231020-topic-chipcap2-v3-5-5b3bb50a5f0b@gmail.com>
X-Cookie: Two is company, three is an orgy.


--skxAi3lmk/Z+j09s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 08:44:55PM +0100, Javier Carrasco wrote:

> +       if (regulator_is_enabled(data->regulator)) {
> +               ret = regulator_disable(data->regulator);
> +               if (ret < 0)
> +                       return ret;
> +
> +               msleep(CC2_POWER_CYCLE_MS); /* ensure a clean power cycle */
> +       }
> +
> +       ret = regulator_enable(data->regulator);
> +       if (ret < 0)
> +               return ret;

This is very buggy.  A consumer should only disable a regulator if it
itself enabled that regulator (or it *requires* an exclusive regulator
which isn't a good fit here), and there's no guarantee that disabling a
regulator will actually result in a power off.  Either the board might
not physically or through constraints permit the state to change or
another user may have enabled the regulator.  The driver needs to keep
track of if it enabled the regulator and only disable it as many times
as it enabled it.

For this usage with trying to bounce the power of the regulator you can
keep track of the actual power state of the supply by listening to
notifications, and should possibly just keep the regulator disabled when
it's not actively in use (if no alarm is active or measurement in
progress?).

> +	data->regulator = devm_regulator_get_optional(dev, "vdd");

Does the device *really* work without power?  The datasheet appears to
suggest that the device has a non-optional supply Vdd

   https://f.hubspotusercontent40.net/hubfs/9035299/Documents/AAS-916-127J-Telaire-ChipCap2-022118-web.pdf

(there's also a Vcore pin but that appears to be for connecting a
decoupling capacitor rather than a supply).

In general _optional() should only be used for supplies which may be
physically absent.

--skxAi3lmk/Z+j09s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyJYAACgkQJNaLcl1U
h9ATSwf/VyDbhFanh416hXAS3NUyE1fY08GL8xlMZYwm6c+DHomBU3JouF6321Vc
l3r+wim6gRhaVqclmbACV9Tew2hRz3UpOWzWt02GcYoR6UmMz/AvVMopvPVtIZdW
ew+dcD+8L8NC1Ivl6chszVD01u0CHHPFdmVlvkASkKVhKXKtC3DdZm3E4aopZSgf
PSS1iGmWasrxCpNgfet5ea/TIdlQlMEWwGkXrqMbJXEXO5VazmNMAhOsnwG2pB2e
1gdcZKJtFRPl3D3HJ/BruMY0IcZAFMAs5F0MnR6Oy04EWxi8tq7AWsC1SpYbAiZ3
mdJ8HCV04qAIPFr1iWDLBmyWvW1hAw==
=hTAC
-----END PGP SIGNATURE-----

--skxAi3lmk/Z+j09s--
