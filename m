Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E32C636CA
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Jul 2021 17:22:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC76461002
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Jul 2021 17:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhGQRZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Jul 2021 13:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhGQRZt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Jul 2021 13:25:49 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B890BC06175F;
        Sat, 17 Jul 2021 10:22:52 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id z9so12151124qkg.5;
        Sat, 17 Jul 2021 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mOKHiePdlVhlno5ie5pDrbQHEPlO/eC6Zv3NO6pPid8=;
        b=r4UYKwGNMHhgua40EJgtsOLzEnsg1x0ToSS83IVrmt9apIOd1+U5/3fq0aNO52CTGf
         osoIpXn0gYir001we15F6BSDlpKuEhUALuTVIDgpvfmgro+m9+8VVhhPclz4ZcGHsjVQ
         yQ92fkGxhJ2jFZ73skuxqJxrr1ovk8NSpbvYp/pybUB1Kegn8AfAGmTgIk5klRE7VQbJ
         R8iQqGetJQ16n+GfImmqr5qiLtoRFBoh+5dTH0Yo+wyBZKTfIJ9vTa9vRsGDBK0j6HE9
         QxeN3qd5GJJQR42LSC9+LhHEAu2abSG1b75t/D/xwndcL+CNzbs7nEHrMpXWd9di1ujo
         v9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=mOKHiePdlVhlno5ie5pDrbQHEPlO/eC6Zv3NO6pPid8=;
        b=azCOvHcjnKXfNCEWK3W3qxD8xeMgkUc4Aku4GB+R5e/o0ab5yrFbX3hRgc1kvtzKh5
         hRyAm1Yw4RSEpUjE8qdRufPtkeigJX6ytQhoXEjCosPf4T3x3jO0c/zjr4zFVu81aaLN
         pNtuGqAIt0QtOqpPQtwLU8ggXFYn4r9if2fmXOl4XV8fJbQs7/OZq7ICs0+wX0ifcjzc
         R7HdMH1MR6Uy5dFUzfq4VQfbS2yXfTlNdTo2j6B5i995s5KTbfMAtZaFIOYCSBNOcXJ+
         a5eDY6m0JWVoDaYCFknlBVEo+QkcunKgZ6xEFexGm2EdQBBYLvKkZg5F4V9NG6LMrjrB
         wGzA==
X-Gm-Message-State: AOAM5314gWmuRU1KBno9JvajSq6Kq7ZhOv4qozR80Em7kuo0kmeZps7H
        0wuK3Nph7SIh9VK+jqZ5nr4=
X-Google-Smtp-Source: ABdhPJwp4j8Tfd/udYmz9WV4R+JNEj4Lg19Ewgy7AwiS2umeezwwhGcGb/T7ochucA+gAvCTryaXBQ==
X-Received: by 2002:ae9:ddc2:: with SMTP id r185mr16084413qkf.107.1626542571924;
        Sat, 17 Jul 2021 10:22:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d4sm1703970qty.15.2021.07.17.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 10:22:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 17 Jul 2021 10:22:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 6/6] hwmon: axi-fan-control: support temperature vs
 pwm points
Message-ID: <20210717172249.GA158182@roeck-us.net>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-7-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708120111.519444-7-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 08, 2021 at 02:01:11PM +0200, Nuno Sá wrote:
> The HW has some predefined points where it will associate a PWM value.
> However some users might want to better set these points to their
> usecases. This patch exposes these points as pwm auto_points:
> 
>  * pwm1_auto_point1_temp: temperature threshold below which PWM should be
>    0%;
>  * pwm1_auto_point2_temp: temperature threshold above which PWM should be
>    25%;
>  * pwm1_auto_point3_temp: temperature threshold below which PWM should be
>    25%;
>  * pwm1_auto_point4_temp: temperature threshold above which PWM should be
>    50%;
>  * pwm1_auto_point5_temp: temperature threshold below which PWM should be
>    50%;
>  * pwm1_auto_point6_temp: temperature threshold above which PWM should be
>    75%;
>  * pwm1_auto_point7_temp: temperature threshold below which PWM should be
>    75%;
>  * pwm1_auto_point8_temp: temperature threshold above which PWM should be
>    100%;
> 

If I understand those correctly, half of those are really hysteresis points.
I think it would be better to express this with
	pwm1_auto_pointX_temp
	pwm1_auto_pointX_temp_hyst

where the hysteresis point is the temperature where the previous pwm value
is activated. In other words, change attribute names as follows:
    for 25%:
	pwm1_auto_point1_temp -> pwm1_auto_point1_temp_hyst
	pwm1_auto_point2_temp -> pwm1_auto_point1_temp
    for 50%:
	pwm1_auto_point3_temp -> pwm1_auto_point2_temp_hyst
	pwm1_auto_point4_temp -> pwm1_auto_point2_temp
    for 75%:
	pwm1_auto_point5_temp -> pwm1_auto_point3_temp_hyst
	pwm1_auto_point6_temp -> pwm1_auto_point3_temp
    for 100%:
	pwm1_auto_point7_temp -> pwm1_auto_point4_temp_hyst
	pwm1_auto_point8_temp -> pwm1_auto_point4_temp

Thanks,
Guenter
