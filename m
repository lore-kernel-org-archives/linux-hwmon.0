Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C24FC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9FF861241
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343661AbhIXM3U (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:29:20 -0400
Received: from mail-eopbgr140130.outbound.protection.outlook.com ([40.107.14.130]:19170
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343615AbhIXM3R (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:29:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsR7Jz3OqIu1LtF1GcedHEwTvBU7KVk3uV5JBDY1FOvOClGjSA81bcKsjc618H0rW1WcCT43fbLtBVs8SMJ7c/KVaC6vlBlt8Wd9r85KvOjmkUhXHHUffAd5bwd6Y1SfgEwjaRvzgBIBxHmoxI9QnZ3iB00jtcJUs1ZqTfFqaapse14YXpMkNEDDYLRjjfhP2IOdWgDKC1VRvwhuZjYO+ben4yS5SVDnbj749V5w1oRi1gmrHVZmo2OVYYM68XH6RQJt/5ZhKiQNATMtlb6sLx4DfJCePJA0YN1yAlPiBiPTEUidV+jE2rJF0LEpdP6H44I07X3bDFRgL0rc/8ZExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW65HuYdWEWmLq11eC3Fqf20dvWfPwzjEQhE842iTlY=;
 b=lho87NmFhhM5eUhEdOG0y4behIr6XFdp3rXkVTQtn9MzIUA/M4bbZa/Xg4A8tENhKOSq9fxuVvNienjHzPUq/gOAJCqG10gIz6La7CZXwAyABnZc8xXogWB6WgC5H4GU49XxolP+ig2UUFHLr8cMOQX6/lz5qoUrSTuC95sErDnddDNw6tdg1rRnepK0S7qxuZWV3MFv2tEIFJKFSaMalI6Qpar38xsOnv1N/QM0bpm2TaJW98qluKZ295C6RyqcdFsOODqjgmgZeqzXoiH0BQzI2HGYq8DUctjvuqASaodTfjeUWjDLfvLi143SXZa0zI778dMBYWS19q1+xFMZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW65HuYdWEWmLq11eC3Fqf20dvWfPwzjEQhE842iTlY=;
 b=SoGLFUOkPx2ftI1pWvxmB0U/tL/ovbUsmHZN0dw2nv6/mBsf+FMYpAcELxUJd9BUUS+gGZlK2jp+rV6qXZvmRKaltmirR4SBT7YcBeA+pmbX5Lk9h+dvjLffkQsASQb8Nga2r/O991ZaiqJ/SXl230ybxPOZNBVTi+WUxL8y6jQ=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8271.eurprd07.prod.outlook.com (2603:10a6:10:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.12; Fri, 24 Sep
 2021 12:27:42 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 12:27:42 +0000
Date:   Fri, 24 Sep 2021 14:27:31 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: Re: [PATCH v2 04/10] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <YU3EM8SJ9GA83PhP@localhost.localdomain>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
 <fab57edf8a0b8b2bcb2a7acefa1e1b65a9534f31.1632473318.git.krzysztof.adamski@nokia.com>
 <20210924121706.GA2696746@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924121706.GA2696746@roeck-us.net>
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Fri, 24 Sep 2021 12:27:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08a548a8-1d78-4721-1043-08d97f56b477
X-MS-TrafficTypeDiagnostic: DU2PR07MB8271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB827161D4AAF9A018CA8C1DC0EFA49@DU2PR07MB8271.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wt9aak71aPTn2uGr9jovEP/Gz7h5CQMoSbuhb+gQJcqUUWHM+5CDFe2ZQoXyqN61CthEGQstDvqUq0a9EjuuzTBGmsM4tSW6TVKgzCrENuaX627TDLyT1AtjNLGyUVTv6RIjMxXoBX7yxdjCIHT3Io21rkAI69AsVCAWYhpA/6GG0yrHzBgylOyqEiinLbbh9PgGnr7lWLEP70Gc0IQbXSeGV2TyEVcLM8HeGQPR25CKAxC5Pk5b63JA3pQf/ZLxw9EW6ifFwNDsjoIWC+mRepqK6eGkkUZ42o0MGx8UxgLMK9XrIPVwqrMInhjhgPKs3bHXIanvkd18oypZPrcyW8u2HziWbzcIoTVxJqKHU6d8yNF6BhuGZqK4qJ7o1mXMwDEG6TcBF4cxopob1wxVr8dsQHb1imrQL4dolebJXqBTz9901NTgf3XzCJKQHbpPLRbG/Nd5PB5FJuiH7bV22+mGOzCPh3XjyAvwhg9F3ZcrKK1iiUVlOFFAtM2wDJFYkyojalemc4lJcNSZ03G+j/NvRCTRXKDEvHTQBfLFMTYPptm2HzxGG0ljNDmP53SKFmKNnP/CszIDi8x+yJAg3/kravwc+68Ix5uyYk8Tu/etUrZJzc244PVZFzYhdejUnO2HQ8Pfeo2XdrwRL2PHBLnUyz/s0r5nWUwihOvkWl0jXg45tEzOPqNEtTOMwX6WiqcYFX4161BogfJH5QKM8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(52116002)(956004)(4326008)(8936002)(66476007)(9686003)(54906003)(508600001)(26005)(2906002)(38100700002)(5660300002)(44832011)(8676002)(6666004)(186003)(66946007)(107886003)(38350700002)(86362001)(6916009)(66556008)(7696005)(6506007)(316002)(55016002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVjcnNNVFp6eG1iV2xpc0VNS3Z5TXhEdyttZ1IwenNOVlVOK1ZkZkkxNVZx?=
 =?utf-8?B?ZUxFYkZ2NEptbmJBeml6aGpFZnBrc3J4TC83VUxvZUVoUVQ3MTF2Yk1PYWJn?=
 =?utf-8?B?OHBZZjl4MWt5aEpOVlNEN2xjSmJFV2U4dzgzSHJKc0NFdHoydVN4UitFOFFz?=
 =?utf-8?B?cUp3dDF4THJxQjkrZFdIQ1VYRWdiVDJtbVJ6bVQySlpxRDc5aFVIOTZIa0dO?=
 =?utf-8?B?aVpPYzYxRlo0OEdVd1pibGtiNVdFQnlVaXltcElhM2grWlJYZEVvcWpXanVa?=
 =?utf-8?B?LzU3TlY0UHhTWGpwMzI5RjhBNVl3UzE0OGNabU9GRGZjbksxTnZSTitJT2pE?=
 =?utf-8?B?cHJ5NERNdWNjcmJyd04zaUZUT2JNMWYvc0MvNkVZUFNPWTFpaktUWWx2c0k3?=
 =?utf-8?B?ODV3UnBJQktZelVrcnhBeXhCamEzWjBDczlJUzVQc3FlclUxRDg2OVk3d2dX?=
 =?utf-8?B?OFdHalpxTjV6cE9qYXpaWnZRVzBWazBsRUJIZXpObVZNanRFSkczengydU9T?=
 =?utf-8?B?S0Fpem9xZlFVbHJnSmhEZEF0WFNSK0xWSE1GWmZ5VU5OZVFPSkplVkp0MEtU?=
 =?utf-8?B?SHNnRDN2T3lKOEJpQzM0Y1haQlJNZkJBa1V4elNUc1N6akMvWGU3cFpPbU5o?=
 =?utf-8?B?NFhSYmJ6WE1MZUNicG9oY01CWWdHUWJpMXE2SUp2ZlBFNDRpWFd1TEo5dGFI?=
 =?utf-8?B?V05NYks3c0xjUXdwTHJFL1VUeDFPbXY5ZmRkV1ZlS05RS0Yyc2pRczJFK0Rv?=
 =?utf-8?B?b1k1TnVvLzNCSEhINWFZalpEN3dTakl2ZHVENVpyZ0phVmthZ1hJK0J3a3Bz?=
 =?utf-8?B?aDMvQnlCcElYL0MweWZrc1JyM0QzZ1ZmQUYzdlNEdmRoN3BFMTlmUSs2aHlz?=
 =?utf-8?B?SDg3aDZEblpYUXEzYTM0ekNpVFZ6RHB2Z3pacDlUNkdKV3pKZDZUZ1FOcFlu?=
 =?utf-8?B?bHhvd1dKZHFnbVllelBoUHRiTEt5K3RvK05jdWl6SldlM2Z4QTMydzRCQ3ZO?=
 =?utf-8?B?WVdBT2xGZ2c1c0VPNkZTSmU0ZTZWKzJzbDNIVDllRHcrZUxKaWJ0ZExSUWF2?=
 =?utf-8?B?bExzWVk1M1pXVXBLR2JxOFhQZVFOdzJpWGhrU1ZuL3FhRENrV1FWV21WQ2Zn?=
 =?utf-8?B?NytLZThMRDk4MWdRdGNjQ1NvL2ltU2d6c2FUZHFJVlNub0hTQkNMSU5zbVlW?=
 =?utf-8?B?VERUZ2QzRE9GQ3RieXR6YW1XaTV5VExTNm13cTFHWFFCQlJ0eGsrbUsxUUJm?=
 =?utf-8?B?WkVaSGcxdXZ6YnFEQmdzczVuZndGVjB0VmVFUGFFZGFZTCtMRCt5VkVCajJa?=
 =?utf-8?B?TWp0N3lJRlF0WVZTeFJSYU9ScktEeS9McXQ2cis2cFJSNkJMTDMzejJvS0hR?=
 =?utf-8?B?MW9Hc3ZYVUkweGdhQzBoSjdWelA2MmswV2QxMHlyZGNmcXBWS2p5V2lJNVJx?=
 =?utf-8?B?SXBpUmlpeWw5RVdhUHZVQVF2c29vQnVQUU5hc0tiRlc1Z2pVa2VpcS9mc3li?=
 =?utf-8?B?WjJtRG1Idzd6Y0xFRjl1NjZ1MEFMNmdCV0FOa2NBYWJlNUJqZVZIdUtnOWpS?=
 =?utf-8?B?Ulg4eTUxVnNOanZ6WldpUnFvaVlaMlE4NldGKzIyZlVqM0F2RlMxZWVMRDI5?=
 =?utf-8?B?VE9ta0tkTU1wckNZNTVrWGpBSFNPT0xvby8rNGxrNmRhVHNZU3NRcUNVTXBY?=
 =?utf-8?B?TUlDQ0ZZYU1xeDArblE3VU5WcCtCS1RGZHV4TjR5UXlqa0YwRlA1dlFsc3k3?=
 =?utf-8?Q?fJ/WsuAREYak3yfOcsXXFBMIrzSkLlDakB+P8h1?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a548a8-1d78-4721-1043-08d97f56b477
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:27:42.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TusGre9ywkKLzJa6DsIigaW3VzMf619GrrEIFGn3+s5+F1Q75IcwcnauuHfYRNruGInbk/aZU6/XE9ivYekTKLR2QKTceYTf89Y5YgIip8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8271
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Fri, Sep 24, 2021 at 05:17:06AM -0700, Guenter Roeck napisał(a):
>> +static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
>> +{
>> +	struct device *dev = &client->dev;
>> +	const struct device_node *np = dev->of_node;
>> +	struct device_node *child;
>> +	int err;
>> +
>> +	for_each_child_of_node(np, child) {
>> +		err = tmp421_probe_child_from_dt(client, child, data);
>> +		if (err)
>> +			return err;
>> +	}
>
>That makes me wonder: Can there ever be other (not temperature channel
>related) child nodes ? Power, for example ?

For this device? Nothing that could think of that could make sense. But
we can be stricter here and skip/ignore all the nodes that are not named
input@X, if you think that is reasonable.

Krzysztof
