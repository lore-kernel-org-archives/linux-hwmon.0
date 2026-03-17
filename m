Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8733D4E1
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 19:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777129; cv=none; b=Ev9eCRLRZ6WPyL3doG08arlwqaCJbvu204c6ASqVQO3AHP/ehKDldY58u43oAk0mNi2guJ18IMmUI7/uiAskhibn1bXFOM7Zi6lFk3gIMFm8PRp7XAVyflqQFHvQNNFpKzb4tS5yEup+BpQC/f4gD7rAlu4rZYDNRQJcaWZ2Ius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777129; c=relaxed/simple;
	bh=ogKC+c2UlJOTTNUwTjAN18d6KohDFlaYVIJyoaKGqYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/UfeVZ6tYRfgCunlaEvQvdKj0U1LblEc7x8nW52l78BVXSMl7SaImkjBbJCxCX5ivr8kdYuN0cWdNnJiLm78C5IYAJilFLEvsfFbRlIybuYHXpLcnPxSS/LaUVTSBbZkXVSUqum1Ya4kUkAX6gO6lD9lDq1gsQT6Z6sjtA2xIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMgPxxxO; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMgPxxxO"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2033579eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777126; x=1774381926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmUcttp3wBsYArrFOUjW9PH5NmkZe1nXWSW5R4bPR8I=;
        b=aMgPxxxO9Ki/pu+drSYDuzb6LHC1fhrNxB92MVlobMS2sxewoIOZY/zY7rFmRby4Vy
         CSd/+ZsvtMjqPFL7ExyGOE5CvGSxLwl1+3jAxo7ntuA+no3niWB6qlGCKVvnknNatSXL
         +jtB7+UofrT6lRHkRMVOEZqy24n7aDpQ1VsW2PZ7hFlhEDyqoN7PHFKF3iqd6MZTQEt+
         WFY5z/jhc8P2oEN9kFwMBawRySHYtF9U9BtLiHcSXm/qrWJUa655ye9gwtAot3LogIFY
         b446EoR5Nj/67eTLGGirmBN9uOYYf1KMvILYLtStXyZ1uxQVxsFnpp02wz2rPyRp6XCx
         xSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777126; x=1774381926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmUcttp3wBsYArrFOUjW9PH5NmkZe1nXWSW5R4bPR8I=;
        b=bDPZbQOAG23GVgq0L8tPH7nai83P2chYYDeNEZx6/0ibOAGkiHEkMOL0NAn4xQvoY2
         zWR/V5nkdtnIBp5NT1LK2VvBHsaKyTkrng7+atZ7nsw74lwlftW/G8ML1nNvl4JNT97u
         DVyLJWk4lSKBXPLELxgIcm4Z43Cph5XMeYe8asyUn1jHSk89z22SgA7DyRPr7ofK0Egv
         iTaUd2Ypo2je3YwdMt+G3/4BCX/sWOA+ppJOTcFtACA2LhJmPbn6ZkORT+a0xMm8WZ3q
         ZvtVcBawoRqr/7+UPCyqwJ9e6jLwqe3G+8AztoSekrSQkWHTKKwzdKEEFS0bEDBCMhot
         ulhw==
X-Forwarded-Encrypted: i=1; AJvYcCXfbaYHv2R/LsRnXxw5UorX8T187nLePwXq7QYvrvw/Qj7ZZmZP1wqVhZyeUtwLCA9oem9vWIbyJtCzKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFipcva41MZVlg4Pl9qZ0Ejv0FDHLVVg5h+o3ya6ixjczecuD
	1LspV0O0uxj9SeXH0K23gC+m4jLP6iXV3cE1Sn5EeEcbDUq8rJxCh74d
X-Gm-Gg: ATEYQzwJTaP/jTYen2DomTtW99c2xO6pWSs5fxHSRbCde8cddGhqcRr8V7o19ZcyQVN
	cZyQYATiXXDMOFV7CxblnlB26zjJy2JJ77XWkTHALJD3kcpsJ6z4W0he6XmWJ0SflhKl1kfXOCy
	KTD+4i8CYL3FhLovnD4BwaKpca1NXr5DIMYcL1sVgQRe9p0hpsup+qZHFdDD7bAsXkcBhaMmnbF
	3PceNwDYFnJE8cQtXoHMj+tCDF97vJpHNLmGcvPndH35obTvSoaTx8ozt68e8rJgIpd/8IX5ldy
	dQaDuBpKyOkSFogfjURYcZQanHlURev4nO8v5AQYcVQ5tNLLMk50RStj048jVornNqsIuFR3bGi
	1c97lZ/OC1LeABi3ygZLpGmpS0Htnv/VqtHw/8OdLw9CI4ge2wnpuKIR8czke3XNvt2YTqfsl1d
	iCYt0Mg3LP35+kgGqBDeTcd2jHiFJyk3iK7D2+
