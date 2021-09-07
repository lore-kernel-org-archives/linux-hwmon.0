Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A4EC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2850F6103D
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345540AbhIGPsC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 11:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345526AbhIGPsC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 11:48:02 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C4EC061757;
        Tue,  7 Sep 2021 08:46:56 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id h133so13308582oib.7;
        Tue, 07 Sep 2021 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=za921Vu97h0qChNKiBR4nf/vhgRy0vpn+TROCeKGBrk=;
        b=LDoQr8WAioF/ltfREZSAkaJvjmZNM8+rF1dlJ5TqsRUv4doo7ogGKJ90LfoeKc1QwA
         N0VLwV3fVXBhsizaw7uhwpi/coA0NKzQ9ya7Zxo4foqP4HsHy2oFZI3NfMhP34bj9lc+
         iaoRcpuYjgG3HA1/PPgZQ0nLsVoFNUw344ZmjjenwhZY4Vie8RLGL9SLkbQv5qBuwtgA
         OV3z+uXE/9Sfmq38JazJ7lACm/VWpSG5ZzQ5PnQpRtNkeSJStHRgAkUUlyWUM5EvmKlj
         GWTaKj0V83o10Vpy4f8xkRnubr1uyYXWF2SsTcliTTDrhH3lZaK7f8Z3YZYRhf8XJN52
         mxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=za921Vu97h0qChNKiBR4nf/vhgRy0vpn+TROCeKGBrk=;
        b=k4nvrQFw56PE9nP8aTWF1s1A5hZjYcgbHIFqZkHQnwAGQhyLSbjLmiAu8zKTe94PvJ
         /aTgumT7njJSbR2uFzG37vPyR5/ZIAvct5sSTUvaNZbVHdH5v+vPUkVAXRoPomOmdmsf
         ttHXZOOVchdzWXsPhlpEptVTjRGInPnF8RzzJQJAd62ZVxfSfjl4NRoI0KkGOPk4LMQG
         S0HK2gNgsGxWZ8tlK8DFiYQiSpboSqeGF8DGiCDMIhB8aZTiDYcSFmP+1PwqdUHFcOo0
         deK3Wy3GYQdwrF48i0dXsTQczu3liFZRpidUTZhyCAU+I1WafdXgBYP+ZxWlBP7TNx15
         K6CA==
X-Gm-Message-State: AOAM533V751JomihVizySML5+VLwyxiIKeTru02ZbTL4Q3fcL105xxDE
        5HjujW9pGgyNuWu7T6qM1zJ57EMQDLo=
X-Google-Smtp-Source: ABdhPJwCAP5bp/2ZuQQqaqWNllXbGu6/D1i4ihdvTbFd9ujHF2fVkM5MnXk62rGdvFB1uURqhIyPfw==
X-Received: by 2002:a05:6808:291:: with SMTP id z17mr3529979oic.177.1631029615129;
        Tue, 07 Sep 2021 08:46:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm2271183ooc.21.2021.09.07.08.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 08:46:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <3743f9f4-f8c5-acd5-2422-2bbdb2dd7d72@roeck-us.net>
Date:   Tue, 7 Sep 2021 08:46:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/7/21 6:46 AM, Krzysztof Adamski wrote:
> Add binding description for the per temperature channel configuration
> like labels and n-factor.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Up to Rob to decide, but it seems to me that can be squashed with the other
dt patch in the series (which on its own doesn't really add much value).

Guenter

> ---
>   .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> index 53940e146ee6..56085fdf1b57 100644
> --- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> @@ -24,12 +24,49 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>   required:
>     - compatible
>     - reg
>   
>   additionalProperties: false
>   
> +patternProperties:
> +  "^input@([0-4])$":
> +    type: object
> +    description: |
> +      Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. 0 is local channel, 1-4 are remote channels
> +        items:
> +          minimum: 0
> +          maximum: 4
> +
> +      label:
> +        description: |
> +          A descriptive name for this channel, like "ambient" or "psu".
> +
> +      n-factor:
> +        description: |
> +          The value (two's complement) to be programmed in the channel specific N correction register.
> +          For remote channels only.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>   examples:
>     - |
>       i2c {
> @@ -41,3 +78,32 @@ examples:
>           reg = <0x4c>;
>         };
>       };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4c {
> +        compatible = "ti,tmp422";
> +        reg = <0x4c>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        input@0 {
> +          reg = <0x0>;
> +          n-factor = <0x1>;
> +          label = "local";
> +        };
> +
> +        input@1 {
> +          reg = <0x1>;
> +          n-factor = <0x0>;
> +          label = "somelabel";
> +        };
> +
> +        input@2 {
> +          reg = <0x2>;
> +          status = "disabled";
> +        };
> +      };
> +    };
> 

