Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387580AbeKFHHY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 02:07:24 -0500
Date: Mon, 5 Nov 2018 15:45:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: "Woods, Brian" <Brian.Woods@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        Takashi Iwai <tiwai@suse.de>,
        Andy Whitcroft <apw@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        Myron Stowe <myron.stowe@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Message-ID: <20181105214537.GA19420@google.com>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181102195925.GB160487@google.com>
 <20181102232948.GC26770@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102232948.GC26770@zn.tnic>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

[+cc Takashi, Andy, Colin, Myron for potential distro impact]

[Beginning of thread:
https://lore.kernel.org/linux-pci/20181102181055.130531-1-brian.woods@amd.com/]

On Sat, Nov 03, 2018 at 12:29:48AM +0100, Borislav Petkov wrote:
> On Fri, Nov 02, 2018 at 02:59:25PM -0500, Bjorn Helgaas wrote:
> > This isn't my code, and I'm not really objecting to these changes, but
> > from where I sit, the fact that you need this sort of vendor-specific
> > topology discovery is a little bit ugly and seems like something of a
> > maintenance issue.  

I think this is the most important part, and I should have elaborated
on it instead of getting into the driver structure details below.

It is a major goal of ACPI and PCI that an old kernel should work
unchanged on a new platform unless it needs to use new functionality
introduced in the new platform.

amd_nb.c prevents us from achieving that goal.  These patches don't
add new functionality; they merely describe minor topographical
differences in new hardware.  We usually try to do that in a more
generic way, e.g., via an ACPI method, so the new platform can update
the ACPI method and use an old, already-qualified, already-shipped
kernel.

I'm not strenuously objecting to these because this isn't a *huge*
deal, but I suspect it is a source of friction for distros that don't
want to update and requalify their software for every new platform.

> > You could argue that this is sort of an "AMD CPU
> > driver", which is entitled to be device-specific, and that does make
> > some sense.
> 
> It is a bunch of glue code which enumerates the PCI devices a CPU
> has and other in-kernel users can use that instead of doing the
> discovery/enumeration themselves.
> 
> > But device-specific code is typically packaged as a driver that uses
> > driver registration interfaces like acpi_bus_register_driver(),
> > pci_register_driver(), etc.  That gives you a consistent structure
> > and, more importantly, a framework for dealing with hotplug.  It
> > doesn't look like amd_nb.c would deal well with hot-add of CPUs.
> 
> If you mean physical hotadd, then that's a non-issue as, AFAIK, AMD
> doesn't support that.
> 
> Now, TBH I've never tried soft-offlining the cores of a node and then
> check whether using the PCI devices of that node would work.
> 
> Now, I don't mind this getting converted to a proper PCI driver as long
> as it is not a module as it has to be present at all times. Other than
> that, I'm a happy camper.

amd_nb.c uses pci_get_device(), which is incompatible with hotplug and
subverts the usual driver/device ownership model.  We could pursue
this part of the conversation, but I think it's more fruitful to
approach this from the "new machine, old kernel" angle above.
