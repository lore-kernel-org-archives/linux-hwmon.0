Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0K8nYBM"
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5241CD4D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Nov 2023 12:00:52 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-da7238b3eb4so1270401276.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Nov 2023 12:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700164851; x=1700769651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lXbOlXF1QNzcN1gSs/NymLA16UFf6B9dhOSDwPoXA0=;
        b=b0K8nYBM5r1QbnUGV1+rzFApyItK6PAysr1878vkNCTLB/MusEdtzH/n69Ik1k3G1v
         drlVfwYw1WkBSlWAT6jK4sK/pTThSIoxnhSI5JCwBZFV9q4pPlBQMEgF9dGY7bM1m681
         c83m9Y3zETBcNAKrLJrV7DtqWb8EKiV/CGstr3E5rdKIEgDx6mMf5z+YITpB6NdiOjHh
         sw5ne87+JFvpZhvSUfMfBmCT7t/hrQ3UXwcJpEcPnEPWNui0L2jh+JlFR0Gt9RfRmSOW
         3QEn+9EaxtGUk7Xo2XUuYGJavejHs7lYG1OiXQtSA5EjjbHQNtINyTVlWAzfazTA8oFR
         FNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700164851; x=1700769651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lXbOlXF1QNzcN1gSs/NymLA16UFf6B9dhOSDwPoXA0=;
        b=r1K/UUBY6Vjm6HAlpZceTTQ6KejonmkwC4lrP30tou+wz9BqKoIRNQJS/ws86sb4Vk
         uRk/JkhPYMhpU2InOliO2b7wLOxaceF19eueC3lBv8aCteP2QJhyLOuue3cl6ZbEFbRk
         Am3fFaW3GsJN4R04k1+J4nHWkci9/hc5oZeBnIjHhH7UPwHD9VOXmesWI8IplusXJeWH
         STQ6e7WPXhqhxHS1upetPlHzD8rdDZmH/dGh28/Mk/V2/+KiuH2MfYLb4Qc22Vd4m7n4
         EFo6s64d1RUSL9Wi3fgDXx//ck+S1d+jqK6CC5XWy2ZLYzInLoHguGQSGdY34e75jWZS
         pg7A==
X-Gm-Message-State: AOJu0YyqufbpzhSIHdA+DVgGp3fDBMhjMuxsCNb84iEQshlORrEWv7fq
	mejdGJ1H+AIWYf6s2+5hq3BOKus5d3ZMVXlMFgE=
X-Google-Smtp-Source: AGHT+IE8T41Zu2qD4rFlw0Gc7ioegv2Y93P/ZCWaBAVvxaBHkoadMHnJNx+FYc92v0e6FHqYav2liQ==
X-Received: by 2002:a25:ac82:0:b0:d9a:6855:14cd with SMTP id x2-20020a25ac82000000b00d9a685514cdmr17540572ybi.39.1700164851398;
        Thu, 16 Nov 2023 12:00:51 -0800 (PST)
Received: from [10.44.189.251] ([12.161.6.169])
        by smtp.gmail.com with ESMTPSA id p204-20020a2542d5000000b00d9a3fe483cfsm43772yba.23.2023.11.16.12.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 12:00:51 -0800 (PST)
Message-ID: <9d0749ee-08e5-4630-b1b4-27d6aa436b29@linaro.org>
Date: Thu, 16 Nov 2023 21:00:50 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: adding support for PAC193X
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: marius.cristea@microchip.com, jic23@kernel.org, lars@metafoo.de,
 robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231115134453.6656-1-marius.cristea@microchip.com>
 <20231115134453.6656-2-marius.cristea@microchip.com>
 <fedd4bcf-7892-4096-bcca-7ea72d39576f@linaro.org>
 <20231116-channel-variety-cc7c262924ad@squawk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231116-channel-variety-cc7c262924ad@squawk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2023 19:21, Conor Dooley wrote:

>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: interrupts
>>
>>
>> I don't understand what do you want to say here. I am also 100% sure you
>> did not test it on a real case (maybe example passes but nothing more).
> 
> As far as I understand, the same pin on the device is used for both an
> output or an input depending on the configuration. As an input, it is
> the "slow-io" control, and as an output it is an interrupt.
> I think Marius is trying to convey that either this pin can be in
> exclusively one state or another.
> 
> _However_ I am not sure that that is really the right thing to do - they
> might well be mutually exclusive modes, but I think the decision can be
> made at runtime, rather than at devicetree creation time. Say for
> example the GPIO controller this is connected to is capable of acting as
> an interrupt controller. Unless I am misunderstanding the runtime
> configurability of this hardware, I think it is possible to actually
> provide a "slow-io-gpios" and an interrupt property & let the operating
> system decide at runtime which mode it wants to work in.
> 
> I'm off travelling at the moment Marius, but I should be back in work on
> Monday if you want to have a chat about it & explain a bit more to me?

Sure, but which compatible contains "interrupts"?

Best regards,
Krzysztof

