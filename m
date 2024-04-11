Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074CC1474BA
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712834004; cv=none; b=m+yM+sev5HGIsaQOjIbsQoCKT+jkU6fr+gz5ifug+x5KJMsKEKzEsBUlVze1Z+kUjrnLBUKFtMg8gZCie8FzhhFR9c/SopWQNEAS/s0wgAsLMabe28JWWq+DWRY43AhVwkrmxMwhL/XEf0XKWM4qruH7V4iHkJh5k7T9gMFLeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712834004; c=relaxed/simple;
	bh=Ago6cNaGx4APo+5Sh+7nhdbIe3aePwDeIO2kkKxiTdg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tMo/6tCbU3yyiOBzVsfmkh53IN6JIsC3ySs3WMDN35ZWYTUJ6zKXvlA+ImfXRAucXfZSRP99C+E6JL8TNY/INHfekV8V1wc/X6i3u0YIhucu4uQmj6POVwm0DiEbNzZDFI1AS789I2H3RLQV3T0HlgUumKllWeyVjzGgbVkIP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=jORLBxlH; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="jORLBxlH"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43BB36UE1803534
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 11 Apr 2024 21:03:06 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43BB36UE1803534
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1712833387; bh=SVx7AY107A3ovom6mSZyYRxgJjZe8KXVNHrdqgA8r2c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jORLBxlHiH1jY8/aPrq4BoKP14nH95yVFwCBPKU+TU+tHtq5epgThwAEdtFv0aspR
	 VcBEhRxVfmHjHjIIApbA2rQdpAMqTzw0qrJFhl0bce9Nc0tzeKkQ8WkynLVKr8M7nm
	 Dy4Ivy3HSPGN4h9rIeMN+IWYLGQJLux0FMUoooQa5dJjPIxLBb+s9h+ZGi54Jkesgj
	 Zh1DrrXX+ojDXXs67c5Ezfy/qdPmmxU0I8oECUvO/pltEuySYkASkMY7zmkEkjlhzY
	 rB+0XcxZE0bGwamYmsTBlpcQ6bJFVi710Q4I+YrC/AlJo3Te1L1oSUkuSF+qOfbGlr
	 flZcOQboButNA==
Message-ID: <c3c69b27c61702b50f99f866c30f91f44ca23945.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 1/4] hwmon (it87): Rename NOEXIT to BIOSOPEN as more
 descriptive of requirement
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date: Thu, 11 Apr 2024 21:03:06 +1000
In-Reply-To: <f4efa185-7312-4116-a843-a6d7e0c22c79@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
	 <20240401025620.205068-2-frank@crawford.emu.id.au>
	 <f4efa185-7312-4116-a843-a6d7e0c22c79@roeck-us.net>
