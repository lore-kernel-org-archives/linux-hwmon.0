Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220931;
	b=j7Od55vju9/F58BM5XJmk9H2Z1dPwBzsavJE7wzSJMBBPlL2hit1tg41dA4wtd4Iczf7
	 ZMJkRZ/v76YV1dEczmvTFk/aiS3Da/I8XEVHt/bt5n6+QvEOwh15P7Fgy5CcXuoY0ooY4
	 qPZW5kiTzM+2QDlDiyUh0ORP7wmvwmn353AemEJGJ90W0Oje1vnhsfAhbXGHsH5zY+9Hu
	 J5Wu81TTZS5uCqTmiCENxyYKiKM9NtIZU7VWy2gwcV9gxyKHRhJxf27iQedS3ZKCW90xM
	 bcG0QHglpyUrkKeCqKFaQLyGTgTHevMyk2XpDraimKjN4oPJbAcI2TQtnRyFmA8w5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220931;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=FdH8AJNkIxpozixeWHSykH1RQi+1PXm0p22mGGMCe/Y=;
	b=K9qXy4EVwvUfrRgLEsjkCSRNdF0aed/kF3R8TfdREoTvkIY4O5MUQSIHQCcDLHTiEp/F
	 Us291nFoXmvWZwvhi1PJmUKSHAvLrNyg96fv2ml8MNZbrdJIXAUrum0wIvlMb0Z7eoabT
	 lM5HOccr6vEZJgUJby6oD/S7i2c+1fWbmUNmhKpODSfUqH3tySZc57LzYNVuRe2438g3P
	 x988A/pLw4oDvVAXZev08B2c4eZCPwKrXZMVIA9SrRKqf67nZgYDwHm7oZugAOpMwQ+kD
	 1kbojQhQQFs/GbMjPYy3TlAphkwj6JsR50ZoioVvYiJbF+nHPFOAGu9FcuAPWSaXWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=PfjTQtot;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4454B606A31A;
	Wed, 28 Oct 2026 20:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4454B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=PfjTQtot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793220916; x=1793825716; i=w_armin@gmx.de;
	bh=FdH8AJNkIxpozixeWHSykH1RQi+1PXm0p22mGGMCe/Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PfjTQtotJn2iuJqXTlS10qyFlYcw0yiAR9lJAAqFuybIWNeYtG+KBvTUjTiNMSpw
	 j67MVH/Oho2obyUDGWNXtgF96A8I+XLwOAeVyjtK4gJ++bIgjbX7AX1gOO51Zs8p0
	 vAKDY+rLVvdDgTP2WdlGwd6FREngxTICKF+DVY7TS2lc7w+/yvhQ8TiF1uYWwXvCC
	 +akFZnRfqiA67qYAu/voBrxQswnnAKv8X2HEe5HqmdISzMPRdD0VbI5bH3yxsOWno
	 pTwpQjasCNj5qQvSJWTUqkDJryhAouyudaewy65LexytxO9b6Me7j0ETpas9W5nbt
	 zgDJGsQLOYXqh0qwQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbp3-1xAr5b0nlr-00RyQz; Wed, 28
 Oct 2026 21:55:16 +0100
Message-ID: <700ef8a3-4fd1-4945-bcff-b514643057db@gmx.de>
Date: Wed, 28 Oct 2026 21:55:15 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
To: remy@demangeot.net, Eugene Shalygin <eugene.shalygin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Vl3eUB4AAaFLrG5u05f+Lw0neNSKKzRfjIsvn5q1LBS3RHbw0U
 1IxdyDtQSX60+HMuf7IQn6LO9X623ci94Y3CA75b2MIqNreE5yvLg3rj2W/8rSROue2Ed3a
 JzUDe7CzxZGiK7/NNCpCC6IAdBDJ/btd4eHbo3Bdo2fFGHKgVPdza9Z/RBnbKqJexkal516
 iYVAbX9N8ZGUV5dBIU/EA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7Y9fWPyXLOg=;CqL6HUmAnPm2rs36U4Le+p7hf8u
 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
 Nq23ziVnW9KMNk

Am 26.10.26 um 09:57 schrieb Remy Demangeot via B4 Relay:
> From: Remy Demangeot <remy@demangeot.net>
>=20
> The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> (command/status). It uses the standard EC protocol (0x80 read, 0x81
> write) and the same bank register (0xff). Its bank 1 holds the water
> temperatures: WATER_IN 0x0d, WATER_OUT 0x0b, WATER_IN2 0x13 and
> WATER_OUT2 0x11, as signed degrees Celsius with -60 for an absent
> probe. Water_In and Water_Out are at the same offsets as on the AMD
> 400-series boards.
>=20
> Describe registers of the second EC by setting ASUS_EC2_BANK_FLAG in
> the sensor bank. Banks are sorted, so such registers are read last;
> the second EC bank is saved and restored like the first one, under the
> same hardware access mutex. The I/O ports are only requested for
> boards using these sensors.
>=20
> Add Water_In 2 and Water_Out 2 sensors and enable the four water
> temperatures for the board. Readings match HWiNFO 8.54 on the same
> machine.

