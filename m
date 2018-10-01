Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Sun, 30 Sep 2018 20:28:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 2/2] hwmon: ina3221: Read channel input source info
 from DT
Message-ID: <20181001032809.GB4428@Asurada>
References: <20180929013937.29289-1-nicoleotsuka@gmail.com>
 <20180929013937.29289-3-nicoleotsuka@gmail.com>
 <ab3a36dc-fa5a-4669-2f99-aa55a4083db2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab3a36dc-fa5a-4669-2f99-aa55a4083db2@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Sep 30, 2018 at 01:55:18PM -0700, Guenter Roeck wrote:
> Hi Nicolin,
> 
> On 09/28/2018 06:39 PM, Nicolin Chen wrote:
> >An ina3221 chip has three input ports. Each port is used
> >to measure the voltage and current of its input source.
> >
> >The DT binding now has defined bindings for their input
> >sources, so the driver should read these information and
> >handle accordingly.
> >
> >This patch adds a new structure of input source specific
> >information including input source label, shunt resistor
> >value and its connection status. It exposes these labels
> >via in[123]_label sysfs nodes upon available, and also
> >disables those channels where there are no input source
> >being connected. Meanwhile, it also adds in[123]_enable
> >sysfs nodes for users to get control of three channels,
> >and returns -ENODATA code for any sensor read according
> >to hwmon ABI.
> >
> >Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> [ ... ]
> 
> >+
> >+static ssize_t ina3221_set_enable(struct device *dev,
> >+				  struct device_attribute *attr,
> >+				  const char *buf, size_t count)
> >+{
> >+	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
> >+	struct ina3221_data *ina = dev_get_drvdata(dev);
> >+	unsigned int channel = sd_attr->index;
> >+	u16 config = ina->reg_config;
> >+	bool enable;
> >+	int ret;
> >+
> >+	ret = kstrtobool(buf, &enable);
> >+	if (ret)
> >+		return ret;
> >+
> >+	if (enable)
> >+		config |= INA3221_CONFIG_CHx_EN(channel);
> >+	else
> >+		config &= ~INA3221_CONFIG_CHx_EN(channel);
> >+
> >+	ret = regmap_write(ina->regmap, INA3221_CONFIG, config);
> >+	if (ret)
> >+		return ret;
> >+
> >+	ina->reg_config = config;
> >+
> 
> Sorry it too me so long to realize this: The code above is racy.
> There could be multiple threads enabling and disabling a channel.
> Without a mutex, there is no guarantee that the final value of
> reg_config matches the value written into the chip.

Hmm..that's true...glad you found and pointed it out.

> You'll have to introduce a mutex and implement something like
> 	ret = kstrtobool(buf, &enable);
> 	if (ret)
> 		return ret;
> 
> 	mutex_lock(&ina->update_lock);
> 	config = ina->reg_config;
> 	...
> 	ret = regmap_write(ina->regmap, INA3221_CONFIG, config);
> 	if (ret) {
> 		count = ret;
> 		goto error;
> 	}
> 	ina->reg_config = config;
> error:
> 	mutex_unlock(&ina->update_lock);
> 	return count;

I would prefer to just add another regmap_read at the end for
the reg_config sync, and to use regmap_update_bits() for the
bit set/clear. It might not serialize things as the solution
above does but at least the reg_config would get the correct
value eventually. Since regmap has an internal mutex already,
we may get rid of another mutex by doing so.

I will send a v9 tomorrow.

Thanks for the review
Nicolin
