Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:44218 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387580AbeKFHSv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 02:18:51 -0500
Date: Mon, 5 Nov 2018 22:56:50 +0100
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
Message-ID: <20181105215650.GG26868@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181102195925.GB160487@google.com>
 <20181102232948.GC26770@zn.tnic>
 <20181105214537.GA19420@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181105214537.GA19420@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 03:45:37PM -0600, Bjorn Helgaas wrote:
> amd_nb.c prevents us from achieving that goal.  These patches don't
> add new functionality; they merely describe minor topographical
> differences in new hardware.  We usually try to do that in a more
> generic way, e.g., via an ACPI method, so the new platform can update
> the ACPI method and use an old, already-qualified, already-shipped
> kernel.
> 
> I'm not strenuously objecting to these because this isn't a *huge*
> deal, but I suspect it is a source of friction for distros that don't
> want to update and requalify their software for every new platform.

Err, how is this any different from adding distro support for a new CPU
family?

This is basically the same thing. When distros add support for new
hardware, they have to backport patches for upstream. These PCI devices
which are part of the CPU are part of that hardware enablement.

So there's no way around doing that enablement. I don't think you can do
"old distro, new hardware" stuff without *some* hw enablement.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
