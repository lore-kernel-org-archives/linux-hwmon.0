Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963031E868;
	Tue,  5 Nov 2024 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730769635; cv=none; b=iGeuVE07HjqYPIOcI8q92hmEz8kFHulf46L96j4zqFC1IAYJjZaNn14EOo5OwP5C2bF5YcczP3+qBusmEACFkZOYsyjELFV1nJem7QvuU0C+9DjbGiRrP7nI+gnO0k1J4U5VcjJU1rTiKfpS24130VhhKQO60xk08Hbw6t8QE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730769635; c=relaxed/simple;
	bh=nenMwDmWIIm+I99QWRakkC02tC3Hp/vMcoORcgVUC94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KM7bJKWGhfJuFyxprrHqcwDDKnidR7GK7I+91CaxriOMxFlCSRKXdGOQrn1JVXuPpDh+DfWnouiVlFpeBlGEUc5eNwD6+25vNjMXsz6UJCLBHOAmBmp1udRHIyfhFdicedHarshj8gIO7mrlPpITcLmM36tV6fbVhzu4EHppB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BebHKhzK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BebHKhzK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720be27db74so3232314b3a.1;
        Mon, 04 Nov 2024 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730769633; x=1731374433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tgScZ6+i/F01wG9zoTCYsq7mic+YlorR53TCfs5RJjs=;
        b=BebHKhzKKbR5Li9c3SdUZdKogXQGAf1/x91tlLAZPn57PWwGhCgqQu7r+lK63qndCQ
         tg30PuVSL1FiTNMdaF3nh/dIXRZy79H3gcduTJPcuBpnAcmlVPpWQEjWuNMpM12gY23P
         iicpYMEPhv9MSSiKKg2tA+K3xy854/q4CXJ9mb5ilQVUB6Jiokphs0R6hN+yT9ckYDXW
         GCbE5+UQXfQEGjun2cn60XwviEzAgoAgm/yXKjL+4y97CLbyYxBDGNeq+T1ccPPqG9ZW
         WY3IJ6IwXfjbcRiEK8l0eUBihHsbhBsjyVHlrwNbHpRyyHTfCNImGYMovd+LELCqEDQJ
         /ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730769633; x=1731374433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgScZ6+i/F01wG9zoTCYsq7mic+YlorR53TCfs5RJjs=;
        b=ClpzqtsjZYNSBUEN2azaO0F9h0BaRTTe4tOX4fboV0t+3DIeLQhonaiftcM+IS4WFg
         uO2XTbGFv0JN5gZXGD80qAWS2dh6tZQ1enlzLs0UYa9P/SXVwdcO0/UF+pFia1rE1/vG
         k8+hswnEwKG57IiP54hVnDtE1rM3b571URixSG+PamhcjzORWes7G7rXgYvPdZ3Dx8yW
         l6heXqR7LjCHTQ8KtEwIcQah282Q6bXlMfWY/BysQa3trWduzz+o+YjXLVYDmSg3qdVv
         s3Q2fMG6Pl5yZRmN941OKCkHguIDmacMf8oD2q6kueI9mv4pnP+FzvF/U/sEIH212N8B
         oVLg==
X-Forwarded-Encrypted: i=1; AJvYcCU2TQ6R5OrzokXttzlkwld0o3LQmJAwxhIqbKOMEmQnQ2pF80x7Sk/Ye5wKY9GsNgeuokCbon9LJVoW@vger.kernel.org, AJvYcCUUd2TyNFAUqatobJ6i8YTN+KxIZpwhyHRanLyAV2D0ZK0T92AJclHUghOT0An21bTNj374fHXgfIpZ9Cg=@vger.kernel.org, AJvYcCXg2tHsRfb/unqCY5yVIfAsy66YersfMAKULdSNpeE5V73bskcgT3t5VTZLABM/c3VIOYdry1asqE4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvrthu2zPGBRE0O4runq4KNQKB1wVqnnp4PRvUlrvWXC0rXPrG
	44RRz1RgEIdajXzznr8O7Jjxo+yKQ1pgkHk5hCgxrW1wV5YfoBIA
