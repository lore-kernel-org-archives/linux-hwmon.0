Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793351775;
	b=5ZBRJbO5JbfSfmvOOV2vnS2E9U2eyEOoaS166QJJZWG3cwGbREAFUKEcUqdjSzeJp3tJ
	 IoeQP+9fkSV0GF5L/kH4KfC9XYOE67AxQnp0VKx6GgcaPqkDe79q9aQkgNhZo6fW9v0o7
	 8kgjzXM4wEA+Tj5TLs5Ekp6WTRLjk60YLs3FEd/t3SnpVCDJK8qbdwcq551g2qfXWTU31
	 QwFtSdtFz3MiOBV4edK6sqEz5zNiRxk/jrAHA1LOMP94TrT9gnTehU1T1sRns38j43Di7
	 daG4M+H5BstCe7nhLraEWizPYSTle/6iMs3vsrMR16TRBd8yHJ9vD1AIeMj+kMrgZsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MErt7xGecs6GTVzb4nBHSaAGvD1p873VLB8Th4G2W3E=;
	b=4s58jWdfrWFHY26h5AXY7QDTAVsk8UnOOQM5rSIxDXRycaWUKWnfXpKNmecsmNfj1e0n
	 4clG9AhRwwysT3ov6WcKQeC9Wy/IZgncx7y0RlMzUubkLYVXai+bZRjB7j5uJhQxsfXKM
	 MNVXxymmZBwmAadM9yGbx5E6vDjSSuMNgq7Lfdu+8OAhFfrVdZWf+s3mRDg+NIAIQkNwP
	 A6c/5qR7YYTs7lFJyiexuZ5pPb+w36Y63HTmcTKhpZ/x55xUA5Blw5XfoTbmcxkZXFBvt
	 zMv3x103PQTzcJjWjRAZ9sn4xGdwzcCE7iRZLCBiLUAvat5oepDmDMAfY2BRzw7jVhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNHqbXfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D3F606A323
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D3F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNHqbXfK
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so420492e0c.2
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 02:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793351774; cv=none;
        d=google.com; s=arc-20260327;
        b=gZxphY5QfDrkmh4jWbshWe22oH2SMlQuOXipsIrKCXg232Fv+1wXIkdO9tGffm31VQ
         fXtZM9N6iQje3YMrNnLem6IECXWUfgXzvFf0oyW17IZpfpQUHZvIR8tNGyWD/MyIh27P
         KFXubXolOvaTpeo/DXbaQ7OnMN/2tePDU3dA7cykVH73iLaZeQzbV+45SOBJin36I0v6
         XuHjbe6+gBBuqmHZp7hY90oiQScg2aEJh6i1byR6p18lPWXV4E6x2kQAjOiIylLGySfZ
         TAKFKD8EaxSBpJMxKF5TUP0WSuMoVOq7ozOQNQgixUjQ3SVAysRFWWisb+ZzKVPP9CAQ
         eL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=MErt7xGecs6GTVzb4nBHSaAGvD1p873VLB8Th4G2W3E=;
        fh=KHX9cqcyfg3EGFWyVXg8V4ea26vysNPZfvDBqZOIJGQ=;
        b=Yk53uTJ8mj5kxucAjJwnFQuEb3RrLk9xUf8Hukd+4ZBoTiuI2OC80GHc1Hk9OMPSlp
         UdmdZt4h5Uge4DqVGy6ucyaYV+T4BChP8rCIXlzEdKpw3hgZBGPkh9Nx9Z8P9lz71IMn
         +yHNhxGetLaT8L1oc2pZ+GLJRQnFF8LJOBWBF1LAIFKDzpfmUfcFleUU2+uKIgQGBfO0
         QSBiSDCnGshT6XtIgFyxxAIj5yPlPKY00zsQje2uZ3C4kJagqOM+mgzQoZhSDbR7kQ3Q
         rLmJCB5NlHYht/Io/VvQqjAaTq9oOWbukM/IZXLHnm2/0Y1i+zcW7TKDqQJ1RJr1gJRd
         wyig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351774; x=1793956574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MErt7xGecs6GTVzb4nBHSaAGvD1p873VLB8Th4G2W3E=;
        b=RNHqbXfKhAful37oa3T/VJvb9frcBQeB3z4tUfuRfts/eHjKRvrW/6aRDJ87JJQ+pW
         Phd7XqPLCICyJe2zBzO2L/r2uWtMbAZuC8v1NKtwW1siwGOwkZDMeUcpv2HDOpRXtIws
         niBXIh9CYbcilbsQdejJZNBNMb7iSWmpr6I7jITWzm2hSnljLQrTUavcpDoc7v6wbV7g
         Hk2j0vYlUqB22zL/+k9sZ1jldA6PBbp9OT06LoRrbvJDZs4gaior9+i+NQv4kyKFHMNn
         M2ckOAnWVn3eV+WdcvdZXZ2xNxqGnkakbYMTh2Hs2vl4DNHjTpy8CmfpmfpQHxbsZ0Uy
         M/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351774; x=1793956574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MErt7xGecs6GTVzb4nBHSaAGvD1p873VLB8Th4G2W3E=;
        b=TkOHyoKCj0DSURCF9vX7ISe0cxoNiVTowyzSY5zJDYGkjEptSwJqlMpM3lVWYFw6La
         Pyv8AfszCMiURg64TlqJEcLzxePsa3aUlbWzBNcSV9s3oH1HxuCvkUR6FtFEDmIc6sCr
         udMDoBXdi64qXPNMHfJY0eYJzMJ0vmh804Zf4aL/hCHwH2GpezLi60659IhuZ5PJfe7I
         JDxSK19um7ixQIOrr4axKyYMgWbBCACqf3DwfZ9tFFkj1JP6sQSQZSTy0sai0uEXPlRb
         J+VUZbF2vOEg9JoTl3O5Q22pShd/GSoPw0jdMfTe0gqYjqjNMurjcWfQmzMXa3+qxGQB
         Hd3A==
