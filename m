Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D2745CB;
	Wed, 24 Apr 2024 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996260; cv=none; b=oA6DdY6eW8nLG6v8M4M0YeFNfEHxKEXA+tNNrtV5sE0wW2eK4bS9mDUPbSaWsFRVoeSAqaXKsk14p+uyKz2viITSN+axJ9ZBm14NnBLPFmJsU5vHaEgr652SXQrBXWToMXQmWFx5mzXs69ZLqx541wv9lpTlsptraPeAgdbzlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996260; c=relaxed/simple;
	bh=GLd45Sl3GGYVUjal40tIwTY6rvVVbGulsWoE44E5lLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SolNA6I/gfcgB36jPywEloeXXKTLu7j0NyJK3Skic/ysiq/Tn73qd6o/Go77HbqhWru7786ZJJ39dRjZ4zKFQXMNhunyqK0YeU0GB6gClxeL1SINuQPWoYE9hGAtFo0MMO94OqZxnDgZ8LbkR0Kd8vEqSHCBDwQA7EHBwQn0sSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwhENoM2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwhENoM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331FBC113CD;
	Wed, 24 Apr 2024 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713996259;
	bh=GLd45Sl3GGYVUjal40tIwTY6rvVVbGulsWoE44E5lLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwhENoM2JjANMs6P+7syQrUW4mil9zwqwaOas4lOotTR+GGlTBvtdVEP/VDgcq7tc
	 O0S0DTviABeqAOW+8DrDpzFzLSCL8ChpZla/iyVaNS9kJaJ9BeV7Je/uoBBGJMR7KA
	 kcutUQPsu8R+NIsO/g+CG3YatQkL0zeuOvnRdY0EK7eKJ3BBhlcoL0zAHnNYQ0a4lY
	 jq9M8FIEnVlUwlii0xC97x6JODGTyKZl5IrUpQf0mdW/q+5UY/Nqb6ONAhsrk7XDnO
	 q+Dic6CFlpsIDSyV1KH2kfEoUn85hUZkFPH7kMO+CoUc+CLby2Xi+cKexDxlU/k7Hq
	 Wn/wpEIjoKBaw==
Date: Wed, 24 Apr 2024 17:04:17 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document target-pwm
 property
Message-ID: <20240424220417.GA782554-robh@kernel.org>
References: <20240424090453.2292185-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424090453.2292185-1-peter@korsgaard.com>

On Wed, Apr 24, 2024 at 11:04:52AM +0200, Peter Korsgaard wrote:
> Similar to target-rpm from fan-common.yaml but for the PWM setting
> (0..255).

IIRC, we have a map of RPMs to PWM duty cycle, so why can't you 
use that plus target-rpm?

Anything new for existing fan bindings should ideally use what 
fan-common.yaml defined or be added to it.

> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 4e5abf7580cc..58513ff732af 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -46,6 +46,14 @@ properties:
>  
>    "#cooling-cells": true
>  
> +  target-pwm:
> +    description:
> +      The default desired fan PWM.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 255
> +
>  required:
>    - compatible
>    - pwms
> -- 
> 2.39.2
> 
