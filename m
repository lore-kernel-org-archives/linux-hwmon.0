Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49C9EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 13:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjGRNkX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGRNkW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 09:40:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B6DE5;
        Tue, 18 Jul 2023 06:40:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EDDD7615A0;
        Tue, 18 Jul 2023 13:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34D1C433C7;
        Tue, 18 Jul 2023 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689687620;
        bh=/OS496YBy+5JqnR0vuyG56/C1HZH898leTrQ9TTujcg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XDW55LDifwdboqgAdNyvB8cOzOLcTbOS++Cifqtau0h2pyx2VurtG8Te69sY7vlq2
         hhcMhxYaoqmTWj4StS2t19EVdbUo/T57+38WxqkUqJjL1XYThAp1T9ll2P58cKeBsx
         vUSkX+d+DkShyNAl/0zcNNwSR6apNQuy69RiyykM=
Date:   Tue, 18 Jul 2023 15:40:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (oxp-sensors) Move board detection to the
 init function
Message-ID: <2023071808-power-rise-930c@gregkh>
References: <20230717222526.229984-1-samsagax@gmail.com>
 <20230717222526.229984-3-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717222526.229984-3-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 17, 2023 at 07:25:16PM -0300, Joaquín Ignacio Aramendía wrote:
> Move detection logic to the start of init() function so we won't
> instantiate the driver if the board is not compatible.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> ---
>  drivers/hwmon/oxp-sensors.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
