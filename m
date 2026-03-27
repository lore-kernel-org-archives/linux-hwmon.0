Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28219391E79;
	Fri, 27 Mar 2026 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613226; cv=pass; b=WrPn39/S8d2ohkaWF5Ogn5sHRliMw008KuRU5AmpaYE+JKxK/fmnLlyQCsujeUZlWUykfcq/TBFOtxWc3jyCoeUGPnAbF350JxBDRDdFahZ0M8NsE//ZL/LigwGuEpKzkQ4rVAla5Ydlaq7sxDT/u8qE+xSvpM6YZ23OhmYOrG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613226; c=relaxed/simple;
	bh=ZBSzJYq6p5ibjTibx7DgOlLzHL9i8XOZtl2V5NQftiI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W3FfvpTqSqSoKj2KerLkB5z4Gya3rKMeRaGRg82tcJ+uGFyRW4FgHYZSxfqTxri9UuAZzTA1tHr2DyyTEzgfB6oSxf2j27m7+pPg+OGb0eWRki2xXGsiWdtZWqlfCn4wXKMKXfwlMJraMPhTXnIOuC0K+nA+Wzc1+Nb5uP8b9XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HiXM2gRd; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HiXM2gRd"
ARC-Seal: i=1; a=rsa-sha256; t=1774613208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G965FRQo/Ap+5Y7M8sEJhLfgaBh200qxfAHC1IHJtL30BzuOZZHXEyUQAkR5nFRFQfL37cTb1aVu9EFgQm3keV+qxtLfGggdcwcCf/p4llTQ2Iu21MDWGCZh1u0vCh9i5gEqnOqskwRdumhGwuR7oCjpQQ5PMLw3gOwqaOg2Jx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774613208; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jGSaN0Dnjg5CiJC57jK57Rw/xvasQeyZv3lb3s/NOeg=; 
	b=laP1k9JxHMLqHQu863H3de8XGbkGds2OmTkEIbOcI7FfrXpfnRXTwJVUuTSvyCriaKigqcun4rlCcFt/evwXkZOa4Jh/sMv+llfKyl8ujFb3GggNiAS3z5r7KjN1JIQAhUIPHYqwxoTxfRO6CET8CfJcD75xgIt4s0zSG3o8rhQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774613208;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jGSaN0Dnjg5CiJC57jK57Rw/xvasQeyZv3lb3s/NOeg=;
	b=HiXM2gRdG2fMBEyPCK1bBU5D7RuL6gZIIPq0t480AXfjauRJTnu7kqn5nilKsJGd
	Z4maS5wMBfWXd5Zv9xddBAO+CoGanbpSaqTqb39EUFu1Gncj+g4DgVdSLVLfBPrZrmy
	GfuIlpKajdof3t4FRDKnzAHiIMZ63QRRLWS7YsHin/6ofCT7T55JxxSbnV6nVdq5IPX
	II+yXyKmQ+jxDwX2S7udG0vgS6WytWQShzCvDEP9WkYjyov72uYWYKC/cKMTR7nzGcx
	eBGyzD0HlTomi4zmUR1iznnl6YDo3yYE2JazC7TPQEw4wIQBji/ZI5Irjahs1OQFlmo
	Y9C0qYMKxQ==
Received: by mx.zohomail.com with SMTPS id 1774613206111618.082637661207;
	Fri, 27 Mar 2026 05:06:46 -0700 (PDT)
Message-ID: <5ee967a8a4dca6f70e50c7fac382d4f91b6620aa.camel@rong.moe>
Subject: Re: [PATCH 0/4] hwmon: Add WITRN USB tester driver
From: Rong Zhang <i@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
In-Reply-To: <a3a8eb58-b2fa-411b-81be-eb70dac86b4f@roeck-us.net>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
		 <a3a8eb58-b2fa-411b-81be-eb70dac86b4f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 20:01:40 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Guenter,

Thanks a lot for your review and applying patch 1 :-)

