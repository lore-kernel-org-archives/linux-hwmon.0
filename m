Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211F1C43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Jul 2022 13:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbiGRNJT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Jul 2022 09:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbiGRNJM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Jul 2022 09:09:12 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BEE11A0C
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Jul 2022 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jVWtQcFR/rjLJipQ23p/DOBNvCzG4Eb1OuVGDbpi1vQ=; b=EulgXOU66oyHkWR+OqYbRvjOId
        BY7+ypP2/vJHVTWvff+fsxlPWjSBbSYqQougj2su8HpRfWz5oXZYhR+qkYNvZTzPDzNqJhCxlxezx
        G6Mi3CT9uC/hTrDa4h5sGxj+apA1GA8kB/LSdicQ2+4903OslSkXCu0P0zQFLyV8AhWDgL793m1gT
        AFETTqPbBOtzeJKGVc34uIRYX12pW0bg0pYACJT+iJtyrLgL40YK0BEW70ilKJtXbtQDVhGMQ6jzl
        HxYycqNWUmTwpl2LCRo6Df59R84Bm56moxYV8fAIzh1XW8iAW9lQOqwCy0mgG0BIeICwCtx6vVprm
        3xf69UDA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33410)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oDQUh-0001bx-GV; Mon, 18 Jul 2022 14:09:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oDQUg-0001yt-38; Mon, 18 Jul 2022 14:09:02 +0100
Date:   Mon, 18 Jul 2022 14:09:02 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [bug report] sfp: add SFP module support
Message-ID: <YtVbbtfBoHDHwvC7@shell.armlinux.org.uk>
References: <YtVZh357cANVAxey@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtVZh357cANVAxey@kili>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 18, 2022 at 04:00:55PM +0300, Dan Carpenter wrote:
> Hi Russell,
> 
> The patch 73970055450e: "sfp: add SFP module support" from Jul 25,
> 2017, leads to the following Smatch static checker warnings:
> 
> drivers/net/phy/sfp.c:474 sfp_soft_get_state() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1710 sfp_sm_mod_hpower() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1728 sfp_sm_mod_hpower() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1781 sfp_cotsworks_fixup_check() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1794 sfp_cotsworks_fixup_check() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1827 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1854 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'
> drivers/net/phy/sfp.c:1903 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'
> 
> drivers/net/phy/sfp.c
>     1767 static int sfp_cotsworks_fixup_check(struct sfp *sfp, struct sfp_eeprom_id *id)

It seems this report is itself buggy. Commit 73970055450e does not
contain this function. The correct commit that introduced the underlying
problem was:

b18432c5a49c ("net: phy: sfp: Cotsworks SFF module EEPROM fixup")

But the commit which would have triggered the "passing zero to ERR_PTR"
would have been:

9ae1ef4b1634 ("net: sfp: use %pe for printing errors")

Nevertheless, thanks for spotting the error!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
