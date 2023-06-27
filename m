Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE7CEB64D7
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 00:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjF0A3l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 20:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjF0A3k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 20:29:40 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2036.outbound.protection.outlook.com [40.92.89.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED911704;
        Mon, 26 Jun 2023 17:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W09i1P5yboVwGVmR/MYFa56C1E1tTLYxOBCasiDILUC39l40HVUhE5AEPVc2vZ3Uc4ks9v5EGF/tLQmGmhQ6A4OoraqsjPnXmVyQSv1th6kGvHLRWZBwcq1h2L8qEHs6S9up0OhdPDduaO7bBzrN74YExtg50lbA3IzuRolOl8QjxuV+p8d27ze2mQ9WPtw9c1/ORj6nfWtpbICOJoXc15JoMMn5OjWtNzfxmcDtJgcMh22pjfrIBh7UxmFuP2PotNiFP11bWju8NmbOeNxkm9a4JJcZEghVh1JAYOxgNdLobtL5YYUbDunGuxnS7h3o1VnD9Cj17tS5hhZtpBAsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zRfAqj5RqwfKWXgmdWTfy/6ePV+37hlDFBC1xCk0Dg=;
 b=fnQPXJ4N6NL4/2Gfen/TFCyi/vrmVQUM9VTGnWB50JUn+5et6dG1NclaPD+7iMScsrmIj1is/xycsNFjEXTDIwbwF+Ux31NsMM5MV9vH86LkJcbCR0MH3KYZDGMNm0eHdjGJZ3ps5H3SEH4/229P3J5ikgwcJ+gEhOsfBl3VljFIzkpHazPfZ0aPFONtA5VSYL/e5+GTo0vB0fqywoRcXHK6woewgvIyQdPeBWz5xCyLCVjoQ4Bom9D8KR/JQpbj90Uwk8H4lELFEu5P+QptTAZAUMmtVqsSocrBeJcDfvpfU6wN7INSJ99EtQUQoyaeNYrm7erSTGsGZ9zXLNjomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zRfAqj5RqwfKWXgmdWTfy/6ePV+37hlDFBC1xCk0Dg=;
 b=d5M7Xae3pyjZX4uwJaxTklxbjUeby/sP6e0Ctiz4gBOI2SFyXuSS575L6mktoHrScIUIrRKGuRx35q9gXFydVk5GVNb9mfn0FIczeDr+JbX2rXYImTjShSTXHRysNfx3fmNHEdckAiskc92lrF39QgzDO58PmL2im2oTddC5glgvvLOZVCkjcQoUR++N8Ez7rLZrHypWONwu3qMAHXGijkk9tGcQTaCCq2Wk+GscLZLboR1kcJI+a2kpNsG3sJyuxhN3ddFv8R1LM1MgSZLsZ1t3qErMuAoIuA2fcb+gDO2/FzZUFmdpiDUjs2YpXvELoUD0gLKRA8NmUAr/d5PDIA==
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::21)
 by AS5PR10MB8241.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:67e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 00:29:37 +0000
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88]) by DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 00:29:37 +0000
Message-ID: <DB4PR10MB62610826B15E48C2CA2F51779227A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Date:   Tue, 27 Jun 2023 08:29:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/3] dt-bindings: hwmon: add sht3x devicetree binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
 <DB4PR10MB6261859DA1087597DDC3CCB39226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
 <326cc8a4-3366-e8af-8051-7284bfb6dfaa@linaro.org>
