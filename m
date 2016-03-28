Return-path: <Ray.Huang@amd.com>
Date: Mon, 28 Mar 2016 10:19:23 +0800
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Trek <trek00@inbox.ru>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: fam15h_power on a4-4000?
Message-ID: <20160328021922.GA11559@hr-amur2>
References: <20160327201340.152ff142@enterprise>
 <20160327185131.GA32631@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20160327185131.GA32631@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Mar 28, 2016 at 02:51:31AM +0800, Guenter Roeck wrote:
> On Sun, Mar 27, 2016 at 08:13:40PM +0200, Trek wrote:
> > reading the specs, it seems to me that the a4-4000 processor (amd fam
> > 15h model 13h) has the tdp running average feature, implemented in
> > the fam15h_power module:
> > 
> >   D18F5xE0, page 456, BKDG for AMD Family 15h Models 10h-1Fh Processors
> >   http://support.amd.com/TechDocs/42300_15h_Mod_10h-1Fh_BKDG.pdf
> > 
> > if this assumption is correct, the module fails to probe the device
> > only because the pci id to query is different, so the attached patch
> > should fix the detection
> > 
> > it is untested as i'm not familiar with the hardware and i really
> > appreciate some suggestion from an expert here
> > 
> > c-ya!
> 
> Let's ask the maintainer. Huang, is this correct ?
> 
> Also see comment inline.
> 

OK.

Trek, have you tested it on Fam15h Models 10h-1fh platforms? I seem to
remember I tried it on that type of platforms, but the test data was
not right. So I didn't expose it at that time.

Thanks,
Rui
