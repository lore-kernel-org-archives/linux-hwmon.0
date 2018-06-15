Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr700066.outbound.protection.outlook.com ([40.107.70.66]:13584
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753726AbeFOWP1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Jun 2018 18:15:27 -0400
From: "Grimm, Jon" <Jon.Grimm@amd.com>
To: Rudolf Marek <r.marek@assembler.cz>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
CC: Guenter Roeck <linux@roeck-us.net>,
        Chris Ouellet <rabbit.of.war@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: Ryzen 2700 Temperature offset?
Date: Fri, 15 Jun 2018 22:15:24 +0000
Message-ID: <MWHPR12MB14073E683C1B8438D11EA963E47C0@MWHPR12MB1407.namprd12.prod.outlook.com>
References: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
 <20180607154915.GA7061@roeck-us.net>
 <54EAD835-C48D-4751-9BFF-71536241129A@canonical.com>
 <20180610051420.GA22601@roeck-us.net>
 <abf1f966-f56f-70f2-7c79-047b31fc066f@assembler.cz>
In-Reply-To: <abf1f966-f56f-70f2-7c79-047b31fc066f@assembler.cz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Rudolf,=20

Yeah, let me do some checking.  I was already aware that our docs were miss=
ing this information; need to check if there are actual plans to address or=
 not. =20

Best Regards,=20
Jon


> -----Original Message-----
> From: Rudolf Marek <r.marek@assembler.cz>
> Sent: Friday, June 15, 2018 4:57 PM
> To: Kai-Heng Feng <kai.heng.feng@canonical.com>; Grimm, Jon
> <Jon.Grimm@amd.com>
> Cc: Guenter Roeck <linux@roeck-us.net>; Chris Ouellet
> <rabbit.of.war@gmail.com>; linux-hwmon@vger.kernel.org; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>
> Subject: Re: Ryzen 2700 Temperature offset?
>=20
> Hi Jon,
>=20
> Please can you help?
>=20
> Thanks
> Rudolf
>=20
>=20
> Dne 10.6.2018 v 07:14 Guenter Roeck napsal(a):
> > On Sun, Jun 10, 2018 at 03:03:47AM +0800, Kai-Heng Feng wrote:
> >> at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >>> On Thu, Jun 07, 2018 at 11:03:13AM +0800, Kai Heng Feng wrote:
> >>>> Hi Guenter,
> >>>>
> >>>> A user thinks the Ryzen 2700 temperature may not be correct [1].
> >>>> Can you take a look when you have time? Thanks.
> >>>>
> >>>> Also, where can I find all these temperature offsets? I googled but
> >>>> with no result.
> >>> Problem is that the offsets are not documented in public, making it
> >>> difficult to find out. For Ryzen 2700, there is currently no offset
> >>> configured; I was told that there is none. For Ryzen 2700X, the
> >>> offset is 10 degrees C.
> >>
> >> I am still quite interesting where you get this information...
> >>
> > Primarily lots of online research. Windows tools usually support the
> > offsets, so screendumps help in some cases.
> >
> >>>
> >>>> [1] https://bugs.launchpad.net/bugs/1774817
> >>>
> >>> The key here is the commit mentioned in the log (1b59788979acd). It
> >>> does not only adjust the per-CPU offset, but also takes a
> >>> configurable offset of 49 degrees C into account. You'll need to
> >>> apply that patch in your kernel, or the temperature may be off by 49
> degrees C.
> >>
> >> So unless AMD shares these offsets value, we can never know what
> >> correct offsets are?
> >>
> > Unfortunately that is correct.
> >
> > AFAIK the information is available from AMD under NDA. I can not sign
> > such an NDA, and even if I could and would, I could not use the
> > information in an open source driver. Kind of a loose-loose situation.
> > If you (Canonical) have any influence at AMD, it might be useful to
> > let them know that their policy is not very helpful.
> >
> > Guenter
> >
> >
> >> Kai-Heng
> >>
> >>>
> >>> Hope this helps. If not, please let me know. Note that I am
> >>> travelling; responses may be delayed.
> >>>
> >>> Guenter
> >>
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe
> >> linux-hwmon" in the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hwmon"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
> >
