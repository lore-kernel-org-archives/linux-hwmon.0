Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B835AC00;
	Wed, 24 Jun 2026 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287153; cv=none; b=Xyw7Qq9kaAVGoeQ5Kv8ZPfvL/nD0F777Jd0LsQES2ZteIQ+u73/A0KiznhQxRHvn5SY594p2OywtA0xJ1AaJYUg3fyF0BGzb0MlAzchrrtBilJYwm0dV6sqOZfIBeMd/em03JsyOvEdV/tvJaDz+uz/x4prEc9m2wepq3E+91fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287153; c=relaxed/simple;
	bh=BrbedXJHRR9d7DDBgaqgW8fb+xYqeJc5Ux5AiNpR3Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHX1f921xXnECJdGza/efnu+dJmz/xfZnbH/t0pajBR02gD0RXoF6EFccyN7GCIy8SvaY4CUDVqbN/WVnUKFaifrSWS8bwUQB0gU9xkwIonmUaNPdLbP7dzcE3oT9smZplLgehyFRZRDROUxY78B/A/TKsnsfvdCmpTxCuFiNN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgpVhfux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgpVhfux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188EE1F000E9;
	Wed, 24 Jun 2026 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287151;
	bh=nDEb+Mv3gmqnAXQiwkmb7huT4lhyBqYVAxZcicXAf4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lgpVhfuxLqVO5uoodDr3tkOYsC2EaqDkwDIJJ99It+CmAUM8FR3KC/zXWxN6TBt3l
	 EdTjRntqpXHdqSBq70BicyZg1y5GXfKajicFTUUG8juQitarX/NFT9wZjczZbkgarB
	 +e9cFTU5wIrFgX3FBYdMRS8Sv5gTkOYBoFiju49k3A0jI2FxozlUWWC9gMCGPD123h
	 rPI1kRHhCjrK0mPo3FYFf/LExYJ5eoFYPqveqdBNQX3JnKm3/Ki7U2egRogD9HdyxB
	 wya+7/TsxSaiL2Yvhg3gucT5lVzkvm+qmB8tvuMw1m2MYvKsb6TLQStJoOL0N/rI3F
	 1L3SfH/h8F5pA==
Date: Wed, 24 Jun 2026 09:45:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Message-ID: <20260624-quantum-cormorant-of-beauty-0b1aa8@quoll>
References: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
 <20260623192217.4804-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623192217.4804-1-flaviu.nistor@gmail.com>

On Tue, Jun 23, 2026 at 10:22:17PM +0300, Flaviu Nistor wrote:
> On 6/23/26 9:58 PM CET, Guenter Roeck wrote:
> >On 6/23/26 11:16, Flaviu Nistor wrote:
> >> On Mon Jun 22, 2026 at 7:29 PM CEST, Javier Carrasco wrote:
> >>> On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
> >>>> Add support for an optional label property similar to other hwmon devices
> >>>> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> >>>> distinct names to each instance.
> >>>>
> >>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> >>>> ---
> >>>>   .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
> >>>>   1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
> >>> ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> >>>> index 17351fdbefce..f00b5a4b14dd 100644
> >>>> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> >>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> >>>> @@ -33,6 +33,10 @@ properties:
> >>>>     reg:
> >>>>       maxItems: 1
> >>>>
> >>>> +  label:
> >>>> +    description:
> >>>> +      A descriptive name for this channel, like "ambient" or "psu".
> >>>> +
> >>>>     interrupts:
> >>>>       items:
> >>>>         - description: measurement ready indicator
> >>>> @@ -72,6 +76,7 @@ examples:
> >>>>                            <5 IRQ_TYPE_EDGE_RISING>,
> >>>>                            <6 IRQ_TYPE_EDGE_RISING>;
> >>>>               interrupt-names =3D "ready", "low", "high";
> >>>> +            label =3D "somelabel";
> >>>>               vdd-supply =3D <&reg_vdd>;
> >>>>           };
> >>>       };
> >>>
> >>> Hello Falviu, thank you for your patch.
> >>>
> >>
> >> Hello Javier, thanks for your reply.
> >>
> >>> Should we not add a reference to hwmon-common.yaml (with
> >>> unevelautedProperties instead of additionalProperties), as label is
> >>> defined there? I believe that Krzysztof Kozlowski did something similar
> >>> for the shunt-resistor-micro-ohms property. Could we follow suit here?
> >>>
> >>
> >> This is a good question and I am happy you asked. I also thought a lot
> >> about this and the reason I decided to go for this approach is that by using
> >> $ref: hwmon-common.yaml#, I would have to change additionalProperties: false
> >> to unevaluatedProperties: false, which will evaluate in case it is used, also
> >> shunt-resistor-micro-ohms property which does not apply to this sensor. At
> >> least this is my understanding, but of course I can be wrong (I see lm75 binding
> >> also uses $ref: hwmon-common.yaml# but shunt-resistor-micro-ohms does not apply).
> >>
> >
> >Where does the idea come from that shunt-resistor-micro-ohms would be mandatory ?
> >That would make hwmon-common.yaml unusable for most chips.
> 
> I think this is a misunderstanding since I never had the intention to imply that
> shunt-resistor-micro-ohms would be mandatory, but rather I observed that if I used
> $ref: hwmon-common.yaml#, property shunt-resistor-micro-ohms can be added (no need to,
> but still possible) in the example section and the dt_binding_check will pass.
> Since hwmon-common.yaml is already there I will change the binding in a v2 and use it.

I propose to reference hwmon-common.yaml with:
label: true
additionalProperties: false

thus shunt-resistor won't be allowed but you still will reference common
schema for the definition of common properties.


Best regards,
Krzysztof

