Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111BAC3DA7D
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 00:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjADAhq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 19:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjADAhl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 19:37:41 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF28FC43
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 16:37:39 -0800 (PST)
IronPort-SDR: LCHpatM3idzortOqTGByyaBdz8UyThgPHQrKQADBSV5vFq13gyHAXABtpvHZp/wrnukshgGA7U
 BnVKqcZn3LOVRoJY/6tNgTZQmsj7NFcjmO8cs83urS/uVt3TnSGg7RCEPVEyILKWmgrptkTC+s
 p+lh7BXEKWfai5+JOkmSrp+gJlzJ45i1beVuiqI/xsEc7MnzNdJTShRRwKXnZup4GZrfnmPGoG
 YUeSDIWr3ZVMDl68Q0fxRyZLvHYQfHQWjkgaS7B3GYveWlftgmAv6PG4ZZEPVOYNJdQuQRnXjf
 Dhas/ZzaMfxbtvnVAwNXzwnH
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AGAQBjybRjjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YE1BAEBCwGCLIJflXCfNw8BDwEBRAQBAYUFAoURJjcGDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEDAQEGAQEBAQEBBgQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlcBA?=
 =?us-ascii?q?QEDQAEBNwEPCw4KLlcGE4J+gyOvHIE0gQGCCAEBBoJjmmWBXgmBQAGMWoNOe?=
 =?us-ascii?q?kM/gU6CUYFuPoREhj6MLoxnCoE9fIEnDmw3AxkrHUADCzsyCkA1CwtLKxobB?=
 =?us-ascii?q?4EKKigVAwQEAwIGEwMiAg0oMRQEKRMNJyZrCQIDImEFAwMEKC0JQAcVESQ8B?=
 =?us-ascii?q?1Y3AQQDAg8fNwYDCQMCHk9yLhETBQMLFSpHBAg2BQYcNhICCA8SDwYmQw5CN?=
 =?us-ascii?q?zYTBlwBKgsOEwNQgU4EL4FdCgYpKJ0IdRmkKoEyjCaUAIN4gVCfQoFEgjWMW?=
 =?us-ascii?q?phRLZcZgkugF4RzAgoHFoF4gX9NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBA?=
 =?us-ascii?q?QGOHQwNCYIKjDhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:tyeezh0VSC8uFbMZsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:Urj8ya0jEAdi5WsmKPbD5e53kn2cJEfYwER7XKvMYLTBsI5bpzNUn
 zYbXT/TbPbbZzTxct1zO4my8UIBscCHnYU1GgY++C8xQngU85qeXtiVJ03+ZiiYJJTIQBhu4
 5sVMNOZc84dQy6HrH9BEJC4/SEmj/3gqpkQqQLgEnosLeOxYH550XqPo8Zg3sgwx4LR7zql4
 bsemeWGULOY82cc3lw8u/rrRCxH5JweiBtA1rDpTa0jUPf2zhH5PbpHTU2DByKQrrp8QoZWc
 93+IISRpQs1yfuM5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2Pc0MS9qZzu1c99Z+
 fBrirCVSjkSIqjOse4iAgt/HxpeMvgTkFPHCSDXXc27xUzaaD3n2fxxAkYsMcsV//sxAG0I/
 OFwxDIlMEjF3b7shujrDLMw2qzPL+GyVG8bkn96xDfaJf08SI/NRL/Go9JdwXExioZHAJ4yY
 uJDOGczM0qdPUUn1lE/BcsFg7+3wVjGTB56qny5o5QJ+Dn45VkkuFTqGIGNIYzQH5Q9clyjj
 mbH+XnpRxEFMduZ4SSK/2jqheLVmy7/HoUIG9WQ9PJnhEOa3GE7EwANWB2wpvzRokq/Xc9PA
 1YT9yEt6LUpskqmUrHAswaQ/ibB5EJGHoAAVrdmtEeW1qPI4g3fGnALT3hKb9lgvdJeqSEWO
 kGhrvbPOhBKs4OuVXef372r/CGVNRM1IjpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmuk
 lhmSwBg3N0uYd43O7aTuAuc0231+vAlWiZsu1yNBjr7hu9sTNP9D7FE/2Q3+t5pEe51pHG6r
 XQCltn2AAsmV8nVzERhrM0rEa7h3PGYLD2UvldrEoJJythA0yD7ONoMunQkdAIzbppCYiPgf
 E7Y/x9J654VN3yvK6ZqC25QNyjI5fS7fTgGfqqPBjarXnSXXFXYlM2JTRTOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsqkkEz5i+XGOy79pVI53L2mMLFRAESs/l69z
 jqjH5DTo/mieLehOXKModZ7wa4icSZjXsieRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJEzEi3TMioLVV8adconxZ7NFXB1YwrANrlKSdrH0ZrzgLNsLeZ7qbI/lK4qJ
 xTHEu3Zaslypv3802x1RfHAQEZKLXxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwtBxGQeocOJ0i8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQvzUOs4fCTZ0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2/KY3+wCmxXPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA686a7FYIsqQCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:tuIWH6oK2yOQkvm548GTptIaV5r7eYIsimQD101hICG9Evbzqy
 lhpoV56faSskd2ZJhAo6HmBEHjKUmwyXcR2+Us1NiZLWvbUQeTTb2KqLGSpgEIeBeOjtK1t5
 0OT0EWMrSZZmSSz/yKhDVQeOxP/DDoysCVbKvlvg5QpY4GUdAa0+5gMHflLqRpfng7OXPnLu
 vn2iKXzwDQBEgqUg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 04 Jan 2023 11:07:37 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3040bSLG3044805
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Jan 2023 11:37:29 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3040bSLG3044805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672792649; bh=lvzGsmNhCr7S4rHYT5ynS5NVg9qxnaiPQIQ1IlRDSGs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ALqBe9wB8of6eZOQyKHKUrhHmJVo0P12sRnoJ/4ApEiqIVFCrQis9roL4ctO4Py7v
         0OFK7Kc3/BpUUyt08s89hRZqBtaOyzStb5xC4+BSTVNLIz+kC4AqrpWu1XYINnvmgT
         M9kRAuhcLWLscB6pqug8X21BHRI7ENGjDej41jH396lR04gho8dIJgd9Ppxa79CgmM
         jM6PCSWUI5gwaSaWs9GT9J4aTUW49l1IHzkMxSapqhCZncVfQyJejfD57tM3q0/74x
         EB2V6gaXQUGpZp75A5YUPESVx8PiIGFD7modaQl97jXv6AAyc5HgNLDZxU/HAaXT/R
         eo0x/yJv9SFJw==
