Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82202DB7A7
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887485; cv=pass; b=k98gXrsXCmsMTMpaituVh/Rj8BlD9S/oEOASqQWz9pmm0OcR3xORs/WhmVDSHkhV3vpu8Ive9vGZughk6Id5tcZ8sMuzDS8gzWAf29O/6azt3N4LvbIpy3J4CJtur9PZgmCLtsagXMcZBFf31L3vT0LUd1PpbSV4L1QHg8jMHpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887485; c=relaxed/simple;
	bh=cRNC+rdtEtUaGQagx+0fcxkvHbJbpHUxRpDsY7egkro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfh3AxeOzztoZWhoA5/V7K8DA08C4C+Xuj5rYjWjnhRyNHBL50eXthmRIoDyz9Qda2qB4UeNoiLk0b3lLDb5AmWsHv73LFrhlwOcIAS9i0T6Ea4ED6XJAeMZPF+ZC/6q0+Z4i10xvhoPH9+rhTyC9WrKUabyhKiakpweGJXYB0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=TYH2NCIF; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="TYH2NCIF"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1270be4d125so7459365c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 01:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770887483; cv=none;
        d=google.com; s=arc-20240605;
        b=Uqpu3XMmfJ0Fs06CAaYEc70WUg/eZBVmCuJjtMpIoK+x+sZkES7m8XaxmBQHiIXL+M
         s21xyQGN+jnjXZrixiQDoNu45rmDU0l0kxxxunr7iQ20LoTtfID0NdiIdAqJxzUuQpwq
         kkDpRDe4DRoSZPNuojpD03SdHoqU0aIbXmVWowj2HEemNMJi/PNv2fMFIRfV62s4Zbcs
         I/huMWRHRjXgTJa2S6gq7WsL/rGjAW938GP7M9052KF8pSnZLV8NI8Q78d2m6/dATtOO
         DO8VTol2yJbrMjx4f85fp2sQfBk9FOLVNZgMOglFlA8ALCx64Xs39e0/1pSSs53MavAE
         nP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VfDX2mgTB1Ian4nv+rxpJLQ0hBYYCnjiqqwkDC/FZZM=;
        fh=aARpXVRU2ukZM/NuGHa3OE5KTJ7nWHpE+65hC3QU704=;
        b=Pqzjq4k2ssCzfA6c9pEyZvSME/Cdb3o8FTOKYto61ds50ZQmV5Gr/gdWky0ClYFEaJ
         Ec9O7wq+vgj9yD62f6cRFYwWPS+bNvHj9GYfAxJrc5Xgz7qfzLG3zSwfQKhSoRKhuzUh
         422z9zj2NfrmjgfEiFTyM9nuPLcsokRR4sTorSvypSg3HNV6XQ5LWepqOgB50EpD91Kz
         v8laCic8pcMzwomaLNSvhN9wyPeKIhVfA9Mmd1mERPL6eVKnn2M6Fm9eKsXmXTxlZ/Ih
         sZUS9FDF2uiK7Fdxwym/8N/M6oKQg8boN6LcsYfqepJxhXTF8HNT2TjK1TRNgtdY6KBh
         WorA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1770887483; x=1771492283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfDX2mgTB1Ian4nv+rxpJLQ0hBYYCnjiqqwkDC/FZZM=;
        b=TYH2NCIFIrRBxyDA3VAE3/yDli4I2tjY06S7CoGuDJKU2erCZboRU0P/Pd3GJa24IY
         Hpx2lLOkLYF5/Pfs3Ur/TvzsDG9+60F0kpWwGj4we9JfmrR9HY1mLGJPscXRxTCyrlz1
         49xkU1Dglg84GLsi7tSvtTGkzix0NBfx0tjdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887483; x=1771492283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VfDX2mgTB1Ian4nv+rxpJLQ0hBYYCnjiqqwkDC/FZZM=;
        b=GQ/DSlqbtwA1b6G9Yxfuki0QDmtIibfxe/M2bO3gLtpOsvpwYs/OTwxqNlBEUEONLH
         cCE1nDTT1F4Ko787q73+okxwNH7MTHmVeGRQ2N9KVYWMZva++eudVCSRnnWZqVG5b/KW
         IzkgKQds5HbY3ieTcJQGGqD7H4XsKy/d2IoTff9FSe9iHB3r/uyzb5A0zMSa0yHCJsVj
         lad/LJ7JHqZ100OsFfH36O4MkhgL5gjvvbSoKU1N9x55rRG+DkBqoPesEiuFcTOOM9To
         0pO1iS4UbwRcKFi6N1n0zAZcZ2i5hY5C6QF3AqKcgUDuJEPyQq1F9IoNMzOpNGm0WYsX
         7+VA==
X-Forwarded-Encrypted: i=1; AJvYcCXrhCYbcHZguINDmg9/+JIgF355UFG09sp3lmdsa2prWho1r23ZdH8oTzC2/O9CA+NqtZgPaMUj+u0+yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGxZfYQ/HkCcUVCOMHG92I2RtSitzeRuUzbYrW9aFYELakIab
	9+Lte3lwGXjI2QW7kj22gHdoxiplm23Zcc7Bm/x70VLUsTsMoWz4ebdbLrVUYP0zQj1srTOgftG
	2nA0j0BcZpGiqx4tJQ7f4MiQZrAMQoW+7/iO9/m4N
