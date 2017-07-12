Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1499842869.4935.11.camel@aj.id.au>
Subject: Re: [RFC PATCH 2/4] pmbus: Add fan configuration support
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
	openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
	mspinler@linux.vnet.ibm.com
Date: Wed, 12 Jul 2017 16:31:09 +0930
In-Reply-To: <208cece7-ee95-c162-82aa-09f35a8d384f@roeck-us.net>
References: <20170710135618.13661-1-andrew@aj.id.au>
	 <20170710135618.13661-3-andrew@aj.id.au>
	 <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
	 <1499819983.4935.7.camel@aj.id.au>
	 <208cece7-ee95-c162-82aa-09f35a8d384f@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-I105A3pcYUQgtuYELEf8"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-I105A3pcYUQgtuYELEf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-11 at 20:43 -0700, Guenter Roeck wrote:
> On 07/11/2017 05:39 PM, Andrew Jeffery wrote:
> > On Tue, 2017-07-11 at 06:40 -0700, Guenter Roeck wrote:
> > > On 07/10/2017 06:56 AM, Andrew Jeffery wrote:
> > > > Augment PMBus support to include control of fans via the
> > > > FAN_COMMAND_[1-4] registers, both in RPM and PWM modes. The behavio=
ur
> > > > of FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4] are tightly coupled, =
and
> > > > their interactions do not fit the existing use of struct pmbus_sens=
or.
> > > > The patch introduces struct pmbus_fan_ctrl to distinguish from the
> > > > simple sensor case, along with associated sysfs show/set implementa=
tions.
> > > >=20
> > > > Further, the interpreting the value of FAN_COMMAND_[1-4] depends on=
 both