From:   JuenKit Yip <JuenKit_Yip@hotmail.com>
In-Reply-To: <326cc8a4-3366-e8af-8051-7284bfb6dfaa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN:  [WdiFl0MbJkUWe/FtaYi1YG1bzyQmv+ar]
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:383::21)
X-Microsoft-Original-Message-ID: <1ed0351c-a79f-ee6c-80d8-44dad2b515de@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR10MB6261:EE_|AS5PR10MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 39723197-0708-424e-3471-08db76a59673
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7jaEASexIyK5hwetipf5si+pYaKefKQQyAwGt6UrpwXy1s0fUwQO5r9+SZu5FFvWBaLeZTMuLn/N+8MeZ6m+jGaRHjL7yPMeiAlqe3mtxz35UhmnQClXnv7dWfiheJu2slSjBE3sy0yGlZ8jkYXR/Ll0iTC9ifXxN1A8vWHg53DL+mlw1gDAYF4XBWNXmhKVCUUCvX5iPiL5pfPdzvmdCkQSD6Tje46vd1OhbRjDMwl5jk8PXGhXkoJ58mqEfByDfVbYJRURxlehHKZDOla//pzpdufDW396WXM1Oh4t2lHak0a7qYuz/wN+U9jEQiiDAkYkCAApwq5Z9MevE5CF0XM+7VKsahgmw3wjuUHGrwDrc0bkB1bob6w8ce062fml1/o3rlUFeTkNEfvwSv81ehZg7F/5gJFtUXXCbQEVnWQNg4VMnwORJE8CMN87zw9zWgQXS3bAMofh09xk2+sYAGA1ODzSvCPR8L4/RA6ECiQEA77UJWs6INCGVpA9BrkVwm+0tnIbxhPD+IIIJnGdrwundIRB2iSPFUpbqmjNFdhuEjNgyAr7lBuqxhbzb5jQn5m98xsVaB8+nRG6phtrQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBtSzEvN3lXYzB0OVptaitQcGhkSjRJSWJoczBqcE1WU3JuYjh4S0hMNU4v?=
 =?utf-8?B?ZTRhWmtkR3VmMXNERXFTLzZzR2pZdlZEd2Z4Vk1QZVZPTlozTjlwUFkrUTRC?=
 =?utf-8?B?VHl5WjJqR0tWY2ZCTlRCQkxBUFBQK3haYXk0Ky9HaTlobUNTUmNaTDIweFJZ?=
 =?utf-8?B?cHQxUHBpT01lOGVGQW9lN2xLYVVMcDFUSUNrZWR4am5Ja0hQRXkrODBoTWpN?=
 =?utf-8?B?M3RaSnkrcENCNXd2Z0xxOXpqek9QOUV4djIxbzVaeTBGUHZrcUo4WS9odDNy?=
 =?utf-8?B?S2RpMjBZMFlPT0krd0J2aXVNcVF2WUZmS2NRWUdHMnB4VUQzWVJpTUFtbkNm?=
 =?utf-8?B?QklsZ3lPSkFpeUR0SkswRUcydjQ5Zm96eHZmQkU3QXJBd1VWU3pSQlRneWsw?=
 =?utf-8?B?bUhxSkFDc05OdVVUMXA1UVZqd0J4cmhIVnplSm0rQ1h1b3krUjJiTFlPd3VT?=
 =?utf-8?B?YzZLSWhjMFFIU3pxSnZzMXZLMkRkbDVtUTJJQ1ozbVRNeFJ4ZEVVMk1jR2Ex?=
 =?utf-8?B?TFFCM3FtSDBXQ3FZOVJnSUpuazZHc1NRSHNaUzQ4ZnorblZVcVQvSmNPTlVl?=
 =?utf-8?B?cVdoYVUrM3R5ZmpIOGlZcWRpWmRlUG5zcGczOVlkVkd4dmxnbS9JQ1kyeis3?=
 =?utf-8?B?NGVoK3FOalhsdWlFanZ2MlVBeHhobkFmRGxaZmFmK3BXT0l5THpFUmJCd0ox?=
 =?utf-8?B?NUtuSXc3OHcraVhPK0crcTA1dG5lcTVTQnlxc0NhWDJHOFlZSU8vU1JyVWFO?=
 =?utf-8?B?QlB6NnVnUHhRbFB1Q0ovY1lQTHc5dDU2M2VWTDQ5cEErNkJ1bEhYZmdEalUr?=
 =?utf-8?B?b05DbDd5RFBqc0czQlMya0ZNMlcxc0VUeWJITkNwSVFUbWIvNjNOcVErT2Iy?=
 =?utf-8?B?bUUzcTR6THp4a0J6ckpJR0tLT3BIZWd1TWNobDNJZDJ0NHlHK0hXazFvUUk2?=
 =?utf-8?B?T1duc1NkdnQ4NHVlVnZSOXlZdWxLbHVhYlYrOGh0U2RsaWVxZGFSVlZnenZq?=
 =?utf-8?B?cmpWbFI3aFo0YkNpcmhOSDdpK0JNb0RuRFM2YmRTNXNuYlpqdmJCVHhBUWtp?=
 =?utf-8?B?bkpRR0pQSEVYU3pGT0xsZnFPR29HSG1lVStTZ2lockJFMkZZOHRmbXpYNi80?=
 =?utf-8?B?T0NyVnNoT0JPRjViS1F1dFFMUHlQSFd3SWJ1R01mdjB6YWlYR1k3NkFHZzV0?=
 =?utf-8?B?cHlNY1Z2RjdpQVZ5OTdYRStKRENVUk9lQW4wak52anZ2M2ZuQTFSdStxUHli?=
 =?utf-8?B?dXprMjNkQ05GOFByT3E1OWxGYnZaNmwvdnBJbE0za1pqTnB2TkRoMDBTM203?=
 =?utf-8?B?QWhhMm1IY1N4ajhOWTYzYzhvU05ZVmtzVm1VamtWK3AwZFM0Y1kwYWZSVXN5?=
 =?utf-8?B?Sk1RaDA2Vm92b0taYXhBUnZNTlhRNUs4YlRaK1NZcllDTCtueU5KblVxeWFa?=
 =?utf-8?B?ODUrb0NaMFp2RDIwdG0xcWtDa2YvRkhUdU9nSjdoOENaSDlXWnJ4NTI5NTdv?=
 =?utf-8?B?OGxYUXhVY3hqZVl1cUlZd3ZRR2NmcHhQTDIxdFc1SkppVWVqZnViR1hYY01F?=
 =?utf-8?B?NEwwZy9OclM1bms5cVJEeXdSYkpETEZlS1JHRVBKN0FjbGtob0pqWVJOYlJv?=
 =?utf-8?Q?/ftWFahiGf9zMtF3mH893crV6ldjiyvx6zq51Ajg0RTU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 39723197-0708-424e-3471-08db76a59673
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 00:29:37.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8241
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


