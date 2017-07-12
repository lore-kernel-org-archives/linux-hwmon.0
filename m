Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52136 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753230AbdGLDnZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2017 23:43:25 -0400
Subject: Re: [RFC PATCH 2/4] pmbus: Add fan configuration support
To: Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
References: <20170710135618.13661-1-andrew@aj.id.au>
 <20170710135618.13661-3-andrew@aj.id.au>
 <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
 <1499819983.4935.7.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <208cece7-ee95-c162-82aa-09f35a8d384f@roeck-us.net>
Date: Tue, 11 Jul 2017 20:43:21 -0700
MIME-Version: 1.0
In-Reply-To: <1499819983.4935.7.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/11/2017 05:39 PM, Andrew Jeffery wrote:
> On Tue, 2017-07-11 at 06:40 -0700, Guenter Roeck wrote:
>> On 07/10/2017 06:56 AM, Andrew Jeffery wrote:
>>> Augment PMBus support to include control of fans via the
>>> FAN_COMMAND_[1-4] registers, both in RPM and PWM modes. The behaviour
>>> of FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4] are tightly coupled, and
>>> their interactions do not fit the existing use of struct pmbus_sensor.
>>> The patch introduces struct pmbus_fan_ctrl to distinguish from the
>>> simple sensor case, along with associated sysfs show/set implementations.
>>>
>>> Further, the interpreting the value of FAN_COMMAND_[1-4] depends on both
>>> the current fan mode (RPM or PWM, as configured in
>>> FAN_CONFIG_{1_2,3_4}), and the device-specific behaviour for the
>>> register. For example, the MAX31785 chip defines the following:
>>>
>>> PWM (m = 1, b = 0, R = 2):
>>>            0x0000 - 0x2710: 0 - 100% fan PWM duty cycle
>>>            0x2711 - 0x7fff: 100% fan PWM duty cycle
>>>            0x8000 - 0xffff: Ignore FAN_COMMAND_[1-4], use automatic fan control
>>>
>>> RPM (m = 1, b = 0, R = 0):
>>>            0x0000 - 0x7FFF: 0 - 32,767 RPM
>>>            0x8000 - 0xFFFF: Ignore FAN_COMMAND_[1-4], use automatic fan control
>>>
>>> To handle the device-specific interpretation of the FAN_COMMAND_[1-4],
>>> add an optional callbacks to the info struct to get/set the 'mode'
>>> value required for the pwm[1-n]_enable sysfs attribute. A fallback
>>> calculation exists if the callbacks are not populated; the fallback
>>> ignores device-specific ranges and tries to determine a reasonable value
>>> from FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4].
>>>
>>
>> This seems overly complex, but unfortunately I don't have time for a detailed
>> analysis right now.
> 
> No worries. It turned out more complex than I was hoping as well, and I
>   am keen to hear any insights to trim it down.
> 
>> Couple of comments below.
> 
> Yep, thanks for taking a look.
> 
>>
>> Guenter
>>
>>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>    drivers/hwmon/pmbus/pmbus.h      |   7 +
>>>    drivers/hwmon/pmbus/pmbus_core.c | 335 +++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 342 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>> index bfcb13bae34b..927eabc1b273 100644
>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>> @@ -223,6 +223,8 @@ enum pmbus_regs {
>>>>>    #define PB_FAN_1_RPM			BIT(6)
>>>>>    #define PB_FAN_1_INSTALLED		BIT(7)
>>>    
>>> +enum pmbus_fan_mode { percent = 0, rpm };
>>> +
>>>    /*
>>>     * STATUS_BYTE, STATUS_WORD (lower)
>>>     */
>>> @@ -380,6 +382,11 @@ struct pmbus_driver_info {
>>>>>    	int (*identify)(struct i2c_client *client,
>>>>>    			struct pmbus_driver_info *info);
>>>    
>>>>> +	/* Allow the driver to interpret the fan command value */
>>>>> +	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_command);
>>>>> +	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
>>>>> +			    u16 *fan_command);
>>> +
>>
>> It is not entirely obvious to me why this would require new callback functions.
>> Can you overload PMBUS_FAN_CONFIG_12 / PMBUS_FAN_CONFIG_34 or, if that does not
>> work for some reason, introduce a virtual register, such as PMBUS_VIRT_PWM_MODE ?
> 
> Can you expand on the thought of overloading PMBUS_FAN_CONFIG_{12,34}?
> 

