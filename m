Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A16C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 01:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98F1D2184C
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 01:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573520628;
	bh=edrzzksttWPtC6CUzA3z0nNJvXMDTIAjmo8MpkSl3uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0bEIHRLeIgU8gLnL24SS1jQ6Bof/dNTM/s7GNx2/bone4U7KCpi96EudZHHe37GXM
	 nPV3nBs44ccqzbxKu86kyrxD2jbBE2nWtPGYfgUwmJ991xQdm6MyQP1pVfnjRCU8+9
	 pIduB2oqTW3vF3NLfllaTe9d9rKC/0O+vf1tucds=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfKLBDs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 20:03:48 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44428 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKLBDs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 20:03:48 -0500
Received: by mail-ot1-f65.google.com with SMTP id c19so12848287otr.11;
        Mon, 11 Nov 2019 17:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SKl5Xcupc7He4WT8w6+4E+JP5fs6vZK0i9WhfBICwi0=;
        b=d3PqHGsFtDWb2St2GM5ijefG9xREPIdGtyXN05qLPsTSkaE12NJTFOzlJZ6FzhMSzQ
         O3n6UrzYc6g/099EuGpQri2pPr/1EHtJJNS+HqsP/cVODQOlHDBoIpmLtBdUURQt65Fo
         1hdAgjrxxPYiuSFaUDI1PgVLP2NfdvF2SO6T+JrTf54WfNqHG60K4cSr66PwLOfkpCDK
         ypv9ocsv1PeTWbGF8yPwo3Bz4RAOcyZ5Y/CdRvh2z+e1IODlZ+ROyohUpqAPlU/ZurDh
         IPhKSL+J68h1CwOkg5w7J55i0OsA4ZhumPgeT3VkzgIvE+JONEvRVYgXWMto461qWNtz
         2Z+w==
X-Gm-Message-State: APjAAAXtIYEDuvpD/mlnYwb5fZvixp9JZl0iyDx/bk5ilnQ+Vvlr8Zyh
        /K4F9ipgYYQMcmzPYSUOVw==
X-Google-Smtp-Source: APXvYqyfrZ9KqRIgcKWGt4To/iYyiB/1CqymxV0BGHHKvUeahi0knIHGpqDR3dybuwmTUYZWIbXJ8g==
X-Received: by 2002:a9d:351:: with SMTP id 75mr14276197otv.142.1573520626610;
        Mon, 11 Nov 2019 17:03:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y4sm5468071oie.42.2019.11.11.17.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:03:45 -0800 (PST)
Date:   Mon, 11 Nov 2019 19:03:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     etremblay@distech-controls.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, mark.rutland@arm.com, corbet@lwn.net
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Message-ID: <20191112010345.GA19664@bogus>
References: <20191111203445.27130-1-etremblay@distech-controls.com>
 <20191111203445.27130-2-etremblay@distech-controls.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111203445.27130-2-etremblay@distech-controls.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 11, 2019 at 03:34:44PM -0500, etremblay@distech-controls.com wrote:
> From: Eric Tremblay <etremblay@distech-controls.com>
> 
> Document the TMP513/512 device devicetree bindings
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..de4ed3645e0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/ti,tmp513.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMP513/512 system monitor sensor
> +
> +maintainers:
> +  - Eric Tremblay <etremblay@distech-controls.com>
> +
> +description: |
> +  This driver implements support for Texas Instruments TMP512, and TMP513.
> +  The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitors
> +  that include remote sensors, a local temperature sensor, and a high-side
> +  current shunt monitor. These system monitors have the capability of measuring
> +  remote temperatures, on-chip temperatures, and system voltage/power/current
> +  consumption.
> +
> +  Datasheets:
> +  http://www.ti.com/lit/gpn/tmp513
> +  http://www.ti.com/lit/gpn/tmp512
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmp512
> +      - ti,tmp513
> +
> +  reg:
> +    maxItems: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description: |
> +      If 0, the calibration process will be skiped and the current and power
> +      measurement engine will not work. Temperature and voltage measurement
> +      will continue to work. The shunt value also need to respect:
> +      rshunt <= pga-gain * 40 * 1000 * 1000.
> +      If not, it's not possible to compute a valid calibration value.
> +    default: 1000
> +
> +  ti,pga-gain:
> +    description: |
> +      The gain value for the PGA function. This is 8, 4, 2 or 1.
> +      The PGA gain affect the shunt voltage range.
> +      The range will be equal to: pga-gain * 40mV
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +    default: 8
> +
> +  ti,bus-range-microvolt:
> +    description: |
> +      This is the operating range of the bus voltage in microvolt
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [16000000, 32000000]
> +    default: 32000000
> +
> +  ti,nfactor:
> +    description: |
> +      Array of three(TMP513) or two(TMP512) n-Factor value for each remote
> +      temperature channel.
> +      See datasheet Table 11 for n-Factor range list and value interpretation.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint8-array
> +      - minItems: 2
> +        maxItems: 3
> +        items:
> +          default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {

'make dt_binding_check' fails. You need #address-cells and #size-cells 
in here:

Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:20.17-30: Warning (reg_format): /example-0/i2c/tmp513@5c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:17.5-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:17.5-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:18.23-25.15: 
Warning (avoid_default_addr_size): /example-0/i2c/tmp513@5c: Relying on default #address-cells value
Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:18.23-25.15: Warning (avoid_default_addr_size): /example-0/i2c/tmp513@5c: Relying on default #size-cells value

> +        tmp513@5c {
> +            compatible = "ti,tmp513";
> +            reg = <0x5C>;
> +            shunt-resistor-micro-ohms = <330000>;
> +            ti,bus-range-microvolt = <32000000>;
> +            ti,pga-gain = <8>;
> +            ti,nfactor = [01 F3 00];
> +        };
> +    };
> -- 
> 2.17.1
> 
