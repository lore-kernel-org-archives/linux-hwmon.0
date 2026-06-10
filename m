Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DCC3446C4
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079749; cv=none; b=d/EwB2Jmd9Osi/Qm7nA3T7S1ZNPw5ZTnO5xaeUeiAz63qFp9GqzJDhD2h0/PeP1zxiUvqIaDIXqKBws/7JRP4mJWWdQgxfXeknBGBnSdR4PxnEGtv4CMR9Gb6Oo3lbpWlBqQ9HD67W+FZl2QhH4b8F1xv/XTYE0NgJnHJ/ka/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079749; c=relaxed/simple;
	bh=vvXwFej9lj1lAXWCrG5lZjXXoPyaHSlpldTcl2itE9A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpWhRZrjwr1rluIu0rxFBcQkGf2VVgABcJTniQiMXdkaw2A0MZznRuQFrINuoTW/JPoJ1S0Dqp6gMAEMObYZuN/HPqEHpdA30fmmoHUWS2TZXHCLGxCWGXr4zIHexvxAhe5SpWSXSR58CswnmnC3Qw7MiDOX1TvuTuvMRg7ZAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aipd9aq/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aipd9aq/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so71705525e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781079747; x=1781684547; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XxoZFC5RwuU1AtzTTwLIZclxEbkhraC7dqE6/SFyZN8=;
        b=aipd9aq/H7OWGOBhXhCu+dbd5jMq03pRY4SJnPMdt85vnVmIrSzgoaVoubUceYZG7H
         tZ6qUW9PC7V0ML05yCYY12ZcuDKHQ46qfFVD7b54I5cssyYnscprStZL/4R+woQckgfx
         r1szP2qn/edEnXacEImkz5uD8kDkxs1mQBQ53n7Uw4twYRpBh/Sij1y7gcI3r1f3N6xX
         6C8H2a+Z1XEaRYUq54J10esIwc3U2Du4s7vzqLn7BqTurYzXOeKb+Qs1ARu1Gb5prE+B
         wXkzeXJGpZxDHunzvHB/GbZQr81Mf3bt77EpKoGKxFVIogMRPgAMPgDSWhHzz8Q/bXuN
         x3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079747; x=1781684547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxoZFC5RwuU1AtzTTwLIZclxEbkhraC7dqE6/SFyZN8=;
        b=jsNZFG8OWVc5nhB0hBvrvnuoqukeinJybOU3NSairlSxKKKkaR17zO4hLYuskOKQ92
         nE4B0N/7ZZyb3sYXCqId7xZniW1Wd7af4ThkFoz/QEa2rQK1CW/mPmSwWvTgiYcYzotB
         4OcNvtvShjoEjDWmX21jLyd95jhEfjhaVChNGgygimRCEX9FWFSG/p5/hNiPadopxQgS
         d0ZJuyJW9yboJkAn+aaZmxKvkN895mk3U05kRoLxAxkXxTzzdrV7EIlI1E2Tr25urmOG
         kkdhCXgJzpkSKB5QRCPTFdEDXPE4/iPsFuGadJnB7NaQglazRh34SAKEMZPdFNs0gkx7
         ZXKA==
X-Gm-Message-State: AOJu0Yz70M6jRPzfMAAeB9g094CK3PiikrJ8oiIMq7FuXgyMGXlkhlh8
	qzHjaKn6g/16K5j8HxN1vogwHKJ2nJbvqyfkGDsK4C9XOuoGi1lKViHk
