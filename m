Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47875 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932779AbeFGPtR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Jun 2018 11:49:17 -0400
Date: Thu, 7 Jun 2018 08:49:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kai Heng Feng <kai.heng.feng@canonical.com>
Cc: Chris Ouellet <rabbit.of.war@gmail.com>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Ryzen 2700 Temperature offset?
Message-ID: <20180607154915.GA7061@roeck-us.net>
References: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 07, 2018 at 11:03:13AM +0800, Kai Heng Feng wrote:
> Hi Guenter,
> 
> A user thinks the Ryzen 2700 temperature may not be correct [1].
> Can you take a look when you have time? Thanks.
> 
> Also, where can I find all these temperature offsets? I googled but with no
> result.
> 
Problem is that the offsets are not documented in public, making it
difficult to find out. For Ryzen 2700, there is currently no offset
configured; I was told that there is none. For Ryzen 2700X, the offset
is 10 degrees C.

> [1] https://bugs.launchpad.net/bugs/1774817

The key here is the commit mentioned in the log (1b59788979acd). It does
not only adjust the per-CPU offset, but also takes a configurable offset
of 49 degrees C into account. You'll need to apply that patch in your
kernel, or the temperature may be off by 49 degrees C.

Hope this helps. If not, please let me know. Note that I am travelling;
responses may be delayed.

Guenter
