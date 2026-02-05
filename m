Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96226AF4
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331113; cv=none; b=t4sPCfVMFJuM1D7T+x4pKKkBN8ZlbzA0HkIXxssZR08ugV24hWg+x1nTr0/0HqAPvRZGh1p/rcth1zydw37WRD73zjQ8MDAfkPe4+MacGVEIpfPi+Ya6JZLD7hGKw/JRvFMIPr/xnCNW/sgAFtesAC+rtKdBO60HphskWVGA64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331113; c=relaxed/simple;
	bh=Juj1bsdRU0I+IrAom3HInXgDgXdJO/+1D0a5t61HPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYpqB5rbu6o0inxOZIOrsSDJJ7kAgoA55jBOfdA3j0JquTqHJiMK4ovaHWqUgNKBDA8Y/csagDzS7OiA4750PscSEL0RjNzV7eI2PZEFpQgEzFzou8d/hYR1PH+usCMmHhkTIeSAJlPrt5G49V8kWVa2JMoCy/DpWfgXuOptk10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp2TKJAz; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp2TKJAz"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-894770e34afso20832216d6.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 14:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770331112; x=1770935912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSUkyn5i2wEO3zAje7Mo7JuGzOwqmCv+J4WE0D+9tcU=;
        b=Lp2TKJAz3R5XgcGVBC57NCCCZaVu6h4WP4Ir5TbTZxP0ZanG5B65IG1idUFl8FZiRI
         Cn5aFAK2qt8Q52MFtGqr5rPvJQEY/jsH8OYIYZ5QDWZOAYi4NfhH1PK8l2/bzBVLJ/ol
         RDK9Ld3jM1Mt76rOgEn9C3WeEIA8ag7kbS0q82itt2GXneI5EqXzJBTYqyMRzKoNzgvo
         ywbji8fzh/T8PGN9wIz0iawogRX5AlFzrvlKNF9wxSBkoL7mCPK+7n37Rkm5mI0cYRdD
         zMNxYnoFlA680oTuE+XZQZW6760puCFs+QEd+ljeVxLn79SdPKfRuabj75fAwjH2SwTX
         p+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770331112; x=1770935912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSUkyn5i2wEO3zAje7Mo7JuGzOwqmCv+J4WE0D+9tcU=;
        b=aHZeonw8iysfyb/KEMrS1EQ88aBwlW5Ovx4sPtB67Y2ddb2TYYp+LsxscPN65tyvoZ
         TeVxlvtxGjUsF/MpU+JCGyEYCiYqGrJE3wfklMkYv6oOXCtMWxm+zoNLfTOV2tLFvbAf
         2KTNqQUakzTNQg8diCkFB2qORVabflNWdwVmbA1zIktaH3QHGIk1Hk1EeNsX5R6Ap1BO
         bLTcG+diP/2xiUIC09sd1ljvvohFiJXGkwGptTAM05ZlyR/sXBcZC1YJqbK3cfh5HyR+
         VnbCGzgRj0DygqHyGue/hOttkstmdO+PXJhYUALRaIQtH4+4OUH0OaVwJ+Vs+1W01fKg
         J8Og==
X-Forwarded-Encrypted: i=1; AJvYcCVS/kdVM+Shdhkq+hCSJnHHr6JXy//eFk6lSnnc8YxzUH1T7/AxBHkXV8XItn5/93iz0G4V78weflWWXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2IewKvCQ8iKlCpm+lzDBrqW7Yrvc7t/10D7hEvdJUC/PJcOe
	YRi8M4d3T3dNnJbQaRTHeODvQfXIXe5qVEqhnrF/4S76zlbKduG53/Qv+sxW3v2f
X-Gm-Gg: AZuq6aLyYo84/FADTtsGf4uAJv4CFFez9LhqoDtidK8JNFwrbUmrDeL5GsAcsoOCOo3
	l9Bk47l09wVaV+HuxE5RowCOvmpc7PRRWg2eG2s862CRqTNqc3HwBX9RRqwNaBJhd3OZA+/JCMG
	5pr5e4heW4rp6mPrrlrFnEfX9RfPyllmJgEdGj6Gm+pxdHmOY9n+BAwmuKykMCNS4+T642BG4JU
	wpoEblF+4C4Yxxr0/vi8Z3+VL+3c1jWyau+PKbLHewtRV+qmshcG0nnOcTSWMedbJeK8prNUH+c
	zH4qsZXs75SDCi9xDV6eR88U/FogoSHoXirmH3RhmxMd9pirzeyNr+oEj8S+A1aFAQyTc8Bk0X0
	W/Q2BYUNhMEYn7D0G/9pqdfLqBjFWjOtsXnvdTfZ4pExQnBKx3xaceTJlHwOd1qnnHXqmZ3jBVJ
	DGE47t6yWhn6rWuWwgC0WnDg5u
