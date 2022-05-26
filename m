Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF78C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 05:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237343AbiEZFY7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 May 2022 01:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbiEZFYx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 May 2022 01:24:53 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A2AA5AAC;
        Wed, 25 May 2022 22:24:51 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id e11-20020a9d6e0b000000b0060afcbafa80so382452otr.3;
        Wed, 25 May 2022 22:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=b6rYvwzjsuZxkdoPOJ1yDjkAFYqJqmZM294vFRfesk4=;
        b=EBp+Qoj7VYpyZlw82wh0HwVxP6Y9Vyr4qbxbpFaGAnYQOKPSAZ3UwevOFIXK43rk9+
         80K04/qlFSj69y9pCSR0upmaLjBziBYHV2Gpk8iZB28mYZQYfsgC1rrCaW8K1GV49OBQ
         aBCk3ghqChcBxh49TPJvvTivNHRtBrXP4zTmex1hsPFWdO8CQFWIZG5WYFPH5FD6L9/3
         V+yWpwyGondd0ZNlMAHB6saSwGwz1blqjKrBPUCbYTaHZlcbl1TwU9U+vTYOKZntApR9
         tGEFv6kOrcAUqRTztPjpf/SjPaVyuwX22K/fhuzAbxDJysuPprhaCiaNlx9nV9v+Jgyx
         54RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=b6rYvwzjsuZxkdoPOJ1yDjkAFYqJqmZM294vFRfesk4=;
        b=DNzIwpMwssaYEmhozwRpyikzDBZg2gl51N7mi4X2P5n0x9X52aZQpFiNFpKPNTwzpX
         Oq+nqC8v7gsTh7TgKmKRtu62j0/I50+k2OmSo+h1Etg495WrgYgOipmsTsXa27uZKMwE
         gLAzcxXQEr7XAiUWQ1b/PbY8F+lfQ0lNucwF6N5EBCuaKgNhJ797tRCY0OCnXX4DgRMm
         c9ZbthCh4E5H9EqgEjRHyYv/6aWkLWAAu6fbFtyteZNPELtEBfSElyMPXW3jkmJbmByB
         tYN3I/LDkqQYg0kX34MQmALlF+VO6Q/OXCihaNNX1IQ/4q48KLpP498/gDrJUDQWl7xL
         6jjQ==
X-Gm-Message-State: AOAM532ZlZFo7zIiTPnW5znpf4KNolz5rwf034TcpQFLIwxUc3zdTKcq
        mjs2RGowxqsBsjIzdkyFr+Rx3FnWVzzSYQ==
X-Google-Smtp-Source: ABdhPJyRgCoo8MiLy5UAnGF2ZVLL70flKlKYzvhphglsY5waUijAF/moQZr07tHsw0cKU57PQk+YdQ==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id q15-20020a05683033cf00b005af4018fc2amr14137257ott.161.1653542691168;
        Wed, 25 May 2022 22:24:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 65-20020a4a1a44000000b0035eb4e5a6b2sm296526oof.8.2022.05.25.22.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 22:24:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77be4b2b-cd0a-64d9-69da-22b58a47e728@roeck-us.net>
Date:   Wed, 25 May 2022 22:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        vadimp@nvidia.com
References: <20220524161755.43833-1-michaelsh@nvidia.com>
 <20220524161755.43833-3-michaelsh@nvidia.com>
 <20220526021134.GA2908133-robh@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH hwmon-next v2 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
