Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1499819983.4935.7.camel@aj.id.au>
Subject: Re: [RFC PATCH 2/4] pmbus: Add fan configuration support
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
	openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
	mspinler@linux.vnet.ibm.com
Date: Wed, 12 Jul 2017 10:09:43 +0930
In-Reply-To: <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
References: <20170710135618.13661-1-andrew@aj.id.au>
	 <20170710135618.13661-3-andrew@aj.id.au>
	 <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZRMt9a+Ncov3R5UOOCRU"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-ZRMt9a+Ncov3R5UOOCRU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-11 at 06:40 -0700, Guenter Roeck wrote:
> On 07/10/2017 06:56 AM, Andrew Jeffery wrote:
> > Augment PMBus support to include control of fans via the
> > FAN_COMMAND_[1-4] registers, both in RPM and PWM modes. The behaviour
> > of FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4] are tightly coupled, and
> > their interactions do not fit the existing use of struct pmbus_sensor.
> > The patch introduces struct pmbus_fan_ctrl to distinguish from the
> > simple sensor case, along with associated sysfs show/set implementation=
s.
> >=20
> > Further, the interpreting the value of FAN_COMMAND_[1-4] depends on bot=
h
> > the current fan mode (RPM or PWM, as configured in
> > FAN_CONFIG_{1_2,3_4}), and the device-specific behaviour for the
> > register. For example, the MAX31785 chip defines the following:
> >=20
> > PWM (m =3D 1, b =3D 0, R =3D 2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0000 - 0x=
2710: 0 - 100% fan PWM duty cycle
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x2711 - 0x=
7fff: 100% fan PWM duty cycle
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x8000 - 0x=
ffff: Ignore FAN_COMMAND_[1-4], use automatic fan control
> >=20
> > RPM (m =3D 1, b =3D 0, R =3D 0):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0000 - 0x=
7FFF: 0 - 32,767 RPM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x8000 - 0x=
FFFF: Ignore FAN_COMMAND_[1-4], use automatic fan control
> >=20
> > To handle the device-specific interpretation of the FAN_COMMAND_[1-4],
> > add an optional callbacks to the info struct to get/set the 'mode'
> > value required for the pwm[1-n]_enable sysfs attribute. A fallback
> > calculation exists if the callbacks are not populated; the fallback
> > ignores device-specific ranges and tries to determine a reasonable valu=
e
> > from FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4].
> >=20
>=20
> This seems overly complex, but unfortunately I don't have time for a deta=
iled
> analysis right now.=20

No worries. It turned out more complex than I was hoping as well, and I
 am keen to hear any insights to trim it down.=20

> Couple of comments below.

Yep, thanks for taking a look.

>=20
> Guenter
>=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0 drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A0=C2=A07 +
> > =C2=A0 drivers/hwmon/pmbus/pmbus_core.c | 335 +++++++++++++++++++++++++=
++++++++++++++
> > =C2=A0 2 files changed, 342 insertions(+)
> >=20
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index bfcb13bae34b..927eabc1b273 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -223,6 +223,8 @@ enum pmbus_regs {
> > > > =C2=A0 #define PB_FAN_1_RPM			BIT(6)
> > > > =C2=A0 #define PB_FAN_1_INSTALLED		BIT(7)
> > =C2=A0=C2=A0
> > +enum pmbus_fan_mode { percent =3D 0, rpm };
> > +
> > =C2=A0 /*
> > =C2=A0=C2=A0=C2=A0* STATUS_BYTE, STATUS_WORD (lower)
> > =C2=A0=C2=A0=C2=A0*/
> > @@ -380,6 +382,11 @@ struct pmbus_driver_info {
> > > > =C2=A0=C2=A0	int (*identify)(struct i2c_client *client,
> > > > =C2=A0=C2=A0			struct pmbus_driver_info *info);
> > =C2=A0=C2=A0
> > > > +	/* Allow the driver to interpret the fan command value */
> > > > +	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_command);
> > > > +	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0u16 *fan_command);
> > +
>=20
> It is not entirely obvious to me why this would require new callback func=
tions.
> Can you overload PMBUS_FAN_CONFIG_12 / PMBUS_FAN_CONFIG_34 or, if that do=
es not
> work for some reason, introduce a virtual register, such as PMBUS_VIRT_PW=
M_MODE ?

