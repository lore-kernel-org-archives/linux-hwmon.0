Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19B329E5D;
	Tue, 29 Sep 2026 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723879; cv=none; b=TYIbgi+XZRWoVN8Y1MxYErAsiJ/T2QmphL7qzxNooJ/I6r3N3iFW450J1q8KUVjy6jYg0QLBmpjw4JPx3/j4LlpcJTEzFe9563LWVjJNNLODVGoUP+Nj1EAKrQEYN0UskEBga3F6Q7eJYwgU3CVszoW8mw8R/AHDoIZ7LK+FWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723879; c=relaxed/simple;
	bh=70nE12KTTB13EOl62kfb2HSURgDHW2XhfDqo53FPB+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WYMVUqqZw0OkZ0GLHbaGUNNh9V98asOxCg41CczPwpK+NEeAARicntz50m02C0To5CHsv92yJ/dTaDnnxw9mZid1uMz3RhQ7wVXxbjkdh7P1p/8rM66G3OHf2oYiihvcaSVqdXJW8oSyCfagwl7oPcBAev4QXjxGdmnRuVUC6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzQxOO9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzQxOO9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B97D1F000FF;
	Tue, 29 Sep 2026 23:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790723877;
	bh=fXPI6Ln6DtYYhxBA2aZaFL0LDEt6dyideuA/6ut0S4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzQxOO9MzaYWyUQyE57Iu55JlQcw1j0DKtLyfiWXkSjGsWHNb+7wXWLh6Yg3QCC4O
	 3q8seSq6KgRemuBXEZruTE5NQqsO/RXf4YzfbrlOxmHFbw8rFXEqT1iBWBJudY7C8p
	 3ftzx+NRPCICMVkaxgTpeK5umf51M0UYtI27tVf0glJ2pdETg2TtxdPBAJXGONp/kL
	 +mopoqeFiXO5rnNsUZ/2+oWiMQJnQbKP5mLuGSSxaA4DJN9ZLEoGBIicDsoLA14sG9
	 ywXyO+jBNPktK6vWCmiI2Ovrtj0cE4ItTahvXlNtaM1Y1p9S9yMLCwC++KEPcqrkdK
	 rtOT4k/n518OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luna Hart" <lhart.opensource@witekio.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:17:56 +0000
Message-Id: <20260929231757.5B97D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: silent schema validation bypass due to invalid comp=
atible match
--

commit 6f785a9cad4f5ba27f5d71565ba1ca2b776da113
Author: Luna Hart <lhart.opensource@witekio.com>

dt-bindings: hwmon: Add TI TPS389004/TPS389006/TPS389008

Add a binding for the TI TPS389004, TPS389006, and TPS389008 I2C voltage
supervisors and monitors, which provide 4, 6, and 8 voltage inputs
respectively. Each input may be described by an optional child node,
containing additional properties including the label and ADC scaling factor.

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml b/=
Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
> new file mode 100644
> index 0000000000000..cdd74ddd03e74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,tps389004

[Severity: Medium]
Will this properly evaluate the compatible property?

In device tree bindings, dt-schema evaluates the compatible property as an
array of strings (for example, ["ti,tps389004"]). The const keyword strictly
checks for exact equivalence. Since a scalar string is not equivalent to an
array, this if condition will always evaluate to false.

Because of this, the hardware-specific constraints in the then block
restricting out-of-bounds voltage channels for the 4-channel variant are ne=
ver
applied, allowing invalid configurations to silently pass dt_binding_check.

Should this use contains: const: ti,tps389004 instead?

> +    then:
> +      patternProperties:
> +        "^vmon@[4-7]$": false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,tps389006

[Severity: Medium]
Is this block also affected by the same array matching syntax issue?

Just like the 4-channel variant above, this condition will fail to match the
compatible array, bypassing the channel restrictions for the TPS389006.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-lhart-dev-=
tps38900x-v1-0-7045c5894152@witekio.com?part=3D1