X-Google-Smtp-Source: AGHT+IHcGYdGivpPn1BZtL0V3PszMJFdsqOb0aFSyJniTXW5GT26Ty9wOKTVkFN9dHTc6jk7iUajwA==
X-Received: by 2002:a05:6a00:2e0f:b0:71e:6a57:7288 with SMTP id d2e1a72fcca58-720bcb1ae5fmr25736027b3a.5.1730769632687;
        Mon, 04 Nov 2024 17:20:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b9ceasm8179677b3a.28.2024.11.04.17.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 17:20:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net>
Date: Mon, 4 Nov 2024 17:20:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
To: Rob Herring <robh@kernel.org>, Grant Peltier <grantpeltier93@gmail.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
 <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/4/24 07:08, Rob Herring wrote:
> On Wed, Oct 30, 2024 at 5:41 PM Grant Peltier <grantpeltier93@gmail.com> wrote:
>>
>> Add devicetree bindings to support declaring optional voltage dividers to
>> the rail outputs of supported digital multiphase regulators. Some
>> applications require Vout to exceed the voltage range that the Vsense pin
>> can detect. This binding definition allows users to define the
>> characteristics of a voltage divider placed between Vout and the Vsense
>> pin for any rail powered by the device.
>>
>> These bindings copy the vout-voltage-divider property defined in the
>> maxim,max20730 bindings schema since it is the best fit for the use case
>> of scaling hwmon PMBus telemetry. The generic voltage-divider property
>> used by many iio drivers was determined to be a poor fit because that
>> schema is tied directly to iio for the purpose of scaling io-channel
>> voltages and the isl68137 driver is not an iio driver.
>>
>> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
>> ---
>>   .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
>>   1 file changed, 147 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>> new file mode 100644
>> index 000000000000..ed659c2baadf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>> @@ -0,0 +1,147 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
>> +
>> +maintainers:
>> +  - Grant Peltier <grant.peltier.jg@renesas.com>
>> +
>> +description: |
>> +  Renesas digital multiphase voltage regulators with PMBus.
>> +  https://www.renesas.com/en/products/power-management/multiphase-power/multiphase-dcdc-switching-controllers
>> +
>> +properties:
>> +  compatible:
>> +    enum:
> 
> Somehow "isl68137" is missing from your list. "make
> dt_compatible_check" reports it as not documented.
> 

Turns out it is also documented as "isil,isl68137" in trivial-devices.yaml
(together with isil,isl69260). Both are referenced in .dts files. How should
that be handled ?

Thanks,
Guenter

>> +      - renesas,isl68220
>> +      - renesas,isl68221
>> +      - renesas,isl68222
>> +      - renesas,isl68223
>> +      - renesas,isl68224
>> +      - renesas,isl68225
>> +      - renesas,isl68226
>> +      - renesas,isl68227
>> +      - renesas,isl68229
>> +      - renesas,isl68233
>> +      - renesas,isl68239
>> +      - renesas,isl69222
>> +      - renesas,isl69223
>> +      - renesas,isl69224
>> +      - renesas,isl69225
>> +      - renesas,isl69227
>> +      - renesas,isl69228
>> +      - renesas,isl69234
>> +      - renesas,isl69236
>> +      - renesas,isl69239
>> +      - renesas,isl69242
>> +      - renesas,isl69243
>> +      - renesas,isl69247
>> +      - renesas,isl69248
>> +      - renesas,isl69254
>> +      - renesas,isl69255
>> +      - renesas,isl69256
>> +      - renesas,isl69259
>> +      - renesas,isl69260
>> +      - renesas,isl69268
>> +      - renesas,isl69269
>> +      - renesas,isl69298
>> +      - renesas,raa228000
>> +      - renesas,raa228004
>> +      - renesas,raa228006
>> +      - renesas,raa228228
>> +      - renesas,raa229001
>> +      - renesas,raa229004

