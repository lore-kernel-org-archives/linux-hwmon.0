Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34303 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbcJDWJl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2016 18:09:41 -0400
Date: Tue, 4 Oct 2016 15:09:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michael Wang <Michael.Wang@alliedtelesis.co.nz>
Subject: Re: [PATCHv1] hwmon: adm9240: handle temperature readings below 0
Message-ID: <20161004220938.GA4566@roeck-us.net>
References: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
 <20161004205359.GA29531@roeck-us.net>
 <3c7c751bd9d24856ace5866ffb94060a@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c7c751bd9d24856ace5866ffb94060a@svr-chch-ex1.atlnz.lc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 04, 2016 at 09:09:10PM +0000, Chris Packham wrote:
> 
> >
> > Of course, all that doesn't solve the real problem in this driver, which is
> > that it ignores error codes from the smbus functions, but that is a different
> > problem.
> 
> Yeah I'd noted that too. This patch is actually a port of changes we've 
> made to a custom LM81 driver based on the original adm9240 driver which 
> included some error handling. I'll look at bringing more of that code in 
> for a future patch.
> 
Sounds good... 

Thanks,
Guenter
