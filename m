Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44326 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730995AbeKNDUF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 22:20:05 -0500
Date: Tue, 13 Nov 2018 09:21:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add single-shot mode support
Message-ID: <20181113172102.GA21714@roeck-us.net>
References: <20181113042353.1507-1-nicoleotsuka@gmail.com>
 <20181113043248.GB11205@roeck-us.net>
 <20181113045823.GB26327@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113045823.GB26327@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 08:58:24PM -0800, Nicolin Chen wrote:
> Hi Guenter,
> 
> On Mon, Nov 12, 2018 at 08:32:48PM -0800, Guenter Roeck wrote:
> > On Mon, Nov 12, 2018 at 08:23:53PM -0800, Nicolin Chen wrote:
> > > INA3221 supports both continuous and single-shot modes. When
> > > running in the continuous mode, it keeps measuring the inputs
> > > and converting them to the data register even if there are no
> > > users reading the data out. In this use case, this could be a
> > > power waste.
> > > 
> > > So this patch adds a single-shot mode support so that ina3221
> > > could do measurement and conversion only if users trigger it,
> > > depending on the use case where it only needs to poll data in
> > > a lower frequency.
> > > 
> > > The change also exposes "mode" and "available_modes" nodes to
> > > allow users to switch between two operating modes.
> > > 
> > Lots and lots of complexity for little gain. Sorry, I don't see
> > the point of this change.
> 
> The chip is causing considerable power waste on battery-powered
> devices so we typically use it running in the single-shot mode.
> 

And you need to be able to do that with a sysfs attribute ?
Are you planning to have some code switching back and forth
between the modes ?

You'll need to provide a good rationale why this needs to be
runtime configurable.

Guenter

> Although the chip now can be powered down, but we still need to
> occasionally poll it for power measurement and critical alerts,
> so single-shot mode is the best choice for us, considering that
> the power-down-and-up routine would be way heavier.
> 
> I could understand that you don't really like it, but it's some
> feature that we truly need. Do you have any suggestion to write
> the code that can make it more convincing to you?
> 
> Thanks
> Nicolin
