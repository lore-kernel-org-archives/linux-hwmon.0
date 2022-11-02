Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0115DC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 07:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiKBHfc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 03:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiKBHf0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 03:35:26 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54D322529B
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Nov 2022 00:35:23 -0700 (PDT)
IronPort-SDR: T5O/mlAfJ/VcOb+vs4QHNpk1wWFBnQr1Rg5v9CYHfRqvQ+yvFvOwtfX2ruIXrVY8zYSKTLcAlf
 cb9v+LWyGP8ms+WjkSvDfrHb+n626LdM+UMXzznr70RIJ4KU1txzWmtNjXucbVi0m8kMO+N92k
 HY/xdeLuK+nPVk9n1nbkX5b9q2O2geU+2FUPixJt5Jl94yAmL7pawyMnnxrnGuJzZNJh+M04mb
 +SDRcCYH4uRzulgwct4CedFj5U02Anhs+4GZiHxnigmLT5dypygLgX+O00i4oNrPIVkVIKuNNf
 SxZaNT2G0Sxv+TSp5ORpzD99
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CHAQD3HGJjjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YE1BAEBCwGCBCiCWZVoA58iDwEPAQFEBAEBhQUChHomNwYOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQMBAQYBAQEBAQEGBBQBAQEBPxgBOQcLUgcLWAcHgUELgWETCwMxD?=
 =?us-ascii?q?YZDAQEBAycZAQE3AQ8LDgouVwYTgn2DIaxBgQEzgQGCCAEBBoJhlnGBXQmBP?=
 =?us-ascii?q?QGPfnpDP4FOgRWBPIE+MD6DfCoehj2MPIoYOAMZKx1AAws7Mg1MG1gOCR8cD?=
 =?us-ascii?q?hcNBQYSAyBuBQo3DygvZyscGweBDCooFQMEBAMCBhMDIAINKTEUBCkTDSsHI?=
 =?us-ascii?q?3EJAgMiZQUDAwQoLAMJQAcWESQ8B1g6AQQDAhAiPAYDCQMCJFh1LxEVBQMNF?=
 =?us-ascii?q?yUIBU4ECDoCBQZSEgIKEQMSDwYmRw5KPjkWBidEATQPDhYDYIFxBplgAWsHP?=
 =?us-ascii?q?Rw1CoImAUMvkmaODIEyn36DcYFMnzWBRKdPly2iDj6FAgIKBxaBeIF/TR8Zg?=
 =?us-ascii?q?yJPAQIBAQENAQIBAQMBAgEBAQkBAQEBjh0MDQmBBAEJfIw4YTsCBwsBAQMJi?=
 =?us-ascii?q?AeCNwEB?=
IronPort-PHdr: A9a23:Y87lZBR+k4KqdvqVk42fGqX85Npso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:rtjIdqPxs8619ZDvrR2ckcFynXyQoLVcMsEvi/4bfWQNrUol1TBTz
 mobDWDUPfrbMDahco8lbdvio0MFvMeHyt5mHQtv/Hg0EXkTo5GUW4nFdxuoNiicf5PPEh5tt
 cwSZ4DJBc1lFXW0SjWFa+i59yMgvU2rqhsQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzBXf8s9JKGjJMg068gEsHUMTa4Fv0aXRjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt+ot7
 ex8sYaQciwCDoqLp7gySRBaVAgraMWq+JefSZS+mcaS01aAeGHl3PtpFk1wMIgFvOd7R2hTn
 RAaAG5VKErf3aTskPThFrUEascLdaEHOKsRoHhmzhnSF/85T5fZT+PH4MIe3Tt2j90m8fP2O
 5FHMGI1NkuRC/FJEmYSFso/g7j4vH68XzF4627Io7gxyUGGmWSd15C2aIGFIIbbLSlPpW6cp
 2Tb7yH5HRQdMvSBxjeftHGhnOnCmWX8Qo16PL+0+/p0iUee7ncOExBQXly+ydG9i0ijS/pFL
 EEf+W8ztu40+VDDczXmd0Pg5STY5FtGC58KT7F88x2E1qvfpRqBCWlCRTlELtU73CMredA0/
 mXVuurYASZPi5a+eVXayeu7tzqwfgFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdR2yYL
 9ei8nZWulkDsSIY/+DgpgCY2m7ESozhF1NsvF2PAApJ+yskDLNJcbBE/nDy0J6sxq6iX1WHs
 WlsdyO2trhWVflheASrTfpFJ7a0+/bNDzTYjEUHInXM32r1viT/J8UKsHQkeBsvKdoNZT7iJ
 lPLtgIX75hWenK3BUOWX25TI597pUQDPY6+PhwxUjaoSsIpHONg1Hs2DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmzyIH8+nlUr7jev2iJuppVEtbgbmggcRsv3snekp2
 4wFXyd3408BAbKlOHm/HXA7cwpRdCBT6W/KRzx/LbbYclA8SQnN+tfN2bxpeop5kr5Tm/ugw
 51OchEw9bYLvlWecV/iQi45N9vSsWNX8SpT0doEYQ/2hxDOoO+HsM8iSnfAVeJ6rbI7nKcpE
 6ltlgfpKq0ndwkrMg81NfHVxLGOvjzy7e5XFyb6MjU5YbB6QAnFpo3tcgf1rXlcBTC+qsU5u
 bHm2wbGB5sPAQ1/VZ6EZPWqxlK3nH4chOMrARWUfYkJJRy9/dg4MTH1g982P9oId0fJyAya4
 ADKUx0Wkvac8YY6/e7Aib2As4r0QfB1GVBXHjeH4LvvbXva82OvzJVuSuGNeTyBBmr49L/7N
 bde1fjjPvodkBBHtpc6ErotxL9nv4njoLpTzwJFGnTXbg31VO8/ciPbhJhC7/QfyKVYtA26X
 lO01uNbYbjZatn4FFMxJRY+arrR3/8jmg7UsaY/LnLltX1+87ewWElPOwWB1X5GJ7xvPYJ7n
 eostZJE6wG7jRZ2YN+KgjoOrDaGL2AbFa49v44UB5XnzAcu1xdDbdrVF3ausp2IbtxNNGgsI
 yOV3fSc2+sMnBebIndjR2LQ2ed9hIgVvE4YxlE1J2OPxojPiMgojU9Y/jkARwhIyglKjrBoM
 W9xOkwreaiDo2VyiM5YUzz+Eg1NHkbDqBKpjgFVziiDHwzyCjCLN3E0JeeGulwB/GMadT9eu
 riFkT63XTHvdcD3/y0zRU889aK/Eowrq1STlZD1BdmBErk7fSHh3v2ka10O+knuDs4GjUHao
 fVnobRrYqrhOC9O/6A2BuF2D1jLpMxo+YCafcxcwQ==
