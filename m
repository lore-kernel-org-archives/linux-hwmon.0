Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD40E95A61
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Oct 2023 11:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343865AbjJGLWH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Oct 2023 07:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343859AbjJGLWG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Oct 2023 07:22:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77648B6;
        Sat,  7 Oct 2023 04:22:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CB0C433C8;
        Sat,  7 Oct 2023 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696677725;
        bh=Z5uEds1Mo99/fmj7mVc1AcM0874N3EkljcgDY7j9jSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIqjDr7E+QSsNPIJbf1T2sZ2bm/euOWRYPbQxRPe4L+ZJ9FJgNfWQVBffyDNxBVUx
         M/sN7cycEzhv020tJW2YWoyBTuTVOSUafG+5X26Nap3002ykWVYhyfC1DCYvqeHvx6
         uE5c+1Wt1oF2S50Cp48MJJXyfqTdIWQPWugM06Ys=
Date:   Sat, 7 Oct 2023 13:22:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     stable@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: hwmon: (nzxt-smart2) backport device ids to v6.1
Message-ID: <2023100753-quarrel-harbor-a6f3@gregkh>
References: <CADnvcfJn--J-51tjOVe2Z55Y8CxnXePXmP9V_j9HkVOt-RH4LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnvcfJn--J-51tjOVe2Z55Y8CxnXePXmP9V_j9HkVOt-RH4LA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 22, 2023 at 09:33:56PM +0300, Aleksandr Mezin wrote:
> Please pick the following commits:
> 
> - e247510e1baad04e9b7b8ed7190dbb00989387b9 hwmon: (nzxt-smart2) Add device id
> - 4a148e9b1ee04e608263fa9536a96214d5561220 hwmon: (nzxt-smart2) add
> another USB ID
> 
> into v6.1 stable kernel. They add device ids for nzxt-smart2 hwmon
> driver, and they don't require any other code changes. This will
> synchronize the driver code with v6.3.

Both now queued up, thanks.

greg k-h
