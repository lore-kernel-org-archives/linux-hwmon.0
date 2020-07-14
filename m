Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD80C433E4
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 05:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92286221EB
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 05:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594706089;
	bh=jVK2vp/0V0HW/84kapmG0T1XHl4bq5JefRjxwkQrdzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iMpgn/fq1GrepFyBoL4kdjVyowfY3024C4+RrShCdIznqhvuw676mEtSTQrMzv667
	 lrpODnvo7HmNEgKOzxSi17hfpAEnt0PTOHYj48pEEgmXhIOMe4ZuvlFkr2hoAbUMsk
	 eSHd+4eGoU77y0W1rqWqMMCgVV+rU3gA0a64IqdQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgGNFyt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 01:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgGNFyt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 01:54:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7418C221E7;
        Tue, 14 Jul 2020 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594706088;
        bh=jVK2vp/0V0HW/84kapmG0T1XHl4bq5JefRjxwkQrdzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E4ePkiyqgCpIP+k3XAfKU9Yqs3CpOesILmbOGS/Kq79OHMmOYKBm8YVOxH8d2dZv3
         fcWt5Xqz5mjvQ+7kbsKovDwU0SdrynKp6yRfmugQlv3GFTw2V6pCbaGDig0d0tnCZa
         ZnHo7VkMAEDKgTxzZIg9NFX667nzxcKK42/8VqIg=
Date:   Tue, 14 Jul 2020 07:54:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: Re: [PATCH 1/6] skeleton for asetek gen 6 driver
Message-ID: <20200714055446.GA655193@kroah.com>
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713193227.189751-1-jaap.aarts1@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 13, 2020 at 09:32:22PM +0200, jaap aarts wrote:
> Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
> ---

I know I don't accept patches without any changelog text, and odds are,
most other maintainers do not either :(

Also, please fix up the subject lines of your patches to match the
subsystem it is being sent to.

thanks,

greg k-h
