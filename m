Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-sn1nam02on0051.outbound.protection.outlook.com ([104.47.36.51]:4416
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725774AbeKFIyc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 03:54:32 -0500
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Woods, Brian" <Brian.Woods@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Date: Mon, 5 Nov 2018 23:32:16 +0000
Message-ID: <20181105233212.GC27399@amd.com>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181105193840.GA26868@zn.tnic> <20181105203330.GB27399@amd.com>
 <20181105214233.GF26868@zn.tnic>
In-Reply-To: <20181105214233.GF26868@zn.tnic>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E504987A545264D9697EBF47F59C3D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 10:42:33PM +0100, Borislav Petkov wrote:
> Yes please. Because this is the usual kernel coding style of calling a
> function (or a loop which has some result in this case) and testing that
> result immediately after the function call.

Done.

> You say "correct" as there is a special one. But the text before it says
> they're "functionally the same" wrt DF/SMN access so it sounds to me
> like we wanna map the first one we find and ignore the others.
>=20
> I.e., we wanna say
>=20
> "... so the DF/SMN interfaces get mapped to the *first* PCI root and the
> others N-1 ignored."
>=20
> Or am I misreading this?
>=20
> Thx.
>=20
> --=20
> Regards/Gruss,
>     Boris.
>=20
> Good mailing practices for 400: avoid top-posting and trim the reply.

Your understanding is correct.  It's more so that the following DF/SMN
interface gets mapped correctly.
		/*
		 * If there are more PCI root devices than data fabric/
		 * system management network interfaces, then the (N)
		 * PCI roots per DF/SMN interface are functionally the
		 * same (for DF/SMN access) and N-1 are redundant.  N-1
		 * PCI roots should be skipped per DF/SMN interface so
		 * the following DF/SMN interfaces get mapped to
		 * correct PCI roots.
		 */
Does that read clearer?

--=20
Brian Woods
