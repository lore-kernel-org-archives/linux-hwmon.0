Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385B5C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 14:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiK2OKg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 09:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbiK2OKP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 09:10:15 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077DE5DB8D
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:10:04 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a7so17258060ljq.12
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqVtLXiq1FYLM+aSPqIKQjsXuT+N9Rkyh7hQ+06pZLY=;
        b=ImBAr+UZq1NssjtUCaT5+KglRkfc2ennR/CTDF0EEDD+7vb4XjJ3daiFuxAIh1bWJk
         S0lzrM6ZxlOtfJcAhIJUscNV2WYpjtGZ59FtnKZ+QHyHPyNm88qSzfLobJMgxKL5awo1
         mpCOG9wJkV8/8wH+g3PttseDFPi9Qs1r9/wT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqVtLXiq1FYLM+aSPqIKQjsXuT+N9Rkyh7hQ+06pZLY=;
        b=7XoNF9+CtCEjNqE83oIwBl/PXx1eUYkt0DkyAWVORk0ZpjoHMhryb0cfvvFWhemfWU
         DNQgcOYLrepsszQ+bEKX+OkZhfx17f6WNUMjKSc2aFJvQjObAqEkPZiteYvhcZJijhBW
         4zs4XtrnjtPbx97rV3Xj8lAcWXIq0nKzSsAqBKEfAzTzOoos3Hv+Zw7NM2k5U39b5fcT
         WyZ3aFvG358NE1nebfgQlhzmwuYffdKeeotkdzx4NG7t/xXRN/i63NsBdiZUkQQQCdg0
         BXIepbihVuA6ZboC30AN5Nx3Wmy9tzfb6gxQFSYU2KmbbKip/qfE3xR4ha6n0gl1PqnG
         VcBw==
X-Gm-Message-State: ANoB5pnGbfwA2e5NVM0W1fvp12MoKvHfimLwd44h3kmd8oE2C86XFhKI
        i7ZfIH1C3AHgVkcb+T9UI9feqw==
X-Google-Smtp-Source: AA0mqf4ZQckfrXPfumRjMm60OiOaK0PiYODF7ceASbWqXiI3Cb6b2jZNnnbTKUbmWkk4G+ULoTOS/Q==
X-Received: by 2002:a19:f610:0:b0:4b4:a536:f866 with SMTP id x16-20020a19f610000000b004b4a536f866mr17711021lfe.262.1669731002387;
        Tue, 29 Nov 2022 06:10:02 -0800 (PST)
Received: from [172.21.3.193] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id y1-20020a056512044100b004b4bb6286d8sm2233675lfk.84.2022.11.29.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:10:01 -0800 (PST)
Message-ID: <a004a051-2f63-b5a4-bf7b-925850f1f718@rasmusvillemoes.dk>
Date:   Tue, 29 Nov 2022 15:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/5] rtc: isl12022: Get rid of unneeded private struct
 isl12022
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, da
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 15.18, Andy Shevchenko wrote:
> First of all, the struct rtc_device pointer is kept in the managed
> resources, no need to keep it outside (no users in the driver).
> 
> Second, replace private struct isl12022 with a regmap.

Nice simplification.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

