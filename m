Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39452 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750887AbcFDOzQ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jun 2016 10:55:16 -0400
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
To: Borislav Petkov <bp@alien8.de>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net> <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net> <20160602072619.GB10803@pd.tnic>
 <alpine.DEB.2.11.1606020946430.3629@nanos> <20160602075830.GC10803@pd.tnic>
 <20160602081439.GD10803@pd.tnic> <20160603181836.GA8698@roeck-us.net>
 <20160603182916.GH4129@pd.tnic>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, linux-hwmon@vger.kernel.org,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5752EBCC.5020308@roeck-us.net>
Date: Sat, 4 Jun 2016 07:55:08 -0700
MIME-Version: 1.0
In-Reply-To: <20160603182916.GH4129@pd.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/03/2016 11:29 AM, Borislav Petkov wrote:
> On Fri, Jun 03, 2016 at 11:18:36AM -0700, Guenter Roeck wrote:
>> I like this version. Applied, though it would be nice to get a
>> Tested-by: or Acked-by: from someone at AMD. I'll hold back until
>> early next week before sending it to Linus.
>
> If it makes you feel any better: I have the affected hardware and am
> testing on it too. I wouldnt've caught it otherwise.
>

I'll send it to Linus next week unless I get an objection.

Guenter

