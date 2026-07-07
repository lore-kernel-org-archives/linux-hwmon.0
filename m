Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2C3A8723;
	Tue,  7 Jul 2026 06:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406315; cv=none; b=vBmxWNCwbB8oXIqjp3hMu6xPyE99Zz8SI+usOqg18rCj8aM68hwHpURsBzuHikN24HSMuny9xQQd1TkLLfbxJdcVeeDnGvYIJDUVNvgzhP2eRnZhJhGw5arooLVY6v0bzxZGtoi9ktLYw28kD5Zd7l/6MB+IplsSdMv1H2v3fr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406315; c=relaxed/simple;
	bh=+eLTE0jIRos+KiQnLItl8Nd/+iIjESwlIm7Y8amgD8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im3yubsbTm5pKwWRmjYSJnx71xuj/fvgjl+/BL+AUYPfbvzz+ICZsS/hffPeRVU2OcEo625yxapqaOCXdo2nXffKO7GQQBRlNIYfQ9OjM6AJ750Xo3HNTNd5GS3ff7pbsjUNJsdMyTqVSaFb8C4NNr/g+I+kOAS7CZQkSPCO178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cttVkvjt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cttVkvjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497F31F000E9;
	Tue,  7 Jul 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783406314;
	bh=geu9NP3g+YF1JBxdLfVCOrN8abIfLh/AFGaevKQYnEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cttVkvjtqtNal0gM0IyWxCESRMqct0PH3xv5GLBqLqPvoY3dXwhrocbRKEsIKlUqp
	 WTPiD8vSg0Vf6aEJbO52YICkU37QkkW2X21ijVV6knWGm0dqMDOIIiJt6/QlgIsG8q
	 f8NpsqIw2h8HXPdtfg0GDeHIOZVK+pNkgZnwYidJRB6mE+5GiZy7gUbcZAhMs+IsrH
	 g6aEcW/xhZOwWNzsr0DJ2zWCa6liZPpwjsYeCeiNIzUKROTjwuAThDmXhHbFZ+fE7Q
	 IfjI+zyx83spO7lRs1K3cIdQcelbFpXzq2fZ8D7SL4lk2eYKf9R3lZdpu1OanF22j7
	 EpHi4xrpgY5Zw==
Date: Tue, 7 Jul 2026 08:38:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com, 
	priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Message-ID: <20260707-armored-azure-terrier-4dc3d3@quoll>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>

On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
> sensor provider by adding the '#thermal-sensor-cells' property.
> 
> This allows the EC temperature sensors to be referenced from thermal
> zones in the device tree.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> index c87ccb5b3086..0d049979e35b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> @@ -26,10 +26,14 @@ properties:
>  
>    wakeup-source: true
>  
> +  "#thermal-sensor-cells":
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> +  - "#thermal-sensor-cells"

This looks like ABI break without explanation.

Best regards,
Krzysztof

