Return-Path: <SRS0=r2R4=SC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A35C43381
	for <linux-hwmon@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1BD221873
	for <linux-hwmon@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554014461;
	bh=Ga5iquBQ7ENFDmTPnWVZwUwxuw3p5Eqr04fBIASXcg8=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=KpJbwjO5+EhNxWB2Gctt56FWdbal3FclUUriFYi/l9wzmBdtbodboYKi/MXzBMwd5
	 jqJF8m1aRPyGHfvZO2X4Aqk75h6ur5eeNNz82TWc7o0qUkfG4+nhsgc5pphnLKZHV3
	 vJDe9H/v0Pw7oYzRaFwRdpjeXoQGOpA12tXyDN8g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfCaGlA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 31 Mar 2019 02:41:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36159 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfCaGk6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 31 Mar 2019 02:40:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id z5so1957855pfn.3;
        Sat, 30 Mar 2019 23:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=2/IGlKj0rTI6vVymi5wUoBfOth2M9ouK6VKNX+9kRm8=;
        b=qXEMwAJFLCTW3BjxSZSZR8ZXZvbxUugWdFRJ6gE+ldOedBmPNtXduHzpizSeKWaPHX
         yROPMTMRJBJbz3GWjC+SmoRv0pUPwqIpuhfDt1M0/nJDMYd53IPXeBtQxhd33Y7aa2XY
         5m/d1FeoGYs4p3qGwOBsUyH5fIvZGWjKzjJJq3SieZaBjxY0XC0EGW51hQN86hc4ue7f
         qAwmLU2ir117nU0qCiIxyC59Kc+4rrCgQhNo0JsU5GwFkOSlSsqoj4q68QAG+LT3JcvC
         6v43oidev9sx3CxU8wi+z5C+1p1qumVOQW3NMy1Ksj9YPWxtXYagr7+eJxJVeSlBEh/3
         LYuw==
X-Gm-Message-State: APjAAAUgsnosyLrzmVLBBbibE+EnpUlU+cQvn1KRJ1lLVByE0CHZ+GbS
        T2GXmoeLxRa0EQwG7o8yhcFulopkdw==
X-Google-Smtp-Source: APXvYqwCjdyySj05AE3P3uBiX4fsWmM/iwGs0QKyI7/YbfgMDMzUIap72mZ9vi/rWk8lbk+ui+CArA==
X-Received: by 2002:a65:64c8:: with SMTP id t8mr27048770pgv.248.1554014458189;
        Sat, 30 Mar 2019 23:40:58 -0700 (PDT)
Received: from localhost ([210.160.217.68])
        by smtp.gmail.com with ESMTPSA id f14sm8221196pfn.3.2019.03.30.23.40.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2019 23:40:57 -0700 (PDT)
Message-ID: <5ca060f9.1c69fb81.58fe6.677a@mx.google.com>
Date:   Sun, 31 Mar 2019 01:40:55 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead "cooling-*-state"  properties
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
Cc:     linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        heiko@sntech.de, linux-pm@vger.kernel.org, s.hauer@pengutronix.de,
        krzk@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
        kgene@kernel.org, shawnguo@kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Robin Murphy <robin.murphy@arm.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 19 Mar 2019 14:54:04 +0000, Robin Murphy wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>

