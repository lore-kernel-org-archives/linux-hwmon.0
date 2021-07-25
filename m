Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2F0C4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 21:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FBDF60231
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 21:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhGYU4b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhGYU4a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jul 2021 16:56:30 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572C4C061757
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 14:36:59 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id d17so4109846qvn.13
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GWUQ0fckLy2ZE5UqfxdFyP7HRQWXas6YvoyLXmwlqkY=;
        b=cRZocdt7tpNiYF31/zFKBOicoXUmFLQpngFNCeWn+TVFENpjFrRN/lW0DNN8I/pLLM
         0qj/cFRlXqRPwFMgSv8Stv+6OgC9anlgt2rR07V1GbZNEc/PsjqD1K7IjUesDbbReNUV
         VuBdp/BmSYXHs8bZATZaRulQoGfxdMJOUUZM6mMy43ocFiY7nHpdFFyT+PaPtC4YcrtN
         LjrB6fUySYnltVxtC4xYROny7012+wOWza2QBVw5xpvgIkT89ESW8rMHBcAu5D0MXI2X
         /AltvdTF49whBYrgFeHJZXWvYjxIn6oGES1aHe8qZpLOJ++GTX7hpFQ9iZqE2yE5CIt5
         GWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GWUQ0fckLy2ZE5UqfxdFyP7HRQWXas6YvoyLXmwlqkY=;
        b=QMmyACprij/p+amvNpGjyuTZRCe2L9O7R8uB5sP1IrYUvxTHPzBxSCGPgSgIjfqPYt
         YYredkpZJv/KCBmvRQt2NrdDByThY+vmbpOUF8lVGxluWxxehkrHfvNuWpewdo/m+aqy
         O+CiPOv27QbXdDKjq2zT8fJ4EEJHiwgGSRSau4Tik2beB8TVA0sqjeH4ES7TP6p7tnpy
         ij32FFriuHt8XcpL9OdmCfrFwFZtjFc5t0MPdCNNxP+2Dd32r+2TWZSi0JWF+YVAEI00
         UzT8mBPh2NxReTbXdtLq2nFT9CyebR3aAPxHVnLRAbErm9CHf0SrQoqkFsrvyv/Vcwlw
         hNQg==
X-Gm-Message-State: AOAM5302rGzkBcy4TbaxW8bpXMZ2k6L99P6IOT7LOjjWQyleOz5ud3mr
        3J55xOwrrZV+/d/oWZw2+fc=
X-Google-Smtp-Source: ABdhPJyg4u9kSPNigvzUJ4cca6HLxligipmCvCfj8zqLnteZpZ0C6FpAriQc0t5GTTFXTHK2w4NdOA==
X-Received: by 2002:a0c:d68f:: with SMTP id k15mr14954869qvi.14.1627249018515;
        Sun, 25 Jul 2021 14:36:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i67sm18166011qkd.90.2021.07.25.14.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 14:36:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver
 bindings
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Cc:     Akshay Gupta <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
 <20210720055737.8666-3-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a56d3b58-06cf-6d4e-0858-31d658746396@roeck-us.net>
Date:   Sun, 25 Jul 2021 14:36:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720055737.8666-3-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/19/21 10:57 PM, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> - Document device tree bindings for AMD SB-RMI emulated service.
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Devicetree files need to be approved by a dt maintainer.
They can't do that if they are not copied on devicetree patches.

Guenter

> ---
> Changes since v2:
> None
> 
>   .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> new file mode 100644
> index 000000000000..7598b083979c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/amd,sbrmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: >
> +  Sideband Remote Management Interface (SB-RMI) compliant
> +  AMD SoC power device.
> +
> +maintainers:
> +  - Akshay Gupta <Akshay.Gupta@amd.com>
> +
> +description: |
> +  SB Remote Management Interface (SB-RMI) is an SMBus compatible
> +  interface that reports AMD SoC's Power (normalized Power) using,
> +  Mailbox Service Request and resembles a typical 8-pin remote power
> +  sensor's I2C interface to BMC. The power attributes in hwmon
> +  reports power in microwatts.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amd,sbrmi
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C bus address of the device as specified in Section SBI SMBus Address
> +      of the SoC register reference. The SB-RMI address is normally 78h for
> +      socket 0 and 70h for socket 1, but it could vary based on hardware
> +      address select pins.
> +      \[open source SoC register reference\]
> +        https://www.amd.com/en/support/tech-docs?keyword=55898
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sbrmi@3c {
> +                compatible = "amd,sbrmi";
> +                reg = <0x3c>;
> +        };
> +    };
> +...
> 

