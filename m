Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41824 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbeI3Blr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Sep 2018 21:41:47 -0400
Date: Sat, 29 Sep 2018 12:12:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add suspend and resume functions
Message-ID: <20180929191122.GA19962@Asurada-Nvidia.nvidia.com>
References: <20180928214921.11528-1-nicoleotsuka@gmail.com>
 <20180928214921.11528-3-nicoleotsuka@gmail.com>
 <20180929153346.GA26651@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180929153346.GA26651@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 29, 2018 at 08:33:46AM -0700, Guenter Roeck wrote:
> On Fri, Sep 28, 2018 at 02:49:21PM -0700, Nicolin Chen wrote:
> > Depending on the hardware design, an INA3221 chip might lose
> > its power during system suspend/resume. So this patch adds
> > a pair of suspend and resume functions to cache the register
> > values including config register value and limit settings.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >  drivers/hwmon/ina3221.c | 54 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> > index cfe65ff01051..26f66f728b27 100644
> > --- a/drivers/hwmon/ina3221.c
> > +++ b/drivers/hwmon/ina3221.c
> > @@ -91,11 +91,13 @@ static const unsigned int register_channel[] = {
> >   * @regmap: Register map of the device
> >   * @fields: Register fields of the device
> >   * @shunt_resistors: Array of resistor values per channel
> > + * @reg_config: Register value of INA3221_CONFIG
> >   */
> >  struct ina3221_data {
> >  	struct regmap *regmap;
> >  	struct regmap_field *fields[F_MAX_FIELDS];
> >  	int shunt_resistors[INA3221_NUM_CHANNELS];
> > +	u32 reg_config;
> >  };
> >  
> >  static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
> > @@ -415,8 +417,59 @@ static int ina3221_probe(struct i2c_client *client,
> >  		return PTR_ERR(hwmon_dev);
> >  	}
> >  
> > +	dev_set_drvdata(dev, ina);
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM
> > +static int ina3221_suspend(struct device *dev)
> > +{
> > +	struct ina3221_data *ina = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	/* Save config register value and enable cache-only */
> > +	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
> > +	if (ret)
> > +		return ret;
> > +
> 
> Would it make sense to explicitly disable all channels here ?

For power saving? I could add it to v2.

Thanks
Nicolin
