Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B4C0015E
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 13:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjGQNmO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjGQNmL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 09:42:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36DBF5;
        Mon, 17 Jul 2023 06:42:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 694936106C;
        Mon, 17 Jul 2023 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E401C433CA;
        Mon, 17 Jul 2023 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689601323;
        bh=HtFGR+geO3qjGXwbgGRT8YDxhj8Z9Njkjftz8qO4RmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BWypn2mOv0G5TpzeFCkIigeK0mRptPRfFDUQJQDnRbBtybJd0bhNg1jWsM3OlvEtt
         qsHwq5LPTx7z/FgDGpIxheMaF6NAiutwTiPFvRjHdzyU74EWczfEiEhkW9BUSRObO7
         oQaxR4jZbp+fBXgUaYxH5tx22wJWE5llur6+tfpw=
Date:   Mon, 17 Jul 2023 15:42:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (oxp-sensors) Move tt_toggle attribute to
 dev_groups
Message-ID: <2023071726-zap-sesame-c8ff@gregkh>
References: <20230717124013.38796-2-samsagax@gmail.com>
 <20230717124013.38796-3-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230717124013.38796-3-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 17, 2023 at 09:40:04AM -0300, Joaquín Ignacio Aramendía wrote:
> A driver should not be manually adding groups in its probe function (it will
> race with userspace), so replace the call to devm_device_add_groups() to use
> the platform dev_groups callback instead.
> 
> This will allow for removal of the devm_device_add_groups() function.
> ---
>  drivers/hwmon/oxp-sensors.c | 38 +++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)

Nice, but you forgot a signed-off-by: line :(