X-Gm-Gg: Acq92OEZv9tqXD5QGmBXfpZvPbyeIn1pMvC6nnYyNfJ5RiRbeZzeEwrO9spZPX7hSYM
	+8wxIflTK0VNfI3cJ8LVHRjW7y3/8P+DzUNvI11lbMnY7NBi1lhJv8gpPBII0Om6v0Lu1lqeBaM
	bYn9shV4OSfg7QL5zHsPQo86Mlzetuj1ob4Uk+KGox7h7PdJd+3UYQJKe1qnh4vGloB1B165nLc
	0O1dWHjGneLfCCd+3fiWeEkHkkNqIbBKeGFhjBmn7l8PwwYKKKn3EOZdy/oe5ASDHLeWbWnsGZW
	wCe9WCAzhYBQxz+4vpD03jMka0JgFlfLBW8WrySQsZh2khpfYKbjCUy52eGNaCSlN9L2j064iNB
	+jcN3Z+1zT4476rKJT7qkGFuedOpkCTHbAEy73v6OlSJgm66plEmfD6llhAw1gDIe+ju7vf1arL
	tHW8NrsC7ieU7hDrDMB2GW9v7Ja7zGBRij7OddEtp+ULjY8KdEOUppo5NFodh8cW7oMWGRzfLZ3
	TdVQ/F9aWVVx8QA+CuZ8Vo=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr412096945e9.21.1781079746405;
        Wed, 10 Jun 2026 01:22:26 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dca8fcfbsm31123815e9.1.2026.06.10.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:22:26 -0700 (PDT)
Message-ID: <22d2d0733485cb904eb3f53c9bb891d64435def7.camel@gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, Guenter Roeck
	 <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 09:23:32 +0100
In-Reply-To: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
References: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-10 at 09:12 +0800, Alexis Czezar Torreno wrote:
> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2500W. Uses PMBus.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with continuou=
s
> power level of 2500W. Uses PMBus.
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0Documentation/hwmon/max34440.rst | 27 ++++++++++++++++--------
> =C2=A0drivers/hwmon/pmbus/max34440.c=C2=A0=C2=A0 | 45 +++++++++++++++++++=
++++++++++++++++++---
> =C2=A02 files changed, 60 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34=
440.rst
> index
> d6d4fbc863d96c1008a1971d3e3245d9ce1ef688..e7421f4dbf38fc1436bbaeba71d4461=
a00f8cefb
> 100644
> --- a/Documentation/hwmon/max34440.rst
> +++ b/Documentation/hwmon/max34440.rst
> @@ -19,6 +19,14 @@ Supported chips:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 Datasheet: -
> =C2=A0
> +=C2=A0 * ADI ADPM12250
> +
> +=C2=A0=C2=A0=C2=A0 Prefixes: 'adpm12250'
> +
> +=C2=A0=C2=A0=C2=A0 Addresses scanned: -
> +
> +=C2=A0=C2=A0=C2=A0 Datasheet: -
> +
> =C2=A0=C2=A0 * Maxim MAX34440
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 Prefixes: 'max34440'
> @@ -87,11 +95,11 @@ This driver supports multiple devices: hardware monit=
oring for
> Maxim MAX34440
> =C2=A0PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Powe=
r-Supply
> =C2=A0Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Su=
pply Data
> =C2=A0Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34460=
, and
> -MAX34461; PMBus DC/DC Power Module ADPM12160, and ADPM12200. The MAX3445=
1
> -supports monitoring voltage or current of 12 channels based on GIN pins.=
 The
> -MAX34460 supports 12 voltage channels, and the MAX34461 supports 16 volt=
age
> -channels. The ADPM12160, and ADPM12200 also monitors both input and outp=
ut
> -of voltage and current.
> +MAX34461; PMBus DC/DC Power Module ADPM12160, ADPM12200, and ADPM12250. =
The
> +MAX34451 supports monitoring voltage or current of 12 channels based on =
GIN
> +pins. The MAX34460 supports 12 voltage channels, and the MAX34461 suppor=
ts 16
> +voltage channels. The ADPM12160, ADPM12200, and ADPM12250 also monitors =
both
> +input and output of voltage and current.
> =C2=A0
> =C2=A0The driver is a client driver to the core PMBus driver. Please see
> =C2=A0Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> @@ -149,7 +157,7 @@ in[1-6]_reset_history	Write any value to reset histor=
y.
> =C2=A0.. note::
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 - MAX34446 only supports in[1-4].
> -=C2=A0=C2=A0=C2=A0 - ADPM12160, and ADPM12200 only supports in[1-2]. Lab=
el is "vin1"
> +=C2=A0=C2=A0=C2=A0 - ADPM12160, ADPM12200, and ADPM12250 only supports i=
n[1-2]. Label is "vin1"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and "vout1" respectively.
> =C2=A0
> =C2=A0Curr
> @@ -172,8 +180,9 @@ curr[1-6]_reset_history	Write any value to reset hist=
ory.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 - in6 and curr6 attributes only exist for MAX344=
40.
> =C2=A0=C2=A0=C2=A0=C2=A0 - MAX34446 only supports curr[1-4].
> -=C2=A0=C2=A0=C2=A0 - For ADPM12160, and ADPM12200, curr[1] is "iin1" and=
 curr[2-6]
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are "iout[1-5]".
> +=C2=A0=C2=A0=C2=A0 - For ADPM12160, ADPM12200, and ADPM12250, curr[1] is=
 "iin1"
