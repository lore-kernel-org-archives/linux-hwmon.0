Return-Path: <srinivas.pandruvada@linux.intel.com>
Return-path: <srinivas.pandruvada@linux.intel.com>
Message-ID: <f854c74c307aa8f7cf482f5e4e63cf03f3dc12ca.camel@linux.intel.com>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, "Woods, Brian" <Brian.Woods@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H.
 Peter Anvin" <hpa@zytor.com>,  "x86@kernel.org" <x86@kernel.org>, Clemens
 Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Pu Wen <puwen@hygon.cn>,  Jia Zhang
 <qianyue.zj@alibaba-inc.com>, Takashi Iwai <tiwai@suse.de>, Andy Whitcroft
 <apw@canonical.com>,  Colin Ian King <colin.king@canonical.com>, Myron
 Stowe <myron.stowe@redhat.com>, Sumeet Pawnikar
 <sumeet.r.pawnikar@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Date: Wed, 07 Nov 2018 15:44:10 -0800
In-Reply-To: <9e4da173ba2978e1c16839162dd927c5ea0fdc36.camel@linux.intel.com>
References: <20181102195925.GB160487@google.com>
	 <20181102232948.GC26770@zn.tnic> <20181105214537.GA19420@google.com>
	 <20181105215650.GG26868@zn.tnic> <20181106214256.GA65443@google.com>
	 <20181106220059.GA4139@zn.tnic> <20181106232040.GA85755@google.com>
	 <75748b089ee696d5cbaa5c0ce68bad228699894c.camel@linux.intel.com>
	 <20181107213103.GA41183@google.com>
	 <baf4b2e9c9b7cb2f827fd3bffce4b72f6d9376a8.camel@linux.intel.com>
	 <20181107231411.GB41183@google.com>
	 <9e4da173ba2978e1c16839162dd927c5ea0fdc36.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 2018-11-07 at 15:30 -0800, Srinivas Pandruvada wrote:
> [...]
> 
> > Sure, you can't *force* OEMs to supply a given ACPI device, but you
> > can certainly say "if you want this functionality, supply INT3401
> > devices."  That's what you do with PNP0A03 (PCI host bridges), for
> > example.  If an OEM doesn't supply PNP0A03 devices, the system can
> > boot just fine as long as you don't need PCI.
> > 
> > This model of using the PCI IDs forces OS vendors to release
> > updates
> > for every new platform.  I guess you must have considered that and
> > decided whatever benefit you're getting was worth the cost.
> 
> Not worth cost. This is a pain. Every release we end up adding a
> single
> line change to many drivers adding a PCI device id. 
> Since there is no unique class_mask for PCI device for these devices,
> we need to add device_id for each generation even if there is no
> change.
> Instead if we have some feature to say don't enumerate for PCI device
> id < X and a black list, it will save lot of work.
This still needs some work on our internal PCI device allocation scheme
, where we can reserve a block of ids for a PCI device for same
functionality from generation to generation.

Thanks,
Srinivas
