Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37086 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965494AbeAJKSl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 05:18:41 -0500
Date: Wed, 10 Jan 2018 11:18:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
Message-ID: <20180110101840.GB5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
> This commit adds driver implementation for Aspeed PECI. Also adds
> generic peci.h and peci_ioctl.h files to provide compatibility
> to peci drivers that can be implemented later e.g. Nuvoton's BMC
> SoC family.

We don't add code that could be used "sometime in the future".  Only
include stuff that we use now.

Please fix up this series based on that and resubmit.  There should not
be any need for any uapi file then, right?

thanks,

greg k-h
