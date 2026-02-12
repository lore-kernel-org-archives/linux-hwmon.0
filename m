Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EC223D7C8
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921302; cv=none; b=Qyw9XxGCdBZMkUzBiwuiCpyo06VGxmbFxuNeXsKxF4VJSF32HMFgkeRjdrujEzSi/qhAwvZmmnAQlLzoB+dSP3yz9P92hoH/EDSPcu++cfhcNt9T9ijMHEv/9qYnIaSleGOSnX/q+pzzr4yA0yygAYssEomsE8gszCll0JzBNbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921302; c=relaxed/simple;
	bh=l0vTJ2xoIgGAXIdfd4F0K70ju7chO0i7Xx/tyQESLpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcWFB50pfhdGrbrQyBVLMyq1P1+7c2033L51u+Af4QiuNKvDmOHc+RxkfjWokOHnhfdgfCWXJFk691f3pJ5DBjR4sX8JLdXQojiUmOv5t2vd3SgO6RuZyQsbTGcXT8Hji3EW8Mz1LUhj5k4lzKZ3PCsG5uT2BSqs5KpVs5aKni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=ETn+0ntX; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="ETn+0ntX"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so63397fac.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770921299; x=1771526099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/0G1T/7WaY3wk040MaaNc9TozGrnag3qA7gimVUpck=;
        b=ETn+0ntXSf5jrcfEJtPhMNs3J4SUPt+8h77NvrNxbzvoC1xmOZy4F72qocuTY++58H
         8Whhg2uDZtmhZDy5deng1M9+x1cz4l096i+v1CfbWtGo7yEqKJtOHQ9eJxfcQ38u1bYq
         QPM3XzRhBXRAHoSbaOCOSfccW7N32sh4pP9xW7kvO4R7mAg1LtgJQUF5kMsYtWwvc/tN
         JE4icgvLS0E6FYP0aHJZAQDOG2xVED/AbCNIGbV6ZY34JrzbsB0Pp+IJU5BDt4I8y/kp
         q7DLu7DRsOFdFP1B9kCnjm+A7MjWGIBYZfS65NrBetbxKOHc27Qhe+lcY3A1jRR1K3KS
         BUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770921299; x=1771526099;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/0G1T/7WaY3wk040MaaNc9TozGrnag3qA7gimVUpck=;
        b=pb7bmP3wPNETO1w9yzpiA1AW6omyyivN1/tgeLoTWCrps9UUwAaR28j/tbVMwtU9Z/
         OAZToMzdIuBl18m4xaxn0e0VM9P713/m6SpVEZcLEYMejdCB3BGMkwhQ1pARHKv4wulM
         9JtEFRwIwOQe7vsfP6AcRQunL8VpAT3gbLBKV3MQbwLkFQSVKfKjfgq3QKO/LyqR8h2N
         Et3mRhm54HPmUTTqlmm+pH9wNS9ZKO/iV8B2doqzP/PKJmlF/cn6CXLYeqd29w3VDnmm
         X7stx/Tb6/UTz/RAnzN05UerhkyAtvb3n1cQKwzyQr0tNCvyjfhxtcc3npmVhaFeyxun
         r+ow==
X-Forwarded-Encrypted: i=1; AJvYcCWX65n2ZpY4lWNVTeGl/gqvrECik8GEs5BEiJYIGOF26XKv51lzibq0BxjaXVP8wxVgcYYEynjL7sRS0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+r3a6nynYGmTdKvAtmlYIlsNf9UJEPfZpgbg7srgBZxfyf15
	qz7OidkLlHh3crkfnpx5NxPKtGgDVCwmQAnwHLa0Saehe7I5xQub4QqkDZWLR4Gt04hi6H2GpZH
	d/wyo
