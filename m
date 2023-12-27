Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8653C24
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Dec 2023 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="UIfIgw+B"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 01F5A3F3EE
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Dec 2023 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703648401;
	bh=b9b44p3v9yEswK/7ApPR7QhcAvCzj1p9rW76zAZfllA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UIfIgw+BprnRtZz5mNjMkkIcWEEkWBMEZ4FhaGMz48Skv0nlqKmNWINyG1rqq2Zje
	 npJNGOzZBbIQ30xkqW3A1xP7+bcuu1vWb8kTIE7DOI5Xo0a6Fx7jabIzdC5lUwnF7f
	 6cUcYQK5/C9FXzFVrrkKQGVSW9zc1LB2ehAT+7Uo4viZ0h5Eg5CRrMoAdb4gPpTB5w
	 uTY2xv6CWJJbvaBxoJLUNfmavZ+ugvJ6v4aeDvLEKRY3jQ/LB0Lgfr7+fr33DQLFNg
	 zzKFwyB3afpE0NLNme8g6vnSGenHTrwLoCC2BI/ySAxuSblnHD4rjsBh2Wx+w4kXKK
	 oevPxb0+zk7Aw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28be4c11462so3901566a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Dec 2023 19:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703648399; x=1704253199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9b44p3v9yEswK/7ApPR7QhcAvCzj1p9rW76zAZfllA=;
        b=lOoi7NVQAQWlJIqR9K6s1Y5wUAjwb3pnRTmj7OVz4eGUl2SHLG6c7ppxjRtrivuPdp
         5DxOx2+yVnm5Qb4k9m2xZJIGe9Vg7PtUVWi5hwoYbqbRV+5G6WOdX6xs+qrvpR9WiGMQ
         PG6RJJJJDrMa0oBsSn+josC/Ij5nosH7UAjp++vMDO9oje0xkeXRFILE/qekPTsagmF+
         0wSbVCOv5f0vw9/wQicCQiK33botXy4LWIDgoWktQf4/7BtVjMuEF50xbfXvqD0rLSjm
         hPmyBvEsGUynE+hnEj1ttt2Ns8Q7rfWzc6khm2dXOgJqgViOnTpl0MPZZcvDx0lGQVqg
         mtRQ==
X-Gm-Message-State: AOJu0Yy0pchOE0Bqqld/0wp4+35tHAzZ5UsAeP5AS2ou2sVsYYDQfgBP
	iPI+PDWI/Qqw04vVAaNwgixm40UaXkdwKbmzT9PGq7XOxmHQNEq9bpvDn00dUcnh/jYT9P2b5RC
	9DDRn32r4KJlJIB8VZlna8XVPF+HiDRSDelu7BQxu7MvgKW/fzamAUgUE7vmueYI=
X-Received: by 2002:a17:90b:4a09:b0:28c:3042:a7c4 with SMTP id kk9-20020a17090b4a0900b0028c3042a7c4mr7181762pjb.4.1703648399176;
        Tue, 26 Dec 2023 19:39:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJQN7XGC4gxGHvy5cDdQb2xKn2G0oAu/yccfKLjunAzamS+YxvTEWsUuY4hhnfutUfKWDb3cmqTo8oHqx09+k=
X-Received: by 2002:a17:90b:4a09:b0:28c:3042:a7c4 with SMTP id
 kk9-20020a17090b4a0900b0028c3042a7c4mr7181757pjb.4.1703648398848; Tue, 26 Dec
 2023 19:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220051350.392350-1-kai.heng.feng@canonical.com>
 <5a81eda0-5044-4088-9aba-cf725e6fca9a@roeck-us.net> <CAAd53p4NNX9c5pUJgv12V=s_1YJxM3=G+OCYTgcRPqSJVbdi8w@mail.gmail.com>
 <3d777aee-9ec1-4236-98d2-f56b8026b96a@gmx.de>
