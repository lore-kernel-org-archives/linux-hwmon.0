Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9373AD529;
	Sun, 23 Aug 2026 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517167; cv=pass; b=I5mo13TJ0rpcOvy45uY88RzfYaFzv3kVxULkyRyo2GiaV79GSQMcNEN3FUgvMZv6PjV5RmzXKkRjaRi2stZAqRZIiP9B2JobDltZqwGghwLBQ9v1Hd8UhRLFm4x27KmTJptJqBsPfnhTxaRl65jvvO9yfrVbv5TyD7s3gaNct9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517167; c=relaxed/simple;
	bh=vWv/9uqbdhsVPqC1VYl7vWT5qJFJqk7rQoyrOQh3ha4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iJAB9PgeyhYqIYtf3flJCyVQuk+EmnEdHOwzeOZbpobfSQdHexIK014v4v6yaFy7rToqRUr3Dvl7aUsPIGO1FVQEmt8DINrNKC8KE5ZY4cPCB/2uyu6d8EJ7jw17bLWwqBNjAqdtAjIorb+el+PAIZuCFfNLN0H8yGD/HWMDVEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=JG2ihnbL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="JG2ihnbL"
ARC-Seal: i=1; a=rsa-sha256; t=1787517142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ct7DWFB5zi8v+8x6l43mkMXLCxv32DWtj5IlekMDjCm1cCX0yDAs1y2SDzosS6CHcIbDOny86l6c0Q0/D0sIo97/tNotZvGnsp44fMCs8wjW2M3IpPwTOL+K9wF9R7aw1YocAmWDUJm1aTPMA/I4l0vahcZ1cvFmLWo7VeKL/+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787517142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kMaKoY0hAHBYSpuaxTpAu4dg90Ux5TNajhWOudihe3c=; 
	b=YXRA8keGehxTkQHqPp2F32bjiR96HYx46j51Bbv9dL6ilySiulkGD1njL6WFa5jxsW3f2eITI2eZeeEs16eMwp3VlyOTn2ZmvNt5obBVZINpLS/4ib5mB2xlNjqppTKPTji4MdripEQrQdXACcQXcNeblTbzhsHHBb22561iJi4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787517142;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=kMaKoY0hAHBYSpuaxTpAu4dg90Ux5TNajhWOudihe3c=;
	b=JG2ihnbLpOqxRWbjoPQ40Nhz+DhKuel6cQR6q7vhMGTqexUE7aPo+ptVZ2ztzL/v
	Aiul8e3P677DSw+E+l35FULg1gdael8/8WIldtnJl9q3sRgfMP062IyoX5T1br89o22
	RfUOcT7R/JllDju5sWw4cJF43nVFu+V2BRwvFha0NoH4uxroVUM9XcwPVIC0JUEoYVG
	dMfAp5sE7ilzCJ8uSG4rT64++Qw6Ouj+aIVcxO1aIsKG4pWgPW6GWTzgsObDaV6bZrt
	nrZKXpoIL8/tg6BsLAFnym79DGnUMEoNCMUEVR3ds41r0ai4pvVscDtngVC+IagI4XZ
	iXTHL5FHXA==
Received: by mx.zohomail.com with SMTPS id 1787517140531745.8616595742548;
	Sun, 23 Aug 2026 13:32:20 -0700 (PDT)
Message-ID: <6c510749d917c284f2b78a3757727391df150eba.camel@rong.moe>
Subject: Re: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan
 controls
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Aditya Dash	
 <mradityadash@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <782FE636-A06A-4E12-9563-786374805947@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
		 <3dca1e1efa285d8644b8ac681a5fb41742ce06a6.camel@rong.moe>
		 <782FE636-A06A-4E12-9563-786374805947@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 04:24:35 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Derek,

On Sun, 2026-08-23 at 13:08 -0700, Derek J. Clark wrote:
> On August 23, 2026 12:32:02 PM PDT, Rong Zhang <i@rong.moe> wrote:
> > Hi Aditya,
> >=20
> > On Sat, 2026-08-22 at 03:17 +0530, Aditya Dash wrote:
> > > Capability Data does not cover all fan controls on the Legion Go. Ful=
l
> > > Speed uses a separate Other Mode feature, some firmware exposes an RP=
M
> > > reading that Capability Data does not advertise,=C2=A0
> > >=20
> >=20
> > "does not advertise"
> >=20
> > Really? Please dump capdata via debugfs and attach it.
> >=20
> > > and the custom fan table
> > > uses a separate Fan Method WMI interface.
> > >=20
> >=20
> > The hwmon part of lenovo-wmi-other was done by me. Please CC me in your
> > next revision.
> >=20
> Hi Rong,
>=20
> I'd ack if you wanted to add yourself as a maintainer of the Lenovo drive=
rs so you get picked up by the kernel scripts. Otherwise people won't know =
to Cc you.

Thanks for that. I will do so the next time I post patch series for
Lenovo drivers :-P

Cheers,
Rong

>=20
> > > Patches 1 and 2 add Full Speed and the RPM fallback to the existing H=
WMON
> > > device. Patch 3 adds a Fan Method driver and attaches the ten curve p=
oints
> > > to that device when both WMI interfaces belong to the same provider. =
Other
> > > Mode continues to work without Fan Method.
> > >=20
> > > The open question is how the firmware control range should map to HWM=
ON.
> > > On the tested Legion Go 8APU1, values from 0 through 115 produce the
> > > observable fan response and correspond to Lenovo's 0 through 115 perc=
ent
> > > range. Lenovo software shows 0 through 100 percent to the user, and 1=
15
> > > reaches the RPM observed in Full Speed mode. Firmware accepts values
> > > through 255, but no RPM increase was observed above 115.
> >=20
> > This is what we've observed in Fan Test Data. We chose to enforce
> > constraints according to it and relax it when users set an module
> > parameter.
> >=20
> > >=20
> > > This series keeps the native values unchanged and exposes the fixed
> > > temperatures as read-only automatic points. Should the driver map the
> > > effective 0 through 115 range to the standard HWMON 0 through 255 sca=
le,
> > > or keep the native firmware values unchanged?
> >=20
> > In your case, if there is no range data to query, I'd prefer enforcing =
0-
> > 100 by default and relaxing it=C2=A0when appropriate range data is prov=
ided by
> > module parameters or DMI table.
> >=20
> > The range should always map to hwmon pwm 0-255.
>=20
> Concur on both counts.
>=20
> > As far as I can recall, Derek once said that he planed to introduce fan
> > curve support for Legion Go, so I think he has some helpful ideas.
>=20
> I'll post a full review once I've had time to test and review the documen=
tation again.
>=20
> Cheers,
> Derek
>=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > > Aditya Dash (3):
> > >   platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
> > >   platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
> > >   platform/x86: lenovo: Add Legion Go Fan Method curve driver
> > >=20
> > >  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
> > >  .../wmi/devices/lenovo-wmi-other.rst          |  14 +
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/platform/x86/lenovo/Kconfig           |  11 +
> > >  drivers/platform/x86/lenovo/Makefile          |   1 +
> > >  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
> > >  7 files changed, 649 insertions(+), 7 deletions(-)
> > >  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.r=
st
> > >  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
> > >=20
> > >=20
> > > base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
