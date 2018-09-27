Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 16:14:59 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180927231458.GA31793@Asurada-Nvidia.nvidia.com>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
 <20180927222614.GA8430@Asurada-Nvidia.nvidia.com>
 <20180927225200.GE9198@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927225200.GE9198@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 27, 2018 at 03:52:00PM -0700, Guenter Roeck wrote:

> The proper fix for this problem would be to add support for suspend /
> resume to the driver. At resume time, all channels will have been
> re-enabled if the chip was powered off, even if they were explicitly
> disabled by devicetree (or via explicit configuration). This means
> the driver just behaves badly across suspend/resume, period.
> Displaying a raw value instead of a cached one doesn't solve that
> problem. By using a cached value, at least the user would not notice
> that the chip no longer does what it is supposed to be doing.
>
> I guess we just have different priorities. If I think suspend/resume
> is a problem for my use case, I would just go ahead and fix it.
> I would not try to write code that doesn't fix the problem causing it,
> much less argue for it.

I agree.

> Having said that, I didn't mention that part in my other reply,
> meaning I'll accept the code as is.

Thanks for the generosity. But, since Rob hasn't acked yet, let
me write the patch for suspend and resume first, which shouldn't
take long.

Thanks
Nicolin
