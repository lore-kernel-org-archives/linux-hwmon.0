Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5954DC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 17 Oct 2021 00:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2360C61040
	for <linux-hwmon@archiver.kernel.org>; Sun, 17 Oct 2021 00:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241249AbhJQAC7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Oct 2021 20:02:59 -0400
Received: from mail-eopbgr40101.outbound.protection.outlook.com ([40.107.4.101]:1715
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235752AbhJQAC6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Oct 2021 20:02:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0bMkW9c4POBnU0vJH3zQCO6TJKOacZdyz76ddrYJXaP0qRWRhGlnRIwL/Z6cnnFPq1HUIMZtMWfmcreOs5LLv6rtlxTq23EN5u81s/pKi8skiTv6DvNDukV//lEVftRAWwGLvBoNCRy84fIsGLrR8pvvSubUFp0Ran0aH2BnMDI66odTRJPEtQFXBpoZN4bNgqH2UKkAzmltgd0O0h2w5Os2ExL+N6dAxiKOyKu9aSKzZVhiTJ9Ksk6IRdP8kKVQIsveGerqJr0V3twaaRFqoodcJbItNEI3qc/RrcMaVIxTblff1OIGayzLmwuyl3zZUkq1QYb43WSAwS+jsCGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os05sUWLkiHI0eBVgEVEQnKvx+xDwZTX9fkBp+TOGcs=;
 b=LMMsBocH/NdbvPxfC2y0+ilW2FeL9zbb9lNaAKaPjZ2tONtXbEwsm68gjiO6QqtbCyhNZRnJvFcN+X+qgg6iWDtSiwrh456DZS3PHrpt3dQ16Fmj5iNDuHrZcTOMDIG9FXrGm0kymAjvx+A6ZDijQ+CASyWIdhU/IbpZzTAx/U/xRn7LwxgXocCobgQO31//3EwHw2OEqPFSP0fukLmYUl7CPVGMI64EvK08rTbUBBja7YwVE3vkjZWi8UdsBIqOQLx70CFaXqPj8yd3iNYuevd17gW28UvVJG+UUCv4p9A7q5kgdTDoalnJOuGvjibabk7Mg+cinaoSarxxAZleiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os05sUWLkiHI0eBVgEVEQnKvx+xDwZTX9fkBp+TOGcs=;
 b=xr5udVCScRhQaI4DApOW52lkzC9vNd27ozvWCvQHuUTsdUWclf9jHwHtNLL4t/+yEltjhU9/BRBsk6YwmbmF6s350FeCsds6KLsatk0cqtULQLNwMJMEfMflWwAfSPRC0FjE68FEKRgM8GOFPrzws1HALU0N2QJW/Y7Kv0SHSRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8143.eurprd07.prod.outlook.com (2603:10a6:10:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9; Sun, 17 Oct
 2021 00:00:47 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::29f7:293c:1862:b136]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::29f7:293c:1862:b136%7]) with mapi id 15.20.4587.026; Sun, 17 Oct 2021
 00:00:47 +0000
