Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598023D7CF
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932007; cv=none; b=LLeB0v/eiQGmNLl2jLY5BazvYOFrnjhLbVPxl03PW6dr9BsC2uBhsV30LyMK9mDC2GdPm0TOkde4ZBX+EwyPC2SwNBN0VLMV+QddoEz8vrmkPtdO+/VsJWTyrMLYGHB7Lu0z3pnJOghw1bzeuOqOOqY857k1QORBX2VEaCrsXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932007; c=relaxed/simple;
	bh=WGDKNBR79wbUpYd7EsuSLYgwm5lwDAjT5VgRqZxipgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW1Uz4NC8M75LkvOhRXRUXl4gbLfNHXuyN60nrNKXFRHEsQZIqX6Ucslij1SRR9STo295wi3/wy0hPT1apfsMQ2wnJe8qmo9PNsymafJtYV1rCr0gHuedfjbsNSmzLcMF6y45oZffbvlVE6qlxKQTe2US2Bh/EIoRltupmCk/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/MDUgbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/MDUgbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576CFC2BC9E
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770932007;
	bh=WGDKNBR79wbUpYd7EsuSLYgwm5lwDAjT5VgRqZxipgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/MDUgbPX4aoDuQNKbfJOXf0dYds2iTD787HrpHl0yRz1dB7/+jgSo/j/rfAXQbXS
	 DhVG8eZrot1UqmdN4V1n6dXDsX09ODACyd4xHYx5bqtHQiBtfHuRZhxdtl3lwDTLoC
	 kzmT3+7jY4cPlImPK/elOSEOxzyWrUY+s5okGkYZ9TjGPGCy1WF8t/a2fFJ9pqIQxO
	 ZqozWTlZbowW+taGQHX8gb4jVoyMk1tDX7jhgpp/JFL3ArLrDq6oq2c5OIq+GQq2uW
	 +1EfBujuj9GI3p0Yu02H5fAHplJQ1/40APlvdAhrt2JYXW26Fm/eCgI6RftGngMgPH
	 8l73wWjdaMNaA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4043b27ddeaso176607fac.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 13:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhEsOnh0LFM3C321oH/vq2e7TPZTdVrn5Ueqp24TbMuGs3qQFUenM32B7JTSYvWU2lqBfAE6xp2a30pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dmEUMyE4m83QCL9TkK3ixN+8rDb5Dms5YkYhfFQqPQ0ZVQd/
	/vEKBsKcfE1GmgFjn6+WUiSIGcCtqJKIhs8x1swGHq51IqqakZDQAHud2PmuRikkda1uJ0MQ1fp
	UCt75+0U0hxqX/VaszcEKeuzOBuQkeSg=
X-Received: by 2002:a05:6870:30a:b0:3d4:b76:5080 with SMTP id
 586e51a60fabf-40eeead785bmr100084fac.28.1770932006339; Thu, 12 Feb 2026
 13:33:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
 <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
 <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net> <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>
 <aYYPnATz1JakV3m7@mail.minyard.net> <CAJZ5v0h1irjy_ovyQw9ObGOTAUWajT_BK6u=rWQqR9awQBrY3A@mail.gmail.com>
 <CAK8fFZ4Ut6K-QGpy769_1N1K-GKpReo2wQgA=uXyXdGZ+QgGxA@mail.gmail.com>
 <CAJZ5v0hCEECyuAJZ4GAn=DeJR-UgtUXOMYYN9JQgEyghVnCYsw@mail.gmail.com>
 <aY4EUQcGbmT3Rexz@mail.minyard.net> <CAJZ5v0ip-Ke9p-2Qd9EQpp-J4Te53S4WsrJDeJPi_5o+U2_wNA@mail.gmail.com>
 <aY4dT-Mj5ZJIavdP@mail.minyard.net>
In-Reply-To: <aY4dT-Mj5ZJIavdP@mail.minyard.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 12 Feb 2026 22:33:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iS939x7VMQoNgks=Edichx2C+Qq8_kfiLpLh0ov=gwpw@mail.gmail.com>
X-Gm-Features: AZwV_QjKHkVqx_Y-Q7jCUvMWy_buZYLmDxX3BM7o9vJ0uGlSa6l79Pt-F9ULtl0
Message-ID: <CAJZ5v0iS939x7VMQoNgks=Edichx2C+Qq8_kfiLpLh0ov=gwpw@mail.gmail.com>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average sysfs
 read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
