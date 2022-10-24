Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24485FA3741
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Oct 2022 13:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJXNbo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Oct 2022 09:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbiJXNbC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2022 09:31:02 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBE9AE20C
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 05:34:02 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id n18so1042410qvt.11
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcQnpNrMCokOqxXnkt75dzs4Ohw6MxbO8Z8Y+5zQ3L0=;
        b=lsW78Y05ToEn2ezNMb5iKS1GK+yziVNItOS1OsuFjh06YNV50hRM5EbNW3X/9fxRej
         x+N81HdgWrdNeTNlQetNQ9oPCbReiDgYkicaMV61HvcMoqUveOBvAarP2zB+ZlM/b75M
         MuqooHMK2t6plQbSl3NK/SBgIfFOX6c9iQb6/pLxePx7ezGTvtugXqVMWgIDbSoAJYts
         e/Gujh15O0wOFlI8nO7dTFvav/96dH6tmx8WGHKl2g+owsk+WHliWl1DAADVamFJ3Lut
         E/nk3rF2r0vGaF88UcCthhI+8J92MfeGBTkc+I5ZqBKDHTyoPBQZpe8a7OxBVhpZ3uMP
         +ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcQnpNrMCokOqxXnkt75dzs4Ohw6MxbO8Z8Y+5zQ3L0=;
        b=59DY2hvsN/NB3FkLhgXEBNBhSMJjB+qyIVDpPPJZqzj2gJBuc5XWR8azvKPkkcXiuG
         z3h7HhgNJjTlP0BaIQJ6PG3giVc/2ZrlkNAkJwDAxoMaVN5eQXuU+gebXqvVU4mPA4qM
         XpO1jw1FQZY0hL8JD8k+rZjjJP4Vu15oWHL3P7sux387UgYHE5meyUNsxjKQ7a2FL/C2
         WpdTCGJ7dX/6su1m2Qt5mJM8xXUHjUd5dcPHsq/VgN+v0DkYy2qr/nSGyr1AOHkSpB8d
         gadIZR9ohXbudabChd3/YlUzaKaO8H+z8Wnuad47s/uiforhGLXV2DK+C01G3jzbT+zk
         r25g==
X-Gm-Message-State: ACrzQf0aL/ptQcSoIQF70D8kai0rgbAP73+3JFrafXjILC441Hup9sek
        1NGTqQwMSKuWOthC/fjC5KP7nw==
X-Google-Smtp-Source: AMsMyM4q59j1NCTZB29qs7JDeTz2KUourBJ2N7k/9TLfVV6zFdyoDAZWdY3ejaHW41bYP+9DswpqJQ==
X-Received: by 2002:a05:6214:301e:b0:4bb:734c:9e9a with SMTP id ke30-20020a056214301e00b004bb734c9e9amr3358856qvb.38.1666614701801;
        Mon, 24 Oct 2022 05:31:41 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q3-20020a05620a2a4300b006bb8b5b79efsm15140866qkp.129.2022.10.24.05.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:31:41 -0700 (PDT)
Message-ID: <68ef3154-3659-1730-34be-8b1bd538b784@linaro.org>
Date:   Mon, 24 Oct 2022 08:31:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 08/21] hwmon: remove s3c driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-8-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-8-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c adc driver was removed along with the s3c24xx platform, so the
> hwmon driver is orphaned and can be removed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