IronPort-HdrOrdr: A9a23:hi6ySquSu5Wubpl9PZaMulUo7skDptV00zEX/kB9WHVpm6yj/f
 xGUs5rtiMc7wxhPk3I+OrwX5VpIxvnmKKdhLN8AV7MZniFhILFFuBfBM7Zsljd8k7Fh5ZgPM
 VbHJSWYeeYZTNHZITBkW2F+r0bruVvnprJuQ6T9QYVcenkBpsQlDuREjzrbXGeWjM2eabRy6
 DsnPaudlKbCAkqUvg=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 02 Nov 2022 18:05:19 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2A27ZEnL1305925
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 2 Nov 2022 18:35:15 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2A27ZEnL1305925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667374515; bh=jdqfJ/7L1SS9h8mooS8E6aPM1ZHI92+1p8QkgVcGULA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=r3l61dRHlU13AXXe8tTxmea5nIkWstLgbVkCZtwYGoCil6eXMB5KJ9tbyKl1XvUEb
         RzNyR5ppnsUtmtoLbMISX0FWb4wuUTpy4ivL3DQIQH6HKlh0E3HH9KRwQpYzGN9nQp
         bwwVRmyiuGvEyjlnc8uPdZyr356G+yMwlid4qdXQRySRaeYv+ptm/bVXuuM08R1ByZ
         ll35Nq6S7yzlZ/pK9QKOaAH4ElikRtXB23whS3uKtClG6ZCimXf1kBFuf9G9m+pMUw
         x68M+Kn5dvPqtt7G1krFsL02LbdoGFhpkbJPVW1AYaP8LJgVw9hsL9Qgg9q5/6FRaz
         dqzRUnqhHUDeg==
Message-ID: <8d00fbea0526ad8f8d8a954963186a4ffcca5ca4.camel@crawford.emu.id.au>
Subject: Re: [PATCH v3 1/1] hwmon: (it87) Add DMI table for future extensions
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Wed, 02 Nov 2022 18:35:14 +1100
In-Reply-To: <20221101143736.GA1311791@roeck-us.net>
References: <20221030083841.3433967-1-frank@crawford.emu.id.au>
         <20221101143736.GA1311791@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 02 Nov 2022 18:35:15 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter,

First, thanks for your comments, it has forced me to look at some of
the other kernel functions and I've learnt from it.

