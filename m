Return-Path: <linux+linux=roeck-us.net@armlinux.org.uk>
Return-path: <linux+linux=roeck-us.net@armlinux.org.uk>
Date: Fri, 29 Jun 2018 16:47:19 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, vadimp@mellanox.com,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] net: phy: sfp: Add HWMON support for module
 sensors
Message-ID: <20180629154718.GI17271@n2100.armlinux.org.uk>
References: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
 <1530218475-4369-3-git-send-email-andrew@lunn.ch>
 <20180628224123.GA20118@roeck-us.net>
 <20180629074540.GC11285@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180629074540.GC11285@lunn.ch>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jun 29, 2018 at 09:45:40AM +0200, Andrew Lunn wrote:
> > > +	for (i = j = 0; sfp->hwmon_name[i]; i++) {
> > > +		if (isalnum(sfp->hwmon_name[i])) {
> > > +			if (i != j)
> > > +				sfp->hwmon_name[j] = sfp->hwmon_name[i];
> > > +			j++;
> > > +		}
> > > +	}
> > 
> > It might be better and simpler to replace invalid characters with '_'
> > instead of dropping them. Also note that '_' is a valid character.
> > Strictly speaking only "-* \t\n" are invalid.
> 
> I borrowed this code from the marvell10g driver. I don't know where it
> borrowed it from. Is there a hwmon core function which we can pass an
> arbitrary name to and it returned a sanitised one? Maybe we should add
> one?

... which in turn came from the marvell driver.

> > > +	sfp->hwmon_dev = devm_hwmon_device_register_with_info(sfp->dev,
> > > +				sfp->hwmon_name, sfp, &sfp_hwmon_chip_info,
> > > +				NULL);
> > > +
> > > +	return PTR_ERR_OR_ZERO(sfp->hwmon_dev);
> > > +}
> > > +
> > > +static void sfp_hwmon_remove(struct sfp *sfp)
> > > +{
> > > +	devm_hwmon_device_unregister(sfp->hwmon_dev);
> > 
> > If registartion and removal are not tied to a device, it doesn't make sense
> > to use devm_ functions. Either use hwmon_device_register_with_info()
> > and hwmon_device_unregister(), or drop the remove function.
> 
> Yes. I can change it. We have a few different lifetimes involved
> here. You can consider the driver probe being for the SFP cage. The
> SFP module being inserted into the cage is a different life time, and
> the lifetime of the hwmon device.

It should be the lifetime of the inserted module, since the presence
of the monitoring devices is module dependent - and obviously when
the module is removed, there's no monitoring devices accessible.

Guenter is correct, this should not be using the devm_* functions.

Another point is (I've not checked your original patch for this) is
that we don't want to fail the probe of the SFP module if the hwmon
failed to register - we just need to remember not to try to unregister
an invalid pointer thereby oopsing the kernel.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
