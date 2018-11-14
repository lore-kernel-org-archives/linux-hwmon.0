Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42568 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbeKNKM3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Nov 2018 05:12:29 -0500
Date: Tue, 13 Nov 2018 16:11:42 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add single-shot mode support
Message-ID: <20181114001141.GA14925@Asurada-Nvidia.nvidia.com>
References: <20181113042353.1507-1-nicoleotsuka@gmail.com>
 <20181113043248.GB11205@roeck-us.net>
 <20181113045823.GB26327@Asurada-Nvidia.nvidia.com>
 <20181113172102.GA21714@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113172102.GA21714@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Tue, Nov 13, 2018 at 09:21:02AM -0800, Guenter Roeck wrote:
> > > > INA3221 supports both continuous and single-shot modes. When
> > > > running in the continuous mode, it keeps measuring the inputs
> > > > and converting them to the data register even if there are no
> > > > users reading the data out. In this use case, this could be a
> > > > power waste.
> > > > 
> > > > So this patch adds a single-shot mode support so that ina3221
> > > > could do measurement and conversion only if users trigger it,
> > > > depending on the use case where it only needs to poll data in
> > > > a lower frequency.
> > > > 
> > > > The change also exposes "mode" and "available_modes" nodes to
> > > > allow users to switch between two operating modes.
> > > > 
> > > Lots and lots of complexity for little gain. Sorry, I don't see
> > > the point of this change.
> > 
> > The chip is causing considerable power waste on battery-powered
> > devices so we typically use it running in the single-shot mode.
> 
> And you need to be able to do that with a sysfs attribute ?
> Are you planning to have some code switching back and forth
> between the modes ?
>
> You'll need to provide a good rationale why this needs to be
> runtime configurable.

Honestly, our old downstream driver didn't expose it via sysfs.
Instead, it had a built-in "governor" to switch modes based on
the CPU hotplug state and cpufreq. However, the interface used
to register a CPU hotplug notification was already deprecated.
And I don't feel this governor is generic enough to be present
in the mainline code.

For me, it's not that necessary to be a sysfs attribute. I try
to add it merely because I cannot find a good criteria for the
mode switching in a hwmon driver. So having an open sysfs node
may allow user space power daemon to decide its operating mode,
since it knows which power mode the system is running at: full
speed (charging/charged) or power saving (on-battery), and it
knows how often this exact service will poll the sensor data.

An alternative way (without the sysfs node), after looking at
other hwmon code, could be to have a timed polling thread and
read data using an update_interval value from ABI. This might
turn out to be more complicated as it'll also involve settings
of hardware averaging and conversion time. Above all, I cannot
figure out a good threshold of update_interval to switch modes.

If you can give some advice of a better implementation, that'd
be great.

Thanks
Nicolin