In-Reply-To: <3d777aee-9ec1-4236-98d2-f56b8026b96a@gmx.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 27 Dec 2023 11:39:46 +0800
Message-ID: <CAAd53p6POFCNEP4J8U_jTexBkxOn-15ULRqQj+r2GA3q2+1raQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Install IPMI handler for Dell systems
To: Armin Wolf <W_Armin@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

On Fri, Dec 22, 2023 at 8:08=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 22.12.23 um 04:57 schrieb Kai-Heng Feng:
>
> > Hi Guenter,
> >
> > On Thu, Dec 21, 2023 at 7:49=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >> On Wed, Dec 20, 2023 at 01:13:50PM +0800, Kai-Heng Feng wrote:
> >>> The following error can be observed at boot:
> >>> [    3.717920] ACPI Error: No handler for Region [SYSI] (00000000ab9e=
62c5) [IPMI] (20230628/evregion-130)
> >>> [    3.717928] ACPI Error: Region IPMI (ID=3D7) has no handler (20230=
628/exfldio-261)
> >>>
> >>> [    3.717936] No Local Variables are initialized for Method [_GHL]
> >>>
> >>> [    3.717938] No Arguments are initialized for method [_GHL]
> >>>
> >>> [    3.717940] ACPI Error: Aborting method \_SB.PMI0._GHL due to prev=
ious error (AE_NOT_EXIST) (20230628/psparse-529)
> >>> [    3.717949] ACPI Error: Aborting method \_SB.PMI0._PMC due to prev=
ious error (AE_NOT_EXIST) (20230628/psparse-529)
> >>> [    3.717957] ACPI: \_SB_.PMI0: _PMC evaluation failed: AE_NOT_EXIST
> >>>
> >>> On Dell systems several methods of acpi_power_meter access variables =
in
> >>> IPMI region [0], so request module 'ipmi_si' which will load 'acpi_ip=
mi'
> >>> and install the region handler accordingly.
> >>>
> >>> [0] https://www.dell.com/support/manuals/en-us/redhat-enterprise-linu=
x-v8.0/rhel8_rn_pub/advanced-configuration-and-power-interface-acpi-error-m=
essages-displayed-in-dmesg?guid=3Dguid-0d5ae482-1977-42cf-b417-3ed5c3f5ee62
> >>>
> >>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >>> ---
> >>>   drivers/hwmon/acpi_power_meter.c | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_po=
wer_meter.c
> >>> index 703666b95bf4..b9db53166bc9 100644
> >>> --- a/drivers/hwmon/acpi_power_meter.c
> >>> +++ b/drivers/hwmon/acpi_power_meter.c
> >>> @@ -882,6 +882,8 @@ static int acpi_power_meter_add(struct acpi_devic=
e *device)
> >>>        strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME)=
;
> >>>        strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
> >>>        device->driver_data =3D resource;
> >>> +     if (dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> >>> +             request_module("ipmi_si");
> >>>
> >> This looks like a terrible hack to me. Is there precedent of similar h=
acks
> >> elsewhere showing that this is the "way to go" ?
> > Yes it's ugly.
> >
> > The error happens in the ACPI ASL code, so it's not possible to know
> > if any method of apci_power_meter requires IPMI region.
> > I really can't think of any better solution for it.
> >
> > Kai-Heng
>
> Maybe we could use an ACPI scan handler for that?
> Basically we would call request_module() upon discovering an ACPI IPMI de=
vice,
> so that the necessary module is available for handling the IPMI opregion.
> This would also prevent any issues should other devices also require IPMI=
 access.

I think the ACPI core already does this. But since the modules are
loading and probing asynchronously, the order needs to be enforced.
I'll send another revision that doesn't use request_module().

Kai-Heng

>
> Armin Wolf
>
> >> Guenter
> >>
> >>>        res =3D read_capabilities(resource);
> >>>        if (res)
> >>> --
> >>> 2.34.1
> >>>
