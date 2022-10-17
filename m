Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AE0C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Oct 2022 09:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiJQJ0q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Oct 2022 05:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiJQJ0o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Oct 2022 05:26:44 -0400
Received: from ipmail05.adl3.internode.on.net (ipmail05.adl3.internode.on.net [150.101.137.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 100EC15A37
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Oct 2022 02:26:31 -0700 (PDT)
X-SMTP-MATCH: 0
IronPort-PHdr: =?us-ascii?q?A9a23=3A8jPllRONKrKIXJkzaQEl6nczWUAX0o4cdiYf6?=
 =?us-ascii?q?4Y8zblUe7ut+I7uekHa+LNsgBnAQNaT4uhP3uzRta2oQmkc+dCbvXUFbJEJV?=
 =?us-ascii?q?gdQh8kaxV5/CceJW0Gnc664Nn5oF84bDA1u9CnkWXU=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3AahbQpK/iNmgEWMwdQ9ZkDrUDGXyTJUtcMsCJ2?=
 =?us-ascii?q?f8bNWPcYEJGY0x3zmVLXD2PaPjZZWD3eI0kPoTnpE4C7JeEzd9kTgRu+Hw8E?=
 =?us-ascii?q?ylA+MCZCN3IdEyvYX3DcJaeFh02tcsQNdeZIck9FlbR90ynWlTDhSAsjfvSG?=
 =?us-ascii?q?tIQKwJl1hic9maIcQ954f5es7dRbrBA0YDR7zyl4bsek+WHULOU82Yc3lA8s?=
 =?us-ascii?q?spvmzs31BjGgw70i3RlDRx9UP4yoFFOZH4XDfnZw3IV2eC4FMbiLwrI5OnRE?=
 =?us-ascii?q?m80Y34Q5t2ZfrbTKiXmQ5bYPBSVzHFMUreshQJO4CE3z+A6OLwVdC+7iR3Xx?=
 =?us-ascii?q?5YrlI8L78z2E1t1VkHPsL11vx1wHTt3O65u86XOPna4q8DVwkjbNXrghfxzZ?=
 =?us-ascii?q?K0zFdFCprgtXD4frZT0LxhWNkvT3bjnqF6hccFoh8I+PIzrI4YYvFl+wjzDS?=
 =?us-ascii?q?/UrW5bOR+PN/9Aw9DU8i8RQFOzTT9EEcjcpZxPFCzVLO1EKGLokm+qjhTzia?=
 =?us-ascii?q?HtepU79mEady3yLmVQ3iKy0ZYKTIsjQEJ0Twx7A/nadqjy/XwVFYeeExS7cq?=
 =?us-ascii?q?if0wrfb9c/gcNxKUefkrLsw0BjJmjBVEwEfSVqw5+WhhU/4UNVabUUJkhfCZ?=
 =?us-ascii?q?JMarCSDJuQRlTXhyJJcgiMhZg=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Av8Y9lalNZhUTE25clhay3THSMh/pDfL63D?=
 =?us-ascii?q?Abv31ZSRFFG/Fw9/rFoB3U726WtN93YgBHpTngAtjmfZu/naQZ3WB1B9uftW?=
 =?us-ascii?q?bdyQmVxe1ZjLcKhgeQfhEWldQtrZuIEZIQNDSYNzET5voSojPId+rIq+PozE?=
 =?us-ascii?q?nHv4fjJjtWPHhXgy4M1XYDNu+CKDwJeOBdP+tHKHOD3Ls6m9N+QwVsUixrbk?=
 =?us-ascii?q?N1ItT+mw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2A1AAAZH01jZPQc8jxaHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFACYEyBwEBCwGCJIJZjG2IdwOdG4F8CwEPAQFCBAEBhQUChG0?=
 =?us-ascii?q?mNAkOAQIEFQEBBgEBAQEBBwQFagEshWgNhkIBAQEBAgEnGQEBNwEECwsOCi5?=
 =?us-ascii?q?XBgESG4VgI6lueIEBM4EBgggBAQaCYYMtgVwJgT0Bi3QUgzB6Qz+BToEVgno?=
 =?us-ascii?q?wPoQmHoY9mmE4AxkrHUADCzs0AxUDFAMFIQcDGQ8jDQ0EFgcMAwMFJQMCAhs?=
 =?us-ascii?q?HAgIDAgYTBQICTTQIBAgEKyQPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAg?=
 =?us-ascii?q?CCCYXBxMYGxkBBVkOCSEcDhoNBQYTAyBvBQo4DygvaRAbHBsHgQwqKBUDBAQ?=
 =?us-ascii?q?DAgYTAyACDSkxFAQpEw8tByNxCQIDImUFAwMEKCwDCUAHJSQ8B1g6AQQDAhA?=
 =?us-ascii?q?iPAYDCQMCJFd1LxEVBQMNFyUIBTcbBAg8AgUGUhICChEDEg8GJ0gPSj45FgY?=
 =?us-ascii?q?nRQE2Dw6cVGsHATAMHDUcFB6BYUUCklSOQ4Eyn2aDaoFKnymBRKdLlxYgoh6?=
 =?us-ascii?q?FDQIKBxaBYoIVTR8ZgyJRGQ+OIAwWFYF1jDhhOwIGCwEBAwmKVwEB?=
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail05.adl3.internode.on.net with ESMTP; 17 Oct 2022 19:56:29 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29H9QLwf435988
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 17 Oct 2022 20:26:21 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29H9QLwf435988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1665998784; bh=3GoSq0n3aXQlgcxAm72N4lZkUXmcsK/xACTtWAWXtio=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Nyn0gjdwBycq9beE+dpwLLMTn/hDJHW4aT5TiRw7OVXB3gC92NuYSqg2R+SO/l/BC
         K8FYGrV6QN3JofN0vlhNkfoxj81oLLAYovSU1H6fMvXVAB7iXHuFIlmumfxhDH7wV1
         0674MZZMhkW1888XOIre5f4sx0cN+5Bld0qSoa/CjPNwwyjAyEpntIR07D/Fmzqc4u
         ntQn0F3psOd7micPY9u6jWFwe/JZqaeOB7MLkzqRm978FsoL+67ZGS5GQRbjs2TMOd
         r25GuUjPW+idcssjNlVo91KtySOLcc/QPvqRTX1ZKrgFdaH6pejgGNRjzyag4ykrAE
         YhuVIyLgzHi5Q==
Message-ID: <fd3e4eed9aa21002bcec2c1e8c1019b5e5b85f03.camel@crawford.emu.id.au>
Subject: Re: [PATCH 1/1] hwmon: (it87) Create DMI matching table for various
 board settings
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
Date:   Mon, 17 Oct 2022 20:26:21 +1100
In-Reply-To: <d63f9154-4bb9-8578-43c4-6adb083636ff@roeck-us.net>
References: <20221015120110.1472074-1-frank@crawford.emu.id.au>
         <20221015120110.1472074-2-frank@crawford.emu.id.au>
         <d63f9154-4bb9-8578-43c4-6adb083636ff@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 17 Oct 2022 20:26:24 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2022-10-15 at 05:27 -0700, Guenter Roeck wrote:
> On 10/15/22 05:01, Frank Crawford wrote:
> > Define the DMI matching table for board specific settings during
> > the
> > chip initialisation and move the only current board specific
> > setting
> > to this new table.
> >=20
> > Export the table for use by udev.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0 drivers/hwmon/it87.c | 57 ++++++++++++++++++++++++++++-----------
> > -----
> > =A0 1 file changed, 37 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 7bd154ba351b..b83ef7c89095 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -2389,7 +2389,6 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0 {
> > =A0=A0=A0=A0=A0=A0=A0=A0int err;
> > =A0=A0=A0=A0=A0=A0=A0=A0u16 chip_type;
> > -=A0=A0=A0=A0=A0=A0=A0const char *board_vendor, *board_name;
> > =A0=A0=A0=A0=A0=A0=A0=A0const struct it87_devices *config;
> > =A0=20
> > =A0=A0=A0=A0=A0=A0=A0=A0err =3D superio_enter(sioaddr);
> > @@ -2802,25 +2801,6 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0=A0=A0=A0=A0=A0=A0if (sio_data->beep_pin)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Beeping is sup=
ported\n");
> > =A0=20
> > -=A0=A0=A0=A0=A0=A0=A0/* Disable specific features based on DMI strings=
 */
> > -=A0=A0=A0=A0=A0=A0=A0board_vendor =3D dmi_get_system_info(DMI_BOARD_VE=
NDOR);
> > -=A0=A0=A0=A0=A0=A0=A0board_name =3D dmi_get_system_info(DMI_BOARD_NAME=
);
> > -=A0=A0=A0=A0=A0=A0=A0if (board_vendor && board_name) {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (strcmp(board_vendor, =
"nVIDIA") =3D=3D 0 &&
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strcmp(board_na=
me, "FN68PT") =3D=3D 0) {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
*
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* On the Shuttle SN68PT, FAN_CTL2 is
> > apparently not
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* connected to a fan, but to something
> > else. One user
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* has reported instant system power-off
> > when changing
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* the PWM2 duty cycle, so we disable it.
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* I use the board name string as the
> > trigger in case
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* the same board is ever used in other
> > systems.
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
*/
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0p=
r_info("Disabling pwm2 due to hardware
> > constraints\n");
>=20
> This info message gets lost.

True, although I doubt most users will understand what it means.=20
However, if we go through with your later suggestions I will add it
back in.
>=20
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s=
io_data->skip_pwm =3D BIT(1);
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > -=A0=A0=A0=A0=A0=A0=A0}
> > -
> > =A0 exit:
> > =A0=A0=A0=A0=A0=A0=A0=A0superio_exit(sioaddr);
> > =A0=A0=A0=A0=A0=A0=A0=A0return err;
> > @@ -3295,14 +3275,48 @@ static int __init it87_device_add(int
> > index, unsigned short address,
> > =A0=A0=A0=A0=A0=A0=A0=A0return err;
> > =A0 }
> > =A0=20
> > +struct it87_dmi_data {
> > +=A0=A0=A0=A0=A0=A0=A0u8 skip_pwm;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* pwm channels to skip for this
> > board=A0 */
> > +};
> > +
> > +/*
> > + * On the Shuttle SN68PT, FAN_CTL2 is apparently not
> > + * connected to a fan, but to something else. One user
> > + * has reported instant system power-off when changing
> > + * the PWM2 duty cycle, so we disable it.
> > + * I use the board name string as the trigger in case
> > + * the same board is ever used in other systems.
> > + */
> > +static struct it87_dmi_data nvidia_fn68pt =3D {
> > +=A0=A0=A0=A0=A0=A0=A0.skip_pwm =3D BIT(1),
> > +};
> > +
> > +static const struct dmi_system_id it87_dmi_table[] __initconst =3D {
> > +=A0=A0=A0=A0=A0=A0=A0{
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.matches =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0D=
MI_MATCH(DMI_BOARD_VENDOR, "nVIDIA"),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0D=
MI_MATCH(DMI_BOARD_NAME, "FN68PT"),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0},
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.driver_data =3D &nvidia_=
fn68pt,
>=20
> Maybe add a callback function and have it display the info message.
> Using a callback function may make it easier to add functionality
> needed for other boards. Hard to say, though, since it depends on
> what is coming next.

The current planned additions are settings to disable ACPI failures on
boards we are aware of (following on from a recent patch to sometimes
ignore ACPI issues), and one to initialise chips on certain boards with
multi-chip boards.

Certainly, a callback function may make some things easier, and I'll
look into it.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0},
> > +=A0=A0=A0=A0=A0=A0=A0{ }
> > +
> > +};
> > +MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
> > +
> > =A0 static int __init sm_it87_init(void)
> > =A0 {
> > +=A0=A0=A0=A0=A0=A0=A0const struct dmi_system_id *dmi =3D
> > dmi_first_match(it87_dmi_table);
> > +=A0=A0=A0=A0=A0=A0=A0struct it87_dmi_data *dmi_data =3D NULL;
> > =A0=A0=A0=A0=A0=A0=A0=A0int sioaddr[2] =3D { REG_2E, REG_4E };
> > =A0=A0=A0=A0=A0=A0=A0=A0struct it87_sio_data sio_data;
> > =A0=A0=A0=A0=A0=A0=A0=A0unsigned short isa_address[2];
> > =A0=A0=A0=A0=A0=A0=A0=A0bool found =3D false;
> > =A0=A0=A0=A0=A0=A0=A0=A0int i, err;
> > =A0=20
> > +=A0=A0=A0=A0=A0=A0=A0if (dmi)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dmi_data =3D dmi->driver_=
data;
> > +
>=20
> dmi_data is really unnecessary. Might just check for dmi below and
> dereference there if not NULL.

Yes, will do that.
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0err =3D platform_driver_register(&it87_driver);
> > =A0=A0=A0=A0=A0=A0=A0=A0if (err)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return err;
> > @@ -3320,6 +3334,9 @@ static int __init sm_it87_init(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (i && isa_address[i]=
 =3D=3D isa_address[0])
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;
> > =A0=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (dmi_data)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s=
io_data.skip_pwm |=3D dmi_data->skip_pwm;
> > +
>=20
> Personally I would prefer a solution which does not require extra
> code here,
> but I don't know a good one. The only means for the callback function
> to return
> data to here seems to be through static variables. Any idea what else
> is coming ?

See above, although the planned updates include setting variable
it87_sio_data and/or calling an initialisation function for a chip.

> One option might be to keep a global copy of sio_data (eg
> it87_sio_data),
> initialize it from the dmi callback function, and use
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data =3D it87_sio_dat=
a;
> instead of memset() to initialize it.

However, yes I'll see what I can do about this.
>=20
> Thanks,
> Guenter
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0err =3D it87_device_add=
(i, isa_address[i],
> > &sio_data);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (err)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0goto exit_dev_unregister;
>=20
Thanks
Frank