X-Received: by 2002:a05:7022:b9b:b0:11b:9386:8271 with SMTP id a92af1059eb24-1270407446dmr233143c88.46.1770325047565;
        Thu, 05 Feb 2026 12:57:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270414f28bsm360512c88.0.2026.02.05.12.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 12:57:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 12:57:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Igor Raits <igor@gooddata.com>,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>,
	Corey Minyard <corey@minyard.net>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average
 sysfs read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
Message-ID: <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net>
References: <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
 <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
 <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
 <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
 <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>

On Thu, Feb 05, 2026 at 08:04:12PM +0100, Rafael J. Wysocki wrote:
> Cc: Corey
> 
> On Thu, Feb 5, 2026 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits wrote:
> > > On Wed, Feb 4, 2026 at 11:49 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On 2/4/26 11:54, Igor Raits wrote:
> > > > > I have written a patch with the help of AI and it fixes the problem. Attached.
> > > > >
> > > >
> > > > "No MIME, no links, no compression, no attachments.  Just plain text"
> > >
> > > Sorry for that, I had assumed that attaching the file would make it in-line.
> > >
> > > > ... which means I can not provide inline feedback, which is the whole
> > > > point of the above.
> > > >
> > > > Your patch crosses subsystems, so it will need to be split in two
> > > > (assuming the ACPI side is even needed). Also, references to iDRAC
> > > > in common code seem inappropriate.
> > >
> > > Yes, this I believe was the essential part (it was the last piece in
> > > my testing which fixed the hanging):
> > >
> >
> > Then I'll need to ask differently: What happens if you drop the IPMI code,
> > and just keep the wait_for_completion -> wait_for_completion_timeout
> > change ? Would that be sufficient to solve the problem ?
> 
> I'd rather say "Would that be sufficient to make the symptoms go
> away?" as it most likely papers over the real problem.
> 

Good point. Worse, it may result in UAF or memory leaks.

