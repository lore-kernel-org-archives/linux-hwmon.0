Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:54694 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754093AbcFANlj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 1 Jun 2016 09:41:39 -0400
Date: Wed, 1 Jun 2016 15:41:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>
Cc: linux-hwmon@vger.kernel.org, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160601134126.GB22373@pd.tnic>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <574EE1B3.9010704@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 01, 2016 at 06:22:59AM -0700, Guenter Roeck wrote:
> An explanation would be helpful. Is this a bug fix ?

That's a good point - yes, it is necessary. Both smp_processor_id()
*and* smp_call_function_many() need to be called with preemption
disabled.

It did fire the BUG thing in check_preemption_disabled() with 4.7-rc1
here without those fixes.

But, we need the other patch too -

"[PATCH] x86/cpu/AMD: Extend X86_FEATURE_TOPOEXT workaround to newer models"

because the cpumask generation in read_registers() doesn't work on those
Carrizo CPUs.

IINM, the breakage came in during this merge window so we don't have to
CC:stable but both should be sent to Linus as fixes for 4.7.

You could sync with Ingo who takes/acks what... but they could go
through tip and hwmon tree too, I don't see a hard dependency between
the two - they'd only need to be in 4.7-final.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