To: corey@minyard.net
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, 
	Guenter Roeck <linux@roeck-us.net>, Igor Raits <igor@gooddata.com>, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Daniel Secik <daniel.secik@gooddata.com>, 
	Zdenek Pesek <zdenek.pesek@gooddata.com>, Jiri Jurica <jiri.jurica@gooddata.com>, 
	Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:35=E2=80=AFPM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Thu, Feb 12, 2026 at 06:22:08PM +0100, Rafael J. Wysocki wrote:
> > On Thu, Feb 12, 2026 at 5:48???PM Corey Minyard <corey@minyard.net> wro=
te:
> > >
> > > On Thu, Feb 12, 2026 at 01:27:41PM +0100, Rafael J. Wysocki wrote:
> > > > On Thu, Feb 12, 2026 at 10:11???AM Jaroslav Pulchart
> > > > <jaroslav.pulchart@gooddata.com> wrote:
> > > > >
> > > > > >
> > > > > > On Fri, Feb 6, 2026 at 4:58???PM Corey Minyard <corey@minyard.n=
et> wrote:
> > > > > > >
> > > > > > > On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki w=
rote:
> > > > > > > > On Thu, Feb 5, 2026 at 11:34???PM Guenter Roeck <linux@roec=
k-us.net> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Feb 05, 2026 at 08:04:12PM +0100, Rafael J. Wysoc=
ki wrote:
> > > > > > > > > > Cc: Corey
> > > > > > > > > >
> > > > > > > > > > On Thu, Feb 5, 2026 at 6:51???PM Guenter Roeck <linux@r=
oeck-us.net> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits =
wrote:
> > > > > > > > > > > > On Wed, Feb 4, 2026 at 11:49???PM Guenter Roeck <li=
nux@roeck-us.net> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On 2/4/26 11:54, Igor Raits wrote:
> > > > > > > > > > > > > > I have written a patch with the help of AI and =
it fixes the problem. Attached.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > "No MIME, no links, no compression, no attachment=
s.  Just plain text"
> > > > > > > > > > > >
> > > > > > > > > > > > Sorry for that, I had assumed that attaching the fi=
le would make it in-line.
> > > > > > > > > > > >
> > > > > > > > > > > > > ... which means I can not provide inline feedback=
, which is the whole
> > > > > > > > > > > > > point of the above.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Your patch crosses subsystems, so it will need to=
 be split in two
