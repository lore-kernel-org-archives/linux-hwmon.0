Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B827C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 11:35:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3652613AE
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 11:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTLgA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:36:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:55408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230290AbhDTLf7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 07:35:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C285D61354;
        Tue, 20 Apr 2021 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618918528;
        bh=LpsRxlZsny9TaXQpyCy9pwBQyrRKZ3OPTvlseNIXZ5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVP3l1u2IbGMaJAwJKHQTFR+M1LWF8TVdS/Dw0bsTkHfqOsf6mLWhvHrSXXjUUwne
         oZg5+s651zj72Pr49qVPa3pgfv7Yzppa8XYsAWDI1T1rZ2OpjjTsrR/Bz13hBIFYKD
         C4OXyKxNxF7WXKiPSB5dDLp39f0DcvTQ57r9qLFw=
Date:   Tue, 20 Apr 2021 13:35:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH] hwmon: Remove amd_energy driver
Message-ID: <YH68fQZsp2/sZ85z@kroah.com>
References: <20210420112011.158160-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420112011.158160-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 20, 2021 at 04:20:11AM -0700, Guenter Roeck wrote:
> Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
> the counters") restricted visibility of AMD energy counters to work
> around a side-channel attack using energy data to determine which
> instructions are executed. The attack is described in 'PLATYPUS:
> Software-based Power Side-Channel Attacks on x86'. It relies on quick
> and accurate energy readings.
> 
> This change made the counters provided by the amd_energy driver
> effectively unusable for non-provileged users. However, unprivileged
> read access is the whole point of hardware monitoring attributes.
> 
> An attempt to remedy the situation by limiting and randomizing access
> to chip registers was rejected by AMD. Since the driver is for all
> practical purposes unusable, remove it.
> 
> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Note:
>     This submission supersedes the set of patches which was
>     limiting and randomizing RAPL register access.

Sad, maybe AMD will fix their hardware someday :(

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