> > Either case, the need for this change suggests that the ipmi change
> > may not be complete, since it should send a completion with an error.
> 
> I think that reverting commit bc3a9d217755 ("ipmi:si: Gracefully
> handle if the BMC is non-functional") should also be considered as a
> possible way forward because it clearly did not improve things as
> expected, at least in this particular case.
> 

I tend to agree. I ran a number of AI code reviews over the patch, and
each time it finds new (and different) problems. The fact that the acpi
patch is still needed even after applying the ipmi changes suggests that
something is still missing in the ipmi code.

> It evidently did something that confuses things quite a bit.  Either
> it is returning IPMI_BUS_ERR instead of IPMI_ERR_UNSPECIFIED, or it is
> the "hosed" state and refusing to accept messages.
> 

More than that. My latest AI results are below, just for reference
(using Gemini 3 with Chris Mason's debug prompts). The prompt I used
for this run is:

"
The top commit in the linux/ directory results in hung tasks if the BMC
stops responding. Using @review-prompts/kernel/debugging.md analyze the
patch, identify the reason for the hung task problem, suggest and implement
a fix. Note that there may be more than one problem in the patch, so analyze
the complete patch and do not stop after fiding the first regression.
"

I think that catches most of the problem, but not all of it.

Guenter

---

Summary of crash or warning:
Hung task detected in ipmi_si driver when BMC becomes non-functional.
Processes waiting for IPMI responses (e.g. ipmitool, monitoring agents) enter D state and never recover.

Kernel version if available:
Top of tree (commit bc3a9d217755f65c137f145600f23bf1d6c31ea9)

Machine type if available:
Generic Server with BMC

Cleaned up copy of oops or stack trace:
[  120.123456] INFO: task ipmitool:1234 blocked for more than 120 seconds.
[  120.123457]       Not tainted 6.14.0-rc1 #1
[  120.123458] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  120.123459] task:ipmitool        state:D stack:    0 pid: 1234 ppid:  100 flags:0x00000000
[  120.123460] Call Trace:
[  120.123461]  <TASK>
[  120.123462]  __schedule+0x123/0x456
[  120.123463]  schedule+0x45/0x78
[  120.123464]  schedule_timeout+0x9a/0xbc
[  120.123465]  wait_for_completion+0xde/0xf0
[  120.123466]  ipmi_request_settime+0x123/0x145
[  120.123467]  ...
[  120.123468]  </TASK>

Any other kernel messages you found relevant:
N/A

Explanation of the problem:
1. Hung Task:
The patch "ipmi:si: Gracefully handle if the BMC is non-functional" introduces a new state `SI_HOSED` to handle BMC failures. When the driver detects that the BMC is not responding, it transitions to `SI_HOSED` and fails the currently processing message (`curr_msg`). However, if a new message is queued via `sender()` (populating `waiting_msg`) during a recovery probe (state `SI_GETTING_FLAGS`), and that probe subsequently fails, the state machine transitions back to `SI_HOSED`. In this transition, the driver checks and fails `curr_msg`, but it neglects to check or fail `waiting_msg`. As a result, the `waiting_msg` remains in the queue indefinitely, causing the waiting process to hang.

2. Excessive Polling (Timer Overwrite):
In `smi_timeout()`, the timer is unconditionally reset to a short timeout (e.g., 10ms) at the end of the function, unless the state machine is IDLE. When the state machine returns `SI_SM_HOSED`, `smi_event_handler()` correctly sets the timer to a long backoff (1 second). However, `smi_timeout()` subsequently overwrites this with the short timeout. This causes the driver to poll the hosed BMC every 10ms instead of backing off for 1 second, resulting in unnecessary CPU overhead.

Functions, snippets and call traces of code related to the problem:

drivers/char/ipmi/ipmi_si_intf.c: smi_event_handler()

	} else if (si_sm_result == SI_SM_HOSED) {
		/* ... */
		smi_info->si_state = SI_HOSED;
		if (smi_info->curr_msg != NULL) {
			return_hosed_msg(smi_info, IPMI_BUS_ERR);
		}
		/* BUG 1: waiting_msg is NOT checked here! */

		smi_mod_timer(smi_info, jiffies + SI_TIMEOUT_HOSED); /* Sets 1s timeout */
		goto out;
	}

drivers/char/ipmi/ipmi_si_intf.c: smi_timeout()

	smi_result = smi_event_handler(smi_info, time_diff);
	/* ... */
	if (smi_result != SI_SM_IDLE)
		smi_mod_timer(smi_info, timeout); /* BUG 2: Overwrites 1s timeout with ~10ms */

List of potential commits related to the problem:
bc3a9d217755f65c137f145600f23bf1d6c31ea9 ipmi:si: Gracefully handle if the BMC is non-functional

Suggested fix:
1. When entering `SI_HOSED` state in `smi_event_handler`, check for and fail any pending `waiting_msg` in addition to `curr_msg`.
2. In `smi_timeout`, do not reset the timer if the state is `SI_HOSED`, preserving the backoff timeout set by `smi_event_handler`.

---
Suggested diffs from that run:

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 1c65275906b4..023b0e819f91 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -810,6 +810,11 @@ static enum si_sm_result smi_event_handler(struct smi_info *smi_info,
 			 */
 			return_hosed_msg(smi_info, IPMI_BUS_ERR);
 		}
+		if (smi_info->waiting_msg != NULL) {
+			smi_info->curr_msg = smi_info->waiting_msg;
+			smi_info->waiting_msg = NULL;
+			return_hosed_msg(smi_info, IPMI_BUS_ERR);
+		}
 		smi_mod_timer(smi_info, jiffies + SI_TIMEOUT_HOSED);
 		goto out;
 	}
@@ -1130,10 +1135,12 @@ static void smi_timeout(struct timer_list *t)
 		timeout = jiffies + SI_TIMEOUT_JIFFIES;
 	}
 
-	if (smi_result != SI_SM_IDLE)
-		smi_mod_timer(smi_info, timeout);
-	else
+	if (smi_result != SI_SM_IDLE) {
+		if (smi_info->si_state != SI_HOSED)
+			smi_mod_timer(smi_info, timeout);
+	} else {
 		smi_info->timer_running = false;
+	}
 	spin_unlock_irqrestore(&(smi_info->si_lock), flags);
 }
 

