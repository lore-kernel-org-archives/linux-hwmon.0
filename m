Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD9BC636D3
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Jan 2023 22:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjA3WTr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 17:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjA3WTq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 17:19:46 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9163439B86
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 14:19:43 -0800 (PST)
IronPort-SDR: q5ZwsKMKChqASMnUGM/jdIr1mI/rJYNR9Upas7vAko7TUihm7sHfukahwVX+jTH8CWqL9Whj9T
 F3CHnMnqN9We3ZqXqcfK9dBLzpIoozc2h5rgJAyE0SuqykeGmHV4bZF+S8RzW4s8lhIA6wiIDT
 ZaHjTfMcQ+YoOPBWg1cAy7+hHdL2HeTU0tSNl/x5Jqq4HVa+y/dnWfpv/Grp8aRwZPkLsrTJGQ
 eYpLDDbUsy/Pj6Bhx7r7PFrLkqXTUFbMw0FIGrigZKmlPEDvqBgcnKBNOOR6tG80RGLOnzbR/Q
 FR87H2QE6XSbhHAcTqoh6wVn
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ApAAAvQdhjjPQc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAJgTQEAQEBCwGCLIJglW0DnT2Bfg8BDwEBRAQBAYUHAoUlJjYHDgECB?=
 =?us-ascii?q?AEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgQUAQEBAUBSBwtSBwtYBweBQQuBY?=
 =?us-ascii?q?RMLAzENhlUBAQEBAgFAAQE3AQQLCw4KLlcGE4J+gwAjqV94gTSBAYIIAQEGg?=
 =?us-ascii?q?mOaZoFeCYFAAYxeg016Qz+BToJRgW4+hESGP44zjUEKgTl3gSUOgUaBDwIJA?=
 =?us-ascii?q?hF0TTcDGSsdQAMLOzIKPzULC0orGhsHgQYqKBUDBAQDAgYTAyICDSgxFAQpE?=
 =?us-ascii?q?w0nJmkJAgMiXwUDAwQoLQk/BxURJDwHVjcBBQIPHzcGAwkDAh9Pci4REwUDC?=
 =?us-ascii?q?xUqRwQINgUGGzYSAggPEg8GJkMOQjc0EwZcASkLDhEDUIFOBC+BYgYpJp5Yc?=
 =?us-ascii?q?oEOTAKBI05ikg8KkC+gMoN/gVKfSoFEgjWMYphUl0+CTYE6niCFQwIKBxaBa?=
 =?us-ascii?q?AGCDk0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dDA0JggqUKGE7AgcLA?=
 =?us-ascii?q?QEDCYwjAQE?=
IronPort-PHdr: A9a23:kvuQPBew6jd37PKn2R//EokmlGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:JW2M5Kr5qyBdCA+ML0N3cifxaoNeBmIsYxIvgKrLsJaIsI4StFCzt
 garIBmCOPyONmagfNsjPIngpExUsMTczNZkTAto/C9mHixAp5HPXo7EcxivYynJdJfIFUxrs
 ssTYICZd5k5EiKBqxmhG7Ww9nMUOYOgH+qkUrSYUsxSqa6IbA971HqPTsZg2tYAbeCRWl/L4
 ZWoyyHmEAfNNwRcawr41orawP9RlKSq0N8nlgRWicBj5DcyQFFIZH63DfjZw0rQGuG4LMbjL
 wrw5O3RElfiwvsYIojNfoAX06E9auW60QCm0hK6UkU56/RIjnRaPq0TbJLwZarL4tmEt4gZ9
 TlDiXC/YT0FP/L+w7hDajljHSMgP58Z3uDpM2fq5KR/z2WeG5ft6/9vEFpwNpcR5ehwG20I+
 PkFbjEBKBme7w606OzjDLMw3IJ5fI+xYN93VnJIlFk1Cd4oW5nFQI3B/9ZH0jAqioZDGOuYZ
 sZfYCcHgBHoP0EWYwlNWMxg9AuurkbEdz0Fp2/SmacIu2eU0gNN2Z3DE/OAL7RmQu0Oxh3I/
 DiXl4jjOTkeNdqC2X+F7XergMfRki7hHoEfDru18rhtmlL77m4fBRkIXEG2ieKkkUP4UNVaQ
 2QQ+ywzvYAo80GgTZzgRFu+rWLsg/IHc4QIVrdmskTXmu+Ov1rfHXQNUj9KLsA+u85wTjsvk
 FaU9z/0OdBxmIe5SC2vrevKlBOJNypLL11dQ3AqXxRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2e97YSkjifnTwLzXv96/jt2SFV5qv1m/snaNt14gPtb9OeRE/HCBtZ59wJClok6pl
 UVsdyK21/ECC5yc/MBmaL9VROnBCxqtFjDDyWVoAoUhvwuk/3O4Fb28DRkgfAIzbpxBI2+sO
 hOP/xhN7YNSNz22daB2JYm2DoIj0MAM9OgJtNiIM7KigbArL2drGR2CgmbKgwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8+mlkz8jeHFOiHFIVvgDLdoRr5ihE9jiFuIm
 +uzy+PQm32zrcWkPXKMqtNJRbz0BSVkWc+twyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iMyg5AI4DqL4j9RrXywRwZAj0s5XiCK7zhJoim2wfLeV2qLwyk64kJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwtBRaSf4AMKUi8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQvxV+k9eybX0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2/Cf3ekFmRvPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA68aG5EIUupwCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:RkUs4KBvT2rifJflHel655DYdb4zR+YMi2TDt3oadfWaSL36qy
 nIpoV86faUskd3ZJlD8ersBEDkex/hHPFOkOss1NuZPTUO/VHYSb2KjrGSuwEIeReQygc178
 4JGJSWSueAaWSS5vyV3ODXKbYdKZW8gdmVbWiy9QYXcehzUdAf0+5iMHflLqRpfng7OXPnLu
 vn2iKXzwDQBEgqUg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 31 Jan 2023 08:49:39 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30UMJYa1468648
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 31 Jan 2023 09:19:35 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30UMJYa1468648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1675117175; bh=/UZfRwZi9BE45wteMDhhuMApF5OalX6FPZ2px/UgKnY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=a94EHWd5aHUwWJ/LKpapufcirDjWXZUHTjqdkjMH6k170Jd0qjeDfjlfbW5lXr6JF
         XOZCd2n3bXwGO69V1Jr37CCe32hB7gETgWByzpXZXSOVdYsX6feGxDJ1gq0aIp7Bs1
         eLH3Y5KB12S14g/SCp5HUNiZQpDMlLgBSXxWlXg35nVfKN1o7eOt7yJzMqJo3g7ntN
         6Iz5aZ4e7cGp7WZuO8xr1z8u4JHkNv73IKbFVvb+4WQ14LmKg+H3oIxvKFptRcL+ne
         cFBS4vHFplCkj9EiDTb7/clesbeJ+7rUPEKYN4lxieLKBGbQbJlgiV22ir5v1Ckar7
         BQB/+kp7vC9mg==
