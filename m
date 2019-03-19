Return-Path: <SRS0=Q+NP=RW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E710FC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B45E620828
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553008002;
	bh=QjP3PG6DB/OhCOXh22t+MjfrsqX8iiSdkJTF8OaYzmY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=UsuEuqJGXca7y1E+bSwRKY/UAzYf7t2/WlFDha0tSkCxd1CsvDoIraROS936Ao0Br
	 DCktWUFH7dQL0ROI8i4knnMz7ZDgC/jfl46bUTTksinsUhVK29b3QE9jJF0Ys2u2ZU
	 EGhT1siGiyBJPa6a+ZBa1kScdz2tnA/WbL7mYNCY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfCSPGm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Mar 2019 11:06:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbfCSPGm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Mar 2019 11:06:42 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED9352146E;
        Tue, 19 Mar 2019 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553008001;
        bh=QjP3PG6DB/OhCOXh22t+MjfrsqX8iiSdkJTF8OaYzmY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yV3BCz06slpBE1SMARwswKBMxFz4uhuUD1M/T9KsIWGTaIpXwGhm9DgecP3LrmYyB
         4lXM322osGnB42W5/2OpMLe3d94s1Ek4q4F+A68VLIO4HfNZk/5V2HXMclmy3rfC5u
         FHytgNvBFjhh8iK3PUssLAFAa11/foDAzpQTwRnw=
Received: by mail-lj1-f173.google.com with SMTP id l7so7867037ljg.6;
        Tue, 19 Mar 2019 08:06:40 -0700 (PDT)
X-Gm-Message-State: APjAAAWLa94nV529fr+b1DZVO1dN5axqd5mjTnpoSgteBn8RheH/6mqL
        oxsMO2o4sCHlP+VODw6dPnGNosAGLlMHix2dWZM=
X-Google-Smtp-Source: APXvYqyHR93rZCBNH6WNusgqhBhDR7k8EjZmlti+Na92kurK2AI/20qC2Pl6Q1F0qZ8R9OKoEVVg1qjL8q+qqT/3dy8=
X-Received: by 2002:a2e:2e02:: with SMTP id u2mr14841759lju.113.1553007999219;
 Tue, 19 Mar 2019 08:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 19 Mar 2019 16:06:27 +0100
X-Gmail-Original-Message-ID: <CAJKOXPd12YPvL61nu0TDWze4pBuQK=KbJCrc5wh-tACsRQt37g@mail.gmail.com>
Message-ID: <CAJKOXPd12YPvL61nu0TDWze4pBuQK=KbJCrc5wh-tACsRQt37g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead
 "cooling-*-state" properties
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux@roeck-us.net, jdelvare@suse.com, kgene@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        thierry.reding@gmail.com, jonathanh@nvidia.com, heiko@sntech.de,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 19 Mar 2019 at 15:54, Robin Murphy <robin.murphy@arm.com> wrote:
>
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

Probably you should send it directly to arm-soc maintainers so it
would go with other DT changes. In such case:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

>  arch/arm/boot/dts/imx6qdl-emcon.dtsi                | 2 --
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 2 --
>  arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi       | 2 --
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 2 --
>  8 files changed, 16 deletions(-)
>
