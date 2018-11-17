Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Fri, 16 Nov 2018 17:51:34 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add single-shot mode support
Message-ID: <20181117015131.GA10407@Asurada-Nvidia.nvidia.com>
References: <20181113042353.1507-1-nicoleotsuka@gmail.com>
 <20181113043248.GB11205@roeck-us.net>
 <20181113045823.GB26327@Asurada-Nvidia.nvidia.com>
 <20181113172102.GA21714@roeck-us.net>
 <20181114001141.GA14925@Asurada-Nvidia.nvidia.com>
 <20181114172330.GA25592@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181114172330.GA25592@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter,

On Wed, Nov 14, 2018 at 09:23:30AM -0800, Guenter Roeck wrote:
> > An alternative way (without the sysfs node), after looking at
> > other hwmon code, could be to have a timed polling thread and
> > read data using an update_interval value from ABI. This might
> > turn out to be more complicated as it'll also involve settings
> > of hardware averaging and conversion time. Above all, I cannot
> > figure out a good threshold of update_interval to switch modes.
> > 
> update_interval should only be used if it can be configured
> into hardware, not to trigger a polling thread. It should only
> be used in the driver to determine caching intervals.

I see..so it's more like the conversion time settings instead.

> > If you can give some advice of a better implementation, that'd
> > be great.
> > 
> From your description, the only real feasible solution would be a
> generic one, with a well defined interface either to userspace or
> to the kernel. The best I can think of would be an in-kernel API
> setting the power operational mode via callbacks. Alternative would
> be a generic ability to set power operational mode from userspace,
> using an ABI which applies to all drivers, not just one.

Hmm. That would make the situation really complicated, I could
understand your concern though.

I searched a little and found that, while the initial ina3221
hwmon driver was under review, Laxman submitted an IIO version
where Jonathan had a similar comments against its "mode" node:
https://www.spinics.net/lists/linux-hwmon/msg00219.html

Quote from his comments {
 * There is a lot of ABI in here concerned with oneshot vs continuous.
 This seems to me to be more than it should be. We wouldn't expect to
 see stuff changing as a result of switching between these modes other
 than wrt to when the data shows up.  So I'd expect to not see this
 directly exposed at all - but rather sit in oneshot unless either:
 1) Buffered mode is running (not currently supported)
 2) Alerts are on - which I think requires it to be in continuous mode.
}

Since hwmon driver doesn't support buffered mode, what do you
think about having the chip run in single-shot mode by default
but changing it if alerts are on? Though the driver also needs
to support to enable warning/critical alert pins.

In short, other than exposing it via a generic ABI to the user
space, how about defining some policy to maintaining it within
the driver?

Thanks
Nicolin
