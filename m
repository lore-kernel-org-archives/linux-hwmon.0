Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3429AEE801F
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 07:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbjIKHM4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Sep 2023 03:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbjIKHMy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 03:12:54 -0400
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5A2CE8
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2023 00:12:42 -0700 (PDT)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
        by cmsmtp with ESMTP
        id fZpHqBfbyez0Cfb5oqQS5M; Mon, 11 Sep 2023 07:12:20 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id fb66qDHhFchuBfb68qxblg; Mon, 11 Sep 2023 07:12:41 +0000
X-Authority-Analysis: v=2.4 cv=QYx1A+Xv c=1 sm=1 tr=0 ts=64febde9
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8
 a=gEfo2CItAAAA:8 a=6mVVujuaWLD2RSIlgPwA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=sptkURWiP4Gy88Gu7hUp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QwK69sTp47zzTxJYCYeDtYYJkekjiU87kUvd/a6irY0=; b=FK8SkZGaN1qDF2eagOyHMzuz7q
        0zemE53JshI4zJKlOwsaKtJzgHHMzUTgDTUZqTF9C9UmF+Lz5ANZaFfa3JjhDE5Cmc7QywK5OC/Sb
        uM0zkzQBOohF0GNAWJ/UtnoBjpH+sFfBkww3QIc7aAKCB5bMec0Rsgt7hv/vGq+Q1w1FqWCOwfpCQ
        fmCRtIqoNkhuijNIdTP4XRmaGushDzvS1IT4gsYE61dKo8WyXrXJVxmgB5M6b/BggWhlziJuBDjJb
        N1d9jjkVyPKb25ZFFehA1fS6fuFP17fLP2jS/C++Cz6GYWUh6sbkxsls4EvP6lhjshurJRvDUl7Qk
        wYu+2fHA==;
Received: from [103.163.95.214] (port=49564 helo=[192.168.1.105])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qfb61-001Jaz-1T;
        Mon, 11 Sep 2023 12:42:33 +0530
Message-ID: <d7eb272e-8abb-c307-4aa8-b0af3f943453@linumiz.com>
Date:   Mon, 11 Sep 2023 12:42:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add mps,mpq2286
 power-management IC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20230911034150.181880-1-saravanan@linumiz.com>
 <20230911034150.181880-3-saravanan@linumiz.com>
 <34ede760-d612-4628-17e6-600c133ee878@linaro.org>
Content-Language: en-US
From:   Saravanan Sekar <saravanan@linumiz.com>
In-Reply-To: <34ede760-d612-4628-17e6-600c133ee878@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.163.95.214
X-Source-L: No
X-Exim-ID: 1qfb61-001Jaz-1T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.105]) [103.163.95.214]:49564
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 1
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfENgQLmKrisB2rcdRSLm72TuWGTzkG6gEVTjyBnjWTHMZO+iH+RgybR4JmXQ4fWlyx/Rr5SFLg2CfHkNEx705kUJpxbU/NML2mLUTTRkwlt3q76cKw7o
 g+kdgjVn8t2c0WdJclZlWT6XUkA0iiSaQtUaURimu+XffQYAzLvoToIKHIs+xDcXn0X27FXbMP1UWquP03PFGc1LqpYWFaPQYLI=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/09/23 11:56, Krzysztof Kozlowski wrote:
> On 11/09/2023 05:41, Saravanan Sekar wrote:
>> Document mpq2286 power-management IC
>>
>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. It's: regulator: dt-bindings:

Thanks for your time to review. git log has mix of "regulator: 
dt-bindings" and "dt-bindings: regualtor". I had referred my own 
accepted driver regulator/mps,mpq7932.yaml

> 
>> ---
>>   .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>> new file mode 100644
>> index 000000000000..d00d887870a9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mps,mpq2286.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Monolithic Power System MPQ2286 PMIC
>> +
>> +maintainers:
>> +  - Saravanan Sekar <saravanan@linumiz.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mps,mpq2286
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +
>> +    properties:
>> +      "buck0":
> 
> You did not test it... Sigh. Anyway, there is no need for entire
> regulators node for one regulator. Can the device do anything else than
> being a regulator?
> 

I tested it, but documentation is not updated with test findings (buck0).

Other chipset has multiple regulator so dts has regulators node to keep 
the driver common

Primarily device is a regulator with pmbus capability like fault status 
(OV,OC, VIN, VOUT, Power good status), temperature status.

> Best regards,
> Krzysztof
>
Thanks,
Saravanan


