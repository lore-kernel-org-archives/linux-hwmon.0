Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A7AC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 18:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27F65610F8
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 18:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345038AbhIGSFo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 14:05:44 -0400
Received: from mail-am6eur05on2121.outbound.protection.outlook.com ([40.107.22.121]:19041
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233525AbhIGSFn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 14:05:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlpvrPU0n3mRSHOL5EwcugCtxC3hAaz3J5ZaKnw+ZVX9MXyiIiQm63T+uDzCDh9TATpwzdJg4Y8cCEfkoe4gqpzWvNrHxkS+ymgVmCOJmtTa3XsL51XtlEiMb8c/CcDtM2sET4jX6AISCyXKR3NLJNmp+CCbGU/YXGawfZDluXgHZQkFXehnzzLzSBGkr6zTMaTOSAPevQnGq7IR4bDEKW0QpyIi1+FIxnAWgVgQD3pvTnA7OfJEyEytRTr1mWb2xFdpzo1nl891Az27ko8TxAKKwVmyb4dbLO0wMa8dhmAJ35EvqwoNKAB002005em5mKomFbwjDc5erTRYKydXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wYNy/Ow5HCCkoXTWQvzTrAsxs0VxaXHFx+4vaL/FV7M=;
 b=SN/jY9JoUwuPyRFt3U+B+ZjMWV2p/0lxEMbMZ0CxI+3lBABkWxsC4fCW86VrpYqVZA1cbhycViC1FVa9c7qAfUlhWgu6CEDvh7H66O+qnpnlV7hTLF1j/f0akHyeYYQWk2zECMpCEEMs5Joe4VEyj7KktxGqs/jrGHdLsCK6HPAIwbPA+48EzQNh9G2U/YGWBKLrdQI0ZU7jttPm29D/1ThVau0qomeCr64LsoeL8zcM23DI0HV0nK2WQDk5V66wt23wBD2HQV3ejP76ZoU82KGYHu9OneKssruYHOkN9f9UYziwk4yq87a52U24Fvn2cIlsT8BHOq8dVhllYQiV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYNy/Ow5HCCkoXTWQvzTrAsxs0VxaXHFx+4vaL/FV7M=;
 b=aZHBLqkfqJa6tgalr3iC/1xxkBPoaJY9DnvnE9WXzMcsYz2yU1+GEAq+D/id5dAj/SuWAUSd1XJsNFfAE/zpo5f7hPS/5S/PoY5q+VuhD7K1KzKK+Ra3X7DUmZac9wnMaqV9z1Ta4gQiRzeNO/LtI/JXRlsNuyzEhSD7iWhfTao=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8079.eurprd07.prod.outlook.com (2603:10a6:10:23b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4; Tue, 7 Sep
 2021 18:04:35 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 18:04:34 +0000
Date:   Tue, 7 Sep 2021 20:04:30 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YTeprkirgM45liYn@localhost.localdomain>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <3743f9f4-f8c5-acd5-2422-2bbdb2dd7d72@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3743f9f4-f8c5-acd5-2422-2bbdb2dd7d72@roeck-us.net>
X-ClientProxiedBy: HE1P18901CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::21) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 18:04:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f8ec997-3584-45a4-3470-08d97229f309
X-MS-TrafficTypeDiagnostic: DU2PR07MB8079:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8079B9264F56D08995407062EFD39@DU2PR07MB8079.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3zj8Jqw1Umsw6e1vYrUoQQuPLMcxkGi8KZ7W/UpG7itOU1ck1/lIwf6t+Ce+XTA6pi6Gdhngai6NnUoqnqpcUKDpNkuBPxVxq2K/VglKScUtkXV87aVO0PxAvNVEL+UNxneRs84CUmfVe0RMuI39/oCJij6QwTwKXhmHDgLcbA2gHt2FqlIhT69k0AjyySSPVQezG6Q3UkzTfgin1Y9n4RW8FD2lqhCrXWAwmwyCe9Kwy3UZmSbG64Xb8ctwPZ8lCX2b/RXoA1wn/E193MGGuZGOYqV9PHstzn/ObjaOxkBCpa3QKnRFSaL6zrCSBvNzdBX5Dcv0OJNic7XWPtH9ajHxaLQ62fjkHYMojXjCMT7Xh/XnJg40hMJGK1k1ij0GWgyIVsnanVFEFMVT0QZvi1xeKDNptDSqTJarn/Ze1/iseqP72UmiNATHOnXEQnE844gSSy/7OVI5aAyKr0eOZNQvbfOUt79EPDRw2oN6hM+yQW1wtJVTM4gYuSDM4iHaxg5M5CPb1OVqRTV9m5R04qA9GulHIjSVhnyU9rRNNeixAb+6Y69HyJPKr7BdkT2Zu2d8XkjVfkVDdF/Ovfn4D0f9vHZxCBpQ6mEdIF2EuLrbMCaUFtWnspP2ooV4ZkPgvUU4qSHqZ+tp72JIjJ4ATcirwHFWN6/6lPdYKv3JnSXBmmFXZUACBNrj5HHfCVIHV5xttVhSwbyK9gn1dIrqHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(44832011)(38100700002)(7696005)(54906003)(5660300002)(66946007)(6916009)(8936002)(316002)(66556008)(66476007)(8676002)(38350700002)(2906002)(6506007)(186003)(9686003)(26005)(956004)(55016002)(52116002)(4744005)(508600001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1rM1BOVDhSK2xtRUMySGhXRk9sdkxNV1l0dnE1ZkhmODQvSTFQN3VBYzZS?=
 =?utf-8?B?STFmSWFpZFNVVW9ITUZqWC9wNDFoMDVuK1JSZEV4MzBidEdiK3FvMExHVDRH?=
 =?utf-8?B?YWNXbHRjNDRNdGs4SDQ0L0lpR2MyTFR3eldSakgwSmxiaUY0TlZHM0Z6bUhL?=
 =?utf-8?B?aXlXT01lWE84UWV5Vk9nUFBUbFVyc1FmRVFnYW1VTFZWbFlaUzZmV0hRZ2gr?=
 =?utf-8?B?bVZnbUdvSHZmWkJpU2E4ZUFLOHl2UUlJWHFtUXh4ZTlqTGFqQjhzOERaTDA3?=
 =?utf-8?B?eVFFOS92ZmhmWncwZitRSjBtaHNnTEVpRDhHREtyT0k5OEVvUk9LRmc4Mk1u?=
 =?utf-8?B?dHNkUmpVV3ZNMHNiS3p4WXdVV2RpVEN6TDg1RmZGN1lIOGNndTduZER6YUcy?=
 =?utf-8?B?ckxNUVZHd2dmRXpKUWFYd2g4NWxGNUhmNk1jMWgySXcvUS9zbzlpRGFXaU0r?=
 =?utf-8?B?dUVQOUN5aDhhVDV1TENDK0JRTWFzVGJ4ZGs2L0szQ1BPamd6TWRNdm9lSG9n?=
 =?utf-8?B?cWk2dXlhNzlXbWlBQ2lyaFFxdXp5a1FBZEg3QTNSSWxOK29lZDRTRTIrcS9v?=
 =?utf-8?B?R2NHUjAreTgzUEVWcW85UVJNK2RGaHR4V3JpQnB0em1HNkN4WjViSHdtYi9W?=
 =?utf-8?B?TU5EQUpVQkl3SGNQeGgrTkU0Y05UZTdiWkFCK2ZpZDN6Y2NqSU15L2h5dFZF?=
 =?utf-8?B?cGNzZTJ0U3V2ZjNCeEZIaGtiVmZRTEpweGVDY2RCcGpINkhwR1FscjNKeEdp?=
 =?utf-8?B?VENDTnR1dDNCUGlROTJjQWNzQXZNOTFsamRwcmNaV0crem5ERXVYcDZvN0w5?=
 =?utf-8?B?Z1UvSjRjUHhkb25GdDlrMkN1b1phWHJidkpQTmxnSnh6WWhRYnlYeTBtSUVa?=
 =?utf-8?B?ekN5b1dWVjVuLytIRWdUYmI1RW5BRWdTVUtqWXI4QW5XdjcyZDhEVXlZQlF2?=
 =?utf-8?B?OUVJbHBVdHVHVW1VMmQ4SmdjQmU4WjBqWFNuL0FXMVNNMElLeXFJVmdsMVZV?=
 =?utf-8?B?S3BaSVF5a3VCUnFPUGhHSzJ6VGdHNFFOUUVQNWR5eHl2Y011WlE0ZklwR2JK?=
 =?utf-8?B?TjMrcndoZ0VKUHVZZEZmQzRiWDJsNmlrdXJBRkFwYXFHZzE5YUd2YkhtNkRi?=
 =?utf-8?B?YmNWWThjcWpvWnFjWlV6YldxdDh5SFRRNGt4aEFDYS9jWldIck5xenZIOUFj?=
 =?utf-8?B?ZUpOQlVXSW5YYndaZndtTUNNbUlkK2VxMUJmYlpEdTU0WHA2MlFVMlBuWklE?=
 =?utf-8?B?c3BGaHh0SUtOQ09tSU53cFVrL3JuYzF5T3E3V25TeTRmVW1IdWQ2VUpBTWJ1?=
 =?utf-8?B?OEVmWDBYSTRQRk9CaHRCeWp1TEtuS3k5NURDU1ZlSVdhMFdBQ3pQaHlDSVVu?=
 =?utf-8?B?NnNXWmdsK2lGT0JuVnRaWjF6aTBxL0U2aUhjRTJ0c252U0tHODJNNUFza1lZ?=
 =?utf-8?B?SnUxWENzVENNSjJvMHpDOXVhNTMvQTRGZ00rcVduVlN2VU82Y1RoU0hqVlpN?=
 =?utf-8?B?YzkrWjRtTG80bTY5VTJlTkVNWnVadEhhYWd4Z1QvdHBTYnJjMGw5NVNEcDEx?=
 =?utf-8?B?cWtvc3NIZXdGanJoeEpTaTd5aW00TWtXUnZGUDIxbENyZEZSU1lSSjk3cEd0?=
 =?utf-8?B?RUVuQ3M5ODBFSUoxSExCWGtIWUMzb1YxZXRYVDN4VEN1VmdGRFZmK0Y5TW5J?=
 =?utf-8?B?V0psRXE1ZjRLUUN2WjdjMXBzanpzS3dJQUFSZ0hMY1RnTXNCVERrcE93dnQ5?=
 =?utf-8?Q?ZFwlagqGeZGe1S72rHyrvapNvENZQV6Rj7aKyvR?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8ec997-3584-45a4-3470-08d97229f309
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 18:04:34.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCtCKVGRVq1XyR3Id6AQgJNwg+uAexrYi2RUEhyerSYdOb57ACKQmR9tY9obAB00e6+q6DadJIZl1LDRxspXcAzrOdpYwdrOnp94U4hE7Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8079
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Tue, Sep 07, 2021 at 08:46:53AM -0700, Guenter Roeck napisał(a):
>On 9/7/21 6:46 AM, Krzysztof Adamski wrote:
>>Add binding description for the per temperature channel configuration
>>like labels and n-factor.
>>
>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>
>Up to Rob to decide, but it seems to me that can be squashed with the other
>dt patch in the series (which on its own doesn't really add much value).
>

My intention was, I guess, to clearly differentiate between what is the
existing state of bindings and what I propose as an addition, so that it
is not required to read the rest of the patches to review my proposal
from DT perspective.
I can squash the two patches, though, so let me know about the decision,
Rob.

Krzysztof
