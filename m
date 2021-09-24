Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDF8C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 550D96135D
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345118AbhIXM7O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:59:14 -0400
Received: from mail-eopbgr60118.outbound.protection.outlook.com ([40.107.6.118]:34783
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345145AbhIXM4R (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:56:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clfqhA7MErkUyZ8LJ0a4TbVyKLxn+znl9yVttYQCFuDUpVlKXhfBDv7GRKmLGHWSYn4EUsoS0gYQhUkQe2s1vGHRiuF1sMHgd2O/P/vr4XJoTo5Ml9XWtwl7p4zvkT5qzy+5pI7fIIvh0zkjmPmJiwt3nvVwjnvYwtMOwGQsF1cA76lNwT51olOp9ZiUPUSHsUheLIoLg2WroSL5ztucq+Hvv8xFnBWy8lVqgOcW6H+ggZgPzdWyBS+9czKSHc61EQ0arhtE3lWwyOo+O2hcvnJC1oANOUWGTz4tuNdZ51iRVU6dYCRGoLjcULHG3jtYlWEr9GfELASMwPGkiOMWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUtQp5UJfoZQfNLtbA+deEmoPYQid+r8dqp9hFOIKzM=;
 b=AxTWeHAbymDylv1nmvEeOvCA8W1RzBz+GDssDT1+9xajlfZx9eOyCGq3tye8FMsdNBotT6Slk3bdtit37jb6wNsTGyncOR8Lle/uJ9g05UVKwlKTzuXvz0JHhbKMgLPXslce8liE0YJNVKcyagRUQW4CPjQ5DwJ714gpzI+it/KJJn0KQK8jCr4Am822SsMkyVORBlqmqfTz0x1ExQPdnkDQF0ICAVH8UiiYguYCCAxF+PRlIA92GrfN9DTjeMp89hB357d+egC9v0PS/wo/r/TFkEfCUmPKpvyABOoA+3n/3Lu6UTzG+9g9YrTnfrDGjAWW7Q4RxJe1bHgZQ6q6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUtQp5UJfoZQfNLtbA+deEmoPYQid+r8dqp9hFOIKzM=;
 b=qdfTuBu6BBrdsSWbupNUsf9dOdr9dXPdZQ3K/gikT6Er3w7tcTSnR+qWebeou8rMqqRbA0dO2mKNa1el+stNP9e1U8uSaaUO2XT5wxodK3dxyhyzU94wMzx435hxEK7CnZyRALyuhzxRIgRv9+ISan683FvzrZngcXIV15adT8Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8077.eurprd07.prod.outlook.com (2603:10a6:10:2b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.11; Fri, 24 Sep
 2021 12:54:42 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 12:54:42 +0000
Date:   Fri, 24 Sep 2021 14:54:33 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <YU3KiePwjPPF+KPT@localhost.localdomain>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
 <cad7ca2084491b58d7f5d72e43f9b6dc9ec0fd69.1632473318.git.krzysztof.adamski@nokia.com>
 <1632487500.109276.1091568.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1632487500.109276.1091568.nullmailer@robh.at.kernel.org>
X-ClientProxiedBy: HE1PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:7:28::34) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:7:28::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Fri, 24 Sep 2021 12:54:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6419c1a-0d2c-4c7a-a4ce-08d97f5a7a51
X-MS-TrafficTypeDiagnostic: DU2PR07MB8077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB80778DB9EAAE8B3D3D793D55EFA49@DU2PR07MB8077.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTcWfMJuPUBdkioYiJM9W+3YL29aeV9vIVgcbZxkxfXhPoATjGKQf+qH2L2vlha17XpPzGm1vugTz6vBKZl+Hkk63++Fk4cVtFxrVLwqMzpqYp76wYWsE4/bd3lGT8H8BA7CAfGZh1Tytf2v+RucJoJ4NlYeboCM8X33CcuuFBnsukE73jWUgyT8va0qVEhnIH1ewcQuiGN8JJ9YUAHE2jEw6bMCR3Fncg4T6oFt/x5MFn95cloSFKb/91+b1FNMk1+wOzGMkcdy4qzIzD89Wzm76sJYdtt6ekYnQmKkNnU6Nj6E4diKNUGR6tU1Z3SVv+LG26Kw6xu7JS9gm9UxKJw01o5W+O5lynvKGmXfaVNVRu+LSzFZ5+XelfoeWEJWoC7czgO48ZGO6BsyWo73ChBwRiKrZN/Apv/inVP92x3VPQvt61WuhCgM26HOOb736sxPmEntg9nZ9mmb6an1PnwAHkv5ALuBHR/89+ejxKiLxDEyijiKeSKbV4ZUOjsmB10gQe5mFKdW7+aG0cd/QdwvwfuEzJWvF2kyMvqIM2u+ng9h3BWtfu53Rcn7MaFqsExEvoGC4KntcdArNgRKatVSj5AESDgzj3LYw/7K6uFfbNKgEGxDFrBtsHz0XXW+FU1b3bqgbJxISpUUUWuDyD4g9/8YywyWb0nFb26CxcMW0piATRUerWsRQq7gsy06+vFiywOVJcQt0KHZqBPltpMt3PFeOah+UawOG/HdkSPKpS7EJHhFvstaVbhB7wpUSfGitiH1qU5K4ToISEtcp4MPaI/le04dpnpfuQhdSEz40PC9ulEIeHnpZvp88dr1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(8936002)(52116002)(7696005)(26005)(186003)(83380400001)(38350700002)(966005)(6916009)(8676002)(508600001)(4326008)(66476007)(9686003)(86362001)(55016002)(956004)(107886003)(6666004)(44832011)(54906003)(66556008)(5660300002)(66946007)(316002)(2906002)(38100700002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWovbUl2VEtMQk4wZkVpSmJhV2EwNWZvTnN4T3Zyc0VrV3BxVTlqTFR2WEVH?=
 =?utf-8?B?OElsUUZpL1Q5V0krOWtBd3VvOVZqdEtKem5pQmZrMmVxUWtBSTVyRS9TVWZI?=
 =?utf-8?B?TU91anUyQ1Bzak1PTDJwNXNhTm9yNlJneEFDSFhlRExuSG43TGVETkFJWmRG?=
 =?utf-8?B?RW9yWGFpQzFHVzRmaVIyTW9mc0krZDUxTmYydFJOOEphdUJHVHMrWWVyWWNH?=
 =?utf-8?B?VEZlRVhNRFdXRTlSSUZQZUlPa0szd0tZeVFadVdzZzZURlZVcXEwRVhlUWN6?=
 =?utf-8?B?NTZDeUR6dGpKanIySTVPczV1blQ2TXNnQjdnbVhqcURXQzJaWkQ2V3pTb3Fl?=
 =?utf-8?B?c2pZL2l2dFBTcXhFYi95UG84TkZaOU55b0xwUXdGQXNnTFhLckdGN3dyM0Ev?=
 =?utf-8?B?b09vVDZJTUI1dW1ZQjdIRTFxa2cyZGphV283WjBTenkxZ1VkeDBJTFhHZ1FY?=
 =?utf-8?B?ZjltVjBPLzdkOUJFa0hORnh3WEJTamxEZXkzVEFYSi9ITHB5d21iMG1UKy9s?=
 =?utf-8?B?R3hGdnA0ZDJtSGRsSmEwT3NMN1F0K1hKeXFlejdqVkczK05EN3dBeUVveW1s?=
 =?utf-8?B?KzJZSHJZNnpWSkFPQjFRZ1pjUHFGU2IvZXZCWmpRVWp0d1FMWXI0TUtnMGZt?=
 =?utf-8?B?Y3lUTTQwYmwwRDFrakxxcm5obE1Qc1Y0WFFnR2VqeVluVTJ5NFo1V1lFSHRP?=
 =?utf-8?B?SDhyR1BlMDczWS9ZRGJFSUVJNzU5NUpxU2JmalFTSk44ZXU5a2hUREw3SnJB?=
 =?utf-8?B?STlVTTUrQ0M3bFgyMFVISzhxN3dFS0VrbGZJVlBsUEYzQXhlZm5CSmdVOERp?=
 =?utf-8?B?bzVXREZpSTloSE1oa0JTNnZTZFgvN3BhSTM2SUZkNnVhRlJrV0JOZE1ZVWRx?=
 =?utf-8?B?b0t6NWU5VStEZjVzcHRYajFFcGpWRUVZRk1KdWpPSGIrM0Q1dWdaak0wdXRm?=
 =?utf-8?B?b3BZQ3V4dUVjc3JITlBudVdoL0pNVUhMU01aR1luejNoWlNMTXFqbG1Ya0Mr?=
 =?utf-8?B?TlVvYmpEQnJJNFBPUkZqdkZZeGFOYUs2WGVLTE9RSkcwdVIvVmZwcjdHYk9y?=
 =?utf-8?B?RzdLbzdDd1RDVTgvVDg1dDRxZHJMZC9JMk00TzFST1VTTytoTXRXVnBoLzZo?=
 =?utf-8?B?VXl6Z3lrMG96R1VXaHNSQ0hLNGgyaFJ2L3R0NGFrWlNKaS9OZGtZNnFieTRD?=
 =?utf-8?B?dHFtcnU3R1VURjRFTUhQcCtaOFJmZE1TQTcwMTFMNFlWckhIdTBWZFNCc2xZ?=
 =?utf-8?B?Q2tpbDJscU14MmhNUE1tcnVWSWtOWjhsbDhHcVZ6N1RZQTZJUURBUHVsbTFK?=
 =?utf-8?B?dnNQZ0tPY1RiN0xLTTdHQ0NtKzQrZytTeXJrdk9rbkFyYmFjL0Q4c1NJQlA3?=
 =?utf-8?B?eWc4UkdUbnhXanowa1JSVEs0ZXZtY0J4OVdISDBEbFlLYTdOazd1TWYzOG9m?=
 =?utf-8?B?V0Nlc2N3cVpYOUt5R3QzWnVKNEljb1FFZ04rZDYxQThHbE5iNHc0TGQyMFFT?=
 =?utf-8?B?L2VLd25OSG8zU2REdlRzQ0Yvd2g3UTdKeTV5eXlNejNPaTQwU1BYZjVLR2xN?=
 =?utf-8?B?eXpLZmdhNVZ6ZzQ4clF1eUxHb3RkMGo1YW43WGZpQnV3OGxRUFgwYjBSYVlx?=
 =?utf-8?B?THpmSVdsbDNQTFJta3daRFZzTnQzYWcyTkFHUXRjVVRmVjlYaGRpc2UyeDdh?=
 =?utf-8?B?dmVZTGRUYldSQUxtZVJlbW9ITmN5U3ZTM0h0U0d2cXJIUHVBWk1KZmQ3SnZq?=
 =?utf-8?Q?041/sjdBGN2WOrt4Jk7Y45pXfn/feyWDqzMypNt?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6419c1a-0d2c-4c7a-a4ce-08d97f5a7a51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:54:42.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8dFe5NlsqLxHzi7e2NrcPrqm2dfuWKzrq//+XYme2THsT/M6Ti7qGWPTuPjwwMp/4IpVDLkwrAHIRlYY56XDG+n/ekEn2yKO9F15kwAgHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8077
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Fri, Sep 24, 2021 at 07:45:00AM -0500, Rob Herring napisał(a):
>On Fri, 24 Sep 2021 11:38:50 +0200, Krzysztof Adamski wrote:
>> Add basic description of the tmp421 driver DT bindings.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> ---
>>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
>>
>
>My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
>yamllint warnings/errors:
>
>dtschema/dtc warnings/errors:
>./Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml: $id: relative path/filename doesn't match actual path or filename
>	expected: http://devicetree.org/schemas/hwmon/ti,tmp421.yaml#
>
>doc reference errors (make refcheckdocs):
>
>See https://patchwork.ozlabs.org/patch/1532139
>
>This check can fail if there are any dependencies. The base for a patch
>series is generally the most recent rc1.
>
>If you already ran 'make dt_binding_check' and didn't see the above
>error(s), then make sure 'yamllint' is installed and dt-schema is up to
>date:
>
>pip3 install dtschema --upgrade
>
>Please check and re-submit.
>

Hi,

Makes sense, after seeing the series of patches converting the old .txt
style binding documentation on hwmon-next, I realised the file should
not be called tmp421.yaml but ti,tmp421.yaml and I renamed it but
forgout about the $id.

I'll resubmit the fixed version soon, but I will first make sure my
system can also catch those errors too.

Krzysztof
