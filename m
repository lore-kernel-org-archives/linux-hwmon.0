Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1510283007.4287.41.camel@aj.id.au>
Subject: Re: [v4,3/6] pmbus: core: Add fan control support
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, joel@jms.id.au,
	openbmc@lists.ozlabs.org
Date: Fri, 10 Nov 2017 13:33:27 +1030
In-Reply-To: <20171105143957.GA23897@roeck-us.net>
References: <20171103045306.26448-4-andrew@aj.id.au>
	 <20171105143957.GA23897@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZQpS+milW3uWhhSkTKtI"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-ZQpS+milW3uWhhSkTKtI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-11-05 at 06:39 -0800, Guenter Roeck wrote:
> On Fri, Nov 03, 2017 at 03:53:03PM +1100, Andrew Jeffery wrote:
> > Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.
> >=20
> > Fans in a PMBus device are driven by the configuration of two registers=
:
> > FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
> > and the tacho operate (if installed), while FAN_COMMAND_x sets the
> > desired fan rate. The unit of FAN_COMMAND_x is dependent on the
> > operational fan mode, RPM or PWM percent duty, as determined by the
> > corresponding FAN_CONFIG_x_y.
> >=20
> > The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y an=
d
> > FAN_COMMAND_x is implemented with the addition of virtual registers and
> > generic implementations in the core:
> >=20
> > 1. PMBUS_VIRT_FAN_TARGET_x
> > 2. PMBUS_VIRT_PWM_x
> > 3. PMBUS_VIRT_PWM_ENABLE_x
> >=20
> > The virtual registers facilitate the necessary side-effects of each
> > access. Examples of the read case, assuming m =3D 1, b =3D 0, R =3D 0:
> >=20
> >              Read     |              With              || Gives
> >          -------------------------------------------------------
> >            Attribute  | FAN_CONFIG_x_y | FAN_COMMAND_y || Value
> >          ----------------------------------------------++-------
> >           fanX_target | ~PB_FAN_z_RPM  | 0x0001        || 1
> >           pwm1        | ~PB_FAN_z_RPM  | 0x0064        || 255
> >           pwmX_enable | ~PB_FAN_z_RPM  | 0x0001        || 1
> >           fanX_target |  PB_FAN_z_RPM  | 0x0001        || 1
> >           pwm1        |  PB_FAN_z_RPM  | 0x0064        || 0
> >           pwmX_enable |  PB_FAN_z_RPM  | 0x0001        || 1
> >=20
> > And the write case:
> >=20
> >              Write    | With  ||               Sets
> >          -------------+-------++----------------+---------------
> >            Attribute  | Value || FAN_CONFIG_x_y | FAN_COMMAND_x
> >          -------------+-------++----------------+---------------
> >           fanX_target | 1     ||  PB_FAN_z_RPM  | 0x0001
> >           pwmX        | 255   || ~PB_FAN_z_RPM  | 0x0064
> >           pwmX_enable | 1     || ~PB_FAN_z_RPM  | 0x0064
> >=20
> > Also, the DIRECT mode scaling of some controllers is different between
> > RPM and PWM percent duty control modes, so PSC_PWM is introduced to
> > capture the necessary coefficients.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/hwmon/pmbus/pmbus.h      |  29 +++++
> >  drivers/hwmon/pmbus/pmbus_core.c | 224 +++++++++++++++++++++++++++++++=
+++++---
> >  2 files changed, 238 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index 4efa2bd4f6d8..cdf3e288e626 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -190,6 +190,28 @@ enum pmbus_regs {
> >  	PMBUS_VIRT_VMON_UV_FAULT_LIMIT,
> >  	PMBUS_VIRT_VMON_OV_FAULT_LIMIT,
> >  	PMBUS_VIRT_STATUS_VMON,
> > +
> > +	/*
> > +	 * RPM and PWM Fan control
> > +	 *
> > +	 * Drivers wanting to expose PWM control must define the behaviour of
> > +	 * PMBUS_VIRT_PWM_ENABLE_[1-4] in the {read,write}_word_data callback=
.
> > +	 *
> > +	 * pmbus core provides default implementations for
> > +	 * PMBUS_VIRT_FAN_TARGET_[1-4] and PMBUS_VIRT_PWM_[1-4].
> > +	 */
> > +	PMBUS_VIRT_FAN_TARGET_1,
> > +	PMBUS_VIRT_FAN_TARGET_2,
> > +	PMBUS_VIRT_FAN_TARGET_3,
> > +	PMBUS_VIRT_FAN_TARGET_4,
> > +	PMBUS_VIRT_PWM_1,
> > +	PMBUS_VIRT_PWM_2,
> > +	PMBUS_VIRT_PWM_3,
> > +	PMBUS_VIRT_PWM_4,
> > +	PMBUS_VIRT_PWM_ENABLE_1,
> > +	PMBUS_VIRT_PWM_ENABLE_2,
> > +	PMBUS_VIRT_PWM_ENABLE_3,
> > +	PMBUS_VIRT_PWM_ENABLE_4,
> >  };
> > =20
> >  /*
> > @@ -223,6 +245,8 @@ enum pmbus_regs {
> >  #define PB_FAN_1_RPM			BIT(6)
> >  #define PB_FAN_1_INSTALLED		BIT(7)
> > =20
> > +enum pmbus_fan_mode { percent =3D 0, rpm };
> > +
> >  /*
> >   * STATUS_BYTE, STATUS_WORD (lower)
> >   */
> > @@ -313,6 +337,7 @@ enum pmbus_sensor_classes {
> >  	PSC_POWER,
> >  	PSC_TEMPERATURE,
> >  	PSC_FAN,
> > +	PSC_PWM,
> >  	PSC_NUM_CLASSES		/* Number of power sensor classes */
> >  };
> > =20
> > @@ -339,6 +364,8 @@ enum pmbus_sensor_classes {
> >  #define PMBUS_HAVE_STATUS_FAN34	BIT(17)
> >  #define PMBUS_HAVE_VMON		BIT(18)
> >  #define PMBUS_HAVE_STATUS_VMON	BIT(19)
> > +#define PMBUS_HAVE_PWM12	BIT(20)
> > +#define PMBUS_HAVE_PWM34	BIT(21)
> > =20
> >  enum pmbus_data_format { linear =3D 0, direct, vid };
> >  enum vrm_version { vr11 =3D 0, vr12, vr13 };
> > @@ -413,6 +440,8 @@ int pmbus_write_byte_data(struct i2c_client *client=
, int page, u8 reg,
> >  			  u8 value);
> >  int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg=
,
> >  			   u8 mask, u8 value);
> > +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> > +		     u8 config, u8 mask, u16 command);
> >  void pmbus_clear_faults(struct i2c_client *client);
> >  bool pmbus_check_byte_register(struct i2c_client *client, int page, in=
t reg);
> >  bool pmbus_check_word_register(struct i2c_client *client, int page, in=
t reg);
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index 302f0aef59de..55838b69e99a 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -64,6 +64,7 @@ struct pmbus_sensor {
> >  	u16 reg;		/* register */
> >  	enum pmbus_sensor_classes class;	/* sensor class */
> >  	bool update;		/* runtime sensor update needed */
> > +	bool convert;		/* Whether or not to apply linear/vid/direct */
> >  	int data;		/* Sensor data.
> >  				   Negative if there was a read error */
> >  };
> > @@ -128,6 +129,27 @@ struct pmbus_debugfs_entry {
> >  	u8 reg;
> >  };
> > =20
> > +static const int pmbus_fan_rpm_mask[] =3D {
> > +	PB_FAN_1_RPM,
> > +	PB_FAN_2_RPM,
> > +	PB_FAN_1_RPM,
> > +	PB_FAN_2_RPM,
> > +};
> > +
> > +static const int pmbus_fan_config_registers[] =3D {
> > +	PMBUS_FAN_CONFIG_12,
> > +	PMBUS_FAN_CONFIG_12,
> > +	PMBUS_FAN_CONFIG_34,
> > +	PMBUS_FAN_CONFIG_34
> > +};
> > +
> > +static const int pmbus_fan_command_registers[] =3D {
> > +	PMBUS_FAN_COMMAND_1,
> > +	PMBUS_FAN_COMMAND_2,
> > +	PMBUS_FAN_COMMAND_3,
> > +	PMBUS_FAN_COMMAND_4,
> > +};
> > +
> >  void pmbus_clear_cache(struct i2c_client *client)
> >  {
> >  	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > @@ -198,6 +220,31 @@ int pmbus_write_word_data(struct i2c_client *clien=
t, u8 page, u8 reg, u16 word)
> >  }
> >  EXPORT_SYMBOL_GPL(pmbus_write_word_data);
> > =20
> > +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> > +			       u8 config, u8 mask, u16 command)
>=20
> Please make sure continuation lines are aligned to '(' where possible.