Message-ID: <164ad5b0da8309728955ff06b7cae863c8d8f3df.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 1/2] hwmon: (it87) Allow calling superio_enter
 outside mux
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Wed, 04 Jan 2023 11:37:28 +1100
In-Reply-To: <20230103183707.GA204971@roeck-us.net>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
         <20230103064612.404401-2-frank@crawford.emu.id.au>
         <20230103183707.GA204971@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 04 Jan 2023 11:37:29 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 2023-01-03 at 10:37 -0800, Guenter Roeck wrote:
> On Tue, Jan 03, 2023 at 05:46:11PM +1100, Frank Crawford wrote:
> > Allow for superio_enter to be called outside mux, in particular for
>=20
> "outside mux" is really a bad wording. I had to look into the code
> to understand what it means. "without requesting the muxed memory
> region", maybe.
>=20
> Guenter

Will update with better wording, such as you suggest.
>=20
> > initialisation of the second chipset, which must be entered, but
> > never
> > exited.
>=20
> The second chipset is not "entered", it must enter configuration
> mode (or be put into configuration mode). The name of the function
> does not reflect the associated functionality.
>=20
> Please rephrase.

Will do.

Do you believe the function should be renamed as well?
>=20
> Thanks,
> Guenter

Regards
Frank
>=20
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 13 +++++++++----
> > =A01 file changed, 9 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 9997f76b1f4a..4ebce2c661d7 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
> > =A0#define=A0=A0=A0=A0=A0=A0=A0=A0DEVID=A0=A0=A00x20=A0=A0=A0=A0/* Regi=
ster: Device ID */
> > =A0#define=A0=A0=A0=A0=A0=A0=A0=A0DEVREV=A0=A00x22=A0=A0=A0=A0/* Regist=
er: Device Revision */
> > =A0
> > +static inline void __superio_enter(int ioreg)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0outb(0x87, ioreg);
> > +=A0=A0=A0=A0=A0=A0=A0outb(0x01, ioreg);
> > +=A0=A0=A0=A0=A0=A0=A0outb(0x55, ioreg);
> > +=A0=A0=A0=A0=A0=A0=A0outb(ioreg =3D=3D REG_4E ? 0xaa : 0x55, ioreg);
> > +}
> > +
> > =A0static inline int superio_inb(int ioreg, int reg)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0outb(reg, ioreg);
> > @@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
> > =A0=A0=A0=A0=A0=A0=A0=A0if (!request_muxed_region(ioreg, 2, DRVNAME))
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EBUSY;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0outb(0x87, ioreg);
> > -=A0=A0=A0=A0=A0=A0=A0outb(0x01, ioreg);
> > -=A0=A0=A0=A0=A0=A0=A0outb(0x55, ioreg);
> > -=A0=A0=A0=A0=A0=A0=A0outb(ioreg =3D=3D REG_4E ? 0xaa : 0x55, ioreg);
> > +=A0=A0=A0=A0=A0=A0=A0__superio_enter(ioreg);
> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
> > =A0
> > --=20
> > 2.38.1
> >=20
