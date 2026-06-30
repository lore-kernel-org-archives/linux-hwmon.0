Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5792D1F44;
	Tue, 30 Jun 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805292; cv=none; b=k6ibddwTfsbp95Ve4w1oBTg8cPcQyOHVSiKZqD8Ym9YK8M9t6WfhyDfh93zGnV4PMo9OSP3Gh6iW6QWnDMRIUOlxPvW7SWjF61zHKsyCDt2jIlBGnHiSQcfwr+iNVuay/wZT2+/odMtb0fsmZrBI4aiXD38Hn6O28ocJfetO7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805292; c=relaxed/simple;
	bh=TSeUvhJc/SxQbmUZvgg6rKRJJo9tkADZw0HkQPAR8Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYjZVmt0vjMn+9NfMZ8HvK+yObLhFHywCIejB6nww4fiDgEUbst+xyKMukylNIK41BkE7nYjkNLx3qqhRmuYobO7iVibDkiG0nIRqmLG2sT3Z7ie+FlzW2QIkjJjimnu4NTlQc20QK3idbKBUZnRAC0dQMDD1vJjgif0cl3lkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDzB0XGt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDzB0XGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437F91F000E9;
	Tue, 30 Jun 2026 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805291;
	bh=p4v6x29nSpuxNReLynrMWU013CTxhtil1blRno+tZt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RDzB0XGtx2TgtC2YenaowPLr1gxDYXkKg4cIueKcLPQ6GEw04gFVB/oHFBGxhn3xM
	 KmkUhURoXJTe7wznScGB8IL9DiT8hJtfQCt11xsF7864oQdpxbgP5GRPrJNZ4DEFTW
	 meIXVchGFpFiATZstDjLZxo/1eIHYcvHi97Ip8kM084g+ix/EQ5b4vwHj4spB241T3
	 E6EtIrZD2PP7tR4QunFWQ553qysAerA8evADp3ICV+rSiVNX3NnhBBBoSr1YisksB3
	 fPDmt0iJLzj12lg6Eiy10ZCJQqWq2EgLao0jF+E5fU/aU/ugGBftyy2/hvfUNmtPHm
	 nr8zIRMYlevuA==
Date: Tue, 30 Jun 2026 09:41:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Message-ID: <20260630-gerbil-of-phenomenal-jest-4dce8b@quoll>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>

On Tue, Jun 30, 2026 at 10:46:47AM +0800, Alexis Czezar Torreno wrote:
> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index caedad40bc592c8489df235f02c6ff051070cb1e..b8ca8ec0446fae2a16484e5ff8f1bb563cdb2405 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -22,7 +22,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: adi,max20830
> +    oneOf:
> +      - const: adi,max20830
> +      - items:
> +          - enum:
> +              - adi,max20830c
> +              - adi,max20840c
> +          - const: adi,max20830  # Fallback compatible

Drop the comment, it is obvious. Can this be not a fallback compatible?


Best regards,
Krzysztof

