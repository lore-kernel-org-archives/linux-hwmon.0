Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCA2550AF;
	Fri, 27 Mar 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632528; cv=pass; b=Mnvc7eV7pa5h5waodVfNYcpfxdzGaGP5EkcDV4PyQ46r1RjfKnuJe6d91mWNIpdS9TRPwHI7k1paAS3b5d8HFOvc9Rn9Agl26QH3p/To89WCGt3OQcL9GIL/YAzFDJ81wq1aJO3eXq19JofCRzknXB7fOLQhmSaE5s5U3i2mTuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632528; c=relaxed/simple;
	bh=BMBwIah1fZ+y8KvUtUrFV1aj5ueftmXr6RjnwpWkbCg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qC4bcDldPo617Qd+sZ6MKjAYAMPpPIzLOaJ77SnLpWPJ80QFE7hZlOEQCGj8iHl2xsAJhal2ReNxryRU1LC47K8mVpUr9nPisdfDaS1xzeG7gHgrKSiGvgb9FVgOI/tGKRNh2rA1v8d1GFoGkizxoZnp8ddI5ffGvrn/LCCuYkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iHvuhRbi; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iHvuhRbi"
ARC-Seal: i=1; a=rsa-sha256; t=1774632509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kfbBZk7ROGGx+MlfEd9i+iMV1Q7+HIKB3zVBkqtgXmdWVI3BgalcVDXj5Fvyg+C9Q71pdkxFoU6tvW84rElSdYghqvPY7d8mTjEM0E1C7FDGdD5BeM3SqXVeqsyPUrlnRp/UIR6b74MGDrYV5ExJ7ooaCy90eAYJPBhC8qjyOdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774632509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WWAaezSCgCRFZsEHwDR15h4rJ/Mue8H1oDbuFAMWAHw=; 
	b=XPSwXlr2bzD5BxLbShdDOeHZqQpmYLwEt7geRO7L36YQuqu3wEBzcp8oAPk35anD3iLVm3x5Bc1TMXmHd0D6LeN3v0N/bjPn6Ixr1HxHSyWxJV1DJROp9Dx5/zWGIUUN3fNAXnLPUFpKX8CAMvs+gZkHenfXoe07yLt6WwBwZ6s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774632509;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=WWAaezSCgCRFZsEHwDR15h4rJ/Mue8H1oDbuFAMWAHw=;
	b=iHvuhRbiOoXdLsoX+UxZg88bx838IiC1ONy8H1pzZU6/hGoOXD93oJQ3W3imfCn6
	KEpMWkEiItNTOnykgfO+JsAaEOQT/TE6xbgMg2b2MKppPLXaPQH966MPqWerdHfx8NK
	eellQC+Sl6K+s5IlUswQ8O5594vf6dDIJv2RuQnjF9b2PLIQEw3tn846+URed9Ej8Z4
	/QAjr9vN//SzAYWk79bfqg72FP4D0zykcZmsbMQ+ZkXlo3yGLIXjdbf7a1mi3DRyed7
	iaw1AM7UOoyze7G46o/Iv2VccEPo2OFeqT1H63MaDBCpPAKJr5w1h5MsyKgqA+DD4FL
	wQHM0ynA7Q==
Received: by mx.zohomail.com with SMTPS id 17746325077071017.7674197145918;
	Fri, 27 Mar 2026 10:28:27 -0700 (PDT)
Message-ID: <2ebd8af957f1f70a93b0ee8f7c9333924c269241.camel@rong.moe>
Subject: Re: [PATCH 0/4] hwmon: Add WITRN USB tester driver
From: Rong Zhang <i@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
In-Reply-To: <cc67f9e5-9f6d-40cd-bb89-9de0b084d42c@roeck-us.net>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
	 <a3a8eb58-b2fa-411b-81be-eb70dac86b4f@roeck-us.net>
	 <5ee967a8a4dca6f70e50c7fac382d4f91b6620aa.camel@rong.moe>
	 <cc67f9e5-9f6d-40cd-bb89-9de0b084d42c@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Mar 2026 01:23:22 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Guenter,

Thanks for your detailed elaboration. It's very helpful.

