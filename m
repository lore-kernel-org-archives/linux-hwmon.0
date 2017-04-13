Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34804 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755085AbdDMUBn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2017 16:01:43 -0400
Date: Thu, 13 Apr 2017 15:01:40 -0500
From: Rob Herring <robh@kernel.org>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lee.jones@linaro.org, olof@lixom.net,
        linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        Moritz Fischer <mdf@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add bindings for Google Chromium
 EC HWMON
Message-ID: <20170413200140.lcynmsv255ktoiyl@rob-hp-laptop>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
 <1491602410-31518-2-git-send-email-moritz.fischer@ettus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491602410-31518-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Apr 07, 2017 at 03:00:09PM -0700, Moritz Fischer wrote:
> From: Moritz Fischer <mdf@kernel.org>
> 
> Add bindings for the Chromium EC HWMON. The Chromium EC HWMON
> allows monitoring of temperature sensors and fans attached to the
> EC.
> 
> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> ---
>  .../devicetree/bindings/hwmon/cros-ec-hwmon.txt    | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
> new file mode 100644
> index 0000000..4c94869
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
> @@ -0,0 +1,25 @@
> +Chromium Embedded Controller EC temperature and fan control
> +-----------------------------------------------------------
> +
> +Google's Chromium EC HWMON is a hwmon implemented byimplemented by the Chromium EC
> +firmware attached to the Embedded Controller (EC) and controlled via a host-command
> +interface.
> +
> +An EC HWMON node should be only found as a sub-node of the EC node (see
> +Documentation/devicetree/bindings/mfd/cros-ec.txt).
> +
> +Required properties:
> +- compatible: Must contain "google,cros-ec-hwmon"
> +
> +Example:
> +	embedded-controller@1e {
> +		reg = <0x1e>;
> +		compatible = "google,cros-ec-i2c";
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio0>;
> +
> +		hwmon {
> +			compatible = "google,cros-ec-hwmon";

This is sufficient for all devices? I don't see that DT provides 
anything here other than instantiating a device, but the parent device 
can just as easily do that.

Rob
