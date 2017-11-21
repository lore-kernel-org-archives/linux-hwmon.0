Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35322 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751191AbdKUSgH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Nov 2017 13:36:07 -0500
Date: Tue, 21 Nov 2017 12:36:05 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net,
        mark.rutland@arm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v3 04/12] dt-bindings: fsi: Add P9 OCC hwmon device
 documentation
Message-ID: <20171121183605.eialwrmbu2hzcaix@rob-hp-laptop>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511222021-562-5-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511222021-562-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 20, 2017 at 05:53:33PM -0600, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Document the bindings for the FSI-based OCC hwmon device.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> new file mode 100644
> index 0000000..086b1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> @@ -0,0 +1,16 @@
> +Device-tree bindings for FSI-based On-Chip Controller hwmon device
> +------------------------------------------------------------------
> +
> +Required properties:
> + - compatible = "ibm,p9-occ-hwmon";
> +
> +Examples:
> +
> +    occ@1 {
> +        compatible = "ibm,p9-occ";
> +        reg = <1>;
> +
> +        occ-hwmon@1 {

Missing reg property or need to drop the unit-address.

> +            compatible = "ibm,p9-occ-hmwon";
> +        }

Missing ;

> +    };
> -- 
> 1.8.3.1
> 
