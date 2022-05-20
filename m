Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7F6C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 10:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348036AbiETKJ4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 06:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242192AbiETKJ4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 06:09:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFD3DE30B
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 03:09:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id l13so6816655lfp.11
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=S/QQ41iqJdG4//Xb8E9sd+rE0rPYF5cqB+tQAeF9cbo=;
        b=Bmx8sMfXVBo4/rNKybs+gTJLCyW1VtRdzvDi570yhwBXeZ5WeX2i6Bo33fLP0mkoJW
         Z7K5rxBQl9EyYjjDnHHZBDOSgDW9mJGeLmW1cIBkXUAGBNG9ca3OnYIV0wipNAiB8Ut5
         oEX0S1ItfCbYylL/yQqReI4vojD8pXZm524ZklPQ+AiYKi7qwdy2jI6o3oSJsmfChoeY
         rlQLsLTfluPQl40pdv2NKQ9x0kOL/NG1zTWujAILlo09L0o8s+KsXmj9mg8AsdgT7a2n
         EzBZMO0lrStciz+8roeUVKUT6wQBhnG+9I4FoLNN6xPI7pOX4lOjTvdj/XV0hLb/tAxK
         9LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=S/QQ41iqJdG4//Xb8E9sd+rE0rPYF5cqB+tQAeF9cbo=;
        b=6n3IzbX0zXMAKy5ftctJNxjn+FI/thyOG7J/h/1LGU9FO8+x/09n1YsNfohF3lEgU8
         gi4UlZGboJ8o2XpeKeKG2nnS+97X6k0ZSYgNTbsN2sT38PV6PqFIYSNg/nwBAL5nS+Ef
         9takk8IwN3gbR7x9SMVFJgjXyxIQCh6LoxjH2CNrbS1cXm3PkbYk0b395filhb1ji2Hg
         26FrBEA7JS5NV5ejrW2KflDfMohYKtRiuYDS1baeHE1qzWPKfzLG7qcsddRhclqbXpwk
         u0gv+DJcEiE7FslIsryrWZvDuahcxQjr8SPOvan+eRwnxmNQstGNrKZlB71pGfhO04BB
         atoA==
X-Gm-Message-State: AOAM5330cg2rbTukEAtdLqiNwvYmSrGNSQPkxUXrl6lppBvtQX8feltG
        TDc9+h+8RaKnc+KSWzsqV25NBQ==
X-Google-Smtp-Source: ABdhPJxEXbYOPibkmQ5rNjzgSNZvXx30n32PVIP2eNKExPPQuvQDF8EFlbIqO9lqxv32gqVRPtleWQ==
X-Received: by 2002:a05:6512:1085:b0:477:ffc3:3a7f with SMTP id j5-20020a056512108500b00477ffc33a7fmr2712184lfg.578.1653041393532;
        Fri, 20 May 2022 03:09:53 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w17-20020a05651234d100b0047255d210e8sm607828lfr.23.2022.05.20.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 03:09:52 -0700 (PDT)
Message-ID: <3e1ccf50-754c-c149-225d-e041c38e968f@linaro.org>
Date:   Fri, 20 May 2022 12:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: Add 'extended-range-enable'
 property support in lm90
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-3-sst@poczta.fm>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520093243.2523749-3-sst@poczta.fm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 11:32, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Using the 'extended-range-enable' prop will enable the extended
> measurement range for device (if supported by the device).

No. Please see other patchset:
https://lore.kernel.org/all/20220517135614.8185-1-holger.brunck@hitachienergy.com/


Best regards,
Krzysztof