X-Gm-Gg: AZuq6aJ44YWaiUK10um4GItBrmOG0hX4Ch+/tesDCmtoUujmqFa3q1V5gsPHPtiUnHI
	YxatBJ4u7djPLBIHm6QMuR8BNTARqPMN5+JVw4birj9BaZtufQRQY+bXD8hDbzK0nKS0xE6tu2C
	5VpdSYbv+bsP3bUdFWpnRxkm/tahKHhOlpYVuGQAeXw3nstu1u30oS9rG3jQmTJxrCQ0B60DHPB
	BcIlVwSvcv0h4Gwz8B0aJhrMd5jveWpBuPgLrUWpLaluMyXksUrQcBK1rxWE2mOXjGIx7UU3IS8
	G1VdhhtYxqO5BMo80pQSiHjJRU7lWtP+0N5Aqum/g09n35vIj1bye11lu7LLg/LNtxoC7dInulL
	d5+29MhJujHcvp9XdobbuoPwRcwjjgUcD6XSfCRIEGM3lmyRbmZtPy8jdw7N8I2znkxDMsBEvMv
	UBNmoPBy22H4qodDNjL9x15Xt7+Qbjxoj9JUUlrpuu/jS8calT0Nvea7B1lgSm+zguKpOXWaOWa
	i/4GjraP/dWMXw=
X-Received: by 2002:a05:6870:c231:b0:409:62c9:5ccb with SMTP id 586e51a60fabf-40ee984aa3bmr172837fac.22.1770921299435;
        Thu, 12 Feb 2026 10:34:59 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ac4f:9c7a:97e9:f745])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf103ac3sm4229189fac.11.2026.02.12.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:34:58 -0800 (PST)
Date: Thu, 12 Feb 2026 12:34:55 -0600
From: Corey Minyard <corey@minyard.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	Guenter Roeck <linux@roeck-us.net>, Igor Raits <igor@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average
 sysfs read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
Message-ID: <aY4dT-Mj5ZJIavdP@mail.minyard.net>
Reply-To: corey@minyard.net
References: <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
 <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
 <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net>
 <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>
 <aYYPnATz1JakV3m7@mail.minyard.net>
 <CAJZ5v0h1irjy_ovyQw9ObGOTAUWajT_BK6u=rWQqR9awQBrY3A@mail.gmail.com>
 <CAK8fFZ4Ut6K-QGpy769_1N1K-GKpReo2wQgA=uXyXdGZ+QgGxA@mail.gmail.com>
 <CAJZ5v0hCEECyuAJZ4GAn=DeJR-UgtUXOMYYN9JQgEyghVnCYsw@mail.gmail.com>
 <aY4EUQcGbmT3Rexz@mail.minyard.net>
 <CAJZ5v0ip-Ke9p-2Qd9EQpp-J4Te53S4WsrJDeJPi_5o+U2_wNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ip-Ke9p-2Qd9EQpp-J4Te53S4WsrJDeJPi_5o+U2_wNA@mail.gmail.com>

