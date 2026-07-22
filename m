Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA0439F98;
	Wed, 22 Jul 2026 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742984; cv=none; b=dtpvYGDTfW8tD71KuENUrrJXRHwzfGddpumywuMTT0WDLAhM1p0mCnTCFnGpfCnWZ/UZJbEPqh69thVR2E1PWqrDDvrrQPV0qRdO98A/xQmIsBQ/X4B7fMOVtgTslH23SzO6BOtgy1zdQRx3bXXLm77kTm13Ptkq4MxOGhayCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742984; c=relaxed/simple;
	bh=gH9oTIkDUi6ZymYa/Q4BsoLbinumZr3nJuabrd1Nxfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKSzLFmHePrI/I975OhKpIomCUZCvToTXsqCKzaAPiWn8Aj3hXfs9f6H2n211W2BM9LKIer9phgX1oRZVZxzUP6WgaVUaW8GfJVTp67wXFjIXiPZQW20D/zk/2nVrpJ/kZjd9I6G3TDB0X1R6iufNMYvZPyLFtRUtULz8OSdbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCv1GBAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCv1GBAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A501F000E9;
	Wed, 22 Jul 2026 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742981;
	bh=butvujvBndFpKKMQ1c6EdjpFw8TENtp7O1iz7fjYWk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCv1GBAwA7ktd4tmCvh3ms4Z3uI2dFs7x65r8MtpdA+QEkZLKGaQUzuvKvSzKjXSF
	 zUrQF/17I/UlEtcpPxuOh/i+5cVJfGzbfqAtIwyHztS6oJ0ciRdvA/AzjWpEDIgaA6
	 yx6KpukDJJx05owa83hMjNgLE2/gplPAblGeVxn3GcHav04vdM5F+0AAMBnC6lrunP
	 aLl98TXoJN6X66+Fx0BQpogwJSybXdb+9ZIsFayANF2rTSahdS1eo7IoWCOqq4PzzT
	 9t1AKU7ZFkwaT+HGU0Cz6h7D1VDvOow4oU1n3Q3IWKLg6ztOKUfk/TVxSb5878Wi5a
	 YiayYYaVk2r2Q==
Date: Wed, 22 Jul 2026 12:56:19 -0500
From: Rob Herring <robh@kernel.org>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
Message-ID: <20260722175619.GA1301191-robh@kernel.org>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
 <CAJq09z4C2R5syGVtBtA2p6ER1XWRUwaVfEeL2LPvupR6xBe4cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJq09z4C2R5syGVtBtA2p6ER1XWRUwaVfEeL2LPvupR6xBe4cQ@mail.gmail.com>

On Thu, Jul 16, 2026 at 11:33:53PM -0300, Luiz Angelo Daros de Luca wrote:
> > +  "#cooling-cells":
> > +    const: 2
> > +    description: |
> > +      Cooling device exposing the 4 PWM channels.
> 
> Since "thermal/of: Support cooling device ID in cooling-spec", I could
> be 2 or 3. I don't know if I should use enum [2, 3] or just go
> directly to the new const: 3.
> My test device has only the 0 channel in use and 2 is fine for now.
> 
> Sashiko also asked to require #pwm-cells, but it would mean to
> implement a parser for that too. I don't know if it is worth it but I
> can do it if needed.

What does implement a parser mean? You can define the property now, but 
support it in a driver later.

Rob