Message-ID: <781a5ba5a5c96d289e96e2697204664120fc5477.camel@crawford.emu.id.au>
Subject: Re: [PATCH v3 1/7] hwmon: (it87) Allow disabling exiting of
 configuration mode
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Tue, 31 Jan 2023 09:19:34 +1100
In-Reply-To: <1d51e281-15a9-7997-acbd-6ea1518ef596@roeck-us.net>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
         <20230128060308.1549707-2-frank@crawford.emu.id.au>
         <20230129205647.GA1951466@roeck-us.net>
         <1d51e281-15a9-7997-acbd-6ea1518ef596@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Tue, 31 Jan 2023 09:19:35 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 2023-01-30 at 10:42 -0800, Guenter Roeck wrote:
> On 1/29/23 12:56, Guenter Roeck wrote:
> > On Sat, Jan 28, 2023 at 05:03:02PM +1100, Frank Crawford wrote:
> > > Disabling configuration mode on some chips can result in system
> > > hang-ups and access failures to the Super-IO chip at the
> > > second SIO address. Never exit configuration mode on these
> > > chips to avoid the problem.
> > >=20
> > > This patch should be applied in conjunction with a previous one
> > > to
> > > initialise the second chip for certain mother boards.
> > >=20
> > > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > > ---
> > >=20
> > > v3:
> > > =A0 * Correct possible uninitialised pointer issue.
> > >=20
> > > v2:
> > > =A0 * Convert to use feature flag and related macros rather than a
> > > separate
> > > =A0=A0=A0 field, as suggested in review.
> > > =A0 * Reverse sense of flag in superio_exit to simplify feature
> > > macro.
> > >=20
> > > ---
> > > =A0 drivers/hwmon/it87.c | 26 ++++++++++++++++++--------
> > > =A0 1 file changed, 18 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > > index a8a6a0ffee82..923a9563be92 100644
> > > --- a/drivers/hwmon/it87.c
> > > +++ b/drivers/hwmon/it87.c
> > > @@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
> > > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > =A0 }
> > > =A0=20
> > > -static inline void superio_exit(int ioreg)
> > > +static inline void superio_exit(int ioreg, bool noexit)
> > > =A0 {
> > > -=A0=A0=A0=A0=A0=A0=A0outb(0x02, ioreg);
> > > -=A0=A0=A0=A0=A0=A0=A0outb(0x02, ioreg + 1);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!noexit) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0outb(0x02, ioreg);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0outb(0x02, ioreg + 1);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > =A0=A0=A0=A0=A0=A0=A0=A0release_region(ioreg, 2);
> > > =A0 }
> > > =A0=20
> > > @@ -300,6 +302,13 @@ struct it87_devices {
> > > =A0 #define FEAT_PWM_FREQ2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0BIT(16)=A0/* Separate pwm
> > > freq 2 */
> > > =A0 #define FEAT_SIX_TEMP=A0=A0=A0=A0=A0=A0=A0=A0=A0BIT(17)=A0/* Up t=
o 6 temp sensors
> > > */
> > > =A0 #define FEAT_VIN3_5V=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0BIT(18)=A0/* VI=
N3 connected to +5V
> > > */
> > > +/*
> > > + * Disabling configuration mode on some chips can result in
> > > system
> > > + * hang-ups and access failures to the Super-IO chip at the
> > > + * second SIO address. Never exit configuration mode on these
> > > + * chips to avoid the problem.
> > > + */
> > > +#define FEAT_CONF_NOEXIT=A0=A0=A0=A0=A0=A0=A0BIT(28)=A0/* Chip shoul=
d not exit
> > > conf mode */
> >=20
> > Feature bits are supposed to be numbered sequentially, not randomly
> > assigned. Please use bit 19.
> >=20
>=20
> Given that the commit window is coming up, and since I don't have
> other issues with your series, I am inclined to apply it with the
> bit changed. Please let me know in the next day or two if this is
> acceptable for you. If not, the series will have to wait until v6.4.
>=20

Yes, I'm okay with that.

I was planning to submit an update with the only changes being both of
your changes in your previous comment, but the second one can wait for
a later group if you are happy with that.

> Thanks,
> Guenter
>=20
Regards
Frank
