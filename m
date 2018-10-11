Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 11 Oct 2018 12:53:23 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Add operating mode support
Message-ID: <20181011195321.GA5567@Asurada-Nvidia.nvidia.com>
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
 <20181010043310.30873-3-nicoleotsuka@gmail.com>
 <32c22986-544e-aca1-12bf-9080667cf499@roeck-us.net>
 <20181010230906.GB1706@Asurada-Nvidia.nvidia.com>
 <20181010234300.GA25480@roeck-us.net>
 <20181011002411.GA10379@Asurada-Nvidia.nvidia.com>
 <20181011193152.GA4854@roeck-us.net>
 <20181011193658.GA3828@Asurada-Nvidia.nvidia.com>
 <20181011195025.GA7038@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181011195025.GA7038@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Oct 11, 2018 at 12:50:25PM -0700, Guenter Roeck wrote:
> Hi Nicolin,
> 
> On Thu, Oct 11, 2018 at 12:36:59PM -0700, Nicolin Chen wrote:
> > On Thu, Oct 11, 2018 at 12:31:52PM -0700, Guenter Roeck wrote:
> > 
> > > > One more question here, and this might sound a bit abuse of using
> > > > the existing hwmon ABI: would it sound plausible to you that the
> > > > driver powers down the chip when all three channels get disabled
> > > > via in[123]_enable nodes? :)
> > > > 
> > > 
> > > I would not call that an abuse, no.
> > 
> > Hmm..do you mean that you aren't in favor of powering down the chip
> > after all channels get disabled?
> > 
> No, I was trying to say that I would be ok with powering down the chip.

Great!

> > I was thinking about having pm_runtime_get_sync()/put() for channel
> > enabling/disabling routine of in[123]_enable.
> > 
> 
> Not sure if that would work. It might end up waking the chip when a
> sysfs attribute is accessed. It might be worth a try, though.
> 
> It might also be possible to utilize userspace runtime attributes,
> like setting runtime_enabled and setting the idle time before the sensor
> shuts down. It would probably be necessary to implement not only
> activating the sensor, though - we would also need to to ensure that
> the first reading after activation waits until the first read is
> complete.

That's true. Thanks for the input!

Nicolin
