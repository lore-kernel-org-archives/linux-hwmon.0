Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41898 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754392AbeGHXPI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Jul 2018 19:15:08 -0400
Date: Sun, 8 Jul 2018 16:15:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v8,2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
Message-ID: <20180708231507.GA26077@roeck-us.net>
References: <20180703232326.355718-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703232326.355718-3-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)
> and Fan tacho driver.
> 
> The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs
> and 16 Fan controller inputs.
> 
> The driver provides a sysfs entries through which the user can
> configure the duty-cycle value from 0(off) and 255(full speed)
> and read the fan tacho rpm value.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
