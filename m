Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD93C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 07:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A9EC6124F
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 07:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhJDH3r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Oct 2021 03:29:47 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com ([40.107.20.128]:15489
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229795AbhJDH3r (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 4 Oct 2021 03:29:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEd9vjpFOO3H53ejwqNUWXYobgek0KN8lHK3UoxLMjvPLMVxK6Ny+Aq9UEJfZTtharXVNMpcCQnck9zIxueFxgp5Un4OUc/CEDtzJkgeo+xNqC3zVtE7tYFPgYyVTngC6jcytinU+aS4o7KsM3FLFqyxkF8MRns2DEvd+8jxYRqs+mMdpegBzuNWtNUjxjo/68z1Co6IsQCtEwp+zCylEJYvxo1X98nwNMvwd58osunL3KxurPrMkuEWFhyXXlpn5VRVoTWi4B3a660LGQNoCVXzQNqTaFCfIMV/h/5lwUgRhXOv0DBLENMc/5EcGeibpG2dS8HycpMHukw8VlU7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUCaDNepKLJRVIZ4H4OHESomvUiA6JubDP+Dz8PUAd0=;
 b=kpLtAYUasnF1OIsvPKidPnwXSCf2o6W9iMMcwKTK5ezWp9qB8f9tLhzPI4wMNVoWe1Usgqe9gaL5vBADrkVFdugiIxW4mNNnWZEqWcNAYWDPVsaV0p7wScyY48GIGxXN01BSg5vjmfZqiOM/gpP1u6YkQGCgV/r0IEMIW7ja4L2LSkGKOaKuzQO9TEuJuES4GsszmdWaP3LU7/i6zXLpc6kync23iagy3kI7WfPO+c2tN6HbLVNEvsaeLvs3zmVETIYdyqniHaj4F0Sr7rJoEOAHkdHsfbRfZrzLlnmllqS8rMLKjcICoeeFRRaz+0R4ng7tKTj78uIVFCDfr3n7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUCaDNepKLJRVIZ4H4OHESomvUiA6JubDP+Dz8PUAd0=;
 b=quU8hZ82xB4/50DgDNbe/pudBSUFv1tg3XStMR8tO0kH55ghs15B91FRN41Y4yBpd1s3pe2pbgFYk8gVHXzHCqQKWmxWBif8zk4ng4t7pTQFa/ljjh35CPCJn2Vzt2GIRV1MP1Ev7dwVYKepttYSh+rb2XtSJ5i8VaxiNCZVjfE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8240.eurprd07.prod.outlook.com (2603:10a6:10:279::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.12; Mon, 4 Oct
 2021 07:27:56 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Mon, 4 Oct 2021
 07:27:56 +0000
Date:   Mon, 4 Oct 2021 09:27:42 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 04/11] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <YVqs7iJs6T6KSSIP@localhost.localdomain>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <b2aa14df2092e86191986cd558b48ee6536aa47d.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002140839.GB34532@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002140839.GB34532@roeck-us.net>
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend Transport; Mon, 4 Oct 2021 07:27:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa689f1-7dea-4ed0-00db-08d987087c1f
X-MS-TrafficTypeDiagnostic: DU2PR07MB8240:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8240D8AD52BD057A339DC6B3EFAE9@DU2PR07MB8240.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +OqAtl7LlmCEkiOhrCvxOmN0WNfreo4bDy6ThRHaF+XVD61mmWOG+Uj6RFd0sti+CsfX1V+ee03EqTG8ftGekR2MYb5jUJvjMuGE4wJrqoBstIECnkFepqH6f4hVEoqJpI9cy4SrnCvH0sJwXZyVX9iP9x5oO7Lzc3Uh/Kd8gR1ftL1WvrMCOzfVH08yZS93lOH/shzb/TlP2Xahg35Wq+CQLZQbV4w/P/DbgVfEsPhJpfEq+mY36SydoyQbbs5gCjEumqguFY5Gk7oWv0bNu3eepPYeA5s/oZyV+OU1ZVxhyVlI7cNGx1Ukl1vUudHZtn2l35fLIa23z+9BonizPNEdTyE2qXhQ9JMHzRIlp5y8Da78Ad28A3J8LmFVkkRJBQsM9H3vCLWayUjQZjwCFL4iOx0v1C89IOCiRPH0OH3Sm7T57pfYi/5/E2Y5+72h0bHSgGyh1/XBOOeXvlg+SSwAAcVH0jUlLrsihuuiZRTSLC8D/9vKbtYzz/dJdD8xtRWaQmhUIN+ZKsay6msOBZQ+XeSO6Zx3W5+L24BdfMiRH9pv0en2SoB5UI4KZF1iOfdPcIfqD8VxcHVD1Z5DanWgTQP2zEmpgoRmTzkBL99vKMfYio0Z8i7TApnXlPWP3ZlMlmKEnoTWsn/9ekbuxpxvHx7Ww8ZcujhCdwmN9M0XULZ8/yzJTwOjaX2a8qVMuRxA4Zoa4HhXAgM97pmLzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(186003)(5660300002)(6666004)(66946007)(26005)(66476007)(66556008)(2906002)(55016002)(6916009)(54906003)(508600001)(38350700002)(8936002)(52116002)(8676002)(956004)(4744005)(4326008)(44832011)(6506007)(7696005)(38100700002)(86362001)(316002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUwrWCtQbTBVdW9GakZ3WWpGNHpTeTQ3bnJxUHhxYUw2WDZ5ZDgyTks0WWgv?=
 =?utf-8?B?SGk4UUFTTUZ0WjJ2QnUzaFlRNjZ1WmN5YmdqdkV0VmtvQmVvcDNoeTJQeWRH?=
 =?utf-8?B?bkdVSkJxU0FSYzRsdzMwdGFhVkJTYS92MlZiOGIwaXB5MWJjSHlCaEsvYUFN?=
 =?utf-8?B?YlM2b1phMXpXb3JFRUJIOGVXVXY0eVFsRUdhaEkweVo0U3VKYVRjM2RVSnYy?=
 =?utf-8?B?M3Vld205NnlEbTZUdXZvRUlOZjZhOUtOcStyNFo3U29CeStlWFllZSswbDhl?=
 =?utf-8?B?dHA2bWI5NVFDU1FnRjZaWVd1a3VPQnFJUzFDT0FIR0t0MTlKa2dYdENoZFJv?=
 =?utf-8?B?MGdlOWZ6MW5GbFpDRHF3Y0hFVUdOUnVBRWhhR1o0eStKVG1ZVWF6LzRHWDV4?=
 =?utf-8?B?anBtc3FxZ0QzZFhBVTRvZWpZRXRWNndqSG91cHdGOUhYWnBaVzVuT0pvdldk?=
 =?utf-8?B?RVNlZjZja1BoNm5FeWtwNXQ3bkVtRXI5M2YyNDNJZXpUUW5HeGxSMmluSEs1?=
 =?utf-8?B?QzdGUmh5TFkwVGU5YVZTMHhWWTBaZGNMSTZBODVIK2hMdzd4ZE1kQXROQkhq?=
 =?utf-8?B?YTBUbXB5cFZNUVNvZEYzUTQ5MlBVZWYrWHowZE9HMmJGeVFoV1hPN3FVYUdx?=
 =?utf-8?B?TjB5SmYxQ0ljblFSTDE4bTQ0bmx6SWs0K0lZa0ZBQVgzdFdLWFByRWpZN3I2?=
 =?utf-8?B?WkpJeWFjeFcram9ZanQwaUNEYjl6K3FsVWw0dHl2WWdQMGd2NmxXblJ2RXZm?=
 =?utf-8?B?Nmo5OHY0dk15dzZOQVJVOHhYc0ZUZ1BBWmhxRVQ2cUIxRWt2WUJGWFlLNmU2?=
 =?utf-8?B?Vjd3bHFFeHRzTjdHdmpsTDdPNCtkaC9sUXJRZ2JLaGxXS0NYVFdSZDh4em9x?=
 =?utf-8?B?UzEwTExudkx1b2hodzJWWDZvTjgyU1RVVndtZU8wQkpPLytYNDk3b3hOVTlT?=
 =?utf-8?B?dWFtNzlWMnJGSXJVWUJlMEJ5TFNqUk9HRm1QeUtubktiVWJhSGNUMGxWcEo4?=
 =?utf-8?B?ZGVBOHlMbGVXdmoxMmdGRWtzY3c4TjMxeW55MldSZUhZSStXVHdqYVpIQ2NN?=
 =?utf-8?B?Y2c5UlV5YXhWdzVrVmpXZW9DSGNWWkMrQXFsWi9lUFlXcEdaS2k3K1FiVm16?=
 =?utf-8?B?UTd1b1F1bkJYZWlYSHk5UE1PQndJS28rNUFUVUVsWjhxODErZDNYdVNGWG10?=
 =?utf-8?B?Z0Q5ZVZQcGpTSTZEL3laMGRlb0plYWpUR1lUREorbW9FOWY1U245U1o3MHh1?=
 =?utf-8?B?YktCOUVGaml5bTB2SkgxOUxPWmJ5T2J2a2l3am9sY2cyeXUrZEhwTTdKZVRO?=
 =?utf-8?B?eUJCbkN6bDRiYU5ZbHFvdko3SHVBR3pMV29VdVVtTWZmc21VUDlwUFBhR2dv?=
 =?utf-8?B?c1I2QWRyODZ2TkQ4ZTkrbmRxQ0lyTklCWGRTUmtwZTlJd2owbWNBSDZ4MlBV?=
 =?utf-8?B?UFI2bHR2aUQrMU05akNpMXRCTHhTYjNZWTh6TXlVNGdCSW43Y1hrYStuMURx?=
 =?utf-8?B?NlBWcERXNGVuUTNLMmRZaVA2dkczOU9PQkk1L3N3UGZMVEJKdGd2YTNOelUy?=
 =?utf-8?B?OHh2UktsV2VZVnR5VmhGdUxXS1YxQ0JjbjY4K3d2YW1zSS9qMHZTMTBvbGRh?=
 =?utf-8?B?Vld2NVVtNU9yMmJCQTRMbVJLeXJKSGNldDczR2RzWi9jZHB2VHAxejlpZjRY?=
 =?utf-8?B?bDVaSThoYllQL0hXRFBrK3p2TE1seVpieVRXY3R5TERVbnhIdVNYNUdnL21I?=
 =?utf-8?Q?euslqX4QOG5IoGICWNfCKC18W4qqlvYw1cQsKv7?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa689f1-7dea-4ed0-00db-08d987087c1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 07:27:56.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfbOTvsEd4yiC1yLwv56Nzc4p1asTY4YZksoMAtP6Qr7LhG4973jDmtLsQ2JETHocKLAeMoWutexkLBIeHrDrvxqMWu3WvxkZ1/trrOWcwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8240
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Sat, Oct 02, 2021 at 07:08:39AM -0700, Guenter Roeck napisał(a):
>> @@ -286,9 +299,53 @@ static int tmp421_detect(struct i2c_client *client,
>>  	return 0;
>>  }
>>
>> +static int tmp421_probe_child_from_dt(struct i2c_client *client,
>> +				      struct device_node *child,
>> +				      struct tmp421_data *data)
>> +
>> +{
>> +	struct device *dev = &client->dev;
>> +	u32 i;
>> +	int err;
>> +
>> +	err = of_property_read_u32(child, "reg", &i);
>> +	if (err) {
>> +		dev_err(dev, "missing reg property of %pOFn\n", child);
>> +		return err;
>> +	}
>> +
>> +	if (i > MAX_CHANNELS) {
>
>I think this needs to be >=. MAX_CHANNELS is 4, the array size
>is 4, and i == 4 will write after the end of the array.

You are absoluetly right here. Off by one error. I will fix this in v4.

Krzysztof