在 2023/6/26 15:36, Krzysztof Kozlowski 写道:
> On 26/06/2023 09:29, JuenKit_Yip@hotmail.com wrote:
>> From: JuenKit Yip <JuenKit_Yip@hotmail.com>
>>
>> add sht3x devicetree binding files
>>
>> Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
>> ---
>> v1:
>>    - fix semantics error
> How first release can have already fixes? Against what? Is it truly v1?
>
> What is a "semantics error"?
>
> A nit, subject: drop second/last, redundant "devicetree binding". The
> "dt-bindings" prefix is already stating that these are bindings.
>
>
>>   .../bindings/hwmon/sensirion,sht3x.yaml       | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
>> new file mode 100644
>> index 000000000000..71a50bd57af2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
>> @@ -0,0 +1,35 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sensirion SHT3x-DIS humidity and temperature sensor
>> +
>> +maintainers:
>> +  - JuenKit Yip <JuenKit_Yip@hotmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - sensirion,sht3x
> The actual devices are SHT30, 31 and 35. I understand they don't differ
> in programming interface, but still don't use wildcard, so just
> sensirion,sht30
>
>> +      - sensirion,sts3x
> Similarly - no wildcards.
>
> Missing blank line.
>
>
>> +  reg:
>> +    maxItems: 1
> Missing vdd-supply (required) and reset-gpios (optional).

It means that we should implement relevant codes about vdd-supply?

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>
> Best regards,
> Krzysztof
>
