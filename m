Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BBFC47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 17:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2B206113E
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 17:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbhEZRSN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 13:18:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:48368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234232AbhEZRSM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 13:18:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4C68610CC;
        Wed, 26 May 2021 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622049401;
        bh=ZScAOWOefrEQsk+oOF01ONgOWiDwQk6uUdl3KOM+f1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZMr6cKaQVk7wqn5jOoBqYiCVFd6jITFtAjJBfoXx9KX9/BFXB01GZMPOpPxEO/DQF
         9z8OsMs++EMCSA8EBYhxbeJOh3QBCiHM84CMu5+m18WPr0ZCAvqZ/ZR9CYoMXLcfat
         Hy1C7695MOkI+LZ6Gr0+Bs1fa929gIERvob18KLVSIqYZZwccujmcoYMZ3FIhqhaT6
         1IahpQaIbg765ITGFxAmfhnBG9YM5t1VUKmxLD2EiPeJ1//7h7mnHaWbSyBeSInSoc
         9klXY5pIlq3NSfcJNYxlKK7nxo2YNwFzi7VSb9+kWQxqoL9VlInSU/H3PzWV0h67yx
         UvPyjzl9IWcQw==
Received: by pali.im (Postfix)
        id 3CA04AC8; Wed, 26 May 2021 19:16:38 +0200 (CEST)
Date:   Wed, 26 May 2021 19:16:38 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     W_Armin@gmx.de, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] hwmon: (dell-smm-hwmon) Convert to new hwmon
Message-ID: <20210526171638.jrzvre35cxqipro6@pali>
References: <20210519132910.14453-1-W_Armin@gmx.de>
 <ac961946-bfe4-cf47-b3f0-f173e9e5e661@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac961946-bfe4-cf47-b3f0-f173e9e5e661@roeck-us.net>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wednesday 26 May 2021 09:10:05 Guenter Roeck wrote:
> On 5/19/21 6:29 AM, W_Armin@gmx.de wrote:
> > From: Armin Wolf <W_Armin@gmx.de>
> > 
> > This patch series is converting the dell-smm-hwmon driver
> > to the new hwmon registration API. In order to do so,
> > it introduces a platform device in the first patch, and
> > applies some optimisations in the next three patches.
> > The switch to the new hwmon registration API is done in
> > the last patch.
> > 
> > The caching of the fan/temp values was modified to better fit
> > the new hwmon API.
> > 
> > The patches work fine for my Dell Latitude C600, but i whould
> > appreciate someone testing the code on another model too.
> > 
> > Armin Wolf (5):
> >    hwmon: (dell-smm-hwmon) Use platform device
> >    hwmon: (dell-smm-hwmon) Mark functions as __init
> >    hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
> >    hwmon: (dell-smm-hwmon) Move variables into a driver private data
> >      structure
> >    hwmon: (dell-smm-hwmon) Convert to
> >      devm_hwmon_device_register_with_info()
> > 
> >   drivers/hwmon/dell-smm-hwmon.c | 860 ++++++++++++++++-----------------
> >   1 file changed, 425 insertions(+), 435 deletions(-)
> > 
> 
> Any chance to get a Reviewed-by/Tested-by: for the series from someone ?

Hello! I'm quite busy with other stuff. I will try to look and review
this patch series later.

> Thanks,
> Guenter
> 
> 
