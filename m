Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021B391E57;
	Wed, 17 Jun 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692130; cv=none; b=RXrZRWUc7dKOuV/XsfHWwxaqht+An1zWhv34oIaBza9t58fYdqee9h4KoD+LBLk5OO0r4oUCuoMxbs54enp7U3Ya9bQlFxDKuNYVXZUKV6qNEniRgaKRG3SnPKZdquFPpGKqnFA/VsOiDRoMAFHhN6ReEQVl/6rV1IwjLbBVaEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692130; c=relaxed/simple;
	bh=5k8uag/DR60dxMONiMjdt4pzA1sv9wk0gWocW6xlveo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqKgkmMWgL1w7iY0aZxj3Vi0EgjO6FyFCHx2kdk7SgSFyaAb1+QtwmEUVW9wGRm31goaVzRNQZBm/TjDsp9QF18c0HASgESjj0RwLSEBDDTCr3xmb8mc9Mm67EWzA8FamY+3v1G+BpUJRrc011+0Ql1L9OPhQXY9Lh47YqyN2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkXi8cs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkXi8cs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23ED11F00A3A;
	Wed, 17 Jun 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781692128;
	bh=IYjMPmkeWysVnxRBCqC3eUXQS1lopznfKYY7BzJZapk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GkXi8cs2eU2jXur9ik98QsXIQ7m69jJaTRhSPgzy/K6odxYa1W1gXZ6b1Tkebdkhw
	 q6CsCHohGt4XMMgeyMmw+ftYkb1haWB5WBFBTB6If41nMYeeuViHL7ZDgg6HapslBX
	 rAyQbF4RJ9TFGkU5T6QtjrV0Q3ndhDM9k2m0C+X9f/BW3oinbldU4HEFxSp4XAQ+D7
	 r0FGKs7immz9IVaJ0YhutBYJopmooTaxZnin9pKy/hYbYxqYpZr4xc1KkrykrNAoI2
	 r5SC1rsNoZ3pI0scrc1V97CQloaCCH/vTVf0bpR5fFLOQxAp+wJ/QP13I8c/MhLjS2
	 z7KMhULCqdp1w==
Date: Wed, 17 Jun 2026 12:28:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>, Charles Hsu <hsu.yungteng@gmail.com>, 
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Message-ID: <20260617-uptight-sexy-hippo-f4bc62@quoll>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>

On Tue, Jun 16, 2026 at 09:35:35AM +0300, Matti Vaittinen wrote:
 +
> +  Datasheets:
> +    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_switch/bd12780muv-lb-e.pdf
> +    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_switch/bd12780amuv-lb-e.pdf
> +
>  properties:
>    compatible:
> -    enum:
> -      - adi,adm1075
> -      - adi,adm1272
> -      - adi,adm1273
> -      - adi,adm1275
> -      - adi,adm1276
> -      - adi,adm1278
> -      - adi,adm1281
> -      - adi,adm1293
> -      - adi,adm1294
> -      - silergy,mc09c
> +    oneOf:
> +      - items:
> +          enum:


s/items/enum/, so:

oneOf:
  - enum:
  ....


> +            - adi,adm1075
> +            - adi,adm1272
> +            - adi,adm1273
> +            - adi,adm1275
> +            - adi,adm1276
> +            - adi,adm1278
> +            - adi,adm1281
> +            - adi,adm1293
> +            - adi,adm1294
> +            - rohm,bd12780
> +            - silergy,mc09c
> +
> +# Require BD12780 as a fall-back for BD12780A.

No need for the comment, schema is quite explicit.

> +      - items:
> +          - const: rohm,bd12780a
> +          - const: rohm,bd12780

Best regards,
Krzysztof

