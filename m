Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:35449 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751867AbcC2H5w (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 03:57:52 -0400
Date: Tue, 29 Mar 2016 09:57:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Huang Rui <ray.huang@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, spg_linux_kernel@amd.com
Subject: Re: [PATCH v5 2/6] hwmon: (fam15h_power) Add compute unit
 accumulated power
Message-ID: <20160329075749.GB3705@pd.tnic>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-3-git-send-email-ray.huang@amd.com>
 <20160328092952.GB26651@pd.tnic>
 <20160329073158.GC3408@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160329073158.GC3408@twins.programming.kicks-ass.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Mar 29, 2016 at 09:31:58AM +0200, Peter Zijlstra wrote:
> This will not in fact work for Intel, nor if I manage to one day
> randomize our CPU numbers on AMD.

Oh, I know why. I have this 64 CPUs box here:

$ grep "core id" /proc/cpuinfo | uniq
core id         : 0
core id         : 8
core id         : 2
core id         : 10
core id         : 1
core id         : 9
core id         : 3
core id         : 11
core id         : 0
core id         : 8
core id         : 2
core id         : 10
core id         : 1
core id         : 9
core id         : 3
core id         : 11

Those core IDs repeat and are almost random too :)

I guess we'll need a mask. Maybe as a future exercise...

That box's topology has other funsies like this:

$ grep -E -B 2 "core id\s+: 0" /proc/cpuinfo
physical id     : 0
siblings        : 16
core id         : 0
--
physical id     : 1
siblings        : 16
core id         : 0
--
physical id     : 2
siblings        : 16
core id         : 0
--
physical id     : 3
siblings        : 16
core id         : 0
--
physical id     : 0
siblings        : 16
core id         : 0
--
physical id     : 1
siblings        : 16
core id         : 0
--
physical id     : 2
siblings        : 16
core id         : 0
--
physical id     : 3
siblings        : 16
core id         : 0

So in order to dig out which HT threads belong together, I need to look
at the (core id, physical id) pair.

I guess this is how we "fix" the schedulers of other OSes - by playing
topology games...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
