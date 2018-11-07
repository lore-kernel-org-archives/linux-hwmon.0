Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:47468 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727870AbeKHCsr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 21:48:47 -0500
Date: Wed, 7 Nov 2018 18:17:21 +0100
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
        Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Message-ID: <20181107171721.GC14169@zn.tnic>
References: <20181102232948.GC26770@zn.tnic>
 <20181105214537.GA19420@google.com>
 <20181105215650.GG26868@zn.tnic>
 <20181106214256.GA65443@google.com>
 <20181106220059.GA4139@zn.tnic>
 <20181106232040.GA85755@google.com>
 <20181107091838.GA10835@zn.tnic>
 <20181107133856.GA238955@google.com>
 <20181107160707.GA14169@zn.tnic>
 <20181107171044.GA261200@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181107171044.GA261200@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 07, 2018 at 11:10:44AM -0600, Bjorn Helgaas wrote:
> No, the idea was more that that temp monitoring, e.g., k10temp, could
> be independent of amd_nb.
> 
> But I can tell this idea isn't going anywhere, so let's just forget
> that I stuck my neck out and let it die on the vine :)

No no, your idea makes sense. I see the advantage of not having to do
enablement so that old k10temp can load on new machines. Sure.

We just need to find out about the PNP ID...

:-)

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
