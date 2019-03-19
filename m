Return-Path: <SRS0=Q+NP=RW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D81BC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA9B120811
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 15:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfCSP21 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Mar 2019 11:28:27 -0400
Received: from gloria.sntech.de ([185.11.138.130]:32954 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbfCSP21 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Mar 2019 11:28:27 -0400
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1h6Gee-0007Ty-No; Tue, 19 Mar 2019 16:27:52 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux@roeck-us.net, jdelvare@suse.com, kgene@kernel.org,
        krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon (pwm-fan) Remove dead "cooling-*-state" properties
Date:   Tue, 19 Mar 2019 16:27:51 +0100
Message-ID: <14253588.EKW5T2lhLl@diego>
In-Reply-To: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
References: <afde4ebd929821d63b5172c8e70e15f0725a4b49.1553006788.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am Dienstag, 19. März 2019, 15:54:04 CET schrieb Robin Murphy:
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

For the Rockchip-parts
Acked-by: Heiko Stuebner <heiko@sntech.de>


