Return-Path: <SRS0=0fv7=RZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE23C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Mar 2019 00:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9443221917
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Mar 2019 00:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553215620;
	bh=G2q/KAZNoDoMecRwlFKn9QB4uWEyPPGnF78zcXSVkbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ScWsXGfCO3sKyt7XvUEo5S60pGPJmKc59yJczm+8vgq6wJUDJXE5g/4ZjJsQ9sGkl
	 +GrPvU84NND5ocRZQDffEMHW1KXy1PaUuKKgecUvD09gctUL1rRdeGNfNfE7/ItBn2
	 XakeiOQDzhAzwsKU9CJJwKL6Rz5Rtvh6ekmgJ89o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfCVArA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Mar 2019 20:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfCVArA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Mar 2019 20:47:00 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CBF521902;
        Fri, 22 Mar 2019 00:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553215619;
        bh=G2q/KAZNoDoMecRwlFKn9QB4uWEyPPGnF78zcXSVkbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RUNbzIw8Jjeoi/vwWxPTAMXa21xVXS5qhsr08AtBBhVIKApZGAw8ukmJOoNyg+uQP
         AH88Paasps7A0P7d0pRCoiheO4cNuClmdC50Z9Z0LNV7Ezp1p2MNXBiPVg48eUN7kv
         LxmIUMW31PwXjQZrWJOPfQOHeqkgnS0s8LHMexYI=
Date:   Fri, 22 Mar 2019 08:46:33 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux@roeck-us.net, jdelvare@suse.com, kgene@kernel.org,
        krzk@kernel.org, s.hauer@pengutronix.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com, heiko@sntech.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead
 "cooling-*-state" properties
Message-ID: <20190322004632.GN12513@dragon>
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

Acked-by: Shawn Guo <shawnguo@kernel.org>
