Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FA6C38A02
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 14:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiJ3OPa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Oct 2022 10:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3OP3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Oct 2022 10:15:29 -0400
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1A0B485
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 07:15:27 -0700 (PDT)
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
        id 0C5BB124ADFE; Sun, 30 Oct 2022 15:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1667139325; bh=wC2P5vr269voGXTbUuueed2nVgxgcD06eHyms3HXf1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CLo/wXa0iypKn50QSq/PR5C+T/cZuah7YZSAbcmuAf6SRb+LvSldrFOjICRquM0mP
         XGViBjiAzYBQ2QuTFLwBf9J0OD/O/Q9fJRon9NbXcvNKRGeMNRjuXloPsCD7FK+njn
         UurRBmfR2TSlfzPjUEGDhKZr4opKiqjh88UqGxi8PHI9tr5vgnryqwJzyeMVoKZ0ad
         go5fUH2sLisIZX0Ml4Wlb2Z5mmDsQxj1AIbWXAgiwLB0QFXAoMEcggCfKL0sWZODyg
         TUix1ZAZ+/9+0rCxRBy12WNqo5t1sFvsuj0ASrLRTsjo6J25wvLfdDrRZhcwgI28gE
         0wc1QdYNHkA3A==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
        by shakotay.alphanet.ch (Postfix) with ESMTP id 061DC1245F5E;
        Sun, 30 Oct 2022 15:15:16 +0100 (CET)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
        id F2D0C17FA95; Sun, 30 Oct 2022 15:15:15 +0100 (CET)
Date:   Sun, 30 Oct 2022 15:15:15 +0100
From:   Marc SCHAEFER <schaefer@alphanet.ch>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: Power measurement wrong when idle
Message-ID: <20221030141515.GA4547@alphanet.ch>
References: <20221029123338.GA11915@alphanet.ch>
 <532f711c-6566-8a69-a199-4753bd24111e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532f711c-6566-8a69-a199-4753bd24111e@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

On Sat, Oct 29, 2022 at 06:52:41AM -0700, Guenter Roeck wrote:
> - Debian might carry some non-upstream driver patches causing the problem
>   (or fixing it in the older kernel, and the patch was not applied to the
>   new kernel).

I think I diffed the two kernel sources properly.

> - Debian installs its own version of the CPU firmware, and the version
>   installed with the newer kernel introduces the problem.

Possible, at least the CPU firmwares are the same version according to
/proc/cpuinfo.

> For the last one, the only means I could think of would be to bisect between
> the good and the bad version.

Yes, I will try that as soon as I have hardware that I can remove from
production.

Thank you.
