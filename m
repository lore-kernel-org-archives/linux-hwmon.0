Return-Path: <bp@alien8.de>
Return-path: <bp@alien8.de>
Date: Sat, 3 Nov 2018 00:29:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Woods, Brian" <Brian.Woods@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Pu Wen <puwen@hygon.cn>,
	Jia Zhang <qianyue.zj@alibaba-inc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Message-ID: <20181102232948.GC26770@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181102195925.GB160487@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181102195925.GB160487@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Nov 02, 2018 at 02:59:25PM -0500, Bjorn Helgaas wrote:
> This isn't my code, and I'm not really objecting to these changes, but
> from where I sit, the fact that you need this sort of vendor-specific
> topology discovery is a little bit ugly and seems like something of a
> maintenance issue.  You could argue that this is sort of an "AMD CPU
> driver", which is entitled to be device-specific, and that does make
> some sense.

It is a bunch of glue code which enumerates the PCI devices a CPU
has and other in-kernel users can use that instead of doing the
discovery/enumeration themselves.

> But device-specific code is typically packaged as a driver that uses
> driver registration interfaces like acpi_bus_register_driver(),
> pci_register_driver(), etc.  That gives you a consistent structure
> and, more importantly, a framework for dealing with hotplug.  It
> doesn't look like amd_nb.c would deal well with hot-add of CPUs.

If you mean physical hotadd, then that's a non-issue as, AFAIK, AMD
doesn't support that.

Now, TBH I've never tried soft-offlining the cores of a node and then
check whether using the PCI devices of that node would work.

Now, I don't mind this getting converted to a proper PCI driver as long
as it is not a module as it has to be present at all times. Other than
that, I'm a happy camper.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