Can you expand on the thought of overloading PMBUS_FAN_CONFIG_{12,34}?

Regarding virtual registers, I saw references to them whilst I was
working my way through the core code but didn't stop to investigate.
I'll take a deeper look.

However, the addition of the callbacks was driven by the behaviour of
the MAX31785, where some values written to PMBUS_FAN_COMMAND_1 trigger
automated control, while others retain manual control. Patch 4/4 should
provide a bit more context, though I've also outlined the behaviour in
the commit message for this patch. I don't have a lot of experience
with PMBus devices so I don't have a good idea if there's a better way
to capture the behaviour that isn't so unconstrained in its approach.

>=20
> > > > =C2=A0=C2=A0	/* Regulator functionality, if supported by this chip =
driver. */
> > > > =C2=A0=C2=A0	int num_regulators;
> > > > =C2=A0=C2=A0	const struct regulator_desc *reg_desc;
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index ba59eaef2e07..3b0a55bbbd2c 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -69,6 +69,38 @@ struct pmbus_sensor {
> > =C2=A0 #define to_pmbus_sensor(_attr) \
> > > > =C2=A0=C2=A0	container_of(_attr, struct pmbus_sensor, attribute)
> > =C2=A0=C2=A0
> > > > +#define PB_FAN_CONFIG_RPM		PB_FAN_2_RPM
> > +#define PB_FAN_CONFIG_INSTALLED		PB_FAN_2_INSTALLEDBUS_VIRT_
>=20
> Something seems odd here. PB_FAN_2_INSTALLEDBUS_VIRT_ ?

Yes, that's busted. Not sure what went wrong, but I'll clean it up.

>=20
> > > > +#define PB_FAN_CONFIG_MASK(i)		(0xff << (4 * !((i) & 1)))
> > > > +#define PB_FAN_CONFIG_GET(i, n)		(((n) >> (4 * !((i) & 1))) & 0xff=
)
> > > > +#define PB_FAN_CONFIG_PUT(i, n)		(((n) & 0xff) << (4 * !((i) & 1))=
)
> > +
>=20
> Aren't there standard bit manipulation macros for that ? Either case, thi=
s is just to avoid
> having to use the existing defines.=20

As I store the configuration for each fan in a struct pmbus_fan_ctrl
dedicated to the fan, I reasoned that intermediate code should not have
to deal with the details of which nibble to access with respect to the
fan's (per-page) ID. Rather, code reading or writing
PMBUS_FAN_COMMAND_[1-4] should deal with ensuring the correct values
are provided.

> Ok, but then I think it would make more sense to
> make it generic, ie change the core to not use PB_FAN_2_RPM / PB_FAN_1_RP=
M etc.
> but PB_FAN_RPM(index) everywhere.

I'll make the change throughout pmbus core.

