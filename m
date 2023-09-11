Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF732EE57DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 06:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbjIKG0W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Sep 2023 02:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbjIKG0W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 02:26:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5BD100
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2023 23:26:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52e64bc7c10so5288569a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2023 23:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694413568; x=1695018368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=602xwMxmXuh7pmF89QMiFJmde3kiK+7O6M1QlBanRF4=;
        b=WQA8WO5Wj/Pz2uJXnchLwwk41f81pWfbMN59eDO4xDviZySGjjmrxpeQsEqavIHaaD
         7XfgP/Usoj9033kG15W3O/PFZBCmxmJ+4AYoShpgoAGNWKOblmqeOHkcFWemStqyW9Rr
         oGdZ5wv0dv3uoUN3hG//bsU54FCQfZ0KJ2puFRSQBw1JlRNIiopVoMDnVX/IELzaRExX
         eonafZoj6DldfCl9y+gspMzGASllw6v8yrI/v0wF3wNs+C+8IvTR9wFMS0YwAJbonjhk
         nVKMgh5aaHZJNju3r+tCKdBFLJSgLcNbauhF7QBaNprpLOlOdUAlcl805atGIO8XsBsf
         ynOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694413568; x=1695018368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=602xwMxmXuh7pmF89QMiFJmde3kiK+7O6M1QlBanRF4=;
        b=Pd6gYxYbpQtZWRQpUae6kPyfuaOcLoHZsO9c9xWL+u3EmnVSKxRyID401pYHj9XkSZ
         LfH5mjiiA7MW9+9LO2qqn3yvoE6HKZKlRYpYSOUr/1AlpN5Y5a9d7b/h+QKI9j9KNKZt
         r/2GaU0B2HnLDrQ1hsnoREOvEb3oXRcyj4PTuPLKKFAsle6LFqUQZnt45jMveAdaltzi
         w6JeKrDO2Pamo+APy9lTLjb3MUFuIbM1pm5B+g5U/ALsnFpX7i/xW9gkWVZ+wSjPk7CM
         mCgaFD0nd0famuDN9hJ9tBiMEMULqU3YJo5s7AoQL+kn5iUIDPS3gAdXwu9SnV/5MAEu
         AYng==
X-Gm-Message-State: AOJu0YymbjibgsYIMWPppKX49+3J/s041QrIuKKYvtnDQzWG5xYgXxao
        wIyIqiCHdfHbHfdrmf7T03YYtQ==
X-Google-Smtp-Source: AGHT+IGEC+tOirQCReCMY1VVEPGCqzzXXwp2ylU3JczCrMaopcxpe+paYOVVe47RO8jX2TctjEdeyQ==
X-Received: by 2002:a05:6402:31e6:b0:52e:d08f:af79 with SMTP id dy6-20020a05640231e600b0052ed08faf79mr7012458edb.41.1694413568582;
        Sun, 10 Sep 2023 23:26:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id p26-20020aa7d31a000000b005222c6fb512sm4185312edq.1.2023.09.10.23.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:26:08 -0700 (PDT)
Message-ID: <34ede760-d612-4628-17e6-600c133ee878@linaro.org>
Date:   Mon, 11 Sep 2023 08:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add mps,mpq2286
 power-management IC
To:     Saravanan Sekar <saravanan@linumiz.com>, sravanhome@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20230911034150.181880-1-saravanan@linumiz.com>
 <20230911034150.181880-3-saravanan@linumiz.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911034150.181880-3-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/09/2023 05:41, Saravanan Sekar wrote:
> Document mpq2286 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. It's: regulator: dt-bindings:

> ---
>  .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> new file mode 100644
> index 000000000000..d00d887870a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mps,mpq2286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power System MPQ2286 PMIC
> +
> +maintainers:
> +  - Saravanan Sekar <saravanan@linumiz.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mpq2286
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +
> +    properties:
> +      "buck0":

You did not test it... Sigh. Anyway, there is no need for entire
regulators node for one regulator. Can the device do anything else than
being a regulator?

Best regards,
Krzysztof

