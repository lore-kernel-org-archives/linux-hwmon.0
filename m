Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1DF823DD;
	Mon, 20 Jul 2026 04:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784522283; cv=none; b=cSMg4lpqMl7On6SUPGwlyJHqvijv9gl3BE6YQXiDhto4dNlAC0Kl/74r6PuBU6X896EFxM1Ja+ppr2t7Kf1UzNVUTu2nE/S2qw794e4FlE9pk93JYCpEuD3zd7uj0fe2CTUrruv0OqZU6niD7c6pOOVytChNm5bpKWR10eBvuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784522283; c=relaxed/simple;
	bh=vTqLWWVhWFGfa3a6zMteLMGvVEDnCf82GqjXk/IWIv0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jKwk4aoxAh1H3WyuhYL92r9E+n2f2o6VaM/FSP5NHNOnFmLJ5REmjNQgSMFN58XONIlYTJiV/RuMeDBibsXxJcJnqCIETZQOqb9egFoBd2jYFG3ecgCEE2AvDMr6x8HrN4LOhzwJYJa0eNegZ9UIKloqx1XwN1HZiZgIR70xFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCqpOZ8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCqpOZ8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162591F00A3A;
	Mon, 20 Jul 2026 04:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784522282;
	bh=1/RVtsH14Lla7LTnwEuXTRDHP7iYsekMa7L97hM/fu0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MCqpOZ8gmBykNz4bu6tJqJoM7shJbD4qKF48d4ECoTyUnGxkdvr6F8yIAuuPhQNXY
	 J9ujJXC3iOPLhYXNyxvZEyiLQ9XnBTmZ0kii/VI2x66RvhrQnEaJxtY9OSaxv2suXC
	 yK+tw2UbcuqN80NFHX/D06lO1Iq17Th3TiPNyLLaAZrc+WZ//6mPFl7bnFdCJHF7IO
	 LZCbpzqAOQd/sn/akyZ9cUTqDC/KVikQpN0ly8mSOxGjFoYglTI9iVvxIxjDDyp9sB
	 jAnG4IfNDgwOwHow5y44zaD0rQBBlcMhkDzAUuCRbKNk8h18Yj77PoHfW9mrEt5BzX
	 n4HJ7V3z/LGwg==
Date: Sun, 19 Jul 2026 23:38:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-doc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
In-Reply-To: <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
Message-Id: <178452228056.633061.10207793991910713290.robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support


On Mon, 20 Jul 2026 11:14:44 +0800, Alexis Czezar Torreno wrote:
> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

