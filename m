Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2515C77B75
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 May 2023 10:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbjEHKRO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 May 2023 06:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbjEHKRF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 May 2023 06:17:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E908A37E49
        for <linux-hwmon@vger.kernel.org>; Mon,  8 May 2023 03:17:02 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so47165874a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 08 May 2023 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683541021; x=1686133021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eamanx1KJACdi9DNwbkhTPL5GyLPrO4Q5CTX3PDzSSs=;
        b=rDoVVgj6g8dGQBKtiiG3TjrN0RNNMQjrIE7ntP2QQtrB65Ank2DLy/tE6JYNs6H8kp
         rwrZDDXpKcb/GH+g7Sb09KV1kDhleUT5H+ly1tA43sQPqT8hVCOqXzLoHUlKWMKhfps2
         t1BuZM3gI3g+DBgWrmw883A71ht7xOcUzB8xJH1WoNNBTRVh/XUcuiPbo4SIYqbxjzZ/
         i9h1s5uOG+2j8E9s/wjHPd1GOE8U2oewKlGsQPO2kncy8Cdpv0qBtBM1dZLxcBpxLqM5
         C8gDmw2JJ5f5s3fXu+Q3XcoFg0O7/wFVZ8T6sCGKWc1VLrW744UNXENCVXqBhlvAXwLF
         caYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541021; x=1686133021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eamanx1KJACdi9DNwbkhTPL5GyLPrO4Q5CTX3PDzSSs=;
        b=ib/VJJioBxwvi/AUcD/+wx7Fgad8ug3Sofu1dRYNexDKucTIsoePDRe1Eg03zAWVbg
         WYDofu52frjoKWl8b2lRMZ/bjjahgey95ucwqrSy0T3rhtD3Ik3KbUdxaCfoE/N0r/xp
         nwvj5TlW3XMaGaYcgnW+wJ6PQyFeBbHWQ0RwYzFQ94J4nwwkVLhO8YF296JlBmOgQ9/f
         IRqDQZv1h8k3mQYynyAbxBNk7AKEbj7SXLUet5GuSJlZeLrfBI6/bvQW2kMIIpxTCO0u
         aQF2jXIo37Gf3W2c+D56UHM+TifQi1RsOPWWmD/H4JCQHaPf/N2KqzEEFtqDt1I0xQwd
         7aUg==
X-Gm-Message-State: AC+VfDya/ThRCQwfa65ta/khKc/7isC7QeQCNIAUYG8kTOr4TRZU8zQ7
        PSvwrzfLHz7LFwTXpiWv+kiIyg==
X-Google-Smtp-Source: ACHHUZ4jVt9VSalC7+i2XLrKfdFmg8jK8keTNZboYumyjsjfOk86hmqKeMTjK1DfTxI0coxKgG71gQ==
X-Received: by 2002:a17:907:3d89:b0:94e:4285:390c with SMTP id he9-20020a1709073d8900b0094e4285390cmr8508706ejc.10.1683541021035;
        Mon, 08 May 2023 03:17:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz28-20020a17090775fc00b0094ee3e4c934sm4775251ejc.221.2023.05.08.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 03:17:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] w1: therm: constify pointers to hwmon_channel_info
Date:   Mon,  8 May 2023 12:16:57 +0200
Message-Id: <168354101435.103686.11373365810956263515.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>
References: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Fri, 07 Apr 2023 17:01:21 +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
> 
> 

Applied, thanks!

[1/1] w1: therm: constify pointers to hwmon_channel_info
      https://git.kernel.org/krzk/linux-w1/c/0df2a5e99d0cb10a3da93fd71dd6753af5adc79f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
