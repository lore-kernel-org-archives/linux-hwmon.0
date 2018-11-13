Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42116 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730995AbeKNDbp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 22:31:45 -0500
Date: Tue, 13 Nov 2018 09:32:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@bq.com>
Subject: Re: [PATCH] dt-bindings: hwmon: tmp108: add optional interrupts and
 #thermal-sensor-cells
Message-ID: <20181113173239.GA22310@roeck-us.net>
References: <20181107154708.422-1-heiko@sntech.de>
 <5bea0ecc.1c69fb81.e2af6.29c7@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bea0ecc.1c69fb81.e2af6.29c7@mx.google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 05:37:46PM -0600, Rob Herring wrote:
> On Wed,  7 Nov 2018 16:47:08 +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@bq.com>
> > 
> > The tmp108 does have an alert output that can be used as interrupt source
> > and can of course also be used as part of a thermal sensor setup for things
> > like thermal-based cpu frequencies, so document the necessary properties.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/tmp108.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Applied to hwmon-next.

Thanks,
Guenter
