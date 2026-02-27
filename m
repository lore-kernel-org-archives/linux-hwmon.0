Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908535A3A4;
	Fri, 27 Feb 2026 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186010; cv=none; b=EVzYMUj7fpRZz9RI6+UrcYIXvT/eiMoAMGimJ9NWiK40wt3eIJjCy5S/5535yQu919HES9jQOOeK+ZWUSY9mCoDz9/m/tlMpVDErfiONQrODir6YGLSA4ItqDtx/XP8x/ywLqq5LiqbY6ZguY6yoSYSKSD5nL70f6L8AJmp/MLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186010; c=relaxed/simple;
	bh=HLcFWey9DSUCv86ZYg8BCuwo9lyJIVnXPQ6nUhzQ4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdb8XOcxav/vAtmFj9g1ZAgs4FmbO4WGHpg60LeQ7ReuWsrsSihlpmwzDjP7Sc5zHDz3Mk9ECfrS9OFWRke9TxS1MBQJbCqy62i/Th2hwro8fLqwKB7wqauO4KYjXLSJL81Mlsi6HLzjHRQfhfYRcwy1k+pXiXg8NFLG2htqq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg7iVEHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg7iVEHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB11C116C6;
	Fri, 27 Feb 2026 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772186010;
	bh=HLcFWey9DSUCv86ZYg8BCuwo9lyJIVnXPQ6nUhzQ4qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kg7iVEHOPHvLwQwLc9TJfYAzmZ4kf85QcRSKBvUk0sCfIL4RtXdWbng2q98TlF2Nb
	 OOgS94vhcYwdT9aYJJ1bzOV0a13ACFN/hbgUrah/ovwif/rFEMQiUNfPp3DpPXk4/8
	 7CxzbPALgmdfw6toMFWc3lWh+y6QbPyfl4y1Ngg8jPXFUC1jopaC1EWu47v6/TyC82
	 41giFDFZ9yhiGUStDBGJ4YOwqArK2oNlCEqBMC8QNlKywV6e/9QmlBom/h6e2HDItv
	 PBpM7WcqfC6EzDc6uIx3x/9WnGcilg9F4Vw6Of7f/vAINBsJXXZ6tLP/juDR/PXPhG
	 k4OXicN7tcsJg==
Date: Fri, 27 Feb 2026 10:53:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add DT schema for TI INA4230
Message-ID: <20260227-prudent-tunneling-mole-6dedf5@quoll>
References: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
 <20260225-ina4230-v1-1-92b1de981d46@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-ina4230-v1-1-92b1de981d46@flipper.net>

On Wed, Feb 25, 2026 at 01:29:11PM +0400, Alexey Charkov wrote:
> Add DT binding for TI INA4230, which is a 48V 4-channel 16-bit I2C-based
> current/voltage/power/energy monitor with alert function.
> 

A nit, subject: drop second/last, redundant "DT schema". The
"dt-bindings" prefix is already stating that this DT and this cannot be
non-schema.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> +patternProperties:
> +  "^input@[0-3]$":
> +    description: The node contains optional child nodes for four channels.
> +      Each child node describes the information of input source. Input channels
> +      default to enabled in the chip. Unless channels are explicitly disabled
> +      in device-tree, input channels will be enabled.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      reg:
> +        description: Must be 0, 1, 2 or 3, corresponding to the IN1, IN2, IN3
> +          or IN4 ports of the INA4230, respectively.
> +        enum: [ 0, 1, 2, 3 ]
> +
> +      label:
> +        description: name of the input source
> +
> +      shunt-resistor-micro-ohms:
> +        description: shunt resistor value in micro-Ohm
> +
> +      ti,maximum-expected-current-microamp:

Please add it also to the example at least to one node.

With these two fixes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