Date:   Sun, 17 Oct 2021 02:00:32 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/9] hwmon: (tmp421) support disabling channels from DT
Message-ID: <YWtnoC5s/W8/st41@localhost.localdomain>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <a85d623f0792b862870933a875bdf802f4c017f1.1634206677.git.krzysztof.adamski@nokia.com>
 <20211015224741.GA1484653@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015224741.GA1484653@roeck-us.net>
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.23) by MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Sun, 17 Oct 2021 00:00:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e4dafdb-a0e4-4228-9f59-08d991012c0e
X-MS-TrafficTypeDiagnostic: DU2PR07MB8143:
X-Microsoft-Antispam-PRVS: <DU2PR07MB814320FB9F68E37D08D741C5EFBB9@DU2PR07MB8143.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yd4FsogqW2cCaX7PAU0HDZdhZFTUmmNHkdzXYO7KXp3jw9otMHAD8B7aHEap1J+9EaXOIxvrfC7ehxJhqiE3UTR5HiCNDqMwKXQ5wbQAnBNWbCZqYyvj78nuO1DMZqbaA9ZYOWdocyRT0lBLWzYdmGlifqbB4s6dPt5rrNOpa3lnbGn7hSEOx6cgfXDlyMOLn02JiyPuI4sl5Mzdy6S3btXE/SeehFOasZlabYIPniI9tcLpjBK1SnOBrFPfIT/54DWlbH/Wva5DUUJERyijtX6i6rmM9gtnkh/HZD/7Os3Rl2BMnlOSUcT9KFYlVe43XLFMXL2Kh+becAzEmC1LFaeOjShwESjFP8XkPcTPPqrwUEmY0nVAxngln3tUC4pcB4S3BoIOXimxsNsYgqn4M0W4SWt9UgRtDGm9ATBOxSJpCBjsiCQfjdqqVIiHQrnMZNhekc/7yw4ORvveAjV88z9O12g0U0JRWmG/l57GkYSgCtGcKguneUFcqDjolcNVSFRpBySEBIPHpvalET8J/cMgFVc7yyC9ADZoiQvKZCwLpIbdzcOIu16cBXBasIxBp4iTNPflS0WXxE/xUu+FmuQPpoRQrrlE+xRRUndeDtd988/cqKt8mFshx8IbRkmrx1zlLUggyDgTYrqdV5cRwylFow4qxEdQf/pigTj1z2BcHiwdRcyayuV5gLlDrtZSn/uy+CoFvAVq25S8QqH3Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6666004)(66476007)(7696005)(38350700002)(66946007)(82960400001)(9686003)(83380400001)(38100700002)(956004)(8676002)(6506007)(5660300002)(186003)(52116002)(66556008)(86362001)(6916009)(316002)(8936002)(55016002)(2906002)(54906003)(508600001)(44832011)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2x4RFNQRTJ0TVZQOGtWd25EN2JZaHVPd1NQczU3d2VDZDJQKzlWTmR1R0Rq?=
 =?utf-8?B?Y1dJZjhCRkw4bUQ4bE14bE0xYldxZ3Bqa2hTa2pEWE1taHFDWS80aG1HQ21u?=
 =?utf-8?B?aWNuWjNuMEpYYmg4Snp2WjBhcHZFbS9RUHZDVFRWS0Fxay8ycEd2S0JNSnQ5?=
 =?utf-8?B?S01UbEYvYlp6RnpjM1dZOGtna0RKOE01QkNaOTRpT2NiSVJZSEtPZzlJclNw?=
 =?utf-8?B?Q09jT0x2bTg3eE8vVmR3UnYrWlA2ZS9vUU8rNlNMcGh5STRLeTRCOGhHYUg5?=
 =?utf-8?B?TFM5RXNkOFBoNExLRUlWZWpJUkx2Y1BxbEgvc2w1T1RTaC9rWjNydUpLRXB5?=
 =?utf-8?B?WmRUQkhjSlNOdnNyK1hkYlV3dXF1TWwrckpaL01BZ0dleFc1bW5LQzdpK2lt?=
 =?utf-8?B?YUdmbllPOTRFTEFDRzVmZEFGL0w2V1dabmF6S216V2hSd0ZZQUlrMVlKTWNP?=
 =?utf-8?B?VTFRREdOcFVlWEFqQ0xRR1RNZGFGeWlIUnM1cmNVdlFSY2lMcjRsOTBaeDhT?=
 =?utf-8?B?QXkwYWVMTGlvbmxKcUxjNldPSllyeGRZOEdVRWN4ZHZrSDBxU3JNMEpYZlgw?=
 =?utf-8?B?aXdhWVNJSXRwS1RuSVhIV3hHTUdLREYzU0lZQWVCa01YR0xsdEV3MUtSN1pM?=
 =?utf-8?B?clFqOGFOTWxwZG03RmtxYXRoQWFSOGlWQXZWREtHVm9nL0dTYVVQT0RQOGh1?=
 =?utf-8?B?NXFCazhqeXhSVytpSzR3R3Y2b3YyMDFFU1RxZ2hlS3pCemdqQmNKUkJYL2lM?=
 =?utf-8?B?SjNmbGozZms0K0k4c01kdVVLMEpFb1Jkb3djekJQWlZtTHF4L2x3MXFzTytP?=
 =?utf-8?B?bC9OU2xKeUJ3ZnlKWmk1VEdEMkNRMmZKQmNJTHl5ZVcwUlVNaHVtY0xhYTlM?=
 =?utf-8?B?NEJPZjJUTFJhSnJkOTNycm94Y2FZMmdaTEZzbzZKSUlyRzlrbHlSNmxHRkxk?=
 =?utf-8?B?NGJ0L2RqQlhwSVNDSjA0TzQ5TjhidzFzckJ2YVNWTzF0cXZGNlRrVERSbXN6?=
 =?utf-8?B?OHB6cEgxNlVyc1NMdGxJU21SRldwbDRmSTZDSzUrVHI2L0JxVFhzVzdiU0hC?=
 =?utf-8?B?YVBoSFRGQzNJU0ZKMEd1eHd0R3puRXBQWnpXM2Naa3FVVjV0S3FBcERRTngv?=
 =?utf-8?B?Q3hqZFRXb1VZMy8vNXk1b3RmenpDdFgxdlpOWEd3enJjTG1MV1BvSmFVZ0ps?=
 =?utf-8?B?bExRdE94S3N5Tk96MDB3OWkrTFBvWU9IcVgveUlUUEhaVE9OblYvaHpTenZE?=
 =?utf-8?B?SW1VWDlObytDeFZiN0xFd2ZtcjZNKzJWRzIySzkvKzVUVmdHb3kyUm9RLzlJ?=
 =?utf-8?B?K203YnA5clp2MmlBTzhnTDc4b0RHMkYrSEtNeHozVnRDaW8xTW01NTd5Szly?=
 =?utf-8?B?NFp0SzFIZDRFQ29tRGx1N1dmMWt5cHV1dHQyUjVVSHpYMmwyZUlGb05nVEJt?=
 =?utf-8?B?NWJHRE1uNEtRdVpEMEtYVnBkNDJoekljY1JGS0tQQTM5WTIzb2I3eWc5N0pF?=
 =?utf-8?B?c0gzeThWRWVLNVhZb0lRV0k3SmlOSXRPYUVqdUt1TG9BRG9qTlNSYWJFam1x?=
 =?utf-8?B?bEFMSnJQeTRBdVEzeWxmK2FWNGpjUy9XWU1vVy9jZEJLWmtJMUxud3FHSFBF?=
 =?utf-8?B?MXFFTkk4bWpNcTRLNy9Xc1Q2ZnpjYjhTNlRhQ3JQYzZid1IwSVZFcGlqN1FS?=
 =?utf-8?B?SUI0L0tsTDMwSWh2QkNDcXEzem9LL3hXcnROM2xMWFFsa2FCc2lEdEhQMzBL?=
 =?utf-8?B?YnYwd1dxdTl6R0JQS085Uk9MUWRoVGlzVkordmkwMFlsdTNCNXc2TDlrajNU?=
 =?utf-8?B?RHEwUEprRnBpd0gzdzJSL0x4SDNZWUZFeTVPY3puWlZZQzhYVDh4ZWduMDJj?=
 =?utf-8?B?cjVIdGtGN0lWdFA2a2paM2xRRGxrZzViYjlnbndtWWxxUWpDamQ3ZVhiaTkv?=
 =?utf-8?B?SXBkOWFpSG4yVHdHTW11WHR1ZmlSM1hqaDJWQkFSczAxb2ZEcXhvMGYwWXNl?=
 =?utf-8?B?dTEyN2lTeXdQck4weHF2enhXVlNNV3YxQ2Vhb0pCdzlHdnFkeXQxUjJ2ZWIz?=
 =?utf-8?B?VVFkOUtqcHRQeTlBTmVSbFdhNzNySTRCVFVPMjRJZlVXWmV0VUxnc09hRlJz?=
 =?utf-8?B?ZGJTajlSbXBFRTMrZnhNa216RnFzRHkrK3JJNzVnWkNjcytKc2RxSFNRblpN?=
 =?utf-8?B?aEJXeGN2WUdHNDRRUm5kZnlRNm1YYjdqdUZPb1FTMWhoMWxUNVQwTGxaTmcz?=
 =?utf-8?B?aDdtVW93UHBwL0l3V0NTSlJCdFV3PT0=?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4dafdb-a0e4-4228-9f59-08d991012c0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2021 00:00:47.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0g582sSwMZv6NrdejiKEwvRQ8UsK5q23MxYjJmtRFt5Hno1Fx98SsMiqCPDSUxxq5L7bcCbWxzJS7Vx96a8s2p8xLLmjBPJhu5UJuJDHbq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8143
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dnia Fri, Oct 15, 2021 at 03:47:41PM -0700, Guenter Roeck napisał(a):
>On Thu, Oct 14, 2021 at 03:01:09PM +0200, Krzysztof Adamski wrote:
>> The previous patch introduced per channel subnodes in DT that let us
>> specify some channel specific properties. This built a ground for easily
>> disabling individual channels of the sensor that may not be connected to
>> any external diode and thus are not returning any meaningful data.
>>
>> This patch adds support for parsing the "status" property of channels DT
>> subnodes and makes sure the -ENODATA is returned when disabled channels
>> value is read.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>
>Same problem as with patch 2/9. Any idea what happened ?
>
>Anyway, applied after fixing it up.

Thank you and sorry for the trouble. It isn't trivial to send patches
via our enterprise mail platform and this time I had to contrive more
than usually. I did use mutt, as I usually do, but had to run it from
different machine. Even though I did use the same config, the mutt
version was different and EDITOR might have been configured differently,
so maybe that created a problem? Or it was the Exchange server which
mangled my patches? I don't know now but I will watch out for that,
thank you for the heads up on that.

Best regards,
Krzysztof Adamski