Autocrypt: addr=frank@crawford.emu.id.au; prefer-encrypt=mutual;
 keydata=mQGiBD+o6joRBADBLtTRHGwkCHLbpC5qU/cJL0mHf8wDGcoiy9jSlPHrlTp8qGyxBOsus917W0fd9tm1RPRdcYffVFRqdduxBwPdpXi7vTWZgNG5CS39IXw6V//oO1hi7swPm3bNjszq3D1TxVpIpK3EuL4oNcgweLJftXuPP30Mi0gbRgMSyn9SOwCgzc/nZ4i9iPEq7Jhyu+MptuFzNqsEAJPZYUk0MDmXrJjzvcydHoOePqxp9VIqxLOf1gqxy8wXg9D9R3oTAXh94ekLkIN+GimKdB0oCZu02PF9wDnJlQqOtk0Fz4hCetwsNNBsFdbSY7gfmIEByqHE4MicQnTl97JOV/4XQgovznJJKv4OiCC6n20aIPFe2OcKHsi4NlxIA/9lKO2a4ge8f6a6sQoHgrjBe0SQJ0RimXqVUKAxac2wKeDe62J8RJhDJ+Ghnm29w5kKb3YHr2muVJEVqHxz3VYqGXG4T+tleG6T8yeic3HbTghC6+o3HYXOJchGfciIw52S08xO0w4eowNznlS5i8td+aroFF7JiomZqnmyD6oqSbQpRnJhbmsgQ3Jhd2ZvcmQgPGZyYW5rQGNyYXdmb3JkLmVtdS5pZC5hdT6IeQQTEQIAOQIXgAIeBxYhBAPV1JdGtb85KnTrWEWq0knseWomBQJigar6BQsJCAcCAyICAQYVCgkICwIEFgIDAQAKCRBFqtJJ7HlqJqFLAJ9OZPRJxlFHCfDJ6iCL8i4IpINeuACgw1znVGjRZpfNx+YRELbLYdLvZKW5AQ0EP6jqPBAEANwthQvVRnrGQBCGCXBFZ6Dum/aQWXzEovvipgLH0MrVNJy3605GJt+aLGjnzPNvhjvCYGmNtdksqPQqsg8VnE/DgvQFJr+OX/q9IWnZhzEaZ4t6Itvqv9DhtVk6tX6XUgxkBVTX0mQOSwFIPRG+XgSve9dv6xgSRTeAjXRxzbrHAAQLBAC0atcs!
 Itf9FthDk
	6XJg9ZXtsXDctsVgV1BuSSDP/iynoMozuGpbqMkGXugBGqPmNOMHXw+XALd4yQ2/rPrznK5VFyaCupqzCgWtKfQ1zMczHUb9JvFCweP7I8ZbP2oXCvlHBySzGjVJVCNPxCYLQi0qriLv0aXmWIkHBLCpybDqYhdBBgRAgAdFiEEA9XUl0a1vzkqdOtYRarSSex5aiYFAmKBqYQACgkQRarSSex5aiYz/gCfUNAXafSyBey6z61HSG7l16anYfcAoKsrBxj7bE73wsjzjywqOWkJ9hjJ
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 11 Apr 2024 21:03:07 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On Wed, 2024-04-10 at 08:10 -0700, Guenter Roeck wrote:
> On Mon, Apr 01, 2024 at 01:56:03PM +1100, Frank Crawford wrote:
> > Rename previous definitions to match the new information that they
> > are
> > preinitialised by the BIOS and should not receive codes to enter or
> > exit
> > configuration mode.
> >=20
>=20
> That is wrong. NOEXIT is needed for broken chips where two chips are
> on the
> sio bus, and disabling sio access on the broken chip results in sio
> access
> errors. The description is also wrong, because SIO mode still needs
> to be
> _entered_.

As noted in the patch group write up, this change has come from the
technical specifications for the chips not for the board.  If by SIO
mode you mean the sequence "0x87,0x01,0x55,0xAA" then it should not be
used for these chips according to people with access to the
specification documents.

Unfortunately, I don't have direct access to these documents, so cannot
quote the full description.

Now, the macro name may not be the best (BIOSOPEN), and I'm happy to
change it to something better, but the current name of "NOEXIT" is also
wrong.

However, for the chips that this relates to, and are defined to use in
the it87_devices structure, you can access the chip details without the
the superio_enter sequence, as that is specifically the read that
occurs to find the chipID, and I have tested it on a number of
different chips, both of this type and older ones that do need the
entry sequence.

What makes this a little more difficult is that the chips that it
affects also only ever appears to be the second chip on the bus, which
may be by design, or just current usage.

I will add that the use of enter sequence has been confirmed to fail
and cause the exact chip lockup concerned about on the Gigabyte X670E
Aorus Master board.  While you may say that we should only do this for
that board, the information I have received is that it is cause by
incorrect access to those chipIDs, not board specific.
>=20
> Also, a BIOS open mode, if it indeed exists, would have to be be
> board
> specific, not chip specific.

Now here my description may be wrong in it being BIOS related, but
rather it is specifically the chip initialisation, but the details on
access came from the chip specifications.
>=20
> Guenter

