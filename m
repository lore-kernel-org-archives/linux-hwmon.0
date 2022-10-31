Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91BBC38A02
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 08:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiJaIFR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 04:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJaIFQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 04:05:16 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091A019F
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Oct 2022 01:05:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so5260177pjk.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Oct 2022 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3mltGBO5/lAarkXVK/V/79Pr2NEHJtbOoZuSin9YbQ=;
        b=WHf1X0+EpYOrptMQ21sy3RoYOEekhsn2cVdToTzmhKA+4+rxicXwSMGQEOlrY+1ln3
         vLtBZU/fUp9mUvx8+2riIKREEW0ZyrEklKaKYYo4e6cCfrbgs5tIhWvLq28qMbH5JHiH
         gvBhL0d/HVTD2dqIXuqi8b19jjkOLiYW8d9U4Ks9+lw0PHUU8hkowOyl/ywd1jQRo2rc
         eS0D3vzwSGHhhszxsyMnvahFJm70knTmFsM740DbOsX7Gi/plBWLXvdeNwLj+8YHD2Zd
         sY3gl8ie8MxVl7MP06CAe2PBZr6PmF/ylT0ldeAKJDcsWQdP3pvouX/YiEd97g9Ev7rT
         wr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3mltGBO5/lAarkXVK/V/79Pr2NEHJtbOoZuSin9YbQ=;
        b=aAyB/Nf02QaPii1ecUcN92f2votFyI4VFxJWnDdhUfJXLMwMNketQ1li7rvwL5etfg
         hmvrko3f1h+EQ8LO+tepQg1oJlSJ8EetV+Fb6G7fVhycFy63Ni8QdiIK7aZbbPmC7X4V
         EQGuCGEicZ4gA6psHTx9aCribP1rVks/A0QyN6MEsVWtyGwW6Qow6SRCx9ZugqA/GoN1
         yhQB1srhmB+Mzx0n6e6yTSUbrr5xd6H+HcoSadVlJT8L5FqDqv7CsLExyHWRTncaHGDx
         GBOqlbOMoq0fSWQ79Dvi4FpyPzyhs2dgMa8wfPI8GMqjXmvIrQTlpp7Nep7qyScTtHGF
         Qchw==
X-Gm-Message-State: ACrzQf3X3R5aN9nrsOUjL9XR8i5YUDZMowaHNMveLqwYwmX69TftqwL+
        miCmvYEPA/NdpNDSgnMRFGpn0g==
X-Google-Smtp-Source: AMsMyM6mxCv+BsCVn3561zIAqJ39MWgR894VJm3Gd3pe43O8WJNL70RBJIQGNzoRHha1KcT5k/GAXg==
X-Received: by 2002:a17:902:ec92:b0:186:de89:7f67 with SMTP id x18-20020a170902ec9200b00186de897f67mr13418848plg.166.1667203514518;
        Mon, 31 Oct 2022 01:05:14 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:da6a:d4a2:1253:adfc:370? ([2405:201:d02f:da6a:d4a2:1253:adfc:370])
        by smtp.gmail.com with ESMTPSA id a19-20020aa795b3000000b005636326fdbfsm3914318pfk.78.2022.10.31.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 01:05:13 -0700 (PDT)
Message-ID: <3152c290-8aca-b91a-df20-335c33395835@9elements.com>
Date:   Mon, 31 Oct 2022 13:35:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
 <20221013094838.1529153-2-Naresh.Solanki@9elements.com>
 <20221024161806.GA1855651-robh@kernel.org>
 <dcd22f70-e51c-290e-c11f-9a5ce32748c1@9elements.com>
 <CAL_JsqKT52ULEZjKo9emEAt74nH2OpMO8ymLLKM_T-NzAwqGog@mail.gmail.com>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <CAL_JsqKT52ULEZjKo9emEAt74nH2OpMO8ymLLKM_T-NzAwqGog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

On 26-10-2022 07:07 pm, Rob Herring wrote:
> fanc: fan-controller {
>    #pwm-cells = <3>;
>    ...
> 
>    fan {
>      pwms = <&fanc 0 500000  PWM_POLARITY_INVERTED>;
>      ...
>    };
> };
> 
> 0 is PWM number and 500000 is the PWM frequency. The 3rd cell are per
> consumer flags. See pwm.txt for more details.

Did the implementation & while testing getting the below err:
[63.626505] max6639 166-002e: failed to create device link to 166-002e
