Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39461 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752231AbeF2ReD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Jun 2018 13:34:03 -0400
Date: Fri, 29 Jun 2018 10:34:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        vadimp@mellanox.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] net: phy: sfp: Add HWMON support for module
 sensors
Message-ID: <20180629173401.GB7470@roeck-us.net>
References: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
 <1530218475-4369-3-git-send-email-andrew@lunn.ch>
 <20180628224123.GA20118@roeck-us.net>
 <20180629074540.GC11285@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180629074540.GC11285@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 29, 2018 at 09:45:40AM +0200, Andrew Lunn wrote:
> > > +	case hwmon_power:
> > > +		/* External calibration of receive power requires
> > > +		 * floating point arithmetic. Doing that in the kernel
> > > +		 * is not easy, so just skip it. If the module does
> > > +		 * not require external calibration, we can however
> > > +		 * show receiver power, since FP is then not needed.
> > > +		 */
> > > +		if (sfp->id.ext.diagmon & SFP_DIAGMON_EXT_CAL &&
> > > +		    channel == 1)
> > > +			return 0;
> > 
> > It would be nice if it was possible to convert the floting point to
> > a fixed point calculation. Would that be possible ?
> 
> Maybe. I decided to leave it for later.
> 
> The kernel has some support for emulating floating point hardware, by
> doing floating point operations in software. I didn't find any
> examples of using that code outside of emulation, but i wondered if it
> would be possible to use it here. We don't need high performance here,
> when just reading a sensor once per second.
> 
> > > +/* Sensors values are stored as two bytes, MSB second */
> > > +static int sfp_hwmon_read_sensor(struct sfp *sfp, int reg, long *value)
> > > +{
> > > +	u8 val[2];
> > > +	int err;
> > > +
> > > +	err = sfp_read(sfp, true, reg, val, 2);
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	*value = val[0] << 8 | val[1];
> > > +
> > 
> > Any chance to use something like __be16 and be16_to_cpu() ?
> > You do that elsewhere - why not here ?
> 
> Yes. I want to look at this again. I don't like it either.
> 
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

... which wasn't reviewed by a hwmon maintainer, so I take no
responsibility (it does look pretty clean, though). Wonder if anyone
noticed that the hwmon interface is disabled if HWMON is built as module.

> borrowed it from. Is there a hwmon core function which we can pass an
> arbitrary name to and it returned a sanitised one? Maybe we should add
> one?
> 
Maybe, but I am not sure how to allocate the replacement string.
You are using devm_kstrdup() which is another devm_ function that you
should probably not use. How about declaring hwmon_name[] with a fixed
maximum length in sfp ? The memory savings from dynamic allocation (if
there are any) seem negligible.

> > > +	sfp->hwmon_name[j] = '\0';
> > > +
> > Is it possible that j == 0 ?
> 
> Hummm....
> 
> sfp->hwmon_name is derived from dev_name(sfp->dev), which comes from
> pdev->dev in the probe function. That comes from the device tree node
> name. I suppose it is possible to name the node $@#$@, but i suspect
> Rob would NACK it :-)
> 
> I can add a check for j==0 and return -EINVAL.
> 
I would prefer replacing invalid characters with '_', but I won't argue. 

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
> 
As Russell pointed out, devm_ functions are inappropriate in this case.

Thanks,
Guenter
