Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24AF2857EE;
	Mon, 15 Jun 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503731; cv=none; b=kusuLUneGKKYjogyozd7Nv+VNz8WQbAQVSMJCef/VktHEf101FiZ74wtcZpVUds/c6pFtvpvAgmwfGg0/KPeajUizbQAXwhtU9ZBfB/VwiWdYacgFcFcc03ZsDY37Eqs/4u1aN/EVbFByhaXaLXEVSW12d3ys3GgkwjFNjqx46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503731; c=relaxed/simple;
	bh=0Z5uG4/AOYNdvuGgb4y98kM0ToVrfsxjdgygj69Omj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm1U6zcZrR6WSHOwHetipO9eLA2Ov4nYg5EFne0menQTs7iCsUayOb2XdtKKwlwCXBBJrFJgTPWmLsnEWVcArAjUPMymd+dzw7Qk6iNGoS9+JatrxKvqpwWrB/yiKboS2J+RmmSAlmUmSgXLl4r3fsplG27mOJann73mvyZlqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3wCrQGe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3wCrQGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B991F000E9;
	Mon, 15 Jun 2026 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503730;
	bh=7zDyufU/kpnCdxmNNT0kkrOVtZuRP5VOwqnx/D+i3Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W3wCrQGe7EgJseUWLPHuKSiYGoong7fj0fJAsBQW2SRdCK3zAHUgn3PR8YVMLgJkO
	 k4pRA8Af7+uvrbqTbBDCNXnkEw1KWmqyemyVUCFYlf7gmvhRNZ0L5wK0rJt4oxnZIu
	 +XAubSSgSByObUP5x/ADEy56VYTFAS/8tjJk4C1//eV9aqaTVTw+nnAWJTLb4eKnp5
	 c+/S0NB+q9OvgDp1VVvD8mJcFBe+7BLBl9qOdM33+HE5o8tOA8ehdQv53Rxl894De3
	 4eExZ9bgH2LB60zijLJ8oshfQArpzY0/A1DhFiIx4Zi8uFLkkzEO8Kf62gWIMkO4GA
	 lG5/y0yn4pJGQ==
Date: Mon, 15 Jun 2026 08:08:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
	Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Message-ID: <20260615-invaluable-jade-lionfish-d66e17@quoll>
References: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
 <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>

On Mon, Jun 15, 2026 at 11:07:13AM +0800, Potin Lai wrote:
> Add a 'ti,current-limit' string property to configure the device's Current
> Limit (CL) behavior to "high" or "low".
> 
> LM25056 does not support setting the current limit via software, so
> disallow this property for it.

Then which device supports it? Your commit msg should explain WHY you
are doing this, not WHAT you are doing (unless that is not obvious). The
reason WHY is for some device. You just explainde WHY NOT doing that...

> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> index a20f140dc79a..53ee98e871ff 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> @@ -46,12 +46,30 @@ properties:
>  
>      additionalProperties: false
>  
> +  ti,current-limit:
> +    description: |
> +      Configure the current limit setting. When present, this property
> +      overrides the hardware setting of the physical CL pin by configuring
> +      the register.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - low
> +      - high

What is the meaning of low and high? Maybe these map to specific values?
Docs are saying 25 or 46 mV, so maybe there is no direct mapping. Anyway
commit msg could also explain that.

Best regards,
Krzysztof

