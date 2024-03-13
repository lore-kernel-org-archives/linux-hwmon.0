Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6316428
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2024 06:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710311101; cv=none; b=ocbsylMTOgRw7f384AC9Z2vdMSD8jZM06wxHc7SsR1uJa60mKjzzybMnoVo2o26wQTDO5sEzZX17lkJ3TEN76vMrkOBrmrxoov0Z8P5S9iz0XcLzF26s/OVE0NCCyAVbXDy6o8QcQge/PaUunemTMOJeRH7h98zj3wFcN75UJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710311101; c=relaxed/simple;
	bh=xtoB8rbdXQhWfkrNIS7WejeYtUS9NaKHQgxM7D9UiXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfbUAadKqvx43a7Z/nXi+2QBvAtFseSoHoJkYliL4SOPW1XrNb36DGiRRwTazOt0L+xiu38/0dw8adaBJnUdlbEeWbvV94Oyltgfbdb/rAMEQnVopGRvQyYBQRYNu8sYseECcV92KgQrCXEk+F5ODDgTFFCFG3vcJIi3KQP0Azg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=uhFkmjt4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="uhFkmjt4"
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC3003F6B1
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2024 06:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1710311090;
	bh=gyS4CxXuiixQE46i3lf6LipxCQAyfgB5ILNmTVboYOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uhFkmjt49FzaTd98+B/LNbBoUBqm+8zYkZ9tHcYFCJUTUp3omENP8YhFVNyOQ/nHx
	 G5g7gVv8xt/jPs2Y5ZeiOpEbA162ornvzGLjo/rgbvRU9ip2XsNGcpNn6nCDCNN+kX
	 +6oXXMLN7wQic2xYl+/12b33ibgr2faTGMpO45T727TmmEVRsjb+K4/3IfsgIjWOX9
	 vxwT76wbRTo0mhPqU+4h4wlP53CEkKh1BCu5OBXGw7gViED23fcjqG8aFcS1j1X6O6
	 7hl/W5pjH74KUfrnSf/uxmWqYCn5PKO98dWmC8IZld5c8zIw7EB4vk7wIDDHa8neOn
	 0/vm9MHIfZFzQ==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6e50831226dso4587344b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Mar 2024 23:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710311089; x=1710915889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyS4CxXuiixQE46i3lf6LipxCQAyfgB5ILNmTVboYOM=;
        b=jooi04g/j/81BKmM9HFewdsQzzJYXzxyjxFptdZnT6nLGKjO58d4TOVSdNbaK59xGD
         T/4z7StoW/kjjeVGD7NWIK2bZcXeMhT9M/jHdrelJrlmvzafwU3vS8j1xsVDa2xkk1mC
         lRShbeOiW3HMjVvfFYiV9IrXt+eBUj/equ72zpJ51SfB6ihOVMG35OorcqGXoKGwxcua
         Bjq+Z0sxWPADcfXixO6pdlwvdSwhgMTuh4HezmVZNXcAIqDznYbY5UA9M2zOs6DfXlhd
         0WT71lcQKYDZLBJ+pKEjUVOJ2sjESVGG9MWtySC5Uy3WaiYqmWHtNY+lJMVokc70s72c
         h5BA==
X-Forwarded-Encrypted: i=1; AJvYcCVkFFTFgTxT0pkAXwmBO7vn3bEteJdGSQNntzRj8ngKJGXk13eMFkyU59wtkAr4f8Cp3GF5jhZp/BI2CULwqf10V6ybYSB3BoVkUWw=
X-Gm-Message-State: AOJu0YzBHtMRnORRbTUrgf0hkSws9V6acAbjHFqbfReeICSuc5h+m23f
	DnozXkTVlJ5zxeqBrWUH9KcRIoRBJ/IHznS06AvPgtWJ9fbLj+38z23a2HaKTSgkBczioBN3apW
	tS+SwOH1nNIsh0EVYg8uhgfcYXQPXev3NJNZrAG/4EcOKessnMeI8HWzxgjY9wtQmZpVTMW27Cr
	F9ejeROC4IIFVH2Ij1m4S7AZ4zy1onrS87EsXQPpRlfPyeHTlZKEM=
X-Received: by 2002:a05:6a20:9382:b0:1a1:3ecb:52fe with SMTP id x2-20020a056a20938200b001a13ecb52femr9690567pzh.0.1710311089253;
        Tue, 12 Mar 2024 23:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5zKpCLcd0GZpY9zwgTSGqwbNwfuarrJWlUhevzTtyHWPLaXO9KU2nDe5BMELpRKfc/a3Oov4lQ83sKz8Vq7s=
