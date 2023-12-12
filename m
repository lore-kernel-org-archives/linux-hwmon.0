Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoMV6xwm"
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E03183;
	Tue, 12 Dec 2023 09:59:27 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6d9e9b72ecfso3302653a34.3;
        Tue, 12 Dec 2023 09:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702403966; x=1703008766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NFYtcG0yMvxHxU67vKn04W5+boPhDMgerwN3/npVGR8=;
        b=AoMV6xwmNsaygfV7q3paL2ZUbemmue2Ya6ymLd/w/v5jNAzRM0/HWpkBgKkniFtveZ
         8JE9zyrRNJpmNAwp9OVGKqldAujMTsSeIOLKZdTSLBgfLlrQckMdttBmb3XnS4tQVRGy
         IiFap444d0V0W01W1YT4XuT99sMlN8nd3f5wuUjk/NsjfdXTbTOe1BeHfuEu+9EePj83
         GoK8K/rURHsPeCCT+bcujMnssZ1NO8SlYZ520OMcVkTEUpXPWvGIL1NbhPZgTUn9xVBa
         wWKKLATcRRhgXj2R/hJLOJuDpEwniIwVzgHKHjSiJZM6DiUHYpnN+vT/V1f0dHR0n7kZ
         MNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702403966; x=1703008766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFYtcG0yMvxHxU67vKn04W5+boPhDMgerwN3/npVGR8=;
        b=NKAE90ggaxMl34gaQp0gpPkG2yqoGcSHlhFcHpVhTgyO1stMLo1qopYQxgpkmk2BqK
         mjOnrJOfnAjwae8ev1WiJrhIBQK8kAcmHnBVrbqBuoXLWCOCVrTtYtp4Ougl879KOaSv
         A/SxRPbyjUkc04xnm9sg39Wmd/gr2DTx4ZwsNSkTn3LhRuzkh2ZL2OHKbhYvqdHvzQtP
         hgbmxE3Om++mHqA+UT5wik3T/acG5M7fTofhTGJnMCQJszhpx1xT1d3EX/8mma5Yr4I7
         DkySNZ61hbBoGqvhyY/1wCnq53NUzEHWt5Qz0Z0Tirgmmt9ea18OD9BCvbCbg59FCDrZ
         UavA==
X-Gm-Message-State: AOJu0Yxp+DtRxpYLWTf2hNCg5TlLGZkN44bc6HnTyN7pJ6IXDo53PnsN
	GgaBtrCh6mh8Fy9csPVjN9G+RN7hb/A=
X-Google-Smtp-Source: AGHT+IEP+hPcPCuREBZrQP6PCWeJdQBQpJ31fau6K8TgdyzZN+ahpiTmAdAAPDqtBnDUuigBuOlbPw==
X-Received: by 2002:a9d:76c6:0:b0:6d8:7a55:11a5 with SMTP id p6-20020a9d76c6000000b006d87a5511a5mr7105598otl.51.1702403966652;
        Tue, 12 Dec 2023 09:59:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d7558000000b006d879d8a4d8sm2293027otl.78.2023.12.12.09.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 09:59:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92699a3e-1198-4bf9-b5c0-ea8c5c189336@roeck-us.net>
Date: Tue, 12 Dec 2023 09:59:23 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
 <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
 <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
 <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/23 07:30, Nuno Sá wrote:
