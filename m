Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DE3C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Feb 2022 13:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238379AbiBONkr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Feb 2022 08:40:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbiBONki (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Feb 2022 08:40:38 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50132.outbound.protection.outlook.com [40.107.5.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587786E8F6
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Feb 2022 05:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCOR+xCH0Jn7iJZJHdJv8L8FU3UugV26GkPFZwUgQeaPJEV4/P4pD2OrvSE0k//i2B/s7mMrbEie44pjc7GdgeJxik/K625chkJxqGl5mWGfKipy/6HIUldL0wjOgTIMJOP1YKlzppQvgh2s9A0h/qfQ0kHtpKOp2YoNOiYRvA6GVFfd3q0w5nXBRYljfe6MCgQhLEOx6JYP/x9Whsn4teCYiYs34RvHmCtIXICOg97YlvkXuyaHmLak8tRnNvRmReCNrXpq9jZNJkTLrbcXQbnmz4tnNXdujeucKEF+fZ7WzhwcsfuBxjr7N60C5UZlyq6v1RhTAo4ojpRZvOZstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jgR03JtnhGcFxKyPzxrb4nKjKbQxb+dGMwTiycHmX0=;
 b=aGbZhteSa6vOfXA4KKxOHFeQT8JwqARlyV+dOJUgfUvoYL23Kp1kY5ITnwVS+Z4LbkbKgLhTMNOnVNpLddv3mrtL9zvl0wi9rPH/f+gA6FEHGfC+jsiL2TH43opNopuYxt9C8gGRFalOfzri+W0/wVyh9iyxP/R9WJ4pgnkwehgbpw7uBLiIki+H38j19B2SfBdKDDwVbFbLirQ63NLuErXAFysWwNMpAjiMCLtasQOoqaH8A/Bg1FDOSE9Uv1dfPfWCgkyvbAoc+jqZZQdajpIBgIc0CuPWgcmw2lDLcmL5sAKZyylWDBfQPGjEh5KKLWzpekf5tCzwuWg1qmxs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jgR03JtnhGcFxKyPzxrb4nKjKbQxb+dGMwTiycHmX0=;
 b=r6QJj73A6epT1joBOgp2wmD1bxySqXEejPphYgweheo8S4dgp+vkrNb2KwUFx4fT06eM35ksaZ5/cZ18VfZLzf80IrFgt3sYsVmYNyXHERkHKMG5XKuyEEweCYqAdjJqhrO9z/idhh21ky7WigDyXRYU50IRQvx0N9Wu+n15xRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM7PR07MB6916.eurprd07.prod.outlook.com (2603:10a6:20b:1b4::19)
 by HE1PR07MB4171.eurprd07.prod.outlook.com (2603:10a6:7:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Tue, 15 Feb
 2022 13:40:25 +0000
Received: from AM7PR07MB6916.eurprd07.prod.outlook.com
 ([fe80::594:fa1f:92c5:e546]) by AM7PR07MB6916.eurprd07.prod.outlook.com
 ([fe80::594:fa1f:92c5:e546%5]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 13:40:25 +0000
Message-ID: <277f551b-b732-8f9b-db8e-3432798e0984@nokia.com>
Date:   Tue, 15 Feb 2022 14:40:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
Content-Language: fr
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
 <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
 <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
 <1e28b6e1-8675-1059-1a79-7148e2a91e83@roeck-us.net>
From:   Agathe Porte <agathe.porte@nokia.com>
In-Reply-To: <1e28b6e1-8675-1059-1a79-7148e2a91e83@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To AM7PR07MB6916.eurprd07.prod.outlook.com
 (2603:10a6:20b:1b4::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b472ec66-eda0-43f3-fa21-08d9f088b87a
X-MS-TrafficTypeDiagnostic: HE1PR07MB4171:EE_
X-Microsoft-Antispam-PRVS: <HE1PR07MB4171C686C6F1FCB04B316E109B349@HE1PR07MB4171.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O87pcIUm49uutr3mf8EfsCmDffwOkQ85B5sfxaXltNkWfVkKWa4uVC2m2jGs9MKJOD89cJoQxcCT8P91pZ9p3xU95WiDycwxPsgueNY7mMpvKLgyuJxb7aADpoJENXJbtSH9edzTohU6ftnCc/SIwKHncHaUuhZ+3zoiPaIwOnDeFY9n5rsCm8J+k++56jf/cWlmzUc12vGMfGTVv0GuL3cgig+7Km6nMiqhkwQg1GVCNeMsZigwXeOCghHyQ5wknYHBoSrN33qmusvhEQL+/gTZ8xAm2fnyi3PNBb5LKPWrFEZGmR9yDRZaMYpIdjp0VebblrTwy1oJg8QOCm7onOcWNFvx6f5jFxC4A80x89o/Ng4bHaxFyfkEyvv8yYpcpToHUSMo6U+UVgABFyVWrSx2geV3idQybJHku89C+2VCOA9cMAkU0hPF8Cp+qGq+UOnUZDgw+fGdT6703r+NWs2yarmkfIm/M0LaUwoPFvA4GsaODrw3+iW1ByszvPf9cgR+3T3SncVZkCzoLfQCajpOhodcbCgbpTR+msJR1ed1nXdvAi81wOgRI6Jx3mrhki75lg1iauLQ/c6fhRZuuyxM3xf+SExNa9ZO424RiJKIyYtT/n1xGNDgH/uLpRKeTjW9v23KsBK6TgA+c+nD8ygPgGALvNKSl7U2HXiUN1vhosYmC/BSeNaNd/Odq3XVqyJucx/04tOEVVR2OZ+8/moJftDv7b5epPtAbL175B1k7X6SfZ1/Eis4+kgAIph/kN2MHOcQpQz/8Mxbr8NVIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6916.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(36756003)(26005)(6486002)(186003)(54906003)(2616005)(38100700002)(508600001)(31696002)(316002)(82960400001)(8676002)(66574015)(6666004)(2906002)(31686004)(86362001)(4326008)(66476007)(66556008)(66946007)(6506007)(8936002)(6512007)(44832011)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdhRnovd1JncThlUkdmV1N2TUwra2RTdHBwbGhLQ0FRdkxSSG5qMi9PYXVL?=
 =?utf-8?B?c0Y4WDFoUUVadnVScnBsamEyRWRJZG0xb0p5aHFJSnBuV0xEY1FTREJiczlm?=
 =?utf-8?B?ZWtvaFA2VjFlaE9nSVZlOXhlUDFuOHZSanNHMFo5c0ExMkZHUXlZeUlnWmdQ?=
 =?utf-8?B?TGlpNEprbE83M1V0WTJyWkJqTnRnaUtJMzhsbjArTFlrUFRhblZTNlB5R256?=
 =?utf-8?B?SVJXRENyMXhwdHVEQjhlcDV3cHhtTDFVM1g4ZTJNNFo2anRRSnpGSXgySDRn?=
 =?utf-8?B?WmgwbHFaZWpZdVlOVmVpSUR4N0dRQWtCeUE1SVpYZWVZTDgwT21XUkxGbkRE?=
 =?utf-8?B?Rlk4MWduaWMwZDBaeDBOM0pabUZnSVBiSVdyMDNjUUVpcDh6VUc5Tk0zYlVz?=
 =?utf-8?B?eXFPVXFEckhWRTV2Qm5YdU15bmFIWityanpiREpScHVBaXNLZUhSdGhHY1l0?=
 =?utf-8?B?bDZDOHVxRE83VWsxcFA4M0tUTFpvazVDSkI4YlZBOUR0bGNmUitCcXhrbitn?=
 =?utf-8?B?bUNhQzJ5RFZkYWcyV0V0R1VTNlU3UzRBNW5jaVpHd1I0RW5xK2ZrSEJmZE1T?=
 =?utf-8?B?K2ZsS3pkSVFQMXZzdzZXUWszN2Zqcy8yay9Xb3hTYjhPSm1CdWpKa1JHeEdu?=
 =?utf-8?B?aEdwSTA4bnJGRVRZMlRkc0EzWk9HaXdPbGltN3k2cC93UjRYZDZ2V3BLUFkz?=
 =?utf-8?B?OW53N2VhZHZ0L2FOUzNsZ1d3eUlZd2xvT0MzVHlHb21jSnNkSEZnVDlSSlRh?=
 =?utf-8?B?Y2I5TGl6dW1aWmdkUTVWMFFDRjQwaUhIRWkzcjl4QnNZZlJicnhiSWdaMXBw?=
 =?utf-8?B?NEx5bERLUVlJeUkrdCtzZi9kQUFLNUxLNFpPZnNOT2FOcnM1WTV0NzAwNEF3?=
 =?utf-8?B?TW1LU0sySFl0eGtxZDkzekJjZDJud2dHQXFRMjJCLytSckFCaG5hM0hMRU9v?=
 =?utf-8?B?VnFaMlNmK0VMS0dxcTNKV1lOQVU0N2JQRDB2cVdydUFSNWVTMGJwemxuNXlW?=
 =?utf-8?B?d1NzYXErV0JXUlE3NHNIWmlMTVZTV1JFZ1FvN2JET2FVK0hZRHo0MHdmU1Fh?=
 =?utf-8?B?czRPTVlrOStmcUUwWlJQNWhJeGRxeVAva1FCa3Yxbzh5VGQ1bUJQd0tPbm1L?=
 =?utf-8?B?dEFCN3M2bGRLTzVzdUJ2c3h5cHI0aWh0VXlId1N0eGNHZGFtb0xqaDhFaEpw?=
 =?utf-8?B?aFBVRUd6RDZKc3NxK2p0VTNEc0lDbzhoTm04WEhNcUNzM2E0dHNKV1BtdzVY?=
 =?utf-8?B?SDk3RlJmNkMwYnYrM3NoTTJDVzZERVZ1OHp3dTlUUHRzSStIYXp1OEwveFRn?=
 =?utf-8?B?ZFpUcXdlSEN3WjUwbnMvS0IxSmdKbFFadUxIaXp6czVaQ21xQ0FIUWZsNkd2?=
 =?utf-8?B?bGcyM3ZaSmhzRmdWdUxPRDFjYm9RWWdYVVRKMjlMaDd0THgzTG5UOWJFOEV0?=
 =?utf-8?B?M3ozcjZEWGNxeTF5eE4wSm44OTlIclg5UlBWYkhPelM4WjJFTVVQa3Fxd2ZZ?=
 =?utf-8?B?SVlxRk8ydDYxa3poL2h3UHhPWUdRTUFZcyt0bThwc1VVNDljK0NYVkZRT0N1?=
 =?utf-8?B?cmVxelFsVmQ0VmdvOE1qTWVGcFRmai9lRmY3Ujd1WFFNaDhpOUdacWxLSkUz?=
 =?utf-8?B?QURZOHN5elVnMGtGWkk4cjJ4YmJwcnVWWDlJOWhQbUtUa2xtRHd1SHdiSHFG?=
 =?utf-8?B?YXZHcmFzc0tyNzN4SDJjbHZIT0p6cVRLY1E1bmVMZEVIbTZEK1doSmJhK3Ir?=
 =?utf-8?B?QjhqeGpwZXI4WEo4eWVxSEJCeHNtWEhHNGVjWkxXWlZzaDhlZVBTKzBzanc5?=
 =?utf-8?B?NE9OY3JNUmc3S2VoQTFqU01aZDhaa21XV2xoa1JESVUyZWxBWXY2bjNTbnJI?=
 =?utf-8?B?UXRCWVlNb2xEVnVjV3NYWUVZRHBiYStiNnloam9FYmh1ekNaR3d4dFhGNllF?=
 =?utf-8?B?Y2xSdGVoN042dGpkQW9YdGlRZEJ0SEpBMnBHcGhXSGVXZ2J1RUxnRWJTUWVl?=
 =?utf-8?B?M2NrWlVIbGpGcnZqRkk2RGV2VEpHN21ObHl0YWZ4eS8vU0hiS1dSNVRSSEZr?=
 =?utf-8?B?Y09ZNDFySE92bGNVb2xMcE1KbjVGVWEyTmdQcTFLYy9XaExjUE94UzVDSkVu?=
 =?utf-8?B?bkloOURTNVp0Mk9LUG9TZjZFRmRKSUYva2tOTlh0WDMwbkk0NkpHdDhFTDNK?=
 =?utf-8?Q?YO1Ld4shpe6o0SuBheqmMpI=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b472ec66-eda0-43f3-fa21-08d9f088b87a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6916.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 13:40:25.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYeLFS0sZhfNBkTOluoZq3bJ1jgNRUt9RHOT8WuuTrIXJQYbUA7OlBbyz4mEJILKQr4llmIBoir1YS0pOfedFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4171
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Le 12/02/2022 à 00:53, Guenter Roeck a écrit :
> Turns out the chip is by default locked, meaning all those 
> configuration writes
> fail unless I explicitly unlock the chip. How would you suggest to 
> handle that
> situation, and how do you handle it in your application ?
>
After reading the TMP464 datasheet, the device seems locked by default 
indeed:

> All of the configuration and limit registers may be locked for writes 
> (making the registers write-protected), which
> decreases the chance of software runaway from issuing false changes to 
> these registers. The Lock column in
> Table 3 identifies which registers may be locked. Lock mode does not 
> effect read operations. To activate the lock
> mode, Lock Register C4h must be set to 0x5CA6. The lock only remains 
> active while the TMP464 device is
> powered up. Because the TMP464 device does not contain nonvolatile 
> memory, the settings of the configuration
> and limit registers are lost once a power cycle occurs regardless if 
> the registers are locked or unlocked.
> In lock mode, the TMP464 device ignores a write operation to 
> configuration and limit registers except for Lock
> Register C4h. The TMP464 device does not acknowledge the data bytes 
> during a write operation to a locked
> register. To unlock the TMP464 registers, write 0xEB19 to register 
> C4h. The TMP464 device powers up in locked
> mode, so the registers must be unlocked before the registers accept 
> writes of new data.

 From my deduction, since we do not unlock it with software, I guess 
that our local FPGA is doing the job of disabling the lock during 
power-on procedure.

I guess we could read and unlock the device when probing, and relock it 
after rmmod if it was locked during probing (store initial lock state). 
We do not want to relock it if it was unlocked before probe — like in 
our usecase — because other applications may use this "already unlocked" 
assumption (bootloader, FPGA code, …).

What do you think?

Best regards,

Agathe.

