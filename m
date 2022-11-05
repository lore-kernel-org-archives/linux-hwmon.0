Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799AEC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 14:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiKEOb3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 10:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiKEOb2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 10:31:28 -0400
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C43DEB3
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 07:31:26 -0700 (PDT)
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
        id 9327F124EEB2; Sat,  5 Nov 2022 15:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1667658684; bh=rRcwoiVg0me1qyX+SJsmb1/nVGafL1YmZEfNfmDnFuY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=l2hNnrOMYLxx0F49xj2GXXDYz5iq/8t9KhM2FczSSuC/IpSKtHX6dKMzJYc0m9AU/
         pHPmRScqQF/NpH3+7jlUwxgBfDbOFO+Vwq0xiBuJO1rv8k8pIhANzsJn/qAxniG4ZI
         x7ECWJKO52+jQxYL/60GdcpRQ2s7cbYtw2KCl88wzUaxIZz9au0bgNGbrx7NBOQJRi
         tjGMWWembrKFgSINZ4HzIR/a+EnYneJFNoWF9X2hZMcpdvkY3BE7QVotf6Jl9DQtVL
         4tKoa+4A/3kRL0nhtir8S4m/z5rrdrWPf3N0UzT/QeJojjWPQmxcG1/qup4rFbwmQx
         aGnjvTl3P3+2Q==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
        by shakotay.alphanet.ch (Postfix) with ESMTP id E8C71124AD6D
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 15:31:19 +0100 (CET)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
        id E10DA17F873; Sat,  5 Nov 2022 15:31:19 +0100 (CET)
Date:   Sat, 5 Nov 2022 15:31:19 +0100
From:   Marc SCHAEFER <schaefer@alphanet.ch>
To:     linux-hwmon@vger.kernel.org
Subject: Re: Power measurement wrong when idle
Message-ID: <20221105143119.GA27879@alphanet.ch>
References: <20221029123338.GA11915@alphanet.ch>
 <532f711c-6566-8a69-a199-4753bd24111e@roeck-us.net>
 <20221104105257.GA8083@alphanet.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104105257.GA8083@alphanet.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

On Fri, Nov 04, 2022 at 11:52:57AM +0100, Marc SCHAEFER wrote:
> so far I could install a 5.10 kernel on buster (that kernel contains drivers
> and some firmwares, in form of .ko).

I just compiled some stock kernels from kernel.org using make bindeb-pkg

The results:

4.19.260 HAS NOT the bug
4.19.264 HAS NOT the bug
5.0.1 HAS the bug
5.1   HAS the bug

If I understand it well, 5.0.1 is the first ever 5.x kernel and
4.19.264 the latest 4.x kernel.
