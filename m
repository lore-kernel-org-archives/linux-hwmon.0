Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38803 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754129AbcLVTJ4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 14:09:56 -0500
Date: Thu, 22 Dec 2016 11:09:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: Jean Delvare <jdelvare@suse.com>, lm-sensors@lm-sensors.org,
        linux-kernel@vger.kernel.org,
        Michael Hornung <mhornung.linux@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: adc128d818: Implement chip mode selection
Message-ID: <20161222190952.GB22483@roeck-us.net>
References: <1459278219-5573-1-git-send-email-mail@alexanderkoch.net>
 <1459278219-5573-2-git-send-email-mail@alexanderkoch.net>
 <20160329195335.GA27318@roeck-us.net>
 <c459b499-4a5c-6a62-0b89-f65db7292673@alexanderkoch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c459b499-4a5c-6a62-0b89-f65db7292673@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 22, 2016 at 02:02:54PM +0100, Alexander Koch wrote:
> On Tue, Mar 29, 2016 at 21:53, Guenter Roeck wrote:
> > On Tue, Mar 29, 2016 at 09:03:38PM +0200, Alexander Koch wrote:
> >> The ADC128D818 offers four operation modes (see datasheet sec. 8.4.1)
> >> which vary in the number of available input signals and their types
> >> (differential vs. absolute).
> >>
> >> The current version of this driver only implements mode 0, this patch
> >> prepares implementation of the others.
> >>
> >>  * Introduce device tree property 'mode' for selection of chip operation
> >>    mode, default to mode 0
> >>
> >>  * Extend device data structure to cover all eight input channels
> >>
> >> Example of 'mode' usage:
> >>
> >>         adc1: adc128d818@1d {
> >>                 compatible = "ti,adc128d818";
> >>                 reg = <0x1d>;
> >>                 mode = /bits/ 8 <0>;
> > This will require devicetree maintainer review (and bindings document).
> > The property will probably require a ti, prefix. The bindings document also
> > needs to list the valid modes (all of them, not only the ones supported
> > by the driver).
> 
> Okay so I will create a bindings document
> 'devicetree/bindings/hwmon/adc128d818.txt' describing the current
> properties along with the new 'mode' property.
> 
> Concerning the prefix I have been a bit indecisive as there are
> currently examples with (e.g. 'w1/omap-hdq.txt') and without (e.g.
> 'input/ti,drv260x.txt') that.
> 
> 
> >>  	mutex_lock(&data->update_lock);
> >>  
> >>  	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> >> -		for (i = 0; i < 7; i++) {
> >> +		for (i = 0; i < no_in; i++) {
> >>  			rv = i2c_smbus_read_word_swapped(client,
> >>  							 ADC128_REG_IN(i));
> >>  			if (rv < 0)
> >> @@ -107,20 +111,25 @@ static struct adc128_data *adc128_update_device(struct device *dev)
> >>  			data->in[2][i] = rv << 4;
> >>  		}
> >>  
> >> -		rv = i2c_smbus_read_word_swapped(client, ADC128_REG_TEMP);
> >> -		if (rv < 0)
> >> -			goto abort;
> >> -		data->temp[0] = rv >> 7;
> >> +		if (data->mode != 1) {
> >> +			rv = i2c_smbus_read_word_swapped(client,
> >> +							 ADC128_REG_TEMP);
> >> +			if (rv < 0)
> >> +				goto abort;
> >> +			data->temp[0] = rv >> 7;
> >>  
> >> -		rv = i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_MAX);
> >> -		if (rv < 0)
> >> -			goto abort;
> >> -		data->temp[1] = rv << 1;
> >> +			rv = i2c_smbus_read_byte_data(client,
> >> +						      ADC128_REG_TEMP_MAX);
> >> +			if (rv < 0)
> >> +				goto abort;
> >> +			data->temp[1] = rv << 1;
> >>  
> >> -		rv = i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_HYST);
> >> -		if (rv < 0)
> >> -			goto abort;
> >> -		data->temp[2] = rv << 1;
> >> +			rv = i2c_smbus_read_byte_data(client,
> >> +						      ADC128_REG_TEMP_HYST);
> >> +			if (rv < 0)
> >> +				goto abort;
> >> +			data->temp[2] = rv << 1;
> >> +		}
> >>  
> >>  		rv = i2c_smbus_read_byte_data(client, ADC128_REG_ALARM);
> >>  		if (rv < 0)
> >> @@ -304,7 +313,7 @@ static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, adc128_show_alarm, NULL, 5);
> >>  static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, adc128_show_alarm, NULL, 6);
> >>  static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
> >>  
> >> -static struct attribute *adc128_attrs[] = {
> >> +static struct attribute *adc128m0_attrs[] = {
> >>  	&sensor_dev_attr_in0_min.dev_attr.attr,
> >>  	&sensor_dev_attr_in1_min.dev_attr.attr,
> >>  	&sensor_dev_attr_in2_min.dev_attr.attr,
> >> @@ -339,7 +348,7 @@ static struct attribute *adc128_attrs[] = {
> >>  	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
> >>  	NULL
> >>  };
> >> -ATTRIBUTE_GROUPS(adc128);
> >> +ATTRIBUTE_GROUPS(adc128m0);
> >>  
> >>  static int adc128_detect(struct i2c_client *client, struct i2c_board_info *info)
> >>  {
> >> @@ -387,6 +396,15 @@ static int adc128_init_client(struct adc128_data *data)
> >>  	if (err)
> >>  		return err;
> >>  
> >> +	/* Set operation mode, if non-default */
> >> +	if (data->mode != 0) {
> >> +		err = i2c_smbus_write_byte_data(client,
> >> +						ADC128_REG_CONFIG_ADV,
> >> +						data->mode << 1);
> >> +		if (err)
> >> +			return err;
> >> +	}
> >> +
> >>  	/* Start monitoring */
> >>  	err = i2c_smbus_write_byte_data(client, ADC128_REG_CONFIG, 0x01);
> >>  	if (err)
> >> @@ -410,6 +428,7 @@ static int adc128_probe(struct i2c_client *client,
> >>  	struct regulator *regulator;
> >>  	struct device *hwmon_dev;
> >>  	struct adc128_data *data;
> >> +	const struct attribute_group **groups;
> >>  	int err, vref;
> >>  
> >>  	data = devm_kzalloc(dev, sizeof(struct adc128_data), GFP_KERNEL);
> >> @@ -433,6 +452,18 @@ static int adc128_probe(struct i2c_client *client,
> >>  		data->vref = 2560;	/* 2.56V, in mV */
> >>  	}
> >>  
> >> +	/* Operation mode is optional and defaults to mode 0 */
> >> +	data->mode = 0;
> >> +	groups = adc128m0_groups;
> >> +	if (of_property_read_u8(dev->of_node, "mode", &data->mode) == 0) {
> >> +		if (data->mode != 0) {
> >> +			dev_err(dev, "unsupported operation mode %d",
> >> +				data->mode);
> >> +			err = -EINVAL;
> >> +			goto error;
> >> +		}
> > I am sure you are goint to introduce mode support with the next patch, but you also
> > added some mode support in this patch. Patches should be logically consistent,
> > which is not the case here. Most of your changes are not even testable because
> > mode !=0 is rejected here, and some of the changes in this patch don't make
> > sense without the next patch.
> 
> I'm not sure I got your point there. Taking a step back from my
> (admittedly crappy) implementation I had the intention of preserving two
> logical units: one being refactoring to introduce the 'mode' property
> (but keeping the functional level of the driver, i.e. mode-0-only) and
> two being the addition of new functionality (mode 1 support).
> 
> I understand that step 1 does not make much sense without step 2, but
> what would be the alternative then? Combining both steps in a single
> patch? I'd consider this a bit too much for a single patch, and
> separating refactoring from the addition of new functionality is, to my
> understanding, generally advised (e.g. [1]).
> 
> Concerning testability, could you please explain why the rejection of
> mode !=0 renders my changes untestable? This check is performed only if
> the 'mode' attribute is present in the device tree, so testing the
> default (no definition at all) is still possible. Would I have to
> implement all possible values of 'mode' in order to make my changes
> testable?
> 
> 
> > It might make more sense to introduce the bindings document in the first patch,
> > and the code changes in the second patch.
> 
> In my daily work I am used to committing new functional implementations
> along with their documentation in a single commit. The reason for this
> being that the alternative would be two separate patches, and that if
> someone accidentally checks out the first patch the resulting code base
> would either have documentation for something that isn't implemented or
> an undocumented function.
> 
> Heeding to your advice I assume in Kernel development it is preferred to
> have changes to documentation and code in separate commits.
> 
Specifically for devicetree changes, this is correct and make sense,
since the people reviewing and approving devicetree properties in most
cases will not review the actual code that results from it.

Since both documentation and code are usually pushed into the kernel at
the same time, the situation above does not really apply. One would,
on purpose, have to check out the SHA which has one but not the other.
I would call that self-inflicted damage.

Anyone checking out code at a specific SHA has to accept that it is not
necessarily "complete" in any sense. Any large patch series will have
the documentation patch (if it exists) not 100% in sync with all the other
changes being made. Either one ot the other will be out of date.

> 
> So what would you think of the following patch set structure?
> 
>  1) Add device tree binding document (including 'mode')
>  2) Refactor the code to reflect the 'mode' property (but still support
> mode 0 only)
>  3) Implement mode 1 support
> 
Ok with me.

> 
> Another point would be updating 'Documentation/hwmon/adc128d818', which
> is missing the other operation modes as well. Would you see this as 4)
> or between 1) and 2)?
> 
You can add this to 3). 1) only applies to devicetree changes.

Guenter
