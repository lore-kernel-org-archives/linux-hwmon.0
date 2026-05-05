Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDE2D9EFB
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994078; cv=none; b=MbI6hu1GWvyOOci5CkaM+REzKJMEqovT9qESyDG9juBaqrer+9V05v8xn0j4jLDASJN5sWXEadK8eNfdf4D3wpzj6CqftVtfFXdNp9tORy7n+pX43k7FkSt0m2AnP5PCvw6A+iNL8hfZjvFsvi+taeVo1spDOHeTY4YYz+35SfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994078; c=relaxed/simple;
	bh=nwGdY/S9WABXVGxp+rB6OdROhGj1euGmTAAsMSG/Ilw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CN0GN9nVODtQ1GytGWajq9A58TM9y9yLci/M03GywWHK8Wq4/kp9W1bpQ8v/coW5gqda7JMZwffDA+AUeVMpUXEuHKEOMTbCnUO0Vl7PoKpFjmg/A6TN18+JPwzspR0brkZq4bkyFcWkSPx/4t0ovc3e04efLERdJv/KaX+r588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwoVnMCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwoVnMCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E8FC2BCF4
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777994078;
	bh=nwGdY/S9WABXVGxp+rB6OdROhGj1euGmTAAsMSG/Ilw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HwoVnMCKWZIUajswxOSdodHgT6Mqnml0olLOOyfM2me1ub3uiTwGL3ZqLdjEuhDCo
	 RILVQEvYxV/0ZykgKM5q6MW7IYkZ37iqYVMYqk5wJdFbBd6hFddPLUdHYjH8/h5s10
	 weHJBWTleIUsDY5wjHhFnrTTuPupZRZD8OEccitIkXLtbBmbmUcnSGXwQhRlvXnRAU
	 3l7iY7YvQJDjCmGlHspN6l/EvAcBXkVP0LFaid7AMzI0H7j7mCyRH4522+MiC5/6j0
	 fT8YuywXUtc8g34w0EXUhJ4qhM/iH5WmX7gDrAhPgSMnld+YvTwfoV0t7xiz+66FC2
	 Hf5v/2eeC1gBA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so7069640e87.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 08:14:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/j23rbHa020/mPl3oallMcO0pB/Xq+q0DH2IvTc5Rhz13Ens1eFZsqH7ZJ0WzPUarCV6hVClXdFQi/uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LtRQVMciKWI1IcBi6oliZ3FPGj5FA//R60efdB7eCQkPjPA/
	ussgJBG/5PLtTWCRlbFr7+8a8nE2JiKEVl7rLbtTtwqG0uxDkDwvEPcJPJmPNfd594r/g2T7J8E
	fgx9R993nWaAxvVDlggLyN4OqQdd1B3k=
X-Received: by 2002:a05:6512:400f:b0:5a3:f2ed:87cd with SMTP id
 2adb3069b0e04-5a862ec316bmr4880714e87.10.1777994076783; Tue, 05 May 2026
 08:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3070412.e9J7NaK4W3@rafael.j.wysocki> <20260505124114.87E85C2BCB9@smtp.kernel.org>
 <CAJZ5v0hcJFk-M27AEkHugqPZ-rH4td8HZnMc209kgpDFnmbs9g@mail.gmail.com> <6fdf5a6b-730c-4c33-95a8-35078785f73c@roeck-us.net>