> > > > the current fan mode (RPM or PWM, as configured in
> > > > FAN_CONFIG_{1_2,3_4}), and the device-specific behaviour for the
> > > > register. For example, the MAX31785 chip defines the following:
> > > >=20
> > > > PWM (m =3D 1, b =3D 0, R =3D 2):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x0000 - 0x2710: 0 - 100% fan PWM duty cycle
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x2711 - 0x7fff: 100% fan PWM duty cycle
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x8000 - 0xffff: Ignore FAN_COMMAND_[1-4], use automatic fan control
> > > >=20
> > > > RPM (m =3D 1, b =3D 0, R =3D 0):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x0000 - 0x7FFF: 0 - 32,767 RPM
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x8000 - 0xFFFF: Ignore FAN_COMMAND_[1-4], use automatic fan control
> > > >=20
> > > > To handle the device-specific interpretation of the FAN_COMMAND_[1-=
4],
> > > > add an optional callbacks to the info struct to get/set the 'mode'
> > > > value required for the pwm[1-n]_enable sysfs attribute. A fallback
> > > > calculation exists if the callbacks are not populated; the fallback
> > > > ignores device-specific ranges and tries to determine a reasonable =
value
> > > > from FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4].
> > > >=20
> > >=20
> > > This seems overly complex, but unfortunately I don't have time for a =
detailed
> > > analysis right now.
> >=20
> > No worries. It turned out more complex than I was hoping as well, and I
> > =C2=A0 am keen to hear any insights to trim it down.
> >=20
> > > Couple of comments below.
> >=20
> > Yep, thanks for taking a look.
> >=20
> > >=20
> > > Guenter
> > >=20
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >=20
> > > > ---
> > > > =C2=A0=C2=A0=C2=A0drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 +
> > > > =C2=A0=C2=A0=C2=A0drivers/hwmon/pmbus/pmbus_core.c | 335 ++++++++++=
+++++++++++++++++++++++++++++
> > > > =C2=A0=C2=A0=C2=A02 files changed, 342 insertions(+)
> > > >=20
> > > > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbu=
s.h
> > > > index bfcb13bae34b..927eabc1b273 100644
> > > > --- a/drivers/hwmon/pmbus/pmbus.h
> > > > +++ b/drivers/hwmon/pmbus/pmbus.h
> > > > @@ -223,6 +223,8 @@ enum pmbus_regs {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0#define PB_FAN_1_RPM			BIT(6)
> > > > > > =C2=A0=C2=A0=C2=A0#define PB_FAN_1_INSTALLED		BIT(7)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0
> > > > +enum pmbus_fan_mode { percent =3D 0, rpm };
> > > > +
> > > > =C2=A0=C2=A0=C2=A0/*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0* STATUS_BYTE, STATUS_WORD (lower)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > @@ -380,6 +382,11 @@ struct pmbus_driver_info {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0	int (*identify)(struct i2c_clien=
t *client,
> > > > > > =C2=A0=C2=A0=C2=A0			struct pmbus_driver_info *info);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0
> > > > > > > > > > > > +	/* Allow the driver to interpret the fan command =
value */
> > > > > > > > > > > > +	int (*get_pwm_mode)(int id, u8 fan_config, u16 fa=
n_command);
> > > > > > > > > > > > +	int (*set_pwm_mode)(int id, long mode, u8 *fan_co=
nfig,
> > > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0u16 *fan_command);
> > > >=20
> > > > +
> > >=20
> > > It is not entirely obvious to me why this would require new callback =
functions.
> > > Can you overload PMBUS_FAN_CONFIG_12 / PMBUS_FAN_CONFIG_34 or, if tha=
t does not
> > > work for some reason, introduce a virtual register, such as PMBUS_VIR=
T_PWM_MODE ?
> >=20
> > Can you expand on the thought of overloading PMBUS_FAN_CONFIG_{12,34}?
> >=20
>=20
> Every register/command can be implemented in the front end driver in its =
read/write
> functions. For example, see max34440_read_byte_data(), which replaces som=
e of the
> status registers. ucd9000.c actually overrides PMBUS_FAN_CONFIG_12 and
> PMBUS_FAN_CONFIG_34.

Right; In the cover letter I mentioned I hadn't thought about how to
implement the dual tach feature of the MAX31785 at the time. After
sending the RFC series I had go at that as well, and ended up
implementing support purely in terms of the read/write callbacks with
no modifications to the core, so I've become familiar with them.

>=20
> > Regarding virtual registers, I saw references to them whilst I was
> > working my way through the core code but didn't stop to investigate.
> > I'll take a deeper look.
> >=20
>=20
> Virtual registers/commands are meant to "standardize" non-standard PMBus =
commands.
>=20
> For example, PMBus provides no means to read the average/minimum/maximum =
temperature.
> Modeling the respective attributes using PMBUS_VIRT_READ_TEMP_AVG, PMBUS_=
VIRT_READ_TEMP_MIN,
> and PMBUS_VIRT_READ_TEMP_MAX, and providing driver-specific read/write fu=
nctions
> which map the virtual commands to real chip registers makes the code much=
 simpler
> than per-attribute callbacks. With virtual commands, the core only needs =
entries such as
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}, {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.reg =3D PMBUS_VIRT_READ_TEMP_MIN,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.attr =3D "lowest",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}, {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.reg =3D PMBUS_VIRT_READ_TEMP_AVG,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.attr =3D "average",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}, {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.reg =3D PMBUS_VIRT_READ_TEMP_MAX,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.attr =3D "highest",
>=20
> to support such non-standard attributes. Imagine how that would look like
> if each of the supported virtual commands would be implemented as callbac=
k.

Indeed. Hence RFC in case I had overlooked something :) Clearly I have.

>=20
> > However, the addition of the callbacks was driven by the behaviour of
> > the MAX31785, where some values written to PMBUS_FAN_COMMAND_1 trigger
> > automated control, while others retain manual control. Patch 4/4 should
> > provide a bit more context, though I've also outlined the behaviour in
> > the commit message for this patch. I don't have a lot of experience
> > with PMBus devices so I don't have a good idea if there's a better way
> > to capture the behaviour that isn't so unconstrained in its approach.
> >=20
>=20
> Many pmbus commands have side effects. I don't see how an explicit callba=
ck
> would be different to overloading a standard register or to providing a v=
irtual
> register/command, whichever is more convenient.

I'm going to experiment with the virtual registers. From your
description above and looking at the comments in pmbus.h I think I can
make something work (and drop the callbacks).