X-Received: by 2002:a05:6a20:9382:b0:1a1:3ecb:52fe with SMTP id
 x2-20020a056a20938200b001a13ecb52femr9690551pzh.0.1710311088814; Tue, 12 Mar
 2024 23:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109041218.980674-1-kai.heng.feng@canonical.com>
 <20240109041218.980674-2-kai.heng.feng@canonical.com> <1b8ff82e-ff26-410e-a37e-0d818494bac3@roeck-us.net>
 <ZZ26ea5KV9Xg1MDc@mail.minyard.net> <e090d7f5-208a-4a4d-8162-7202ad6b0183@roeck-us.net>
 <ZZ3cSygeCTAr35nz@mail.minyard.net>
In-Reply-To: <ZZ3cSygeCTAr35nz@mail.minyard.net>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 13 Mar 2024 14:24:37 +0800
Message-ID: <CAAd53p71sS+eV1OmPgSDrAcqu8-FJZX-9sd=3a6ZNAvaZV9jbQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (acpi_power_meter) Ensure IPMI space
 handler is ready on Dell systems
To: minyard@acm.org
Cc: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corey,

On Wed, Jan 10, 2024 at 7:52=E2=80=AFAM Corey Minyard <minyard@acm.org> wro=
te:
>
> On Tue, Jan 09, 2024 at 02:32:41PM -0800, Guenter Roeck wrote:
> > On 1/9/24 13:28, Corey Minyard wrote:
> > > On Tue, Jan 09, 2024 at 07:23:40AM -0800, Guenter Roeck wrote:
> > > > On 1/8/24 20:12, Kai-Heng Feng wrote:
> > > > > The following error can be observed at boot:
> > > > > [    3.717920] ACPI Error: No handler for Region [SYSI] (00000000=
ab9e62c5) [IPMI] (20230628/evregion-130)
> > > > > [    3.717928] ACPI Error: Region IPMI (ID=3D7) has no handler (2=
0230628/exfldio-261)
> > > > >
> > > > > [    3.717936] No Local Variables are initialized for Method [_GH=
L]
> > > > >
> > > > > [    3.717938] No Arguments are initialized for method [_GHL]
> > > > >
> > > > > [    3.717940] ACPI Error: Aborting method \_SB.PMI0._GHL due to =
previous error (AE_NOT_EXIST) (20230628/psparse-529)
> > > > > [    3.717949] ACPI Error: Aborting method \_SB.PMI0._PMC due to =
previous error (AE_NOT_EXIST) (20230628/psparse-529)
> > > > > [    3.717957] ACPI: \_SB_.PMI0: _PMC evaluation failed: AE_NOT_E=
XIST
> > > > >
> > > > > On Dell systems several methods of acpi_power_meter access variab=
les in
> > > > > IPMI region [0], so wait until IPMI space handler is installed by
> > > > > acpi_ipmi and also wait until SMI is selected to make the space h=
andler
> > > > > fully functional.
> > > > >
> > > > > [0] https://www.dell.com/support/manuals/en-us/redhat-enterprise-=
linux-v8.0/rhel8_rn_pub/advanced-configuration-and-power-interface-acpi-err=
or-messages-displayed-in-dmesg?guid=3Dguid-0d5ae482-1977-42cf-b417-3ed5c3f5=
ee62
> > > > >
> > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > ---
> > > > > v4:
> > > > >    - No change.
> > > > >
> > > > > v3:
> > > > >    - Use helper.
> > > > >    - Use return value to print warning message.
> > > > >
> > > > > v2:
> > > > >    - Use completion instead of request_module().
> > > > >
> > > > >    drivers/hwmon/acpi_power_meter.c | 6 ++++++
> > > > >    1 file changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acp=
i_power_meter.c
> > > > > index 703666b95bf4..33fb9626633d 100644
> > > > > --- a/drivers/hwmon/acpi_power_meter.c
> > > > > +++ b/drivers/hwmon/acpi_power_meter.c
> > > > > @@ -883,6 +883,12 @@ static int acpi_power_meter_add(struct acpi_=
device *device)
> > > > >         strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS)=
;
> > > > >         device->driver_data =3D resource;
> > > > > +       if (dmi_match(DMI_SYS_VENDOR, "Dell Inc.") &&
> > > > > +           acpi_dev_get_first_match_dev("IPI0001", NULL, -1)) {
> > > > > +               if (acpi_wait_for_acpi_ipmi())
> > > > > +                       dev_warn(&device->dev, "Waiting for ACPI =
IPMI timeout");
> > > > > +       }
> > > > > +
> > > >
> > > > What a hack :-(.
> > > >
> > > > This needs a comment in the driver explaining the rationale for thi=
s change, and
> > > > also a comment explaining why, for example, using late_initcall() d=
oes not help.
> > > >
> > > > If CONFIG_IPMI_SI=3Dn, acpi_wait_for_acpi_ipmi() will return 0, ind=
icating success.
> > > > I can only imagine that this will result in a failure since the who=
le point
> > > > of this code is to wait until that driver is loaded. Please explain=
 how and why
> > > > the code works with CONFIG_IPMI_SI=3Dn. Similar, if the function re=
turns an error,
> > > > I can not imagine how it would make sense to instantiate the driver=
. If it does
> > > > make sense to continue in this situation, a comment is needed in th=
e code
> > > > describing the rationale.
> > >
> > > I'm trying to figure out where CONFIG_IPMI_SI comes in here.  It's
> > > nowhere in these patches or in drivers/acpi.  ACPI_IPMI depends on
> > > IPMI_HANDLER, but that's all I found.  However, ACPI_IPMI can be "m" =
as
> > > you mention and SENSOR_ACPI_POWER is only under the ACPI config, whic=
h
> > > is a problem.
> > >
> >
> > The patch above is looking for IPI0001, which is instantiated in
> >
> > drivers/char/ipmi/ipmi_si_platform.c:   { "IPI0001", 0 },
> > drivers/char/ipmi/ipmi_ssif.c:  { "IPI0001", 0 },
> >
> > Are you saying that the above code doesn't depend on it ? In that case,
> > why does it need to check for the IPI0001 device in the first place ?
> >
> > That will need another comment/explanation in the code because people
> > (or maybe dummies) like me won't understand the non-dependency (i.e.,
> > the need to look for IPI0001 but not requiring the associated code).
> >
> > More specifically, unless I really don't understand the acpi code,
> > acpi_dev_get_first_match_dev() will return NULL if there is no matching
> > device. In that case, the above code won't call acpi_wait_for_acpi_ipmi=
().
> > Fine, but why would this driver have to wait for ipmi if and only if th=
ere
> > is a device (and thus a driver) for IPI0001 ?
>
> Honestly, I don't really understand the acpi code that well, either.
> What I think it's saying is that if IPI0001 is present in the ACPI
> tables (there is an acpi_device present), then wait for the driver to
> get loaded.  It could be IPMI_SI or IPMI_SSIF, but there's no direct
> connection between this code and the low-level IPMI driver.  I don't
> think it forces the driver to load, at least not from what I can tell.

The dependency isn't discoverable at software level. It's all in the BIOS' =
ASL

>
> And another bug.  From the description of acpi_dev_get_first_match_dev():
> The caller is responsible for invoking acpi_dev_put() on the returned dev=
ice.

Sure. I'll fix it in next revision.

>
> As you said, this is a big hack.  There must be a better way.

Unfortunately I really can't find a better alternative if the
dependency isn't declared anywhere.

Kai-Heng

>
> -corey
>
> >
> > Thanks,
> > Guenter
> >
> > > I do think there are other issues with this patch, though.  The IPMI
> > > handler code decouples the user from the driver from a dependency poi=
nt
> > > of view.  It seems to be fairly common to see IPMI_HANDLER and
> > > ACPI_IPMI as "y" and IPMI_SI (and IPMI_SSIF, and others) as "m".  Tha=
t
> > > means this code will run but will wait for the IPMI device to appear,
> > > which may not be until the module gets loaded, which may be far more
> > > than 2 seconds later.
> > >
> > > I'm not quite sure how to fix this.  Really, the add call for this
> > > driver shouldn't be called until the IPMI device is present.  Doesn't
> > > ACPI have mechanisms to handle this sort of thing?  If so, the hack m=
ay
> > > need to be in the handling of that ACPI data (this field is not there
> > > but should be), not here, which as Guenter says, is a big hack.
> > >
> > > -corey
> > >
> > > >
> > > > Third, the new symbol is declared with CONFIG_ACPI, but defined wit=
h
> > > > CONFIG_IPMI_SI. I can not imagine how this would compile with CONFI=
G_ACPI=3Dy
> > > > and CONFIG_IPMI_SI=3D{m,n} and/or CONFIG_ACPI_IPMI=3D{m,n}.
> > > >
> > > > On top of that, IPMI_SI and ACPI_IPMI are is tristate, as is SENSOR=
S_ACPI_POWER.
> > > > This means that SENSORS_ACPI_POWER=3Dy combined with CONFIG_IPMI_SI=
=3D{m,n} or
> > > > CONFIG_ACPI_IPMI=3D{m,n} will result in a compile failure.
> > > >
> > > > Please make sure that this code compiles with all possible symbol c=
ombinations.
> > > >
> > > > Thanks,
> > > > Guenter
> > > >
> > > > >         res =3D read_capabilities(resource);
> > > > >         if (res)
> > > > >                 goto exit_free;
> > > >
> > > >
> > >
> >
> >
