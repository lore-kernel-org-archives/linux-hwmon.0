Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0893C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Nov 2022 10:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKDKxH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Nov 2022 06:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbiKDKxF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Nov 2022 06:53:05 -0400
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306C62B63C
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Nov 2022 03:53:03 -0700 (PDT)
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
        id CC21C125108E; Fri,  4 Nov 2022 11:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1667559181; bh=hgiZOKXiy9mopmGWSpZkMVfbxGy+xGhBx5rZNhEDb+A=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=KKVWBNDEgGfuJr5C95IxCQYbJNpSTZiszu+70gYdDH9dArz3lVtnfgdxi+4ysWgdM
         KJ7ivG3T871p/VkZxZKF9aH/P7hcS494k9n2IHgbCXcqS4isHr+VOkF1ukoRejnRB9
         sMfrZHW74AlEAD62jOyRVVlGEcwEWzupQX+/IxbYkcjXjzRnYjkoY3C5a8fp9X6edi
         oB0TwE12JHhCG33ZbXiwZE4O3smQ5ojpoYDnuuf6sJRfK+3uDNUVavAuPRJ6zqNNqg
         gSNX5khHkA65P8b6vZvFFn3SJSHdR2zxahMqh3543dMHt7w9NOWzvp27rYoFjBt1uS
         Vh2ovEaVRCQ5A==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
        by shakotay.alphanet.ch (Postfix) with ESMTP id C06DA124ACB3
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Nov 2022 11:52:57 +0100 (CET)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
        id B937117FC0E; Fri,  4 Nov 2022 11:52:57 +0100 (CET)
Date:   Fri, 4 Nov 2022 11:52:57 +0100
From:   Marc SCHAEFER <schaefer@alphanet.ch>
To:     linux-hwmon@vger.kernel.org
Subject: Re: Power measurement wrong when idle
Message-ID: <20221104105257.GA8083@alphanet.ch>
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

Hello Guenter,

so far I could install a 5.10 kernel on buster (that kernel contains drivers
and some firmwares, in form of .ko).

Nothing else was installed, and the bug is now present (was not with 4.19).

So, now, I will try the first stock kernel 5 release manually.
