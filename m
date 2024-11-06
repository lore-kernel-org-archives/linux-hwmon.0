Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE942AF07;
	Wed,  6 Nov 2024 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863995; cv=none; b=H0l9Ra6Ydh+cAAw/lqZPBUr3rnWrIiKA+PcUVqotN7kthvg+G7Dfr3XWApPayNdsNrAz8u7ytS2aqpU0V6jFfVbDjqJJHX0J8mdTS5wBN1JgYJAugBt9249EuA+zo8gf7fY7xec09NFPlfjvJWDNiJdrfyMiuoF0t0dlr2nooaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863995; c=relaxed/simple;
	bh=tWktqXNQ+vNgULrJsWKLMQw1pwblEP4vkR0gMo0sv4k=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TyONHmgdgGKLTYEhYiNBoOoOlGlVNkUp83Kbj/h9poFMGfsuLJnlLdvRR+8KTpoM/AbCBkPx0UYu/mTOuUp/bxSj1qfwBN7oHPVICwZ+N1yXCtwApdTyTl3+9cPYxQBJnA8IaY7wWXsKR7xiXP0XnkdjDhk3pQonhfsQ5gM+q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsStC9r/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsStC9r/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41E9C4CECF;
	Wed,  6 Nov 2024 03:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730863995;
	bh=tWktqXNQ+vNgULrJsWKLMQw1pwblEP4vkR0gMo0sv4k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FsStC9r/cSc3F3P6mBzR2oBI5E4vYiqNoGuZPgapZxcI3ijF9hrCGDoBnIrPCNj7N
	 W574nfEhXQQr2n2WzQWcEWSf8mqPVOkAk3y03XolUSYuLHnCdIzP8d/IBpXKKeMa4A
	 j1rypdp32CbzS4L5QqmetMDWVFBs4D97BLVFZoDi1TRw7EsGNsoa2wgkmvXNN8wg44
	 2jcuXmqHSHM2GF81gwZrC/25jbUnOGqf7pZnI6DZjHnDI6R28VA10DV9Xoq1zF+Awx
	 xlyztuCCWigW087QNqNCbBz01ibbDZHubbb7dWepcxIs1Hf7GgnF54F2TEUvDPok7S
	 UfYpIkHmaQGIQ==
Date: Tue, 05 Nov 2024 21:33:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20241106021559.175105-1-marex@denx.de>
References: <20241106021559.175105-1-marex@denx.de>
Message-Id: <173086399290.1351531.6915497131046060876.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pwm-fan: Document start
 from stopped state properties


On Wed, 06 Nov 2024 03:14:36 +0100, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a stopped state, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
> 
> Document two new DT properties, "fan-stop-to-start-percent" and
> "fan-stop-to-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from stopped state. This
> value can be found in the fan datasheet and can be converted to PWM
> duty cycle easily. The "fan-stop-to-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to stopped state
> start RPM for the fan to surely spin up.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> ---
> V2: - Rename fan-dead-stop-start-percent to fan-stop-to-start-percent
>     - Rename fan-dead-stop-start-usec to fan-stop-to-start-us
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml: properties:fan-stop-to-start-us: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241106021559.175105-1-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

