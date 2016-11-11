Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:33897 "EHLO quartz.orcorp.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965060AbcKKAb4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Nov 2016 19:31:56 -0500
Date: Thu, 10 Nov 2016 17:31:40 -0700
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] lm87: Allow LM87_REG_CHANNEL_MODE to be set via DT
Message-ID: <20161111003140.GA7575@obsidianresearch.com>
References: <20161110171936.GA29537@obsidianresearch.com>
 <20161110234707.GA14199@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161110234707.GA14199@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 10, 2016 at 03:47:07PM -0800, Guenter Roeck wrote:
> On Thu, Nov 10, 2016 at 10:19:36AM -0700, Jason Gunthorpe wrote:
> > This compliments the existing scheme that lets it be set via
> > platform_data.
> > 
> > Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> 
> I would prefer https://www.spinics.net/lists/devicetree/msg148819.html
> which appears to address the same problem and is less cryptic.

Is there a patch someplace that implements that proposed DT binding? I
couldn't find anything.

> NACK unless someone convinces me otherwise.

*shrug* both styles of definition seem to be used in various device
tree bindings.

The downside with Mahoda's proposal is that it only covers 3 of the 8
configuration bits, and will require alot of code for parsing. It
seems really clunky, and why is a regulator involved to set the A/D
sensitivity? Weird.

But I only need has-temp3, so if a patch appears please cc me and I'll
review it here..

Regards,
Jason
