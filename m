Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
Date: Fri, 29 Jun 2018 09:45:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>, vadimp@mellanox.com,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] net: phy: sfp: Add HWMON support for module
 sensors
Message-ID: <20180629074540.GC11285@lunn.ch>
References: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
 <1530218475-4369-3-git-send-email-andrew@lunn.ch>
 <20180628224123.GA20118@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628224123.GA20118@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

> > +	case hwmon_power:
> > +		/* External calibration of receive power requires
> > +		 * floating point arithmetic. Doing that in the kernel
> > +		 * is not easy, so just skip it. If the module does
> > +		 * not require external calibration, we can however
> > +		 * show receiver power, since FP is then not needed.
> > +		 */
> > +		if (sfp->id.ext.diagmon & SFP_DIAGMON_EXT_CAL &&
> > +		    channel == 1)
> > +			return 0;
> 
> It would be nice if it was possible to convert the floting point to
> a fixed point calculation. Would that be possible ?

Maybe. I decided to leave it for later.

The kernel has some support for emulating floating point hardware, by
doing floating point operations in software. I didn't find any
examples of using that code outside of emulation, but i wondered if it
would be possible to use it here. We don't need high performance here,
when just reading a sensor once per second.

> > +/* Sensors values are stored as two bytes, MSB second */
> > +static int sfp_hwmon_read_sensor(struct sfp *sfp, int reg, long *value)
> > +{
> > +	u8 val[2];
> > +	int err;
> > +
> > +	err = sfp_read(sfp, true, reg, val, 2);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	*value = val[0] << 8 | val[1];
> > +
> 
> Any chance to use something like __be16 and be16_to_cpu() ?
> You do that elsewhere - why not here ?

Yes. I want to look at this again. I don't like it either.

> > +	for (i = j = 0; sfp->hwmon_name[i]; i++) {
> > +		if (isalnum(sfp->hwmon_name[i])) {
> > +			if (i != j)
> > +				sfp->hwmon_name[j] = sfp->hwmon_name[i];
> > +			j++;
> > +		}
> > +	}
> 
> It might be better and simpler to replace invalid characters with '_'
> instead of dropping them. Also note that '_' is a valid character.
> Strictly speaking only "-* \t\n" are invalid.

I borrowed this code from the marvell10g driver. I don't know where it
borrowed it from. Is there a hwmon core function which we can pass an
arbitrary name to and it returned a sanitised one? Maybe we should add
one?

> > +	sfp->hwmon_name[j] = '\0';
> > +
> Is it possible that j == 0 ?

Hummm....

sfp->hwmon_name is derived from dev_name(sfp->dev), which comes from
pdev->dev in the probe function. That comes from the device tree node
name. I suppose it is possible to name the node $@#$@, but i suspect
Rob would NACK it :-)

I can add a check for j==0 and return -EINVAL.
 
> > +	sfp->hwmon_dev = devm_hwmon_device_register_with_info(sfp->dev,
> > +				sfp->hwmon_name, sfp, &sfp_hwmon_chip_info,
> > +				NULL);
> > +
> > +	return PTR_ERR_OR_ZERO(sfp->hwmon_dev);
> > +}
> > +
> > +static void sfp_hwmon_remove(struct sfp *sfp)
> > +{
> > +	devm_hwmon_device_unregister(sfp->hwmon_dev);
> 
> If registartion and removal are not tied to a device, it doesn't make sense
> to use devm_ functions. Either use hwmon_device_register_with_info()
> and hwmon_device_unregister(), or drop the remove function.

Yes. I can change it. We have a few different lifetimes involved
here. You can consider the driver probe being for the SFP cage. The
SFP module being inserted into the cage is a different life time, and
the lifetime of the hwmon device.

    Andrew