>=20
> > >=20
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0	/* Regulator functionality, if s=
upported by this chip driver. */
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0	int num_regulators;
> > > > > > =C2=A0=C2=A0=C2=A0	const struct regulator_desc *reg_desc;
> > > >=20
> > > > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus=
/pmbus_core.c
> > > > index ba59eaef2e07..3b0a55bbbd2c 100644
> > > > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > > > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > > > @@ -69,6 +69,38 @@ struct pmbus_sensor {
> > > > =C2=A0=C2=A0=C2=A0#define to_pmbus_sensor(_attr) \
> > > > > > =C2=A0=C2=A0=C2=A0	container_of(_attr, struct pmbus_sensor, att=
ribute)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0
> > > > > > +#define PB_FAN_CONFIG_RPM		PB_FAN_2_RPM
> > > >=20
> > > > +#define PB_FAN_CONFIG_INSTALLED		PB_FAN_2_INSTALLEDBUS_VIRT_
> > >=20
> > > Something seems odd here. PB_FAN_2_INSTALLEDBUS_VIRT_ ?
> >=20
> > Yes, that's busted. Not sure what went wrong, but I'll clean it up.
> >=20
> > >=20
> > > > > > > > > > > > +#define PB_FAN_CONFIG_MASK(i)		(0xff << (4 * !((i)=
 & 1)))
> > > > > > > > > > > > +#define PB_FAN_CONFIG_GET(i, n)		(((n) >> (4 * !((=
i) & 1))) & 0xff)
> > > > > > +#define PB_FAN_CONFIG_PUT(i, n)		(((n) & 0xff) << (4 * !((i) &=
 1)))
> > > >=20
> > > > +
> > >=20
> > > Aren't there standard bit manipulation macros for that ? Either case,=
 this is just to avoid
> > > having to use the existing defines.
> >=20
> > As I store the configuration for each fan in a struct pmbus_fan_ctrl
> > dedicated to the fan, I reasoned that intermediate code should not have
>=20
> I rather wonder if pmbus_fan_ctrl is needed in the first place. The notio=
n of
> local 'struct pmbus_sensor' variables seems really messy. I think I'll re=
ally
> have to spend some time on this to see if and how it can be simplified;
> it just should not be that complex.

Sure. FWIW I plan on sending a follow-up RFC based on the feedback
you've given here, and I'll look to chop out pmbus_fan_ctrl. I was
suspicious of needing it as well, but was after your input on the
general approach and figured sending the patches was better than
guessing at your potential feedback.

If a follow-up isn't of interest and you'd definitely rather take on
the work up yourself, let me know.

Thanks again for taking a look.

Andrew

