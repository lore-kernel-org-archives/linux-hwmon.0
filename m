Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:43722 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387580AbeKFHEY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 02:04:24 -0500
Date: Mon, 5 Nov 2018 22:42:33 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Woods, Brian" <Brian.Woods@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Message-ID: <20181105214233.GF26868@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181105193840.GA26868@zn.tnic>
 <20181105203330.GB27399@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181105203330.GB27399@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 08:33:34PM +0000, Woods, Brian wrote:
> I think having them togeter is cleaner. If you aren't finding any
> misc IDs, I highly doubt you'll find any root IDs.  There shouldn't
> be much of a difference in how fast the function exits, either way.
> If you want it the other way though, I don't mind changing it.

Yes please. Because this is the usual kernel coding style of calling a
function (or a loop which has some result in this case) and testing that
result immediately after the function call.

> Would
> 
> 		/*
> 		 * If there are more PCI root devices than data fabric/
> 		 * system management network interfaces, then the (N)
> 		 * PCI roots per DF/SMN interface are functionally the
> 		 * same (for DF/SMN access) and N-1 are redundant.  The
> 		 * N-1 PCI roots should be skipped per DF/SMN interface
> 		 * so the DF/SMN interfaces get mapped to the correct
> 		 * PCI root.

You say "correct" as there is a special one. But the text before it says
they're "functionally the same" wrt DF/SMN access so it sounds to me
like we wanna map the first one we find and ignore the others.

I.e., we wanna say

"... so the DF/SMN interfaces get mapped to the *first* PCI root and the
others N-1 ignored."

Or am I misreading this?

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
