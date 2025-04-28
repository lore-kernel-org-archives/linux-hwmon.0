Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71C27A912
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Apr 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857300; cv=none; b=E5ZHXHMcMWYytwnWyG8dfVD07OFXmJ1ZrGI5tRRw4qnrWfsydKg+XiKPu2/dMtNZxB7evG0JSwuFwzILO/cCoRyTN4NbVuMr/P6e3NIoUpY9UsrLRS+bkAfVvBRyMmxHMemsopELrz1dWSzBQ32w+s+IIMCN+A+e/wCxf6iGjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857300; c=relaxed/simple;
	bh=VPZALAjR7Zdva25NLVz5KQEgfQ6d4QldoSci+gyc0ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXwaNSxnBLhWATf2nI4LzrRu7ECQtoFOD7ov+sst+9z9JHqT5zFZrEH8RF1Ls3jaKPnSj24xvc08dfaWvyfJtd5j1dddH381vp3yFbjSYWmDIOz4PC9xYMWt/if2QocBVQXy+ex9sx+rRyBUs5jgwQ9jFcs17c2ukG0t+p/gM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt6cOKoB; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xt6cOKoB"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e73120cc26fso3081646276.0
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Apr 2025 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857297; x=1746462097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=xt6cOKoB4XZo+QMlm4roWVyroBo4inqMuclDNyIjfBylXzBJa3EdRpbTeN6vxRWi17
         AWjY3rmJn7LOzcwpkIgaeznZyMb1+HpTqbRlovBmX9BfUeJX4zitu/suz3tsPW6oCyNZ
         /Zdqn70P8HHDa7s1E993EUv7lP4e8hQy7HIOsmN4rQp/n156vJrVevdBd53hne00SxZ3
         rST48bq48gpdS0v3Xh/gVsdOPzlrVvkWaUhBwec81wjhNpsPpwL0YZVjBh9U7pBMSaVX
         hQx5uv7xaf2ZWY22qChrO4upTYRfG2rJE2THQxHcApDvk0uAY4CgahwdAD4ymyDkVBDq
         CTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857297; x=1746462097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=WARg++/b9K1YAcQLqw+rz6i2lIdUlmrf3Pto7eMaVWcHL99zxTvZAtYWxc8Az3RQ3I
         nurCTZT2RvZwN/wfGeE0faWCIvDr74hP6dXh1COvSox0iKANMHIylI6Hgdf558rLDEGX
         SOwRQU4f7TLJyiCHibLx0IIURGhQt6OFQ5PswhDBkE6ZUZYxIzjVzT4jCsDNINGLO+sg
         aSLjU8ouwHOZfMCENIxb2yO5zdgnFLhILdCHbuFrAYYhp7gqtCl+r9mIN317gZLn51ay
         ri+3tn73I9Cy+YxtEWqH6CWC2jWQRfni2IgldgjNzpiRiLqswfw3wdhODtzR8oJtJtF3
         OMfg==
X-Forwarded-Encrypted: i=1; AJvYcCWOO4X86uXo8umIbknTdZPnWiLL4ixGy0pJOQwmtZgs6/OWrGf4ESvVGQp4Km/ndgEkaIedKIenVqkBig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzYbWdXplVm1mXlcBi245U4yk0r5JvsK9wQfh7Ra68mzOAWv2Y
	7aKNyXr3E+lnkWWI0JQ71Ypma+rVKX3tRsv9qd0IrLvn0CMwVHJfZqqBt6idOk5j2dEWKmNIRmB
	nEQkjXNpAgHw8LJMLbU9wsONVNzvSOEzE7uELeQ==
X-Gm-Gg: ASbGncv/4qYfIHsxQ25xTVl1VClK8Eh7PBo2W30O4dVM4TN0f1qTBWh4ip24AHBqSiD
	ruk39FoHRiqHqOAJ40bGZbpWUcMWoAwUP+R1p1iphxHg23F7+hrycG1aIXkJX+Rmho+7Xq4o5RU
	ss43fJ3U8+DR/5tHkhhNq2wtQ=
X-Google-Smtp-Source: AGHT+IF2+lLJogWYmJ9CklQNKtsYDG7mA++udTlmO/sYgtKfw1zcHF/zNyAnw+6seYbb5sOJx4PEl6rhupOOr/4EHRU=
X-Received: by 2002:a05:6902:15c1:b0:e6d:f0a6:4cd7 with SMTP id
 3f1490d57ef6-e7322febd09mr12474369276.0.1745857297087; Mon, 28 Apr 2025
 09:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413223507.46480-1-inochiama@gmail.com> <20250413223507.46480-8-inochiama@gmail.com>
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:01 +0200
X-Gm-Features: ATxdqUHo5zpHgBeVnQwujIcWP56iQkcuhTXqhu8H3yGRlHLlrSHxM1LpwpFg6CU
Message-ID: <CAPDyKFrM32TVAHzSoMvmO_ZW2Ax=RQmH_7KqSGgqXTOc20UnLA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 00:36, Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
>
> Add compatible string for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..5fb347167004 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> --
> 2.49.0
>
