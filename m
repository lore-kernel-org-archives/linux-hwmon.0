Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF522D9E9;
	Sat,  8 Nov 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762603821; cv=none; b=WkqtH47lFoxSN8GIFcFPXrZ5HoR2+jAM63n0lbTyi0tcCXLQJnxVbOql2FDumH2g/NW4vGDIfOiDFAHbYc/q8rp6qVkpVegid2o2v6lBkk7T7SB9scj0nNia5PmkxlxhEB/L7bzVux9J+jZiYNJpEIi31cGuIBsNBaTpP0xByeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762603821; c=relaxed/simple;
	bh=eAKio00Sk3kDqL3mb1UU9bZ3AkD2lktcVGtMfQlCNRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nk04H1zvrRjsjPzWhwMe3bqzfmP+H3O47FvA5Wb71NOhrQho9dLEkKBswVPZoltdMRj5fOtPP4jA5cbz6a30Prv+xi3ha5l8k3xL4VBvGVEwiU1POS/AAX9gzBh//VAPg6OJn2S4C+3Fow/r3lKYloC1EV1KS++62RVHRsoMxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVN0ROYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVN0ROYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6CEC19422;
	Sat,  8 Nov 2025 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762603820;
	bh=eAKio00Sk3kDqL3mb1UU9bZ3AkD2lktcVGtMfQlCNRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVN0ROYlx45R0JCl30p26cUOlFNrYMhrbIAsm0peeE2Ut5R6Eow7sQQ95OZyuKwfB
	 BJloBg/uJ/E42Tf72kfWFgBIIK5W900Ea4+VpUjrGLdNFS/r/kM8ZMGziIocusD7sv
	 rYt9T2f7jukbEoX4XbuiR0tL2kWku2tKsjAd1UA+Xm9nQXRjwmIlIudcahTkasKv/2
	 1y5xlwW/VJAEsJuHIatkajK4TLVzplRPESfHMXtGhPgzvXwETrWedaGMeh1vPOOxt8
	 TAD4j6rgGArSU9ZAKKeD5ZXf7lLEhwm0BPpDW50E1T7BrjFmw9jJQjhWpxfjCt0aL1
	 fb1dPLgy8Jb7A==
Date: Sat, 8 Nov 2025 13:10:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Fitipower
Message-ID: <20251108-finicky-determined-mink-c22f39@kuoka>
References: <20251107-fp9931-submit-v1-0-aa7b79d9abb6@kemnade.info>
 <20251107-fp9931-submit-v1-1-aa7b79d9abb6@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-fp9931-submit-v1-1-aa7b79d9abb6@kemnade.info>

On Fri, Nov 07, 2025 at 09:06:44PM +0100, Andreas Kemnade wrote:
> Add Fitipower Integrated Technology Inc. to the vendor prefixes.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d1882009ba..506b146e9bd0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -570,6 +570,8 @@ patternProperties:
>      description: Foxconn Industrial Internet
>    "^firefly,.*":
>      description: Firefly
> +  "^fiti,.*":

fitipower, just like domain name.

Best regards,
Krzysztof

