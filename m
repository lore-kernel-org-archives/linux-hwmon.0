Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2A2D0C83
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452750; cv=none; b=HDk9Dk1BFzYJ5YmP270jD3RnzP9JxxnIHN6e6X3p1NjDwDzO909sKCRlVSSTpwwBAhrvGPoyJUk6VF9dymnJy4H891OS225cUTBquKuz3/7Y5OUWcjZjzOEyR5Rz9DazgZ6PEzZHRBW9qvUFpM5P9JlKnKJHnB77PEtvx/EA4S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452750; c=relaxed/simple;
	bh=POzzpg6IYRZPIIqbdlvOsPFON8CAFCtqiOP8BsCzG6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loeX84VemPHqHhc3llRKFY9pHqwExskifqGLUDFSm9eE1/5Q1uL3cEaFdarSdnN7HYCDrBvGRwn4zYlVDwoco+nF3Suv6RTCM351x6HzO1W1wQzJryixxisN57cBzY1Y74h4HrUJznwSmpSaCKjZ+E4lMC+MVPv3B0ObM7zGl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NtJnTaGk; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NtJnTaGk"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a6a7654a4so8966157b3.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 03:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452747; x=1766057547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=NtJnTaGkvuf9r5BFmo4AYj1CaI/INFVazyoJJPcv6K82v1KZBH+lOmxmhfMbLhLfcr
         uVe7oFkhwFobKOHzwGE63T2H9L27wdtFG+lP/ffLqN/Mwa1j979U38NfyOSHMXS4xV3U
         OrdQcgWaJj8CfZdVsKjpGx41q+OVZcHd3SbAOyBbBmsyNmFmA0CWANT/ZLsn+l6reRO1
         iDromQMSouYwyd7ZM/RM76HLP6f9e1+BLAwv/74l3krLepSOQYcYDlUObFz9s5MOBoxu
         N2kKHOYjrMvzXu+SXOX2XqGew8KU/TGDHnk00b1SzSh5f5/FiQLTSjZ2VPcdWiI9COTz
         Jxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452747; x=1766057547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsAQFyywzgQt8hTuOma0wGcWOIPVIjI9LIgrRTCikK4=;
        b=oHsHHUk/m5akWLusjOHZYi8By/aE6DJa92YMthAXaF6YGBLi0TsR19xCAm8Bo2l3wk
         0zkrYWzRrSJ0eXhDhm20bKuc6hVsXnRjRDMsZoUIn2erzdfiss4Bj1E/sqKpzm9SO8Ce
         sptWQSAr0IS7h/hmJa1lPRw7Yq0UGNxAYMAmRBLW8uUxXAyXRVjbRUK48GaYrcMmZAg2
         GcJdJ8vo/K4CHy/kq9apVyEIKlSzNbkags7ISlw3EWbD2eYFI0xL2K4P1kAzLKlpO3K0
         TsqryAGclto+ZtymSNOJ1UsvnbuFDlOd/iwUFwm5XE5WPj3g+ZIo5bK8Y45jvTGMITaD
         ymHg==
X-Forwarded-Encrypted: i=1; AJvYcCXrceMWPD7W487ljBbj3vXeBeRaLzyzKuOjWVsq7wlRz4T8wTavL6i7g7z5uOKOvuqbsMYvpd4E8V0rjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylEW5gM9CM9dn4wzw3MqhjPoFXh8SOnWXrUK9Fr+cXho2S+E1W
	gP0bnos9gKwrd099jJgZStUd6FHi9NIiFYfZsioJBDHoY2FaNf42TyRodGx0ziVQ0qGeCSuirll
	eRixArdE2Wp7HKzuzwBb5sOjaaPEARw8BB9hxBPdpnA==
X-Gm-Gg: AY/fxX44lwrSSYbNZQhJCcgSoOC2yoKjBRSadlwA/UcbcSMOc29+aWE8kSlyPFUE25B
	R3/GcPC9ZgZ7t+5IKKvHaeGM74c14kkRgQ8f7ahm8nW5uB5eDultZMuAD6tv04Sldbcn2BD8KFQ
	u3oDEWye8wUEzeYMUHKedv1rBVC0kTSfNw5j9zUUSyCUgFrQ/Mz2kNAR5ReU3DPLHBAZRk6RpeM
	ZXedD4FENgwfUvKq0aYUI4D3IkfS5SUpUFl2YRFCPRVpUe6QVVx519H7UAv3sj+O+0sF7KB6eHX
	bpe0tRE=
X-Google-Smtp-Source: AGHT+IGi8FI7tue2F1muYiYdXCcwa1VCSq2fLFaLgh7A0p4DE+EvhP5UsxEj9lkt3uuk+LvjC2KVDNW0gmzNrvJK74w=
X-Received: by 2002:a05:690c:45c5:b0:787:bf16:d489 with SMTP id
 00721157ae682-78ca64495eamr51688117b3.62.1765452747098; Thu, 11 Dec 2025
 03:32:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:50 +0100
X-Gm-Features: AQt7F2pk6E2fyrBRST0HoIuBOhvmNQUfLJiP182o7R-P0Ig55Fk3IUyQwfYuHbU
Message-ID: <CAPDyKFpQXYFFrZ-unVxa9m2+tKLEyFZyo7Tv7JD_7vTbqqfmDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 08/16] ARM: dts: aspeed: Use specified wp-inverted
 property for AST2600 EVB
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
> While sdhci-pltfm supports sdhci,wp-inverted, it also supports
> the un-prefixed and specified wp-inverted property. Switch the EVB
> devicetree to use the specified property to remove warnings when
> checking the DTB.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index 3eba676e57f1..c51977dcb56b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -315,7 +315,7 @@ &sdhci0 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
>         vqmmc-supply = <&vccq_sdhci0>;
>         clk-phase-sd-hs = <7>, <200>;
> @@ -326,7 +326,7 @@ &sdhci1 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         sdhci-caps-mask = <0x7 0x0>;
> -       sdhci,wp-inverted;
> +       wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>         vqmmc-supply = <&vccq_sdhci1>;
>         clk-phase-sd-hs = <7>, <200>;
>
> --
> 2.47.3
>
>