Regards
Frank
>=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 18 +++++++++---------
> > =A01 file changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index fbe86cec6055..6eeba3a01e3c 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -320,7 +320,7 @@ struct it87_devices {
> > =A0 * second SIO address. Never exit configuration mode on these
> > =A0 * chips to avoid the problem.
> > =A0 */
> > -#define FEAT_CONF_NOEXIT BIT(19) /* Chip should not exit conf mode
> > */
> > +#define FEAT_CONF_BIOSOPEN BIT(19) /* Chip conf mode enabled by
> > BIOS */
> > =A0#define FEAT_FOUR_FANS BIT(20) /* Supports four fans */
> > =A0#define FEAT_FOUR_PWM BIT(21) /* Supports four fan controls */
> > =A0#define FEAT_FOUR_TEMP BIT(22)
> > @@ -452,7 +452,7 @@ static const struct it87_devices it87_devices[]
> > =3D {
> > =A0 .model =3D "IT8790E",
> > =A0 .features =3D FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> > =A0 =A0 | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
> > - =A0 | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
> > + =A0 | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_BIOSOPEN,
> > =A0 .peci_mask =3D 0x07,
> > =A0 },
> > =A0 [it8792] =3D {
> > @@ -461,7 +461,7 @@ static const struct it87_devices it87_devices[]
> > =3D {
> > =A0 .features =3D FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
> > =A0 =A0 | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
> > =A0 =A0 | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
> > - =A0 | FEAT_CONF_NOEXIT,
> > + =A0 | FEAT_CONF_BIOSOPEN,
> > =A0 .peci_mask =3D 0x07,
> > =A0 .old_peci_mask =3D 0x02, /* Actually reports PCH */
> > =A0 },
> > @@ -507,7 +507,7 @@ static const struct it87_devices it87_devices[]
> > =3D {
> > =A0 .features =3D FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
> > =A0 =A0 | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
> > =A0 =A0 | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
> > - =A0 | FEAT_CONF_NOEXIT,
> > + =A0 | FEAT_CONF_BIOSOPEN,
> > =A0 .peci_mask =3D 0x07,
> > =A0 .old_peci_mask =3D 0x02, /* Actually reports PCH */
> > =A0 },
> > @@ -544,7 +544,7 @@ static const struct it87_devices it87_devices[]
> > =3D {
> > =A0#define has_four_temp(data) ((data)->features & FEAT_FOUR_TEMP)
> > =A0#define has_six_temp(data) ((data)->features & FEAT_SIX_TEMP)
> > =A0#define has_vin3_5v(data) ((data)->features & FEAT_VIN3_5V)
> > -#define has_conf_noexit(data) ((data)->features &
> > FEAT_CONF_NOEXIT)
> > +#define has_conf_biosopen(data) ((data)->features &
> > FEAT_CONF_BIOSOPEN)
> > =A0#define has_scaling(data) ((data)->features & (FEAT_12MV_ADC | \
> > =A0 =A0=A0=A0=A0 FEAT_10_9MV_ADC))
> > =A0#define has_fanctl_onoff(data) ((data)->features &
> > FEAT_FANCTL_ONOFF)
> > @@ -748,7 +748,7 @@ static int smbus_disable(struct it87_data
> > *data)
> > =A0 superio_select(data->sioaddr, PME);
> > =A0 superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
> > =A0 =A0=A0=A0=A0 data->ec_special_config & ~data->smbus_bitmap);
> > - superio_exit(data->sioaddr, has_conf_noexit(data));
> > + superio_exit(data->sioaddr, has_conf_biosopen(data));
> > =A0 }
> > =A0 return 0;
> > =A0}
> > @@ -765,7 +765,7 @@ static int smbus_enable(struct it87_data *data)
> > =A0 superio_select(data->sioaddr, PME);
> > =A0 superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
> > =A0 =A0=A0=A0=A0 data->ec_special_config);
> > - superio_exit(data->sioaddr, has_conf_noexit(data));
> > + superio_exit(data->sioaddr, has_conf_biosopen(data));
> > =A0 }
> > =A0 return 0;
> > =A0}
> > @@ -3143,7 +3143,7 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0 }
> > =A0
> > =A0exit:
> > - superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
> > + superio_exit(sioaddr, config ? has_conf_biosopen(config) :
> > false);
> > =A0 return err;
> > =A0}
> > =A0
> > @@ -3540,7 +3540,7 @@ static void it87_resume_sio(struct
> > platform_device *pdev)
> > =A0 =A0=A0=A0=A0 reg2c);
> > =A0 }
> > =A0
> > - superio_exit(data->sioaddr, has_conf_noexit(data));
> > + superio_exit(data->sioaddr, has_conf_biosopen(data));
> > =A0}
> > =A0
> > =A0static int it87_resume(struct device *dev)
