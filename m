Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07B6E810A8
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 08:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjI0Ivj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjI0Ivb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 04:51:31 -0400
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469EDCC
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 01:51:27 -0700 (PDT)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
        by cmsmtp with ESMTP
        id lDGfqFyGjWU1clQGUqy20o; Wed, 27 Sep 2023 08:51:26 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id lQGRqPL5RdXaPlQGSqwuwx; Wed, 27 Sep 2023 08:51:25 +0000
X-Authority-Analysis: v=2.4 cv=MYx/Brzf c=1 sm=1 tr=0 ts=6513ed0d
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=yavEzJRY2FWF_nJvOSQA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M9VEvHlh/5eXS2fMMAkgKAXat1fK2p6GGIa7Kd/YbXc=; b=m4T2V4oeTdcLV47JDy/L13rjtb
        Jd/JJwEom5sT729peMDrBxgYeCKdIDmjDqZobfXlhKfOKRUq0dj6gz7lxqIIs4+0FMosW4QI6qU+M
        RUXvWFHn3572K2Tb5/PdrQeyLHwa2us06LVAmJcEqZUI4Zbr7LEYHIjCPBd5hk5bjspWs07Rl59TM
        vNd+1cyF6oyvBYNyg7VpI0CuXPbAKX5tKC8BNwpKmeHf8uUnLrIzzKcgowOmO4d4qy1xahd5F3F1h
        R2frv3Xbm69MG81ny4uxEv3A1JkEKmRfWRw3o7GsGZYSa/07bHMi4AQXmmUoVT0q/qktHT3Sfctxs
        HTNyTIIw==;
Received: from [103.163.95.214] (port=59794 helo=[192.168.1.101])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qlQGO-001Mr8-2z;
        Wed, 27 Sep 2023 14:21:20 +0530
Message-ID: <358f7d3c-42d1-6405-0013-997deb974ce3@linumiz.com>
Date:   Wed, 27 Sep 2023 14:21:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings: Add mps,mpq2286
 power-management IC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        lgirdwood@gmail.com, conor+dt@kernel.org, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, broonie@kernel.org,
        sravanhome@gmail.com, robh+dt@kernel.org, jdelvare@suse.com
References: <20230927033953.1503440-1-saravanan@linumiz.com>
 <20230927033953.1503440-3-saravanan@linumiz.com>
 <a1a50fb2-ddc6-4f85-9369-19b4c6c3bcd6@linaro.org>
Content-Language: en-US
From:   Saravanan Sekar <saravanan@linumiz.com>
In-Reply-To: <a1a50fb2-ddc6-4f85-9369-19b4c6c3bcd6@linaro.org>
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
X-Exim-ID: 1qlQGO-001Mr8-2z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.101]) [103.163.95.214]:59794
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 5
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKVCx7XfItzAEqyURACaa/2t2wnw3NB2LhHIC9U76On6MoOjT2I4IMNV7JPN5pW2GTKcOqskApiM7PU9zVJiU00WH141J6LORwV9x45AqlbM+Txt6qpf
 5XLLddrFonDjr8QEsMvhm81o6zwBQ7tB21TKtiLE13mVlcEDUZgqgLZm0Sez20kTL+FWaJ0Mvzb1eKRZHg8Xw57WqrpeFOoDrrg=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 27/09/23 13:36, Krzysztof Kozlowski wrote:
> On 27/09/2023 05:39, Saravanan Sekar wrote:
>> Document mpq2286 power-management IC
>>
>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>> ---
>>   .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>> new file mode 100644
>> index 000000000000..594b929fe4b8
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
>> +      buck0:
> 
> If you have just one buck, it should be "buck".
> 

As replied in v1 review comments, other chipset has multiple regulator 
so buck0 used to keep the driver common

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Thanks,
Saravanan