>=20
> Thanks,
> Guenter
>=20
> > to deal with the details of which nibble to access with respect to the
> > fan's (per-page) ID. Rather, code reading or writing
> > PMBUS_FAN_COMMAND_[1-4] should deal with ensuring the correct values
> > are provided.
> >=20
> > > Ok, but then I think it would make more sense to
> > > make it generic, ie change the core to not use PB_FAN_2_RPM / PB_FAN_=
1_RPM etc.
> > > but PB_FAN_RPM(index) everywhere.
> >=20
> > I'll make the change throughout pmbus core.
> >=20
> > >=20
> > > > +struct pmbus_fan_ctrl_attr {
> > > > > > > > > > > > +	struct device_attribute attribute;
> > > > > > +	char name[PMBUS_NAME_SIZE];
> > > >=20
> > > > +};
> > > > +
> > > > +struct pmbus_fan_ctrl {
> > > > > > > > > > > > +	struct pmbus_fan_ctrl_attr fan_target;
> > > > > > > > > > > > +	struct pmbus_fan_ctrl_attr pwm;
> > > > > > > > > > > > +	struct pmbus_fan_ctrl_attr pwm_enable;
> > > > > > > > > > > > +	int index;
> > > > > > > > > > > > +	u8 page;
> > > > > > > > > > > > +	u8 id;
> > > > > > > > > > > > +	u8 config;
> > > > > > +	u16 command;
> > > >=20
> > > > +};
> > > > +#define to_pmbus_fan_ctrl_attr(_attr) \
> > > > > > +	container_of(_attr, struct pmbus_fan_ctrl_attr, attribute)
> > > >=20
> > > > +#define fan_target_to_pmbus_fan_ctrl(_attr) \
> > > > > > > > > > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struc=
t pmbus_fan_ctrl, \
> > > > > > +			fan_target)
> > > >=20
> > > > +#define pwm_to_pmbus_fan_ctrl(_attr) \
> > > > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_=
ctrl, pwm)
> > > >=20
> > > > +#define pwm_enable_to_pmbus_fan_ctrl(_attr) \
> > > > > > > > > > > > +	container_of(to_pmbus_fan_ctrl_attr(_attr), struc=
t pmbus_fan_ctrl, \
> > > > > > +			pwm_enable)
> > > >=20
> > > > +
> > > > =C2=A0=C2=A0=C2=A0struct pmbus_boolean {
> > > > > > > > =C2=A0=C2=A0=C2=A0	char name[PMBUS_NAME_SIZE];	/* sysfs boo=
lean name */
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0	struct sensor_device_attribute attribute;
> > > >=20
> > > > @@ -806,6 +838,219 @@ static ssize_t pmbus_show_label(struct device=
 *dev,
> > > > > > =C2=A0=C2=A0=C2=A0	return snprintf(buf, PAGE_SIZE, "%s\n", labe=
l->label);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0}
> > > > =C2=A0=C2=A0=C2=A0
> > > > +static ssize_t pmbus_show_fan_command(struct device *dev,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pmbus=
_fan_mode mode,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl =
*fan, char *buf)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	struct i2c_client *client =3D to_i2c_client(dev->=
parent);
> > > > > > > > > > > > +	struct pmbus_data *data =3D i2c_get_clientdata(cl=
ient);
> > > > > > > > > > > > +	struct pmbus_sensor sensor;
> > > > > > +	long val;
> > > >=20
> > > > +
> > > > > > +	mutex_lock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if ((mode =3D=3D percent && (fan->config & PB_FAN=
_CONFIG_RPM)) ||
> > > > > > > > > > > > +			(mode =3D=3D rpm && !(fan->config & PB_FAN_CONF=
IG_RPM))) {
> > > > > > +		mutex_unlock(&data->update_lock);
> > > >=20
> > > > +		return -ENOTSUPP; /* XXX: This seems dodgy, but what to do? */
> > >=20
> > > Not create the attribute in question in the first place, or return 0.=
 The above
> > > messes up the 'sensors' command.
> >=20
> > I think returning 0 is the only valid option of the two, given that we
> > can dynamically switch between RPM and PWM modes.
> >=20
> > Thanks for the feedback.
> >=20
> > Andrew
> >=20
> > >=20
> > > > > > +	}
> > > >=20
> > > > +
> > > > > > > > > > > > +	sensor.class =3D PSC_FAN;
> > > > > > > > > > > > +	if (mode =3D=3D percent)
> > > > > > > > > > > > +		sensor.data =3D fan->command * 255 / 100;
> > > > > > > > > > > > +	else
> > > > > > +		sensor.data =3D fan->command;
> > > >=20
> > > > +
> > > > > > +	val =3D pmbus_reg2data(data, &sensor);
> > > >=20
> > > > +
> > > > > > +	mutex_unlock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > +	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_show_fan_target(struct device *dev,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da,=
 char *buf)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_show_fan_command(dev, rpm,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fan_target_to_pmbus_fa=
n_ctrl(da), buf);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_show_pwm(struct device *dev,
> > > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute=
 *da, char *buf)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_show_fan_command(dev, percent, pwm_t=
o_pmbus_fan_ctrl(da),
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_set_fan_command(struct device *dev,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum pmbus_fan_m=
ode mode,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan=
_ctrl *fan,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, ssize_t cou=
nt)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	struct i2c_client *client =3D to_i2c_client(dev->=
parent);
> > > > > > > > > > > > +	struct pmbus_data *data =3D i2c_get_clientdata(cl=
ient);
> > > > > > > > > > > > +	int config_addr, command_addr;
> > > > > > > > > > > > +	struct pmbus_sensor sensor;
> > > > > > > > > > > > +	ssize_t rv;
> > > > > > +	long val;
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (kstrtol(buf, 10, &val) < 0)
> > > > > > +		return -EINVAL;
> > > >=20
> > > > +
> > > > > > +	mutex_lock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > +	sensor.class =3D PSC_FAN;
> > > >=20
> > > > +
> > > > > > +	val =3D pmbus_data2reg(data, &sensor, val);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (mode =3D=3D percent)
> > > > > > +		val =3D val * 100 / 255;
> > > >=20
> > > > +
> > > > > > > > > > > > +	config_addr =3D (fan->id < 2) ? PMBUS_FAN_CONFIG_=
12 : PMBUS_FAN_CONFIG_34;
> > > > > > +	command_addr =3D config_addr + 1 + (fan->id & 1);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (mode =3D=3D rpm)
> > > > > > > > > > > > +		fan->config |=3D PB_FAN_CONFIG_RPM;
> > > > > > > > > > > > +	else
> > > > > > +		fan->config &=3D ~PB_FAN_CONFIG_RPM;
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D pmbus_update_byte_data(client, fan->page, =
config_addr,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_PUT(fan-=
>id, fan->config),
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_MASK(fan=
->id));
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		goto done;
> > > >=20
> > > > +
> > > > > > > > > > > > +	fan->command =3D val;
> > > > > > > > > > > > +	rv =3D pmbus_write_word_data(client, fan->page, c=
ommand_addr,
> > > > > > +				=C2=A0=C2=A0=C2=A0fan->command);
> > > >=20
> > > > +
> > > > +done:
> > > > > > +	mutex_unlock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		return rv;
> > > >=20
> > > > +
> > > > > > +	return count;
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_set_fan_target(struct device *dev,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribut=
e *da,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_set_fan_command(dev, rpm,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fan_target_to_pm=
bus_fan_ctrl(da), buf,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0count);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_set_pwm(struct device *dev, struct device_att=
ribute *da,
> > > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count=
)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_set_fan_command(dev, percent, pwm_to=
_pmbus_fan_ctrl(da),
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buf, count);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_show_pwm_enable(struct device *dev,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *da,=
 char *buf)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	struct pmbus_fan_ctrl *fan =3D pwm_enable_to_pmbu=
s_fan_ctrl(da);
> > > > > > > > > > > > +	struct i2c_client *client =3D to_i2c_client(dev->=
parent);
> > > > > > > > > > > > +	struct pmbus_data *data =3D i2c_get_clientdata(cl=
ient);
> > > > > > +	long mode;
> > > >=20
> > > > +
> > > > > > +	mutex_lock(&data->update_lock);
> > > >=20
> > > > +
> > > > +
> > > > > > > > > > > > +	if (data->info->get_pwm_mode) {
> > > > > > +		u8 config =3D PB_FAN_CONFIG_PUT(fan->id, fan->config);
> > > >=20
> > > > +
> > > > > > > > > > > > +		mode =3D data->info->get_pwm_mode(fan->id, confi=
g, fan->command);
> > > > > > > > > > > > +	} else {
> > > > > > > > > > > > +		struct pmbus_sensor sensor =3D {
> > > > > > > > > > > > +			.class =3D PSC_FAN,
> > > > > > > > > > > > +			.data =3D fan->command,
> > > > > > > > > > > > +		};
> > > > > > +		long command;
> > > >=20
> > > > +
> > > > > > +		command =3D pmbus_reg2data(data, &sensor);
> > > >=20
> > > > +
> > > > > > > > > > > > +		/* XXX: Need to do something sensible */
> > > > > > > > > > > > +		if (fan->config & PB_FAN_CONFIG_RPM)
> > > > > > > > > > > > +			mode =3D 2;
> > > > > > > > > > > > +		else
> > > > > > > > > > > > +			mode =3D (command >=3D 0 && command < 100);
> > > > > > +	}
> > > >=20
> > > > +
> > > > > > +	mutex_unlock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > +	return snprintf(buf, PAGE_SIZE, "%ld\n", mode);
> > > >=20
> > > > +}
> > > > +
> > > > +static ssize_t pmbus_set_pwm_enable(struct device *dev,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribut=
e *da,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	struct pmbus_fan_ctrl *fan =3D pwm_enable_to_pmbu=
s_fan_ctrl(da);
> > > > > > > > > > > > +	struct i2c_client *client =3D to_i2c_client(dev->=
parent);
> > > > > > > > > > > > +	struct pmbus_data *data =3D i2c_get_clientdata(cl=
ient);
> > > > > > > > > > > > +	int config_addr, command_addr;
> > > > > > > > > > > > +	struct pmbus_sensor sensor;
> > > > > > > > > > > > +	ssize_t rv =3D count;
> > > > > > +	long mode;
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (kstrtol(buf, 10, &mode) < 0)
> > > > > > +		return -EINVAL;
> > > >=20
> > > > +
> > > > > > +	mutex_lock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > +	sensor.class =3D PSC_FAN;
> > > >=20
> > > > +
> > > > > > > > > > > > +	config_addr =3D (fan->id < 2) ? PMBUS_FAN_CONFIG_=
12 : PMBUS_FAN_CONFIG_34;
> > > > > > +	command_addr =3D config_addr + 1 + (fan->id & 1);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (data->info->set_pwm_mode) {
> > > > > > > > > > > > +		u8 config =3D PB_FAN_CONFIG_PUT(fan->id, fan->co=
nfig);
> > > > > > +		u16 command =3D fan->command;
> > > >=20
> > > > +
> > > > > > > > > > > > +		rv =3D data->info->set_pwm_mode(fan->id, mode, &=
config, &command);
> > > > > > > > > > > > +		if (rv < 0)
> > > > > > +			goto done;
> > > >=20
> > > > +
> > > > > > > > > > > > +		fan->config =3D PB_FAN_CONFIG_GET(fan->id, confi=
g);
> > > > > > > > > > > > +		fan->command =3D command;
> > > > > > > > > > > > +	} else {
> > > > > > > > > > > > +		fan->config &=3D ~PB_FAN_CONFIG_RPM;
> > > > > > > > > > > > +		switch (mode) {
> > > > > > > > > > > > +		case 0:
> > > > > > > > > > > > +		case 1:
> > > > > > > > > > > > +			/* XXX: Safe at least? */
> > > > > > > > > > > > +			fan->command =3D pmbus_data2reg(data, &sensor, =
100);
> > > > > > > > > > > > +			break;
> > > > > > > > > > > > +		case 2:
> > > > > > > > > > > > +		default:
> > > > > > > > > > > > +			/* XXX: Safe at least? */
> > > > > > > > > > > > +			fan->command =3D 0xffff;
> > > > > > > > > > > > +			break;
> > > > > > > > > > > > +		}
> > > > > > +	}
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D pmbus_update_byte_data(client, fan->page, =
config_addr,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_PUT(fan-=
>id, fan->config),
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PB_FAN_CONFIG_MASK(fan=
->id));
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		goto done;
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D pmbus_write_word_data(client, fan->page, c=
ommand_addr,
> > > > > > +				=C2=A0=C2=A0=C2=A0fan->command);
> > > >=20
> > > > +
> > > > +done:
> > > > > > +	mutex_unlock(&data->update_lock);
> > > >=20
> > > > +
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		return rv;
> > > >=20
> > > > +
> > > > > > +	return count;
> > > >=20
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0=C2=A0static int pmbus_add_attribute(struct pmbus_data =
*data, struct attribute *attr)
> > > > =C2=A0=C2=A0=C2=A0{
> > > > > > =C2=A0=C2=A0=C2=A0	if (data->num_attributes >=3D data->max_attr=
ibutes - 1) {
> > > >=20
> > > > @@ -1094,6 +1339,51 @@ static int pmbus_add_sensor_attrs(struct i2c=
_client *client,
> > > > > > =C2=A0=C2=A0=C2=A0	return 0;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0}
> > > > =C2=A0=C2=A0=C2=A0
> > > > +static int pmbus_add_fan_ctrl_attr(struct pmbus_data *data,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl_attr *=
fa,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0const char *name_fmt,
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0ssize_t (*show)(struct devic=
e *dev,
> > > > > > > > > > > > +					=C2=A0=C2=A0=C2=A0struct device_attribute *at=
tr,
> > > > > > > > > > > > +					=C2=A0=C2=A0=C2=A0char *buf),
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0ssize_t (*store)(struct devi=
ce *dev,
> > > > > > > > > > > > +					=C2=A0=C2=A0=C2=A0struct device_attribute *at=
tr,
> > > > > > > > > > > > +					=C2=A0=C2=A0=C2=A0const char *buf, size_t cou=
nt),
> > > > > > +				=C2=A0=C2=A0=C2=A0int idx)
> > > >=20
> > > > +{
> > > > > > +	struct device_attribute *da;
> > > >=20
> > > > +
> > > > > > +	da =3D &fa->attribute;
> > > >=20
> > > > +
> > > > > > > > > > > > +	snprintf(fa->name, sizeof(fa->name), name_fmt, id=
x);
> > > > > > +	pmbus_dev_attr_init(da, fa->name, 0644, show, store);
> > > >=20
> > > > +
> > > > > > +	return pmbus_add_attribute(data, &da->attr);
> > > >=20
> > > > +}
> > > > +
> > > > +static inline int pmbus_add_fan_target_attr(struct pmbus_data *dat=
a,
> > > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->fan_ta=
rget, "fan%d_target",
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbu=
s_show_fan_target,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_fan_ta=
rget, fan->index);
> > > >=20
> > > > +}
> > > > +
> > > > +static inline int pmbus_add_pwm_attr(struct pmbus_data *data,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > > >=20
> > > > +{
> > > > +
> > > > > > > > > > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm, "=
pwm%d", pmbus_show_pwm,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_pwm, f=
an->index);
> > > >=20
> > > > +}
> > > > +
> > > > +static inline int pmbus_add_pwm_enable_attr(struct pmbus_data *dat=
a,
> > > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_fan_ctrl *fan)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	return pmbus_add_fan_ctrl_attr(data, &fan->pwm_en=
able, "pwm%d_enable",
> > > > > > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbu=
s_show_pwm_enable,
> > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_set_pwm_en=
able, fan->index);
> > > >=20
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0=C2=A0static const struct pmbus_limit_attr vin_limit_at=
trs[] =3D {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0	{
> > > > > > =C2=A0=C2=A0=C2=A0		.reg =3D PMBUS_VIN_UV_WARN_LIMIT,
> > > >=20
> > > > @@ -1565,6 +1855,13 @@ static const int pmbus_fan_config_registers[=
] =3D {
> > > > > > =C2=A0=C2=A0=C2=A0	PMBUS_FAN_CONFIG_34
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0};
> > > > =C2=A0=C2=A0=C2=A0
> > > > +static const int pmbus_fan_command_registers[] =3D {
> > > > > > > > > > > > +	PMBUS_FAN_COMMAND_1,
> > > > > > > > > > > > +	PMBUS_FAN_COMMAND_2,
> > > > > > > > > > > > +	PMBUS_FAN_COMMAND_3,
> > > > > > +	PMBUS_FAN_COMMAND_4,
> > > >=20
> > > > +};
> > > > +
> > > > =C2=A0=C2=A0=C2=A0static const int pmbus_fan_status_registers[] =3D=
 {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0	PMBUS_STATUS_FAN_12,
> > > > > > =C2=A0=C2=A0=C2=A0	PMBUS_STATUS_FAN_12,
> > > >=20
> > > > @@ -1587,6 +1884,39 @@ static const u32 pmbus_fan_status_flags[] =
=3D {
> > > > =C2=A0=C2=A0=C2=A0};
> > > > =C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0/* Fans */
> > > > +static int pmbus_add_fan_ctrl(struct i2c_client *client,
> > > > > > > > > > > > +		struct pmbus_data *data, int index, int page, in=
t id,
> > > > > > +		u8 config)
> > > >=20
> > > > +{
> > > > > > > > > > > > +	struct pmbus_fan_ctrl *fan;
> > > > > > +	int rv;
> > > >=20
> > > > +
> > > > > > > > > > > > +	fan =3D devm_kzalloc(data->dev, sizeof(*fan), GFP=
_KERNEL);
> > > > > > > > > > > > +	if (!fan)
> > > > > > +		return -ENOMEM;
> > > >=20
> > > > +
> > > > > > > > > > > > +	fan->index =3D index;
> > > > > > > > > > > > +	fan->page =3D page;
> > > > > > > > > > > > +	fan->id =3D id;
> > > > > > +	fan->config =3D config;
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D _pmbus_read_word_data(client, page,
> > > > > > > > > > > > +			pmbus_fan_command_registers[id]);
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > > > > > > > +		return rv;
> > > > > > +	fan->command =3D rv;
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D pmbus_add_fan_target_attr(data, fan);
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		return rv;
> > > >=20
> > > > +
> > > > > > > > > > > > +	rv =3D pmbus_add_pwm_attr(data, fan);
> > > > > > > > > > > > +	if (rv < 0)
> > > > > > +		return rv;
> > > >=20
> > > > +
> > > > > > +	return pmbus_add_pwm_enable_attr(data, fan);
> > > >=20
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0=C2=A0static int pmbus_add_fan_attributes(struct i2c_cl=
ient *client,
> > > > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0struct pmbus_data=
 *data)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0{
> > > > @@ -1624,6 +1954,11 @@ static int pmbus_add_fan_attributes(struct i=
2c_client *client,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0PSC_FAN, true, true) =3D=3D NULL)
> > > > > > =C2=A0=C2=A0=C2=A0				return -ENOMEM;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0
> > > > > > > > > > > > +			ret =3D pmbus_add_fan_ctrl(client, data, index,=
 page, f,
> > > > > > > > > > > > +						=C2=A0regval);
> > > > > > > > > > > > +			if (ret < 0)
> > > > > > +				return ret;
> > > >=20
> > > > +
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0			/*
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0			=C2=A0* Each fan status regist=
er covers multiple fans,
> > > > > > =C2=A0=C2=A0=C2=A0			=C2=A0* so we have to do some magic.
>=20
>=20
--=-I105A3pcYUQgtuYELEf8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZZck1AAoJEJ0dnzgO5LT5nMwP/izMHJQ9XxwJYatFlm2t45yN
bpERvlfeBqviLhNfegqJfXY8ux+z5mBpQmLKWVlS5TUm/0cT7MIK+92Z8VSa54Fv
py/BpNbb57QxuTD+FtDVbLt0w/fvd4AK7NuVF3RQWLtBlGIVRVVw6zr1re4i87MX
UCCyqQ7LpxhvQNBm+zCv8BmVEi/SrXdWWgpXyI/nupN3OfzEisO5Wusm0lZmYxV9
Wc2XdXzje47vL5NlXzUURoF7RuI+rggkkTVfEZqkKSY27N1DUCkouVgE41TfI2Dh
iS8T8F3J1X1cruYD1ZN6LwKzXjdNJ8ph9JBkuUV4ggtu0JQgtsnq0kw5T4x3yMfx
5yF2Kb9Jg/BCpVbQiKr3NMUhJJHfpRQC89OIgt0kr9YGPwTgwVk6tnsQS13nBz3/
80MnaN5VuvmMEwAnS3+RUTfx/3DxiMiKy7lhoWHTlaVxBU0fpDakOQJxsxN66S35
stcUXs0kDFHdMgwcmuNctViUfqLm+BRYiFbXlLO/yE7KPfYOGx/vb0DBkIvINxyT
69F1LF4jrM3MRQ0Zth21niIo85YsLQQ/gTbIwnAofqQ2wkM+O5PcNHT0AXN/4X88
uZUdmiH7y9p1uyQEEsaELLFbaytoB3VuAyUVp/ZoZeBF2Jd5KKRDZXEgiky0TzMR
YMFQPQD9lPjUEZoDnxgn
=pTg7
-----END PGP SIGNATURE-----

--=-I105A3pcYUQgtuYELEf8--
