Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38669 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbdGGSYJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2017 14:24:09 -0400
Date: Fri, 7 Jul 2017 11:24:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Echtler <floe@butterbrot.org>
Cc: linux-hwmon@vger.kernel.org, rydberg@bitmath.org,
        rydberg@euromail.se
Subject: Re: [PATCH] export applesmc_{read,write,has}_key functions
Message-ID: <20170707182406.GC25433@roeck-us.net>
References: <1497603751-22360-1-git-send-email-floe@butterbrot.org>
 <20170616164133.GA31274@roeck-us.net>
 <75907138-41aa-0e3b-8369-027c0af02278@butterbrot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75907138-41aa-0e3b-8369-027c0af02278@butterbrot.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 21, 2017 at 11:15:11AM +0200, Florian Echtler wrote:
> On 16.06.2017 18:41, Guenter Roeck wrote:
> > On Fri, Jun 16, 2017 at 11:02:31AM +0200, Florian Echtler wrote:
> >> This patch exports the SMC key access functions from applesmc.c to allow
> >> access from other drivers, in particular, the yet-to-be-written ACPI 
> >> driver for Target Display Mode (TDM).
> > 
> > It is structurally deficient to have the hwmon driver export those functions.
> > If used by another driver, the functions should be moved to a common
> > driver, possibly in mfd. This driver would then also be responsible to
> > instantiate its child drivers.
> 
> Hm, this sounds like a major rework? AFAICT, that would roughly mean to move all
> code up to, but not including, applesmc_calibrate to mfd and leave the rest in
> hwmon?
> 
Sorry for the late reply.

Yes, this is asking for a major rework. At some point we just have to stop
adding more and more functionality to a single driver.

> What's the mechanism to auto-load another kernel module?
> 
Primarily MODULE_ALIAS and MODULE_DEVICE_TABLE. mfd drivers often use
platform_device_add() to create child devices, or mfd_add_devices().

Guenter
