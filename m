Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8CC4361B
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 19:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CA1E2250F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 19:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502660AbgLNTuo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Dec 2020 14:50:44 -0500
Received: from mail-eopbgr760043.outbound.protection.outlook.com ([40.107.76.43]:60230
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387981AbgLNTud (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Dec 2020 14:50:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKl2JGhSDR+sBxoI4Sfn57HrZOwRtHhUtemsqfufxEDzJIJfOapwnGk4mbUjrvom36biTFkydfLkX5kJ9bq2DGcsG7aXGpJ09O5YRAry2Nffj7pql6sptMiFY5GW+OXLzMGm+u/47Mjbqaim+fLN9pybQj48kG5+BYRU4+1FqLQTy/ndI4A7w/ZS4KIl67JbMSylIUI9Zr4W26ZMLT8yJoJomnwZ3Rw/fTrlf1/BDCif6NEFqgT97cxp0Gmn/s3AdvGZvHCHYVEgzealAfTqB69mveKVZHnRviUQsKPFDRAwjVcZGeQq3KjTlVFXqX21k59zM7pbJTJVvi22gKRtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9RE2uvb8kNc+XTo1G91GEfvW/0E/FGHMKneYgELYzY=;
 b=GfxCx3/7xJILO6iAo84iSv/I5P5WMULQnB62vY1rhOOx8IvhG+m3JapkJNrVVlOF+0YucYmoAo76EC6CRMBesd/bRJRvnaDV5KUDiYwvSzk48X0JM8NNws52cXgIcjYH/ff1YbyMuIAQPJGBy8KZM6WDvFPefEXfzUdQF39VuvXAsh7wK+RewMI1BcGDvcRXEEeM1UubrcYVh/A1GBBLG9cQfbBgeTnxT0D4Tl3UcdFLs/k6a1Nxp+2KGzZIzpmO+3D3XGeQlF3/PVskUiR+Yz4DK64kPZiRvYNJ/Elu3g1Hl+e7SsjWPAMJEPYHwoWmBQ2MZXSTnHUwaQfJ7HYdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9RE2uvb8kNc+XTo1G91GEfvW/0E/FGHMKneYgELYzY=;
 b=qzNgtXZGfawCbb8qwjgm74lkBKIr1iP6bKn0Y3z6/d+t7ApkuwxvkEV39DKy1fa2PYSJ1qyygY9xL9MGcrTJ/fFMdRtD0AbIqSHOzLng4eObHxhGjLUjh03jmuRVR81/vld97rgDaJJQyp+dzSiBbISJTV7jynxyPnQ+SzEh3+0=
Authentication-Results: gmx.com; dkim=none (message not signed)
 header.d=none;gmx.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1494.namprd12.prod.outlook.com (2603:10b6:910:f::22)
 by CY4PR12MB1141.namprd12.prod.outlook.com (2603:10b6:903:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 14 Dec
 2020 19:49:45 +0000
Received: from CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::d0ac:8fdb:1968:2818]) by CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::d0ac:8fdb:1968:2818%6]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 19:49:45 +0000
Subject: Re: [PATCH] hwmon: (k10temp) Remove support for displaying voltage
 and current on Zen CPUs
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "Artem S . Tashkinov" <aros@gmx.com>
References: <20201214185947.50413-1-linux@roeck-us.net>
From:   Wei Huang <whuang2@amd.com>
Message-ID: <8fed027b-4287-fff1-0fa2-1559a58c982b@amd.com>
Date:   Mon, 14 Dec 2020 13:49:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201214185947.50413-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [24.55.15.93]
X-ClientProxiedBy: SN2PR01CA0019.prod.exchangelabs.com (2603:10b6:804:2::29)
 To CY4PR12MB1494.namprd12.prod.outlook.com (2603:10b6:910:f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.38] (24.55.15.93) by SN2PR01CA0019.prod.exchangelabs.com (2603:10b6:804:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 19:49:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ac668c9-20a4-47e1-02e3-08d8a0696879
X-MS-TrafficTypeDiagnostic: CY4PR12MB1141:
X-Microsoft-Antispam-PRVS: <CY4PR12MB11418B1ED34C51D73B6413BECFC70@CY4PR12MB1141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Li0TsOW6WBXFDVp5bcwQ3E5f7MWqMUN6Xwa34STKas4eoLqEi6fzKjtjZXunoGi/8xdoffVRSXJ+TvNRG4+Yn/SdrvNuCZ7l79eYX36Tq33PCqe2AmfKx0RyuH7N3CYAjBr0QGXGvMEbXnvUW0HVZndplZVODhzAvwQZMEaNAUurSbXO99THn7f8xfYbonMQRLtdhyMPW3UmCQvTkn4TyfCbDTUao7I1qmS/8nD4dB7fNey8bhYXSEgW5EkJzekfGQzNNJXF3ZLgPEcbwFayWoGqX5iPyKYHyeMg4/RUJT4fltsjb1vGVCc1tMjvrYUJvR/+sGYCA7V3CTgfan9rEUWwNlypF5JaA/n9YjCKMvIzk/gpaQtTbOOKJ+abxyosKNG45WNn0lolOZLRfoF7kH0DnD4ir68sT7J9N4hXYe5fuG4+cdD2NVy8C8vF3KKZpF0qiN5BK/zhj86rMXwgRiKx71CEsr4Fubjs0/b16jFOeJNgSWagi88s6JqIb0Qk2SN9CSMaq6jNZ5i14lU4pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(16526019)(26005)(508600001)(16576012)(5660300002)(6486002)(2906002)(4326008)(31686004)(8936002)(53546011)(31696002)(83380400001)(2616005)(966005)(66476007)(54906003)(34490700003)(8676002)(66556008)(110136005)(52116002)(36756003)(66946007)(956004)(186003)(518174003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDVTc3daaEJMSndiRkE0aVJEeU9ZQzhEMWdvQVp2NTZlUlVBZkhsRHhDV2FU?=
 =?utf-8?B?bGluOEZnTW94aktZMzFocjRGWGg5N0VDb3BBTVhqTkVRZnFzS2MrUFdIdGlh?=
 =?utf-8?B?ZlFsT3paUFZLTXg5Z0huK0Y1a3J2dVhvN1ZmV3YvS0JWeTd2clpWbVE0dUxY?=
 =?utf-8?B?SW9hNzlKaENtektzVm1ZNXVKNEhQMnNRbFhyZGZ6SmF3Z0x2aG1LdEV5VGtS?=
 =?utf-8?B?SXo4bGJoaVdINXd3UGtrK0RtQ3JHSWk1Nk9FbERvYzNQZjBlUG50RWtiQ3hm?=
 =?utf-8?B?TzZQak9vQk1hcFF4SVMwQW5sK0lVcG9WQ3A2M1dibUtKYTRXbVU0bXkxYWN2?=
 =?utf-8?B?UnQwNkpxdW5MbjRFZkt4M01tRjZlYjNJOEVmeVRjTEFHYXR4RGVJc2c0ZXN1?=
 =?utf-8?B?RDdFT0dMNm55U0N5MXM5NXp5UUFaMGFiVnlsMXQ1SXozYjJpSG1WS2tQZ2Zj?=
 =?utf-8?B?TE1ZVEZ3eEtteDFUeGN1YUw0UEhzRXZacnlZZ0lYSkRoa1p0MG1pUURRNnJW?=
 =?utf-8?B?TDAwTUtSY1djUmZNUEZ1cFRudjdDZXFzQmpoRWs1cDlxY2daVy8xVHljVmpR?=
 =?utf-8?B?ZEZkOVRRMzdIY3psZ0IvcFBSN3BYc0FCem15Skl5R3M1VmR6YkY5VyszM3Ry?=
 =?utf-8?B?dEZZdEdlOXlrKzAvOFFNOTRrYnR6MUthd2MrdWo4ZU5jdjlYMXNwQU5mR1RM?=
 =?utf-8?B?L2hDdlg1TE8vNE83djZGdVFMS0FKVzdDaVpTQVNKTG9UeWNLWUwzOEs4VFoy?=
 =?utf-8?B?ZktqMC9Qamtkdk45UWpic01HZGdKMUwvaytoYS9KM1Q1UTJDZmZJZFltWjU4?=
 =?utf-8?B?WlBTcXZPWWNVNGJPd2YxZjIvbkV6YzVvUFZkcU5WenRDRFQ3ajhYUStTVTQ2?=
 =?utf-8?B?WjFyV2dkWFViSGFmMHVMVHNmMW9SUDY4WDN0dGd4ZGkxejhKNTgyYlFJMDhy?=
 =?utf-8?B?TmdIdGo0bGR4QTN5Q3pJOW8xWVhVZkQ5Q05BbVArbEN6eHdjMzVRbTg1RmJS?=
 =?utf-8?B?a2dMalZ5cUYvVGI4TnRYa0NQUXBWc3cxd3VPS1NnUHhkRHh4RDBNRU9WMnlB?=
 =?utf-8?B?aUJOaFZSVnBTclZtcGZReXk5YTZpWXZ0ZEVicC9YOVI2bWFCa0ZiYVZVcm5F?=
 =?utf-8?B?UnlEd2JUcFdMenVHazFBeEhqMVJKSE1JMVF5VW90VHJYOFM3QWNwWW05QSt6?=
 =?utf-8?B?cFpwTGw5V1h0T0lmMHM2RS9kZXF2YTlGWFI4SWNhZXl0VFh0NFFoeG5GV3VJ?=
 =?utf-8?B?aWRvRHZsS2ZwMk15dmpueWJJdXZqaXJUNFRkZVk2Z3ZmVE1oeFlTcDhqN3da?=
 =?utf-8?Q?dy9rE+HB00FEMYx92EY1M3JjHNsXR6a4Nx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 19:49:45.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac668c9-20a4-47e1-02e3-08d8a0696879
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gJS/d6bTNvKSdV8ZdFvXzs27+5gReeiTIA/wUmFarOpQTtgoHxGVL4kIDqJFF91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1141
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 12/14/20 12:59 PM, Guenter Roeck wrote:
> Voltages and current are reported by Zen CPUs. However, the means
> to do so is undocumented, changes from CPU to CPU, and the raw data
> is not calibrated. Calibration information is available, but again
> not documented. This results in less than perfect user experience,
> up to concerns that loading the driver might possibly damage
> the hardware (by reporting out-of range voltages). Effectively
> support for reporting voltages and current is not maintainable.
> Drop it.

Even though the results on EPYC servers seem to be correct, the readings 
of Vol/Amp are less reliable on some client platforms. This can be 
attributed to many factors, such as the design of power plane or the 
change of slope coefficient. It is better to remove the info of Vol/Amp 
from k10temp for now.

I verified this patch on an EPYC server and the results look correct:

# sensors
[snip]

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +29.4°C
Tdie:         +29.4°C
Tccd1:        +27.5°C
Tccd2:        +28.0°C
Tccd3:        +29.8°C
Tccd4:        +26.5°C
Tccd5:        +24.8°C
Tccd6:        +27.2°C
Tccd7:        +26.2°C
Tccd8:        +28.0°C

k10temp-pci-00cb
Adapter: PCI adapter
Tctl:         +27.1°C
Tdie:         +27.1°C
Tccd1:        +24.8°C
Tccd2:        +26.8°C
Tccd3:        +27.8°C
Tccd4:        +26.5°C
Tccd5:        +26.8°C
Tccd6:        +27.2°C
Tccd7:        +25.0°C
Tccd8:        +26.2°C

So, for this patch:

Tested-by: Wei Huang <wei.huang2@amd.com>

> 
> Cc: Artem S. Tashkinov <aros@gmx.com>
> Cc: Wei Huang <wei.huang2@amd.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/hwmon/k10temp.c | 98 -----------------------------------------
>   1 file changed, 98 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index a250481b5a97..3bc2551577a3 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -11,13 +11,6 @@
>    *   convert raw register values is from https://github.com/ocerman/zenpower.
>    *   The information is not confirmed from chip datasheets, but experiments
>    *   suggest that it provides reasonable temperature values.
> - * - Register addresses to read chip voltage and current are also from
> - *   https://github.com/ocerman/zenpower, and not confirmed from chip
> - *   datasheets. Current calibration is board specific and not typically
> - *   shared by board vendors. For this reason, current values are
> - *   normalized to report 1A/LSB for core current and and 0.25A/LSB for SoC
> - *   current. Reported values can be adjusted using the sensors configuration
> - *   file.
>    */
>   
>   #include <linux/bitops.h>
> @@ -109,10 +102,7 @@ struct k10temp_data {
>   	int temp_offset;
>   	u32 temp_adjust_mask;
>   	u32 show_temp;
> -	u32 svi_addr[2];
>   	bool is_zen;
> -	bool show_current;
> -	int cfactor[2];
>   };
>   
>   #define TCTL_BIT	0
> @@ -137,16 +127,6 @@ static const struct tctl_offset tctl_offset_table[] = {
>   	{ 0x17, "AMD Ryzen Threadripper 29", 27000 }, /* 29{20,50,70,90}[W]X */
>   };
>   
> -static bool is_threadripper(void)
> -{
> -	return strstr(boot_cpu_data.x86_model_id, "Threadripper");
> -}
> -
> -static bool is_epyc(void)
> -{
> -	return strstr(boot_cpu_data.x86_model_id, "EPYC");
> -}
> -
>   static void read_htcreg_pci(struct pci_dev *pdev, u32 *regval)
>   {
>   	pci_read_config_dword(pdev, REG_HARDWARE_THERMAL_CONTROL, regval);
> @@ -211,16 +191,6 @@ static const char *k10temp_temp_label[] = {
>   	"Tccd8",
>   };
>   
> -static const char *k10temp_in_label[] = {
> -	"Vcore",
> -	"Vsoc",
> -};
> -
> -static const char *k10temp_curr_label[] = {
> -	"Icore",
> -	"Isoc",
> -};
> -
>   static int k10temp_read_labels(struct device *dev,
>   			       enum hwmon_sensor_types type,
>   			       u32 attr, int channel, const char **str)
> @@ -229,50 +199,6 @@ static int k10temp_read_labels(struct device *dev,
>   	case hwmon_temp:
>   		*str = k10temp_temp_label[channel];
>   		break;
> -	case hwmon_in:
> -		*str = k10temp_in_label[channel];
> -		break;
> -	case hwmon_curr:
> -		*str = k10temp_curr_label[channel];
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> -	return 0;
> -}
> -
> -static int k10temp_read_curr(struct device *dev, u32 attr, int channel,
> -			     long *val)
> -{
> -	struct k10temp_data *data = dev_get_drvdata(dev);
> -	u32 regval;
> -
> -	switch (attr) {
> -	case hwmon_curr_input:
> -		amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
> -			     data->svi_addr[channel], &regval);
> -		*val = DIV_ROUND_CLOSEST(data->cfactor[channel] *
> -					 (regval & 0xff),
> -					 1000);
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> -	return 0;
> -}
> -
> -static int k10temp_read_in(struct device *dev, u32 attr, int channel, long *val)
> -{
> -	struct k10temp_data *data = dev_get_drvdata(dev);
> -	u32 regval;
> -
> -	switch (attr) {
> -	case hwmon_in_input:
> -		amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
> -			     data->svi_addr[channel], &regval);
> -		regval = (regval >> 16) & 0xff;
> -		*val = DIV_ROUND_CLOSEST(155000 - regval * 625, 100);
> -		break;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -331,10 +257,6 @@ static int k10temp_read(struct device *dev, enum hwmon_sensor_types type,
>   	switch (type) {
>   	case hwmon_temp:
>   		return k10temp_read_temp(dev, attr, channel, val);
> -	case hwmon_in:
> -		return k10temp_read_in(dev, attr, channel, val);
> -	case hwmon_curr:
> -		return k10temp_read_curr(dev, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -383,11 +305,6 @@ static umode_t k10temp_is_visible(const void *_data,
>   			return 0;
>   		}
>   		break;
> -	case hwmon_in:
> -	case hwmon_curr:
> -		if (!data->show_current)
> -			return 0;
> -		break;
>   	default:
>   		return 0;
>   	}
> @@ -517,20 +434,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		case 0x8:	/* Zen+ */
>   		case 0x11:	/* Zen APU */
>   		case 0x18:	/* Zen+ APU */
> -			data->show_current = !is_threadripper() && !is_epyc();
> -			data->svi_addr[0] = F17H_M01H_SVI_TEL_PLANE0;
> -			data->svi_addr[1] = F17H_M01H_SVI_TEL_PLANE1;
> -			data->cfactor[0] = F17H_M01H_CFACTOR_ICORE;
> -			data->cfactor[1] = F17H_M01H_CFACTOR_ISOC;
>   			k10temp_get_ccd_support(pdev, data, 4);
>   			break;
>   		case 0x31:	/* Zen2 Threadripper */
>   		case 0x71:	/* Zen2 */
> -			data->show_current = !is_threadripper() && !is_epyc();
> -			data->cfactor[0] = F17H_M31H_CFACTOR_ICORE;
> -			data->cfactor[1] = F17H_M31H_CFACTOR_ISOC;
> -			data->svi_addr[0] = F17H_M31H_SVI_TEL_PLANE0;
> -			data->svi_addr[1] = F17H_M31H_SVI_TEL_PLANE1;
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
>   		}
> @@ -542,11 +449,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   
>   		switch (boot_cpu_data.x86_model) {
>   		case 0x0 ... 0x1:	/* Zen3 */
> -			data->show_current = true;
> -			data->svi_addr[0] = F19H_M01_SVI_TEL_PLANE0;
> -			data->svi_addr[1] = F19H_M01_SVI_TEL_PLANE1;
> -			data->cfactor[0] = F19H_M01H_CFACTOR_ICORE;
> -			data->cfactor[1] = F19H_M01H_CFACTOR_ISOC;
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
>   		}
> 
