Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34287 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752554AbdIEQpG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 12:45:06 -0400
Date: Tue, 5 Sep 2017 09:45:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Add support for family 17h
Message-ID: <20170905164503.GA11478@roeck-us.net>
References: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
 <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
 <1e168fdb-862f-60f1-d119-918e00aac1f5@roeck-us.net>
 <705bb285-c532-a52e-b350-bd2b44b67b81@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705bb285-c532-a52e-b350-bd2b44b67b81@ladisch.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 05, 2017 at 04:12:07PM +0200, Clemens Ladisch wrote:
> Guenter Roeck wrote:
> > On 09/04/2017 11:47 PM, Clemens Ladisch wrote:
> >> Guenter Roeck wrote:
> >>> Some of this is guesswork, but afaics it is working. No idea if there
> >>> is a better way to determine the temperature offset.
> >>
> >> The reported value is not an absolute temperature on any CPU.
> >>
> >> As far as I know, the offset is not guaranteed to be fixed for any model,
> >> i.e., it would be pointless to apply the offset observed on one specific
> >> chip.
> >
> > What we should do then, as we did for coretemp, would be to collect the various
> > temperature offsets (and temperature limits, for that matter) and apply per-CPU
> > adjustments. Are the offsets documented somewhere ?
> 
> AMD says:
>  "Tctl is the processor temperature control value, used by the platform to
>   control cooling systems. Tctl is a non-physical temperature on an
>   arbitrary scale measured in degrees. It does _not_ represent an actual
>   physical temperature like die or case temperature. Instead, it specifies
>   the processor temperature relative to the point at which the system must
>   supply the maximum cooling for the processor's specified maximum case
>   temperature and maximum thermal power dissipation."
> 


Pretty much the same as Intel. That doesn't mean we should not (try to) report
the real temperature as good as we can, as at least most of the BIOSes do,
and as all the Windows tools do, and as users expect us to do.

Do we really have to argue about this ? If you insist, I'll drop the
adjustments and refer all resulting inquiries to you.

Thanks,
Guenter