X-Forwarded-Encrypted: i=1; AKwUvByYZ1LOQtDrljq3R/C7pbUX5XbhEi8V6Jui/t7ojDUVg0xV8beeYYdPCRpRtvv83TiJQRDd+IVaPjW3jg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKHb2UvE+ygnhf2HjOgsIU0PVA/l3CeIi4oPmSPrjgqk/bCTFG
	dtGIVBczu1bR78hSTSiskKIY3Cl9CVhNJoRwhoGCBBijsHR+5n5ZhEOhNX/wig0V5FGAcTxaWFm
	z4jjPX3u1fVxsl36kIzboHeOo2VjHJVA=
X-Gm-Gg: AYBFou3+J0ovFL6RXin2v7I5uLu6ROWI998kgvTIQGe3AQz4bcGswwU2lyWeLaobiTq
	ZWP6tIyHyUXp4I2wvLa3rc5Z5HB8T51Vum1JBD+CYVKjYUN63coY27o7fFSwq5bUOL1mAWWYTjj
	qPNuGv2DkMurO43PXyHnSCVo5LLYM31e0w+SSy4F4FDBjTPSlDO+P712kCbqGsAIHUMoFJt4/+T
	HqVDVatq4zFLkzg6dYi8x3/02pmWFMfYZlI3F2rhsWt5SwCuUQnr48GzR6eJ9wtK48QxTiSOnsV
	TvJ6TyhhX/PUTB6On5Gn1GbuVKvZGO1juGpJ4b8+gjmBUfTUVxGombn5+okLyeEgj0I1j6VG+mb
	w17QDML/ABDVbbFwEX5COhHY3SRylhI2RQ11TcOqGV8q/pisKnRK8h/QQVkq6iLyfJMk=
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id
 ada2fe7eead31-7d07274b90amr849323137.29.1793351773845; Fri, 30 Oct 2026
 02:16:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 04:16:12 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 04:16:12 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de> <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
From: LIght JUNction <lightjunction.me@gmail.com>
Date: Fri, 30 Oct 2026 04:16:12 -0500
X-Gm-Features: AclHuK9AkndYwvFM8dzIqtJggbiIQEumUf76VRzobAP1lOZfu0KvXyNpRAzeSXc
Message-ID: <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: W_Armin@gmx.de, linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

One clarification: I won't load uniwill_laptop with force=3D1 on this
machine. The force path enables nearly every feature. Probe sets EC
0x0741 bit 0, initializes CTGP at 0x0743-0x0746, modifies the lightbar
registers, and writes keyboard-backlight settings, including enabling
China mode and clearing KBD_POWER_OFF.

