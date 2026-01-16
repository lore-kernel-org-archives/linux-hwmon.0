Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9420E334;
	Fri, 16 Jan 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548152; cv=none; b=LLmbR/7akW2hZND+nxwCzV7WpI+AI4JzrG0bWPvyLhkXXaAC5G9Tf6hjMZmYdGB4Cdj3hwXxJkZLk9SipXG3Lu7mcFwHxFDoMljiWrwMGHibFYqa7qx/HR5N7LkFNK8MZJ84uvr61c1s767q/3lApo6gTli2cXesZ+xmSGvtF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548152; c=relaxed/simple;
	bh=e5o2+jbPlcfX9buN533fjtdFmJQ5bod4+MERKRJ/slw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awRxQn4faJgQz64R01yeWrW8mKC8lxQwXC2vPKYBcQ3vtnWxeOZy7kgJwLJKHOw/L9BIWQ4ARyhfhKpZFDtumM1SM10Ljw23K9kqcIHlsXgbbShiT1nWKHIBAJg9/Qqh0btIhWkTbGSZA1VnhTAEnJSqHkquZ8gJ5u79yQ5Fsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQtdvaAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQtdvaAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEA0C19421;
	Fri, 16 Jan 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768548150;
	bh=e5o2+jbPlcfX9buN533fjtdFmJQ5bod4+MERKRJ/slw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQtdvaAEtBX/a5wPl+xkkG++oKal0jyRHjXXuj/J4lpwLOdN6Uao7EwPApXZv7FKu
	 e+UrMe54NIlPCdI5JMbpPDUCTx2gyfjHhM+hAjbgpa706mgYYA4qQjnpPF7tLi6R0n
	 PRJ46vyi9+3LOM7uvPJuqWz1VfANsQRg98b3y9hKZ2lKn7lMXJwQjTJCYxAGf07xxe
	 XTiWaueRblR1QXUM8ALbJKzqcewOoo1ArFfe+Fac3zaOczWUDk97vlIRC2En+nO71r
	 /Ug1glVHg+O09osWR8d0dDnoNl8IIY6zejWC4OLmP/xFXSB37wb1Pz5NQ99QDmZt3P
	 YbkFOecKpE1kA==
Message-ID: <21d080bf-8938-42ea-8870-f9959c332b18@kernel.org>
Date: Fri, 16 Jan 2026 08:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux@roeck-us.net,
 corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com, vikash.bansal@nxp.com
References: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2026 12:14, Mayank Mahajan wrote:
> Document the NXP P3T1035 and P3T2030 compatibles in TMP108.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
> ---
> V1 -> V2:
> - No changes in v2.
> V2 -> V3:
> - Add P3T1035 fallback for P3T2030 as they are functionally identical.
> - Add comment in the description explaining the use of P3T2030.
> 
>  .../devicetree/bindings/hwmon/ti,tmp108.yaml  | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> index a6f9319e068d..1f540c623de6 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> @@ -4,27 +4,35 @@
>  $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> -title: TMP108/P3T1085(NXP) temperature sensor
> +title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
> 
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
> 
>  description: |
> -  The TMP108/P3T1085(NXP) is a digital-output temperature sensor with a
> -  dynamically-programmable limit window, and under- and overtemperature
> -  alert functions.
> +  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
> +  output temperature sensor with a dynamically-programmable limit window,
> +  and under- and over-temperature alert functions.
> 
> -  P3T1085(NXP) support I3C.
> +  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
> 
>    Datasheets:
>      https://www.ti.com/product/TMP108
>      https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
> +    https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
> +
> +  P3T2030 is functionally identical to P3T1035. Hence, device tree nodes that
> +  use the P3T2030 must provide a fallback compatible string of "nxp,p3t1035"

Drop the sentence. Schema already tells that. Never repeat the schema in
free text. It's like adding comments to code:

ptr = kzalloc()
/* Check for null pointer after allocation */
if (!ptr)
	return -ENOMEM

This is worse coding. Write concise, clearly readable code.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
