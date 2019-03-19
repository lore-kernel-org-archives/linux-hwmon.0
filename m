Return-Path: <SRS0=Q+NP=RW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7393FC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:00:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 376A12177E
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVz9qXQp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfCSPAR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Mar 2019 11:00:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42590 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfCSPAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Mar 2019 11:00:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id r15so11126303pfn.9;
        Tue, 19 Mar 2019 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=paoQ87OKVKscooAl/OU6fC6h9C8rqR5YgshYsLyPgrg=;
        b=eVz9qXQpicKxHkURZ7M2onxOrYVidJtiAU8hsVqJ2BWv1ogm74MYPKUymi1H9MXBPf
         gygPMj2Oj6xAp1/tYuGNyKxwFV+Eum4hhF7hnz6FYQEsWmGXsi0N5D/f2+39JBezq4Sp
         ipt5SUu9u1BJm8xlpfeVyK3i/7hJG3ri6FEZfxEpP5o9H9uQUFMfczpoH65OqLFVZqzx
         dv+zWaN1AVJRgYDKSmd33DyVSuVHGsuvTXSwo5u8mBp2oKOaE/OgVjkKL9ANMuqfMIZD
         x2myBde8aC99QIIpnjAu2r39XIljfaXDNVtfy6tEvnA9kiqq/iUu+wCFMNYCfkBnqxv9
         ry4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=paoQ87OKVKscooAl/OU6fC6h9C8rqR5YgshYsLyPgrg=;
        b=ievWSwm3Q6VMzfRKIBOggGH4QQyd1un6Jx52COTl+l5p0f6UqtIdtTM1QQ7SBuq14f
         /iBapHwVL7z9dRXsiIMQnOVrkaHEF5FlUWLa71wcnGc62W9UZpcWipvNnUa0ciiF990w
         C3f8eLOdNfCmHfU8TFw/mrDJuG4S9NMopijJKt2O1JluaoWfKR/Y+aAGNNI2EQq7fPOw
         UZf1rNj1qKcGuQxBtoyGGW9dAfg/QHcW5EXqDtBWJskdr2d5zrw62o8rn1VdqvMDkKr7
         Ffyk8hmtVM9aLnkp+ufE442aUNryfhPPnAGNI4zfFlPzmJFTCfQUYcFkK/BT9hd+YJ2M
         xtKQ==
X-Gm-Message-State: APjAAAXobhMw6NOcseWXi+/AYPOrAauWv2m/1EMdnibDFL4H/fC7/OX1
        ykTZHyJc/zAULRF7VhJ7xB2pIVIY
X-Google-Smtp-Source: APXvYqyMyZMW6YsT/NPn/Aws2+yTQhCAZxgIxEKGtsk0LOdataEYfQg7wPflodvet5i5wg0vGEV8Kg==
X-Received: by 2002:aa7:9088:: with SMTP id i8mr929915pfa.118.1553007616148;
        Tue, 19 Mar 2019 08:00:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j14sm20989126pfe.12.2019.03.19.08.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 08:00:15 -0700 (PDT)
Date:   Tue, 19 Mar 2019 08:00:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     jdelvare@suse.com, kgene@kernel.org, krzk@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        thierry.reding@gmail.com, jonathanh@nvidia.com, heiko@sntech.de,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead
 "cooling-*-state" properties
Message-ID: <20190319150014.GA29158@roeck-us.net>
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 19, 2019 at 02:54:04PM +0000, Robin Murphy wrote:
> The old "cooling-{min,max}-state" properties for thermal bindings were
> ratified to "cooling-{min,max}-level" by commit eb168b70dea5 ("of:
> thermal: Fix inconsitency between cooling-*-state and cooling-*-level"),
> which were later removed entirely by commit e04907dbc259 ("dt-bindings:
> thermal: Remove "cooling-{min|max}-level" properties").
> 
> The pwm-fan binding, however, was apparently in-flight in parallel with
> that ratification, and so managed to introduce an example of the old
> properties which escaped the scope of the later cleanup and has thus
> continued to be dutifully copied for new boards despite being useless.
> Clean up these remaining undocumented anachronisms to minimise any
> further confusion.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

For hwmon: Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Presented as one big hwmon patch for simplicity, but the DT changes
> can quite easily be broken out by platform if maintainers prefer.
> 
> Robin.
> 
>  Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 2 --
>  arch/arm/boot/dts/exynos4412-odroidu3.dts           | 2 --
>  arch/arm/boot/dts/exynos5410-odroidxu.dts           | 2 --
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 2 --
>  arch/arm/boot/dts/imx6qdl-emcon.dtsi                | 2 --
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 2 --
>  arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi       | 2 --
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 2 --
>  8 files changed, 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> index 49ca5d83ed13..716e84f3bbb2 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> @@ -12,8 +12,6 @@ Optional properties:
>  Example:
>  	fan0: pwm-fan {
>  		compatible = "pwm-fan";
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  		pwms = <&pwm 0 10000 0>;
>  		cooling-levels = <0 102 170 230>;
> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> index 2bdf899df436..6d400b01d9c9 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> @@ -34,8 +34,6 @@
>  	fan0: pwm-fan {
>  		compatible = "pwm-fan";
>  		pwms = <&pwm 0 10000 0>;
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  		cooling-levels = <0 102 170 230>;
>  	};
> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> index 434a7591ff63..8f9e08f940ab 100644
> --- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
> @@ -38,8 +38,6 @@
>  	fan0: pwm-fan {
>  		compatible = "pwm-fan";
>  		pwms = <&pwm 0 20972 0>;
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  		cooling-levels = <0 130 170 230>;
>  	};
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 5f195ad7e467..93a48f2dda49 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -44,8 +44,6 @@
>  	fan0: pwm-fan {
>  		compatible = "pwm-fan";
>  		pwms = <&pwm 0 20972 0>;
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  		cooling-levels = <0 130 170 230>;
>  	};
> diff --git a/arch/arm/boot/dts/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> index 397e205551c4..70d26616d771 100644
> --- a/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> @@ -77,8 +77,6 @@
>  
>  	pwm_fan: pwm-fan {
>  		compatible = "pwm-fan";
> -		cooling-min-state = <0>;
> -		cooling-max-state = <4>;
>  		#cooling-cells = <2>;
>  		pwms = <&pwm4 0 50000>;
>  		cooling-levels = <0 64 127 191 255>;
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index b62e96945846..73801b48d1d8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -57,8 +57,6 @@
>  		pwms = <&pwm4 0 45334>;
>  
>  		cooling-levels = <0 64 128 255>;
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
> index 1b35d612b660..cc35c88dafd9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
> @@ -56,8 +56,6 @@
>  			fan: fan@18 {
>  				compatible = "ti,amc6821";
>  				reg = <0x18>;
> -				cooling-min-state = <0>;
> -				cooling-max-state = <9>;
>  				#cooling-cells = <2>;
>  			};
>  
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> index 0130b9f98c9d..490be7a6a851 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> @@ -369,8 +369,6 @@
>  	fan: fan@18 {
>  		compatible = "ti,amc6821";
>  		reg = <0x18>;
> -		cooling-min-state = <0>;
> -		cooling-max-state = <9>;
>  		#cooling-cells = <2>;
>  	};
>  
> -- 
> 2.20.1.dirty
> 
