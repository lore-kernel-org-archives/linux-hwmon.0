Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559314268
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jan 2024 03:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NOe2dazo"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 553163F73A
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jan 2024 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704253006;
	bh=X10895KQ3QE6ohq+NRMU0He1xRYscfKUHEWEvSElvJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NOe2dazotDTAPlbjKGwiTcfDzfmqjgbkOpqk4ddXfbTuy3i5OWLIb8ai5OQ3GgF6d
	 T7shxfwOIPotWg5m10Lm5XUpUv9Y1U2xcMX7vC15wnccO/kzVevdur6V3wj0K5ljT3
	 0saTS+4I37zmrPJaXJW2Km9v4EJaysHudFirEBEwy3omPJ0ti2ve6+WQ+qZ7JO7nPg
	 pYNry3ulTRZfAop/+dd17c/88j18FgbqkfGaSIHpByPRj2HXlO5xbY1qV2He+S1VWx
	 jIadi/kPa64T55EZBbtZpmqcvPKh/Qg7UARPSXXk6MskuQeLN8SY4GNT6maKQPHGN/
	 c9Os7Kk8vr8dg==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28bcf7f605aso77260a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Jan 2024 19:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704253005; x=1704857805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X10895KQ3QE6ohq+NRMU0He1xRYscfKUHEWEvSElvJg=;
        b=jPFqXkohgu3J3oNhlADUowgetTY/JVcj8qk8Ds43vs+1D0+ph5vPKGMu/7/Pk3S6vg
         MbigKsUJPjkd+ThQ625GxEfB5cSvGNKHY35I/9m5JpovwD88Rux3IP394DrwWAQJE4dR
         SYir2GtZ8+nvEFUJbhTkW+FLMoHrdK06mrd6hrZaTvImq8CZ53ivyQ3LwWINcnEHhOmv
         8DvjTcuUvB390HEFC3FiIr6bHerpMufYIFtUAI+o2Qqf1DZUGYVYfU5rMwER7DQMu/26
         /p0iOQgTHAQVRNwZzt3udAdWHopLcWqlKG64Mn7URkJkqIsKcEvKqnXkE5nN11VWPRgb
         FG8g==
X-Gm-Message-State: AOJu0YwZQrUhPi7qbAazEf76gmeGFbiVP8yhlAL8UgjhmqFUGxKTbgkq
	M3flz0bQSq4e9RsX9c6zdc/g1zcRoP3/XI0sa4kOm3Fgkjf5IFRbiqh/NmHabXULYz7uknjzlQ0
	vZogCThzTF7tISNLn4HCuhG+LK6T6gre5d9OivVHxBgYIEzaYpevG9piWwovz4lI=
X-Received: by 2002:a17:90b:4a42:b0:28c:815e:e0f0 with SMTP id lb2-20020a17090b4a4200b0028c815ee0f0mr534077pjb.37.1704253004885;
        Tue, 02 Jan 2024 19:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoYAqyj4LBWZ9v5lFAuvCXUaw6N52xAk67xXO+bjEa0tmcamKwqzJCjnZCgB6ohabHot5P6WfI9R8vQVJ6qzs=
X-Received: by 2002:a17:90b:4a42:b0:28c:815e:e0f0 with SMTP id
 lb2-20020a17090b4a4200b0028c815ee0f0mr534065pjb.37.1704253004518; Tue, 02 Jan
 2024 19:36:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231227040401.548977-1-kai.heng.feng@canonical.com> <40694180-cc87-4ae2-9929-8451d43f428d@roeck-us.net>
In-Reply-To: <40694180-cc87-4ae2-9929-8451d43f428d@roeck-us.net>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 3 Jan 2024 11:36:32 +0800
Message-ID: <CAAd53p6scYNAohvwBJ1gSk6of2xSPLVDpjCkMZ0t2tff2Oww5w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (acpi_power_meter) Ensure IPMI space handler is
 ready on Dell systems
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 5:58=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Wed, Dec 27, 2023 at 12:04:00PM +0800, Kai-Heng Feng wrote:
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
> > IPMI region [0], so wait until IPMI space handler is installed by
> > acpi_ipmi and also wait until SMI is selected to make the space handler
> > fully functional.
> >
> > [0] https://www.dell.com/support/manuals/en-us/redhat-enterprise-linux-=
v8.0/rhel8_rn_pub/advanced-configuration-and-power-interface-acpi-error-mes=
sages-displayed-in-dmesg?guid=3Dguid-0d5ae482-1977-42cf-b417-3ed5c3f5ee62
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> > v2:
> >  - Use completion instead of request_module().
> >
> >  drivers/acpi/acpi_ipmi.c         | 13 ++++++++++++-
> >  drivers/hwmon/acpi_power_meter.c |  4 ++++
> >  include/acpi/acpi_bus.h          |  4 ++++
>
> This needs to be split into two patches.

