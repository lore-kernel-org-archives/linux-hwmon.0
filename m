Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1504657417.28363.8.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Wed, 06 Sep 2017 10:23:37 +1000
In-Reply-To: <20170905170002.GG11478@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
	 <20170905170002.GG11478@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LOiTEbHXDgJsBfl24LQo"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-LOiTEbHXDgJsBfl24LQo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-05 at 10:00 -0700, Guenter Roeck wrote:
> On Tue, Sep 05, 2017 at 05:01:32PM +1000, Andrew Jeffery wrote:
> > Some functions exposed by pmbus core conflated errors that occurred whe=
n
> > setting the page to access with errors that occurred when accessing
> > registers in a page. In some cases, this caused legitimate errors to be
> > hidden under the guise of the register not being supported.
> >=20
>=20
> I'll have to look into this. If I recall correctly, the reason for not re=
turning
> errors from the "clear faults" command was that some early chips did not =
support
> it, or did not support it on all pages. Those chips would now always fail=
.

Yes, that is a concern.

However, shouldn't the lack of support for CLEAR_FAULTS be a described
property of the chip or page?

Regardless, the issue here is the PAGE command is sometimes failing
(more below). This means we won't have issued a CLEAR_FAULTS against
the page even if the page supports CLEAR_FAULTS. That to me is
something that should be propagated back up the call chain, as faults
that can be cleared will not have been.

>=20
> On a higher level, I am not sure if it is a good idea to return an error
> from a function intended to clear faults (and nothing else). That seems
> counterproductive.
>=20
> Is this a problem you have actually observed ?=20

Unfortunately yes. I was trying to reproduce some issues that we are
seeing in userspace but wasn't having much luck (getting -EIO on
reading a hwmon attribute). I ended up instrumenting our I2C bus
driver, and found that the problem was more prevalent than what the
read failures in userspace were indicating. The paths that were
triggering these unreported conditions all traced through the check
register and clear fault functions, which on analysis were swallowing
the error.

> If so, what is the chip ?

Well, the chip that I'm *communicating* with is the Maxim MAX31785
Intelligent Fan Controller. As to whether that's what is *causing* the
PAGE command to fail is still up in the air. I would not be surprised
if we have other issues in the hardware design.

I haven't sent a follow-up to the series introducing the MAX31785
driver because I've been chasing down communication issues. I felt it
was important to understand whether the device has quirks that need to
be worked around in the driver, or if our hardware design has bigger
problems that should be handled in other ways. I've been in touch with
Maxim who have asserted that some of the problems we're seeing cannot
be caused by their chip.

Andrew

>=20
> Thanks,
> Guenter
>=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/hwmon/pmbus-core=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A012 +=
+--
> > =C2=A0drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A0=C2=A06 +-
> > =C2=A0drivers/hwmon/pmbus/pmbus_core.c | 115 ++++++++++++++++++++++++++=
+++----------
> > =C2=A03 files changed, 95 insertions(+), 38 deletions(-)
> >=20
> > diff --git a/Documentation/hwmon/pmbus-core b/Documentation/hwmon/pmbus=
-core
> > index 8ed10e9ddfb5..3e9f41bb756f 100644
> > --- a/Documentation/hwmon/pmbus-core
> > +++ b/Documentation/hwmon/pmbus-core
> > @@ -218,17 +218,17 @@ Specifically, it provides the following informati=
on.
> > =C2=A0=C2=A0=C2=A0This function calls the device specific write_byte fu=
nction if defined.
> > =C2=A0=C2=A0=C2=A0Therefore, it must _not_ be called from that function=
.
> > =C2=A0
> > -=C2=A0=C2=A0bool pmbus_check_byte_register(struct i2c_client *client, =
int page, int reg);
> > +=C2=A0=C2=A0int pmbus_check_byte_register(struct i2c_client *client, i=
nt page, int reg);
> > =C2=A0
> > -=C2=A0=C2=A0Check if byte register exists. Return true if the register=
 exists, false
