Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:44101 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751455AbcFBH6o (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 2 Jun 2016 03:58:44 -0400
Date: Thu, 2 Jun 2016 09:58:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>,
	linux-hwmon@vger.kernel.org, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160602075830.GC10803@pd.tnic>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net>
 <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net>
 <20160602072619.GB10803@pd.tnic>
 <alpine.DEB.2.11.1606020946430.3629@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1606020946430.3629@nanos>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 02, 2016 at 09:47:54AM +0200, Thomas Gleixner wrote:
> What's wrong with using:
> 
>        on_each_cpu_mask()
> 
> Which does all that magic for you?

Ha, very nice! Let me try it.

Thanks!

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