Yep, sorry about that.

>=20
> > +{
> > +	int from, rv;
> > +	u8 to;
> > +
> > +	from =3D pmbus_read_byte_data(client, page,
> > +				    pmbus_fan_config_registers[id]);
> > +	if (from < 0)
> > +		return from;
> > +
> > +	to =3D (from & ~mask) | (config & mask);
> > +
> > +	if (to !=3D from) {
> > +		rv =3D pmbus_write_byte_data(client, page,
> > +					   pmbus_fan_config_registers[id], to);
> > +		if (rv < 0)
> > +			return rv;
> > +	}
> > +
> > +	return pmbus_write_word_data(client, page,
> > +				     pmbus_fan_command_registers[id], command);
> > +}
> > +EXPORT_SYMBOL_GPL(pmbus_update_fan);
> > +
> >  /*
> >   * _pmbus_write_word_data() is similar to pmbus_write_word_data(), but=
 checks if
> >   * a device specific mapping function exists and calls it if necessary=
.
> > @@ -214,8 +261,40 @@ static int _pmbus_write_word_data(struct i2c_clien=
t *client, int page, int reg,
> >  		if (status !=3D -ENODATA)
> >  			return status;
> >  	}
> > -	if (reg >=3D PMBUS_VIRT_BASE)
> > -		return -ENXIO;
> > +	if (reg >=3D PMBUS_VIRT_BASE) {
> > +		int id, bit;
> > +
> > +		switch (reg) {
> > +		case PMBUS_VIRT_FAN_TARGET_1:
> > +		case PMBUS_VIRT_FAN_TARGET_2:
> > +		case PMBUS_VIRT_FAN_TARGET_3:
> > +		case PMBUS_VIRT_FAN_TARGET_4:
>=20
> Maybe
> 		case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:

Sure. I'll fix all instances of this.

>=20
> > +			id =3D reg - PMBUS_VIRT_FAN_TARGET_1;
> > +			bit =3D pmbus_fan_rpm_mask[id];
> > +			status =3D pmbus_update_fan(client, page, id, bit, bit,
> > +						  word);
> > +			break;
> > +		case PMBUS_VIRT_PWM_1:
> > +		case PMBUS_VIRT_PWM_2:
> > +		case PMBUS_VIRT_PWM_3:
> > +		case PMBUS_VIRT_PWM_4:
> > +		{
> > +			u32 command =3D word;
>=20
> Please move command up and drop the {.

My default is to scope variables to where they are needed, but will
fix.

>=20
> Why u32 ? The value should be bound to 0..255 (if it isn't and a larger
> value is accepted we have overflow issues).

It gets scaled below, though we still only need u16 if the max value is
255. I'll fix it.

>=20
> > +
> > +			id =3D reg - PMBUS_VIRT_PWM_1;
> > +			bit =3D pmbus_fan_rpm_mask[id];
> > +			command *=3D 100;
> > +			command /=3D 255;
> > +			status =3D pmbus_update_fan(client, page, id, 0, bit,
> > +						  command);
> > +			break;
> > +		}
> > +		default:
> > +			status =3D -ENXIO;
> > +			break;
> > +		}
> > +		return status;
>=20
> Please move this code to a separate function.

Will do.

>=20
> > +	}
> >  	return pmbus_write_word_data(client, page, reg, word);
> >  }
> > =20
> > @@ -231,6 +310,9 @@ int pmbus_read_word_data(struct i2c_client *client,=
 u8 page, u8 reg)
> >  }
> >  EXPORT_SYMBOL_GPL(pmbus_read_word_data);
> > =20
> > +static int pmbus_get_fan_command(struct i2c_client *client, int page, =
int id,
> > +				 enum pmbus_fan_mode mode);
> > +
> >  /*
> >   * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but c=
hecks if
> >   * a device specific mapping function exists and calls it if necessary=
.
> > @@ -246,8 +328,42 @@ static int _pmbus_read_word_data(struct i2c_client=
 *client, int page, int reg)
> >  		if (status !=3D -ENODATA)
> >  			return status;
> >  	}
> > -	if (reg >=3D PMBUS_VIRT_BASE)
> > -		return -ENXIO;
> > +	if (reg >=3D PMBUS_VIRT_BASE) {
> > +		int id;
> > +
> > +		switch (reg) {
> > +		case PMBUS_VIRT_FAN_TARGET_1:
> > +		case PMBUS_VIRT_FAN_TARGET_2:
> > +		case PMBUS_VIRT_FAN_TARGET_3:
> > +		case PMBUS_VIRT_FAN_TARGET_4:
>=20
> Since there is an implied assumption that those are sequential,
> how about the following ?
>=20
> 		case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:

Will fix all instances of this, as noted above.

>=20
> > +			id =3D reg - PMBUS_VIRT_FAN_TARGET_1;
>=20
> This warrants a comment in the definition of PMBUS_VIRT_FAN_TARGET_X
> and PMBUS_VIRT_PWM_X stating that the definitions must be in sequence.

Right, will add a comment to that effect.

>=20
> > +			status =3D pmbus_get_fan_command(client, page, id, rpm);
> > +			break;
> > +		case PMBUS_VIRT_PWM_1:
> > +		case PMBUS_VIRT_PWM_2:
> > +		case PMBUS_VIRT_PWM_3:
> > +		case PMBUS_VIRT_PWM_4:
>=20
> Same as above.

Ack.

>=20
> > +		{
> > +			int rv;
>=20
> Please move the declaration up and drop the {.

Ack.

>=20
> > +
> > +			id =3D reg - PMBUS_VIRT_PWM_1;
> > +			rv =3D pmbus_get_fan_command(client, page, id, percent);
> > +			if (rv < 0)
> > +				return rv;
> > +
>=20
> Is this guaranteed to be <=3D 100 ?

PMBus spec rev 1.2 part II says in 14.10 and 14.11:

The second part of the configuration tells the device whether the fan
speed commands are in RPM or PWM duty cycle (in percent).

However, the MAX31785 accepts the ranges 0-0x2710, so allows fractions
of a percent.

Not sure what my thoughts were here, it's probably best just to drop
this default PWM implementation as well.

>=20
> > +			rv *=3D 255;
> > +			rv /=3D 100;
> > +
> > +			status =3D rv;
> > +			break;
> > +		}
> > +		default:
> > +			status =3D -ENXIO;
> > +			break;
> > +		}
>=20
> Please move this code to a separate function.

Will do, though given I plan to gut the PWM implementation is it still
so disruptive?

>=20
> > +
> > +		return status;
> > +	}
> >  	return pmbus_read_word_data(client, page, reg);
> >  }
> > =20
> > @@ -314,6 +430,28 @@ static int _pmbus_read_byte_data(struct i2c_client=
 *client, int page, int reg)
> >  	return pmbus_read_byte_data(client, page, reg);
> >  }
> > =20
> > +static int pmbus_get_fan_command(struct i2c_client *client, int page, =
int id,
> > +				 enum pmbus_fan_mode mode)
>=20
> Maybe better pmbus_get_fan_get_speed_rpm to clarify that we are not
> really interested in the command register value but but in speed or rpm ?

Sounds reasonable on the surface. I'll look into it.

>=20
> > +{
> > +	int config;
> > +
> > +	config =3D _pmbus_read_byte_data(client, page,
> > +				       pmbus_fan_config_registers[id]);
> > +	if (config < 0)
> > +		return config;
> > +
> > +	/*
> > +	 * We can't meaningfully translate between PWM and RPM, so if the
> > +	 * attribute mode (fan[1-*]_target is RPM, pwm[1-*] and pwm[1-*]_enab=
le
> > +	 * are PWM) doesn't match the hardware mode, then report 0 instead.
> > +	 */
> > +	if ((mode =3D=3D rpm) !=3D (!!(config & pmbus_fan_rpm_mask[id])))
> > +		return 0;
>=20
> Please drop the unnecessary ().

