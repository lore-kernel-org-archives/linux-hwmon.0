Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 15:26:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180927222614.GA8430@Asurada-Nvidia.nvidia.com>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Sep 26, 2018 at 06:06:32AM -0700, Guenter Roeck wrote:
> > +static inline bool ina3221_is_enable(struct ina3221_data *ina, int channel)
> 
> s/is_enable/is_enabled/, maybe ?

Fixing.

> > +	return (config & INA3221_CONFIG_CHx_EN(channel)) > 0;
> 
> The "> 0" is unnecessary. Conversion to bool is automatic. If you want to make
> it explicit, please use
> 
> 	return !!(config & INA3221_CONFIG_CHx_EN(channel));

Removing "> 0".

> It should not be necessary to re-read the value from the chip all the time.
> I would suggest to cache the value in the 'disabled' variable.

Regarding this part, I added a cache before sending this one. But
I realized if the chip got powered off and rebooted during system
suspend/resume, the cache would not reflect the actual status. As
I mentioned earlier, this was enlightened by your comments about
the BIOS. So I feel it'd be safer to read the register every time
at this point, until I add the suspend/resume feature by syncing
with regcache. What do you think about it?

> > +	ret = kstrtoint(buf, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* inX_enable only accepts 1 for enabling or 0 for disabling */
> > +	if (val != 0 && val != 1)
> > +		return -EINVAL;
> > +
> Just use kstrtobool().

Fixing.

Thanks
Nicolin
