Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 20 Sep 2018 18:20:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, afd@ti.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Get channel names from DT node
Message-ID: <20180921012038.GA23354@Asurada-Nvidia.nvidia.com>
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
 <20180921000753.21846-3-nicoleotsuka@gmail.com>
 <21a6e8f3-c95d-43d0-ca3f-3f91ddfeff07@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21a6e8f3-c95d-43d0-ca3f-3f91ddfeff07@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

Thanks for the review.

On Thu, Sep 20, 2018 at 05:41:48PM -0700, Guenter Roeck wrote:

> > Meanwhile, channels could be left unconnected based on
> > the hardware design. So the channel name should support
> > NC so the driver could disable the channel accordingly.
> > 
> 
> I am not in favor of such indirect settings. If a channel is
> to be disconnected, define a property for it.

OK. I can add a bool property for it instead.

> I am personally also not in favor of using devicetree to define
> channel names like this, much less so for a single driver.

As DT is used to describe hardware, I felt plausible to put
them in since the names are mentioned in the schematics. Do
you have any advise to handle this better?

> > +	/* Fetch hardware information from Device Tree */
> > +	for (i = 0, g = 0; i < INA3221_NUM_CHANNELS; i++) {
> > +		/* Fetch the channel name */
> > +		sprintf(prop, "ti,channel%d-name", i + 1);
> > +		/* Set a default name on failure */
> > +		if (of_property_read_string(np, prop, &str))
> > +			str = "unknown";
> 
> So if there are no devicetree entries, the user now gets a sequence of
> "unknown" sensors ? I don't think so. Please keep in mind that there are
> users of this chip who don't have devicetree systems, and other users
> may not want to specify any specific name properties (or they use sensors3.conf
> to do it).

Being enlightened by your comments below, maybe adding a
separate group for channel names by attaching is_visible
to it could be acceptable? Then, name nodes can hide from
those who don't want to specify.

> > +		/* Ignore unconnected channels */
> > +		if (!strcmp(str, INA3221_NOT_CONNECTED))
> > +			continue;
> 
> Sorry, I won't accept this. I am sure we can come up with some useful means
> to define in devicetree if individual channels of a hardware monitoring chip
> are enabled or not, but a channel name of "NC" won't be it.

I will try the bool property as you mentioned earlier.

> > +		/* Log connected channels */
> > +		ina->attr_group[g++] = &ina3221_group[i];
> > +		ina->channel_name[i] = str;
> > +		ina->enable[i] = true;
> 
> I also don't see the need for defining the group dynamically. The
> is_visible callback is very well suited for handling optional sysfs
> attributes.

I will add an is_visible callback.

Thanks
Nicolin
