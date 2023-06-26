Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B697DEB64DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 07:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjFZHgv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjFZHgs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 03:36:48 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C925AA
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 00:36:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d9bf5411aso550663a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687765005; x=1690357005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g32nP1QLfDJeYDMctwmCGM9lFurdMtNiOQvgUHmW7j4=;
        b=t+edhplh/zMSi0p3lIjlGet/TZI20VTCuGlHDId4JMBSXoEIAsIJokUNoFSdsoY6So
         uDoddZZ5HCc+4sxK6A6duuXzb1KdyomjPtmINErHzNABwk3PMCb6rjOx3Sqb9oXvHrG5
         StR7eTLuySakEs4UbfeXEOUyXObHJSKnxyfwtyXSxOxkqpt+t/0M1I8yRXGuKyUdQEPh
         bOF6zQDS9Cas77cSjCvMbThO5zdvy/CilRombhJ0A5Ndf4M+3W88nBaYDtHCvgQOIWEj
         xB6Kc3/xTh2B/YiKECd2K99AzyU8WdVP/wFnMQfR0dF4vvoAzXiiBVwO0j9PJQ5FPb7N
         /1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687765005; x=1690357005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g32nP1QLfDJeYDMctwmCGM9lFurdMtNiOQvgUHmW7j4=;
        b=am6/5jsDECNY8nhIRDtOK6va685JsmEEglYRjq6zuNRJTVG2YDEWNE/3UsCgEkVBCN
         /Y0Z1QU705tuWX7i9jEzIuAn7mrMRvK8IPOZfZG+yJeaRlSUP6wLVuyhv8knwYM3OGNV
         zKEYlpLnPWbj3tHoE84VLYyzKkVNMUmnD/bmH/FWbOi7jU2BzEdjMUQb47sqNyytZSEr
         6Iy2mxF+QgC1IYtcJWz05cR2YwDs1m0r68uyP4Jxqq6/IwZ0EOUAEctPd0S/c/YDYiw3
         FpQXhLopzbyxPkhK6YOlylbs0y//1faFvowWwiIjJA76wqjvsAnuX14AnGN0q8jm2cGO
         fBjQ==
X-Gm-Message-State: AC+VfDwaXEBnX4Y+dXEbGHPEOwzoPS7iQcpjYiUfLjTxbHtz0vtKsaDl
        KKRuYQBrICmT3FzXS0SfGiJdjQ==
X-Google-Smtp-Source: ACHHUZ48yMwg7cIFAuy5JolwNOf5XDoT9UCulIRCuSVDeD0QgeXytMtaWsMR7rKPSIlKf9bngOQExw==
X-Received: by 2002:aa7:d9d7:0:b0:51d:914a:9f43 with SMTP id v23-20020aa7d9d7000000b0051d914a9f43mr2896633eds.36.1687765005473;
        Mon, 26 Jun 2023 00:36:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c3c4000000b0051879e2505bsm2511680edr.40.2023.06.26.00.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 00:36:44 -0700 (PDT)
Message-ID: <326cc8a4-3366-e8af-8051-7284bfb6dfaa@linaro.org>
Date:   Mon, 26 Jun 2023 09:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/3] dt-bindings: hwmon: add sht3x devicetree binding
To:     JuenKit_Yip@hotmail.com, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
 <DB4PR10MB6261859DA1087597DDC3CCB39226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB4PR10MB6261859DA1087597DDC3CCB39226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/06/2023 09:29, JuenKit_Yip@hotmail.com wrote:
> From: JuenKit Yip <JuenKit_Yip@hotmail.com>
> 
> add sht3x devicetree binding files
> 
> Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
> ---
> v1:
>   - fix semantics error

How first release can have already fixes? Against what? Is it truly v1?

What is a "semantics error"?

A nit, subject: drop second/last, redundant "devicetree binding". The
"dt-bindings" prefix is already stating that these are bindings.


> 
>  .../bindings/hwmon/sensirion,sht3x.yaml       | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
> new file mode 100644
> index 000000000000..71a50bd57af2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sensirion SHT3x-DIS humidity and temperature sensor
> +
> +maintainers:
> +  - JuenKit Yip <JuenKit_Yip@hotmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,sht3x

The actual devices are SHT30, 31 and 35. I understand they don't differ
in programming interface, but still don't use wildcard, so just
sensirion,sht30

> +      - sensirion,sts3x

Similarly - no wildcards.

Missing blank line.


> +  reg:
> +    maxItems: 1

Missing vdd-supply (required) and reset-gpios (optional).

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +


Best regards,
Krzysztof

