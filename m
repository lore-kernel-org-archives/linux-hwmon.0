Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A0D1A9F87;
	Mon, 15 Jun 2026 16:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541403; cv=none; b=ShlJXfxiLTdqlKE8E1gV0mGCsIVn6bGVQgnmtiJvFRgbsLIlg+kTeuGOlWlHcFAtH9bZ4HKNFWxv/1yPkm8u+kpVFox89yFMvoaVRft57P5NIEf98OKqxph7I/KhpZDLiCq1oa3UfEY85No4dj+Kok5MmMvkNt1holoEwhuPqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541403; c=relaxed/simple;
	bh=9DrcVuylEd+H/xgB14yF5cBCzN/1YAkTM3ytAG3WakA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAkknnDvmwkitr/DMkfSVIXqer2ERoukyNxEFMdyS3Dt19/ZwERAsAnT6hxLEM3J3j65CyjJfaZNCV9u10shjksNk3vrsAsM+UG3WjaRZXCfFTxG8R6g/An/SCMerWQv3K9Sn1ZBFMUstgO8UPd3oOF88vulfYxcOZ2DgfzCK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTDCEIL5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTDCEIL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F19A1F000E9;
	Mon, 15 Jun 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541402;
	bh=9DrcVuylEd+H/xgB14yF5cBCzN/1YAkTM3ytAG3WakA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iTDCEIL5V2kI/Z6uCR4CdHR0NAxvroPPThPk8YDC2MkME/6fzzh6CdTuBjtW/CJtE
	 DSSXSHPv3d7MlhyJvVESSxga5hpS+yV8KS3+Yothw5lKWf0P6vwuDdKND/ld2ebihE
	 vBPvOv7LJe9jMcWO6p8cIdLocW5ox1R8WwOGBsIy1P/LeP68mF0Bq77rz1nnJLAFmG
	 yojl4E91vLNjlJbgy2gPeUAAPIcHNJp/2Awn8+g0FCocXVHVNJHMNq0L8hYmEXigcE
	 zaKQt45AVS7bdfYPl3KrOmxN1MIK2HuabVkC51kbIlwmwRmIpGaNY55HTNPJqn+HT9
	 l0/9/jErGKNzQ==
Date: Mon, 15 Jun 2026 17:36:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Message-ID: <20260615-cycling-striking-559d1ea5903f@spud>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
 <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZBNu9KXSowoLs9u"
Content-Disposition: inline
In-Reply-To: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>


--SZBNu9KXSowoLs9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SZBNu9KXSowoLs9u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAqFgAKCRB4tDGHoIJi
0mRmAQCf7YIo7/JjIQdRMujXbwBaJvVgW41xnxvm/FxN5oTbbQD/R2dtznhMp5Wc
S7BGSKJDKWEdgnP9t5ZUq9cXYG5vtAc=
=TMEw
-----END PGP SIGNATURE-----

--SZBNu9KXSowoLs9u--