> > -=C2=A0=C2=A0otherwise.
> > +=C2=A0=C2=A0Check if byte register exists. Returns 1 if the register e=
xists, 0 if it does
> > +=C2=A0=C2=A0not, and less than zero on an unexpected error.
> > =C2=A0=C2=A0=C2=A0This function calls the device specific write_byte fu=
nction if defined to
> > =C2=A0=C2=A0=C2=A0obtain the chip status. Therefore, it must _not_ be c=
alled from that function.
> > =C2=A0
> > -=C2=A0=C2=A0bool pmbus_check_word_register(struct i2c_client *client, =
int page, int reg);
> > +=C2=A0=C2=A0int pmbus_check_word_register(struct i2c_client *client, i=
nt page, int reg);
> > =C2=A0
> > -=C2=A0=C2=A0Check if word register exists. Return true if the register=
 exists, false
> > -=C2=A0=C2=A0otherwise.
> > +=C2=A0=C2=A0Check if word register exists. Returns 1 if the register e=
xists, 0 if it does
> > +=C2=A0=C2=A0not, and less than zero on an unexpected error.
> > =C2=A0=C2=A0=C2=A0This function calls the device specific write_byte fu=
nction if defined to
> > =C2=A0=C2=A0=C2=A0obtain the chip status. Therefore, it must _not_ be c=
alled from that function.
> > =C2=A0
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index bfcb13bae34b..c53032a04a6f 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -413,9 +413,9 @@ int pmbus_write_byte_data(struct i2c_client *client=
, int page, u8 reg,
> > > > =C2=A0			=C2=A0=C2=A0u8 value);
> > =C2=A0int pmbus_update_byte_data(struct i2c_client *client, int page, u=
8 reg,
> > > > =C2=A0			=C2=A0=C2=A0=C2=A0u8 mask, u8 value);
> > -void pmbus_clear_faults(struct i2c_client *client);
> > -bool pmbus_check_byte_register(struct i2c_client *client, int page, in=
t reg);
> > -bool pmbus_check_word_register(struct i2c_client *client, int page, in=
t reg);
> > +int pmbus_clear_faults(struct i2c_client *client);
> > +int pmbus_check_byte_register(struct i2c_client *client, int page, int=
 reg);
> > +int pmbus_check_word_register(struct i2c_client *client, int page, int=
 reg);