> > > > > > > > > > > > > (assuming the ACPI side is even needed). Also, re=
ferences to iDRAC
> > > > > > > > > > > > > in common code seem inappropriate.
> > > > > > > > > > > >
> > > > > > > > > > > > Yes, this I believe was the essential part (it was =
the last piece in
> > > > > > > > > > > > my testing which fixed the hanging):
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Then I'll need to ask differently: What happens if yo=
u drop the IPMI code,
> > > > > > > > > > > and just keep the wait_for_completion -> wait_for_com=
pletion_timeout
> > > > > > > > > > > change ? Would that be sufficient to solve the proble=
m ?
> > > > > > > > > >
> > > > > > > > > > I'd rather say "Would that be sufficient to make the sy=
mptoms go
> > > > > > > > > > away?" as it most likely papers over the real problem.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Good point. Worse, it may result in UAF or memory leaks.
> > > > > > > > >
> > > > > > > > > > > Either case, the need for this change suggests that t=
he ipmi change
> > > > > > > > > > > may not be complete, since it should send a completio=
n with an error.
> > > > > > > > > >
> > > > > > > > > > I think that reverting commit bc3a9d217755 ("ipmi:si: G=
racefully
> > > > > > > > > > handle if the BMC is non-functional") should also be co=
nsidered as a
> > > > > > > > > > possible way forward because it clearly did not improve=
 things as
> > > > > > > > > > expected, at least in this particular case.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I tend to agree. I ran a number of AI code reviews over t=
he patch, and
> > > > > > > > > each time it finds new (and different) problems. The fact=
 that the acpi
> > > > > > > > > patch is still needed even after applying the ipmi change=
s suggests that
> > > > > > > > > something is still missing in the ipmi code.
> > > > > > > > >
> > > > > > > > > > It evidently did something that confuses things quite a=
 bit.  Either
> > > > > > > > > > it is returning IPMI_BUS_ERR instead of IPMI_ERR_UNSPEC=
IFIED, or it is
> > > > > > > > > > the "hosed" state and refusing to accept messages.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > More than that. My latest AI results are below, just for =
reference
> > > > > > > > > (using Gemini 3 with Chris Mason's debug prompts). The pr=
ompt I used
> > > > > > > > > for this run is:
> > > > > > > >
> > > > > > > > Well, I guess it's time to send a revert patch then.
> > > > > > >
> > > > > > > Thanks for the CC.
> > > > > > >
> > > > > > > Let's fix it right in the IPMI driver.
> > > > > > >
> > > > > > > >
> > > > > > > > > "
> > > > > > > > > The top commit in the linux/ directory results in hung ta=
sks if the BMC
> > > > > > > > > stops responding. Using @review-prompts/kernel/debugging.=
md analyze the
> > > > > > > > > patch, identify the reason for the hung task problem, sug=
gest and implement
> > > > > > > > > a fix. Note that there may be more than one problem in th=
e patch, so analyze
> > > > > > > > > the complete patch and do not stop after fiding the first=
 regression.
> > > > > > > > > "
> > > > > > > > >
> > > > > > > > > I think that catches most of the problem, but not all of =
it.
> > > > > > > > >
> > > > > > > > > Guenter
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Summary of crash or warning:
> > > > > > > > > Hung task detected in ipmi_si driver when BMC becomes non=
-functional.
> > > > > > > > > Processes waiting for IPMI responses (e.g. ipmitool, moni=
toring agents) enter D state and never recover.
> > > > > > > > >
> > > > > > > > > Kernel version if available:
> > > > > > > > > Top of tree (commit bc3a9d217755f65c137f145600f23bf1d6c31=
ea9)
> > > > > > > > >
> > > > > > > > > Machine type if available:
> > > > > > > > > Generic Server with BMC
> > > > > > > > >
> > > > > > > > > Cleaned up copy of oops or stack trace:
> > > > > > > > > [  120.123456] INFO: task ipmitool:1234 blocked for more =
than 120 seconds.
> > > > > > > > > [  120.123457]       Not tainted 6.14.0-rc1 #1
> > > > > > > > > [  120.123458] "echo 0 > /proc/sys/kernel/hung_task_timeo=
ut_secs" disables this message.
> > > > > > > > > [  120.123459] task:ipmitool        state:D stack:    0 p=
id: 1234 ppid:  100 flags:0x00000000
> > > > > > > > > [  120.123460] Call Trace:
> > > > > > > > > [  120.123461]  <TASK>
> > > > > > > > > [  120.123462]  __schedule+0x123/0x456
> > > > > > > > > [  120.123463]  schedule+0x45/0x78
> > > > > > > > > [  120.123464]  schedule_timeout+0x9a/0xbc
> > > > > > > > > [  120.123465]  wait_for_completion+0xde/0xf0
> > > > > > > > > [  120.123466]  ipmi_request_settime+0x123/0x145
> > > > > > > > > [  120.123467]  ...
> > > > > > > > > [  120.123468]  </TASK>
> > > > > > > > >
> > > > > > > > > Any other kernel messages you found relevant:
> > > > > > > > > N/A
> > > > > > > > >
> > > > > > > > > Explanation of the problem:
> > > > > > > > > 1. Hung Task:
> > > > > > > > > The patch "ipmi:si: Gracefully handle if the BMC is non-f=
unctional" introduces a new state `SI_HOSED` to handle BMC failures. When t=
he driver detects that the BMC is not responding, it transitions to `SI_HOS=
ED` and fails the currently processing message (`curr_msg`). However, if a =
new message is queued via `sender()` (populating `waiting_msg`) during a re=
covery probe (state `SI_GETTING_FLAGS`), and that probe subsequently fails,=
 the state machine transitions back to `SI_HOSED`. In this transition, the =
driver checks and fails `curr_msg`, but it neglects to check or fail `waiti=
ng_msg`. As a result, the `waiting_msg` remains in the queue indefinitely, =
causing the waiting process to hang.
> > > > > > > >
> > > > > > > > That's quite convincing and it would explain the observed s=
ymptoms.
> > > > > > >
> > > > > > > Yes, and it's a fairly easy fix, I think.  The waiting messag=
e just
> > > > > > > needs to be returned in that case.  The following patch shoul=
d do it:
> > > > > >
> > > > > > Jaroslav, it would be good to test the patch below on top of 6.=
19.  I
> > > > > > can put it on a test git branch if need be, so please let me kn=
ow.
> > > > > >
> > > > > > > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/=
ipmi/ipmi_si_intf.c
> > > > > > > index 5459ffdde8dc..ff159b1162b9 100644
> > > > > > > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > > > > > > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > > > > > > @@ -809,6 +809,12 @@ static enum si_sm_result smi_event_handl=
er(struct smi_info *smi_info,
> > > > > > >                          */
> > > > > > >                         return_hosed_msg(smi_info, IPMI_BUS_E=
RR);
> > > > > > >                 }
> > > > > > > +               if (smi_info->waiting_msg !=3D NULL) {
> > > > > > > +                       /* Also handle if there was a message=
 waiting. */
> > > > > > > +                       smi_info->curr_msg =3D smi_info->wait=
ing_msg;
> > > > > > > +                       smi_info->waiting_msg =3D NULL;
> > > > > > > +                       return_hosed_msg(smi_info, IPMI_BUS_E=
RR);
> > > > > > > +               }
> > > > > > >                 smi_mod_timer(smi_info, jiffies + SI_TIMEOUT_=
HOSED);
> > > > > > >                 goto out;
> > > > > > >         }
> > > > >
> > > > > I apply ^ patch to both 6.18.10 and 6.19 and reproduced the issue=
 on
> > > > > both, so it does not fix the problem.
> > > >
> > > > Thanks!
> > > >
> > > > With all due respect to everyone involved (including the AI), this
> > > > means that we are not anywhere close to fixing the problem and it
> > > > would be a shame to ship 7.0 with it.
> > > >
> > > > I'm sending a revert patch shortly.
> > >
> > > Unfortunately, that patch fixed an issue others were having.
> >
> > Granted, it broke something else, so it needs to be fixed or reverted.
>
> Yes, certainly.
>
> >
> > Maybe there is a way to address the original problem fixed by it differ=
ently?
>
> I'm not sure.  This is not the first attempt...

I see.

> >
> > Do you have any pointers to any problem reports regarding that one?
>
> The original problem came as a patch set:
>
> https://lore.kernel.org/lkml/20221007092617.87597-1-zhangyuchen.lcr@byted=
ance.com/
>
> That had a lockup problem, and it had some other issues.  So I reworked
> the code to the current form.

OK, thanks!

> I'm working on qemu now.  This needs to be added as part of the test suit=
e, anyway.

There is something in the current code that seems to be problematic.

When acpi_ipmi_space_handler() runs, it calls ipmi_request_settime()
to queue up a message.  AFAICS, if all goes well, this ends up calling
smi_send() via i_ipmi_request().

If intf->curr_msg is NULL, the new message will not be added to a list
in there, but intf->curr_msg will be set to point to it instead and
handlers->sender() will be called on it.  But handlers->sender points
to sender() defined in ipmi_si_intf.c which returns IPMI_BUS_ERR
without doing anything if smi_info->si_state =3D=3D SI_HOSED and its
return value is ignored.

The message is only pointed to by intf->curr_msg at that point and
AFAICS it will never get actually processed because intf->curr_msg is
never really dereferenced (it is only compared with other pointers and
checked against NULL if I'm not mistaken).

It looks like smi_send() needs to check the handlers->sender() return
value and maybe return it to the caller so i_ipmi_request() can return
an error if it fails.