X-Received: by 2002:a05:7301:1285:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2c0e5074bd0mr328051eec.4.1773777125448;
        Tue, 17 Mar 2026 12:52:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582bdasm660352eec.19.2026.03.17.12.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:52:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 12:52:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
Message-ID: <d83026f9-62ea-4851-8188-5ce4150b6fcb@roeck-us.net>
References: <20260310-ina4230-v3-0-06ab3a77c570@flipper.net>
 <20260310-ina4230-v3-1-06ab3a77c570@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-ina4230-v3-1-06ab3a77c570@flipper.net>

On Tue, Mar 10, 2026 at 03:43:46PM +0400, Alexey Charkov wrote:
> Add TI INA4230, which is a 48V 4-channel 16-bit I2C-based
> current/voltage/power/energy monitor with alert function.
> 
> Link: https://www.ti.com/product/INA4230
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

AI review feedback inline. As far as I can see all are valid points
which will need to be addressed either in the bindings or in the driver.

Guenter

> ---
>  .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 134 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 140 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
> new file mode 100644
> index 000000000000..f33e52a12657
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,ina4230.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments INA4230 quad-channel power monitors
> +
> +maintainers:
> +  - Alexey Charkov <alchark@flipper.net>
> +
> +description: |
> +  The INA4230 is a 48V quad-channel 16-bit current, voltage, power and energy
> +  monitor with an I2C interface.
> +
> +  Datasheet:
> +    https://www.ti.com/product/INA4230
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ina4230
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    description: Required only if a child node is present.
> +    const: 1
> +
> +  "#size-cells":
> +    description: Required only if a child node is present.
> +    const: 0
> +
> +  vs-supply:
> +    description: phandle to the regulator that provides the VS supply typically
> +      in range from 1.7 V to 5.5 V.
> +
> +  ti,alert-polarity-active-high:
> +    description: Alert pin is asserted based on the value of Alert polarity Bit
> +      of the CONFIG2 register. Default value is 0, for which the alert pin
> +      toggles from high to low during faults. When this property is set, the
> +      corresponding register bit is set to 1, and the alert pin toggles from
> +      low to high during faults.
> +    $ref: /schemas/types.yaml#/definitions/flag

The property is defined here and read by the driver in a subsequent
patch, but the driver never uses the value to set the ALERT_POL bit
in the CONFIG2 register. This renders the property non-functional.

> +
> +patternProperties:
> +  "^input@[0-3]$":
> +    description: The node contains optional child nodes for four channels.
> +      Each child node describes the information of input source. Input channels
> +      default to enabled in the chip. Unless channels are explicitly disabled
> +      in device-tree, input channels will be enabled.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      reg:
> +        description: Must be 0, 1, 2 or 3, corresponding to the IN1, IN2, IN3
> +          or IN4 ports of the INA4230, respectively.
> +        enum: [ 0, 1, 2, 3 ]
> +
> +      label:
> +        description: name of the input source
> +
> +      shunt-resistor-micro-ohms:
> +        description: shunt resistor value in micro-Ohm
> +
> +      ti,maximum-expected-current-microamp:
> +        description: |
> +          This value indicates the maximum current in microamps that you can
> +          expect to measure with ina4230 in your circuit.
> +
> +          This value will be used to calculate the Current_LSB to maximize the
> +          available precision while ensuring your expected maximum current fits
> +          within the chip's ADC range. It will also enable built-in shunt gain
> +          to increase ADC granularity by a factor of 4 if the provided maximum
> +          current / shunt resistance combination does not produce more than
> +          20.48 mV drop at the shunt.
> +        minimum: 32768
> +        maximum: 4294967295
> +        default: 32768000

The binding allows values up to UINT32_MAX, but the driver rejects
values above INT_MAX. While 2147 Amperes is likely sufficient, the
mismatch should be resolved.

The driver also attempts to read a "ti,single-shot" property which is
missing from this binding file. Given it was present in the INA3221
bindings this driver is based on, its omission appears to be an
oversight.

Furthermore, the "vs-supply" property is defined in the bindings but
completely ignored by the driver (it does not acquire or enable the
regulator).
