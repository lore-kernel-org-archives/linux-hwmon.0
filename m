Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41261 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbeKGXVy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Nov 2018 18:21:54 -0500
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
To: Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: "Woods, Brian" <Brian.Woods@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        Takashi Iwai <tiwai@suse.de>,
        Andy Whitcroft <apw@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        Myron Stowe <myron.stowe@redhat.com>,
        Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181102195925.GB160487@google.com> <20181102232948.GC26770@zn.tnic>
 <20181105214537.GA19420@google.com> <20181105215650.GG26868@zn.tnic>
 <20181106214256.GA65443@google.com> <20181106220059.GA4139@zn.tnic>
 <20181106232040.GA85755@google.com> <20181107091838.GA10835@zn.tnic>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <72f4a144-fe83-dc0d-b839-133873ed589b@roeck-us.net>
Date: Wed, 7 Nov 2018 05:51:22 -0800
MIME-Version: 1.0
In-Reply-To: <20181107091838.GA10835@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/7/18 1:18 AM, Borislav Petkov wrote:
> On Tue, Nov 06, 2018 at 05:20:41PM -0600, Bjorn Helgaas wrote:
>> Or maybe even drivers/acpi/thermal.c, which claims every Thermal Zone
>> (ACPI 6.2, sec 11), would be sufficient.  I don't know what the
>> relationship between hwmon and other thermal stuff, e.g.,
>> Documentation/thermal/sysfs-api.txt is.  acpi/thermal.c looks tied
>> into the drivers/thermal stuff (it registers "thermal_zone" devices),
>> but not to hwmon.
> 
> Err, I still don't think I'm catching your drift but let me stop you
> right there: amd_nb is not there only for hwmon/k10temp. It is a small
> interface glue if you will, which exports the CPU functionality in PCI
> config space to other consumers.
> 

Also, thermal and hwmon are orthogonal, just like hwmon and iio. One would
typically have a driver in one subsystem, in some cases bridging to the
other subsystem, but one would not have drivers in both subsystems.
I think Bjorn is suggesting that the k10temp driver should move to the
thermal subsystem, though I don't really understand what that has to do
with finding the correct PCI device(s) to query. Or maybe I misunderstand.

Guenter

> So it is not really a driver - it is used by drivers to talk/query CPU
> settings through it.
> 
> With that said, I don't think I understand all that talk about PNP IDs
> and ACPI methods. But maybe I'm missing something...
> 
> So what's up?
> 
