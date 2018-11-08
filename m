Return-Path: <helgaas@kernel.org>
Return-path: <helgaas@kernel.org>
Date: Thu, 8 Nov 2018 07:59:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	"Woods, Brian" <Brian.Woods@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jean Delvare <jdelvare@suse.com>, Pu Wen <puwen@hygon.cn>,
	Jia Zhang <qianyue.zj@alibaba-inc.com>,
	Takashi Iwai <tiwai@suse.de>, Andy Whitcroft <apw@canonical.com>,
	Colin Ian King <colin.king@canonical.com>,
	Myron Stowe <myron.stowe@redhat.com>,
	Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Message-ID: <20181108135934.GD41183@google.com>
References: <20181105214537.GA19420@google.com>
 <20181105215650.GG26868@zn.tnic>
 <20181106214256.GA65443@google.com>
 <20181106220059.GA4139@zn.tnic>
 <20181106232040.GA85755@google.com>
 <75748b089ee696d5cbaa5c0ce68bad228699894c.camel@linux.intel.com>
 <20181107213103.GA41183@google.com>
 <baf4b2e9c9b7cb2f827fd3bffce4b72f6d9376a8.camel@linux.intel.com>
 <20181107231411.GB41183@google.com>
 <2c4b9e7e-6558-e5ce-50e6-58aaec22fd1c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4b9e7e-6558-e5ce-50e6-58aaec22fd1c@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 07, 2018 at 05:40:14PM -0800, Guenter Roeck wrote:
> On 11/7/18 3:14 PM, Bjorn Helgaas wrote:
> > 
> > > 
> > > There is no INT3401 on any newer atom or core platforms, so you can't
> > > enumerate on this device. We don't control what ACPI device is present
> > > on a system. It depends on what the other non-Linux OS is using.
> > 
> > Sure, you can't *force* OEMs to supply a given ACPI device, but you
> > can certainly say "if you want this functionality, supply INT3401
> > devices."  That's what you do with PNP0A03 (PCI host bridges), for
> > example.  If an OEM doesn't supply PNP0A03 devices, the system can
> > boot just fine as long as you don't need PCI.
> > 
> > This model of using the PCI IDs forces OS vendors to release updates
> > for every new platform.  I guess you must have considered that and
> > decided whatever benefit you're getting was worth the cost.
> > 
> 
> I really dislike where this is going. Board vendors - and that included
> Intel when Intel was still selling boards - have a long history of only
> making mandatory methods available in ACPI. Pretty much all of them don't
> make hardware monitoring information available via ACPI. This is a pain
> especially for laptops where the information is provided by an embedded
> controller. On systems with Super-IO chips with dedicated hardware
> monitoring functionality, they often go as far as signing mutual NDAs
> with chip vendors, which lets both the board and the chip vendor claim
> that they can not provide chip specifications to third parties, aka
> users.
> 
> You are pretty much extending that to CPU temperature monitoring. The
> fallout, if adopted, will be that it will effectively no longer be
> possible to monitor the temperature on chips supporting this
> "feature".
> 
> I do not think that would be a good idea.

I wasn't aware of these political implications.  Thanks for raising
them.

I'm not in a position to balance those implications vs the technical
question of minimizing the burden of supporting new platforms, so I'll
try again to bow out of this.

Bjorn
