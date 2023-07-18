Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E1EB64DA
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 13:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjGRNjw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjGRNjv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 09:39:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F2DE2;
        Tue, 18 Jul 2023 06:39:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 573D46159D;
        Tue, 18 Jul 2023 13:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18971C433C7;
        Tue, 18 Jul 2023 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689687589;
        bh=wdUTpb0o1wPjWzbJ1rwW7sqrwgkhsYIgkYya3m2XxDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJh+dxdkpEgciP6IN6IfzpBqYfDHHjWQRGUny1opyh2wcilikq2iuf1m4SwuFchLs
         9MCZdHSruCHaYBO8WBdIJJdLjSFLIHtsq0BU4aItjy0z5ppKmhIldSyVs+i0EwhHvU
         3DlKHSISVL9NcIZlvF8KtPmT3yVXNyuKoreNTiyE=
Date:   Tue, 18 Jul 2023 15:39:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (oxp-sensors) Move tt_toggle attribute to
 dev_groups
Message-ID: <2023071838-powdered-unsmooth-1015@gregkh>
References: <20230717222526.229984-1-samsagax@gmail.com>
 <20230717222526.229984-2-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717222526.229984-2-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 17, 2023 at 07:25:15PM -0300, Joaquín Ignacio Aramendía wrote:
> A driver should not be manually adding groups in its probe function (it will
> race with userspace), so replace the call to devm_device_add_groups() to use
> the platform dev_groups callback instead.
> 
> This will allow for removal of the devm_device_add_groups() function.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> ---
>  drivers/hwmon/oxp-sensors.c | 38 +++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
