Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF6F1A9F82
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770406555; cv=none; b=ILqKL+fbS8PWnkBBkwhA4e9xDazUz5ppHb0ZO7CLD279kjStWNilkDvmx7nf+sdP6iExwjnv28pMDe8BGQEL8ypgre5rF7DYuKZ/q0u4pQDF4lknQXDG+Id6q9lyiKbCoa2erkCpmgJt0dpJwqd+7Wyg/jrkxWFaJzcRIL+FF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770406555; c=relaxed/simple;
	bh=oRf0JIwZUDaaXV4KZFNbvumYEkV3ZmLhwkG2OaRKQsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF2kaM1Z8W2WV6zhT9XD8tEEdeDuD7RNigz1fzPfg0FX2L2ekb6R6BpmD4mW+WKp14b8j1ntV6nfwzkAR18jfQ86KiO9DcUlBsc/BofilY2Nc4XRw6y4K5NA7pmmNIB/7lQ/ZCC3mKruusCIhOFB3iSpUfehLO2KsFxAQRYUIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2QjKPPj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2QjKPPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F334C19424
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770406555;
	bh=oRf0JIwZUDaaXV4KZFNbvumYEkV3ZmLhwkG2OaRKQsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W2QjKPPjcNOgFggiX18XF6n02xbwW1441e3KgJztVwoePC6my1vtHl4ngnzsde+Bv
	 Rrr3GBu9OZ5pByKC0jcSUEyhdpcmeVtV8JZ9BxR+Khu3s9O0/X4xCde2J93hdIpfVd
	 RpVgL9yNH8vKWYAeUvmvzxXwaGA61pZqZ9Jq7hKiQSI3l+YHykbjCM9UzOwFPFqc5J
	 6VZN1NPaMVyXR5j0a6oRyg1DVByLfcUrMrk9LRAZSgDAHgSE6eITNmnarBRRqg8Xaq
	 rmygnYieKbCPvbjEGvOPr/a0k5M7cf9BC2Rn11bWVkRBXg/5dtJ2nPiucz5rucq7Sy
	 OjthoqiiLzNRw==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-662cab9d4c2so735330eaf.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 11:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5SSM89ihUCGzsxzq27T4vIN/PToV09VI7dd1dYjTbiARVmubR+V5i4705v/Aice2oR6elDKETpV+Omw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMaywf8SyInvSteVdO8y/8Kf0s6Ikd3k/lOVKC9r3EbgBAZI0
	Kmm7s0VTQVvUPBwlftz8C3OLwd73fJso+tO+6Wc06oIW3FCNygGSEbJQGNvTnvyv2Ogv4fjFIEI
	Sc/wkN+HTp/D6LURTZKdQi648KW50iHM=
X-Received: by 2002:a4a:b684:0:b0:66e:4279:3e13 with SMTP id
 006d021491bc7-66e427a01d3mr413777eaf.48.1770406554153; Fri, 06 Feb 2026
 11:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net> <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net> <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
 <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net> <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
 <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net> <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>
 <aYYSDWaeiCnkwqAF@mail.minyard.net> <c9ecdbd1-cc50-4e3a-9540-6a4917dc07d6@roeck-us.net>
In-Reply-To: <c9ecdbd1-cc50-4e3a-9540-6a4917dc07d6@roeck-us.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 6 Feb 2026 20:35:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ht59yZ6jetQfM6TTm-AGVanJk2dO5mDUvYgnY+_bOghg@mail.gmail.com>
X-Gm-Features: AZwV_QgUF5YPX8vK3Fbkcxgm9UpsQW5nwD6lJM9zBKWeOxC4vTdEhktARX9k8po
Message-ID: <CAJZ5v0ht59yZ6jetQfM6TTm-AGVanJk2dO5mDUvYgnY+_bOghg@mail.gmail.com>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average sysfs
 read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: corey@minyard.net, "Rafael J. Wysocki" <rafael@kernel.org>, Igor Raits <igor@gooddata.com>, 
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Daniel Secik <daniel.secik@gooddata.com>, 
	Zdenek Pesek <zdenek.pesek@gooddata.com>, Jiri Jurica <jiri.jurica@gooddata.com>, 
	Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 5:31=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 2/6/26 08:08, Corey Minyard wrote:
> > On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki wrote:
> >> On Thu, Feb 5, 2026 at 11:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
> >>>
> >
> > snip..
> >
> >>
> >>> 2. Excessive Polling (Timer Overwrite):
> >>> In `smi_timeout()`, the timer is unconditionally reset to a short tim=
eout (e.g., 10ms) at the end of the function, unless the state machine is I=
DLE. When the state machine returns `SI_SM_HOSED`, `smi_event_handler()` co=
rrectly sets the timer to a long backoff (1 second). However, `smi_timeout(=
)` subsequently overwrites this with the short timeout. This causes the dri=
ver to poll the hosed BMC every 10ms instead of backing off for 1 second, r=
esulting in unnecessary CPU overhead.
> >>
> >> Well, that's not nice, but it doesn't seem to be related to the
> >> observed symptoms.
> >
> > I have a fix for this, too.  Thanks for the report.
> >
>
> Thanks is due to Gemini 3, really (I would not have seen that problem),
> and to the AI model used by Igor.

Well, Jaroslav reported the misbehavior, tested patches and then
bisected it down to the problematic commit.

Without that we wouldn't have known what to feed to the AI even.