Will do.

>
> >  3 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/acpi_ipmi.c b/drivers/acpi/acpi_ipmi.c
> > index 0555f68c2dfd..2ea8b7e6cebf 100644
> > --- a/drivers/acpi/acpi_ipmi.c
> > +++ b/drivers/acpi/acpi_ipmi.c
> > @@ -23,6 +23,8 @@ MODULE_LICENSE("GPL");
> >  #define IPMI_TIMEOUT                 (5000)
> >  #define ACPI_IPMI_MAX_MSG_LENGTH     64
> >
> > +static struct completion smi_selected;
> > +
> >  struct acpi_ipmi_device {
> >       /* the device list attached to driver_data.ipmi_devices */
> >       struct list_head head;
> > @@ -463,8 +465,10 @@ static void ipmi_register_bmc(int iface, struct de=
vice *dev)
> >               if (temp->handle =3D=3D handle)
> >                       goto err_lock;
> >       }
> > -     if (!driver_data.selected_smi)
> > +     if (!driver_data.selected_smi) {
> >               driver_data.selected_smi =3D ipmi_device;
> > +             complete(&smi_selected);
> > +     }
> >       list_add_tail(&ipmi_device->head, &driver_data.ipmi_devices);
> >       mutex_unlock(&driver_data.ipmi_lock);
> >
> > @@ -578,10 +582,17 @@ acpi_ipmi_space_handler(u32 function, acpi_physic=
al_address address,
> >       return status;
> >  }
> >
> > +void wait_for_acpi_ipmi(void)
> > +{
> > +     wait_for_completion_interruptible_timeout(&smi_selected, 2 * HZ);
>
> wait_for_completion_interruptible_timeout) returns an error code which
> should be returned to the caller.

Will do in next revision.

>
> > +}
> > +EXPORT_SYMBOL_GPL(wait_for_acpi_ipmi);
> > +
> >  static int __init acpi_ipmi_init(void)
> >  {
> >       int result;
> >       acpi_status status;
> > +     init_completion(&smi_selected);
> >
> >       if (acpi_disabled)
> >               return 0;
> > diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_powe=
r_meter.c
> > index 703666b95bf4..acaf1ae68dc8 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -883,6 +883,10 @@ static int acpi_power_meter_add(struct acpi_device=
 *device)
> >       strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
> >       device->driver_data =3D resource;
> >
> > +     if (dmi_match(DMI_SYS_VENDOR, "Dell Inc.") &&
> > +         acpi_dev_get_first_match_dev("IPI0001", NULL, -1))
> > +             wait_for_acpi_ipmi();
>
> wait_for_acpi_ipmi() should return an error code which
> should be handled here.

OK, I think print an message should be informative.

>
> > +
> >       res =3D read_capabilities(resource);
> >       if (res)
> >               goto exit_free;
> > diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> > index 1216d72c650f..ed59fb89721e 100644
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@ -655,6 +655,7 @@ bool acpi_device_override_status(struct acpi_device=
 *adev, unsigned long long *s
> >  bool acpi_quirk_skip_acpi_ac_and_battery(void);
> >  int acpi_install_cmos_rtc_space_handler(acpi_handle handle);
> >  void acpi_remove_cmos_rtc_space_handler(acpi_handle handle);
> > +void wait_for_acpi_ipmi(void);
> >  #else
> >  static inline bool acpi_device_override_status(struct acpi_device *ade=
v,
> >                                              unsigned long long *status=
)
> > @@ -672,6 +673,9 @@ static inline int acpi_install_cmos_rtc_space_handl=
er(acpi_handle handle)
> >  static inline void acpi_remove_cmos_rtc_space_handler(acpi_handle hand=
le)
> >  {
> >  }
> > +static inline void wait_for_acpi_ipmi(void)
> > +{
> > +}
>
> Something with the conditional is wrong. See 0-day report.

Will fix that in next revision.

Kai-Heng

>
> Guenter
> >  #endif
> >
> >  #if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
> > --
> > 2.34.1
> >
> >