> +=C2=A0=C2=A0=C2=A0 - For ADPM12160, and ADPM12200 curr[2-6] are "iout[1-=
5]".
> +=C2=A0=C2=A0=C2=A0 - For ADPM12250, curr[2-4] are "iout[1-3]".
> =C2=A0
> =C2=A0Power
> =C2=A0~~~~~
> @@ -209,7 +218,7 @@ temp[1-8]_reset_history	Write any value to reset hist=
ory.
> =C2=A0.. note::
> =C2=A0=C2=A0=C2=A0 - temp7 and temp8 attributes only exist for MAX34440.
> =C2=A0=C2=A0=C2=A0 - MAX34446 only supports temp[1-3].
> -=C2=A0=C2=A0 - ADPM12160, and ADPM12200 only supports temp[1].
> +=C2=A0=C2=A0 - ADPM12160, ADPM12200, and ADPM12250 only supports temp[1]=
.
> =C2=A0
> =C2=A0
> =C2=A0.. note::
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max3444=
0.c
> index
> 4525b9fc56267479534251a1444aa09181615ac6..74876d2207fbe4014b8b54a9fd96823=
70fc3bbed
> 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -18,6 +18,7 @@
> =C2=A0enum chips {
> =C2=A0	adpm12160,
> =C2=A0	adpm12200,
> +	adpm12250,
> =C2=A0	max34440,
> =C2=A0	max34441,
> =C2=A0	max34446,
> @@ -97,7 +98,8 @@ static int max34440_read_word_data(struct i2c_client *c=
lient, int
> page,
> =C2=A0		break;
> =C2=A0	case PMBUS_VIRT_READ_IOUT_AVG:
> =C2=A0		if (data->id !=3D max34446 && data->id !=3D max34451 &&
> -		=C2=A0=C2=A0=C2=A0 data->id !=3D adpm12160 && data->id !=3D adpm12200)
> +		=C2=A0=C2=A0=C2=A0 data->id !=3D adpm12160 && data->id !=3D adpm12200 =
&&
> +		=C2=A0=C2=A0=C2=A0 data->id !=3D adpm12250)
> =C2=A0			return -ENXIO;
> =C2=A0		ret =3D pmbus_read_word_data(client, page, phase,
> =C2=A0					=C2=A0=C2=A0 MAX34446_MFR_IOUT_AVG);
> @@ -182,7 +184,8 @@ static int max34440_write_word_data(struct i2c_client=
 *client,
> int page,
> =C2=A0		ret =3D pmbus_write_word_data(client, page,
> =C2=A0					=C2=A0=C2=A0=C2=A0 MAX34440_MFR_IOUT_PEAK, 0);
> =C2=A0		if (!ret && (data->id =3D=3D max34446 || data->id =3D=3D max34451=
 ||
> -			=C2=A0=C2=A0=C2=A0=C2=A0 data->id =3D=3D adpm12160 || data->id =3D=3D=
 adpm12200))
> +			=C2=A0=C2=A0=C2=A0=C2=A0 data->id =3D=3D adpm12160 || data->id =3D=3D=
 adpm12200 ||
> +			=C2=A0=C2=A0=C2=A0=C2=A0 data->id =3D=3D adpm12250))
> =C2=A0			ret =3D pmbus_write_word_data(client, page,
> =C2=A0					MAX34446_MFR_IOUT_AVG, 0);
> =C2=A0
> @@ -399,6 +402,40 @@ static struct pmbus_driver_info max34440_info[] =3D =
{
> =C2=A0		.read_word_data =3D max34440_read_word_data,
> =C2=A0		.write_word_data =3D max34440_write_word_data,
> =C2=A0	},
> +	[adpm12250] =3D {
> +		.pages =3D 19,
> +		.format[PSC_VOLTAGE_IN] =3D direct,
> +		.format[PSC_VOLTAGE_OUT] =3D direct,
> +		.format[PSC_CURRENT_IN] =3D direct,
> +		.format[PSC_CURRENT_OUT] =3D direct,
> +		.format[PSC_TEMPERATURE] =3D direct,
> +		.m[PSC_VOLTAGE_IN] =3D 125,
> +		.b[PSC_VOLTAGE_IN] =3D 0,
> +		.R[PSC_VOLTAGE_IN] =3D 0,
> +		.m[PSC_VOLTAGE_OUT] =3D 125,
> +		.b[PSC_VOLTAGE_OUT] =3D 0,
> +		.R[PSC_VOLTAGE_OUT] =3D 0,
> +		.m[PSC_CURRENT_IN] =3D 250,
> +		.b[PSC_CURRENT_IN] =3D 0,
> +		.R[PSC_CURRENT_IN] =3D -1,
> +		.m[PSC_CURRENT_OUT] =3D 250,
> +		.b[PSC_CURRENT_OUT] =3D 0,
> +		.R[PSC_CURRENT_OUT] =3D -1,
> +		.m[PSC_TEMPERATURE] =3D 1,
> +		.b[PSC_TEMPERATURE] =3D 0,
> +		.R[PSC_TEMPERATURE] =3D 2,
> +		/* absent func below [18] are not for monitoring */
> +		.func[2] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
> +		.func[4] =3D PMBUS_HAVE_STATUS_IOUT,
> +		.func[5] =3D PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
> +		.func[6] =3D PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
> +		.func[9] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
> +		.func[10] =3D PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
> +		.func[14] =3D PMBUS_HAVE_IOUT,
> +		.func[18] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +		.read_word_data =3D max34440_read_word_data,
> +		.write_word_data =3D max34440_write_word_data,
> +	},
> =C2=A0	[max34440] =3D {
> =C2=A0		.pages =3D 14,
> =C2=A0		.format[PSC_VOLTAGE_IN] =3D direct,
> @@ -635,7 +672,8 @@ static int max34440_probe(struct i2c_client *client)
> =C2=A0		rv =3D max34451_set_supported_funcs(client, data);
> =C2=A0		if (rv)
> =C2=A0			return rv;
> -	} else if (data->id =3D=3D adpm12160 || data->id =3D=3D adpm12200) {
> +	} else if (data->id =3D=3D adpm12160 || data->id =3D=3D adpm12200 ||
> +		=C2=A0=C2=A0 data->id =3D=3D adpm12250) {
> =C2=A0		data->iout_oc_fault_limit =3D PMBUS_IOUT_OC_FAULT_LIMIT;
> =C2=A0		data->iout_oc_warn_limit =3D PMBUS_IOUT_OC_WARN_LIMIT;
> =C2=A0	}
> @@ -646,6 +684,7 @@ static int max34440_probe(struct i2c_client *client)
> =C2=A0static const struct i2c_device_id max34440_id[] =3D {
> =C2=A0	{ .name =3D "adpm12160", .driver_data =3D adpm12160 },
> =C2=A0	{ .name =3D "adpm12200", .driver_data =3D adpm12200 },
> +	{ .name =3D "adpm12250", .driver_data =3D adpm12250 },
> =C2=A0	{ .name =3D "max34440", .driver_data =3D max34440 },
> =C2=A0	{ .name =3D "max34441", .driver_data =3D max34441 },
> =C2=A0	{ .name =3D "max34446", .driver_data =3D max34446 },
>=20
> ---
> base-commit: 1723bc01ecc7ca2f30272685121314379ba5eb18
> change-id: 20260610-dev-adpm12250-4ce6fc8c82ac
>=20
> Best regards,