Sure.

>=20
> I am not too happy about this - the user has no means to specify pwm or
> fan target speed _before_ changing the mode. It would be better to report
> (and accept) cached values in that situation, and update the actual value
> as the mode is changed.

I'm with you on the caching idea for switching modes, but do we want to
report values that don't obviously reflect the fan rate to userspace?
In previous revisions I was returning an error here but you pointed out
this would break sensors(1) and suggested I switch to 0 in the conflict
case.

>=20
> > +
> > +	return _pmbus_read_word_data(client, page,
> > +				     pmbus_fan_command_registers[id]);
> > +}
> > +
> >  static void pmbus_clear_fault_page(struct i2c_client *client, int page=
)
> >  {
> >  	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> > @@ -515,7 +653,7 @@ static long pmbus_reg2data_direct(struct pmbus_data=
 *data,
> >  	/* X =3D 1/m * (Y * 10^-R - b) */
> >  	R =3D -R;
> >  	/* scale result to milli-units for everything but fans */
> > -	if (sensor->class !=3D PSC_FAN) {
> > +	if (!(sensor->class =3D=3D PSC_FAN || sensor->class =3D=3D PSC_PWM)) =
{
>=20
> Please use positive logic
>=20
> 	if (sensor->class !=3D PSC_FAN && sensor->class !=3D PSC_PWM)
>=20
> It is (at least for me) much easier to read.

Okay.

>=20
> >  		R +=3D 3;
> >  		b *=3D 1000;
> >  	}
> > @@ -569,6 +707,9 @@ static long pmbus_reg2data(struct pmbus_data *data,=
 struct pmbus_sensor *sensor)
> >  {
> >  	long val;
> > =20
> > +	if (!sensor->convert)
> > +		return sensor->data;
> > +
> >  	switch (data->info->format[sensor->class]) {
> >  	case direct:
> >  		val =3D pmbus_reg2data_direct(data, sensor);
> > @@ -672,7 +813,7 @@ static u16 pmbus_data2reg_direct(struct pmbus_data =
*data,
> >  	}
> > =20
> >  	/* Calculate Y =3D (m * X + b) * 10^R */
> > -	if (sensor->class !=3D PSC_FAN) {
> > +	if (!(sensor->class =3D=3D PSC_FAN || sensor->class =3D=3D PSC_PWM)) =
{
>=20
> Same as above.
>=20

Ack.

> >  		R -=3D 3;		/* Adjust R and b for data in milli-units */
> >  		b *=3D 1000;
> >  	}
> > @@ -703,6 +844,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
> >  {
> >  	u16 regval;
> > =20
> > +	if (!sensor->convert)
> > +		return val;
> > +
> >  	switch (data->info->format[sensor->class]) {
> >  	case direct:
> >  		regval =3D pmbus_data2reg_direct(data, sensor, val);
> > @@ -925,12 +1069,18 @@ static struct pmbus_sensor *pmbus_add_sensor(str=
uct pmbus_data *data,
> >  		return NULL;
> >  	a =3D &sensor->attribute;
> > =20
> > -	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
> > -		 name, seq, type);
> > +	if (type)
> > +		snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
> > +			 name, seq, type);
> > +	else
> > +		snprintf(sensor->name, sizeof(sensor->name), "%s%d",
> > +			 name, seq);
> > +
> >  	sensor->page =3D page;
> >  	sensor->reg =3D reg;
> >  	sensor->class =3D class;
> >  	sensor->update =3D update;
> > +	sensor->convert =3D true;
> >  	pmbus_dev_attr_init(a, sensor->name,
> >  			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
> >  			    pmbus_show_sensor, pmbus_set_sensor);
> > @@ -1592,13 +1742,6 @@ static const int pmbus_fan_registers[] =3D {
> >  	PMBUS_READ_FAN_SPEED_4
> >  };
> > =20
> > -static const int pmbus_fan_config_registers[] =3D {
> > -	PMBUS_FAN_CONFIG_12,
> > -	PMBUS_FAN_CONFIG_12,
> > -	PMBUS_FAN_CONFIG_34,
> > -	PMBUS_FAN_CONFIG_34
> > -};
> > -
> >  static const int pmbus_fan_status_registers[] =3D {
> >  	PMBUS_STATUS_FAN_12,
> >  	PMBUS_STATUS_FAN_12,
> > @@ -1621,6 +1764,48 @@ static const u32 pmbus_fan_status_flags[] =3D {
> >  };
> > =20
> >  /* Fans */
> > +static int pmbus_add_fan_ctrl(struct i2c_client *client,
> > +		struct pmbus_data *data, int index, int page, int id,
> > +		u8 config)
> > +{
> > +	struct pmbus_sensor *sensor;
> > +	int rv;
> > +
> > +	rv =3D _pmbus_read_word_data(client, page,
> > +				   pmbus_fan_command_registers[id]);
> > +	if (rv < 0)
> > +		return rv;
> > +
> > +	sensor =3D pmbus_add_sensor(data, "fan", "target", index, page,
> > +				  PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
> > +				  true, false);
> > +
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	if (!((data->info->func[page] & PMBUS_HAVE_PWM12) ||
> > +			(data->info->func[page] & PMBUS_HAVE_PWM34)))
>=20
> why not just the following ?
>=20
> 	if (!(data->info->func[page] & (PMBUS_HAVE_PWM12 | PMBUS_HAVE_PWM34)))

Sure, that's much neater.

>=20
> Also, doesn't this add attributes for 1,2 even if only 3,4 are
> supported, and 3,4 even if only 1,2 are supported ?

It shouldn't, but that's due to the way I've called
pmbus_add_fan_ctrl() in pmbus_add_fan_attributes().=20

The call is guarded with:=20

    /* Fan control */
    if (pmbus_check_word_register(client, page,
    		    pmbus_fan_command_registers[f])) {
    	    ret =3D pmbus_add_fan_ctrl(client, data, index,
    	    	    	    	     page, f, regval);
    	    if (ret < 0)
    	    	    return ret;
    }

So 'f', or the formal parameter 'id', is only ever provided as
appropriate, and together the two tests should ensure that only the
appropriate attributes are created.

If the fan is marked as "not installed" then the addition of the
attribute is skipped. This code was already in place to handle the
fanX_input attribute.

So to the caller test, regardless of RPM or PWM mode, we need the
FAN_COMMAND register to configure the values. As it stands the change
makes fan control available for any PMBus device which has the
FAN_COMMANDxy register and whose driver configures a page with
PMBUS_HAVE_FANxy, exposing the fanX_target attribute. The test in
question above deals only with PMBUS_HAVE_PWMxy which was introduced in
this change.

There are some constraints: PMBUS_HAVE_FANxy is required if
PMBUS_HAVE_PWMxy is to be specified for a given page. This should
probably be documented in a comment alongside the #defines.

>=20
> > +		return 0;
> > +
> > +	sensor =3D pmbus_add_sensor(data, "pwm", NULL, index, page,
> > +				  PMBUS_VIRT_PWM_1 + id, PSC_PWM,
> > +				  true, false);
> > +
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	sensor =3D pmbus_add_sensor(data, "pwm", "enable", index, page,
> > +				  PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
> > +				  true, false);
> > +
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	sensor->convert =3D false;
>=20
> convert should be a new parameter to pmbus_add_sensor().

Will fix.

Cheers for the detailed feedback.

Andrew

>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int pmbus_add_fan_attributes(struct i2c_client *client,
> >  				    struct pmbus_data *data)
> >  {
> > @@ -1658,6 +1843,15 @@ static int pmbus_add_fan_attributes(struct i2c_c=
lient *client,
> >  					     PSC_FAN, true, true) =3D=3D NULL)
> >  				return -ENOMEM;
> > =20
> > +			/* Fan control */
> > +			if (pmbus_check_word_register(client, page,
> > +					pmbus_fan_command_registers[f])) {
> > +				ret =3D pmbus_add_fan_ctrl(client, data, index,
> > +							 page, f, regval);
> > +				if (ret < 0)
> > +					return ret;
> > +			}
> > +
> >  			/*
> >  			 * Each fan status register covers multiple fans,
> >  			 * so we have to do some magic.
--=-ZQpS+milW3uWhhSkTKtI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaBRb/AAoJEJ0dnzgO5LT5PCEP/1geXlBtf1h5goZaIQW5zc34
fCrkqDEpXNxLVt0+mKtJWkcqbLhzaJ4PzumgOaUPmbow+Q+Y2UltCh3fGQAuSmTs
hvo4u+wG7sjvk3+dO3vkc6N3mkxW8iQBVIOidduyhWvUmtUuXddonVmsGwoddCFy
UuFfJKxBZ4NWlQU585wnqKbgEAtN3T3bOHUA3k+/JhcC1SdAnQ8MaxMplPhrloRI
URoQLXL6gO9ceo7FdIPiw10WPEWUM9tqRogf6GjNxDbjsc7AR3dFPJKBRr4k/D+p
nqaPaHtwbx5HZcp0Mu2f3hI2X1N2/RhyGUWNAPeRmf/iL+1NLq9TnsNlznuGGHsa
EizxR5U86CmBFn0nFExbeONejBA+EzzrTbvEADFxCD/ZNUIY7H3vs8pIAWi7x9SK
kmFWHOl6vx6M2kATzzjr5pGD/dUAAjcED6QPL5mYsfeXKqqF4Cbd79YGhUS3eJRr
iki3ah0Hh+Owa1EArm0tGNQR2+sDYEV+0NSAjGp7OrIZYKHqNKjBsngC4gmDQuq5
VNShqDyFEH6YLMdC4Lfh2iJn9fM0sTCYCSbF2GyGv5r/E12Ni5oaFtqnUtRqLY5Z
ReVXnVLUbkub3Ws9BuAEbii996UmtkgO6Wwn8xKjJPLfhdLnvXYU9Ttf69gpbfFk
mkYtF85JDbegwgmOIZiU
=XNox
-----END PGP SIGNATURE-----

--=-ZQpS+milW3uWhhSkTKtI--
