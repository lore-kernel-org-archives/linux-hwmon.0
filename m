Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50475 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbdFGPz3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2017 11:55:29 -0400
Date: Wed, 7 Jun 2017 08:55:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, msbarth@linux.vnet.ibm.com,
        tpearson@raptorengineering.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
Message-ID: <20170607155526.GA18946@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170606070230.32669-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
> Add a basic driver for the MAX31785, focusing on the fan control
> features but ignoring the temperature and voltage monitoring
> features of the device.
> 
> This driver supports all fan control modes and tachometer / PWM
> readback where applicable.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Hello,
> 
> This is a rework of Timothy Pearson's original patch:
> 
>     https://www.mail-archive.com/linux-hwmon@vger.kernel.org/msg00868.html
> 
> I've labelled it as v3 to differentiate from Timothy's postings.
> 
> The original thread had some discussion about the MAX31785 being a PMBus device
> and that it should thus be a PMBus driver. The implementation still makes use

After thinking about it, that is what it should be. If I accept it as non-PMBus
driver, it will be all but impossible to convert it to a PMBus driver later on,
and that just doesn't make any sense.

With no one interested in writing that driver, I'll try to give it some more
priority myself. I do have an evaluation board somewhere, which should help.

Note that the second fan reading should be implemented as just that, not with
a non-standard attribute.

Guenter