>=20
> > +struct pmbus_fan_ctrl_attr {
> > > > +	struct device_attribute attribute;
> > > > +	char name[PMBUS_NAME_SIZE];
> > +};
> > +
> > +struct pmbus_fan_ctrl {
> > > > +	struct pmbus_fan_ctrl_attr fan_target;
> > > > +	struct pmbus_fan_ctrl_attr pwm;
> > > > +	struct pmbus_fan_ctrl_attr pwm_enable;
> > > > +	int index;
> > > > +	u8 page;
> > > > +	u8 id;
> > > > +	u8 config;
> > > > +	u16 command;
> > +};
> > +#define to_pmbus_fan_ctrl_attr(_attr) \
> > > > +	container_of(_attr, struct pmbus_fan_ctrl_attr, attribute)
> > +#define fan_target_to_pmbus_fan_ctrl(_attr) \
> > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl=
, \
> > > > +			fan_target)
> > +#define pwm_to_pmbus_fan_ctrl(_attr) \
> > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl=
, pwm)
> > +#define pwm_enable_to_pmbus_fan_ctrl(_attr) \
> > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl=
, \
> > > > +			pwm_enable)
> > +
> > =C2=A0 struct pmbus_boolean {
> > > > > > =C2=A0=C2=A0	char name[PMBUS_NAME_SIZE];	/* sysfs boolean name =
*/
> > > > =C2=A0=C2=A0	struct sensor_device_attribute attribute;
> > @@ -806,6 +838,219 @@ static ssize_t pmbus_show_label(struct device *de=
v,
> > > > =C2=A0=C2=A0	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
> > =C2=A0 }
> > =C2=A0=C2=A0
> > +static ssize_t pmbus_show_fan_command(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pmbus_fan_mode mode,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan=
, char *buf)
> > +{
> > > > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> > > > +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > > > +	struct pmbus_sensor sensor;
> > > > +	long val;
> > +
> > > > +	mutex_lock(&data->update_lock);
> > +
> > > > +	if ((mode =3D=3D percent && (fan->config & PB_FAN_CONFIG_RPM)) ||
> > > > +			(mode =3D=3D rpm && !(fan->config & PB_FAN_CONFIG_RPM))) {
> > > > +		mutex_unlock(&data->update_lock);
> > +		return -ENOTSUPP; /* XXX: This seems dodgy, but what to do? */
>=20
> Not create the attribute in question in the first place, or return 0. The=
 above
> messes up the 'sensors' command.

I think returning 0 is the only valid option of the two, given that we
can dynamically switch between RPM and PWM modes.

Thanks for the feedback.

Andrew

>=20
> > > > +	}
> > +
> > > > +	sensor.class =3D PSC_FAN;
> > > > +	if (mode =3D=3D percent)
> > > > +		sensor.data =3D fan->command * 255 / 100;
> > > > +	else
> > > > +		sensor.data =3D fan->command;
> > +
> > > > +	val =3D pmbus_reg2data(data, &sensor);
> > +
> > > > +	mutex_unlock(&data->update_lock);
> > +
> > > > +	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
> > +}
> > +
> > +static ssize_t pmbus_show_fan_target(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da, cha=
r *buf)
> > +{
> > > > +	return pmbus_show_fan_command(dev, rpm,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fan_target_to_pmbus_fan_ct=
rl(da), buf);
> > +}
> > +
> > +static ssize_t pmbus_show_pwm(struct device *dev,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da=
, char *buf)
> > +{
> > > > +	return pmbus_show_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl=
(da),
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf);
> > +}
> > +
> > +static ssize_t pmbus_set_fan_command(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pmbus_fan_mode mode,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, ssize_t count)
> > +{
> > > > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> > > > +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > > > +	int config_addr, command_addr;
> > > > +	struct pmbus_sensor sensor;
> > > > +	ssize_t rv;
> > > > +	long val;
> > +
> > > > +	if (kstrtol(buf, 10, &val) < 0)
> > > > +		return -EINVAL;
> > +
> > > > +	mutex_lock(&data->update_lock);
> > +
> > > > +	sensor.class =3D PSC_FAN;
> > +
> > > > +	val =3D pmbus_data2reg(data, &sensor, val);
> > +
> > > > +	if (mode =3D=3D percent)
> > > > +		val =3D val * 100 / 255;
> > +
> > > > +	config_addr =3D (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_C=
ONFIG_34;
> > > > +	command_addr =3D config_addr + 1 + (fan->id & 1);
> > +
> > > > +	if (mode =3D=3D rpm)
> > > > +		fan->config |=3D PB_FAN_CONFIG_RPM;
> > > > +	else
> > > > +		fan->config &=3D ~PB_FAN_CONFIG_RPM;
> > +
> > > > +	rv =3D pmbus_update_byte_data(client, fan->page, config_addr,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_PUT(fan->id, fan->config=
),
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_MASK(fan->id));
> > > > +	if (rv < 0)
> > > > +		goto done;
> > +
> > > > +	fan->command =3D val;
> > > > +	rv =3D pmbus_write_word_data(client, fan->page, command_addr,
> > > > +				=C2=A0=C2=A0=C2=A0fan->command);
> > +
> > +done:
> > > > +	mutex_unlock(&data->update_lock);
> > +
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	return count;
> > +}
> > +
> > +static ssize_t pmbus_set_fan_target(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > +{
> > > > +	return pmbus_set_fan_command(dev, rpm,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fan_target_to_pmbus_fan_ctrl(da)=
, buf,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0count);
> > +}
> > +
> > +static ssize_t pmbus_set_pwm(struct device *dev, struct device_attribu=
te *da,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > +{
> > > > +	return pmbus_set_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl(=
da),
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf, count);
> > +}
> > +
> > +static ssize_t pmbus_show_pwm_enable(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da, cha=
r *buf)
> > +{
> > > > +	struct pmbus_fan_ctrl *fan =3D pwm_enable_to_pmbus_fan_ctrl(da);
> > > > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> > > > +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > > > +	long mode;
> > +
> > > > +	mutex_lock(&data->update_lock);
> > +
> > +
> > > > +	if (data->info->get_pwm_mode) {
> > > > +		u8 config =3D PB_FAN_CONFIG_PUT(fan->id, fan->config);
> > +
> > > > +		mode =3D data->info->get_pwm_mode(fan->id, config, fan->command)=
;
> > > > +	} else {
> > > > +		struct pmbus_sensor sensor =3D {
> > > > +			.class =3D PSC_FAN,
> > > > +			.data =3D fan->command,
> > > > +		};
> > > > +		long command;
> > +
> > > > +		command =3D pmbus_reg2data(data, &sensor);
> > +
> > > > +		/* XXX: Need to do something sensible */
> > > > +		if (fan->config & PB_FAN_CONFIG_RPM)
> > > > +			mode =3D 2;
> > > > +		else
> > > > +			mode =3D (command >=3D 0 && command < 100);
> > > > +	}
> > +
> > > > +	mutex_unlock(&data->update_lock);
> > +
> > > > +	return snprintf(buf, PAGE_SIZE, "%ld\n", mode);
> > +}
> > +
> > +static ssize_t pmbus_set_pwm_enable(struct device *dev,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > +{
> > > > +	struct pmbus_fan_ctrl *fan =3D pwm_enable_to_pmbus_fan_ctrl(da);
> > > > +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> > > > +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > > > +	int config_addr, command_addr;
> > > > +	struct pmbus_sensor sensor;
> > > > +	ssize_t rv =3D count;
> > > > +	long mode;
> > +
> > > > +	if (kstrtol(buf, 10, &mode) < 0)
> > > > +		return -EINVAL;
> > +
> > > > +	mutex_lock(&data->update_lock);
> > +
> > > > +	sensor.class =3D PSC_FAN;
> > +
> > > > +	config_addr =3D (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_C=
ONFIG_34;
> > > > +	command_addr =3D config_addr + 1 + (fan->id & 1);
> > +
> > > > +	if (data->info->set_pwm_mode) {
> > > > +		u8 config =3D PB_FAN_CONFIG_PUT(fan->id, fan->config);
> > > > +		u16 command =3D fan->command;
> > +
> > > > +		rv =3D data->info->set_pwm_mode(fan->id, mode, &config, &command=
);
> > > > +		if (rv < 0)
> > > > +			goto done;
> > +
> > > > +		fan->config =3D PB_FAN_CONFIG_GET(fan->id, config);
> > > > +		fan->command =3D command;
> > > > +	} else {
> > > > +		fan->config &=3D ~PB_FAN_CONFIG_RPM;
> > > > +		switch (mode) {
> > > > +		case 0:
> > > > +		case 1:
> > > > +			/* XXX: Safe at least? */
> > > > +			fan->command =3D pmbus_data2reg(data, &sensor, 100);
> > > > +			break;
> > > > +		case 2:
> > > > +		default:
> > > > +			/* XXX: Safe at least? */
> > > > +			fan->command =3D 0xffff;
> > > > +			break;
> > > > +		}
> > > > +	}
> > +
> > > > +	rv =3D pmbus_update_byte_data(client, fan->page, config_addr,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_PUT(fan->id, fan->config=
),
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_MASK(fan->id));
> > > > +	if (rv < 0)
> > > > +		goto done;
> > +
> > > > +	rv =3D pmbus_write_word_data(client, fan->page, command_addr,
> > > > +				=C2=A0=C2=A0=C2=A0fan->command);
> > +
> > +done:
> > > > +	mutex_unlock(&data->update_lock);
> > +
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	return count;
> > +}
> > +
> > =C2=A0 static int pmbus_add_attribute(struct pmbus_data *data, struct a=
ttribute *attr)
> > =C2=A0 {
> > > > =C2=A0=C2=A0	if (data->num_attributes >=3D data->max_attributes - 1=
) {
> > @@ -1094,6 +1339,51 @@ static int pmbus_add_sensor_attrs(struct i2c_cli=
ent *client,
> > > > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=C2=A0
> > +static int pmbus_add_fan_ctrl_attr(struct pmbus_data *data,
> > > > +				=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl_attr *fa,
> > > > +				=C2=A0=C2=A0=C2=A0const char *name_fmt,
> > > > +				=C2=A0=C2=A0=C2=A0ssize_t (*show)(struct device *dev,
> > > > +					=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > > > +					=C2=A0=C2=A0=C2=A0char *buf),
> > > > +				=C2=A0=C2=A0=C2=A0ssize_t (*store)(struct device *dev,
> > > > +					=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > > > +					=C2=A0=C2=A0=C2=A0const char *buf, size_t count),
> > > > +				=C2=A0=C2=A0=C2=A0int idx)
> > +{
> > > > +	struct device_attribute *da;
> > +
> > > > +	da =3D &fa->attribute;
> > +
> > > > +	snprintf(fa->name, sizeof(fa->name), name_fmt, idx);
> > > > +	pmbus_dev_attr_init(da, fa->name, 0644, show, store);
> > +
> > > > +	return pmbus_add_attribute(data, &da->attr);
> > +}
> > +
> > +static inline int pmbus_add_fan_target_attr(struct pmbus_data *data,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > +{
> > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->fan_target, "fan%d_tar=
get",
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_show_fan_targe=
t,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_fan_target=
, fan->index);
> > +}
> > +
> > +static inline int pmbus_add_pwm_attr(struct pmbus_data *data,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > +{
> > +
> > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm, "pwm%d", pmbus_sh=
ow_pwm,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_pwm, fan->=
index);
> > +}
> > +
> > +static inline int pmbus_add_pwm_enable_attr(struct pmbus_data *data,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > +{
> > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm_enable, "pwm%d_ena=
ble",
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_show_pwm_enabl=
e,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_pwm_enable=
, fan->index);
> > +}
> > +
> > =C2=A0 static const struct pmbus_limit_attr vin_limit_attrs[] =3D {
> > > > =C2=A0=C2=A0	{
> > > > =C2=A0=C2=A0		.reg =3D PMBUS_VIN_UV_WARN_LIMIT,
> > @@ -1565,6 +1855,13 @@ static const int pmbus_fan_config_registers[] =
=3D {
> > > > =C2=A0=C2=A0	PMBUS_FAN_CONFIG_34
> > =C2=A0 };
> > =C2=A0=C2=A0
> > +static const int pmbus_fan_command_registers[] =3D {
> > > > +	PMBUS_FAN_COMMAND_1,
> > > > +	PMBUS_FAN_COMMAND_2,
> > > > +	PMBUS_FAN_COMMAND_3,
> > > > +	PMBUS_FAN_COMMAND_4,
> > +};
> > +
> > =C2=A0 static const int pmbus_fan_status_registers[] =3D {
> > > > =C2=A0=C2=A0	PMBUS_STATUS_FAN_12,
> > > > =C2=A0=C2=A0	PMBUS_STATUS_FAN_12,
> > @@ -1587,6 +1884,39 @@ static const u32 pmbus_fan_status_flags[] =3D {
> > =C2=A0 };
> > =C2=A0=C2=A0
> > =C2=A0 /* Fans */
> > +static int pmbus_add_fan_ctrl(struct i2c_client *client,
> > > > +		struct pmbus_data *data, int index, int page, int id,
> > > > +		u8 config)
> > +{
> > > > +	struct pmbus_fan_ctrl *fan;
> > > > +	int rv;
> > +
> > > > +	fan =3D devm_kzalloc(data->dev, sizeof(*fan), GFP_KERNEL);
> > > > +	if (!fan)
> > > > +		return -ENOMEM;
> > +
> > > > +	fan->index =3D index;
> > > > +	fan->page =3D page;
> > > > +	fan->id =3D id;
> > > > +	fan->config =3D config;
> > +
> > > > +	rv =3D _pmbus_read_word_data(client, page,
> > > > +			pmbus_fan_command_registers[id]);
> > > > +	if (rv < 0)
> > > > +		return rv;
> > > > +	fan->command =3D rv;
> > +
> > > > +	rv =3D pmbus_add_fan_target_attr(data, fan);
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	rv =3D pmbus_add_pwm_attr(data, fan);
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	return pmbus_add_pwm_enable_attr(data, fan);
> > +}
> > +
> > =C2=A0 static int pmbus_add_fan_attributes(struct i2c_client *client,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_data *data)
> > =C2=A0 {
> > @@ -1624,6 +1954,11 @@ static int pmbus_add_fan_attributes(struct i2c_c=
lient *client,
> > > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PSC_FAN, true, true)=
 =3D=3D NULL)
> > > > =C2=A0=C2=A0				return -ENOMEM;
> > =C2=A0=C2=A0
> > > > +			ret =3D pmbus_add_fan_ctrl(client, data, index, page, f,
> > > > +						=C2=A0regval);
> > > > +			if (ret < 0)
> > > > +				return ret;
> > +
> > > > =C2=A0=C2=A0			/*
> > > > =C2=A0=C2=A0			=C2=A0* Each fan status register covers multiple fan=
s,
> > > > =C2=A0=C2=A0			=C2=A0* so we have to do some magic.
> >=20
>=20
>=20
--=-ZRMt9a+Ncov3R5UOOCRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZZW/PAAoJEJ0dnzgO5LT5HfsP/1xLQJzenHHIEIIKyWukHBPb
GjT3YSK0rsZL83WbtgyLTKYHGESvAPncJz2Q2U4mM63j5nPCBF8kI+kU7VWre8JG
crxJkrtDQHF/DsBdqVqjIqGxmQPbhUuH+2PfHbJbNdsEZD5t483OK4JpXUqeCHSS
8W5glyNt0FLiJWnBZmzaa1uqd97D2PEfXnKErqj7O7rBss/6dnP2nJWsoLQ9xA7G
Ujc/lgwxmzhxNdmGx8H+W+N5jCVYZf27RWFzeQfoPqiV4v62JvBraiXg+We509rF
oP977AUo8QSwjL+1zcV4UDUy3wS5YUFqyR7rtXopSDCv1YWZnzQsB3wbqCxsqAx7
ZuGDhSh9WbeJizcSWHUfOLsumLg3OrTacnBGc759iAzP111Y/yCfy8yawQTF8qXq
f6j30/s1JlU9x82gro4ytDP7xsQu6Gjh/ovEP9PB89LO2WlwU9FYgThFMTWnJBOD
uN/kx0eYmj80MAPIPCORYPzAYmCyTzIq/ckUA4yu8ijMk/fXImFk81bkmsKRXnfK
1aJBgDbQnmA7kDguaZ+d5QmxXDOvq1jbh/KRBZasc2Tqk+1tMrA1rCxnzI3aJ8Q0
X/YOTmHeqY3c5d31jL3Kc0yiAEFfT8wHV5MDbdReQJqRS8WVeoC8LSieTq24+H57
GyqxE5NOFs36cxGY3tQ/
=c4XW
-----END PGP SIGNATURE-----

--=-ZRMt9a+Ncov3R5UOOCRU--
