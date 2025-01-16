Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1D11DD0F6;
	Thu, 16 Jan 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737024463; cv=none; b=fh2V/1arftxDVr0eelsCjHbyYG17ixUrgtwE4DifYki4ZdIBPDw23EBbJD9IlHf7JFHZz4LuvdsbXKe1FfIbACNGWG7PqhKeJNIJNYV/TpvRKN78ODOi1fh/H9L8P9QBFbs8rWxokStX3evkmX71XAE9F0sURRZrji6oxESUL00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737024463; c=relaxed/simple;
	bh=ilDkeiSqddEDGFF6NkICXKJLkSHM33cSzoQWYxrMggE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8qA25e/nm0NQXt9DXPgQTuSdjjrGMut9iXrqDW3Py87N3gkazH1q62kiw1EshuGdNeL4JYUy4noHDqNyCcjoES/De2IglkLVpnMcbN4+p2lW288iKj5YmGBHSyWoMwsZPHzzJEfiK6iqcZe5x0sOXK8yhh25Oegznv2u2KqYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIB7DlG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIB7DlG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8E8C4CED6;
	Thu, 16 Jan 2025 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737024461;
	bh=ilDkeiSqddEDGFF6NkICXKJLkSHM33cSzoQWYxrMggE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIB7DlG+f9CFw2eH7YkX29j3WCzW6iTyL1P2OtQYQVh1rBq95uMNSGoirmYRC7OQ0
	 EMW8/mbg/gSN7Hq5Ka1TSOAQzepfgsqtMpeUWw3SDv28x7XhhyyHxL5cFjOVQV52oN
	 BaRDH9yOqfbDUxYPyH2wJtDPZ2pdwohJIBMGkUNT/WwKVn8ijwgccJ7PLn0zWHd6+G
	 FsVCtijCEFI7vTmYIToT6EQyayrteRXia5U08ypI6YBcY6+xvUsV4RlTSKCN8pQFal
	 fU0AqzF409cK7LRlmSo64R4iojBY0TaKeYSzTrLXO7uhUNpztfel2qEixRoi81ux4G
	 RIBaHrTnvTlAA==
Date: Thu, 16 Jan 2025 11:47:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net, 
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Message-ID: <20250116-athletic-prehistoric-worm-36ffcb@krzk-bin>
References: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
 <20250116085939.1235598-2-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116085939.1235598-2-leo.yang.sy0@gmail.com>

On Thu, Jan 16, 2025 at 04:59:40PM +0800, Leo Yang wrote:
> Add TI INA233 Current and Power Monitor bindings.
> 
> Signed-off-by: Leo Yang <leo.yang.sy0@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/ti,ina2xx.yaml  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> index 05a9cb36cd82..7372e282765b 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> @@ -27,6 +27,7 @@ properties:
>        - ti,ina226
>        - ti,ina230
>        - ti,ina231
> +      - ti,ina233
>        - ti,ina237
>        - ti,ina238
>        - ti,ina260
> @@ -75,12 +76,41 @@ properties:
>        the alert polarity to active-high.
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  ti,maximum-expected-current-microamp:
> +    description: |
> +      This value indicates the maximum current in microamps that you can
> +      expect to measure with ina233 in your circuit.
> +
> +      This value will be used to calculate the Current_LSB and current/power
> +      coefficient for the pmbus and to calibrate the IC.
> +    minimum: 32768
> +    maximum: 4294967295

Uh, are these real values measurable by the device? The last one looks
like UINT_MAX.

> +    default: 32768000

Default is 32 A? For what applications is this sensor used?

Best regards,
Krzysztof

