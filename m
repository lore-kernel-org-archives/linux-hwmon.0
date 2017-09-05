Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:32862 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751480AbdIERAE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 13:00:04 -0400
Date: Tue, 5 Sep 2017 10:00:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
Message-ID: <20170905170002.GG11478@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170905070132.17682-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 05, 2017 at 05:01:32PM +1000, Andrew Jeffery wrote:
> Some functions exposed by pmbus core conflated errors that occurred when
> setting the page to access with errors that occurred when accessing
> registers in a page. In some cases, this caused legitimate errors to be
> hidden under the guise of the register not being supported.
> 

I'll have to look into this. If I recall correctly, the reason for not returning
errors from the "clear faults" command was that some early chips did not support
it, or did not support it on all pages. Those chips would now always fail.

On a higher level, I am not sure if it is a good idea to return an error
from a function intended to clear faults (and nothing else). That seems
counterproductive.

Is this a problem you have actually observed ? If so, what is the chip ?

Thanks,
Guenter

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/pmbus-core   |  12 ++--
>  drivers/hwmon/pmbus/pmbus.h      |   6 +-
>  drivers/hwmon/pmbus/pmbus_core.c | 115 +++++++++++++++++++++++++++++----------
>  3 files changed, 95 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/hwmon/pmbus-core b/Documentation/hwmon/pmbus-core
> index 8ed10e9ddfb5..3e9f41bb756f 100644
> --- a/Documentation/hwmon/pmbus-core
> +++ b/Documentation/hwmon/pmbus-core
> @@ -218,17 +218,17 @@ Specifically, it provides the following information.
>    This function calls the device specific write_byte function if defined.
>    Therefore, it must _not_ be called from that function.
>  
> -  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> +  int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
>  
> -  Check if byte register exists. Return true if the register exists, false
> -  otherwise.
> +  Check if byte register exists. Returns 1 if the register exists, 0 if it does
> +  not, and less than zero on an unexpected error.
>    This function calls the device specific write_byte function if defined to
>    obtain the chip status. Therefore, it must _not_ be called from that function.
>  
> -  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> +  int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
>  
> -  Check if word register exists. Return true if the register exists, false
> -  otherwise.
> +  Check if word register exists. Returns 1 if the register exists, 0 if it does
> +  not, and less than zero on an unexpected error.
>    This function calls the device specific write_byte function if defined to
>    obtain the chip status. Therefore, it must _not_ be called from that function.
>  
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index bfcb13bae34b..c53032a04a6f 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -413,9 +413,9 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
>  			  u8 value);
>  int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  			   u8 mask, u8 value);
> -void pmbus_clear_faults(struct i2c_client *client);
> -bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> -bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> +int pmbus_clear_faults(struct i2c_client *client);
> +int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
> +int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
>  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  		   struct pmbus_driver_info *info);
>  int pmbus_do_remove(struct i2c_client *client);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index f1eff6b6c798..153700e35431 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -304,18 +304,24 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return pmbus_read_byte_data(client, page, reg);
>  }
>  
> -static void pmbus_clear_fault_page(struct i2c_client *client, int page)
> +static int pmbus_clear_fault_page(struct i2c_client *client, int page)
>  {
> -	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> +	return _pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
>  }
>  
> -void pmbus_clear_faults(struct i2c_client *client)
> +int pmbus_clear_faults(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> +	int rv;
>  	int i;
>  
> -	for (i = 0; i < data->info->pages; i++)
> -		pmbus_clear_fault_page(client, i);
> +	for (i = 0; i < data->info->pages; i++) {
> +		rv = pmbus_clear_fault_page(client, i);
> +		if (rv)
> +			return rv;
> +	}
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(pmbus_clear_faults);
>  
> @@ -333,28 +339,45 @@ static int pmbus_check_status_cml(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static bool pmbus_check_register(struct i2c_client *client,
> +static int pmbus_check_register(struct i2c_client *client,
>  				 int (*func)(struct i2c_client *client,
>  					     int page, int reg),
>  				 int page, int reg)
>  {
> +	struct pmbus_data *data;
> +	int check;
>  	int rv;
> -	struct pmbus_data *data = i2c_get_clientdata(client);
>  
> -	rv = func(client, page, reg);
> -	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> -		rv = pmbus_check_status_cml(client);
> -	pmbus_clear_fault_page(client, -1);
> -	return rv >= 0;
> +	data = i2c_get_clientdata(client);
> +
> +	/*
> +	 * pmbus_set_page() guards transactions on the requested page matching
> +	 * the current page. This may be done in the execution of func(), but
> +	 * at that point a set-page error is conflated with accessing a
> +	 * non-existent register.
> +	 */
> +	rv = pmbus_set_page(client, page);
> +	if (rv < 0)
> +		return rv;
> +
> +	check = func(client, page, reg);
> +	if (check >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> +		check = pmbus_check_status_cml(client);
> +
> +	rv = pmbus_clear_fault_page(client, -1);
> +	if (rv < 0)
> +		return rv;
> +
> +	return check >= 0;
>  }
>  
> -bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
> +int pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
>  {
>  	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
>  }
>  EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
>  
> -bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
> +int pmbus_check_word_register(struct i2c_client *client, int page, int reg)
>  {
>  	return pmbus_check_register(client, _pmbus_read_word_data, page, reg);
>  }
> @@ -390,7 +413,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
>  
>  	mutex_lock(&data->update_lock);
>  	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> -		int i, j;
> +		int i, j, ret;
>  
>  		for (i = 0; i < info->pages; i++) {
>  			data->status[PB_STATUS_BASE + i]
> @@ -424,7 +447,13 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
>  							    sensor->page,
>  							    sensor->reg);
>  		}
> -		pmbus_clear_faults(client);
> +
> +		ret = pmbus_clear_faults(client);
> +		if (ret < 0) {
> +			mutex_unlock(&data->update_lock);
> +			return ERR_PTR(ret);
> +		}
> +
>  		data->last_updated = jiffies;
>  		data->valid = 1;
>  	}
> @@ -754,6 +783,9 @@ static ssize_t pmbus_show_boolean(struct device *dev,
>  	struct pmbus_data *data = pmbus_update_device(dev);
>  	int val;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	val = pmbus_get_boolean(data, boolean, attr->index);
>  	if (val < 0)
>  		return val;
> @@ -766,6 +798,9 @@ static ssize_t pmbus_show_sensor(struct device *dev,
>  	struct pmbus_data *data = pmbus_update_device(dev);
>  	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	if (sensor->data < 0)
>  		return sensor->data;
>  
> @@ -995,7 +1030,11 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
>  	struct pmbus_sensor *curr;
>  
>  	for (i = 0; i < nlimit; i++) {
> -		if (pmbus_check_word_register(client, page, l->reg)) {
> +		ret = pmbus_check_word_register(client, page, l->reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret) {
>  			curr = pmbus_add_sensor(data, name, l->attr, index,
>  						page, l->reg, attr->class,
>  						attr->update || l->update,
> @@ -1041,6 +1080,8 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  	if (!base)
>  		return -ENOMEM;
>  	if (attr->sfunc) {
> +		int check;
> +
>  		ret = pmbus_add_limit_attrs(client, data, info, name,
>  					    index, page, base, attr);
>  		if (ret < 0)
> @@ -1050,9 +1091,13 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  		 * alarm attributes, if there is a global alarm bit, and if
>  		 * the generic status register for this page is accessible.
>  		 */
> -		if (!ret && attr->gbit &&
> -		    pmbus_check_byte_register(client, page,
> -					      data->status_register)) {
> +
> +		check = pmbus_check_byte_register(client, page,
> +						  data->status_register);
> +		if (check < 0)
> +			return check;
> +
> +		if (!ret && attr->gbit && check) {
>  			ret = pmbus_add_boolean(data, name, "alarm", index,
>  						NULL, NULL,
>  						PB_STATUS_BASE + page,
> @@ -1604,8 +1649,12 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  			if (!(info->func[page] & pmbus_fan_flags[f]))
>  				break;
>  
> -			if (!pmbus_check_word_register(client, page,
> -						       pmbus_fan_registers[f]))
> +			ret = pmbus_check_word_register(client, page,
> +						       pmbus_fan_registers[f]);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (!ret)
>  				break;
>  
>  			/*
> @@ -1628,9 +1677,13 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  			 * Each fan status register covers multiple fans,
>  			 * so we have to do some magic.
>  			 */
> -			if ((info->func[page] & pmbus_fan_status_flags[f]) &&
> -			    pmbus_check_byte_register(client,
> -					page, pmbus_fan_status_registers[f])) {
> +			ret =  pmbus_check_byte_register(client, page,
> +						pmbus_fan_status_registers[f]);
> +			if (ret < 0)
> +				return ret;
> +
> +			if ((info->func[page] & pmbus_fan_status_flags[f])
> +					&& ret) {
>  				int base;
>  
>  				if (f > 1)	/* fan 3, 4 */
> @@ -1696,10 +1749,13 @@ static int pmbus_identify_common(struct i2c_client *client,
>  				 struct pmbus_data *data, int page)
>  {
>  	int vout_mode = -1;
> +	int rv;
>  
> -	if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
> +	rv = pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE);
> +	if (rv == 1)
>  		vout_mode = _pmbus_read_byte_data(client, page,
>  						  PMBUS_VOUT_MODE);
> +
>  	if (vout_mode >= 0 && vout_mode != 0xff) {
>  		/*
>  		 * Not all chips support the VOUT_MODE command,
> @@ -1725,8 +1781,7 @@ static int pmbus_identify_common(struct i2c_client *client,
>  		}
>  	}
>  
> -	pmbus_clear_fault_page(client, page);
> -	return 0;
> +	return pmbus_clear_fault_page(client, page);
>  }
>  
>  static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
> @@ -1756,7 +1811,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
>  		client->flags |= I2C_CLIENT_PEC;
>  
> -	pmbus_clear_faults(client);
> +	ret = pmbus_clear_faults(client);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (info->identify) {
>  		ret = (*info->identify)(client, info);
> -- 
> 2.11.0
> 