In-Reply-To: <6fdf5a6b-730c-4c33-95a8-35078785f73c@roeck-us.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 May 2026 17:14:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gcatfUYocWViAZjs=BkqSz-JK+bECm2cpanv9NrWgfnw@mail.gmail.com>
X-Gm-Features: AVHnY4JYgTiEHcRRFstuHq1n9_bFLiNz-FKMMZAAveW3BEnGZ-BdEHnfbrL7KFI
Message-ID: <CAJZ5v0gcatfUYocWViAZjs=BkqSz-JK+bECm2cpanv9NrWgfnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, sashiko@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 4:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 5/5/26 07:40, Rafael J. Wysocki wrote:
> > On Tue, May 5, 2026 at 2:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [Critical] Changing the hwmon device name and splitting aggregate de=
vices breaks userspace hwmon tools and configurations.
> >> --
> >>
> >> commit ef04f4845b76df7ab7442699654ee8214cc3a4ea
> >> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>
> >> thermal: hwmon: Register a hwmon device for each thermal zone
> >>
> >> The current code creates one hwmon device per thermal zone type and re=
gisters
> >> it under the first thermal zone of that type. This commit addresses re=
moval
> >> issues by registering one hwmon device for each thermal zone individua=
lly,
> >> appending the zone ID to the hwmon name, and giving each its own temp1=
_input.
> >>
> >> Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia62=
64@gmail.com/
> >>
> >>> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/therma=
l_hwmon.c
> >>> index 597c33c8a5550..223ae1571655b 100644
> >>> --- a/drivers/thermal/thermal_hwmon.c
> >>> +++ b/drivers/thermal/thermal_hwmon.c
> >>
> >> [ ... ]
> >>
> >>> @@ -137,54 +101,39 @@ int thermal_add_hwmon_sysfs(struct thermal_zone=
_device *tz)
> >>>   {
> >>>        struct thermal_hwmon_device *hwmon;
> >>>        struct thermal_hwmon_temp *temp;
> >>> -     int new_hwmon_device =3D 1;
> >>>        int result;
> >>>
> >>> -     hwmon =3D thermal_hwmon_lookup_by_type(tz);
> >>> -     if (hwmon) {
> >>> -             new_hwmon_device =3D 0;
> >>> -             goto register_sys_interface;
> >>> -     }
> >>> -
> >>>        hwmon =3D kzalloc_obj(*hwmon);
> >>>        if (!hwmon)
> >>>                return -ENOMEM;
> >>>
> >>> -     INIT_LIST_HEAD(&hwmon->tz_list);
> >>> -     strscpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
> >>> -     strreplace(hwmon->type, '-', '_');
> >>> +     /*
> >>> +      * Append the thermal zone ID preceded by an underline characte=
r to the
> >>> +      * type to disambiguate the sensors command output.
> >>> +      */
> >>> +     scnprintf(hwmon->name, THERMAL_HWMON_NAME_LENGTH, "%s_%d", tz->=
type, tz->id);
> >>> +     strreplace(hwmon->name, '-', '_');
> >>
> >> Could this change to the hwmon name attribute cause a regression for u=
serspace
> >> tools?
> >>
> >> Tools and configuration files, such as sensors.conf, typically use the=
 name
> >> attribute for matching devices (for example, matching acpitz-*). Appen=
ding an
> >> instance-specific ID to the name might prevent these configurations fr=
om
> >> applying correctly.
> >
> > Or not.
> >
> >>>        hwmon->device =3D hwmon_device_register_for_thermal(&tz->devic=
e,
> >>> -                                                       hwmon->type, =
hwmon);
> >>> +                                                       hwmon->name, =
hwmon);
> >>>        if (IS_ERR(hwmon->device)) {
> >>>                result =3D PTR_ERR(hwmon->device);
> >>>                goto free_mem;
> >>>        }
> >>>
> >>> - register_sys_interface:
> >>> -     temp =3D kzalloc_obj(*temp);
> >>> -     if (!temp) {
> >>> -             result =3D -ENOMEM;
> >>> -             goto unregister_name;
> >>> -     }
> >>> +     temp =3D &hwmon->tz_temp;
> >>>
> >>>        temp->tz =3D tz;
> >>> -     hwmon->count++;
> >>>
> >>> -     snprintf(temp->temp_input.name, sizeof(temp->temp_input.name),
> >>> -              "temp%d_input", hwmon->count);
> >>> -     temp->temp_input.attr.attr.name =3D temp->temp_input.name;
> >>> +     temp->temp_input.attr.attr.name =3D "temp1_input";
> >>
> >> Does splitting aggregate devices break existing sysfs access patterns?
> >>
> >> Previously, a single hwmon device might have contained multiple temper=
ature
> >> inputs, like temp1_input and temp2_input. Since each zone now gets its=
 own
> >> hwmon device with only a temp1_input, scripts or tools that explicitly=
 read
> >> temp2_input from the old aggregate device path will likely fail with a=
 missing
> >> file error.
> >
> > Does this happen in practice though?
> >
> I guess we'll see.

Right.
