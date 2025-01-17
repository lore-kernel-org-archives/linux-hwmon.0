Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFA82890;
	Fri, 17 Jan 2025 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102657; cv=none; b=I2DfeSNCkvMbaYICZXmuOeKchK1P+p1iwuY6sFSh2K0uenCiQUtIxcYX19YHUdkCHVzxzA56gBf6FYp9e299wg4UHZJG948K6t0gHioBvIs7f9jCF3O67Csf2oaCutqVubhOafWgNDtIcyt9T46pY/HbkMtx3au6NatFe1PrHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102657; c=relaxed/simple;
	bh=2UtljXZTNljFm0IjmFEyVoIjU7dljBpQ5XDHRVlupyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIyKAFWPaCzt3CjJ9bVKFVz4fquGAXDQ4Jy4PrFSi1IE0gaGB1G+Yhg6P456/xJef5iOXU4DjHXpgyhas9YoatYtOCOAvV8ufxkCIDkZ8zBNy7ITg2vxSEb/E2wq7067lUlo6ABlNztXkHlZ+U+8U3KPtxQXRnncoRDKHbDnQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5Hz2aT8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5Hz2aT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D69C4CEDD;
	Fri, 17 Jan 2025 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737102656;
	bh=2UtljXZTNljFm0IjmFEyVoIjU7dljBpQ5XDHRVlupyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5Hz2aT8+iVMXytCA7YlB3wighnXP4RVRo35Ap9zoRsbQ84C4EoAslSG8/KBvznba
	 LVmlOaN6d66wXJ6Dr2xgSub15vyzXGMMaWPr0Ncj73HOAOqkyrWPKwuM7a0bITl5W6
	 gyCg8O1JK6+1cjszgYrHR2MooddtG5htNXmJpi4xePWg06oO4GxymQOV56mOcvzvbq
	 WDaghAMl+4LQiQbtG/htARK0MG6Sg1TQSfXl1RBgP1CpDGQWWS+t0jFDm3sgfHaaId
	 qsmLc+vuoqoUwH/L2Mr5QXTx8zqRkxKfCjqrEEWE4rn0qYGBd0oU3asgyjllgMpDY7
	 51WlK3s4U5gnA==
Date: Fri, 17 Jan 2025 09:30:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net, 
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Message-ID: <20250117-kind-poodle-of-economy-c0e7c8@krzk-bin>
References: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
 <20250116085939.1235598-2-leo.yang.sy0@gmail.com>
 <20250116-athletic-prehistoric-worm-36ffcb@krzk-bin>
 <CAAfUjZGSgdQYwC24S__EO13-q1HQWVkUP7oDgJm-=AeeXgr1DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAAfUjZGSgdQYwC24S__EO13-q1HQWVkUP7oDgJm-=AeeXgr1DQ@mail.gmail.com>

On Thu, Jan 16, 2025 at 09:52:08PM +0800, Leo Yang wrote:
> Hi Krzysztof,
>=20
> On Thu, Jan 16, 2025 at 6:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > > +      This value will be used to calculate the Current_LSB and curre=
nt/power
> > > +      coefficient for the pmbus and to calibrate the IC.
> > > +    minimum: 32768
> > > +    maximum: 4294967295
> >
> > Uh, are these real values measurable by the device? The last one looks
> > like UINT_MAX.
>=20
> According to the spec I don't see a definition of the upper limit of the
> current measurement, it all depends on how low the shunt resistance can
> be, so I'll use the upper limit of the u32 as the maximum for now, even
> though it's unlikely that this number will be present in the actual circu=
it.
>=20
> >
> > > +    default: 32768000
> >
> > Default is 32 A? For what applications is this sensor used?
> >
>=20
> According to spec 8.2.2.1 Programming the Calibration Register example,
> a Current_LSB with a maximum expected current of 15A is approximately
> 457.7uA.
> The example shows that a Current_LSB of 500 or 1000uA/bit can be used.
> So I choose 1000uA as the default value here, this value corresponds to
> the expected maximum current which is 32A (with some loss of accuracy to
>  have a larger measurement range), and yes maybe the user doesn't
> need such a large current, so the accuracy-sensitive use of the scene
> can be adjusted according to the actual measurement range of the
> expected maximum current, I'm trying to retain some flexibility for the
> user.
>

Datasheet indeed does not describe actual limits, expect 5 mA on the
pin, but that depends on shunt resistor, so fine with me:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