On Tue, 2022-11-01 at 07:37 -0700, Guenter Roeck wrote:
> On Sun, Oct 30, 2022 at 07:38:41PM +1100, Frank Crawford wrote:
> > Changes in this patch set:
> >=20
> > * Define the DMI matching table for board specific settings during
> > the
> > =A0 chip initialisation and move the only current board specific
> > setting
> > =A0 to this new table.
> >=20
> > * Export the table for use by udev.
> >=20
> > v2: updates following comments:
> >=20
> > * Converted to use callback function.
> >=20
> > * Moved call to callback funtion to sio_data into it87_find in line
> > =A0 with other settings for sio_data.=A0 This requires dmi_data also
> > passed
> > =A0 to access additional data.
> >=20
> > * Added macro for defining entries in DMI table to simplify future=20
> > =A0 additions.
> >=20
> > * Note dmi_data is defined in sm_it87_init to simplify tests and
> > for
> > =A0 future additions.
> >=20
> > v3: further updates following comments:
> >=20
> > * Proper use of callback functions for DMI functions.=A0 This also
> > =A0 involves saving dmi_data in a static variable for use as
> > required.
> >=20
> > * Moved to dmi_check_system() for testing DMI table.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++--------
> > ----
> > =A01 file changed, 53 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 73ed21ab325b..6eac15a5f647 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -567,6 +567,14 @@ struct it87_data {
> > =A0=A0=A0=A0=A0=A0=A0=A0s8 auto_temp[NUM_AUTO_PWM][5];=A0=A0/* [nr][0] =
is
> > point1_temp_hyst */
> > =A0};
> > =A0
> > +/* Board specific settings from DMI matching */
> > +struct it87_dmi_data {
> > +=A0=A0=A0=A0=A0=A0=A0u8 skip_pwm;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* pwm channels to skip for this
> > board=A0 */
> > +};
> > +
> > +/* Global for results from DMI matching, if needed */
> > +static struct it87_dmi_data *dmi_data =3D NULL;
> > +
>=20
> static variables do not need to be initialized with NULL/0.

Okay, will drop it in the next version.
>=20
> > =A0static int adc_lsb(const struct it87_data *data, int nr)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int lsb;
> > @@ -2393,7 +2401,6 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int err;
> > =A0=A0=A0=A0=A0=A0=A0=A0u16 chip_type;
> > -=A0=A0=A0=A0=A0=A0=A0const char *board_vendor, *board_name;
> > =A0=A0=A0=A0=A0=A0=A0=A0const struct it87_devices *config;
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0err =3D superio_enter(sioaddr);
> > @@ -2812,24 +2819,9 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0=A0=A0=A0=A0=A0=A0if (sio_data->beep_pin)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Beeping is sup=
ported\n");
> > =A0
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
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s=
io_data->skip_pwm =3D BIT(1);
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > -=A0=A0=A0=A0=A0=A0=A0}
> > +=A0=A0=A0=A0=A0=A0=A0/* Set values based on DMI matches */
> > +=A0=A0=A0=A0=A0=A0=A0if (dmi_data && dmi_data->skip_pwm)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->skip_pwm |=3D d=
mi_data->skip_pwm;
>=20
> The second condition is unnecessary. If dmi_data->skip_pwm is 0 the
> |=3D
> won't do anything.

Okay, will also drop that.
>=20
> > =A0
> > =A0exit:
> > =A0=A0=A0=A0=A0=A0=A0=A0superio_exit(sioaddr);
> > @@ -3307,6 +3299,46 @@ static int __init it87_device_add(int index,
> > unsigned short address,
> > =A0=A0=A0=A0=A0=A0=A0=A0return err;
> > =A0}
> > =A0
> > +/* callback function for DMI */
> > +static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0dmi_data =3D dmi_entry->driver_data;
> > +
> > +=A0=A0=A0=A0=A0=A0=A0if (dmi_data && dmi_data->skip_pwm)
>=20
> A dmi entry without dmi_data would be pointless, or am I missing
> something ? That means that checking for dmi_data should be
> unnecessary
> because it should always be set (and anyone trying to add an entry
> into
> the match table without it would learn quickly that it does not
> work).

For this simple case, true, but one of the patches I would like to put
up shortly is one that is used the callback to set a second chip in
configuration mode before accessing the first chip.  This appears to be
a common requirement for all recent boards that have 2 chips, but not
for those boards that have only a single chip.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Disabling pwm2 d=
ue to hardware
> > constraints\n");
> > +
> > +=A0=A0=A0=A0=A0=A0=A0return 1;
> > +}
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
> > +#define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
> > +=A0=A0=A0=A0=A0=A0=A0{ \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.callback =3D cb, \
>=20
> Do you envison more than one callback function ? Because if not
> the above could just point to it87_dmi_cb directly.

Yes, see the note above.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.matches =3D { \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0D=
MI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor),
> > \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0D=
MI_EXACT_MATCH(DMI_BOARD_NAME, name), \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}, \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.driver_data =3D data, \
> > +=A0=A0=A0=A0=A0=A0=A0}
> > +
> > +static const struct dmi_system_id it87_dmi_table[] __initconst =3D {
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", &it87_dmi_=
cb,
> > &nvidia_fn68pt),
>=20
> The callback function does not need a &

Okay, will fix that.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0{ }
> > +
> > +};
> > +MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
> > +
> > =A0static int __init sm_it87_init(void)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int sioaddr[2] =3D { REG_2E, REG_4E };
> > @@ -3319,6 +3351,8 @@ static int __init sm_it87_init(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0if (err)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return err;
> > =A0
> > +=A0=A0=A0=A0=A0=A0=A0dmi_check_system(it87_dmi_table);
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < ARRAY_SIZE(sioaddr); i++) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memset(&sio_data, 0, si=
zeof(struct it87_sio_data));
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0isa_address[i] =3D 0;
> > --=20
> > 2.37.3
> >=20
Regards
Frank