X-Gm-Gg: AZuq6aIc11ZsDpEp2GIl2yi83DlGtvZOR+v0OyPuLlI1Kn6JrmkoYw7nLlVxVpVF7dn
	Iop47ah3kvXrvijHG9KHZDSb8zgvvPuCxJcLMfRk2Sp2x+Hc2r71scneuhl17Xjd3rpArGoZA8F
	841tw5PIDZHz37M2QvcHQiYCxlAYAWu2jAPaonuc5s5tDxUgQt9UEEweRthIyykSZir7yOxWTsF
	2SiNYg1fPuoZGK/pf0Gb2quP91/ggG/l72w5alRAMK0LWiEpykHu6yUVPskUjlu4mV8Ms+NKPlE
	Mmzvewq2
X-Received: by 2002:a05:7022:6097:b0:11a:e426:911a with SMTP id
 a92af1059eb24-1272f74833fmr788891c88.15.1770887482648; Thu, 12 Feb 2026
 01:11:22 -0800 (PST)
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
 <aYYPnATz1JakV3m7@mail.minyard.net> <CAJZ5v0h1irjy_ovyQw9ObGOTAUWajT_BK6u=rWQqR9awQBrY3A@mail.gmail.com>
In-Reply-To: <CAJZ5v0h1irjy_ovyQw9ObGOTAUWajT_BK6u=rWQqR9awQBrY3A@mail.gmail.com>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Thu, 12 Feb 2026 10:10:54 +0100
X-Gm-Features: AZwV_QjMkP0Mzlfv9lfzRC-S8o3p0hVOyW_B-0D-12PMwrgPARLIql3K_dtUFbQ
Message-ID: <CAK8fFZ4Ut6K-QGpy769_1N1K-GKpReo2wQgA=uXyXdGZ+QgGxA@mail.gmail.com>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average sysfs
 read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: corey@minyard.net, Guenter Roeck <linux@roeck-us.net>, Igor Raits <igor@gooddata.com>, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Fri, Feb 6, 2026 at 4:58=E2=80=AFPM Corey Minyard <corey@minyard.net> =
wrote:
> >
> > On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki wrote:
> > > On Thu, Feb 5, 2026 at 11:34=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> > > >
> > > > On Thu, Feb 05, 2026 at 08:04:12PM +0100, Rafael J. Wysocki wrote:
> > > > > Cc: Corey
> > > > >
> > > > > On Thu, Feb 5, 2026 at 6:51=E2=80=AFPM Guenter Roeck <linux@roeck=
-us.net> wrote:
> > > > > >
> > > > > > On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits wrote:
> > > > > > > On Wed, Feb 4, 2026 at 11:49=E2=80=AFPM Guenter Roeck <linux@=
roeck-us.net> wrote:
> > > > > > > >
> > > > > > > > On 2/4/26 11:54, Igor Raits wrote:
> > > > > > > > > I have written a patch with the help of AI and it fixes t=
he problem. Attached.
> > > > > > > > >
> > > > > > > >
> > > > > > > > "No MIME, no links, no compression, no attachments.  Just p=
lain text"
> > > > > > >
> > > > > > > Sorry for that, I had assumed that attaching the file would m=
ake it in-line.
> > > > > > >
> > > > > > > > ... which means I can not provide inline feedback, which is=
 the whole
> > > > > > > > point of the above.
> > > > > > > >
> > > > > > > > Your patch crosses subsystems, so it will need to be split =
in two
> > > > > > > > (assuming the ACPI side is even needed). Also, references t=
o iDRAC
> > > > > > > > in common code seem inappropriate.
> > > > > > >
> > > > > > > Yes, this I believe was the essential part (it was the last p=
iece in
> > > > > > > my testing which fixed the hanging):
> > > > > > >
> > > > > >
> > > > > > Then I'll need to ask differently: What happens if you drop the=
 IPMI code,