On Thu, 2026-03-26 at 17:05 -0700, Guenter Roeck wrote:
> On 3/26/26 12:19, Rong Zhang wrote:
> > WITRN produces a series of devices to monitor power characteristics of
> > USB connections and display those on a on-device display. Most of them
> > contain an additional port which exposes the measurements via USB HID.
> >=20
> > These devices report sensor values in IEEE-754 float (binary32) format.
> > The driver must perform floating-point number to integer conversions to
> > provide hwmon channels. Meanwhile, they also report accumulative float
> > values, and simple division or multiplication turns them into useful
> > hwmon channels.
> >=20
> > Patch 1 adds label support for 64-bit energy attributes, as the driver
> > needs it.
> >=20
> > Patch 2 adds a helper module for floating-point to integer conversions,
> > so that the conversion, multification and division methods can be used
> > in this driver as well as other drivers (I am also working on another
> > USB tester driver that needs it).
> >=20
> > Patch 3 adds a barebone HID driver for WITRN K2.
> >=20
> > Patch 4 adds hwmon channels and attributes to the driver.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Rong Zhang (4):
> >        hwmon: Add label support for 64-bit energy attributes
> >        hwmon: New helper module for floating-point to integer conversio=
ns
>=20
> Nack. This is not a hwmon problem and should reside in a driver or in lib=
/
> (if it is needed by multiple drivers).

Makes sense. I will try.

>=20
> >        hwmon: Add barebone HID driver for WITRN
>=20
> Nack. This is the wrong place for such a driver. It should reside somewhe=
re
> in drivers/usb, or maybe in drivers/misc/.

Hmm, I decided to place it here because:

- It's not a hid_ll_driver but a dumb hid_driver, i.e., does no low
level things but just receives hid event from the HID core. It doesn't
even send any HID report to the device.

- There has been numerous hid_driver in drivers/hwmon/.

- There has been a similar USB tester driver in drivers/hwmon/, i.e.,
powerz. That's the major reason of my decision.

Could you kindly explain what kinds of driver can be accepted into
drivers/hwmon/?

>=20
> >        hwmon: (witrn) Add monitoring support
>=20
> This should be implemented as auxiliary driver.

Could you kindly elaborate? Did you mean that if the device supports
multiple functionalities they should be implemented as multiple
auxiliary drivers in different subsystems?

FYI, the USB tester doesn't provide any other meaningful feature that
fits other subsystems. The tester only provides two features through USB
HID: power measurements (this series), and raw PD packets sniffing.

As for the latter, the USB tester can sniff raw PD packets between the
source and sink if enabled in the device menu. It doesn't provide the
parsed result for packets, and the PC cannot ask the tester to send PD
packets. This doesn't fit UCSI at all, as a UCSI device operates at a
higher level and must accept commands. AFAIK such a dumb sniffer won't
fit any subsystem in the kernel. Hence, the only thing fits a subsystem
is its power measurements.

All measurements supported by the official utility for Windows can be
found in `struct witrn_sensor'. Other than that, all extra features
provided by the utility are implemented in software and I didn't see any
extra USB packets other than querying the serial number [1] when I was
randomly messing around with the utility [2].

I separated patch 3 and 4 just for easier review. If you are not in
favor of such a style, I will squash them.

[1]: In fact, the utility directly asks the device to return the content
on several specific ROM/RAM addresses, and then the utility calculates
the serial number with an unknown algorithm. Reading a ROM/RAM address
seems to be the only command that the device accepts from the USB host.

[2]: Yeah, their utility does not support PD packet capturing or
parsing. It seems that the manufacturer provides the PD sniffing feature
as is and expects users to capture it via hidraw or libusb and parse it
themselves.

>=20
> Sashiko has a lot of feedback that you might want to address before
> resubmitting.
>=20
> https://sashiko.dev/#/patchset/20260327-b4-hwmon-witrn-v1-0-8d2f1896c045%=
40rong.moe

Sashiko's feedback helps a lot. Thanks.

Thanks,
Rong

>=20
> Thanks,
> Guenter
>=20
> >=20
> >   Documentation/hwmon/index.rst |   1 +
> >   Documentation/hwmon/witrn.rst |  53 ++++
> >   MAINTAINERS                   |   7 +
> >   drivers/hwmon/Kconfig         |  14 +
> >   drivers/hwmon/Makefile        |   2 +
> >   drivers/hwmon/hwmon-fp.c      | 262 ++++++++++++++++
> >   drivers/hwmon/hwmon-fp.h      | 212 +++++++++++++
> >   drivers/hwmon/hwmon.c         |   1 +
> >   drivers/hwmon/witrn.c         | 691 +++++++++++++++++++++++++++++++++=
+++++++++
> >   9 files changed, 1243 insertions(+)
> > ---
> > base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
> > change-id: 20260327-b4-hwmon-witrn-a629b9040250
> >=20
> > Thanks,
> > Rong
> >=20
