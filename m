Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35360 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbdBHWag (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Feb 2017 17:30:36 -0500
Date: Wed, 8 Feb 2017 16:30:34 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>
Subject: Re: [RFC 1/2] devicetree: add lm90 thermal_zone sensor support
Message-ID: <20170208223034.om75tphg277l2ink@rob-hp-laptop>
References: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Feb 05, 2017 at 10:03:15PM +0100, Christian Lamparter wrote:
> This patch updates the LM90's devicetree definition to
> include the #thermal-sensor-cells property as well as
> the sensor constants in include/dt-bindings/thermal/lm90.h.
> 
> Cc: Wei Ni <wni@nvidia.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> ---
> I'm aware that there was atleast one previous attempt to add
> thermal_zone temperature sensors for the LM90 module. This was
> discussed on:
> <http://www.gossamer-threads.com/lists/linux/kernel/1992853>
> <https://lkml.org/lkml/2014/3/4/194>
> 
> This RFC is meant to get it going again. As I would really
> like to have this functionality for the Netgear WNDR4700.
> This router uses a G781 to measure the SoCs temperature
> in order to regulate a TC654 fan-controller.
> <https://git.lede-project.org/?p=source.git;a=commit;h=9e0fd1b52ad1f805a308bf6a5a13236f352fd962>
> ---
>  Documentation/devicetree/bindings/hwmon/lm90.txt |  6 ++++++
>  MAINTAINERS                                      |  1 +
>  include/dt-bindings/thermal/lm90.h               | 12 ++++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/thermal/lm90.h

Acked-by: Rob Herring <robh@kernel.org>

