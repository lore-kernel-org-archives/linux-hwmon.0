Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:33996 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751687AbdFGUv0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2017 16:51:26 -0400
Date: Wed, 7 Jun 2017 15:51:09 -0500
From: Rob Herring <robh@kernel.org>
To: Carlo Caione <carlo@caione.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux@endlessm.com,
        punit.agrawal@arm.com, sudeep.holla@arm.com,
        devicetree@vger.kernel.org, Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add
 amlogic,meson-gxbb-scpi-sensors compatible
Message-ID: <20170607205109.nej32uj5x4thbwdd@rob-hp-laptop>
References: <20170530090507.16611-1-carlo@caione.org>
 <20170530090507.16611-2-carlo@caione.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170530090507.16611-2-carlo@caione.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 30, 2017 at 11:05:06AM +0200, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> Introduce a new Amlogic specific compatible to handle how Amlogic reports
> the sensor readings from SCPI using a different scale.
> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,scpi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