Just for curiosity: Is this second EC described inside the ACPI tables?

Thanks,
Armin Wolf

> Signed-off-by: Remy Demangeot <remy@demangeot.net>
> ---
>   drivers/hwmon/asus-ec-sensors.c | 145 ++++++++++++++++++++++++++++++++=
+++++---
>   1 file changed, 136 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sen=
sors.c
> index 11dd7f587530d640b6ccc9b7952dc9da47e11c19..c1969169de6531c11a4c3485=
eafd54af97874991 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -26,7 +26,10 @@
>   #include <linux/dev_printk.h>
>   #include <linux/dmi.h>
>   #include <linux/hwmon.h>
> +#include <linux/delay.h>
>   #include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
>   #include <linux/jiffies.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> @@ -45,6 +48,21 @@ static char *mutex_path_override;
>    * group of registers reports (e.g. one of the fans of the fan extensi=
on card).
>    */
>   #define ASUS_EC_SELECT_REGISTER	0x43
> +
> +/*
> + * Some boards have a second EC, not handled by the ACPI EC driver, at =
these
> + * I/O ports. It uses the standard EC protocol and the same bank regist=
er.
> + * Its registers are described by sensors whose bank is ASUS_EC2_BANK(n=
).
> + */
> +#define ASUS_EC2_DATA_PORT	0x68
> +#define ASUS_EC2_CMD_PORT	0x6c
> +#define ASUS_EC2_BANK_FLAG	0x80
> +#define ASUS_EC2_BANK(bank)	(ASUS_EC2_BANK_FLAG | (bank))
> +#define ASUS_EC2_STATUS_OBF	0x01
> +#define ASUS_EC2_STATUS_IBF	0x02
> +#define ASUS_EC2_CMD_READ	0x80
> +#define ASUS_EC2_CMD_WRITE	0x81
> +#define ASUS_EC2_TIMEOUT_US	20000
>   #define SENSOR_LABEL_LEN	16
>  =20
>   /*
> @@ -176,6 +194,10 @@ enum ec_sensors {
>   	ec_sensor_fan_ext_1,
>   	ec_sensor_fan_ext_2,
>   	ec_sensor_fan_ext_3,
> +	/* "Water_In 2" temperature sensor reading [=E2=84=83] */
> +	ec_sensor_temp_water_in_2,
> +	/* "Water_Out 2" temperature sensor reading [=E2=84=83] */
> +	ec_sensor_temp_water_out_2,
>   };
>  =20
>   #define SENSOR_TEMP_CHIPSET BIT(ec_sensor_temp_chipset)
> @@ -208,6 +230,8 @@ enum ec_sensors {
>   #define SENSOR_FAN_EXT_1 BIT(ec_sensor_fan_ext_1)
>   #define SENSOR_FAN_EXT_2 BIT(ec_sensor_fan_ext_2)
>   #define SENSOR_FAN_EXT_3 BIT(ec_sensor_fan_ext_3)
> +#define SENSOR_TEMP_WATER_IN_2 BIT(ec_sensor_temp_water_in_2)
> +#define SENSOR_TEMP_WATER_OUT_2 BIT(ec_sensor_temp_water_out_2)
>  =20
>   /*
>    * The values for temperature sensor readings without physical sensors=
 connected.
> @@ -221,7 +245,8 @@ static const s32 environment_temp_sensors =3D
>   	SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT |
>   	SENSOR_TEMP_WATER_BLOCK_IN | SENSOR_TEMP_WATER_BLOCK_OUT |
>   	SENSOR_TEMP_T_SENSOR_2 | SENSOR_TEMP_SENSOR_EXTRA_1 |
> -	SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3;
> +	SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3 |
> +	SENSOR_TEMP_WATER_IN_2 | SENSOR_TEMP_WATER_OUT_2;
>  =20
>   enum board_family {
>   	family_unknown,
> @@ -397,6 +422,14 @@ static const struct ec_sensor_info sensors_family_i=
ntel_200[] =3D {
>   		EC_SENSOR_SELECT("EXT_FAN2", hwmon_fan, 2, 0x00, 0x57, 0x0b),
>   	[ec_sensor_fan_ext_3] =3D
>   		EC_SENSOR_SELECT("EXT_FAN3", hwmon_fan, 2, 0x00, 0x57, 0x0c),
> +	[ec_sensor_temp_water_out] =3D
> +		EC_SENSOR("Water_Out", hwmon_temp, 1, ASUS_EC2_BANK(0x01), 0x0b),
> +	[ec_sensor_temp_water_in] =3D
> +		EC_SENSOR("Water_In", hwmon_temp, 1, ASUS_EC2_BANK(0x01), 0x0d),
> +	[ec_sensor_temp_water_out_2] =3D
> +		EC_SENSOR("Water_Out 2", hwmon_temp, 1, ASUS_EC2_BANK(0x01), 0x11),
> +	[ec_sensor_temp_water_in_2] =3D
> +		EC_SENSOR("Water_In 2", hwmon_temp, 1, ASUS_EC2_BANK(0x01), 0x13),
>   };
>  =20
>   static const struct ec_sensor_info sensors_family_intel_300[] =3D {
> @@ -561,7 +594,9 @@ static const struct ec_board_info board_info_maximus=
_ix_extreme =3D {
>   	.sensors =3D SENSOR_TEMP_CHIPSET | SENSOR_TEMP_T_SENSOR |
>   		SENSOR_TEMP_VRM | SENSOR_TEMP_SENSOR_EXTRA_1 |
>   		SENSOR_TEMP_SENSOR_EXTRA_2 | SENSOR_TEMP_SENSOR_EXTRA_3 |
> -		SENSOR_FAN_EXT_1 | SENSOR_FAN_EXT_2 | SENSOR_FAN_EXT_3,
> +		SENSOR_FAN_EXT_1 | SENSOR_FAN_EXT_2 | SENSOR_FAN_EXT_3 |
> +		SENSOR_SET_TEMP_WATER | SENSOR_TEMP_WATER_IN_2 |
> +		SENSOR_TEMP_WATER_OUT_2,
>   	.mutex_path =3D ASUS_HW_ACCESS_MUTEX_SB_PCI0_LPCB_SIO1_MUT0,
>   	.family =3D family_intel_200_series,
>   };
> @@ -1263,15 +1298,84 @@ static int setup_lock_data(struct device *dev)
>   	return 0;
>   }
>  =20
> +static int asus_ec2_wait(bool want_obf)
> +{
> +	unsigned int t;
> +	u8 status;
> +
> +	for (t =3D 0; t < ASUS_EC2_TIMEOUT_US; t +=3D 10) {
> +		status =3D inb(ASUS_EC2_CMD_PORT);
> +		if (want_obf ? (status & ASUS_EC2_STATUS_OBF) :
> +			       !(status & ASUS_EC2_STATUS_IBF))
> +			return 0;
> +		udelay(10);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int asus_ec2_read(u8 index, u8 *val)
> +{
> +	int status;
> +
> +	/* drop a stale byte left in the output buffer */
> +	if (inb(ASUS_EC2_CMD_PORT) & ASUS_EC2_STATUS_OBF)
> +		inb(ASUS_EC2_DATA_PORT);
> +	status =3D asus_ec2_wait(false);
> +	if (status)
> +		return status;
> +	outb(ASUS_EC2_CMD_READ, ASUS_EC2_CMD_PORT);
> +	status =3D asus_ec2_wait(false);
> +	if (status)
> +		return status;
> +	outb(index, ASUS_EC2_DATA_PORT);
> +	status =3D asus_ec2_wait(true);
> +	if (status)
> +		return status;
> +	*val =3D inb(ASUS_EC2_DATA_PORT);
> +	return 0;
> +}
> +
> +static int asus_ec2_write(u8 index, u8 val)
> +{
> +	int status;
> +
> +	status =3D asus_ec2_wait(false);
> +	if (status)
> +		return status;
> +	outb(ASUS_EC2_CMD_WRITE, ASUS_EC2_CMD_PORT);
> +	status =3D asus_ec2_wait(false);
> +	if (status)
> +		return status;
> +	outb(index, ASUS_EC2_DATA_PORT);
> +	status =3D asus_ec2_wait(false);
> +	if (status)
> +		return status;
> +	outb(val, ASUS_EC2_DATA_PORT);
> +	return asus_ec2_wait(false);
> +}
> +
> +/* @bank may carry ASUS_EC2_BANK_FLAG to address the second EC */
> +static int asus_ec_read_byte(u8 bank, u8 index, u8 *val)
> +{
> +	if (bank & ASUS_EC2_BANK_FLAG)
> +		return asus_ec2_read(index, val);
> +	return ec_read(index, val);
> +}
> +
>   static int asus_ec_bank_switch(u8 bank, u8 *old)
>   {
>   	int status =3D 0;
>  =20
>   	if (old) {
> -		status =3D ec_read(ASUS_EC_BANK_REGISTER, old);
> +		status =3D asus_ec_read_byte(bank, ASUS_EC_BANK_REGISTER, old);
> +		if (!status)
> +			*old |=3D bank & ASUS_EC2_BANK_FLAG;
>   	}
>   	if (status || (old && (*old =3D=3D bank)))
>   		return status;
> +	if (bank & ASUS_EC2_BANK_FLAG)
> +		return asus_ec2_write(ASUS_EC_BANK_REGISTER,
> +				      bank & ~ASUS_EC2_BANK_FLAG);
>   	return ec_write(ASUS_EC_BANK_REGISTER, bank);
>   }
>  =20
> @@ -1279,8 +1383,8 @@ static int asus_ec_block_read(const struct device =
*dev,
>   			      struct ec_sensors_data *ec)
>   {
>   	int ireg, ibank, status;
> -	u8 bank, reg_bank, prev_bank, select, prev_select;
> -	bool select_saved;
> +	u8 bank, reg_bank, prev_bank, prev_bank2, select, prev_select;
> +	bool select_saved, ec2_used =3D false;
>  =20
>   	bank =3D 0;
>   	status =3D asus_ec_bank_switch(bank, &prev_bank);
> @@ -1299,7 +1403,14 @@ static int asus_ec_block_read(const struct device=
 *dev,
>   	for (ibank =3D 0; ibank < ec->nr_banks; ibank++) {
>   		if (bank !=3D ec->banks[ibank]) {
>   			bank =3D ec->banks[ibank];
> -			if (asus_ec_bank_switch(bank, NULL)) {
> +			/* first bank of the second EC: save its bank too */
> +			if ((bank & ASUS_EC2_BANK_FLAG) && !ec2_used) {
> +				if (asus_ec_bank_switch(bank, &prev_bank2)) {
> +					dev_warn(dev, "second EC bank switch failed");
> +					break;
> +				}
> +				ec2_used =3D true;
> +			} else if (asus_ec_bank_switch(bank, NULL)) {
>   				dev_warn(dev, "EC bank switch to %d failed",
>   					 bank);
>   				break;
> @@ -1312,7 +1423,7 @@ static int asus_ec_block_read(const struct device =
*dev,
>   				continue;
>   			}
>   			select =3D register_select(ec->registers[ireg]);
> -			if (select) {
> +			if (select && !(bank & ASUS_EC2_BANK_FLAG)) {
>   				if (!select_saved) {
>   					if (ec_read(ASUS_EC_SELECT_REGISTER,
>   						    &prev_select))
> @@ -1322,8 +1433,9 @@ static int asus_ec_block_read(const struct device =
*dev,
>   				if (ec_write(ASUS_EC_SELECT_REGISTER, select))
>   					continue;
>   			}
> -			ec_read(register_index(ec->registers[ireg]),
> -				ec->read_buffer + ireg);
> +			asus_ec_read_byte(bank,
> +					  register_index(ec->registers[ireg]),
> +					  ec->read_buffer + ireg);
>   		}
>   		/* restore the selector while still in its bank */
>   		if (select_saved &&
> @@ -1331,6 +1443,9 @@ static int asus_ec_block_read(const struct device =
*dev,
>   			dev_warn(dev, "EC selector restore failed");
>   	}
>  =20
> +	if (ec2_used && asus_ec_bank_switch(prev_bank2, NULL))
> +		dev_warn(dev, "second EC bank restore failed");
> +
>   	status =3D asus_ec_bank_switch(prev_bank, NULL);
>   	return status;
>   }
> @@ -1612,6 +1727,18 @@ static int asus_ec_probe(struct platform_device *=
pdev)
>   	}
>  =20
>   	setup_sensor_data(ec_data);
> +
> +	/* banks are sorted: the second EC, if used, comes last */
> +	if (ec_data->nr_banks &&
> +	    (ec_data->banks[ec_data->nr_banks - 1] & ASUS_EC2_BANK_FLAG)) {
> +		if (!devm_request_region(dev, ASUS_EC2_DATA_PORT, 1,
> +					 dev_name(dev)) ||
> +		    !devm_request_region(dev, ASUS_EC2_CMD_PORT, 1,
> +					 dev_name(dev))) {
> +			dev_err(dev, "I/O ports of the second EC are busy");
> +			return -EBUSY;
> +		}
> +	}
>   	ec_data->registers =3D devm_kcalloc(dev, ec_data->nr_registers,
>   					  sizeof(*ec_data->registers), GFP_KERNEL);
>   	ec_data->read_buffer =3D devm_kcalloc(dev, ec_data->nr_registers,
>=20

