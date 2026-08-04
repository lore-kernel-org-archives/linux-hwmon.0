Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C342AF9B;
	Tue,  4 Aug 2026 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830379; cv=none; b=uvksBT3OIAUE0JAiZUumlh3K1vCbuz6xc0DVA27u7toZm1SkLG10kkDWF98/g9N7kYrfd+PQHSLewdWKKM5Jzrk6/tAIjVF9ExGaR89Fd4Qtgt/l1U5lx8hV1rlJHFYLwbJ5GwgKtvsdZt6TfvWr43fzZZo0HQtT/niqPcB7k0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830379; c=relaxed/simple;
	bh=lK1ZK2GRa7WC0bkFhaqPUlD5cPjnjg+/fPoqXINt0I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdegffBDp7O+PSLCzzrFpE24gJA1iQMCdXw8oJZ0MewceBouZEF8Vwvd/aOhDrw90rQmbBOOeCzjE1b6v3p7sBkvJd6XPkDsTZIELxnrHevbZXfQP5Cd8b3lLofwZlamN4sZp0RSMNilWMjRL6GzJOO2vAyfrg1tTGVQ03B7QDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQN19yCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQN19yCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495B31F000E9;
	Tue,  4 Aug 2026 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830378;
	bh=kOSCFR2WTsjcqPxRbG8blSMJ7zfgy9ZmjtfaUgRKJSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQN19yCrDNDico2QdOomHo+PU/EESHLGcWtnBaG/dZT3l8bIIjLAkaAZ6HzzZh6SL
	 oBqJPjILtY6Gr7LC5mXhasI+jYJLug9XmPcr8BasC2GOQnNjeYIwMd/xHa/wJmVm1x
	 nt+lVJJghsl7ZkSNTPTgK7zzAhZ4+5FsDRbrP3JXiqG73xuUo0++JMAC97pYWf0Mr7
	 KZ2eSLIiBFUCR/aq/SjKT3qxogZF6esJeM1fU+Q/uWq1ckiRk5xDyn/2fAMz7RVhv1
	 oA1aH7kN/DNnC+T4TQp7pyWMqmx7fvoA3j290ytEwXUQXaXpfXD3RPnrTzSAuEpKiZ
	 UH3/CO1/CnMAA==
Date: Tue, 4 Aug 2026 09:59:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp401: Add label property
Message-ID: <20260804-rapid-heavenly-tench-4fbbbb@quoll>
References: <20260730133058.14731-1-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730133058.14731-1-bruno.thomsen@gmail.com>

On Thu, Jul 30, 2026 at 03:30:57PM +0200, Bruno Thomsen wrote:
> Add support for an optional channel label property similar to other
> hwmon devices.

No, you need to provide reasons. Other bindings need properties per
channel, but yours do not, so you do not have a valid case.

> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> index 0e8ddf0ad789..345ab6203a54 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> @@ -30,6 +30,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':

Use consistent quotes.

> +    const: 0
> +
>    ti,extended-range-enable:
>      description:
>        When set, this sensor measures over extended temperature range.
> @@ -50,6 +56,26 @@ properties:
>      minimum: 0
>      maximum: 15
>  
> +patternProperties:
> +  "^channel@([0-2])$":
> +    type: object
> +    description: Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: The channel number. 0 is local channel, 1-2 are remote channels.
> +        items:
> +          minimum: 0
> +          maximum: 2
> +
> +      label:
> +        description: A descriptive name for this channel, like "ambient" or "psu".
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>  allOf:
>    - if:
>        properties:
> @@ -72,6 +98,16 @@ allOf:
>        properties:
>          ti,beta-compensation: false
>  
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: ti,tmp432
> +    then:
> +      properties:
> +        channel@2: false
> +
>  required:
>    - compatible
>    - reg
> @@ -102,3 +138,25 @@ examples:
>          ti,beta-compensation = <0x7>;
>        };
>      };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

No need for new example, just grow existing.

Best regards,
Krzysztof

