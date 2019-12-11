Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C48DC43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 11:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EDD32073D
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 11:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=potuz.net header.i=@potuz.net header.b="bdEMTWbp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfLKLk2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 06:40:28 -0500
Received: from mail.potuz.net ([201.17.25.234]:38890 "EHLO mail.potuz.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727365AbfLKLk1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 06:40:27 -0500
X-Greylist: delayed 331 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Dec 2019 06:40:26 EST
Received: from vertex (unknown [147.65.4.161])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.potuz.net (Postfix) with ESMTPSA id 70B772C0311
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Dec 2019 08:34:52 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=potuz.net; s=whiskey;
        t=1576064092; bh=P3FzzPnUNNdSGJ08h3UCVw3abd2p5ksPoQERk5i6hDo=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=bdEMTWbpY8XcpQG4jwDMBd7AxI8iHPJ22Im1BDZf3+Z03E8N16Vedp5snZBTyiRqo
         y9352kVIZ1BijfaetZ8iIQMg0oxZOi9sooT0el6YAwNaPjd3SlwQrzKdZ+O83aHjIT
         jqxsQad2xZc/td2tFIXp83NycaO/dqS+9Mn+w07I=
Date:   Wed, 11 Dec 2019 08:34:46 -0300
From:   Reimundo Heluani <heluani@potuz.net>
To:     linux-hwmon@vger.kernel.org
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
Message-ID: <20191211113446.GA1084863@vertex>
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
 <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
 <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
 <20191202175224.GC29323@roeck-us.net>
 <CALUKdZ8GeTiSDieFnCeK_wTr52FoUcfZUYkco7wBL-2rO+Fe1g@mail.gmail.com>
 <20191202230953.GA9421@roeck-us.net>
 <CALUKdZ_fU8r6AjKU-RTLS9a+iXDsYZrp6yYN+texpo12JeFt6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <CALUKdZ_fU8r6AjKU-RTLS9a+iXDsYZrp6yYN+texpo12JeFt6w@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 02, Corey Ashford wrote:
>On Mon, Dec 2, 2019 at 3:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Mon, Dec 02, 2019 at 02:33:27PM -0800, Corey Ashford wrote:
>> > On Mon, Dec 2, 2019 at 9:52 AM Guenter Roeck <linux@roeck-us.net> wrot=
e:
>> > >
>> > > On Mon, Dec 02, 2019 at 09:07:10AM -0800, Corey Ashford wrote:
>> > > > On Mon, Dec 2, 2019 at 6:32 AM Guenter Roeck <linux@roeck-us.net> =
wrote:
>> > > > >
>> > > > > On 11/29/19 8:48 PM, Corey Ashford wrote:
>> > > > > > On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.=
net> wrote:
>> > > > > >>
>> > > > > >> On 11/29/19 6:11 PM, Corey Ashford wrote:
>> > > > > >>> Hello folks.  I am running a newly-built system that uses an=
 IT8686E
>> > > > > >>> chip.  Currently, the latest kernel from kernel.org doesn't =
have code
>> > > > > >>> in drivers/hwmon/it87.c to support it, however, I found some=
 source on
>> > > > > >>> the net which has added support for quite a few more variant=
s of that
>> > > > > >>> brand of Super I/O chip:
>> > > > > >>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
>> > > > > >>> I tried it out by building the module and "insmod"ing it int=
o my
>> > > > > >>> running system, and it appears to work fine.
>> > > > > >>>
>> > > > > >>> It seems the original developer had a difficult time pushing=
 the
>> > > > > >>> changes upstream, so he abandoned the project.
>> > > > > >>>
>> > > > > >>
>> > > > > >> I abandoned the project (and dropped the driver from my githu=
b page)
>> > > > > >> because people started _demanding_ that I push the driver fro=
m github
>> > > > > >> upstream, without offering any assistance whatsoever.
>> > > > > >>
>> > > > > >>> My thought was that I could add support for just the IT8686E=
 chip as a
>> > > > > >>> single patch, and since I can test it locally I would have a=
 better
>> > > > > >>> chance of getting the patch accepted.  The changes to the so=
urce at
>> > > > > >>> the above git tree have quite a number of changes that aren'=
t really
>> > > > > >>> necessary for supporting the IT8686E chip, so I think the pa=
tch could
>> > > > > >>> be pretty small, but will still credit the original author.
>> > > > > >>>
>> > > > > >>
>> > > > > >> IT8686 is a multi-page chip, meaning you'll need the entire p=
rotection
>> > > > > >> against multi-page accesses by the EC in the system. It also =
supports
>> > > > > >> the new temperature map. I don't think it is that simple.
>> > > > > >>
>> > > > > >> Guenter
>> > > > > >
>> > > > > > Thanks for the quick reply!
>> > > > > >
>> > > > > > When you said they didn't offer any assistance, do you mean as=
sistance
>> > > > > > with testing?  If so, how about if the support is trimmed out =
for the
>> > > > > > newly-added chips that have no available test system volunteer=
s, and
>> > > > > > then slowly add those back as people make test systems and tes=
ting
>> > > > > > time available.  Should I presume that you have access to one =
or more
>> > > > > > systems with the added ITnnnn chips?  I volunteer my system for
>> > > > > > testing the IT8686E support.
>> > > > > >
>> > > > >
>> > > > > Testing and, more importantly, detailed code review. No one but =
me has
>> > > > > seriously (if at all) scrutinized that code for years. Just pick=
ing it
>> > > > > into mainline and hope that it won't cause trouble is, by itself=
, troublesome.
>> > > > >
>> > > > > On top of that, the multi-page access problems are well known by=
 board vendors
>> > > > > using this chip as well as by the chip vendor. Yet, neither boar=
d vendors nor
>> > > > > ITE talk with kernel developers. The workarounds I implemented a=
re based on
>> > > > > information I got from one of the Windows tools developers, and =
are not
>> > > > > validated by any board vendor nor by ITE. Every board vendor I t=
ried to contact
>> > > > > tells me that they don't support Linux, and I never got any repl=
y from ITE.
>> > > > > I do know that the code causes problems on early Gigabyte board =
using the 8686
>> > > > > and similar multi-page chips. Just accessing the chip from Linux=
 may cause trouble
>> > > > > because the built-in EC tries to access it as well in parallel (=
I suspect this
>> > > > > causes the board to reset because that access is turned off for =
a while by
>> > > > > the driver). This is all fine for an out-of-tree driver, but it =
would be
>> > > > > unacceptable in the upstream kernel.
>> > > > >
>> > > > > In summary, you'll not only need to port the code, you'll also n=
eed to establish
>> > > > > contact to ITE and/or to board vendors to ensure that the code w=
orks as intended
>> > > > > with the EC on the affected boards.
>> > > > >
>> > > > > Guenter
>> > > >
>> > > > Ah, thank you for your detailed explanation.  How you did as much =
as
>> > > > you did is beyond me.  ITE's web site seems to lack any usable
>> > > > information, and doesn't even list the IT8686 as one of their chip=
s.
>> > > > Other "supported" chips don't appear to have any documentation eas=
ily
>> > > > available, other than a very generic-y description of the chip.  Q=
uite
>> > > > an uphill battle for marginal gain.
>> > > >
>> > > Exactly. The only real recommendation I have at this time is for any=
one
>> > > running Linux to stay away from boards with ITE chips.
>> > >
>> > > > Is it possible there's a way to access the sensors by using the EC=
 as
>> > > > a proxy, rather than trying to gain direct and exclusive access to=
 the
>> > > > sensors?  Just a thought.  I have no idea of the architecture of t=
hese
>> > > > things.  Your mention of EC was the first I had heard of it :/
>> > > >
>> > >
>> > > Not that I know of, sorry. The EC is actually running inside the Sup=
er-IO
>> > > chip(s). I have no idea if and how it is accessible from Linux. Eith=
er case,
>> > > that would be even worse, since EC programming is board vendor speci=
fic.
>> > >
>> > > Guenter
>> >
>> > Just for my clarification, it seems that what you're implying is that
>> > the embedded EC still uses the SMbus to access those paged registers,
>> > and so needs to use the same mechanism that an external device would
>> > use.  If that's true, ugh.  If it has its own private access to the
>> > entire register set in one "address space", it could bypass the paging
>> > mechanism.
>> >
>>
>> There are typically two Super-IO chips on those boards. For example,
>> Gigabyte B450 AORUS M has an IT8792 and an IT8686. The EC on one chip
>> accesses the other chip through the I2C interface. Or at least that is
>> what I think is happening... hard to be sure without board/chip vendor
>> support.
>>
I just got a new system with precisely that board B450 and after running se=
nsors-detect I was lead to this thread. Is it safe to try your out-of-tree =
module on this board of will it simply not work? I can provide extensive te=
sting for what it's worth.=20

R.=20

>>
>> Some of the recent chips solve the problem by memory mapping the entire
>> register space (unpaged) into memory. This way the Linux driver (and the
>> Windows driver) can access chip registers directly without having
>> to select a page. That isn't supported on the 8686, unfortunately.
>
>Ah, that makes sense now.  So I guess what's worse is that now you
>have a combination of two chips, which are not necessarily always
>paired with each other (e.g. IT8792->IT8686 vs. IT8795 [made up
>#]->IT8686). I give up :)
>
>At least the out-of-tree driver source has been working nicely for my
>machine for a couple of weeks, with no observed glitches, resets, etc.
>I'm happy.
>
>Thanks for the discussion of this little backwater area of the kernel :)
>
>- Corey

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE2Gqs1UGJjuNslA8FqoL39HIpaJkFAl3w1FYACgkQqoL39HIp
aJkDDg/+IQGvcAVDpMetY4kIq5TPNgy/O4lh4/l8Loa+IcIU4dXHHsWap1ykBQbj
id5bN0M9+oeb+YwRPCyxm+HfveicrcwgE53LqhADkTTKxUP8F+Lgyc+hyMNkSenk
/uCD6mycXTwhn8hpmH8pZa3zeG/dQRHghnxtR8Vc5vRlRMp+oUGEWSm7dGYnbfm8
0DA2RuXg8oOgvyjpBa92mwrmgxC7nQOEuAsTNtpPLcEC2qsVP4iU82qRZ0iilVQY
yszBaO0Q3nfU/fk8RAIyugRn6I5VclKlu2PLODQmPUO2A1J4O+B73NUddqaj1JGn
2UaYb93lDoP4KtvM17NEpRGjY0BycMPjr6Xao9KHM/mF1LmYIYhWO1qx0MyfMERK
J0/KdR48ZGUnfeWmYbpld8McTmMGjwDukuuCEiefo05WdM1ttIcTO7qyi9kisO1U
kTJTLZYs3b+141B2PuB/MoAWvLc757rq97lwHLVpJ/B53Qn0pVtdwmzSCqI4om8M
zwcrdl7A0QzQQmibpmPQjSCsDXKUF0XgiW5gaoG/BYHEegaTiEAnmBTcG04fwVOU
O0I1qEme0ieqlNata67O/vxRmMC49AfbsLEOLIRxlDzzmL80Pyoh75/voKE+B5ZT
G3DeAIjSUXU6XPlncLvMJpDR9c8eccIY0CWRN9yUeTn8w7bRPYw=
=A+bk
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
