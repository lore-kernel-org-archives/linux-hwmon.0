Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273801BFE06;
	Mon,  4 Nov 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730732918; cv=none; b=h0gPI9b8OD0nKPSVPrjflbc0rjcIkhYrVxPd+enpX3HW+OZWf1aB0xZjyKYwvobiPAwugtAFle/+iuJkDblilyvzmY/4MFNlJ7TvJuUUinsXjc0VpksUYZJt3HlgaskSoMl3ItXOrlZ277T29ibNyRrm/gmBgCAt8ooPCL5dh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730732918; c=relaxed/simple;
	bh=aCcYfdU0Q+jbJmWBtJhf1SBpQ++QF9TaBJeYMGrxrKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELWQFNbwxFwP3BP+C7m8rHH72PAgBuJzzx1ebQLK/GOqAXrHJjXf3IjKNbAWedTk/uJLrOhvL+ZcE5znzxM5rWaLNzYwoLBcrBxls8oTykPfp1x8LOUdBmFOqBw70Oc6MfCBI9IONYuekWYBnHtsS4HsxMdOxgSsh/hhUSNjFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyy1QO/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyy1QO/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB60C4CED5;
	Mon,  4 Nov 2024 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730732917;
	bh=aCcYfdU0Q+jbJmWBtJhf1SBpQ++QF9TaBJeYMGrxrKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oyy1QO/JnB5WGVdEuMNweuk20cDyY2GhqSj7mUcCIRZTK9umCV1CD91xOFBc3fOg4
	 O/Vl/EIb8FFK5KTnIsO4mycVc6R5gsR5dIQAHrnJaeQfajYHRu9ACkOY7rgiWez676
	 mk3z7JwJ3mT7kvUCWm00JmRCgbg9JbPI2iMAWiOhJ+8bXJjbuBhExdwjyZ7kDyYtzk
	 6/SjFDhc1DRaCWE3YBniXeRhWP5sYVmGW8uyp7CYXxafbED0q0xaH0QTgXGd4oUu/t
	 SyRHl08MiYIVObwoG/UfMFBFf5AhF6akLvGveu9bUP/xiFza8NLfjHe3gIcy7ll+ls
	 yM4TQM1YcAH+w==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso3718134276.3;
        Mon, 04 Nov 2024 07:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvLPC/LE3wO28Z//SathiqdwcUpRbQuRIhgKGvhqaLvteWhpFOwri8fcCxpzfnNssA6zyt/qITYML2@vger.kernel.org, AJvYcCWKVysyQjEVapZkkMhKbDhLYdZgY7rP0Yt/6srJQmGFf5GKu6qbE8XGrIPjUUWnXlTLR1YJmWngj20K@vger.kernel.org, AJvYcCXpKlgICfZcG7PAeYU9hLy2b2tsCr4k5fWy7EYJCNdGtT22uLXl3mQcjYMwCtzI+um85KqwyG5TnTimp8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb6tGnnV6wh4E2raIL3y5fqVV/AP5K6awdWvmnk47RIhPHYadD
	HY1XQ0+jNqe1Bb5otjGVBj2ebRCrbjkJy/aA8d+gdrtAjgFSxh2RCJo2JKq9GjoSsDWdSrzj928
	DghfQIJEp5lMvimOXHTRVXs5kZQ==
X-Google-Smtp-Source: AGHT+IF4ODCVM5LJpqXkmxMdu5G3rUJur0n+5iNYKMlkY8DKa8KLzX/GaIwsSP1M3kVSAtulHsZ85uuLiDf724+J+Wo=
X-Received: by 2002:a05:690c:61ca:b0:6e3:252c:408 with SMTP id
 00721157ae682-6ea523cb2c8mr157949527b3.20.1730732916661; Mon, 04 Nov 2024
 07:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730326915.git.grantpeltier93@gmail.com> <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
In-Reply-To: <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 09:08:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
Message-ID: <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com, 
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 5:41=E2=80=AFPM Grant Peltier <grantpeltier93@gmail=
.com> wrote:
>
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
>
> These bindings copy the vout-voltage-divider property defined in the
> maxim,max20730 bindings schema since it is the best fit for the use case
> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> used by many iio drivers was determined to be a poor fit because that
> schema is tied directly to iio for the purpose of scaling io-channel
> voltages and the isl68137 driver is not an iio driver.
>
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas=
,isl68137.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl681=
37.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.ya=
ml
> new file mode 100644
> index 000000000000..ed659c2baadf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
> +
> +maintainers:
> +  - Grant Peltier <grant.peltier.jg@renesas.com>
> +
> +description: |
> +  Renesas digital multiphase voltage regulators with PMBus.
> +  https://www.renesas.com/en/products/power-management/multiphase-power/=
multiphase-dcdc-switching-controllers
> +
> +properties:
> +  compatible:
> +    enum:

Somehow "isl68137" is missing from your list. "make
dt_compatible_check" reports it as not documented.

> +      - renesas,isl68220
> +      - renesas,isl68221
> +      - renesas,isl68222
> +      - renesas,isl68223
> +      - renesas,isl68224
> +      - renesas,isl68225
> +      - renesas,isl68226
> +      - renesas,isl68227
> +      - renesas,isl68229
> +      - renesas,isl68233
> +      - renesas,isl68239
> +      - renesas,isl69222
> +      - renesas,isl69223
> +      - renesas,isl69224
> +      - renesas,isl69225
> +      - renesas,isl69227
> +      - renesas,isl69228
> +      - renesas,isl69234
> +      - renesas,isl69236
> +      - renesas,isl69239
> +      - renesas,isl69242
> +      - renesas,isl69243
> +      - renesas,isl69247
> +      - renesas,isl69248
> +      - renesas,isl69254
> +      - renesas,isl69255
> +      - renesas,isl69256
> +      - renesas,isl69259
> +      - renesas,isl69260
> +      - renesas,isl69268
> +      - renesas,isl69269
> +      - renesas,isl69298
> +      - renesas,raa228000
> +      - renesas,raa228004
> +      - renesas,raa228006
> +      - renesas,raa228228
> +      - renesas,raa229001
> +      - renesas,raa229004
