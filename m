Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58972 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754388AbeGHXOp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Jul 2018 19:14:45 -0400
Date: Sun, 8 Jul 2018 16:14:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v8, 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan controller
 documentation
Message-ID: <20180708231443.GA25802@roeck-us.net>
References: <20180703232326.355718-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703232326.355718-2-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 04, 2018 at 02:23:25AM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> The Nuvoton BMC NPCM7XX supports 8 PWM controller outputs
> and 16 Fan tachometer controller inputs.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next; while doing so, fixed a couple of whitespace errors
recognixed by git.

Thanks,
Guenter
