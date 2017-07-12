Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1499822412.4935.9.camel@aj.id.au>
Subject: Re: [RFC PATCH 3/4] pmbus: Allow dynamic fan coefficient values
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
	openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
	mspinler@linux.vnet.ibm.com
Date: Wed, 12 Jul 2017 10:50:12 +0930
In-Reply-To: <a7448db8-6df1-38ee-a66d-420d8e429f4e@roeck-us.net>
References: <20170710135618.13661-1-andrew@aj.id.au>
	 <20170710135618.13661-4-andrew@aj.id.au>
	 <a7448db8-6df1-38ee-a66d-420d8e429f4e@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-evf48LOTU5l1vGSkbQ6Z"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-evf48LOTU5l1vGSkbQ6Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-11 at 06:31 -0700, Guenter Roeck wrote:
> On 07/10/2017 06:56 AM, Andrew Jeffery wrote:
> > Some PMBus chips, such as the MAX31785, use different coefficients for
> > FAN_COMMAND_[1-4] depending on whether the fan is in PWM (percent duty)
> > or RPM mode. Add a callback to allow the driver to provide the
> > applicable coefficients to avoid imposing on devices that don't have
> > this requirement.
> >=20
>=20
> Why not just introduce another class, such as PSC_PWM ?

I considered this up front however I wasn't sure where the PMBus sensor
classes were modelled from. The PMBus spec generally doesn't discuss
PMW beyond the concept of fans, and given PSC_FAN already existed I had
a vague feeling that introducing PSC_PWM might not be the way to go. It
also means that PSC_FAN is implicitly RPM in some circumstances, or
both RPM and PWM in others, and wasn't previously contrasted against
PWM as PWM-specific configuration wasn't an option.

However if it's reasonable it should lead to a more straight forward
patch. I'll rework and resend if it falls out nicely.

Thanks,

Andrew