On Fri, 2026-03-27 at 08:42 -0700, Guenter Roeck wrote:
> On 3/27/26 05:01, Rong Zhang wrote:
> > Hi Guenter,
> >=20
> > Thanks a lot for your review and applying patch 1 :-)
> >=20
> > On Thu, 2026-03-26 at 17:05 -0700, Guenter Roeck wrote:
> > > On 3/26/26 12:19, Rong Zhang wrote:
> > > > WITRN produces a series of devices to monitor power characteristics=
 of
> > > > USB connections and display those on a on-device display. Most of t=
hem
> > > > contain an additional port which exposes the measurements via USB H=
ID.
> > > >=20
> > > > These devices report sensor values in IEEE-754 float (binary32) for=
mat.
> > > > The driver must perform floating-point number to integer conversion=
s to
> > > > provide hwmon channels. Meanwhile, they also report accumulative fl=
oat
> > > > values, and simple division or multiplication turns them into usefu=
l
> > > > hwmon channels.
> > > >=20
> > > > Patch 1 adds label support for 64-bit energy attributes, as the dri=
ver
> > > > needs it.
> > > >=20
> > > > Patch 2 adds a helper module for floating-point to integer conversi=
ons,
> > > > so that the conversion, multification and division methods can be u=
sed
> > > > in this driver as well as other drivers (I am also working on anoth=
er
> > > > USB tester driver that needs it).
> > > >=20
> > > > Patch 3 adds a barebone HID driver for WITRN K2.
> > > >=20
> > > > Patch 4 adds hwmon channels and attributes to the driver.
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > ---
> > > > Rong Zhang (4):
> > > >         hwmon: Add label support for 64-bit energy attributes
> > > >         hwmon: New helper module for floating-point to integer conv=
ersions
> > >=20
> > > Nack. This is not a hwmon problem and should reside in a driver or in=
 lib/
> > > (if it is needed by multiple drivers).
> >=20
> > Makes sense. I will try.
> >=20
> > >=20
> > > >         hwmon: Add barebone HID driver for WITRN
> > >=20
> > > Nack. This is the wrong place for such a driver. It should reside som=
ewhere
> > > in drivers/usb, or maybe in drivers/misc/.
> >=20
> > Hmm, I decided to place it here because:
> >=20
> > - It's not a hid_ll_driver but a dumb hid_driver, i.e., does no low
> > level things but just receives hid event from the HID core. It doesn't
> > even send any HID report to the device.
> >=20
> > - There has been numerous hid_driver in drivers/hwmon/.
> >=20
> > - There has been a similar USB tester driver in drivers/hwmon/, i.e.,
> > powerz. That's the major reason of my decision.
> >=20
>=20
> powerz is a pure hwmon driver, nothing else. It does not claim to be a
> "pure hid driver". If your driver _only_ provides a hwmon ABI, it would
> be acceptable. But then this and the next patch should be one patch,
> and it should only provide the hwmon ABI, nothing else (except maybe
> debugfs entries or sysfs entries attached directly to the HID device
> to display information such as serial number etc).=C2=A0
>=20

Understood. I will squash the two patches into a single patch, as it
will only provide hwmon ABI.

> Reading ROM/RAM addresses,
> as mentioned below, would be outside that scope.

Thanks for clarification. I am not going to support this, as dancing
with undocumented ROM/RAM access is too dangerous.

>=20
> The entire powerz driver is 269 lines of code. Your driver has well above
> 1,000 LOC.=C2=A0
>=20

The witrn driver itself is less than 700 LOC. It's longer because of
more channels and the need to call floating-point conversion and
arithmetic methods.

Other LOC mostly locates at the floating-point conversions and
arithmetic module. Since I will turn it into a generic lib, it won't be
a part of the witrn driver when I resubmit it. Thanks for the
suggestion.

> Your code has separate source files plus an include file.

The include file is for the floating-point conversion and arithmetic
module.

> That suggests that it does more than just reporting hardware monitoring
> attributes.
>=20
> I have not looked further into the code itself. My response is based pure=
ly
> on the subjects and code organization, which suggests that this is a HID
> driver with attached hardware monitoring.

I should have explained the structure of the series more detailedly.
Sorry for causing the misunderstanding.

