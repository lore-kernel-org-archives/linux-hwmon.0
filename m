Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38630DD2A
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318265; cv=none; b=e2hstwGfQbZh0XjnqCMMESZogFbljrF5Z0g8VPTPP5WQfCFmsKNyBtS0KXrfq1O4wESF9NC63REAd7AHfI5lz2nmhrEPVezBtV7G1Ve//MKT22mmnV7Rh4Gn2HeUzsw5v33wa9wn6c/Tx7IPUsgpSMG4INniqU0NUb/1Jcrjzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318265; c=relaxed/simple;
	bh=LaOyk51dqguMNCfrnB1hkzbCh43v+3hDyynKy9Ya4VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m30xIfS+aO4nthZD8Ow37I+9ff+CM4vtmPx9oVp85i/xhrVKZXBV/+IaiBnXxfyg6yL4mL6xT9ql9eXOoMvcbHU9DDA/TB1GSAujg32Hy6kndRGcxhLAXELZ+HTQ1uPhyw5khq1STD7Xr03dH2nWAchDXCzN5gIhAsQjhjJV7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Temv7ei6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Temv7ei6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D88EC2BC87
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770318265;
	bh=LaOyk51dqguMNCfrnB1hkzbCh43v+3hDyynKy9Ya4VM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Temv7ei6+cJf3v5Zh3c9K6XmUrOeZupiLSX4jTp5hdj+369h5ros/lWB3OJEJ6C9B
	 Fz/61mLucZWq02l1sxnGa6QGlPv/YwZzcF/Bbspg+FT0cGMcoRdlGCA2M2cQofrpQE
	 6fJjbZvdwpAECmY/Bzw9tkofmdIlkbr6r/mrXT92/w4AeJ6Tt3Gtx/FQlKR0QPNQ+S
	 E4TJ9pZt9s/vfVS5Jucnuz48Dy9eSTh3i/wVmDHGsZxYqfiJjJWyPF481IFIjCnlRf
	 AJDMOcFq9BOse4fzW4ReGQKylvj6CNryIHQaJY0vAJNb0JsPK3cJ3c9/BkSSsKxoMX
	 MV6XPeozYtiSA==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7cfd6f321b5so821408a34.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 11:04:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHCFvKDybwPDyiKcSb9MfVUw1X36qf0oySvSzZA/dSd4EpBXDTIiGiBgo1jYIQacf1dJQA5m4CsViMSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUs7t1+yG2H2qkJB8f5/YLfaBHnVs369J5U23+2f+GdcBwjYmr
	/CLRczjIUTtTG5f4vyEgBFQcvI4/o3Uan4PU+cd6+HUk+13jNt0QHm3OkDdxYVxJGXu7FRT6Qxv
	47YhPN85VUKNqQwckt7ttG/DKAWNKf7Y=
X-Received: by 2002:a05:6830:8387:b0:7cf:d0b4:bab7 with SMTP id
 46e09a7af769-7d448ae4280mr4996735a34.34.1770318264040; Thu, 05 Feb 2026
 11:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
 <27d60756-d33e-4926-9a02-f52505339de6@roeck-us.net> <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net> <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net> <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
 <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
In-Reply-To: <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 5 Feb 2026 20:04:12 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
X-Gm-Features: AZwV_QhRXq92W5JvpZ-AenUF3DeliUWsbAESXBgZtRSuXVXgahwTkFB58KDrqhQ
Message-ID: <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
Subject: Re: [BISECTED]: acpi_power_meter: power*_average sysfs read hangs,
 mutex deadlock in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: Igor Raits <igor@gooddata.com>, Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>, 
	Corey Minyard <corey@minyard.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cc: Corey

On Thu, Feb 5, 2026 at 6:51=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits wrote:
> > On Wed, Feb 4, 2026 at 11:49=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> > >
> > > On 2/4/26 11:54, Igor Raits wrote:
> > > > I have written a patch with the help of AI and it fixes the problem=
. Attached.
> > > >
> > >
> > > "No MIME, no links, no compression, no attachments.  Just plain text"
> >
> > Sorry for that, I had assumed that attaching the file would make it in-=
line.
> >
> > > ... which means I can not provide inline feedback, which is the whole
> > > point of the above.
> > >
> > > Your patch crosses subsystems, so it will need to be split in two
> > > (assuming the ACPI side is even needed). Also, references to iDRAC
> > > in common code seem inappropriate.
> >
> > Yes, this I believe was the essential part (it was the last piece in
> > my testing which fixed the hanging):
> >
>
> Then I'll need to ask differently: What happens if you drop the IPMI code=
,
> and just keep the wait_for_completion -> wait_for_completion_timeout
> change ? Would that be sufficient to solve the problem ?