On unload, the driver clears the bit at 0x0741, but it does not
restore the CTGP, lightbar, or keyboard-backlight values. The
installed tuxedo_nb02_nvidia_power_ctrl exposes only ctgp_offset here,
so I cannot snapshot and restore the other values. Its GM6PX0X path
also deliberately preserves the firmware power configuration.

I therefore cannot verify force=3D1 safely on this running system. This
remains a source-level assessment; I have not loaded the driver with
force=3D1.

Thanks,
LIghtJUNction

On Fri, 30 Oct 2026 03:54:55 -0500, LIght JUNction
<lightjunction.me@gmail.com> wrote:
> Hi Armin,
>
> I checked the in-tree uniwill_laptop driver and its force path. I have no=
t loaded it with force=3D1 on the GM6PX0X. For an unsupported DMI entry, fo=
rce enables all features except the battery charge limit. Probe sets EC 0x0=
741 bit 0 and initializes NVIDIA CTGP, writing 0 to the CTGP offset at 0x07=
44. The current ctgp_offset here is 25, so this would overwrite the active =
value.
>
> The sensor map is a partial match: CPU/GPU temperatures and the primary f=
an address match. The secondary fan low byte differs: uniwill_laptop uses 0=
x046D; the verified GM6PX0X map uses 0x046B. The generic driver also reads =
the fan bytes without the high/low/high check in my patch.
>
> I can't confirm full operation with force=3D1 on this model. A sensor-onl=
y test path without those EC writes would be needed to verify it.
>
> Thanks,
> LIghtJUNction
>
> On Fri, 30 Oct 2026 08:37:43 +0100, Armin Wolf <W_Armin@gmx.de> wrote:
> > Am 29.10.26 um 21:35 schrieb LIght JUNction:
> > > From: LIghtJUNction <lightjunction.me@gmail.com>
> > >
> > > The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
> > > through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
> > > these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
> > > board GM6PX0X, and BIOS N.1.09MRO07.
> > >
> > > The driver checks the firmware project ID and fan capability before
> > > registering the device. It uses only ECRR reads and exposes standard
> > > hwmon temperature and fan input attributes. It does not write EC
> > > registers or expose fan controls. Fan counters are sampled high/low/h=
igh
> > > to reject a high-byte rollover.
> > >
> > > Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
> > > N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=3D1, loa=
ded
> > > beside the installed sensor module, provided all four readings, and
> > > unloaded without removing the existing module. Other systems and BIOS
> > > versions have not been tested.
> >
> > Hi,
> >
> > can you check if the uniwill-laptop driver works by loading it with the
> > force module option being set to 1?
> >
> > Thanks,
> > Armin Wolf
> >
> > > Assisted-by: Codex:GPT-6
> > > Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
> > > ---
> > > AI assistance: Codex was used to draft the read-only driver, its Kcon=
fig
> > > and Makefile integration, documentation, and commit message. The requ=
est
> > > was to prepare a hwmon submission for the locally verified GM6PX0X us=
ing
> > > the firmware read interface and no EC writes.
> > >
> > > Validation is limited to an external-module W=3D1 build and runtime r=
eads on
> > > the laptop and BIOS listed above; no full kernel-tree build was perfo=
rmed.
> > > checkpatch --strict reports no errors and one advisory about a new
> > > MAINTAINERS entry. The general HWMON entry covers these paths.
> > >
> > >   Documentation/hwmon/index.rst       |   1 +
> > >   Documentation/hwmon/mechrevo-ec.rst |  31 +++
> > >   drivers/hwmon/Kconfig               |  11 ++
> > >   drivers/hwmon/Makefile              |   1 +
> > >   drivers/hwmon/mechrevo-ec.c         | 290 +++++++++++++++++++++++++=
+++
> > >   5 files changed, 334 insertions(+)
> > >   create mode 100644 Documentation/hwmon/mechrevo-ec.rst
> > >   create mode 100644 drivers/hwmon/mechrevo-ec.c
> > >
> > > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/inde=
x.rst
> > > index 199ca79..6bd4ece 100644
> > > --- a/Documentation/hwmon/index.rst
> > > +++ b/Documentation/hwmon/index.rst
> > > @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
> > >      mc34vr500
> > >      mcp3021
> > >      mcp9982
> > > +   mechrevo-ec
> > >      menf21bmc
> > >      minisforum-um780xtx
> > >      mlxreg-fan
> > > diff --git a/Documentation/hwmon/mechrevo-ec.rst
> > > b/Documentation/hwmon/mechrevo-ec.rst
> > > new file mode 100644
> > > index 0000000..91ffd77
> > > --- /dev/null
> > > +++ b/Documentation/hwmon/mechrevo-ec.rst
> > > @@ -0,0 +1,31 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +MECHREVO GM6PX0X EC
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +Supported systems:
> > > +
> > > +  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
> > > +  * BIOS N.1.09MRO07
> > > +
> > > +The driver exposes two EC temperatures and two fan speeds through hw=
mon. It
> > > +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. T=
emperatures
> > > +are reported in millidegrees Celsius and fan speeds in RPM. The CPU =
and GPU
> > > +temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU a=
nd GPU fan
> > > +counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/=
``0x046b``,
> > > +respectively.
> > > +
> > > +Each successful ECRR read is followed by a 6 to 12 ms delay. Fan rea=
ds sample
> > > +the high byte before and after the low byte and retry up to three ti=
mes if the
> > > +high byte changes. The EC updates independently, so the driver canno=
t provide
> > > +an atomic snapshot of the two bytes.
> > > +
> > > +At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and=
 bit 6 of
