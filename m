Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 11:39:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180927183912.GA15719@Asurada-Nvidia.nvidia.com>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
 <20180926180243.GA6329@Asurada-Nvidia.nvidia.com>
 <20180926195817.GA19695@roeck-us.net>
 <20180926202519.GB10595@Asurada-Nvidia.nvidia.com>
 <20180926204455.GA17035@roeck-us.net>
 <20180926215504.GC10595@Asurada-Nvidia.nvidia.com>
 <20180927160509.GA18064@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927160509.GA18064@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter,

On Thu, Sep 27, 2018 at 09:05:09AM -0700, Guenter Roeck wrote:
> > > Point is that I don't _know_ how this is going to be used, so I'd
> > > rather keep it flexible.
> > 
> > Well, taking one step back, I am okay to follow your way if you
> > are really firm about it. Just please give me a more reply and
> > I will merge this change to that v5, dropping the is_visible().
> 
> Quite obviously we are not converging. Given that, I think it
> would be better to shelve the new attributes for now and to wait
> for an actual user who actually needs the new attributes.

I would rather remove the hiding code, if we have to sacrifice
one of them. We both agreed that in[123]_enable is more useful.
And actually we will still keep is_visible() for empty labels.
So even if one day we somehow feel safe to hide a disconnected
channel one day, it'd only need a couple of lines of changes.

I will squash this change into v6, and will send it after I fix
things that Rob pointed out at DT binding.

Thank you
Nicolin
