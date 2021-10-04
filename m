Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79BAC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 07:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA4761163
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 07:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhJDHia (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Oct 2021 03:38:30 -0400
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com ([40.107.21.99]:5536
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230018AbhJDHia (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 4 Oct 2021 03:38:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf9jn0yM1971ndcu4Z2/0omgTocqHqTHYVDfSTg1fEX8m1Momp8geooCb+6zsMKKuRtjw7auEJgGxnbLKzuHhftvRSBUfCfLBne6bQvylceQ2zdXH5XVq1RkWExejCK+euDAIqHof+fXlMKT6h66PLJVybKULDNuMNgW8Kwq6OLkgldmQyB4xHB4ZPol453Qq9/2+o8EGECOn3FYO1053i2HwRW7kKT7JX41viFXIuVZWpSbeKixClqBYlXMh0uf4L2MnHMPBTjJixfJLD+lSloELEr28B3lXXj7dor2idtE17SmnyodF7W1l0jDeltsuYie9NRRCRUBbpktmFx3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ex7sTqHOS9RMp8XRNVyuK5sVYi5pOXeEkD26cRzPX8=;
 b=O16QDdHcpykevVDgoSpmZJOZ0kSGdclsf8Os9vG57S9/NyhrGK6VfIMUvsWm+JFjuNJ5yVs2bKoMavcvqM2FEd1nZw44b7725Ph61dYnkH6Axwf57nbCHpEGk6PtUwGP4i9RmiZ2N+WrnuHvX0sl3Su0758b0xeS9knhgPWlq3iS60+hmGH524GVT7Pv9Q259cllEAPq873DwscvkJRtuIK/RLhM2IVAoJmnNzkCeOXQp8qian6cmDnO0zFOs/Q/SajxXbQTjarw+8fxS2xFWOsAigDlnMcD9JObmg1HRO8pSw1INAuY+kIqz4R789ZV3/DbN6Id0Bk+FegoNp2NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ex7sTqHOS9RMp8XRNVyuK5sVYi5pOXeEkD26cRzPX8=;
 b=mLgzp6qZ9ALUBKtBdualjDsBJNW8vQN2IMLVGqi4hjuVlt9ZCj58o1Fa011jVIomJQgKuE7DH3vFiwNnkBsKkAktOKafMhjDBdbhBsVbIKZi0KLu07figk3PpbzkMLFNyP/1n0WLltraDHechLHRwbVMb1zr+ITRpXO1tg2/Cuw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8221.eurprd07.prod.outlook.com (2603:10a6:10:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Mon, 4 Oct
 2021 07:36:39 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Mon, 4 Oct 2021
 07:36:39 +0000
Date:   Mon, 4 Oct 2021 09:36:23 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <YVqu92dUgNKlYMlG@localhost.localdomain>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002142219.GC34532@roeck-us.net>
X-ClientProxiedBy: MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::35) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend Transport; Mon, 4 Oct 2021 07:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fb18b85-61e8-484e-c5b5-08d98709b387
X-MS-TrafficTypeDiagnostic: DU2PR07MB8221:
X-Microsoft-Antispam-PRVS: <DU2PR07MB82210ED1823C96046A5766AEEFAE9@DU2PR07MB8221.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kaXUVOiXrQT8auYdstn0CN0LuvU71/9j8gRNfHHtO5JxL7+keTYmQbuAmX3TZNRKG3LT/ahq4/o9K1ytP5B6vQ/f7Yw1Tnp2Olj3SBEEeSI4mNmzUz9IMwprWLOmKaPB7xUkzOkQlFQ3SE1oq6Cyfdnn086qI8cWYRG6ec77z5u2jmzvN97CEn5o7oi6qX55HijhdYqV8/0ci6T2n0qwU4Gg/5cqKjl9cLUrXCLSeJlqO0oS8OHPL/r3zZT2XQewaGDPb2pMS7pOeIBAHXoShaN9mWLIW+AfjPOA7GBjogn3M5cEdvwsqnOTqG/kei7uYGF0SRRdIhcc3A1rAf/2L1IhbSBpf9d1LVYkIINC+lea12YSkXIgmWgb9I2QH7hfX9crR6T4ah0rRuiR1J52c63ElyDyKonPIcc0aypVuy/Mu9VsNhEkK5RFLQD4iYHGHoOmEtspc7JX0H+pSUnwRSdTcMYd3hF/KeopK9YKWvmu/QQ2IylwWSrtHAxX0UwdQaLETYN2JnFa/Kh6TwwNlNn9IgwhDJHBtpbY4xCOs0imYK7jaCk90gDy8JFKwZSow0O7gZeF26es8bFAqAA6+w1Df7Sg0ibPovYCuiq/vpqsJyBIQ/YFJKPdxocx5kdabdjiHiTuFjskpx2OF4YnN18T1S0oP3Aesk1pfUBYxNSnL2CwQYUEhPFrZWLTybW5veMl7KqKsrL01qztv9/SMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(8936002)(9686003)(6506007)(956004)(52116002)(7696005)(54906003)(2906002)(55016002)(38350700002)(6666004)(38100700002)(44832011)(26005)(66556008)(66476007)(186003)(4326008)(66946007)(86362001)(6916009)(508600001)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXIyNDcxUEpuTjh4dlAwNy9DT3lTM0QxQXVhbWhwelh5elIwaFI1OHBLWnVr?=
 =?utf-8?B?SDhybkUxR2xKSlJxRVdVdXdSR0xBUE1yamNRZENnZnFmWU9ESEJNYkNyanVo?=
 =?utf-8?B?NVlLMHc3SkV2bkhMM0kxQllwRE5NTktFaUlBSkZMOTFoUEJJMUpINXRtTFo2?=
 =?utf-8?B?UTkrOERRSnhia25tQ0JEZVgrSStOQ2M4ejJUekF6OUVqbnNwSnRlcURBUS9W?=
 =?utf-8?B?d0sza0g3L244MWNQSmIrTVk3UUEwbWQ4eXgxUUlBSC9pMlkzN0NEMWZxbko0?=
 =?utf-8?B?RDI3WUd5czQ0UnR6UVF0VSt4OE1Ib1BVekNJaHJLdlVVTWhjTXZyb01PS0hI?=
 =?utf-8?B?T0pXM0N6alNYZ2ZDeWVEa1JZRlpjcldRVktNRHRmZ21QdVF0WkgvNEZYYWJj?=
 =?utf-8?B?bzZDUDRjYUovSFJPNVJOVHlPMmFHeVhTUWJIcnpnYklSUEFIZFlwOFd0eGtJ?=
 =?utf-8?B?ZmNETW9GV2lDbFl4M3F2TnUvN09wQlBRYThaZjgrbHF1b1NUcGltcGZ4RTVZ?=
 =?utf-8?B?dnN1WFRDLzA4eUVCUHlBeUxzalBYOVZLTlhPcWJ5eGdqYXJ0UXBIcmRNbFFs?=
 =?utf-8?B?RTZVK25VeUF1ZDN2ekNXcW5JTlBvRUFkcTBvNFNwMkI1U3pqNERtTnZQWWg4?=
 =?utf-8?B?blQ3dTUySllNellnV3V4MnNDNzJkbWVHem1HNjFmWmptdG9mbDRtU3h3SFN1?=
 =?utf-8?B?MXZlRzg4c04yZHlsaWI2aFJZQkVIUld0d1RHOTlhN29LYkxKVVJEU1NzYTlO?=
 =?utf-8?B?cFJVR2tjUG9vdmkzeW9CVFBqNzIzVWppM1hNUmlxYnBxS045Zm53UHlJd0tG?=
 =?utf-8?B?anowdndEclRnTnFLcG5TWUJIUUwvSXlVOUFnQXRseFVYTTNmWExUa2huK3RZ?=
 =?utf-8?B?ZGtycGRqcmt1RjUwM0NWQ1VoU0tNOGMxSVg4blA5QURjZkZRMlVXUDdyWkEy?=
 =?utf-8?B?R3B3MWZPNHB6WDJIUWR5L3lyem4wT1dQTG9xV3d0OVhjZ0xQN2Z5dzNRNkNM?=
 =?utf-8?B?SDFoNDI2bjFXQ3h1ajNRa3dQRlQza3RlNDFCZVFKNmU0Z1lDRmU1TUFxb0FC?=
 =?utf-8?B?WTEyQVRUaDlUazYwclZhUnduc3JXK2E5bTNHc3hNZ0dNWjJLWHZoaTQyZ2Zk?=
 =?utf-8?B?V29NYTBmSFFPMEhhdTQ1SG9JWlQzc1ltRGlYNHBWbDdMWm5FNHRkSTVxVDli?=
 =?utf-8?B?UXdVZCtGTm16bmxLSEV0RU95NWlSUXBnSjI3SThTR3pMaVpMSnV4T1hibVNL?=
 =?utf-8?B?ZWJ2VmpPMk9DWGQzaUxwdWtrdit2V0tCWmFseW9zb2pwWVB4enAwUlFhdTM3?=
 =?utf-8?B?VUlTbDE0TzlDSFRoNmV1Z3FIa2xIZWMyMGRRTlRBdjMzRzFVdUdPK3pnQ2xV?=
 =?utf-8?B?WUlUL2dpVTZGa3lMbEVGbGwvMm9qYUl4cXc4R1A0a0VyQmdqRG9yZjV6WWtO?=
 =?utf-8?B?eHptazBKTk1CNUhma0xrMmFTU2ZZZWZTa2hrWWY2VnhhaHNpcHJqYXN4OXBl?=
 =?utf-8?B?eGZUQzlEWG8yUzhsNXdEd29JTGF0d2dld2wrclFqNlN3Z09XajMyd3pqazh1?=
 =?utf-8?B?aXpnMDVnSzc1bW9TRXNYM1Q1UHAyNlcwbDBXbnBYaHkzY01HTEFyMGRIMkdS?=
 =?utf-8?B?REJtOXY5cHlzTHl0ekFSVjlKTkJVODJoMG84MENCb2xEUDJHbS9EQkY3c1VB?=
 =?utf-8?B?dExiRmR1eG1WbkpEWW1BTFhLTUpvc3BjNCttNUhEcDdUdUdRV3lIV0V5TDFp?=
 =?utf-8?Q?gv4Fi2zGohLpTxnvSyZ7Yor0uxVCkKO75JJSO+q?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb18b85-61e8-484e-c5b5-08d98709b387
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 07:36:38.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q0dDkiNXPRc+kqjPhMgg/8Ie3fktUtzVw2EiFYYZ04ULedZhx7T7ShgswRdnn3nqOsSLCyTZxfi3HgycodSMh2DUnhra/wUmKu3SheYc+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8221
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Sat, Oct 02, 2021 at 07:22:19AM -0700, Guenter Roeck napisał(a):
>On Thu, Sep 30, 2021 at 09:19:49AM +0200, Krzysztof Adamski wrote:
>> Add binding description for the per temperature channel configuration
>> like labels and n-factor.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> ---
>>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 66 +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
>> index 47040ace4f73..0d4ea2209500 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
>> @@ -24,12 +24,49 @@ properties:
>>    reg:
>>      maxItems: 1
>>
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>>  required:
>>    - compatible
>>    - reg
>>
>>  additionalProperties: false
>>
>> +patternProperties:
>> +  "^input@([0-4])$":
>
>Was there agreement on "input" ? It is a somewhat odd name for a temperature
>sensor. If that name can be used to distinguish child sensor types, it might
>make sense to have a well defined name to state that this is a temperature
>sensor.

Nope, no conclusion on that, yet, thus I did not change that and I was
still using the same approach I had on v1. For me it can be a "channel@X", a
"temperature@X".. whatever you decide.

However I'm in favor of some generic name, like "channel" or "input",
and using some "type property", if required, instead of calling the
nodes "temperatue@X", "voltage@X".

>> +    type: object
>> +    description: |
>> +      Represents channels of the device and their specific configuration.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          The channel number. 0 is local channel, 1-4 are remote channels
>
>Which of the supported chips has 4 remote channels ?

True, there is no TMP424. I will fix that in v4.

>
>> +        items:
>> +          minimum: 0
>> +          maximum: 4
>> +
>> +      label:
>> +        description: |
>> +          A descriptive name for this channel, like "ambient" or "psu".
>> +
>> +      n-factor:
>
>n-factor or "ti,n-factor" ? The unit is chip specific, after all.

Or ti,nfactor, as used by tmp513? Again, there was no clear conclusion
so I didn't change that. Let me know what is your decision and I will
obey that.

>
>> +        description: |
>> +          The value (two's complement) to be programmed in the channel specific N correction register.
>> +          For remote channels only.
>> +        items:
>> +          minimum: 0
>> +          maximum: 1
>
>Is this the correct value range ? The value range (in integer form) is
>-128 .. 127 (or 0 .. 255 as unsigned), not 0..1.

True, I must have misunderstood this minimum/maximum and confused it
with the number of items or something. Now, since DT does not really
handle signed values and considers everything an unsigned, should I use
0..255 or -128..127?

Krzysztof
