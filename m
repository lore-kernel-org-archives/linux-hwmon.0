Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28733D333E
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773425552; cv=none; b=utHNHc+tyZel6hai/YhS7Ta8pUHf7ZZw3G8736s9Xjh/dly3B0/qVZOKhjOJD4kCmJQUT5NI0hJEZS9lvplWqtw6FKn2+63sTBSxvLcMJCIw5hhm2Y0dxOkRH4wgqjZFE+EAg/M8ldulfFdDG47a3Y3qSD+e4Byjd2Qi2XgdKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773425552; c=relaxed/simple;
	bh=RmdOmrssaFa2NY+5lSy5ZaT+O8gr+fKg8x7V06Y8by8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ue7l/df0fEPes2nY8MJ4M2jCboQMMjyxEc4mZUfZxGoeNIk+zdOI71/5j34LsjsZP+vYKWORbF0AAF+yr2yn9ccukWvU8Kxj5+98ZC+xuZRTtIZcRQupo236USsxOeJJphtJj7bfkplun+YNXsgUjd701Uo2Uc7UnrocK0tbSPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UamHE/9Y; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UamHE/9Y"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824c9da9928so1656431b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773425549; x=1774030349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EvpzVosN3fzG6HUFZ5xf0+PeJenGWuukw2/bPevXNSU=;
        b=UamHE/9YroASDPTAE19tXxx63xVdvrxpiuZDC0J5qtXQ9eq/GXOB6HpBv/yRIv0pCB
         dR0ywmN/omK22VQG1eXmGuJNR0Sc5JhD5wkPbg163616hsaxgE767ci8WVCMLYMLO/CG
         hPiMDL7bzk8rrndWbCagqD4JrDWpU2OF7eOk0s9C4gC187dc78Xh+CsLTyEzdLfzYaNC
         QQTxCsM37gcM+7Ym/bKG6ch06xlFdvxjQ7dkSzDNNpa5J1zKO99eZQjFbq/dx+vfWtRD
         1z06+inxkPqDSLbd3UJgesclPFImuGwdDIAqGApV1ZP2wCEN4R2W3aVO1yxxsdk4qHxt
         3e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773425549; x=1774030349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvpzVosN3fzG6HUFZ5xf0+PeJenGWuukw2/bPevXNSU=;
        b=oRUSlZykRdyTH3BidxzDSrGIGYZs6FGThRpEy5xAu0psqGBOVMHxu7GFDEvgbMIQG2
         YtdyKUFQYvtFqnJ2FBE8Jfv0bmR9xDUvj/UG16md7DGuxDDqtXUw7budoNSX7tlENWLu
         Do2sournU1Ax4bfcKIPQM3kyOxmZ1eWM9UHl9YL68mcxaWX/CawUivCBThzfoOL2Q7D6
         X6Jm9VGfLJ5SJRsLMzhayberr9K3iLK4mPDLJe6tQTed5RGd3MsTU/+T0u16AcQsmi2o
         GDxuAgQbsAVcjfpQpude2Ird0FK0dn5nJm7vfgL1mIADhptfbzyzkJZPXgXSRbsUy3Xw
         rIqw==
X-Forwarded-Encrypted: i=1; AJvYcCUVkdpmAXFuD+UCfdTDSscm8TxUarq+7LGQrFjChmwFy24AGT1c4/VY42InE6Bq60UJlK6GZGaS48fDXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyetM/PA2Sp2RXLOLDEc5Jsl4/myGuzJK0gQIJ0YXodNcSyzwxZ
	3bhyu/T+EOdp4owj8bHYFFtL15kQNQb56TYSeH1fr/veY9pYSvVFPwvPNN8FdA==
X-Gm-Gg: ATEYQzxMKNlBR/FaRv9RtLXBm1IOFyQVKwsLiXo2jlVGd7eHWiZW7Ok11iGX6bZEdWw
	xERQF5/lcmVA1K/SsbVdVLRUky2OL+lZw+JmR4lHuvv3GES7/cqBjT2IkKm9TzN8oNYLT3jkdF9
	gyP2gjdyTLg2/Nzkl8+xpnwQ0HamBfadZPK/XT5I2n3rbsQvyP4z7N7EaMYPhDuAW6WQwijP16v
	bfY9xihsnS/WBOy7OoUjUhDPdRDvd7F2wA8UnD4ZL1N7canLZxLqOL03zujGYVUNFv+AUe4ubcw
	WefFabmyRQ62/Xvk6ufU2vvsyijKr7jBxNWgLCCm6HykHsk+NnaFPq3E4DWv3feCfqTjZwkO5AE
	gS3sXCrI4SCDJlauz8ZaXy3lcRyMkPeCEAwFpNEFxEaDAH6+hzyH4hYiYveoORu+kdOPw2ZrGFI
	QJwtrQt4zXFcw+7/uHT7fpjrxn0Y2MpXh6YtNTYkx8pUiNGVW/QOQduGPL5O+1zLqfpoOzVbgl
