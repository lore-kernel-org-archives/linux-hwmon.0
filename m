Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896F1C8FBA
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452746; cv=none; b=YyRL5o4g21zYIJQ4WsT9XV+Jqa+n2kQED3pcD/0oyyrjneQhHpeKX3p3coA0GOrm3RNEtAlptTz/go/NMKwY0yGTZcI0Tiicd5VpKGCUP63/MYXwT5se6URRN9NMQY4LrhsEDCfh691nBR2r07oj9JO7lB2C9Y3xzFlBdp7NHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452746; c=relaxed/simple;
	bh=fTSH993Mk+TXcNH7gBcDzv8X8Zy3Ya7TfMmE6MvGpFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJrPKzUSQbbEDy7FfQm+mPCNuCzPEBvGrOAh8+hP6sDcMWpRLhKMetMG50NyoujMkPB+UbCt5Nnas4J/yyY/LjPbjTP4NYh8ytT+e0cnt9WifDgYFcrcNCobJ7ks9aOu2IWGVMMMEemThSg7LcGubdKyeVH/cXRs/WL1fcFErYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JqjYI0+Q; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqjYI0+Q"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso748142d50.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 03:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452742; x=1766057542; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=JqjYI0+QfCo2XJtf6glhKa4oS63fM3EiwnAyqO6fTI6BPzirD8QQyM48d/AjqlE5ni
         olrWKVMLmfSuw93+pIqY5JAs7SerzbNm2dv6TfsSzoUjHr7PQURGgJ+nDJiVPl3xx+Ht
         RyKElP1puHDfVaeIp94/WkUNFhMX2hG2Ffl68cgargk44w5ddzae5456iRqF8yaeS5wk
         1S+F/0+PhyVM4URNyoPHK1fCsp66FOQI0z8deC6xLLqYD60Z+F9TRohmLaufyDOlOxfH
         8YF980pLwUbReSRDgr3F7kC9SdQMEtWwVKlsPlFElx2xxfTWbXw5GXr0Q90dgOrqZuis
         1y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452742; x=1766057542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=rKM2syPuwk9NER+IvHhEfVd7N64Z4XVjIc8QoF0Ivhv4KCo+KcAHvUfkhZpr9r2H2U
         UzdAcYfKlMnziIMLmA4qy9RsKxOw/0nzMKcWYKi1yAlcKtvuWeZVNOvjas9J6ZRSi3eO
         DkLrv75LMvNV5xQmm5a5KdELKDFtI5TZoyhlm3OeAUqEQhIuzrYOVGA1jc7cvC3fN+Ff
         xsCfkBj/dmnEqypXoGcyY5iPByMFts1NPVapKtZP/Cs4LkQnCq9tLr/2mVqvCnmZHNcf
         3q1xF0GbKBEDP0bBdHj0+NBX4JN4v5uql71a+BYq7rTb6tYKLjeE2Cb6B85T/bB14Dwf
         5YpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV29TXWqtfpa72IIr1abxgCqCy6Ay7BIqP8slh/PdnFQ3ZvksoNwKJo36VJkurlFvyGlBt2lCPLIlFW6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLdZACj3eSlmv4npY5/O4at3ob0bhe/AjtxzeOR+mMdlMVDk3
	lVmnU+ED9ZGvkrUK4RgCWSR3JkvX73vp4xY2sXqd7PZTJxXKYjSNFM+MCgrdkD8mHnpvUuelRN3
	T77w01YNIZHhoS/Ft1kzMvucmSnoqgcnkvC7avaTGcw==
X-Gm-Gg: AY/fxX4tMbrn93gcn/JZ4jyRD4DUb4T0fiJJTZRp8NRyWA9xFpG88vNAFuk3q7tukVV
	S5w7rbxFACyQlrDFVxSb41Ls3uLUc3oWXrH91cvdULG2nnUUtUfKJIXzIvn/RtN1N+AlWZbYldd
	EY63xXB0QOcOgRIoJUF+JOt7Bf5l9Xwd/DSQ670JRwhMQkengsfV7n0b4Sx0Eqk1nJeTA22k2jZ
	q6D0crqPgZT7V5nWzMgLXMvjV1xVO91hWlIuhJ20X8YGmU7OnCptmh7jpH/kEug44u46XcQ
X-Google-Smtp-Source: AGHT+IGcqwaxtfJMJnD56RcASi/uVKO/lK/0JnQ8qMBQTGtHR3OnnoyAdnC7R6PIycF4XsJLibnnvktvbwIlYjUAVZY=
X-Received: by 2002:a05:690e:120e:b0:63f:96d7:a350 with SMTP id
 956f58d0204a3-6446eb4a92cmr4347837d50.66.1765452742333; Thu, 11 Dec 2025
 03:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:45 +0100
X-Gm-Features: AQt7F2oiHWORIK5IUrdndTpX-opjO6A0dESgetC9ddqm2QKKAaLxTanuvA5lEio
Message-ID: <CAPDyKFqZQUurBNSNUBKE7rgBf+UHxKiYBWt+xxSY+dh7PgdPPQ@mail.gmail.com>
Subject: Re: [PATCH RFC 07/16] ARM: dts: aspeed: Remove sdhci-drive-type
 property from AST2600 EVB
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Dec 2025 at 09:47, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> The property isn't specified in the bindings and is not used by the
> corresponding driver, so drop it.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index de83c0eb1d6e..3eba676e57f1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -314,7 +314,6 @@ &sdhci0 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
> @@ -326,7 +325,6 @@ &sdhci1 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>
> --
> 2.47.3
>
>
