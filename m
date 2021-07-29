Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5F8C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4271F61054
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbhG2HYT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jul 2021 03:24:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234653AbhG2HYP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jul 2021 03:24:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D7FF60ED4;
        Thu, 29 Jul 2021 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627543452;
        bh=btRCOCoEwu9erYklZCra4PIZGnLlon8PT8MIKLUAgtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YGTgWu/mQy0jtU7i1pyyfT4FkgQ2QM+qw3lB6aFnChXgN6bdlrqPlBmpTMHmqM1wg
         ohz7dcefxS1odirhtf1oFv7MGl0q9+dLQw8aZ9XdYdKznZ6G2Z4YPI06NAs25Dh95m
         w9H60Gm8u6GGcpMOuxjacClyHLFlCoX5trMXeggo1wUZv5xXW0GzEqiB3xT073X2Nz
         n4ynr4OyvbHaJPIsvg4jKpu6bzZhJg+qveOzfzdH9nYb+VAA2ZtbQICDLfK0q3wOyB
         IPCkarKq8kkzra6y9g0bpDPpWZj2scshx0rdIarl+Q2fXfKhjymPvmAyhXoUcKnj1D
         P+GHTqacFPUbg==
Received: by pali.im (Postfix)
        id D2F48888; Thu, 29 Jul 2021 09:24:09 +0200 (CEST)
Date:   Thu, 29 Jul 2021 09:24:09 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Armin Wolf <W_Armin@gmx.de>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v7 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
Message-ID: <20210729072409.vr6ieb4yitbyeijf@pali>
References: <20210728221557.8891-1-W_Armin@gmx.de>
 <fb82b50e-fa7d-c735-262b-0ac930c4d8ee@roeck-us.net>
 <95502d8b-8a18-c600-4a42-9479a0f5c681@gmx.de>
 <f63299d4-34e0-87ab-5f27-970d81281a9b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f63299d4-34e0-87ab-5f27-970d81281a9b@roeck-us.net>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wednesday 28 July 2021 19:26:49 Guenter Roeck wrote:
> On 7/28/21 3:49 PM, Armin Wolf wrote:
> > Am 29.07.21 um 00:43 schrieb Guenter Roeck:
> > > On 7/28/21 3:15 PM, W_Armin@gmx.de wrote:
> > > > From: Armin Wolf <W_Armin@gmx.de>
> > > > 
> > > > This patch series is converting the dell-smm-hwmon driver
> > > > to the new hwmon registration API. In order to do so,
> > > > it introduces a platform device in the first patch, and
> > > > applies some optimisations in the next three patches.
> > > > The switch to the new hwmon registration API is done in
> > > > the next patch. The last patch is fixing a small bug.
> > > > 
> > > > The caching of the fan/temp values was modified to better fit
> > > > the new hwmon API.
> > > > 
> > > > The patches work fine for my Dell Latitude C600, but i whould
> > > > appreciate someone testing the code on another model too.
> > > > 
> > > 
> > > At this point I'd suggest to queue the series up in -next and see
> > > what happens. I don't think we'll get additional feedback.
> > > 
> > > Thought ? Objections ?
> > > 
> > > Guenter
> > > 
> > I agree, its unlikely that the code still has big issues, it works on
> > the C600.
> > The only thing still untested is reading fan rpm/changing fan control, but
> > i expect them to work.
> 
> Let's see if Pali has any objections. If not, I'll apply the series tomorrow.
> 
> Guenter
> 

Fine for me! Also I want to try to find some time to these patches on
more Dell laptops...