X-Received: by 2002:aa7:88c2:0:b0:81e:c67a:1a79 with SMTP id d2e1a72fcca58-82a198661cemr3988947b3a.25.1773425549120;
        Fri, 13 Mar 2026 11:12:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07240f25sm6667100b3a.5.2026.03.13.11.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 11:12:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cbc1d09e-25b1-4b94-a59c-6b5e54af01f9@roeck-us.net>
Date: Fri, 13 Mar 2026 11:12:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Conor Dooley <conor@kernel.org>,
 Florin Leotescu <florin.leotescu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
 <20260312-triage-shallot-1b3d9f07d250@spud>
 <abRF+TPKuXFDJc55@ro-kernel-workstation>
 <20260313-mulberry-glamorous-6afbfc52e42f@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260313-mulberry-glamorous-6afbfc52e42f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/26 10:38, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 07:14:33PM +0200, Florin Leotescu wrote:
>> On Thu, Mar 12, 2026 at 05:37:51PM +0000, Conor Dooley wrote:
>>> On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com wrote:
>>>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>>>
>>>> The EMC2305 fan controller supports multiple independent PWM fan
>>>> outputs. Some systems require fans to enter a defined safe state
>>>> during system shutdown or reboot handoff, until firmware or the next
>>>> boot stage reconfigures the controller.
>>>>
>>>> Add an optional "fan-shutdown-percent" property to fan child nodes
>>>> allowing the shutdown fan speed to be configured per fan output.
>>>>
>>>> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
>>>> ---
>>>>   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> index d3f06ebc19fa..7bcadfab9fc4 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> @@ -54,6 +54,12 @@ patternProperties:
>>>>             The fan number used to determine the associated PWM channel.
>>>>           maxItems: 1
>>>>   
>>>> +      fan-shutdown-percent:
>>>> +        description:
>>>> +          Fan RPM in percent set during shutdown.
>>>
>>> This sounds like something generic, that other devices might need and
>>> should be in fan-common.yaml?
>>>
>> Thanks for the feedback.
>>
>> The property name was reused from pwm-fan.yaml where it already exists
>> with the same meaning. I kept it local to minimize the scope of the change.
>>
>> However, if you prefer it to be modelled as a common property, I can adjust it in the next revision.
> 
> I see. Makes me wonder why half the properties in pwm-fan aren't also in
> fan-common.
> 
> I suppose there's a reason for it, carry on I guess.. Can be lifted if
> there are more users other than you and pwm-fan.
> 
>>>> +        minimum: 0
>>>> +        maximum: 100
>>>> +
>>>>       required:
>>>>         - reg
>>>>   
>>>> @@ -80,12 +86,14 @@ examples:
>>>>               fan@0 {
>>>>                   reg = <0x0>;
>>>>                   pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
>>>> +                fan-shutdown-percent = <100>;
> 
> Also leads to the question of why these devices aren't pwm-fans. Too
> late now to change anything, I just wanna understand why.
> 

They are dedicated fan controllers, with an internal tach -> pwm feedback
loop. I don't mind modeling them as pwm controllers if there is a use case
(such as someone using a PWM output to control a LED), but I don't even know
how modeling them as pwm fans using the pwm-fan compatible would even be
possible since that would exclude the tach -> pwm feedback loop.

Also, if that were to be done, we might end up with two hwmon drivers
for one chip: one to report the fan speed, and one to report pwm values.
On top of that, even if it is not currently supported by the driver,
controlling the tach -> pwm feedback loop would become awkward.

Yes, I understand, there is a strong push to model everything with
a pwm output as pwm controller, but si far no one was able to describe
to me how to model a fan controller, and especially its feedback loop,
in such a scenario. That becomes even more complicated if temperatures
are used to control the feedback loop.

Guenter

>>>>                   #cooling-cells = <2>;
>>>>               };
>>>>   
>>>>               fan@1 {
>>>>                   reg = <0x1>;
>>>>                   pwms = <&fan_controller 26000 0 1>;
>>>> +                fan-shutdown-percent = <50>;
>>>>                   #cooling-cells = <2>;
>>>>               };
>>>>   
>>>> -- 
>>>> 2.34.1
>>>>
>>
>>