I'd rather say "Would that be sufficient to make the symptoms go
away?" as it most likely papers over the real problem.

> Either case, the need for this change suggests that the ipmi change
> may not be complete, since it should send a completion with an error.

I think that reverting commit bc3a9d217755 ("ipmi:si: Gracefully
handle if the BMC is non-functional") should also be considered as a
possible way forward because it clearly did not improve things as
expected, at least in this particular case.

It evidently did something that confuses things quite a bit.  Either
it is returning IPMI_BUS_ERR instead of IPMI_ERR_UNSPECIFIED, or it is
the "hosed" state and refusing to accept messages.

> > diff --git a/drivers/acpi/acpi_ipmi.c b/drivers/acpi/acpi_ipmi.c
> > index 5fba4dab5d08..ab1f4b27741d 100644
> > --- a/drivers/acpi/acpi_ipmi.c
> > +++ b/drivers/acpi/acpi_ipmi.c
> > @@ -572,7 +572,18 @@ acpi_ipmi_space_handler(u32 function,
> > acpi_physical_address address,
> >                 status =3D AE_ERROR;
> >                 goto out_msg;
> >         }
> > -       wait_for_completion(&tx_msg->tx_complete);
> > +
> > +       /*
> > +        * Use a timeout to avoid blocking forever if the BMC is slow
> > +        * or non-responsive (e.g., during iDRAC reset). The timeout
> > +        * should be longer than IPMI_TIMEOUT to allow for retries.
> > +        */
> > +       if (!wait_for_completion_timeout(&tx_msg->tx_complete,
> > +                                        msecs_to_jiffies(IPMI_TIMEOUT =
* 3))) {
> > +               dev_warn_once(ipmi_device->dev,
> > +                             "ACPI IPMI request timed out\n");
> > +               tx_msg->msg_done =3D ACPI_IPMI_TIMEOUT;
> > +       }
> >
> >         acpi_format_ipmi_response(tx_msg, value);
> >         status =3D AE_OK;
> >
> > > Thanks,
> > > Guenter
> > >
> > > > I don't know how correct it is, but it works :)
> > > >
> > > > On Wed, Feb 4, 2026 at 2:01=E2=80=AFAM Guenter Roeck <linux@roeck-u=
s.net> wrote:
> > > >>
> > > >> On 2/3/26 15:21, Jaroslav Pulchart wrote:
> > > >>
> > > >>> ...
> > > >>> $ git bisect bad
> > > >>> bc3a9d217755f65c137f145600f23bf1d6c31ea9 is the first bad commit
> > > >>> commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 (HEAD)
> > > >>> Author: Corey Minyard <corey@minyard.net>
> > > >>> Date:   Wed Aug 20 14:56:50 2025 -0500
> > > >>>
> > > >>>       ipmi:si: Gracefully handle if the BMC is non-functional
> > > >>>
> > > >>>       If the BMC is not functional, the driver goes into an error=
 state and
> > > >>>       starts a 1 second timer.  When the timer times out, it will=
 attempt a
> > > >>>       simple message.  If the BMC interacts correctly, the driver=
 will start
> > > >>>       accepting messages again.  If not, it remains in error stat=
e.
> > > >>>
> > > >>>       If the driver goes into error state, all messages current a=
nd pending
> > > >>>       will return with an error.
> > > >>>
> > > >>>       This should more gracefully handle when the BMC becomes non=
-operational,
> > > >>>       as opposed to trying each messages individually and failing=
 them.
> > > >>>
> > > >>>       Signed-off-by: Corey Minyard <corey@minyard.net>
> > > >>>
> > > >>>    drivers/char/ipmi/ipmi_si_intf.c | 29 +++++++++++++++++++++++-=
-----
> > > >>>    1 file changed, 23 insertions(+), 6 deletions(-)
> > > >>
> > > >> Now that is interesting. Does reverting that patch on top of 6.18.=
8
> > > >> (or any other 6.18 release) solve the problem ?