>=20
> I am not sure I understand what all that would have to do with UCSI. UCSI
> support is implemented in drivers/usb/typec/ucsi. Anything associated
> with that protocol should be implemented there if it is part of the
> protocol.

Thanks for clarification. I think the feature has nothing to do with
UCSI because it's a passive dumb raw packet sniffer.

>=20
> > Could you kindly explain what kinds of driver can be accepted into
> > drivers/hwmon/?
> >=20
> > >=20
> > > >         hwmon: (witrn) Add monitoring support
> > >=20
> > > This should be implemented as auxiliary driver.
> >=20
> > Could you kindly elaborate? Did you mean that if the device supports
> > multiple functionalities they should be implemented as multiple
> > auxiliary drivers in different subsystems?
> >=20
>=20
> Correct. Your series suggests that this would be the case.

Sorry for causing the misunderstanding again.

>=20
> > FYI, the USB tester doesn't provide any other meaningful feature that
> > fits other subsystems. The tester only provides two features through US=
B
> > HID: power measurements (this series), and raw PD packets sniffing.
> >=20
>=20
> Again, support for raw PD packets sniffing would be outside the scope
> of the hardware monitoring subsystem.

Agreed. I am not going to support it in any other subsystem either.
Users should use hidraw and parse everything themselves if they need it.

Thanks,
Rong

>=20
> Thanks,
> Guenter
>=20
> > As for the latter, the USB tester can sniff raw PD packets between the
> > source and sink if enabled in the device menu. It doesn't provide the
> > parsed result for packets, and the PC cannot ask the tester to send PD
> > packets. This doesn't fit UCSI at all, as a UCSI device operates at a
> > higher level and must accept commands. AFAIK such a dumb sniffer won't
> > fit any subsystem in the kernel. Hence, the only thing fits a subsystem
> > is its power measurements.
> >=20
> > All measurements supported by the official utility for Windows can be
> > found in `struct witrn_sensor'. Other than that, all extra features
> > provided by the utility are implemented in software and I didn't see an=
y
> > extra USB packets other than querying the serial number [1] when I was
> > randomly messing around with the utility [2].
> >=20
> > I separated patch 3 and 4 just for easier review. If you are not in
> > favor of such a style, I will squash them.
> >=20
> > [1]: In fact, the utility directly asks the device to return the conten=
t
> > on several specific ROM/RAM addresses, and then the utility calculates
> > the serial number with an unknown algorithm. Reading a ROM/RAM address
> > seems to be the only command that the device accepts from the USB host.
> >=20
> > [2]: Yeah, their utility does not support PD packet capturing or
> > parsing. It seems that the manufacturer provides the PD sniffing featur=
e
> > as is and expects users to capture it via hidraw or libusb and parse it
> > themselves.
> >=20
> > >=20
> > > Sashiko has a lot of feedback that you might want to address before
> > > resubmitting.
> > >=20
> > > https://sashiko.dev/#/patchset/20260327-b4-hwmon-witrn-v1-0-8d2f1896c=
045%40rong.moe
> >=20
> > Sashiko's feedback helps a lot. Thanks.
> >=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > > Thanks,
> > > Guenter
> > >=20
> > > >=20
> > > >    Documentation/hwmon/index.rst |   1 +
> > > >    Documentation/hwmon/witrn.rst |  53 ++++
> > > >    MAINTAINERS                   |   7 +
> > > >    drivers/hwmon/Kconfig         |  14 +
> > > >    drivers/hwmon/Makefile        |   2 +
> > > >    drivers/hwmon/hwmon-fp.c      | 262 ++++++++++++++++
> > > >    drivers/hwmon/hwmon-fp.h      | 212 +++++++++++++
> > > >    drivers/hwmon/hwmon.c         |   1 +
> > > >    drivers/hwmon/witrn.c         | 691 ++++++++++++++++++++++++++++=
++++++++++++++
> > > >    9 files changed, 1243 insertions(+)
> > > > ---
> > > > base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
> > > > change-id: 20260327-b4-hwmon-witrn-a629b9040250
> > > >=20
> > > > Thanks,
> > > > Rong
> > > >=20
