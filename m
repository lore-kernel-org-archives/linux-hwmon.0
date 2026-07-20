Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10814B950;
	Mon, 20 Jul 2026 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784522282; cv=none; b=QUn2eoTZnkFfnragVcGXe4N3O4Q7hjrS+ex1Ld2di7LKdbCLgOGi6snkDNSf27iBYc+s1iuIoERbWRinhxFYw6oVx6+aY8PLE8ipGP1af26t1WcpYsAjrjo/YABH8HgrTDhbNFHOSmlkhCW3zDw8upStZrNtiOvbGuLXiUZSzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784522282; c=relaxed/simple;
	bh=uOUuS+oGb4aSiMqSzX7FYynu8+gACOx9QSFRTaVWkpc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=g00TO/zkzEwv073mQ64uukTU0lg88KxtDOMoWooFCvhSwLHsvdJ/t4HE480G9js3n8VeIlDmATiuIABtHG86PllPPEuiXt+deiFck6Z2J1rKa3XDapo9+NlkNj/ga+yj+OReINb9sWd2AJ1YHgkl5Dw9e5eHIOk8OttAOhbCu1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxFYF8Ep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxFYF8Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E711F000E9;
	Mon, 20 Jul 2026 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784522281;
	bh=n1+w148DLoBznFQAFfHbIAbduo1tmef/ATT6i1KyCg4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=fxFYF8Epw21B7Fdznpv0KRONQzZXklbqEejaOQTM9vGpTYhhRGvKyQv42ikzFIKRv
	 8GYnuy55iMSw+Kd/yXM0DlGa+JuMrIlwJ0HHZ+WZiJUvzXlgmB1kfbeizpVHZYYvOj
	 OY1wcA4IHMJEkFrt3vwIeT14OTYanlimok2QFOXnEVeevY40fbNJDmpcPw4mdM9p8D
	 //i9YHpKCo27srqx+fKlQm6cVkBPMLn5ThZEfJCa6B4zaX8Sg7rfVlZLglt2u7oUxw
	 cw90QjrNL8usY+ds5ig/re3Xl2jsQ2O7CsxEkkExS8i/KJqnE8h09sEEDk4PDFkRl6
	 qvbBuIP27HQFg==
Date: Sun, 19 Jul 2026 23:38:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
Message-Id: <178452227953.633015.14595979876746023545.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples


On Mon, 20 Jul 2026 11:14:42 +0800, Alexis Czezar Torreno wrote:
> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
> 
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
> 
> This patch also added missing entries in the examples.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,max20830.yaml           | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.example.dts:28.43-59 Unexpected 'GPIO_ACTIVE_HIGH'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1669: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