>=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0 drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A018 +++++--
> > =C2=A0 drivers/hwmon/pmbus/pmbus_core.c | 112 +++++++++++++++++++++++++=
+++++++-------
> > =C2=A0 2 files changed, 108 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index 927eabc1b273..338ecc8b25a4 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -345,6 +345,12 @@ enum pmbus_sensor_classes {
> > =C2=A0 enum pmbus_data_format { linear =3D 0, direct, vid };
> > =C2=A0 enum vrm_version { vr11 =3D 0, vr12 };
> > =C2=A0=C2=A0
> > +struct pmbus_coeffs {
> > > > +	int m; /* mantissa for direct data format */
> > > > +	int b; /* offset */
> > > > +	int R; /* exponent */
> > +};
> > +
> > =C2=A0 struct pmbus_driver_info {
> > > > > > =C2=A0=C2=A0	int pages;		/* Total number of pages */
> > > > =C2=A0=C2=A0	enum pmbus_data_format format[PSC_NUM_CLASSES];
> > @@ -353,9 +359,7 @@ struct pmbus_driver_info {
> > > > =C2=A0=C2=A0	=C2=A0* Support one set of coefficients for each senso=
r type
> > > > =C2=A0=C2=A0	=C2=A0* Used for chips providing data in direct mode.
> > > > =C2=A0=C2=A0	=C2=A0*/
> > > > > > -	int m[PSC_NUM_CLASSES];	/* mantissa for direct data format */
> > > > > > -	int b[PSC_NUM_CLASSES];	/* offset */
> > > > > > -	int R[PSC_NUM_CLASSES];	/* exponent */
> > > > +	struct pmbus_coeffs coeffs[PSC_NUM_CLASSES];
> > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	u32 func[PMBUS_PAGES];	/* Functionality, per page =
*/
> > > > =C2=A0=C2=A0	/*
> > @@ -382,6 +386,14 @@ struct pmbus_driver_info {
> > > > =C2=A0=C2=A0	int (*identify)(struct i2c_client *client,
> > > > =C2=A0=C2=A0			struct pmbus_driver_info *info);
> > =C2=A0=C2=A0
> > > > +	/*
> > > > +	=C2=A0* If a fan's coefficents change over time (e.g. between RPM=
 and PWM
> > > > +	=C2=A0* mode), then the driver can provide a function for retriev=
ing the
> > > > +	=C2=A0* currently applicable coefficients.
> > > > +	=C2=A0*/
> > > > +	const struct pmbus_coeffs *(*get_fan_coeffs)(
> > > > +			const struct pmbus_driver_info *info, int index,
> > > > +			enum pmbus_fan_mode mode, int command);
> > > > =C2=A0=C2=A0	/* Allow the driver to interpret the fan command value=
 */
> > > > =C2=A0=C2=A0	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_com=
mand);
> > > > =C2=A0=C2=A0	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index 3b0a55bbbd2c..4ff6a1fd5cce 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -58,10 +58,11 @@
> > =C2=A0 struct pmbus_sensor {
> > > > =C2=A0=C2=A0	struct pmbus_sensor *next;
> > > > > > =C2=A0=C2=A0	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name *=
/
> > > > -	struct device_attribute attribute;
> > > > +	struct sensor_device_attribute attribute;
> > > > > > =C2=A0=C2=A0	u8 page;		/* page number */
> > > > > > =C2=A0=C2=A0	u16 reg;		/* register */
> > > > > > =C2=A0=C2=A0	enum pmbus_sensor_classes class;	/* sensor class *=
/
> > > > +	const struct pmbus_coeffs *coeffs;
> > > > > > =C2=A0=C2=A0	bool update;		/* runtime sensor update needed */
> > > > > > =C2=A0=C2=A0	int data;		/* Sensor data.
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0Negative if there was a read erro=
r */
> > @@ -89,6 +90,7 @@ struct pmbus_fan_ctrl {
> > > > =C2=A0=C2=A0	u8 id;
> > > > =C2=A0=C2=A0	u8 config;
> > > > =C2=A0=C2=A0	u16 command;
> > > > +	const struct pmbus_coeffs *coeffs;
> > =C2=A0 };
> > =C2=A0 #define to_pmbus_fan_ctrl_attr(_attr) \
> > > > =C2=A0=C2=A0	container_of(_attr, struct pmbus_fan_ctrl_attr, attrib=
ute)
> > @@ -511,9 +513,15 @@ static long pmbus_reg2data_direct(struct pmbus_dat=
a *data,
> > > > =C2=A0=C2=A0	long val =3D (s16) sensor->data;
> > > > =C2=A0=C2=A0	long m, b, R;
> > =C2=A0=C2=A0
> > > > -	m =3D data->info->m[sensor->class];
> > > > -	b =3D data->info->b[sensor->class];
> > > > -	R =3D data->info->R[sensor->class];
> > > > +	if (sensor->coeffs) {
> > > > +		m =3D sensor->coeffs->m;
> > > > +		b =3D sensor->coeffs->b;
> > > > +		R =3D sensor->coeffs->R;
> > > > +	} else {
> > > > +		m =3D data->info->coeffs[sensor->class].m;
> > > > +		b =3D data->info->coeffs[sensor->class].b;
> > > > +		R =3D data->info->coeffs[sensor->class].R;
> > > > +	}
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	if (m =3D=3D 0)
> > > > =C2=A0=C2=A0		return 0;
> > @@ -663,9 +671,15 @@ static u16 pmbus_data2reg_direct(struct pmbus_data=
 *data,
> > =C2=A0 {
> > > > =C2=A0=C2=A0	long m, b, R;
> > =C2=A0=C2=A0
> > > > -	m =3D data->info->m[sensor->class];
> > > > -	b =3D data->info->b[sensor->class];
> > > > -	R =3D data->info->R[sensor->class];
> > > > +	if (sensor->coeffs) {
> > > > +		m =3D sensor->coeffs->m;
> > > > +		b =3D sensor->coeffs->b;
> > > > +		R =3D sensor->coeffs->R;
> > > > +	} else {
> > > > +		m =3D data->info->coeffs[sensor->class].m;
> > > > +		b =3D data->info->coeffs[sensor->class].b;
> > > > +		R =3D data->info->coeffs[sensor->class].R;
> > > > +	}
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	/* Power is in uW. Adjust R and b. */
> > > > =C2=A0=C2=A0	if (sensor->class =3D=3D PSC_POWER) {
> > @@ -796,7 +810,9 @@ static ssize_t pmbus_show_sensor(struct device *dev=
,
> > > > =C2=A0=C2=A0				=C2=A0struct device_attribute *devattr, char *buf)
> > =C2=A0 {
> > > > =C2=A0=C2=A0	struct pmbus_data *data =3D pmbus_update_device(dev);
> > > > -	struct pmbus_sensor *sensor =3D to_pmbus_sensor(devattr);
> > > > +	struct pmbus_sensor *sensor;
> > +
> > > > +	sensor =3D to_pmbus_sensor(to_sensor_dev_attr(devattr));
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	if (sensor->data < 0)
> > > > =C2=A0=C2=A0		return sensor->data;
> > @@ -810,12 +826,14 @@ static ssize_t pmbus_set_sensor(struct device *de=
v,
> > =C2=A0 {
> > > > =C2=A0=C2=A0	struct i2c_client *client =3D to_i2c_client(dev->paren=
t);
> > > > =C2=A0=C2=A0	struct pmbus_data *data =3D i2c_get_clientdata(client)=
;
> > > > -	struct pmbus_sensor *sensor =3D to_pmbus_sensor(devattr);
> > > > +	struct pmbus_sensor *sensor;
> > > > =C2=A0=C2=A0	ssize_t rv =3D count;
> > > > =C2=A0=C2=A0	long val =3D 0;
> > > > =C2=A0=C2=A0	int ret;
> > > > =C2=A0=C2=A0	u16 regval;
> > =C2=A0=C2=A0
> > > > +	sensor =3D to_pmbus_sensor(to_sensor_dev_attr(devattr));
> > +
> > > > =C2=A0=C2=A0	if (kstrtol(buf, 10, &val) < 0)
> > > > =C2=A0=C2=A0		return -EINVAL;
> > =C2=A0=C2=A0
> > @@ -856,6 +874,7 @@ static ssize_t pmbus_show_fan_command(struct device=
 *dev,
> > > > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	sensor.class =3D PSC_FAN;
> > > > +	sensor.coeffs =3D fan->coeffs;
> > > > =C2=A0=C2=A0	if (mode =3D=3D percent)
> > > > =C2=A0=C2=A0		sensor.data =3D fan->command * 255 / 100;
> > > > =C2=A0=C2=A0	else
> > @@ -882,6 +901,29 @@ static ssize_t pmbus_show_pwm(struct device *dev,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf);
> > =C2=A0 }
> > =C2=A0=C2=A0
> > +static int pmbus_update_fan_coeffs(struct pmbus_data *data,
> > > > +				=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan,
> > > > +				=C2=A0=C2=A0=C2=A0enum pmbus_fan_mode mode)
> > +{
> > > > +	const struct pmbus_driver_info *info =3D data->info;
> > > > +	struct pmbus_sensor *curr =3D data->sensors;
> > +
> > > > +	fan->coeffs =3D info->get_fan_coeffs(info, fan->index, mode,
> > > > +					=C2=A0=C2=A0=C2=A0PMBUS_FAN_COMMAND_1 + fan->id);
> > +
> > > > +	while (curr) {
> > > > +		if (curr->class =3D=3D PSC_FAN &&
> > > > +				curr->attribute.index =3D=3D fan->index) {
> > > > +			curr->coeffs =3D info->get_fan_coeffs(info, fan->index,
> > > > +							=C2=A0=C2=A0=C2=A0=C2=A0mode, curr->reg);
> > > > +		}
> > +
> > > > +		curr =3D curr->next;
> > > > +	}
> > +
> > > > +	return 0;
> > +}
> > +
> > =C2=A0 static ssize_t pmbus_set_fan_command(struct device *dev,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pmbus_fan_mode m=
ode,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl=
 *fan,
> > @@ -889,6 +931,7 @@ static ssize_t pmbus_set_fan_command(struct device =
*dev,
> > =C2=A0 {
> > > > =C2=A0=C2=A0	struct i2c_client *client =3D to_i2c_client(dev->paren=
t);
> > > > =C2=A0=C2=A0	struct pmbus_data *data =3D i2c_get_clientdata(client)=
;
> > > > +	const struct pmbus_driver_info *info =3D data->info;
> > > > =C2=A0=C2=A0	int config_addr, command_addr;
> > > > =C2=A0=C2=A0	struct pmbus_sensor sensor;
> > > > =C2=A0=C2=A0	ssize_t rv;
> > @@ -899,7 +942,13 @@ static ssize_t pmbus_set_fan_command(struct device=
 *dev,
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	mutex_lock(&data->update_lock);
> > =C2=A0=C2=A0
> > > > +	if (info->format[PSC_FAN] =3D=3D direct && info->get_fan_coeffs) =
{
> > > > +		pmbus_update_fan_coeffs(data, fan, mode);
> > > > +		sensor.coeffs =3D fan->coeffs;
> > > > +	}
> > +
> > > > =C2=A0=C2=A0	sensor.class =3D PSC_FAN;
> > > > +	sensor.attribute.index =3D fan->index;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	val =3D pmbus_data2reg(data, &sensor, val);
> > =C2=A0=C2=A0
> > @@ -968,6 +1017,8 @@ static ssize_t pmbus_show_pwm_enable(struct device=
 *dev,
> > > > =C2=A0=C2=A0		struct pmbus_sensor sensor =3D {
> > > > =C2=A0=C2=A0			.class =3D PSC_FAN,
> > > > =C2=A0=C2=A0			.data =3D fan->command,
> > > > +			.attribute.index =3D fan->index,
> > > > +			.coeffs =3D fan->coeffs,
> > > > =C2=A0=C2=A0		};
> > > > =C2=A0=C2=A0		long command;
> > =C2=A0=C2=A0
> > @@ -992,6 +1043,7 @@ static ssize_t pmbus_set_pwm_enable(struct device =
*dev,
> > > > =C2=A0=C2=A0	struct pmbus_fan_ctrl *fan =3D pwm_enable_to_pmbus_fan=
_ctrl(da);
> > > > =C2=A0=C2=A0	struct i2c_client *client =3D to_i2c_client(dev->paren=
t);
> > > > =C2=A0=C2=A0	struct pmbus_data *data =3D i2c_get_clientdata(client)=
;
> > > > +	const struct pmbus_driver_info *info =3D data->info;
> > > > =C2=A0=C2=A0	int config_addr, command_addr;
> > > > =C2=A0=C2=A0	struct pmbus_sensor sensor;
> > > > =C2=A0=C2=A0	ssize_t rv =3D count;
> > @@ -1003,15 +1055,21 @@ static ssize_t pmbus_set_pwm_enable(struct devi=
ce *dev,
> > > > =C2=A0=C2=A0	mutex_lock(&data->update_lock);
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	sensor.class =3D PSC_FAN;
> > > > +	sensor.attribute.index =3D fan->index;
> > +
> > > > +	if (info->format[PSC_FAN] =3D=3D direct && info->get_fan_coeffs) =
{
> > > > +		pmbus_update_fan_coeffs(data, fan, percent);
> > > > +		sensor.coeffs =3D fan->coeffs;
> > > > +	}
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	config_addr =3D (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : =
PMBUS_FAN_CONFIG_34;
> > > > =C2=A0=C2=A0	command_addr =3D config_addr + 1 + (fan->id & 1);
> > =C2=A0=C2=A0
> > > > -	if (data->info->set_pwm_mode) {
> > > > +	if (info->set_pwm_mode) {
> > > > =C2=A0=C2=A0		u8 config =3D PB_FAN_CONFIG_PUT(fan->id, fan->config)=
;
> > > > =C2=A0=C2=A0		u16 command =3D fan->command;
> > =C2=A0=C2=A0
> > > > -		rv =3D data->info->set_pwm_mode(fan->id, mode, &config, &command=
);
> > > > +		rv =3D info->set_pwm_mode(fan->id, mode, &config, &command);
> > > > =C2=A0=C2=A0		if (rv < 0)
> > > > =C2=A0=C2=A0			goto done;
> > =C2=A0=C2=A0
> > @@ -1138,7 +1196,7 @@ static struct pmbus_sensor *pmbus_add_sensor(stru=
ct pmbus_data *data,
> > > > =C2=A0=C2=A0	sensor =3D devm_kzalloc(data->dev, sizeof(*sensor), GF=
P_KERNEL);
> > > > =C2=A0=C2=A0	if (!sensor)
> > > > =C2=A0=C2=A0		return NULL;
> > > > -	a =3D &sensor->attribute;
> > > > +	a =3D &sensor->attribute.dev_attr;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s"=
,
> > > > =C2=A0=C2=A0		=C2=A0name, seq, type);
> > @@ -1146,9 +1204,9 @@ static struct pmbus_sensor *pmbus_add_sensor(stru=
ct pmbus_data *data,
> > > > =C2=A0=C2=A0	sensor->reg =3D reg;
> > > > =C2=A0=C2=A0	sensor->class =3D class;
> > > > =C2=A0=C2=A0	sensor->update =3D update;
> > > > -	pmbus_dev_attr_init(a, sensor->name,
> > > > +	pmbus_attr_init(&sensor->attribute, sensor->name,
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0readonly ? S_IRUGO : S_IRUGO=
 | S_IWUSR,
> > > > -			=C2=A0=C2=A0=C2=A0=C2=A0pmbus_show_sensor, pmbus_set_sensor);
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0pmbus_show_sensor, pmbus_set_sensor, se=
q);
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	if (pmbus_add_attribute(data, &a->attr))
> > > > =C2=A0=C2=A0		return NULL;
> > @@ -1886,7 +1944,7 @@ static const u32 pmbus_fan_status_flags[] =3D {
> > =C2=A0 /* Fans */
> > =C2=A0 static int pmbus_add_fan_ctrl(struct i2c_client *client,
> > > > =C2=A0=C2=A0		struct pmbus_data *data, int index, int page, int id,
> > > > -		u8 config)
> > > > +		u8 config, const struct pmbus_coeffs *coeffs)
> > =C2=A0 {
> > > > =C2=A0=C2=A0	struct pmbus_fan_ctrl *fan;
> > > > =C2=A0=C2=A0	int rv;
> > @@ -1898,6 +1956,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *=
client,
> > > > =C2=A0=C2=A0	fan->index =3D index;
> > > > =C2=A0=C2=A0	fan->page =3D page;
> > > > =C2=A0=C2=A0	fan->id =3D id;
> > > > +	fan->coeffs =3D coeffs;
> > > > =C2=A0=C2=A0	fan->config =3D config;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	rv =3D _pmbus_read_word_data(client, page,
> > @@ -1921,6 +1980,8 @@ static int pmbus_add_fan_attributes(struct i2c_cl=
ient *client,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_data *data)
> > =C2=A0 {
> > > > =C2=A0=C2=A0	const struct pmbus_driver_info *info =3D data->info;
> > > > +	const struct pmbus_coeffs *coeffs =3D NULL;
> > > > +	enum pmbus_fan_mode mode;
> > > > =C2=A0=C2=A0	int index =3D 1;
> > > > =C2=A0=C2=A0	int page;
> > > > =C2=A0=C2=A0	int ret;
> > @@ -1929,6 +1990,7 @@ static int pmbus_add_fan_attributes(struct i2c_cl=
ient *client,
> > > > =C2=A0=C2=A0		int f;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0		for (f =3D 0; f < ARRAY_SIZE(pmbus_fan_registers); f+=
+) {
> > > > +			struct pmbus_sensor *sensor;
> > > > =C2=A0=C2=A0			int regval;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0			if (!(info->func[page] & pmbus_fan_flags[f]))
> > @@ -1949,13 +2011,25 @@ static int pmbus_add_fan_attributes(struct i2c_=
client *client,
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0(!(regval & (PB_FAN_1_INSTAL=
LED >> ((f & 1) * 4)))))
> > > > =C2=A0=C2=A0				continue;
> > =C2=A0=C2=A0
> > > > -			if (pmbus_add_sensor(data, "fan", "input", index,
> > > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0page, pmbus_fan_registers[f],
> > > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PSC_FAN, true, true) =3D=3D NUL=
L)
> > > > +			sensor =3D pmbus_add_sensor(data, "fan", "input", index,
> > > > +						=C2=A0=C2=A0page, pmbus_fan_registers[f],
> > > > +						=C2=A0=C2=A0PSC_FAN, true, true);
> > > > +			if (!sensor)
> > > > =C2=A0=C2=A0				return -ENOMEM;
> > =C2=A0=C2=A0
> > > > +			/* Add coeffs here as we have access to the fan mode */
> > > > +			if (info->format[PSC_FAN] =3D=3D direct &&
> > > > +					info->get_fan_coeffs) {
> > > > +				const u16 mask =3D PB_FAN_1_RPM >> ((f & 1) * 4);
> > +
> > > > +				mode =3D (regval & mask) ? rpm : percent;
> > > > +				coeffs =3D info->get_fan_coeffs(info, index, mode,
> > > > +							pmbus_fan_registers[f]);
> > > > +				sensor->coeffs =3D coeffs;
> > > > +			}
> > +
> > > > =C2=A0=C2=A0			ret =3D pmbus_add_fan_ctrl(client, data, index, page=
, f,
> > > > -						=C2=A0regval);
> > > > +						=C2=A0regval, coeffs);
> > > > =C2=A0=C2=A0			if (ret < 0)
> > > > =C2=A0=C2=A0				return ret;
> > =C2=A0=C2=A0
> >=20
>=20
>=20
--=-evf48LOTU5l1vGSkbQ6Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZZXlMAAoJEJ0dnzgO5LT5wpoQALf2jU2CnDvkiqj90fyTFCNn
5s0rdwoL3OeTl3jp9A2lBniMICxYAhlq47/rV0nrCosiDloZZOSFyVysYQ/WmQOR
43qsHjiXxBMfow5xAwnbEAbQTX4Su5aKnU+/AJvaUnGXsU6deptH3AbQPVAx+8fS
aPfF3WtbsLiZqwxIUH5SJ7hXWOa4NB3gbGxrBogXGrBUfkrWw05OC9Yxk445hC1Y
vSk4209kV77c7dm286HMcSIvOTCfZqC+uD5hmo4CqpDi7gCLNuJss7q21aaCDya4
uFfzU+B76gdyKMZ1g7gHyq3LDHPrda481HHP66WlG9InAmxVpJRPjkfMCWVtSAYj
Rp9uugnaFTH6xCZpcXUAftAnF4Jw11CRVNWNmQkpwXVd4elayko3Wr3ZeWrC9mSH
vgRorACcBbVberXtzmvOBJYK8zhApcsTOkAFEYB5PysmsQd0yLYjW2p3WbikNO5B
doi4RLJED5fLDUUDw5atb2tpxVM43jZfUZRmw2noVPNM3VpieQQbbZjHKoj397zp
hNJ5VnkwA5iV1Q9S7QIOgrEsWEPQ4nu1FESwbsGhmFF2GECYKPXtORg8O7pYy9hW
LJUcGlmneMLovlxn9CSB8BKo01qdNjmJPcJ+fTCgFZkWm5jLMeYFnvQZPVj2pL4h
ujR3A7oluBscYj4KhHCj
=etm+
-----END PGP SIGNATURE-----

--=-evf48LOTU5l1vGSkbQ6Z--