> > > > > > and just keep the wait_for_completion -> wait_for_completion_ti=
meout
> > > > > > change ? Would that be sufficient to solve the problem ?
> > > > >
> > > > > I'd rather say "Would that be sufficient to make the symptoms go
> > > > > away?" as it most likely papers over the real problem.
> > > > >
> > > >
> > > > Good point. Worse, it may result in UAF or memory leaks.
> > > >
> > > > > > Either case, the need for this change suggests that the ipmi ch=
ange
> > > > > > may not be complete, since it should send a completion with an =
error.
> > > > >
> > > > > I think that reverting commit bc3a9d217755 ("ipmi:si: Gracefully
> > > > > handle if the BMC is non-functional") should also be considered a=
s a
> > > > > possible way forward because it clearly did not improve things as
> > > > > expected, at least in this particular case.
> > > > >
> > > >
> > > > I tend to agree. I ran a number of AI code reviews over the patch, =
and
> > > > each time it finds new (and different) problems. The fact that the =
acpi
> > > > patch is still needed even after applying the ipmi changes suggests=
 that
> > > > something is still missing in the ipmi code.
> > > >
> > > > > It evidently did something that confuses things quite a bit.  Eit=
her
> > > > > it is returning IPMI_BUS_ERR instead of IPMI_ERR_UNSPECIFIED, or =
it is
> > > > > the "hosed" state and refusing to accept messages.
> > > > >
> > > >
> > > > More than that. My latest AI results are below, just for reference
> > > > (using Gemini 3 with Chris Mason's debug prompts). The prompt I use=
d
> > > > for this run is:
> > >
> > > Well, I guess it's time to send a revert patch then.
> >
> > Thanks for the CC.
> >
> > Let's fix it right in the IPMI driver.
> >
> > >
> > > > "
> > > > The top commit in the linux/ directory results in hung tasks if the=
 BMC
> > > > stops responding. Using @review-prompts/kernel/debugging.md analyze=
 the
> > > > patch, identify the reason for the hung task problem, suggest and i=
mplement
> > > > a fix. Note that there may be more than one problem in the patch, s=
o analyze
> > > > the complete patch and do not stop after fiding the first regressio=
n.
> > > > "
> > > >
> > > > I think that catches most of the problem, but not all of it.
> > > >
> > > > Guenter
> > > >
> > > > ---
> > > >
> > > > Summary of crash or warning:
> > > > Hung task detected in ipmi_si driver when BMC becomes non-functiona=
l.
> > > > Processes waiting for IPMI responses (e.g. ipmitool, monitoring age=
nts) enter D state and never recover.
> > > >
> > > > Kernel version if available:
> > > > Top of tree (commit bc3a9d217755f65c137f145600f23bf1d6c31ea9)
> > > >
> > > > Machine type if available:
> > > > Generic Server with BMC
> > > >
> > > > Cleaned up copy of oops or stack trace:
> > > > [  120.123456] INFO: task ipmitool:1234 blocked for more than 120 s=
econds.
> > > > [  120.123457]       Not tainted 6.14.0-rc1 #1
> > > > [  120.123458] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" d=
isables this message.
> > > > [  120.123459] task:ipmitool        state:D stack:    0 pid: 1234 p=
pid:  100 flags:0x00000000
> > > > [  120.123460] Call Trace:
> > > > [  120.123461]  <TASK>
> > > > [  120.123462]  __schedule+0x123/0x456
> > > > [  120.123463]  schedule+0x45/0x78
> > > > [  120.123464]  schedule_timeout+0x9a/0xbc
> > > > [  120.123465]  wait_for_completion+0xde/0xf0
> > > > [  120.123466]  ipmi_request_settime+0x123/0x145
> > > > [  120.123467]  ...
> > > > [  120.123468]  </TASK>
> > > >
> > > > Any other kernel messages you found relevant:
> > > > N/A
> > > >
> > > > Explanation of the problem:
> > > > 1. Hung Task:
> > > > The patch "ipmi:si: Gracefully handle if the BMC is non-functional"=
 introduces a new state `SI_HOSED` to handle BMC failures. When the driver =
detects that the BMC is not responding, it transitions to `SI_HOSED` and fa=
ils the currently processing message (`curr_msg`). However, if a new messag=
e is queued via `sender()` (populating `waiting_msg`) during a recovery pro=
be (state `SI_GETTING_FLAGS`), and that probe subsequently fails, the state=
 machine transitions back to `SI_HOSED`. In this transition, the driver che=
cks and fails `curr_msg`, but it neglects to check or fail `waiting_msg`. A=
s a result, the `waiting_msg` remains in the queue indefinitely, causing th=
e waiting process to hang.
> > >
> > > That's quite convincing and it would explain the observed symptoms.
> >
> > Yes, and it's a fairly easy fix, I think.  The waiting message just
> > needs to be returned in that case.  The following patch should do it:
>
> Jaroslav, it would be good to test the patch below on top of 6.19.  I
> can put it on a test git branch if need be, so please let me know.
>
> > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_=
si_intf.c
> > index 5459ffdde8dc..ff159b1162b9 100644
> > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > @@ -809,6 +809,12 @@ static enum si_sm_result smi_event_handler(struct =
smi_info *smi_info,
> >                          */
> >                         return_hosed_msg(smi_info, IPMI_BUS_ERR);
> >                 }
> > +               if (smi_info->waiting_msg !=3D NULL) {
> > +                       /* Also handle if there was a message waiting. =
*/
> > +                       smi_info->curr_msg =3D smi_info->waiting_msg;
> > +                       smi_info->waiting_msg =3D NULL;
> > +                       return_hosed_msg(smi_info, IPMI_BUS_ERR);
> > +               }
> >                 smi_mod_timer(smi_info, jiffies + SI_TIMEOUT_HOSED);
> >                 goto out;
> >         }

I apply ^ patch to both 6.18.10 and 6.19 and reproduced the issue on
both, so it does not fix the problem.