On Thu, Feb 12, 2026 at 06:22:08PM +0100, Rafael J. Wysocki wrote:
> On Thu, Feb 12, 2026 at 5:48???PM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Thu, Feb 12, 2026 at 01:27:41PM +0100, Rafael J. Wysocki wrote:
> > > On Thu, Feb 12, 2026 at 10:11???AM Jaroslav Pulchart
> > > <jaroslav.pulchart@gooddata.com> wrote:
> > > >
> > > > >
> > > > > On Fri, Feb 6, 2026 at 4:58???PM Corey Minyard <corey@minyard.net> wrote:
> > > > > >
> > > > > > On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki wrote:
> > > > > > > On Thu, Feb 5, 2026 at 11:34???PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > > >
> > > > > > > > On Thu, Feb 05, 2026 at 08:04:12PM +0100, Rafael J. Wysocki wrote:
> > > > > > > > > Cc: Corey
> > > > > > > > >
> > > > > > > > > On Thu, Feb 5, 2026 at 6:51???PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits wrote:
> > > > > > > > > > > On Wed, Feb 4, 2026 at 11:49???PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On 2/4/26 11:54, Igor Raits wrote:
> > > > > > > > > > > > > I have written a patch with the help of AI and it fixes the problem. Attached.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > "No MIME, no links, no compression, no attachments.  Just plain text"
> > > > > > > > > > >
> > > > > > > > > > > Sorry for that, I had assumed that attaching the file would make it in-line.
> > > > > > > > > > >
> > > > > > > > > > > > ... which means I can not provide inline feedback, which is the whole
> > > > > > > > > > > > point of the above.
> > > > > > > > > > > >
> > > > > > > > > > > > Your patch crosses subsystems, so it will need to be split in two
> > > > > > > > > > > > (assuming the ACPI side is even needed). Also, references to iDRAC
> > > > > > > > > > > > in common code seem inappropriate.
> > > > > > > > > > >
> > > > > > > > > > > Yes, this I believe was the essential part (it was the last piece in
> > > > > > > > > > > my testing which fixed the hanging):
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Then I'll need to ask differently: What happens if you drop the IPMI code,
> > > > > > > > > > and just keep the wait_for_completion -> wait_for_completion_timeout
> > > > > > > > > > change ? Would that be sufficient to solve the problem ?
> > > > > > > > >
> > > > > > > > > I'd rather say "Would that be sufficient to make the symptoms go
> > > > > > > > > away?" as it most likely papers over the real problem.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Good point. Worse, it may result in UAF or memory leaks.
> > > > > > > >
> > > > > > > > > > Either case, the need for this change suggests that the ipmi change
> > > > > > > > > > may not be complete, since it should send a completion with an error.
> > > > > > > > >
> > > > > > > > > I think that reverting commit bc3a9d217755 ("ipmi:si: Gracefully
> > > > > > > > > handle if the BMC is non-functional") should also be considered as a
> > > > > > > > > possible way forward because it clearly did not improve things as
> > > > > > > > > expected, at least in this particular case.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I tend to agree. I ran a number of AI code reviews over the patch, and
> > > > > > > > each time it finds new (and different) problems. The fact that the acpi
> > > > > > > > patch is still needed even after applying the ipmi changes suggests that
> > > > > > > > something is still missing in the ipmi code.
> > > > > > > >
> > > > > > > > > It evidently did something that confuses things quite a bit.  Either
> > > > > > > > > it is returning IPMI_BUS_ERR instead of IPMI_ERR_UNSPECIFIED, or it is
> > > > > > > > > the "hosed" state and refusing to accept messages.
> > > > > > > > >
> > > > > > > >
> > > > > > > > More than that. My latest AI results are below, just for reference
> > > > > > > > (using Gemini 3 with Chris Mason's debug prompts). The prompt I used
> > > > > > > > for this run is:
> > > > > > >
> > > > > > > Well, I guess it's time to send a revert patch then.
> > > > > >
> > > > > > Thanks for the CC.
> > > > > >
> > > > > > Let's fix it right in the IPMI driver.
> > > > > >
> > > > > > >
> > > > > > > > "
> > > > > > > > The top commit in the linux/ directory results in hung tasks if the BMC
> > > > > > > > stops responding. Using @review-prompts/kernel/debugging.md analyze the
> > > > > > > > patch, identify the reason for the hung task problem, suggest and implement
> > > > > > > > a fix. Note that there may be more than one problem in the patch, so analyze
> > > > > > > > the complete patch and do not stop after fiding the first regression.
> > > > > > > > "
> > > > > > > >
> > > > > > > > I think that catches most of the problem, but not all of it.
> > > > > > > >
> > > > > > > > Guenter
> > > > > > > >
> > > > > > > > ---
> > > > > > > >
> > > > > > > > Summary of crash or warning:
> > > > > > > > Hung task detected in ipmi_si driver when BMC becomes non-functional.
> > > > > > > > Processes waiting for IPMI responses (e.g. ipmitool, monitoring agents) enter D state and never recover.
> > > > > > > >
> > > > > > > > Kernel version if available:
> > > > > > > > Top of tree (commit bc3a9d217755f65c137f145600f23bf1d6c31ea9)
> > > > > > > >
> > > > > > > > Machine type if available:
> > > > > > > > Generic Server with BMC
> > > > > > > >
> > > > > > > > Cleaned up copy of oops or stack trace:
> > > > > > > > [  120.123456] INFO: task ipmitool:1234 blocked for more than 120 seconds.
> > > > > > > > [  120.123457]       Not tainted 6.14.0-rc1 #1
> > > > > > > > [  120.123458] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > > > > > > [  120.123459] task:ipmitool        state:D stack:    0 pid: 1234 ppid:  100 flags:0x00000000
> > > > > > > > [  120.123460] Call Trace:
> > > > > > > > [  120.123461]  <TASK>
> > > > > > > > [  120.123462]  __schedule+0x123/0x456
> > > > > > > > [  120.123463]  schedule+0x45/0x78
> > > > > > > > [  120.123464]  schedule_timeout+0x9a/0xbc
> > > > > > > > [  120.123465]  wait_for_completion+0xde/0xf0
> > > > > > > > [  120.123466]  ipmi_request_settime+0x123/0x145
> > > > > > > > [  120.123467]  ...
> > > > > > > > [  120.123468]  </TASK>
> > > > > > > >
> > > > > > > > Any other kernel messages you found relevant:
> > > > > > > > N/A
> > > > > > > >
> > > > > > > > Explanation of the problem:
> > > > > > > > 1. Hung Task:
> > > > > > > > The patch "ipmi:si: Gracefully handle if the BMC is non-functional" introduces a new state `SI_HOSED` to handle BMC failures. When the driver detects that the BMC is not responding, it transitions to `SI_HOSED` and fails the currently processing message (`curr_msg`). However, if a new message is queued via `sender()` (populating `waiting_msg`) during a recovery probe (state `SI_GETTING_FLAGS`), and that probe subsequently fails, the state machine transitions back to `SI_HOSED`. In this transition, the driver checks and fails `curr_msg`, but it neglects to check or fail `waiting_msg`. As a result, the `waiting_msg` remains in the queue indefinitely, causing the waiting process to hang.
> > > > > > >
> > > > > > > That's quite convincing and it would explain the observed symptoms.
> > > > > >
> > > > > > Yes, and it's a fairly easy fix, I think.  The waiting message just
> > > > > > needs to be returned in that case.  The following patch should do it:
> > > > >
> > > > > Jaroslav, it would be good to test the patch below on top of 6.19.  I
> > > > > can put it on a test git branch if need be, so please let me know.
> > > > >
> > > > > > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> > > > > > index 5459ffdde8dc..ff159b1162b9 100644
> > > > > > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > > > > > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > > > > > @@ -809,6 +809,12 @@ static enum si_sm_result smi_event_handler(struct smi_info *smi_info,
> > > > > >                          */
> > > > > >                         return_hosed_msg(smi_info, IPMI_BUS_ERR);
> > > > > >                 }
> > > > > > +               if (smi_info->waiting_msg != NULL) {
> > > > > > +                       /* Also handle if there was a message waiting. */
> > > > > > +                       smi_info->curr_msg = smi_info->waiting_msg;
> > > > > > +                       smi_info->waiting_msg = NULL;
> > > > > > +                       return_hosed_msg(smi_info, IPMI_BUS_ERR);
> > > > > > +               }
> > > > > >                 smi_mod_timer(smi_info, jiffies + SI_TIMEOUT_HOSED);
> > > > > >                 goto out;
> > > > > >         }
> > > >
> > > > I apply ^ patch to both 6.18.10 and 6.19 and reproduced the issue on
> > > > both, so it does not fix the problem.
> > >
> > > Thanks!
> > >
> > > With all due respect to everyone involved (including the AI), this
> > > means that we are not anywhere close to fixing the problem and it
> > > would be a shame to ship 7.0 with it.
> > >
> > > I'm sending a revert patch shortly.
> >
> > Unfortunately, that patch fixed an issue others were having.
> 
> Granted, it broke something else, so it needs to be fixed or reverted.

Yes, certainly.

> 
> Maybe there is a way to address the original problem fixed by it differently?

I'm not sure.  This is not the first attempt...

> 
> Do you have any pointers to any problem reports regarding that one?

The original problem came as a patch set:

https://lore.kernel.org/lkml/20221007092617.87597-1-zhangyuchen.lcr@bytedance.com/

That had a lockup problem, and it had some other issues.  So I reworked
the code to the current form.

I'm working on qemu now.  This needs to be added as part of the test
suite, anyway.

-corey
