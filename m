Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35407 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbeIJXLc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Sep 2018 19:11:32 -0400
Date: Mon, 10 Sep 2018 13:16:10 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device
 documentation
Message-ID: <20180910181610.GA5907@bogus>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> new file mode 100644
> index 0000000..46372f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> @@ -0,0 +1,15 @@
> +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> +---------------------------------------------------------------------
> +
> +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> +nodes.
> +
> +Required properties:
> + - compatible = "ibm,p9-occ"
> +
> +Examples:
> +
> +    occ {

FSI slave devices are supposed to have an address according to the 
binding doc.

> +        compatible = "ibm,p9-occ";
> +    };
> -- 
> 1.8.3.1
> 
