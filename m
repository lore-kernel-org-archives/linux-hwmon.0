Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4FC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 17:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbiEQR7i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 13:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiEQR7h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 13:59:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778C54A3F1;
        Tue, 17 May 2022 10:59:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1069D614B3;
        Tue, 17 May 2022 17:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EADC385B8;
        Tue, 17 May 2022 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652810375;
        bh=XZdrlI4v+ZvAe+NF3BwYsni+wVoFODseYbMtOFnMRpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fflH5VkNmt9j0yusExsnCvthLSaOh3KJunUZcGpUK9Mbi5eSW81PdH4f0aSFF2A5I
         aH/5G0XHNdCl13iSQeNmhotvggmBxVRkeIIHdtEmVguS+D3E+dzYboZrIH0HZ419gz
         AOKvIdLJ+MVWP3zR9aOcxURNQPVKrL7lBzBbRhAM=
Date:   Tue, 17 May 2022 15:48:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        zbr@ioremap.net, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCH -next] drivers: w1: use kfree_sensitive()
Message-ID: <YoOnrsEAFOclLbG2@kroah.com>
References: <20220511064954.3401381-1-yangyingliang@huawei.com>
 <YntbdfHLjeHzAb9/@kroah.com>
 <2cf24169-ea56-9c72-fa95-a1e6625c8545@huawei.com>
 <YoN2fn5zRyNEnaUT@kroah.com>
 <16959408-3e91-774d-484f-508caff1f8f7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16959408-3e91-774d-484f-508caff1f8f7@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 17, 2022 at 09:03:43PM +0800, Yang Yingliang wrote:
> 
> On 2022/5/17 18:18, Greg KH wrote:
> > On Wed, May 11, 2022 at 03:25:52PM +0800, Yang Yingliang wrote:
> > > Hi,
> > > 
> > > On 2022/5/11 14:45, Greg KH wrote:
> > > > On Wed, May 11, 2022 at 02:49:54PM +0800, Yang Yingliang wrote:
> > > > > Use kfree_sensitive() instead of open-coding it.
> > > > > 
> > > > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > > > ---
> > > > >    drivers/w1/w1.c | 3 +--
> > > > >    1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> > > > > index f2ae2e563dc5..a0a6c3c739d9 100644
> > > > > --- a/drivers/w1/w1.c
> > > > > +++ b/drivers/w1/w1.c
> > > > > @@ -73,8 +73,7 @@ static void w1_master_release(struct device *dev)
> > > > >    	struct w1_master *md = dev_to_w1_master(dev);
> > > > >    	dev_dbg(dev, "%s: Releasing %s.\n", __func__, md->name);
> > > > > -	memset(md, 0, sizeof(struct w1_master) + sizeof(struct w1_bus_master));
> > > > > -	kfree(md);
> > > > > +	kfree_sensitive(md);
> > > > Does this actually change anything?  Why is the memset being called here
> > > > at all?
> > > It's no functional change and I got this by
> > > scripts/coccinelle/api/kfree_sensitive.cocci.
> > > I'm not sure why using memset() here.
> > I think the memset() can just be dropped.  Can you make that change and
> > test it to verify it still works properly with that change?
> I can make change and send a patch for this, but I don't have device to test
> it.

For something like this, it would be great to test.

thanks,

greg k-h
