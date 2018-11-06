Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:38324 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbeKGH2e (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 02:28:34 -0500
Date: Tue, 6 Nov 2018 23:00:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20181106220059.GA4139@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181102195925.GB160487@google.com>
 <20181102232948.GC26770@zn.tnic>
 <20181105214537.GA19420@google.com>
 <20181105215650.GG26868@zn.tnic>
 <20181106214256.GA65443@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181106214256.GA65443@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 06, 2018 at 03:42:56PM -0600, Bjorn Helgaas wrote:
> This isn't some complicated new device where the programming model
> changed on the new CPU.  This is a thermometer that was already
> supported.  ACPI provides plenty of functionality that could be used
> to support this generically, e.g., see drivers/acpi/thermal.c,
> drivers/thermal/int340x_thermal/processor_thermal_device.c, etc.

Ok, you say ACPI but how do you envision practically doing that? I mean,
this is used by old boxes too - ever since K8. So how do we go and add
ACPI functionality to old boxes?

Or do you mean it should simply be converted to do pci_register_driver()
with a struct pci_driver pointer which has all those PCI device IDs in a
table? I'm looking at the last example
drivers/thermal/int340x_thermal/processor_thermal_device.c you gave above.

> But maybe there's some real value in the nitty-gritty device-specific
> code in amd_nb.c.  If so, I guess you're stuck with updates like this
> and negotiating with the distros to do backports and new releases.

Well, even if it is converted to a different registration scheme, you
still need to add new PCI device IDs to the table, no? So *some* sort of
enablement still needs to happen.

And then the argument about needing enablement for distros is moot
because it still needs enablement/backporting - regardless of the
registration scheme.

Or do you mean something else?

I mean, don't get me wrong, I don't mind if it gets converted to
pci_register_driver() if you think it fits better this way with the
drivers registering with PCI devices - I'm just trying to understand the
reasoning for it.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
