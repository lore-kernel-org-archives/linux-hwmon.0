Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37D35C181
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839745; cv=none; b=ZdEym/E/FvBHRNWi7iriRGh1UXdi/zriZWzhp1trNglkhfXuyq2l5otVy2sFfheWEQlv/DAog4Drs0Mod9qdRpVK9ZrYh9tPWfAqX/+2Gkq/IwFZeoPvPA/HrB3su4lhGROGGi59m5vUQbRZYegBzq8qYdlpqcELtqgj+H2BW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839745; c=relaxed/simple;
	bh=UPz/1qsRdJyWIaGxAjf5OdGUVOKPj4+OWW8N2wpx+5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3XcdByc6jqFKIY2XzPLAG5ysQ2iBLDW6QpkJaEvmyw/2lQju+NfYqIQ+64q62ZKS4FYJcf6tqdnD5DfkbhFJGdvdGL4SqNTuyt050kWkWzAnuUh425Crf2LlfVSyOODaRCV8eTEBrBm5yf15kVW+wpZ6cW4o0C6+g8DjjrBiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjVHqHXk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjVHqHXk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso638362b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 15:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839741; x=1773444541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=DjVHqHXkitQOgeTCFIgY1UBwagDbOg0hzzUmH5zkATA4k0xEPq7OLMlqy06EFf7SLM
         DRUlFsNujF9SCMe91CjSRtswTjxREeuvCzDnmOD/g8DIdB7pVB3aolUkj4GjgQeZrYwz
         yiXBN1T5uiV0scYxH9WZwweKQQ4dgZwaBatAy3x/abym6TDsrnw99Y7db1gP45MaNHgK
         hyzsRs9m5+2HF+ZBbgOrpNsRNxzyj6JoUHkUJa81EnXKQ3UBnprP7e3pxNdStaMiMGUe
         ZtgNKAcGiZLJrrbK51+Qge5PvmA9BQtUFvNXiM9GuUVeBVAzs/0+hUld+kWh73RAfhG2
         A/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839741; x=1773444541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=h76bToqillEhcoWUHJy84CxoyA4ryQ4a0upyijmVcmrpZZGfI2Q4E3zIzdlprj201X
         5coQTKmg3JcDgCdvoiL44Br/5/sKLEhEjqKlBH2XGzn0/CTrZMsP0w7NEPxMjwkJTAbA
         +LlQVmjLSGHCvSd5sae+WmBdsZmbh4Lo0Uy3hiysKdMBXoNomk8yOaHl5Jx7CarVUCzo
         blMOJs+KQu7+jsbNHGY6nqx+PqDS4IUEI6JkFQo78HUHRGpH29LxwTgI6pd/HJsb4NK5
         oM6uMqGxFKNVROjMV/bh+rxwciD7QMLKK2Vk7xNoKLl5sBoXT2m/Ghk/XE1LX/j8Y5bm
         HF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWtvB6wV7s4ZeEM3Y48h14qz+r8c0+qoMjXtEd09b5xF6yFqEQ1/WzlXXNiiyHaRiBDQPPktOZf2/nPxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49Fa9ULsj/b9qJgwnRcXi9+Nr19Q+PPhHvIhRNQ/VLo+3eoAW
	6RlgdDXF1QQZoQl7EhfLfgEo8fCloGUUt54KePx9iSPMAUDHOYkDONuj
X-Gm-Gg: ATEYQzwUBgA4IrnQLF4Xc2lblTqymDNKg+whGvf6vYeorx+2dIdCwGyAPZivBpb7Zue
	wH6b+B8yjIzbRpR9QE1gS1EfFL1lVeBfFfzf75YW1BA/kHdOusycqGzK/HdvHHyRJl/uTiDVznu
	w2/gXXcPjdTo+WLb7FiGE0Vin+ZMYsa2XTqCX9x6V0IUWtGu3coM1Eib6p0PvocVpIAhZ77w4aA
	QPZW16Y5cQKBNF2pGb0YNML0peVYmJIjswNvxYvDN6fsLO82+A9Hd3ua00kErgzPTTgOI7Dgs6z
	zfqHNQ0RXV3hIl5ApUBQSul7lTIMS6/d0y06ZPT2EHlhV9JZwcP3PtdNidWImLl18KxP1Qiihb3
	x3eBM033OCmNKw/i+OJmay5sauXNsdiIsr4q69jn8Qe6yS/CwdQN5RXoLrzmT4yxLbyPINShR0l
	KmpJDOBtu/EmF/sw+PhjeiLOiFDU8ro6kYjmnR
X-Received: by 2002:a05:6a00:9510:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-829a2d86b43mr3749707b3a.9.1772839741072;
        Fri, 06 Mar 2026 15:29:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3621sm3213092b3a.62.2026.03.06.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:29:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 15:28:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <2c6ad0ca-fd72-4bf5-9180-f45c20e60d37@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF

AI feedback:

  Could this change inadvertently allow the driver to be selected when GPIOLIB
  is disabled?

  In drivers/gpio/Kconfig, OF_GPIO is defined inside the "if GPIOLIB" block,
  so it implicitly depends on GPIOLIB. By changing the dependency directly to
  OF, the GPIOLIB dependency is lost.

  If GPIOLIB is disabled, the driver will still compile because of the stubs
  in include/linux/gpio/consumer.h, but devm_gpiod_get() will unconditionally
  return -ENOSYS, causing the probe to fail. Since the driver's sole purpose
  is to control a watchdog via a GPIO line, should it be prevented from being
  configured without GPIOLIB by using something like:

	depends on OF && GPIOLIB

It has a point. Please update.

Thanks,
Guenter

>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device
