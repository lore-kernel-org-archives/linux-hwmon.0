Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF813F5BC5;
	Fri, 11 Sep 2026 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116600; cv=none; b=fJ4mhgVEnZwAGq9kYX6rIPqOXkxBqRO0Y8C1Dbxte4nxRBm4AyMMLojugS3LC8I4sSH88WowN0wGftxnArJGa4h7LjqWRVvbx2e8zCymh71BGpPjmDHfpbVmZfW0OJwfhdDwDecMUrUjvLYA2d2OWxj0ArLiyWSMVRy9qACzNK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116600; c=relaxed/simple;
	bh=3NhHLWVmt+gs/rZOfVUr+KaH4csZME4/acqF82d4dAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4WcvLhVOHLkYtMYf7P2u1AjPmeVfhHzoVkc8YqcENX+FJiV45LwILCREWJEUyVPJ7nii57V0+VMStU4IT6prMGB/KXNnC8NDXUr9Gm3XO2c1YgRk/KBnNkap1Xvf0LpTxIMr0pZkcq98mgh3rcOiC8YiTqhVxz16eXFzIQQpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwQcgq3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwQcgq3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B9A1F000FF;
	Fri, 11 Sep 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116599;
	bh=c5wojoNR/9MT1OzH90KMZIuqpJeR8FtHDdJSM7U0YaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwQcgq3+m4OrOCr8xlerHt0z8cvtCfjiHsLlUTdsBLwuJ35w9T8NI+hL7ayt/rCr6
	 7O7eahn605Pq4tFYHAjPOU5cjyfoXufzc5dHDDXQspYefaSOedXZDScYJGc7oxnY5x
	 8Wf+E0gGXydz9s7avCnrhHzFRfUf3u470KoSO3MZtUcQhDS2qQz5MtgVwdMM1v7MrG
	 PDS1Q9NE6apivNOG2OPTo/Vbt8+mJINKTrizvYsOFM97aUIliTSrUjab5EH8wXo2Ie
	 +dgBv2wtixIh15eEi6x3lil4keXZhkld2xdXLRm6l/boxl9yRsMaeM4WfVWqLnE//W
	 xDJU0b0pUzmVg==
Date: Fri, 11 Sep 2026 10:49:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Colin Huang <colin.huang2@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Colin Huang <u8813345@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <20260911-placid-clever-lizard-de1258@quoll>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com>

On Thu, Sep 10, 2026 at 08:35:50PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> new file mode 100644
> index 000000000000..28eeb85f13df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

There is no blank line here. Do not come with own style (like your
version 1).

> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> +
> +maintainers:
> +  - Colin Huang <u8813345@gmail.com>
> +
> +description: |
> +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchronous
> +  buck regulator with a PMBus interface designed for industrial use.
> +
> +  Datasheet:
> +  https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,tda38725
> +      - infineon,tda38740

I don't see how you responded to Conor's feedback.

Best regards,
Krzysztof