> On Tue, 2023-12-12 at 07:14 -0800, Guenter Roeck wrote:
>> On 12/12/23 06:28, Nuno Sá wrote:
>>> On Mon, 2023-12-11 at 07:36 -0800, Guenter Roeck wrote:
>>>> On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wrote:
>>>>> From: Nuno Sa <nuno.sa@analog.com>
>>>>>
>>>>> The LTC4282 hot swap controller allows a board to be safely inserted and
>>>>> removed from a live backplane. Using one or more external N-channel pass
>>>>> transistors, board supply voltage and inrush current are ramped up at an
>>>>> adjustable rate. An I2C interface and onboard ADC allows for monitoring
>>>>> of board current, voltage, power, energy and fault status.
>>>>>
>>>>> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
>>>>> ---
>>>>> +
>>>>
>>>>> +power1_good		Power considered good
>>>>
>>>> I really don't like this attribute. Like the ones below it is non-standard
>>>> and invisible for standard applications. On top of that, I think it isn't
>>>> really related to "power" but to the output voltage. What does it actually
>>>> report that isn't included in the FET faults ?
>>>>
>>>
>>> This is detected with the FB pin and a voltage divider (from the output
>>> voltage). Basically depending on the level of that pin, the chip indicate
>>> power
>>> good or power bad. I was also very reluctant with this attribute (I mention
>>> it
>>> in the v1 cover). This might not even indicate any misbehave. We also
>>> support
>>> reporting this using the gpio1 pin (if we set it that way). So, I guess I
>>> can
>>> just drop this one and add support for it if we ever have a real usecase
>>> where I
>>> can actually justify having it :).
>>>
>>> We already have the power_bad fault log in debugfs so I'm not sure if adding
>>> this one there adds much value.
>>>
>>>>
>>>>> +fet_short_fault		FET short alarm
>>>>> +fet_bad_fault		FET bad alarm
>>>>
>>>> Those attributes have little value since they are not standard attributes
>>>> and won't be seen by standard applications. On top of that, it is not
>>>> clear
>>>> (not documented) what the attribute actually reports. I assume it is
>>>> associated with the output voltage, i.e., in0, but that is just an
>>>> assumption.
>>>>
>>>
>>> fet_short - This is one is detected if the ADC measures a current sense
>>> voltage
>>>> 0.25mv while the fet gate is off.
>>>
>>> fet_bad - Is set by monitoring the voltage at the gate and the drain to
>>> source
>>> voltage.
>>>
>>> These ones might indicate real issues with the HW so I thought they could be
>>> important...
>>>    
>>>> What do you think about introducing a standard inX_fault attribute ?
>>>> It would not be as specific as short/bad, but I think it would be more
>>>> useful and we could add it to the ABI.
>>>>
>>>
>>> It would be better than nothing. And we do have fault logs for both these
>>> failures so userspace could also use that to know exactly what was the
>>> issue. If
>>> that's ok with you, I would then report this in inX_fault? Did you had in
>>> mind
>>> putting this in in0 (vsource) or adding a new channel?
>>>
>>> In my first draft I had another voltage channel (label: VFET) to report the
>>> fet_bad condition. I was using the inX_crit or inX_lcrit but it felt bad so
>>> I
>>> removed it...
>>>
>>
>> This isn't an extra voltage channel. It should be associated with the output
>> voltage because that is what is affected, and that would be in0.
>>
> 
> Noted... will go with that and add an introductory patch for having inX_fault in
> hwmon.
> 
>>>>> +fault_logs_reset	Clears all the Logged Faults
>>>
>>>> What exactly does that do that is user visible ?
>>>
>>> Well, this one is because in some configurations the chip won't enable the
>>> output load until you reset/clear the fault log keeping it from enabling the
>>> output. This is the comment I have in the code:
>>>
>>> "Fault log failures. These faults might be important in systems where auto-
>>> retry
>>> is not enabled since they will cause the part to latch off until they are
>>> cleared. Typically that happens when the system admin is close enough so he
>>> can
>>> check what happened and manually clear the faults. Moreover, manually
>>> clearing
>>> the faults might only matter when ON_FAULT_MASK in the CONTROL register is
>>> set
>>> (which is the default) as in that case, a turn off signal from the ON pin
>>> won't
>>> clear them."
>>>
>>> In v1 I was allowing to clear fauls log individually and you recommended to
>>> have
>>> an attribute to clear them all at once as that would simplify things.
>>>
>>> I just kept it in here because this might be important for the chip to work
>>> as
>>> expected again so having it in debugfs might be weird.
>>>
>>
>> How about using a write to in0_fault to clear the log ?
>>
> 
> But that would be just related with the output voltage. You can also have
> failures on VDD (over and undervolatge fault - I'm using in1_crit and in1_lcrit)
> and if you have the auto retry bit disabled, then clearing fault logs might be
> important. This attribute is nice because makes it clear what will be done.
> OTOH, I do understand your worries with non standard ABI...
> 

Depends on the meaning of "fault". PMBus, for example, uses the "fault" terminology
to indicate that critical limits have been exceeded. That isn't a "fault" in the
terminology used by the hwmon subsystem. Violating a voltage/current/power range
isn't a fault. A shorted FET or temperature sensor, however, is a fault.

In that sense, if the output is turned off because a voltage / current / power
limit was violated, a write into the respective alarm register would be appropriate
to reset it if the condition doesn't auto-reset. It really all depends on the context.

> I'm not sure how usual is for fault logs to be around that would justify for a
> global standard attribute.
> 

We could also use in[01]_reset_history. While that is originally intended to reset
min/max voltage history, I think it makes sense to extend the meaning to include
fault history (even more so if that history includes over/undervoltage events).
Plus, there are other _reset_history attributes which could be used to reset
power/current/temperature history separately if that is supported by the chip.

Thanks,
Guenter

