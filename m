Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD21B3949;
	Thu,  2 Jan 2025 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845869; cv=none; b=Tv4oIfbyBbNc8h/w4T/uX3bW2Z7OVXddG9Ee9Uhg9SHFwjb1FKSTEkCreM7bDFsa15BPAfgmgqxd1zN09+SUCsSKWn3t0XqEJGDKHkiq00A+78Vk/VV56smW2CvIfEv78KoywzaxyIY4Uh/pUmACGNPskqSz0FiiBh9NsfZFPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845869; c=relaxed/simple;
	bh=Ez864lXQjB4pFQBnErnw1xElbeoHOIbIStMJ6TWIezw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bYxCJ6dzGfrqLDQ7J9+2/BN4cJZWSSDb0X+iLnLjQDQiB7GnYiEZZAgj3iC3M5IPWyIc60I5RKSnFFB4Ii7yuUTZR6CYHzuIjmWUqjh6yKlReKLymccos2k4HJ984PEEDYTpwYe0hWzIqyJCW1+vP6D58La0Iw+blpNa7VlkQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAukdNzS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAukdNzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397E4C4CED0;
	Thu,  2 Jan 2025 19:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735845868;
	bh=Ez864lXQjB4pFQBnErnw1xElbeoHOIbIStMJ6TWIezw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BAukdNzSs+Ox1H0ftuIrawJ22DnQ6h0sIYQSouDT44tgoP3SHUcRDW2mVAqSGeiIl
	 /l9rKpeIoyiA6kKRrtFFtxSj51tQsM1uHstLkJ5qu5lDz1WyVBB9uc4jLNxa2H7wxx
	 sbGEWCtUeGkRGF9hjTTXxWxzHJSary2H8QPRaAgymorZgPoeW6zTjDTO89yBdw/DAU
	 86g1tJZ719qDtljkt5uJU/LYydEw4g4jsk3bMK4G27ykcdo13qSLsohup4aY57PdBF
	 OwyTs0+r5d+qtcfvafXK3tUL8ZunSn0f7lrOh+MAhZcLeFxs8EpnMZ523dGAo7Wd3D
	 AsyvaE04cJ65Q==
Date: Thu, 02 Jan 2025 13:24:26 -0600
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 linux-kernel@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250102175041.822977-1-peter@korsgaard.com>
References: <20250102175041.822977-1-peter@korsgaard.com>
Message-Id: <173584586623.427850.4042944653628496064.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property


On Thu, 02 Jan 2025 18:50:40 +0100, Peter Korsgaard wrote:
> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
> always be desirable because of noise or power consumption peaks, so add an
> optional "default-pwm" property that can be used to specify a custom default
> PWM duty cycle.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml: default-pwm: missing type definition
Error: Documentation/devicetree/bindings/hwmon/pwm-fan.example.dts:75.25-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/hwmon/pwm-fan.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250102175041.822977-1-peter@korsgaard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