> > =C2=A0int pmbus_do_probe(struct i2c_client *client, const struct i2c_de=
vice_id *id,
> > > > =C2=A0		=C2=A0=C2=A0=C2=A0struct pmbus_driver_info *info);
> > =C2=A0int pmbus_do_remove(struct i2c_client *client);
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index f1eff6b6c798..153700e35431 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -304,18 +304,24 @@ static int _pmbus_read_byte_data(struct i2c_clien=
t *client, int page, int reg)
> > > > =C2=A0	return pmbus_read_byte_data(client, page, reg);
> > =C2=A0}
> > =C2=A0
> > -static void pmbus_clear_fault_page(struct i2c_client *client, int page=
)
> > +static int pmbus_clear_fault_page(struct i2c_client *client, int page)
> > =C2=A0{
> > > > -	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> > > > +	return _pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> > =C2=A0}
> > =C2=A0
> > -void pmbus_clear_faults(struct i2c_client *client)
> > +int pmbus_clear_faults(struct i2c_client *client)
> > =C2=A0{
> > > > =C2=A0	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > > > +	int rv;
> > > > =C2=A0	int i;
> > =C2=A0
> > > > -	for (i =3D 0; i < data->info->pages; i++)
> > > > -		pmbus_clear_fault_page(client, i);
> > > > +	for (i =3D 0; i < data->info->pages; i++) {
> > > > +		rv =3D pmbus_clear_fault_page(client, i);
> > > > +		if (rv)
> > > > +			return rv;
> > > > +	}
> > +
> > > > +	return 0;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(pmbus_clear_faults);
> > =C2=A0
> > @@ -333,28 +339,45 @@ static int pmbus_check_status_cml(struct i2c_clie=
nt *client)
> > > > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static bool pmbus_check_register(struct i2c_client *client,
> > +static int pmbus_check_register(struct i2c_client *client,
> > > > =C2=A0				=C2=A0int (*func)(struct i2c_client *client,
> > > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int page, int reg),
> > > > =C2=A0				=C2=A0int page, int reg)
> > =C2=A0{
> > > > +	struct pmbus_data *data;
> > > > +	int check;
> > > > =C2=A0	int rv;
> > > > -	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > =C2=A0
> > > > -	rv =3D func(client, page, reg);
> > > > -	if (rv >=3D 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > > > -		rv =3D pmbus_check_status_cml(client);
> > > > -	pmbus_clear_fault_page(client, -1);
> > > > -	return rv >=3D 0;
> > > > +	data =3D i2c_get_clientdata(client);
> > +
> > > > +	/*
> > > > +	=C2=A0* pmbus_set_page() guards transactions on the requested pag=
e matching
> > > > +	=C2=A0* the current page. This may be done in the execution of fu=
nc(), but
> > > > +	=C2=A0* at that point a set-page error is conflated with accessin=
g a
> > > > +	=C2=A0* non-existent register.
> > > > +	=C2=A0*/
> > > > +	rv =3D pmbus_set_page(client, page);
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	check =3D func(client, page, reg);
> > > > +	if (check >=3D 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > > > +		check =3D pmbus_check_status_cml(client);
> > +
> > > > +	rv =3D pmbus_clear_fault_page(client, -1);
> > > > +	if (rv < 0)
> > > > +		return rv;
> > +
> > > > +	return check >=3D 0;
> > =C2=A0}
> > =C2=A0
> > -bool pmbus_check_byte_register(struct i2c_client *client, int page, in=
t reg)
> > +int pmbus_check_byte_register(struct i2c_client *client, int page, int=
 reg)
> > =C2=A0{
> > > > =C2=A0	return pmbus_check_register(client, _pmbus_read_byte_data, p=
age, reg);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
> > =C2=A0
> > -bool pmbus_check_word_register(struct i2c_client *client, int page, in=
t reg)
> > +int pmbus_check_word_register(struct i2c_client *client, int page, int=
 reg)
> > =C2=A0{
> > > > =C2=A0	return pmbus_check_register(client, _pmbus_read_word_data, p=
age, reg);
> > =C2=A0}
> > @@ -390,7 +413,7 @@ static struct pmbus_data *pmbus_update_device(struc=
t device *dev)
> > =C2=A0
> > > > =C2=A0	mutex_lock(&data->update_lock);
> > > > =C2=A0	if (time_after(jiffies, data->last_updated + HZ) || !data->v=
alid) {
> > > > -		int i, j;
> > > > +		int i, j, ret;
> > =C2=A0
> > > > =C2=A0		for (i =3D 0; i < info->pages; i++) {
> > > > =C2=A0			data->status[PB_STATUS_BASE + i]
> > @@ -424,7 +447,13 @@ static struct pmbus_data *pmbus_update_device(stru=
ct device *dev)
> > > > =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0sensor->page,
> > > > =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0sensor->reg);
> > > > =C2=A0		}
> > > > -		pmbus_clear_faults(client);
> > +
> > > > +		ret =3D pmbus_clear_faults(client);
> > > > +		if (ret < 0) {
> > > > +			mutex_unlock(&data->update_lock);
> > > > +			return ERR_PTR(ret);
> > > > +		}
> > +
> > > > =C2=A0		data->last_updated =3D jiffies;
> > > > =C2=A0		data->valid =3D 1;
> > > > =C2=A0	}
> > @@ -754,6 +783,9 @@ static ssize_t pmbus_show_boolean(struct device *de=
v,
> > > > =C2=A0	struct pmbus_data *data =3D pmbus_update_device(dev);
> > > > =C2=A0	int val;
> > =C2=A0
> > > > +	if (IS_ERR(data))
> > > > +		return PTR_ERR(data);
> > +
> > > > =C2=A0	val =3D pmbus_get_boolean(data, boolean, attr->index);
> > > > =C2=A0	if (val < 0)
> > > > =C2=A0		return val;
> > @@ -766,6 +798,9 @@ static ssize_t pmbus_show_sensor(struct device *dev=
,
> > > > =C2=A0	struct pmbus_data *data =3D pmbus_update_device(dev);
> > > > =C2=A0	struct pmbus_sensor *sensor =3D to_pmbus_sensor(devattr);
> > =C2=A0
> > > > +	if (IS_ERR(data))
> > > > +		return PTR_ERR(data);
> > +
> > > > =C2=A0	if (sensor->data < 0)
> > > > =C2=A0		return sensor->data;
> > =C2=A0
> > @@ -995,7 +1030,11 @@ static int pmbus_add_limit_attrs(struct i2c_clien=
t *client,
> > > > =C2=A0	struct pmbus_sensor *curr;
> > =C2=A0
> > > > =C2=A0	for (i =3D 0; i < nlimit; i++) {
> > > > -		if (pmbus_check_word_register(client, page, l->reg)) {
> > > > +		ret =3D pmbus_check_word_register(client, page, l->reg);
> > > > +		if (ret < 0)
> > > > +			return ret;
> > +
> > > > +		if (ret) {
> > > > =C2=A0			curr =3D pmbus_add_sensor(data, name, l->attr, index,
> > > > =C2=A0						page, l->reg, attr->class,
> > > > =C2=A0						attr->update || l->update,
> > @@ -1041,6 +1080,8 @@ static int pmbus_add_sensor_attrs_one(struct i2c_=
client *client,
> > > > =C2=A0	if (!base)
> > > > =C2=A0		return -ENOMEM;
> > > > =C2=A0	if (attr->sfunc) {
> > > > +		int check;
> > +
> > > > =C2=A0		ret =3D pmbus_add_limit_attrs(client, data, info, name,
> > > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0index, page, base, attr);
> > > > =C2=A0		if (ret < 0)
> > @@ -1050,9 +1091,13 @@ static int pmbus_add_sensor_attrs_one(struct i2c=
_client *client,
> > > > =C2=A0		=C2=A0* alarm attributes, if there is a global alarm bit, a=
nd if
> > > > =C2=A0		=C2=A0* the generic status register for this page is access=
ible.
> > > > =C2=A0		=C2=A0*/
> > > > -		if (!ret && attr->gbit &&
> > > > -		=C2=A0=C2=A0=C2=A0=C2=A0pmbus_check_byte_register(client, page,
> > > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->status_register)) {
> > +
> > > > +		check =3D pmbus_check_byte_register(client, page,
> > > > +						=C2=A0=C2=A0data->status_register);
> > > > +		if (check < 0)
> > > > +			return check;
> > +
> > > > +		if (!ret && attr->gbit && check) {
> > > > =C2=A0			ret =3D pmbus_add_boolean(data, name, "alarm", index,
> > > > =C2=A0						NULL, NULL,
> > > > =C2=A0						PB_STATUS_BASE + page,
> > @@ -1604,8 +1649,12 @@ static int pmbus_add_fan_attributes(struct i2c_c=
lient *client,
> > > > =C2=A0			if (!(info->func[page] & pmbus_fan_flags[f]))
> > > > =C2=A0				break;
> > =C2=A0
> > > > -			if (!pmbus_check_word_register(client, page,
> > > > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_fan_register=
s[f]))
> > > > +			ret =3D pmbus_check_word_register(client, page,
> > > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmbus_fan_register=
s[f]);
> > > > +			if (ret < 0)
> > > > +				return ret;
> > +
> > > > +			if (!ret)
> > > > =C2=A0				break;
> > =C2=A0
> > > > =C2=A0			/*
> > @@ -1628,9 +1677,13 @@ static int pmbus_add_fan_attributes(struct i2c_c=
lient *client,
> > > > =C2=A0			=C2=A0* Each fan status register covers multiple fans,
> > > > =C2=A0			=C2=A0* so we have to do some magic.
> > > > =C2=A0			=C2=A0*/
> > > > -			if ((info->func[page] & pmbus_fan_status_flags[f]) &&
> > > > -			=C2=A0=C2=A0=C2=A0=C2=A0pmbus_check_byte_register(client,
> > > > -					page, pmbus_fan_status_registers[f])) {
> > > > +			ret =3D=C2=A0=C2=A0pmbus_check_byte_register(client, page,
> > > > +						pmbus_fan_status_registers[f]);
> > > > +			if (ret < 0)
> > > > +				return ret;
> > +
> > > > +			if ((info->func[page] & pmbus_fan_status_flags[f])
> > > > +					&& ret) {
> > > > =C2=A0				int base;
> > =C2=A0
> > > > > > =C2=A0				if (f > 1)	/* fan 3, 4 */
> > @@ -1696,10 +1749,13 @@ static int pmbus_identify_common(struct i2c_cli=
ent *client,
> > > > =C2=A0				=C2=A0struct pmbus_data *data, int page)
> > =C2=A0{
> > > > =C2=A0	int vout_mode =3D -1;
> > > > +	int rv;
> > =C2=A0
> > > > -	if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
> > > > +	rv =3D pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE);
> > > > +	if (rv =3D=3D 1)
> > > > =C2=A0		vout_mode =3D _pmbus_read_byte_data(client, page,
> > > > =C2=A0						=C2=A0=C2=A0PMBUS_VOUT_MODE);
> > +
> > > > =C2=A0	if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
> > > > =C2=A0		/*
> > > > =C2=A0		=C2=A0* Not all chips support the VOUT_MODE command,
> > @@ -1725,8 +1781,7 @@ static int pmbus_identify_common(struct i2c_clien=
t *client,
> > > > =C2=A0		}
> > > > =C2=A0	}
> > =C2=A0
> > > > -	pmbus_clear_fault_page(client, page);
> > > > -	return 0;
> > > > +	return pmbus_clear_fault_page(client, page);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int pmbus_init_common(struct i2c_client *client, struct pm=
bus_data *data,
> > @@ -1756,7 +1811,9 @@ static int pmbus_init_common(struct i2c_client *c=
lient, struct pmbus_data *data,
> > > > =C2=A0	if (ret >=3D 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
> > > > =C2=A0		client->flags |=3D I2C_CLIENT_PEC;
> > =C2=A0
> > > > -	pmbus_clear_faults(client);
> > > > +	ret =3D pmbus_clear_faults(client);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > =C2=A0
> > > > =C2=A0	if (info->identify) {
> > > > =C2=A0		ret =3D (*info->identify)(client, info);
> > --=C2=A0
> > 2.11.0
> >=20
--=-LOiTEbHXDgJsBfl24LQo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZr0AJAAoJEJ0dnzgO5LT5TH4P/jEnxttRvURRQN5RjH1QQULX
NBpJJpj0S56LZhm5mlu5V/leKmg+s2xurXJ9GVuyoWawG+4w70+Sm8oq86MVgVrQ
cFw9vrPIsoFN3SpA3uTukklO0wL7CTmgyDlyM7SQ1cvWGyAjWe8k2tdwbrhFwYK3
O8cgSuWmTmVRO44RK3v3Y1WZ0mEHaG+Wj5mUwYEUnVClkkzGN+nPKeoaLgyvzZ2R
fJIAQUONRbzu3SbROJcXQRV4f1YFonD7RmGBR+5f8UzCMWnSL5k0zRS/vSsdmsxZ
wFgmG7uYCsmu2lz0PbPIxQQsVBtLd7Q5QkDODL7l14bK2YxaUwDie9gbkUbVKwqo
2myAujjXQ6I2LjfzmixvdXNjHS8n79kXJVUO1Mr9ht8v+KXTRpm8+6Vqc2ulCfL+
OCHBtz2JRn6ssRo//m6KXbovpf1fK3PP5lR7LyBPnBiHCTB0NNu5IzeEdTUZW44T
g3ue9KC9gLmavejiTQHpoxUpicJjnHSpd4IFxJAcqym3uHrfPFGftMxmDsA7cvxX
619FcbTnZVd2FhMsJxPBwIZtfm0Yn2VeYPADMURy9lwmEIsxMwqsG7qEfoHmacxX
Q9wU2LiELCtxOjtz8XM2WLzO4XNicyqG/6gTfnf2AGmvwDDIH51KXNfuj5ZoZaJN
3GGcR3OZHpXEgH4WqXk6
=DUhu
-----END PGP SIGNATURE-----

--=-LOiTEbHXDgJsBfl24LQo--
