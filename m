Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE2398913
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818676; cv=none; b=Btp/PD1LVD8QNcQBFNff6BubLMXIEFLRnAG+WAEj7NIu74o6+NWE+Awrx0WP0mcPAyt56Vo3U2DTohI6hlTMYWcWguzR0Kws68Qb/orvIJSc+tg2z146HBhV4KObJEU1/djIBfLCL60ORlxf4rZE48Rr2x/rcRfrt1QnpWjSzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818676; c=relaxed/simple;
	bh=J3SSveqiYGEqaxrur6FeuF/gwWkfkw7ff6t1aPxNYSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIQ0mLwlg+27GFr1Xuzp36ODOsfALL6Bdf1tnbPK8j6NMIbQEBHt0eBfKWZNnFyFg3QR5aCZ07McYasLPVMdW8pgnSFv8WLqeiA+5TLo8rvylpROp/+sfU4p2Yh0cHcrEAaQwdTfn7VGPdmxB6gghTdqADkVpDactR+AWqwTnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dwgpam1t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dwgpam1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E70C4AF0B
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818676;
	bh=J3SSveqiYGEqaxrur6FeuF/gwWkfkw7ff6t1aPxNYSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dwgpam1tEIdD4KfA38GLrh/kCplxbb1sZsi4kWDQOVcU/0tTUe7m3eJfuAhJoxuL8
	 T4LIl+2KPAKpNfHPRFX1+r3S1hkiuvyBRKmDLRwYzdiF0X0Og19SVk3GWo37y4SATU
	 mW3PETNmvpIUJC7kp/v1kwQ+XZC8FkAe3eY6Fb5OcbWVKOVWYycieZhIvDcNFMoRRL
	 JjSkC6RPc+SrMyKSQUw6wl29bjk7KHlO0NFKIH6XkOBhx60Hpl/II1R7jaNNPWfTPU
	 lmId3dYTXb8I9MIWozUoe3Dyr845RD3njfWukCSDjMMv9wo+kFdSj/9WDqaFbxSg26
	 itFG9fN30+Uew==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4be94eeacso1988097a34.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 03:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDaRhFn/tOD0azMdl+cwsXcHOOyjXdcAplJeC+Zozs2fobVStU937A7vJwcZ9WxDAZcimczRzEHnCacw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweKbO59lJvrH5pDq5wPvr7wWureDVgB27dY2fog40qC4U6P8R9
	33OaLJrNemAdPdROTuhwN0zr+MjNJ0RKCRBTLZ49NwYvx67ecKJ1q2wRHjqrZ94OWjSpCBFAVyz
	4a0sYMYN0nAH3m/nG8da0mGx0Jq5VRiA=
X-Received: by 2002:a05:6820:328d:b0:682:fa66:61cb with SMTP id
 006d021491bc7-68be7ee1e4emr834163eaf.41.1775818675345; Fri, 10 Apr 2026
 03:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-3-akhilrajeev@nvidia.com> <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
In-Reply-To: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Apr 2026 12:57:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jKZJg3Yh6OYiKncipT-47N0o0QLniPtj4NO+ojmsJ1rQ@mail.gmail.com>
X-Gm-Features: AQROBzAjJeCEEVSt2XY1F7M-MV9mizZ42mbvlFT3Shx19xZYzF_yLub_Mz-tACQ
Message-ID: <CAJZ5v0jKZJg3Yh6OYiKncipT-47N0o0QLniPtj4NO+ojmsJ1rQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Frank Li <Frank.li@nxp.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Eric Biggers <ebiggers@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 4:04=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Apr 09, 2026 at 04:27:32PM +0530, Akhil R wrote:
> > ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
> > used for Legacy Virtual Register (LVR) data as specified in the MIPI
> > I3C Specification for an I2C device connected to an I3C Host Controller=
.
> > LVR will be read by I3C host controller drivers and it provides details
> > about the specific speed and 50ns spike filter capabilities of I2C
> > devices.
> >
> > Update the rsconvert_info to include this field. For I2C devices on an
> > I2C bus, this field is Reserved and unused.
> >
> > This commit is the result of squashing the following:
> > ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
> > ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
> > ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
> > ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
> > ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b
>
> These commit number is not existed at linus official tree. Please remove =
it.

These are upstream ACPICA commits and it is entirely legitimate to
mention them in kernel commits touching ACPICA code.

However, Link: tags pointing to those commits would be sufficient.

> >
> > Link: https://github.com/acpica/acpica/commit/70082dc8
> > Link: https://github.com/acpica/acpica/commit/b3c38dc9
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  drivers/acpi/acpica/rsserial.c | 6 +++++-
> >  include/acpi/acrestyp.h        | 1 +
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsser=
ial.c
> > index 279bfa27da94..c06e918ab889 100644
> > --- a/drivers/acpi/acpica/rsserial.c
> > +++ b/drivers/acpi/acpica/rsserial.c
> > @@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_ser=
ial_bus[14] =3D {
> >   *
> >   *********************************************************************=
*********/
> >
> > -struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] =3D {
> > +struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] =3D {
> >       {ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
> >        ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
> >        ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
> > @@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_ser=
ial_bus[17] =3D {
> >        AML_OFFSET(i2c_serial_bus.type_specific_flags),
> >        0},
> >
> > +     {ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
> > +      AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
> > +      1},
> > +
> >       {ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_s=
peed),
> >        AML_OFFSET(i2c_serial_bus.connection_speed),
> >        1},
> > diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
> > index 842f932e2c2b..38a19b1d19ac 100644
> > --- a/include/acpi/acrestyp.h
> > +++ b/include/acpi/acrestyp.h
> > @@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
> >       ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
> >       u16 slave_address;
> >       u32 connection_speed;
> > +     u8 lvr;
> >  };
> >
> >  /* Values for access_mode field above */
> > --
> > 2.50.1
> >
>
