Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59959 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932259AbcFCSSl (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jun 2016 14:18:41 -0400
Date: Fri, 3 Jun 2016 11:18:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, linux-hwmon@vger.kernel.org,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160603181836.GA8698@roeck-us.net>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net>
 <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net>
 <20160602072619.GB10803@pd.tnic>
 <alpine.DEB.2.11.1606020946430.3629@nanos>
 <20160602075830.GC10803@pd.tnic>
 <20160602081439.GD10803@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602081439.GD10803@pd.tnic>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 02, 2016 at 10:14:39AM +0200, Borislav Petkov wrote:
> On Thu, Jun 02, 2016 at 09:58:30AM +0200, Borislav Petkov wrote:
> > Ha, very nice! Let me try it.
> 
> Yap, much better than opencoding on_each_cpu_mask() :-)
> 
> ---
> From: Borislav Petkov <bp@suse.de>
> Date: Wed, 1 Jun 2016 11:36:13 +0200
> Subject: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
>  registers
> 
> We need to read a bunch of registers on each compute unit and possibly
> on the current CPU too. Disable preemption around it. Otherwise, you
> get:
> 
>   BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/327
>   caller is read_registers+0x6a/0x110 [fam15h_power]
>   CPU: 3 PID: 327 Comm: systemd-udevd Not tainted 4.7.0-rc1+ #4
>   Hardware name: HP HP EliteBook 745 G3/807E, BIOS N73 Ver. 01.08 01/28/2016
>   ...
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Rui Huang <ray.huang@amd.com>
> Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: fa7943449943 ("hwmon: (fam15h_power) Add compute unit accumulated power")

I like this version. Applied, though it would be nice to get a Tested-by: or
Acked-by: from someone at AMD. I'll hold back until early next week before
sending it to Linus.

Thanks,
Guenter
