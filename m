Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84890C001DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 12:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbjGZMUZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 08:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjGZMUZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 08:20:25 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956BDE63
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:20:23 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9891c73e0fbso203946266b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690374022; x=1690978822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnqqKiV/ROZY/0GDhQOQbG/HM4kkWyyFE6/skzOqAXE=;
        b=q44rAZeDdRYJssDalYSZp14Jz1I1FNuACshbpM5tjsJMMTV16VFrm0iNrFkz/n8sC4
         aBEMFBtRgCxkGKUla/qTw6qMv7WZBe/svWHBVT1ZaaoKQksXNiAue8CJX6CuAR1VGJ3e
         m+0YBcbw8k08qkpEx6WuDuBK9EuoYmcT6mx+Zv4+eVo5Y/rh2DVHM/AbFkmYA3LLBymg
         bvbNcEffWI8/zddezdxTdMQiI92IjnyDf4r4k8yQLburK2+j9kc5SLG+MukfzapOk+Ro
         GSqRS2JL04TPbXM8Hw32O/nKiyDfefHpMXlalxNuejDCo8+6lI2yy7twYD4acxpJnnUt
         JrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690374022; x=1690978822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnqqKiV/ROZY/0GDhQOQbG/HM4kkWyyFE6/skzOqAXE=;
        b=TTrgOnqcur+d1tjpUuv5QF6g797dljm5esjuiKbsmbQYqdFQN4+7wqfsYMfmPjoB26
         5n04XvYDHcXN5R0v0DQGmnreNcmW8urdlHppPiOpegddTeKFRuERjdE1OwIvZ8+St9al
         VhcYSF6T/Isvd3Gc046l9xcfZqsr6pvNF2WhyJTemtzkS8hqsZD+KAtrFbg1v59ABFfQ
         /iwZj/X3qAqtOmWS72JUnoqs4SDa0Dehg05YU7+n6EY10a9Y1+gil7xQJvaSHxpHQjdZ
         rBx1zLg/+s7TEgFxC4kNMsCG9kqwy5geAbpzRO0iDJ8q32AbMF9/vxtyrGT9HH+WPDd8
         j5iw==
X-Gm-Message-State: ABy/qLbIDTZrkt8J/Cns3xEkkjaBpAlCnbPDZBW3yF9AHhnMolqCZTt8
        c79ExdG2jAVrGe+W9B6C5ve5/w==
X-Google-Smtp-Source: APBJJlHwVDkfg3jPDdHzfW05jPl3iAz0LqDc+HFNfu7tPIdQ7l2h+zW0hN0TBayRq6ilsIuIiXtFjA==
X-Received: by 2002:a17:906:53c3:b0:994:1eb4:6896 with SMTP id p3-20020a17090653c300b009941eb46896mr2296542ejo.25.1690374022094;
        Wed, 26 Jul 2023 05:20:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906299100b00989828a42e8sm9497680eje.154.2023.07.26.05.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 05:20:21 -0700 (PDT)
Message-ID: <11620112-ffe4-8df1-6b38-0f3082c5d16f@linaro.org>
Date:   Wed, 26 Jul 2023 14:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (hs3001) Fix unused variable compiler warning
Content-Language: en-US
To:     werneazc@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>,
        kernel test robot <lkp@intel.com>
References: <20230726113605.13966-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726113605.13966-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/07/2023 13:36, werneazc@gmail.com wrote:
> From: Andre Werner <andre.werner@systec-electronic.com>
> 
> Delete unused variable in drivers probe function.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307261819.VMDuxZOM-lkp@intel.com/
> 
No blank lines between the tags.

> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>

Was the original patch actually merged? I don't see it in next.


Best regards,
Krzysztof