Every register/command can be implemented in the front end driver in its read/write
functions. For example, see max34440_read_byte_data(), which replaces some of the
status registers. ucd9000.c actually overrides PMBUS_FAN_CONFIG_12 and
PMBUS_FAN_CONFIG_34.

> Regarding virtual registers, I saw references to them whilst I was
> working my way through the core code but didn't stop to investigate.
> I'll take a deeper look.
> 
Virtual registers/commands are meant to "standardize" non-standard PMBus commands.

For example, PMBus provides no means to read the average/minimum/maximum temperature.
Modeling the respective attributes using PMBUS_VIRT_READ_TEMP_AVG, PMBUS_VIRT_READ_TEMP_MIN,
and PMBUS_VIRT_READ_TEMP_MAX, and providing driver-specific read/write functions
which map the virtual commands to real chip registers makes the code much simpler
than per-attribute callbacks. With virtual commands, the core only needs entries such as

        }, {
                 .reg = PMBUS_VIRT_READ_TEMP_MIN,
                 .attr = "lowest",
         }, {
                 .reg = PMBUS_VIRT_READ_TEMP_AVG,
                 .attr = "average",
         }, {
                 .reg = PMBUS_VIRT_READ_TEMP_MAX,
                 .attr = "highest",

to support such non-standard attributes. Imagine how that would look like
if each of the supported virtual commands would be implemented as callback.

> However, the addition of the callbacks was driven by the behaviour of
> the MAX31785, where some values written to PMBUS_FAN_COMMAND_1 trigger
> automated control, while others retain manual control. Patch 4/4 should
> provide a bit more context, though I've also outlined the behaviour in
> the commit message for this patch. I don't have a lot of experience
> with PMBus devices so I don't have a good idea if there's a better way
> to capture the behaviour that isn't so unconstrained in its approach.
> 

Many pmbus commands have side effects. I don't see how an explicit callback
would be different to overloading a standard register or to providing a virtual
register/command, whichever is more convenient.

>>
>>>>>    	/* Regulator functionality, if supported by this chip driver. */
>>>>>    	int num_regulators;
>>>>>    	const struct regulator_desc *reg_desc;
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>> index ba59eaef2e07..3b0a55bbbd2c 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -69,6 +69,38 @@ struct pmbus_sensor {
>>>    #define to_pmbus_sensor(_attr) \
>>>>>    	container_of(_attr, struct pmbus_sensor, attribute)
>>>    
>>>>> +#define PB_FAN_CONFIG_RPM		PB_FAN_2_RPM
>>> +#define PB_FAN_CONFIG_INSTALLED		PB_FAN_2_INSTALLEDBUS_VIRT_
>>
>> Something seems odd here. PB_FAN_2_INSTALLEDBUS_VIRT_ ?
> 
> Yes, that's busted. Not sure what went wrong, but I'll clean it up.
> 
>>
>>>>> +#define PB_FAN_CONFIG_MASK(i)		(0xff << (4 * !((i) & 1)))
>>>>> +#define PB_FAN_CONFIG_GET(i, n)		(((n) >> (4 * !((i) & 1))) & 0xff)
>>>>> +#define PB_FAN_CONFIG_PUT(i, n)		(((n) & 0xff) << (4 * !((i) & 1)))
>>> +
>>
>> Aren't there standard bit manipulation macros for that ? Either case, this is just to avoid
>> having to use the existing defines.
> 
> As I store the configuration for each fan in a struct pmbus_fan_ctrl
> dedicated to the fan, I reasoned that intermediate code should not have

I rather wonder if pmbus_fan_ctrl is needed in the first place. The notion of
local 'struct pmbus_sensor' variables seems really messy. I think I'll really
have to spend some time on this to see if and how it can be simplified;
it just should not be that complex.

Thanks,
Guenter

> to deal with the details of which nibble to access with respect to the
> fan's (per-page) ID. Rather, code reading or writing
> PMBUS_FAN_COMMAND_[1-4] should deal with ensuring the correct values
> are provided.
> 
>> Ok, but then I think it would make more sense to
>> make it generic, ie change the core to not use PB_FAN_2_RPM / PB_FAN_1_RPM etc.
>> but PB_FAN_RPM(index) everywhere.
> 
> I'll make the change throughout pmbus core.
> 
>>
>>> +struct pmbus_fan_ctrl_attr {
>>>>> +	struct device_attribute attribute;
>>>>> +	char name[PMBUS_NAME_SIZE];
>>> +};
>>> +
>>> +struct pmbus_fan_ctrl {
>>>>> +	struct pmbus_fan_ctrl_attr fan_target;
>>>>> +	struct pmbus_fan_ctrl_attr pwm;
>>>>> +	struct pmbus_fan_ctrl_attr pwm_enable;
>>>>> +	int index;
>>>>> +	u8 page;
>>>>> +	u8 id;
>>>>> +	u8 config;
>>>>> +	u16 command;
>>> +};
>>> +#define to_pmbus_fan_ctrl_attr(_attr) \
>>>>> +	container_of(_attr, struct pmbus_fan_ctrl_attr, attribute)
>>> +#define fan_target_to_pmbus_fan_ctrl(_attr) \
>>>>> +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, \
>>>>> +			fan_target)
>>> +#define pwm_to_pmbus_fan_ctrl(_attr) \
>>>>> +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, pwm)
>>> +#define pwm_enable_to_pmbus_fan_ctrl(_attr) \
>>>>> +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, \
>>>>> +			pwm_enable)
>>> +
>>>    struct pmbus_boolean {
>>>>>>>    	char name[PMBUS_NAME_SIZE];	/* sysfs boolean name */
>>>>>    	struct sensor_device_attribute attribute;
>>> @@ -806,6 +838,219 @@ static ssize_t pmbus_show_label(struct device *dev,
>>>>>    	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
>>>    }
>>>    
>>> +static ssize_t pmbus_show_fan_command(struct device *dev,
>>>>> +				      enum pmbus_fan_mode mode,
>>>>> +				      struct pmbus_fan_ctrl *fan, char *buf)
>>> +{
>>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>>>> +	struct pmbus_sensor sensor;
>>>>> +	long val;
>>> +
>>>>> +	mutex_lock(&data->update_lock);
>>> +
>>>>> +	if ((mode == percent && (fan->config & PB_FAN_CONFIG_RPM)) ||
>>>>> +			(mode == rpm && !(fan->config & PB_FAN_CONFIG_RPM))) {
>>>>> +		mutex_unlock(&data->update_lock);
>>> +		return -ENOTSUPP; /* XXX: This seems dodgy, but what to do? */
>>
>> Not create the attribute in question in the first place, or return 0. The above
>> messes up the 'sensors' command.
> 
> I think returning 0 is the only valid option of the two, given that we
> can dynamically switch between RPM and PWM modes.
> 
> Thanks for the feedback.
> 
> Andrew
> 
>>
>>>>> +	}
>>> +
>>>>> +	sensor.class = PSC_FAN;
>>>>> +	if (mode == percent)
>>>>> +		sensor.data = fan->command * 255 / 100;
>>>>> +	else
>>>>> +		sensor.data = fan->command;
>>> +
>>>>> +	val = pmbus_reg2data(data, &sensor);
>>> +
>>>>> +	mutex_unlock(&data->update_lock);
>>> +
>>>>> +	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
>>> +}
>>> +
>>> +static ssize_t pmbus_show_fan_target(struct device *dev,
>>>>> +				     struct device_attribute *da, char *buf)
>>> +{
>>>>> +	return pmbus_show_fan_command(dev, rpm,
>>>>> +				      fan_target_to_pmbus_fan_ctrl(da), buf);
>>> +}
>>> +
>>> +static ssize_t pmbus_show_pwm(struct device *dev,
>>>>> +			      struct device_attribute *da, char *buf)
>>> +{
>>>>> +	return pmbus_show_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl(da),
>>>>> +				      buf);
>>> +}
>>> +
>>> +static ssize_t pmbus_set_fan_command(struct device *dev,
>>>>> +				     enum pmbus_fan_mode mode,
>>>>> +				     struct pmbus_fan_ctrl *fan,
>>>>> +				     const char *buf, ssize_t count)
>>> +{
>>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>>>> +	int config_addr, command_addr;
>>>>> +	struct pmbus_sensor sensor;
>>>>> +	ssize_t rv;
>>>>> +	long val;
>>> +
>>>>> +	if (kstrtol(buf, 10, &val) < 0)
>>>>> +		return -EINVAL;
>>> +
>>>>> +	mutex_lock(&data->update_lock);
>>> +
>>>>> +	sensor.class = PSC_FAN;
>>> +
>>>>> +	val = pmbus_data2reg(data, &sensor, val);
>>> +
>>>>> +	if (mode == percent)
>>>>> +		val = val * 100 / 255;
>>> +
>>>>> +	config_addr = (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_CONFIG_34;
>>>>> +	command_addr = config_addr + 1 + (fan->id & 1);
>>> +
>>>>> +	if (mode == rpm)
>>>>> +		fan->config |= PB_FAN_CONFIG_RPM;
>>>>> +	else
>>>>> +		fan->config &= ~PB_FAN_CONFIG_RPM;
>>> +
>>>>> +	rv = pmbus_update_byte_data(client, fan->page, config_addr,
>>>>> +				    PB_FAN_CONFIG_PUT(fan->id, fan->config),
>>>>> +				    PB_FAN_CONFIG_MASK(fan->id));
>>>>> +	if (rv < 0)
>>>>> +		goto done;
>>> +
>>>>> +	fan->command = val;
>>>>> +	rv = pmbus_write_word_data(client, fan->page, command_addr,
>>>>> +				   fan->command);
>>> +
>>> +done:
>>>>> +	mutex_unlock(&data->update_lock);
>>> +
>>>>> +	if (rv < 0)
>>>>> +		return rv;
>>> +
>>>>> +	return count;
>>> +}
>>> +
>>> +static ssize_t pmbus_set_fan_target(struct device *dev,
>>>>> +				    struct device_attribute *da,
>>>>> +				    const char *buf, size_t count)
>>> +{
>>>>> +	return pmbus_set_fan_command(dev, rpm,
>>>>> +				     fan_target_to_pmbus_fan_ctrl(da), buf,
>>>>> +				     count);
>>> +}
>>> +
>>> +static ssize_t pmbus_set_pwm(struct device *dev, struct device_attribute *da,
>>>>> +			     const char *buf, size_t count)
>>> +{
>>>>> +	return pmbus_set_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl(da),
>>>>> +				     buf, count);
>>> +}
>>> +
>>> +static ssize_t pmbus_show_pwm_enable(struct device *dev,
>>>>> +				     struct device_attribute *da, char *buf)
>>> +{
>>>>> +	struct pmbus_fan_ctrl *fan = pwm_enable_to_pmbus_fan_ctrl(da);
>>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>>>> +	long mode;
>>> +
>>>>> +	mutex_lock(&data->update_lock);
>>> +
>>> +
>>>>> +	if (data->info->get_pwm_mode) {
>>>>> +		u8 config = PB_FAN_CONFIG_PUT(fan->id, fan->config);
>>> +
>>>>> +		mode = data->info->get_pwm_mode(fan->id, config, fan->command);
>>>>> +	} else {
>>>>> +		struct pmbus_sensor sensor = {
>>>>> +			.class = PSC_FAN,
>>>>> +			.data = fan->command,
>>>>> +		};
>>>>> +		long command;
>>> +
>>>>> +		command = pmbus_reg2data(data, &sensor);
>>> +
>>>>> +		/* XXX: Need to do something sensible */
>>>>> +		if (fan->config & PB_FAN_CONFIG_RPM)
>>>>> +			mode = 2;
>>>>> +		else
>>>>> +			mode = (command >= 0 && command < 100);
>>>>> +	}
>>> +
>>>>> +	mutex_unlock(&data->update_lock);
>>> +
>>>>> +	return snprintf(buf, PAGE_SIZE, "%ld\n", mode);
>>> +}
>>> +
>>> +static ssize_t pmbus_set_pwm_enable(struct device *dev,
>>>>> +				    struct device_attribute *da,
>>>>> +				    const char *buf, size_t count)
>>> +{
>>>>> +	struct pmbus_fan_ctrl *fan = pwm_enable_to_pmbus_fan_ctrl(da);
>>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>>>> +	int config_addr, command_addr;
>>>>> +	struct pmbus_sensor sensor;
>>>>> +	ssize_t rv = count;
>>>>> +	long mode;
>>> +
>>>>> +	if (kstrtol(buf, 10, &mode) < 0)
>>>>> +		return -EINVAL;
>>> +
>>>>> +	mutex_lock(&data->update_lock);
>>> +
>>>>> +	sensor.class = PSC_FAN;
>>> +
>>>>> +	config_addr = (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_CONFIG_34;
>>>>> +	command_addr = config_addr + 1 + (fan->id & 1);
>>> +
>>>>> +	if (data->info->set_pwm_mode) {
>>>>> +		u8 config = PB_FAN_CONFIG_PUT(fan->id, fan->config);
>>>>> +		u16 command = fan->command;
>>> +
>>>>> +		rv = data->info->set_pwm_mode(fan->id, mode, &config, &command);
>>>>> +		if (rv < 0)
>>>>> +			goto done;
>>> +
>>>>> +		fan->config = PB_FAN_CONFIG_GET(fan->id, config);
>>>>> +		fan->command = command;
>>>>> +	} else {
>>>>> +		fan->config &= ~PB_FAN_CONFIG_RPM;
>>>>> +		switch (mode) {
>>>>> +		case 0:
>>>>> +		case 1:
>>>>> +			/* XXX: Safe at least? */
>>>>> +			fan->command = pmbus_data2reg(data, &sensor, 100);
>>>>> +			break;
>>>>> +		case 2:
>>>>> +		default:
>>>>> +			/* XXX: Safe at least? */
>>>>> +			fan->command = 0xffff;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>> +
>>>>> +	rv = pmbus_update_byte_data(client, fan->page, config_addr,
>>>>> +				    PB_FAN_CONFIG_PUT(fan->id, fan->config),
>>>>> +				    PB_FAN_CONFIG_MASK(fan->id));
>>>>> +	if (rv < 0)
>>>>> +		goto done;
>>> +
>>>>> +	rv = pmbus_write_word_data(client, fan->page, command_addr,
>>>>> +				   fan->command);
>>> +
>>> +done:
>>>>> +	mutex_unlock(&data->update_lock);
>>> +
>>>>> +	if (rv < 0)
>>>>> +		return rv;
>>> +
>>>>> +	return count;
>>> +}
>>> +
>>>    static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
>>>    {
>>>>>    	if (data->num_attributes >= data->max_attributes - 1) {
>>> @@ -1094,6 +1339,51 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>>>>>    	return 0;
>>>    }
>>>    
>>> +static int pmbus_add_fan_ctrl_attr(struct pmbus_data *data,
>>>>> +				   struct pmbus_fan_ctrl_attr *fa,
>>>>> +				   const char *name_fmt,
>>>>> +				   ssize_t (*show)(struct device *dev,
>>>>> +					   struct device_attribute *attr,
>>>>> +					   char *buf),
>>>>> +				   ssize_t (*store)(struct device *dev,
>>>>> +					   struct device_attribute *attr,
>>>>> +					   const char *buf, size_t count),
>>>>> +				   int idx)
>>> +{
>>>>> +	struct device_attribute *da;
>>> +
>>>>> +	da = &fa->attribute;
>>> +
>>>>> +	snprintf(fa->name, sizeof(fa->name), name_fmt, idx);
>>>>> +	pmbus_dev_attr_init(da, fa->name, 0644, show, store);
>>> +
>>>>> +	return pmbus_add_attribute(data, &da->attr);
>>> +}
>>> +
>>> +static inline int pmbus_add_fan_target_attr(struct pmbus_data *data,
>>>>> +					    struct pmbus_fan_ctrl *fan)
>>> +{
>>>>> +	return pmbus_add_fan_ctrl_attr(data, &fan->fan_target, "fan%d_target",
>>>>> +				       pmbus_show_fan_target,
>>>>> +				       pmbus_set_fan_target, fan->index);
>>> +}
>>> +
>>> +static inline int pmbus_add_pwm_attr(struct pmbus_data *data,
>>>>> +				     struct pmbus_fan_ctrl *fan)
>>> +{
>>> +
>>>>> +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm, "pwm%d", pmbus_show_pwm,
>>>>> +				       pmbus_set_pwm, fan->index);
>>> +}
>>> +
>>> +static inline int pmbus_add_pwm_enable_attr(struct pmbus_data *data,
>>>>> +					    struct pmbus_fan_ctrl *fan)
>>> +{
>>>>> +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm_enable, "pwm%d_enable",
>>>>> +				       pmbus_show_pwm_enable,
>>>>> +				       pmbus_set_pwm_enable, fan->index);
>>> +}
>>> +
>>>    static const struct pmbus_limit_attr vin_limit_attrs[] = {
>>>>>    	{
>>>>>    		.reg = PMBUS_VIN_UV_WARN_LIMIT,
>>> @@ -1565,6 +1855,13 @@ static const int pmbus_fan_config_registers[] = {
>>>>>    	PMBUS_FAN_CONFIG_34
>>>    };
>>>    
>>> +static const int pmbus_fan_command_registers[] = {
>>>>> +	PMBUS_FAN_COMMAND_1,
>>>>> +	PMBUS_FAN_COMMAND_2,
>>>>> +	PMBUS_FAN_COMMAND_3,
>>>>> +	PMBUS_FAN_COMMAND_4,
>>> +};
>>> +
>>>    static const int pmbus_fan_status_registers[] = {
>>>>>    	PMBUS_STATUS_FAN_12,
>>>>>    	PMBUS_STATUS_FAN_12,
>>> @@ -1587,6 +1884,39 @@ static const u32 pmbus_fan_status_flags[] = {
>>>    };
>>>    
>>>    /* Fans */
>>> +static int pmbus_add_fan_ctrl(struct i2c_client *client,
>>>>> +		struct pmbus_data *data, int index, int page, int id,
>>>>> +		u8 config)
>>> +{
>>>>> +	struct pmbus_fan_ctrl *fan;
>>>>> +	int rv;
>>> +
>>>>> +	fan = devm_kzalloc(data->dev, sizeof(*fan), GFP_KERNEL);
>>>>> +	if (!fan)
>>>>> +		return -ENOMEM;
>>> +
>>>>> +	fan->index = index;
>>>>> +	fan->page = page;
>>>>> +	fan->id = id;
>>>>> +	fan->config = config;
>>> +
>>>>> +	rv = _pmbus_read_word_data(client, page,
>>>>> +			pmbus_fan_command_registers[id]);
>>>>> +	if (rv < 0)
>>>>> +		return rv;
>>>>> +	fan->command = rv;
>>> +
>>>>> +	rv = pmbus_add_fan_target_attr(data, fan);
>>>>> +	if (rv < 0)
>>>>> +		return rv;
>>> +
>>>>> +	rv = pmbus_add_pwm_attr(data, fan);
>>>>> +	if (rv < 0)
>>>>> +		return rv;
>>> +
>>>>> +	return pmbus_add_pwm_enable_attr(data, fan);
>>> +}
>>> +
>>>    static int pmbus_add_fan_attributes(struct i2c_client *client,
>>>>>    				    struct pmbus_data *data)
>>>    {
>>> @@ -1624,6 +1954,11 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>>>>>    					     PSC_FAN, true, true) == NULL)
>>>>>    				return -ENOMEM;
>>>    
>>>>> +			ret = pmbus_add_fan_ctrl(client, data, index, page, f,
>>>>> +						 regval);
>>>>> +			if (ret < 0)
>>>>> +				return ret;
>>> +
>>>>>    			/*
>>>>>    			 * Each fan status register covers multiple fans,
>>>>>    			 * so we have to do some magic.
>>>
>>

