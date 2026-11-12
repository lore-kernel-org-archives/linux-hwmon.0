Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480695;
	b=lP6e5n+ionOMBxWq4mz+h/W9cRjjk8cmbKO9rTjmFx34+1+WSaOsEktpMr3R+sqg+Lcg
	 CdjgjJk0mnmLgqb++gYVFoZP+RiQYpD7oJ27gLJVm4DUIsuKlajdPb8UEllau5NJ5C1Gt
	 iAMuGOEigV/fxRcfvmLAD5TLVJNbs957jbn9Sq89G06wEwMlG/l4C2EOE5eXQW/pLU6QS
	 9aJHFYQRTjQlno+MBzSgdF++0zDzku4+hIbG8jbOXNrHPLqWAxXQbrFaDIvvZdUBBD+eA
	 wm1pzZzmLoMf4HG3DKfBbcUtzc9yOiwUuSdXT0cdkkp6jhXQ/bna5V4C9+UDjQ2VxtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ejEK37JAi9bafNpazn77ePmP+dJqOQAro7/bKPfQcYU=;
	b=L+BwsW7d0DMCwx/FlcyWdaWeUH3J0grWMe3LKU/G/jlG9yF/MutXdNezdl5oj5g3ZDWU
	 +RvxnxmqZkogvK+lGhxI0xFJKr2Ua5enuwgBn1uBndfS5T6tvxiMSQmcWD4f5Pj6CMgHH
	 mED56twkUN/rzpUp0NHRxBJ4y3tQnXRxGJ/YDFKGGEHQsOVvx7ckGfbYxSjpkKZ26deht
	 fwdeSNcJS6iTIhMvH8rVPyLlG37RgsUfh8HtmWGsVYSoozsUzsmdQCPOv38RYhihgoYFa
	 5dFK9IwcbP4Dv7wUuerQCv1J2bNFcc4OchiwlrbWT9B3+ebC8Rbqk7lq5FlX2C7sNzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iCwWk6bf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724F606A32E;
	Thu, 12 Nov 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iCwWk6bf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618301F00A06;
	Thu, 12 Nov 2026 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480695;
	bh=ejEK37JAi9bafNpazn77ePmP+dJqOQAro7/bKPfQcYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCwWk6bfgqhbBenrCDuIsqeXD1KJBAYB3NDv/OYZDGktuOqMgVNwDn/vqYpqp4JMm
	 jHMhYA9p9lbu6QWwDu1s9AFSYAr3I8rZlVtCHxuNXP8IM8YYoG6c8eh2weet72FURs
	 /9BGpJffjZq1KqRStv45dxkOQYHyioYFvuLdkjVkeHdycrerJr18Uxesi3sHMtZVYP
	 cCPMKaGLeka8MXsgR1DFbdgLjQqaFRzyfOTR7Bx437wsxFDh3CrVCy20vnMe/ZdK/s
	 9B9D0GLdSbRV3/BPDRLHu4LpXe4CVvWa/qJQNhosjY4ec74b7JkUclxJsOuZa02qX1
	 63Mg/4G85JHMA==
Date: Thu, 12 Nov 2026 11:51:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Message-ID: <20261112-misty-beautiful-caribou-c9bbea@quoll>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261109-staging-ltc4284-v2-1-14a270a38f7b@analog.com>

On Mon, Nov 09, 2026 at 08:56:17AM +0800, Alexis Czezar Torreno wrote:
> The LTC4284 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
>=20
> Note that this device has a MODE pin that is determined by differing
> voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
> controlled via software or GPIO.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 56 ++++++++++++++++=
++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> index 05e2132ad4d8621ab76ee89aa166c131fed08e85..ca62e76f23f1e32df157f1382=
98a4650493b3f08 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> @@ -10,22 +10,42 @@ maintainers:
>    - Nuno S=C3=A1 <nuno.sa@analog.com>
> =20
>  description: |
> -  The LTC4283 negative voltage hot swap controller drives an external N-=
channel
> -  MOSFET to allow a board to be safely inserted and removed from a live
> -  backplane.
> +  The LTC4283 and LTC4284 are negative voltage hot swap controllers that=
 drive
> +  external N-channel MOSFETs to allow a board to be safely inserted and =
removed
> +  from a live backplane.
> +
> +  The LTC4284 features dual-gate drivers with four operating modes (sing=
le
> +  driver, parallel, high stress staged start, and low stress staged star=
t)
> +  configured via the hardware MODE pin. The MODE pin must be connected t=
o the
> +  appropriate voltage level (VEE, VIN, INTVCC, or left open) and cannot =
be
> +  controlled via software or GPIO.
> =20
>    https://www.analog.com/media/en/technical-documentation/data-sheets/lt=
c4283.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/lt=
c4284.pdf
> =20
>  properties:
>    compatible:
>      enum:
>        - adi,ltc4283
> +      - adi,ltc4284
> =20
>    reg:
>      maxItems: 1
> =20
>    adi,rsense-nano-ohms:
> -    description: Value of the sense resistor.
> +    description:
> +      Value of the sense resistor. For LTC4283, this is the resistor con=
nected
> +      between SENSE+/SENSE- pins. For LTC4284, this is the resistor conn=
ected
> +      between SENSE1+/SENSE1- pins.
> +
> +  adi,rsense2-nano-ohms:
> +    description:
> +      Value of the SENSE2 current sense resistor. This resistor is conne=
cted
> +      between SENSE2+ and SENSE2- pins.
> +
> +  adi,radc-nano-ohms:
> +    description:
> +      Value of the effective resistance seen by the ADC+/ADC- pins.

These two properties are not required by the device? Is there a default
in such case?

Best regards,
Krzysztof

