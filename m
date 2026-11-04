Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801262;
	b=N6O1TsGNnxHhn6cKUInHLTmfrrk6XDwHOQTMb3vBkZPzVPPTOuBqnvCN+Vkn4fgrcbSm
	 EYiGu+c2EhVo44Myydv2N4lr/AK4SjITf1YJR29Qow9VFneB2SG158OaiJ6SWZu4hKpfo
	 ABRDCGfMgRaM+A2Ft2pnqLwd6o2RMZuluQ5GjM1uhY6rqQ2mht5TmQkgqrsB7M173l6er
	 Is9Fj53MpP5gxblWvqtLqfW7zOhDh0YsOorHQIgmFC6Gyd9MVYWFdUflYMQsOW/mEgT7o
	 ZvCdQ+txalTs7MdQ1NFiGGDfNu1bllFkfoOTSH7x7kNxIcnaG7eDyJKl4A0xMsccnmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801262;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FL6m0RtLAqJq1qmlWsGMqjCbKXb+q2hr1SV7q87y5tk=;
	b=1g6053c0MPS4g6boQX18vjPyEwsvuhzbsx13dgEEAfDo+YQj26O+5vZL8wEzBg4Lyk3w
	 g9m/YrNQZsT63CifCIOzWDvebFg6go0j3cWWs1+qZ5/NeOnUJ663yWUDWGERuYuvs2zNs
	 0JtMW+KWO5us9FkOba67+u4fPiCRcltTzdjkgM1aSM/mjXFQNpzBcHfqDh30Byx7U30yu
	 Mv65ffn0Z0msmE5c4zNZJlXLW764Gnrlbd0ZbKME0bXNdO5IEg+3QAwyDw6vdvB1TSkzB
	 mYZcqaNaxZ7O5+mbVmgHWa2T0HW8vdkIJnAQsnw8WMFEdKdXKBKOwORNpuqrm3G1zyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AECCAsZL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 68FE1606A329;
	Wed,  4 Nov 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AECCAsZL
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2C1441F00919;
	Wed,  4 Nov 2026 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801262;
	bh=FL6m0RtLAqJq1qmlWsGMqjCbKXb+q2hr1SV7q87y5tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AECCAsZL4gphmtv4Bgo0R5lpISjZoiy2Bo6laSy52d7WH+iup1b+fpOA6Jfex3lgT
	 SgOTPz1MkSFFRaNCCZxzQQrWZzrnMabflCizdUt/AiHfjaQTrbs2EuIHROwwn7+TZj
	 4oth8onrwjrS4aBPKD20HeXE2rLFYWVX+rYrci6ZaAVoXwjm8JyVnOQRDlbJ1adx1O
	 pMPRzL1qR9W6Kn+OVlqJFkjGaW3rilUvcLQIj6h723qgS+u1z9uM58nLX21JYH7GSv
	 5BbeWPVIKmIvBDqxbh6MKsKIbXxMjvdkmYrxyyB3ZucDhEcM3C9QjpjrQRt2RcZNsY
	 ee0WvfPVl736g==
Date: Wed, 4 Nov 2026 15:07:38 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] gpio: gpio-ltc4283: Add support for the LTC4284 Swap
 Controller
Message-ID: <qamxos4qxi24qqb3g644fgmap7yksoxlusszwoklmkdgexngtx@xfmd6iemag2h>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>

On Wed, Nov 04, 2026 at 11:30:02AM +0800, Alexis Czezar Torreno wrote:
> Similar to LTC4283, LTC4284 has up to 8 pins that can be configured
> as GPIOs and behaves the same.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  drivers/gpio/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86e7701d9a043c89537f60bb70c6e..de9226619ef2f77fdded123657a14c15cbba07b1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1864,11 +1864,11 @@ config GPIO_AD7768
>  	  called gpio-ad7768.
>  
>  config GPIO_LTC4283
> -	tristate "Analog Devices LTC4283 GPIO support"
> +	tristate "Analog Devices LTC4283 and similar devices GPIO support"
>  	depends on SENSORS_LTC4283
>  	help
>  	  If you say yes here you want the GPIO function available in Analog
> -	  Devices LTC4283 Negative Voltage Hot Swap Controller.
> +	  Devices LTC4283 and similar devices Negative Voltage Hot Swap Controller.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called gpio-ltc4283.
> 
> -- 
> 2.34.1
>

Is there something missing from this commit? The commit message suggests
there would be some code changes?

Bart
