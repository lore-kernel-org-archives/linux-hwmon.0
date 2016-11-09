Return-path: <clemens.gruber@pqgruber.com>
Date: Wed, 9 Nov 2016 21:43:16 +0100
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (mcp3021) add devicetree support
Message-ID: <20161109204316.GA21426@archie.localdomain>
References: <20161109171614.9730-1-clemens.gruber@pqgruber.com>
 <20161109193206.GB22665@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161109193206.GB22665@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 09, 2016 at 11:32:06AM -0800, Guenter Roeck wrote:
> On Wed, Nov 09, 2016 at 06:16:13PM +0100, Clemens Gruber wrote:
> > Support setting the reference voltage from the device tree.
> > 
> > Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> > ---
> >  drivers/hwmon/mcp3021.c | 46 ++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 36 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
> > index 972444a..81f4b7f 100644
> > --- a/drivers/hwmon/mcp3021.c
> > +++ b/drivers/hwmon/mcp3021.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (C) 2008-2009, 2012 Freescale Semiconductor, Inc.
> >   * Author: Mingkai Hu <Mingkai.hu@freescale.com>
> >   * Reworked by Sven Schuchmann <schuchmann@schleissheimer.de>
> > + * Copyright (C) 2016 Clemens Gruber <clemens.gruber@pqgruber.com>
> 
> Sorry, I can't accept that for such a minor change. Feel free to add
> something like "devicetree support added by ...", if you like.

I understand, no problem. I'll use your suggestion then.

> 
> >   *
> >   * This driver export the value of analog input voltage to sysfs, the
> >   * voltage unit is mV. Through the sysfs interface, lm-sensors tool
> > @@ -22,11 +23,13 @@
> >  #include <linux/i2c.h>
> >  #include <linux/err.h>
> >  #include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  
> > -/* Vdd info */
> > +/* Vdd / reference voltage in millivolt */
> >  #define MCP3021_VDD_MAX		5500
> >  #define MCP3021_VDD_MIN		2700
> > -#define MCP3021_VDD_REF		3300
> > +#define MCP3021_VDD_DEFAULT	3300
> 
> I don't really see the value of changing this, but if it makes you
> feel better at least make it MCP3021_VDD_REF_DEFAULT.

I changed it because all three defines are about the reference voltage,
not only the last one, which is just the default value.

Only changing the last one to MCP3021_VDD_REF_DEFAULT would not make it
less confusing.
Maybe replace MCP3021_VDD_ with MCP3021_VDD_REF_ for all three?

> 
> >  
> >  /* output format */
> >  #define MCP3021_SAR_SHIFT	2
> > @@ -47,7 +50,7 @@ enum chips {
> >   */
> >  struct mcp3021_data {
> >  	struct device *hwmon_dev;
> > -	u32 vdd;	/* device power supply */
> > +	u32 vdd;        /* supply and reference voltage in millivolt */
> >  	u16 sar_shift;
> >  	u16 sar_mask;
> >  	u8 output_res;
> > @@ -106,6 +109,7 @@ static int mcp3021_probe(struct i2c_client *client,
> >  {
> >  	int err;
> >  	struct mcp3021_data *data = NULL;
> > +	struct device_node *np = client->dev.of_node;
> >  
> >  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> >  		return -ENODEV;
> > @@ -117,6 +121,21 @@ static int mcp3021_probe(struct i2c_client *client,
> >  
> >  	i2c_set_clientdata(client, data);
> >  
> > +	if (np) {
> > +		if (of_property_read_u32(np, "reference-voltage-microvolt",
> > +					 &data->vdd))
> > +			data->vdd = MCP3021_VDD_DEFAULT;
> > +		else
> > +			data->vdd /= 1000;
> 
> It would be slightly better to reverse the logic here to make the code easier
> to read.
> 
> 		if (!of_property_read_u32(np, "reference-voltage-microvolt",
> 					  &data->vdd))
> 			data->vdd /= 1000;
> 		else
> 			data->vdd = MCP3021_VDD_DEFAULT;

Yes, I'll change it.

> 
> Not worth arguing about it, though, so feel free to keep it as is.
> 
> > +	} else {
> > +		u32 *pdata = dev_get_platdata(&client->dev);
> > +
> > +		if (pdata)
> > +			data->vdd = *pdata;
> > +		else
> > +			data->vdd = MCP3021_VDD_DEFAULT;
> > +	}
> > +
> >  	switch (id->driver_data) {
> >  	case mcp3021:
> >  		data->sar_shift = MCP3021_SAR_SHIFT;
> > @@ -129,15 +148,12 @@ static int mcp3021_probe(struct i2c_client *client,
> >  		data->sar_mask = MCP3221_SAR_MASK;
> >  		data->output_res = MCP3221_OUTPUT_RES;
> >  		break;
> > +	default:
> > +		return -ENODEV;
> 
> Hmm ... that is really an unrelated change (nor is it really needed
> unless there is a bug in the code). Not worth arguing about it either,
> but please keep in mind that this is one of the things making life
> hard for maintainers.

I see, I'll remove it then.

Thank you for your feedback!

Clemens
