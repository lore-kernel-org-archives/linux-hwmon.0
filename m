Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37516 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbeJXPwf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 11:52:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id p2-v6so964132wmc.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Oct 2018 00:25:44 -0700 (PDT)
Date: Wed, 24 Oct 2018 08:25:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v8 07/12] dt-bindings: mfd: Add a document for PECI
 client MFD
Message-ID: <20181024072540.GA4939@dell>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:

> This commit adds a dt-bindings document for PECI client MFD.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> new file mode 100644
> index 000000000000..cb341e363add
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> @@ -0,0 +1,34 @@
> +* Intel PECI client bindings
> +
> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
> +provides a communication channel from PECI clients in Intel processors and
> +chipset components to external monitoring or control devices. PECI is designed
> +to support the following sideband functions:
> +
> +- Processor and DRAM thermal management
> +- Platform Manageability
> +- Processor Interface Tuning and Diagnostics
> +- Failure Analysis
> +
> +Required properties:
> +- compatible : Should be "intel,peci-client".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients starts from 0x30 based on PECI specification.

Nit: "start"

Would be better worded:

"According to the PECI specification client addresses start from 0x30."

> +Example:
> +	peci-bus@0 {
> +		compatible = "vendor,soc-peci";
> +		reg = <0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		peci-client@30 {
> +			compatible = "intel,peci-client";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "intel,peci-client";
> +			reg = <0x31>;
> +		};
> +	};

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