In-Reply-To: <20220526021134.GA2908133-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/25/22 19:11, Rob Herring wrote:
> On Tue, May 24, 2022 at 07:17:54PM +0300, michaelsh@nvidia.com wrote:
>> From: Michael Shych <michaelsh@nvidia.com>
>>
>> Add basic description of emc2305 driver device tree binding.
>>
>> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
>> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
>> ---
>> v1->v2
>> - Fix dt binding check errors;
>> - Add descriptions;
>> - Add missing fields;
>> - Change the patch subject name;
>> - Separate pwm-min, pwm-max per PWM channel.
>> ---
>>   .../bindings/hwmon/microchip,emc2305.yaml          | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> new file mode 100644
>> index 000000000000..0aa65dcfd238
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
>> +
>> +maintainers:
>> +  - Michael Shych <michaelsh@nvidia.com>
>> +
>> +description: |
>> +  Microchip EMC2301/2/3/5 are RPM-based PWM Fan Controller.
>> +  The Fan Controller supports up to 5 independently controlled PWM fan drives.
>> +  Fan rotation speeds are reported in RPM.
>> +
>> +  Datasheet: https://www.microchip.com/en-us/product/EMC2305
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - microcip,emc2305
>> +      - microcip,emc2303
>> +      - microcip,emc2302
>> +      - microcip,emc2301
> 
> typo.
> 
>> +
>> +  microchip,pwm-channel:
>> +    description:
>> +      Max number of pwm channels.
>> +      Zero index is used in case of one common PWM setting.
>> +      Number of used separted pwm channels can be less than
>> +      maximum number of available pwm chnnels on this FAN controller.
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    items:
>> +      minimum: 0
>> +      maximum: 5
>> +      default: 0
>> +    maxItems: 1
>> +
>> +  microchip,cooling-levels:
>> +    description:
>> +      Quantity of cooling level state.
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    items:
>> +      minimum: 0
>> +      maximum: 10
>> +      default: 10
>> +    maxItems: 1
>> +
>> +  microchip,pwm-min:
>> +    description:
>> +      Min pwm of emc2305
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    default: 0
>> +    maxItems: 1
>> +
>> +  microchip,pwm-max:
>> +    description:
>> +      Max pwm of emc2305
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    default: 255
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    fan {
>> +        microchip,compatible = "microchip,emc2305";
> 
> microchip,compatible?? Again...
> 
> The bigger problem remains of this needing a common fan and fan
> controller bindings.
> 

I am more concerned that the bindings don't really reflect the fan controller
but thermal device configuration. Shouldn't that be handled with thermal
subsystem bindings ?

At the same time, there are no bindings suggested for the actual pwm
controller configuration (such as pwm inversion, pwm frequency, or pwm
output type), and there is nothing at all for the fan controller either.
I can understand that this is maybe not needed for the given application
(it seems to assume manual fan control driven by the thermal subsystem),
but the bindings have to take into account that there are other applications.

Also, the number of available pwm/fan control channels is determined by
the chip. If some of the channels are unused, that could be handled with
status properties for the individual channels. I don't see a need for
a "pwm-channel" property. Similar, the maximum pwm value is determined
by the chip; I don't see the point of the microchip,pwm-max property.
Again, this is a thermal subsystem property, and I would hope that the
range can be set with thermal subsystem properties.

Something like the following might do.

     fan-controller@1a {
	compatible = "microchip,emc2305";
	#address-cells = <1>;
         #size-cells = <0>;
	<chip properties, eg external clock>

	channel@0 {
	    reg = <0x0>;
	    pwm-frequency = < xxx >;
	    pwm-output-type = <0 | 1>;	// for open drain / push-pull
	    pwm-inverted;		// if pwm output is inverted
	    microchip,closed-loop;	// for closed loop fan control
	    fan-pulses = < 1..4 >;
	    ...
	};
	channel@1 {
	    ...
	};
	channel@4 {
	    ...
	    status = "disabled";	// if unused
	};
	...
     };

Thanks,
Guenter


> Rob
> 
>> +        microchip,pwm-channel = <5>;
>> +        microchip,cooling-levels = <10>;
>> +        microchip,pwms {
>> +            pwm@0 {
>> +                      pwm-min = <0>;
>> +                      pwm-max = <255>;
>> +            };
>> +            pwm@1 {
>> +                      pwm-min = <0>;
>> +                      pwm-max = <255>;
>> +            };
>> +        };
>> +    };
>> +
>> -- 
>> 2.14.1
>>
>>

