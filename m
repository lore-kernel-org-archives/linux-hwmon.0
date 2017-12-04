Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:34845 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdLDTjM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Dec 2017 14:39:12 -0500
Date: Mon, 4 Dec 2017 20:39:01 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Russell King <linux@armlinux.org.uk>,
        Jean Delvare <jdelvare@suse.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: at91: disable the nxp,se97b SMBUS
 timeout on the TSE-850
Message-ID: <20171204193901.GH21780@piout.net>
References: <20171127163101.27859-1-peda@axentia.se>
 <20171127163101.27859-3-peda@axentia.se>
 <20171129205311.GA20551@roeck-us.net>
 <20171129205629.GO21126@piout.net>
 <20171130171638.GA17788@roeck-us.net>
 <20171130172606.GZ21126@piout.net>
 <acaea4f3-d273-444a-4df4-e6d1b35c876d@axentia.se>
 <20171130211740.GA26784@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130211740.GA26784@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 30/11/2017 at 13:17:40 -0800, Guenter Roeck wrote:
> > I think it's a bugfix; it fixes real problems where the application
> > misbehave due to faulty content when reading from an eeprom. I'm
> > expecting to make a new release for the hw in question RSN and these
> > are the only local patches. So, it would be nice if they made it to
> > 4.14.x before my release happens. However, it's not like it's difficult
> > to rebase the patches should that backport not happen or take too long.
> > 
> Good enough for me. I'll send it as a fix for v4.15, with Cc: stable.
> 

I have it in my fixes branch too, I'll send it to arm-soc soon.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
