Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:33964 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728133AbeKFRwL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 12:52:11 -0500
Date: Tue, 6 Nov 2018 09:27:59 +0100
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
Message-ID: <20181106082759.GA13712@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181105193840.GA26868@zn.tnic>
 <20181105203330.GB27399@amd.com>
 <20181105214233.GF26868@zn.tnic>
 <20181105233212.GC27399@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181105233212.GC27399@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 11:32:16PM +0000, Woods, Brian wrote:
> Your understanding is correct.  It's more so that the following DF/SMN
> interface gets mapped correctly.
> 		/*
> 		 * If there are more PCI root devices than data fabric/
> 		 * system management network interfaces, then the (N)
> 		 * PCI roots per DF/SMN interface are functionally the
> 		 * same (for DF/SMN access) and N-1 are redundant.  N-1
> 		 * PCI roots should be skipped per DF/SMN interface so
> 		 * the following DF/SMN interfaces get mapped to
> 		 * correct PCI roots.
> 		 */
> Does that read clearer?

Yap, thanks!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
