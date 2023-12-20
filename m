Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF44A985
	for <linux-hwmon@vger.kernel.org>; Wed, 20 Dec 2023 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="J4phG7Q8"
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 046A63F2C3
	for <linux-hwmon@vger.kernel.org>; Wed, 20 Dec 2023 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703110378;
	bh=ztD/RtxtcUR049JPC70sEXT6G1p0fRBcP6k1VF14xA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J4phG7Q8Mg9OeZ32bCugsRIkBXApOFxkR8UC09w/WMzX5KK2DXk1DCm0aOugooF5n
	 z2uSaL/bqimA3vEuBnZHMDuKKDV4yMrMQDl1xY5g8LbNhD3EBe768n6sB5JavOuHR7
	 ZRqoHk1OIW/vw01+7s+4LIxc0/k13MMftM43fwmzufhAS5UcSO3Qe+Ywx8ks6ZkM/Y
	 rJFpUlpFQ1t2TRrkU2dYLLu3RNpXFITi6xcB48mEjkVTTYmDoV/xEvI9fXwLEQV+eA
	 9j8iPYkkpmTvndJJ0u6OJC5U8eu0L+PkotRfS6lR5Mt3W59uerDANNAVQ/suu0dpD8
	 SHhbXwuosd5eA==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5ca437c3886so817845a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Dec 2023 14:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110376; x=1703715176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztD/RtxtcUR049JPC70sEXT6G1p0fRBcP6k1VF14xA0=;
        b=KXqYAO/1fkQ3cn0q3ZSWC0my9DiiCbOu7FvYVPXcFM0qs8eyLJ2sFVcBmV8LTqJs7+
         NRs5hu0dbA6Lt4JxYK0dpt4qn36QLNVBq2zIJxLz4csNkYT4PzBLplV9FPzEcdU5w4BR
         5FBufP4tExV+01PKri5DMs8ffZD5KHkXGQz6bR883uGbwmVd4cv5rRVi8S9Gl5cMwLdV
         qwCXJNrrCstgxaGF7k+Mt05pXlw4qWC8sIYLISXVCjEw84u/+5/QHm+C6HW/87ih2qP9
         5KG1JefjiJ1BwibCuHY5XFi1aNXW+JT97hD92vws+BDHEJmSn5KEbvlHmeYtrEqVXnGB
         HpFA==
X-Gm-Message-State: AOJu0YxvzONrIhOv2G4w8sbSjRRSCVrYV8G8tjHiBVrQq8uorK5Y+kV0
	seTwEq76X7n7/m2HGQm9qDcgBGZ/3SP8xR0ZxAMl/vAaPfHS8x5KXuMVZZU/kXplPrWYWy3VkOp
	fOuJM0Z8vFAXjvV2WY7lp6rQwr8lk8+6Z/jS9beUF6cR0wZZAbMpNuVk7BuYI9d4=
X-Received: by 2002:a17:90a:e38c:b0:28b:ee58:6af9 with SMTP id b12-20020a17090ae38c00b0028bee586af9mr89944pjz.45.1703110376311;
        Wed, 20 Dec 2023 14:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwEkSypqppxNa6DzbllkKPFL0WNHCiPNexIbWvv6ZYq0p0TeVf2IZN0vR33CJkyQadJGqioZXGZv/CcW4QuWs=
X-Received: by 2002:a17:90a:e38c:b0:28b:ee58:6af9 with SMTP id
 b12-20020a17090ae38c00b0028bee586af9mr89931pjz.45.1703110375913; Wed, 20 Dec
 2023 14:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220051350.392350-1-kai.heng.feng@canonical.com> <d8e455b9-0a27-4361-8f92-9f1cb1fff537@gmx.de>
In-Reply-To: <d8e455b9-0a27-4361-8f92-9f1cb1fff537@gmx.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 21 Dec 2023 06:12:43 +0800
Message-ID: <CAAd53p62bJcuHAZMnYuKqoi_YV+W0zOuyQTCvjcKMBoVP68QBA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Install IPMI handler for Dell systems
To: Armin Wolf <W_Armin@gmx.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

On Wed, Dec 20, 2023 at 11:09=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 20.12.23 um 06:13 schrieb Kai-Heng Feng:
>
> > The following error can be observed at boot:
> > [    3.717920] ACPI Error: No handler for Region [SYSI] (00000000ab9e62=
c5) [IPMI] (20230628/evregion-130)
> > [    3.717928] ACPI Error: Region IPMI (ID=3D7) has no handler (2023062=
8/exfldio-261)
> >
> > [    3.717936] No Local Variables are initialized for Method [_GHL]
> >
> > [    3.717938] No Arguments are initialized for method [_GHL]
> >
> > [    3.717940] ACPI Error: Aborting method \_SB.PMI0._GHL due to previo=
us error (AE_NOT_EXIST) (20230628/psparse-529)
> > [    3.717949] ACPI Error: Aborting method \_SB.PMI0._PMC due to previo=
us error (AE_NOT_EXIST) (20230628/psparse-529)
> > [    3.717957] ACPI: \_SB_.PMI0: _PMC evaluation failed: AE_NOT_EXIST
> >
> > On Dell systems several methods of acpi_power_meter access variables in
> > IPMI region [0], so request module 'ipmi_si' which will load 'acpi_ipmi=
'
> > and install the region handler accordingly.
>
> Hi,
>
> this driver should be loaded automatically if an ACPI IPMI device is pres=
ent.
> Can you share the output of "acpidump"?

Yes it's loaded automatically, but it's loaded after acpi_power_meter,
so the patch only make sure ipmi_si and ipmi_acpi are loaded before
this module.

Kai-Heng

>
> Armin Wolf
>
> > [0] https://www.dell.com/support/manuals/en-us/redhat-enterprise-linux-=
v8.0/rhel8_rn_pub/advanced-configuration-and-power-interface-acpi-error-mes=
sages-displayed-in-dmesg?guid=3Dguid-0d5ae482-1977-42cf-b417-3ed5c3f5ee62
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >   drivers/hwmon/acpi_power_meter.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_powe=
r_meter.c
> > index 703666b95bf4..b9db53166bc9 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -882,6 +882,8 @@ static int acpi_power_meter_add(struct acpi_device =
*device)
> >       strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
> >       strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
> >       device->driver_data =3D resource;
> > +     if (dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> > +             request_module("ipmi_si");
> >
> >       res =3D read_capabilities(resource);
> >       if (res)
