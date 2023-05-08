Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B068FC7EE22
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 May 2023 09:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbjEHJBk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 May 2023 05:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbjEHJA7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 May 2023 05:00:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0C0171A
        for <linux-hwmon@vger.kernel.org>; Mon,  8 May 2023 02:00:36 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-965d73eb65fso601608266b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 08 May 2023 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536415; x=1686128415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZK4HXU+j2dP/a9t3IMfCPc5nhez1B0OHSKgYXQ0vJI=;
        b=paJcSMDXBxw/b9+X9ALSXZ35DpzalJ10w4uWRfTSsr+wuwv54FU9A8X4xw5ffWW1Jp
         hY5nqafL5x6tVhOO28qkYVy94GMY+DBOLziwlO12YUDsElKPmOJjElI5YaOo1gw1Cp+2
         dloSS4uCbUSaZ5riyyxZX5F4SkU05eBMLMJYqpurcyq61vYAZHFR3keCg4KRiJm3Vg2s
         oqzDOZQa9lrt75OeeVay5li22isi0TUyO5SCHTa7mkXSBCWmSzNmvlazh/68SfajyCOh
         8h9XiRwBRIjEytRgzIuSTPb7570jHicewnL4JGfXcePPGZIrrBMbsP2IJxY4azyIqSqQ
         Xs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536415; x=1686128415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZK4HXU+j2dP/a9t3IMfCPc5nhez1B0OHSKgYXQ0vJI=;
        b=iDaWsNxpNEPQC0GBTx2I3t5T9wMF+x7Goex69CevCJCeheEz8NvexkGjisMvhCUiWt
         OKsxhF3qhOoWjvvxoN4ZjStFqxTJPpjkgSiFS3vUg/o3OUmMWBcWhEFvepcF+zGlcRHL
         ylNi0ynqXD6hJPWgfcylY8alD3VuJeiQB+GJLVJEYDTwdd1zH0WXBXsM7bTnikAZQaWy
         O+m9w2yBcrQlx4KkRsHgc7pkJtRYpEEcfZCaBUaMLco21mL/LTNiVjFBIFjBamlfZ322
         9PRO/dXqe554VpmwyFDlf0eLerGoWsbfwscf2vE2aztt8WFe8WFBjfDkUSYgTtdewccU
         N+vQ==
X-Gm-Message-State: AC+VfDw6BCTq3EQQv7MDImhB3yWjgCAsUpZ7ZSbCllaAgzHLWbCzGXzO
        Il/RAB+lnDfHub7QY9JwX2yD/Q==
X-Google-Smtp-Source: ACHHUZ6WZKuGaVzlSS+2SCWz23y4bxXqR/Q/LG/FYevd+yIv81CV9MJsXYDKhfnV+ww6rEfbvb1cCQ==
X-Received: by 2002:a17:907:6e0b:b0:949:5db4:7888 with SMTP id sd11-20020a1709076e0b00b009495db47888mr9222849ejc.27.1683536415023;
        Mon, 08 May 2023 02:00:15 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     zbr@ioremap.net, jdelvare@suse.com, linux@roeck-us.net,
        Liang He <windhl@126.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] drivers: w1: Add missing of_node_put() in w1.c
Date:   Mon,  8 May 2023 10:59:47 +0200
Message-Id: <168353638587.78189.13850750261340939366.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615125105.3966317-1-windhl@126.com>
References: <20220615125105.3966317-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Wed, 15 Jun 2022 20:51:05 +0800, Liang He wrote:
> In __w1_attach_slave_device, we really need not to use of_node_put
> in normal path as the reference is escaped by sl. However, we need
> of_node_put in the fail path before put_device.
> 
> 

Applied, thanks!

[1/1] drivers: w1: Add missing of_node_put() in w1.c
      https://git.kernel.org/krzk/linux-w1/c/51cbbcd6469b2a32e222ec220039af20a16f2769

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