> > > +the capability byte at ``0x078e``. It only binds the exact DMI ident=
ity and
> > > +BIOS version listed above. Other models and BIOS versions have not b=
een
> > > +validated.
> > > +
> > > +The driver is read-only. It does not call the firmware write method,=
 change EC
> > > +configuration, or expose fan-control attributes. Values above 125 de=
grees C
> > > +are reported as unavailable; zero is passed through as read from fir=
mware.
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 18c682e..7e397c2 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called hp_wmi_sensors.
> > >
> > > +config SENSORS_MECHREVO_EC
> > > +	tristate "MECHREVO GM6PX0X EC sensors"
> > > +	depends on X86 && ACPI
> > > +	help
> > > +	  If you say yes here you get read-only temperature and fan speed
> > > +	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIO=
S
> > > +	  N.1.09MRO07, using its firmware ACPI method.
> > > +
> > > +	  This driver can also be built as a module. If so, the module
> > > +	  will be called mechrevo_ec.
> > > +
> > >   endif # ACPI
> > >
> > >   endif # HWMON
> > > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > > index d4c345e..ac362a1 100644
> > > --- a/drivers/hwmon/Makefile
> > > +++ b/drivers/hwmon/Makefile
> > > @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+=3D asus-ec-sensors.=
o
> > >   obj-$(CONFIG_SENSORS_ASUS_WMI)	+=3D asus_wmi_sensors.o
> > >   obj-$(CONFIG_SENSORS_HONOR_FMI)	+=3D honor-fmi.o
> > >   obj-$(CONFIG_SENSORS_HP_WMI)	+=3D hp-wmi-sensors.o
> > > +obj-$(CONFIG_SENSORS_MECHREVO_EC)	+=3D mechrevo-ec.o
> > >
> > >   # Native drivers
> > >   # asb100, then w83781d go first, as they can override other drivers=
' addresses.
> > > diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.=
c
> > > new file mode 100644
> > > index 0000000..d4a3430
> > > --- /dev/null
> > > +++ b/drivers/hwmon/mechrevo-ec.c
> > > @@ -0,0 +1,290 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/dmi.h>
> > > +#include <linux/err.h>
> > > +#include <linux/hwmon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#define MECHREVO_ECRR_DELAY_MIN_US	6000
> > > +#define MECHREVO_ECRR_DELAY_MAX_US	12000
> > > +#define MECHREVO_RPM_ATTEMPTS		3
> > > +
> > > +struct mechrevo_ec_data {
> > > +	acpi_handle inou;
> > > +	/* Serialize the three ECRR calls that make up one fan sample. */
> > > +	struct mutex rpm_lock;
> > > +};
> > > +
> > > +static const struct dmi_system_id mechrevo_ec_dmi_table[] =3D {
> > > +	{
> > > +		.matches =3D {
> > > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> > > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> > > +					"Kuangshi16Pro Series GM6PX0X"),
> > > +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
> > > +			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
> > > +		},
> > > +	},
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
> > > +
> > > +static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 =
address,
> > > +				 u8 *value)
> > > +{
> > > +	union acpi_object argument =3D {
> > > +		.integer.type =3D ACPI_TYPE_INTEGER,
> > > +		.integer.value =3D address,
> > > +	};
> > > +	struct acpi_object_list arguments =3D {
> > > +		.count =3D 1,
> > > +		.pointer =3D &argument,
> > > +	};
> > > +	unsigned long long raw;
> > > +	acpi_status status;
> > > +
> > > +	status =3D acpi_evaluate_integer(data->inou, "ECRR", &arguments, &r=
aw);
> > > +	if (ACPI_FAILURE(status))
> > > +		return -EIO;
> > > +
> > > +	/* Match the delay used by the in-tree Uniwill ECRR transport. */
> > > +	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US=
);
> > > +	if (raw > 255)
> > > +		return -ERANGE;
> > > +
> > > +	*value =3D raw;
> > > +	return 0;
> > > +}
> > > +
> > > +static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int =
channel,
> > > +				 long *value)
> > > +{
> > > +	u16 address;
> > > +	u8 raw;
> > > +	int ret;
> > > +
> > > +	switch (channel) {
> > > +	case 0:
> > > +		address =3D 0x043e;
> > > +		break;
> > > +	case 1:
> > > +		address =3D 0x044f;
> > > +		break;
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +
> > > +	ret =3D mechrevo_ec_read_byte(data, address, &raw);
> > > +	if (ret)
> > > +		return ret;
> > > +	if (raw > 125)
> > > +		return -ENODATA;
> > > +
> > > +	*value =3D raw * 1000;
> > > +	return 0;
> > > +}
> > > +
> > > +static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int c=
hannel,
> > > +				long *value)
> > > +{
> > > +	u16 high_address, low_address;
> > > +	u8 high, low, check;
> > > +	int attempt, ret;
> > > +
> > > +	switch (channel) {
> > > +	case 0:
> > > +		high_address =3D 0x0464;
> > > +		low_address =3D 0x0465;
> > > +		break;
> > > +	case 1:
> > > +		high_address =3D 0x046c;
> > > +		low_address =3D 0x046b;
> > > +		break;
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +
> > > +	/* The EC can update between byte reads; reject a high-byte rollove=
r. */
> > > +	mutex_lock(&data->rpm_lock);
> > > +	for (attempt =3D 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
> > > +		ret =3D mechrevo_ec_read_byte(data, high_address, &high);
> > > +		if (ret)
> > > +			goto out_unlock;
> > > +
> > > +		ret =3D mechrevo_ec_read_byte(data, low_address, &low);
> > > +		if (ret)
> > > +			goto out_unlock;
> > > +
> > > +		ret =3D mechrevo_ec_read_byte(data, high_address, &check);
> > > +		if (ret)
> > > +			goto out_unlock;
> > > +
> > > +		if (high =3D=3D check) {
> > > +			*value =3D ((long)high << 8) | low;
> > > +			ret =3D 0;
> > > +			goto out_unlock;
> > > +		}
> > > +	}
> > > +	ret =3D -EAGAIN;
> > > +
> > > +out_unlock:
> > > +	mutex_unlock(&data->rpm_lock);
> > > +	return ret;
> > > +}
> > > +
> > > +static umode_t mechrevo_ec_is_visible(const void *data,
> > > +				      enum hwmon_sensor_types type,
> > > +				      u32 attr, int channel)
> > > +{
> > > +	if (channel < 0 || channel > 1)
> > > +		return 0;
> > > +
> > > +	if (type =3D=3D hwmon_temp)
> > > +		return attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_labe=
l ? 0444 : 0;
> > > +	if (type =3D=3D hwmon_fan)
> > > +		return attr =3D=3D hwmon_fan_input || attr =3D=3D hwmon_fan_label =
? 0444 : 0;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > > +			    u32 attr, int channel, long *value)
> > > +{
> > > +	struct mechrevo_ec_data *data =3D dev_get_drvdata(dev);
> > > +
> > > +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input)
> > > +		return mechrevo_ec_read_temp(data, channel, value);
> > > +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input)
> > > +		return mechrevo_ec_read_fan(data, channel, value);
> > > +
> > > +	return -EOPNOTSUPP;
> > > +}
> > > +
> > > +static int mechrevo_ec_read_string(struct device *dev,
> > > +				   enum hwmon_sensor_types type, u32 attr,
> > > +				   int channel, const char **value)
> > > +{
> > > +	if (channel < 0 || channel > 1)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label)
> > > +		*value =3D channel ? "GPU EC" : "CPU EC";
> > > +	else if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label)
> > > +		*value =3D channel ? "GPU fan" : "CPU fan";
> > > +	else
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct hwmon_ops mechrevo_ec_hwmon_ops =3D {
> > > +	.is_visible =3D mechrevo_ec_is_visible,
> > > +	.read =3D mechrevo_ec_read,
> > > +	.read_string =3D mechrevo_ec_read_string,
> > > +};
> > > +
> > > +static const struct hwmon_channel_info * const mechrevo_ec_hwmon_inf=
o[] =3D {
> > > +	HWMON_CHANNEL_INFO(temp,
> > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> > > +	HWMON_CHANNEL_INFO(fan,
> > > +			   HWMON_F_INPUT | HWMON_F_LABEL,
> > > +			   HWMON_F_INPUT | HWMON_F_LABEL),
> > > +	NULL
> > > +};
> > > +
> > > +static const struct hwmon_chip_info mechrevo_ec_chip_info =3D {
> > > +	.ops =3D &mechrevo_ec_hwmon_ops,
> > > +	.info =3D mechrevo_ec_hwmon_info,
> > > +};
> > > +
> > > +static int mechrevo_ec_probe(struct platform_device *pdev)
> > > +{
> > > +	struct mechrevo_ec_data *data;
> > > +	struct device *hwmon_dev;
> > > +	u8 project, capability;
> > > +	acpi_status status;
> > > +	int ret;
> > > +
> > > +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> > > +		return -ENODEV;
> > > +
> > > +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	mutex_init(&data->rpm_lock);
> > > +	status =3D acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
> > > +	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
> > > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > > +				     "missing INOU.ECRR method\n");
> > > +
> > > +	ret =3D mechrevo_ec_read_byte(data, 0x0740, &project);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "failed to read EC project ID\n");
> > > +	ret =3D mechrevo_ec_read_byte(data, 0x078e, &capability);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "failed to read EC fan capability\n");
> > > +	if (project !=3D 0x10 || !(capability & 0x40))
> > > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > > +				     "unsupported EC project or fan layout\n");
> > > +
> > > +	platform_set_drvdata(pdev, data);
> > > +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mec=
hrevo",
> > > +							 data,
> > > +							 &mechrevo_ec_chip_info,
> > > +							 NULL);
> > > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > > +}
> > > +
> > > +static struct platform_driver mechrevo_ec_driver =3D {
> > > +	.probe =3D mechrevo_ec_probe,
> > > +	.driver =3D {
> > > +		.name =3D "mechrevo-ec-hwmon",
> > > +	},
> > > +};
> > > +
> > > +static struct platform_device *mechrevo_ec_device;
> > > +
> > > +static int __init mechrevo_ec_init(void)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> > > +		return -ENODEV;
> > > +
> > > +	ret =3D platform_driver_register(&mechrevo_ec_driver);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mechrevo_ec_device =3D platform_device_register_simple("mechrevo-ec=
-hwmon",
> > > +							     PLATFORM_DEVID_NONE,
> > > +							     NULL, 0);
> > > +	if (IS_ERR(mechrevo_ec_device)) {
> > > +		ret =3D PTR_ERR(mechrevo_ec_device);
> > > +		platform_driver_unregister(&mechrevo_ec_driver);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void __exit mechrevo_ec_exit(void)
> > > +{
> > > +	platform_device_unregister(mechrevo_ec_device);
> > > +	platform_driver_unregister(&mechrevo_ec_driver);
> > > +}
> > > +
> > > +module_init(mechrevo_ec_init);
> > > +module_exit(mechrevo_ec_exit);
> > > +
> > > +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
> > > +MODULE_LICENSE("GPL");
