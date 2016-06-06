Return-path: <Ray.Huang@amd.com>
Date: Mon, 6 Jun 2016 15:58:27 +0800
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>, <linux-hwmon@vger.kernel.org>, X86 ML
	<x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sherry Hurwitz
	<sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160606075826.GA25944@hr-amur2>
References: <574EE1B3.9010704@roeck-us.net>
 <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net>
 <20160602072619.GB10803@pd.tnic>
 <alpine.DEB.2.11.1606020946430.3629@nanos>
 <20160602075830.GC10803@pd.tnic>
 <20160602081439.GD10803@pd.tnic>
 <20160603181836.GA8698@roeck-us.net>
 <20160603182916.GH4129@pd.tnic>
 <5752EBCC.5020308@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5752EBCC.5020308@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Jun 04, 2016 at 07:55:08AM -0700, Guenter Roeck wrote:
> On 06/03/2016 11:29 AM, Borislav Petkov wrote:
> >On Fri, Jun 03, 2016 at 11:18:36AM -0700, Guenter Roeck wrote:
> >>I like this version. Applied, though it would be nice to get a
> >>Tested-by: or Acked-by: from someone at AMD. I'll hold back until
> >>early next week before sending it to Linus.
> >
> >If it makes you feel any better: I have the affected hardware and am
> >testing on it too. I wouldnt've caught it otherwise.
> >
> 
> I'll send it to Linus next week unless I get an objection.
> 

Guenter, I already verified on AMD CZ(family 15h, model 60h) and model
70h processors.

Acked-and-tested-by: Huang Rui <ray.huang@amd.com>
