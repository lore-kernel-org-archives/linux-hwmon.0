Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B62FEB64D7
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jun 2023 22:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjF1Wv5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jun 2023 18:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjF1Wvm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 18:51:42 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A18A2704
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687992700; x=1719528700;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EbYPeNbNVi7dS3qHZcpXwJH5StqUvqRNrFMllThbykM=;
  b=QF3IVNWiApomUuv59DqBRofJZGx/9PRe8EHaHrzkjN8yFuTZulh/7s1Z
   tnMQIQitvCsG1kWIkxlDCynETSEcRY50afUsTFlBUiVex+L/+LpPT/cC6
   GvAGqkI+Ml2SqAMJCN9ulMXkfNyGzqpy7Z3smf4nZWQsckhoItMcpZSAY
   RpFB1NodGnWsWE2uWL3ssWIio+2LPXCnnn5LzR7mfyTXZBhKbfp5Jrp8L
   pwsV8EW+y4P9kR7texXbTQk0XCJFznvm0ibThhG5a2NY4ch/kE1wVRPNS
   q659Wi8n2YuFA2++vE/o1uxBKnyB9bj0AUJwv80XlcDFKZOFD9QzvGXzW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364525607"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="364525607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="807096428"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="807096428"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2023 15:51:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 15:51:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 15:51:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 15:51:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 15:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgaTLBSiGOnoS1yR96wMt81pm5fU4fq07sG0+k+orL4nWMB9LojEfZpPmU7fzVVk6JfJF6PRy5D5RZNeyaVqIn3jN4hTCdPOMQkxHVaJoL6WBmy0xfiFfSsHBT9x0hyjcmzq9/zUH1C0UEmZZjVxy66Ki67XIc8QKgTwH4VGYSB7ht1EzQhbbjOBbPX5xGKzwDb3RPwwTzJCEleY7IYD6f0kWYW4r3TPPu3vXuHqLa33TzujDY+OQftqYikrWzTaHOkFFuL22vKw3nuMGL3ISi78vTGVAeFPLfcG1zuWNd22skqnwY8ERGBo9aHgJGZBQvwVtJbY6D2tUu4/nAlrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5aREWiElv0DKAPfNS7ZnjfW/GR1xE4cAtCGJb6P6y4=;
 b=ILtt1TuNdAenbpDfKJJqhDS5QjFS5iPAC/LKU0Jw7pWNx7vm9JpledF9QjJDndv1jK0RzQuRJCBwTnCmrkKWdije/zQ/XQ31mOQsgQ3E9EnZvw1tu4t2yz5/EqAV+4fp/NcK/ZD1wrKWY9rjFWG9ZQ9cbZT2TJP5wzD/zVJ7iQZwvsS9iIy19N2behCV++3QM1t+RAdz9owIiA8JKquQxmTVDJA826pdyjaCLYD0rUCdedAqWaUwSwdDcBglNIAev6srSbpqPsqZFqMj+Ek6lPr2BfmkxxzfB3gpPvt7K6vF+qCY42e/1KgQkyllGv0AzQJ4H32wHMTgzmHDxI9w0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 22:51:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 22:51:31 +0000
Date:   Wed, 28 Jun 2023 22:50:50 +0000
From:   Matthew Brost <matthew.brost@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZJy5ShcLc40EFGq5@DUT025-TGLU.fm.intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627183043.2024530-2-badal.nilawar@intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: af4bba10-3929-42c1-2102-08db782a368e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2Ca2NaF6OADejWAV/6AdMAZtvPZxNudTj6aKRwRDosSUJIQgcaC9ZpQDBmbyzTy8D/L63/z8Drr4a/F0MqzdXxdElUg6/RPGfbagI0iwoyOK+aNCW7kW1iHJI/dNPHLBJNb7ULbDETJB/8KVUZpay9trhUFb0HXP0rl9/KwPn3Vum9jCzuwm70WnrHeeFqFmprj7ILiE3EPyU8iknoNOAVlIx0fKuDnaRzEo6bY8iYQMZTc0+ng9bcTP4MjEm5UBTrSCcnIGtZrkzao5zaoDKCvfptbiJPyexrDE1dDaXk4eFLxcnHXM827dqv9a9WIvUcg/xPXhfu5eCzSW5inOWQ/pUhKm2i+7Bf2J4GTsuvUDGRKzIwswxAgEPAk4VAHaANdiZZMtNHqIy4sMOPT36yIjuLDUnL50tFiyT61uyR/FyHQgZ2z0VnJHyxfWB4q/G2IOHkYn1ehOXdHXYkzfZSpaymB4gYgrkcKDid54Ts1P8tpUUkG7fFLOpswUZ2gxnxCZOSyoAJyzuThHSZA5IympJJNnglhQYugblAN6STl0QB4ClNanBjqVs3KT2ta
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(82960400001)(38100700002)(83380400001)(86362001)(478600001)(6666004)(6486002)(4326008)(6636002)(41300700001)(66556008)(316002)(8936002)(66946007)(66476007)(8676002)(6512007)(6506007)(186003)(26005)(44832011)(6862004)(5660300002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uFF/gd2gKmQYsmqhD1/wWvQ19Yj/p56LMS49bkQIg9zbPXhNZZwltHKBfU?=
 =?iso-8859-1?Q?dprSL+mRQY6o+ZW3CEwPNgHvAFXPy+1+eHFYRXa17Zdc6LQD21IUA2C//k?=
 =?iso-8859-1?Q?4U8DEuELTfTfreKOOYTGeDyn8AAh22td1Yw9ZikBstA706ED6U3EJhxsYd?=
 =?iso-8859-1?Q?vL8mdoVC5SgNRaF0QuAJFVJUL2vZ+LKdZSjwpL1DeNEyMp8L1+RGboeNxh?=
 =?iso-8859-1?Q?LzUz2YvAIjcAc10XjL5acHOLtkIVPDIPZzPkCfUZj91hQUOXnYvRV39lSr?=
 =?iso-8859-1?Q?lM1mCIUkhBcYowuHs4AFLv0guw9yVD96nCsgTIewY73m/c8SzzKFDQpzql?=
 =?iso-8859-1?Q?0UJ/Gb7b7QiyxINw3AkkCyNu3Sxv2hF+oZjaawRwVAg7H5ny8CfhQVIenf?=
 =?iso-8859-1?Q?RG6hbgiJydBjo5fD0VeBzQklUKcGJXICIEzoou5hdk9hmbUtpPC53M7aZT?=
 =?iso-8859-1?Q?u/Ud4A715hlsSj8zj/aY9gOychsrgoXVNAEE+XGuqM2e4wfixlEpdL7OhY?=
 =?iso-8859-1?Q?sn8WxbGElE99WPheoqfNzGDYIbLoV6+HNqjdmzgFr/5vbgwTzNhJ3Ilxlx?=
 =?iso-8859-1?Q?IUycz+UJUy0P63cXPhffbBkFWwe1oNediUMFkRdU4OEZlYXqe8vPjsQW1M?=
 =?iso-8859-1?Q?WYSou1xjjzDsubHCTvNU1BgV71/+DV3cRqqyHbNp7bdzI6Tm9sk7H5eYqv?=
 =?iso-8859-1?Q?K8T1TPlUFxI3RM8YVr4AK8UUGMVa1mDU38jrrTOuhO+3a3OIh1ihsNlJYh?=
 =?iso-8859-1?Q?4hedQjQE1uxvjhIPniEmwx8Eodmn7IEdPjtUJDsjbmUCvcNZ1ba3DCF4Vf?=
 =?iso-8859-1?Q?h7/MvsNP4U9qdg6S3WPtIiaU87SZzU4vbqXn4AJaNBlxMClyRb4d+ldeER?=
 =?iso-8859-1?Q?eakFqFscuvzLaeVjyag2AQKvI8dwcRNgacKtDgz2DWoJBfMw6TVkRY8tME?=
 =?iso-8859-1?Q?8CxSvXrgOOp2LR3FEo/4ZJ71Stq2kuXQ/7XexBnrPFfoRmJTRoJjtqcQRq?=
 =?iso-8859-1?Q?haftMcSyIY0cBozwOAi/0DaLOOtjPh+InnmH6eYg7MGRCVUcmHz/58Q6yZ?=
 =?iso-8859-1?Q?0OcLxrxhDIa8qHvF6wRugLQOk/Gdm/2CdS20qZypaW/f4cbwBopUsJQ0St?=
 =?iso-8859-1?Q?4PnZFJ8Sh+1KxUmgTQqCz8DOxGEMDMgSl5S4u2TQ9Z7UPuFTueMzmZwa2e?=
 =?iso-8859-1?Q?BXtq/auT77INUpOfn29CnzDgdhIvBK+JLXOo4bFdnldCV9pC7DakhdbQzW?=
 =?iso-8859-1?Q?/QaFmjrepN5TDVshDAlISKPXrzEVSTZfzX2u2JTil/hstc4CMYd0ITqgy1?=
 =?iso-8859-1?Q?UjqC0lBNAkGoyEeH/hCUFmt4VN1tHZThEvhRqXZIH3ZbOyUMVKikdSouVG?=
 =?iso-8859-1?Q?I17PNXxfPNLLvgYPLzhSylWR25PHNWdj/uP6mUpQ+i8uH1S9Ps9N0H0PoL?=
 =?iso-8859-1?Q?2fItiOZ7DljuVK5R9nmqjMyjShSbcPqoDo/qdrg4mnwrNK+FMyU9Bfynaj?=
 =?iso-8859-1?Q?ECr94FNNXL6ii+cpqn61Y5KpkkivZGpwITXd7z7gqZjOxYP1A/NW14Y3xM?=
 =?iso-8859-1?Q?PcKCFQQkyxWX4IJd0hJ7ImVG3UCbCSSov5/sVFEBuOlsmX89ZN9sj6a+XE?=
 =?iso-8859-1?Q?CDN+djPcFc23AfYk3H4cWynTjQjQ5Mx0+Hi8rNgf8ekQ27RZI11BUStw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af4bba10-3929-42c1-2102-08db782a368e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 22:51:30.4351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovKTR/blI9kxvVBJbbcAt+CIrTXQfDmFNEQibxE6TxEUIalRxoAW+jRFIRhoOFDlBhQitUceLprgDGoUZR5rSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 28, 2023 at 12:00:38AM +0530, Badal Nilawar wrote:
> The xe HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up xe hwmon infrastructure including xe
> hwmon registration, basic data structures and functions.
> This is port from i915 hwmon.
> 
> v2: Fix review comments (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   3 +
>  drivers/gpu/drm/xe/xe_device.c       |   5 ++
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c        | 116 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
>  5 files changed, 148 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4b82cb2773ad..e39d77037622 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,9 @@ xe-y += xe_bb.o \
>  	xe_wa.o \
>  	xe_wopcm.o
>  
> +# graphics hardware monitoring (HWMON) support
> +xe-$(CONFIG_HWMON) += xe_hwmon.o
> +
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7985af85a53..0fcd60037d66 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_hwmon.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_hwmon_register(xe);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>  	if (err)
>  		return err;
> @@ -354,6 +357,8 @@ static void xe_device_remove_display(struct xe_device *xe)
>  
>  void xe_device_remove(struct xe_device *xe)
>  {
> +	xe_hwmon_unregister(xe);
> +
>  	xe_device_remove_display(xe);
>  
>  	xe_display_unlink(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0226d44a6af2..21bff0e610a1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -332,6 +332,8 @@ struct xe_device {
>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>  	bool d3cold_allowed;
>  
> +	struct xe_hwmon *hwmon;
> +

You likely need a 'struct xe_hwmon' forward declaration at the top of
the file.

>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..8f653fdf4ad5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_hwmon.h"
> +
> +struct hwm_drvdata {
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;
> +};
> +

These two structures look very goofy, e.g. why two 2 structs instead of
1, why a back pointer in 'struct hwm_drvdata' rather than using
container_of? Just make this one structure?

> +static const struct hwmon_channel_info *hwm_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,

Nit and matter of opinion but...

s/hwm_is_visible/xe_hwmon_is_visible

> +	       u32 attr, int channel)
> +{
> +	switch (type) {
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	 int channel, long *val)

s/hwm_read/xe_hwmon_read

> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	  int channel, long val)
> +{

s/hwm_write/xe_hwmon_write

> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_ops = {

s/hwm_ops/xe_hwmon_ops

> +	.is_visible = hwm_is_visible,
> +	.read = hwm_read,
> +	.write = hwm_write,
> +};
> +
> +static const struct hwmon_chip_info hwm_chip_info = {

s/hwm_chip_info/xe_hwmon_chip_info

> +	.ops = &hwm_ops,
> +	.info = hwm_info,
> +};
> +
> +static void
> +hwm_get_preregistration_info(struct xe_device *xe)
> +{
> +}
> +
> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return;
> +
> +	xe->hwmon = hwmon;
> +	mutex_init(&hwmon->hwmon_lock);

drmm_mutex_init

Matt

> +	ddat = &hwmon->ddat;
> +
> +	ddat->hwmon = hwmon;
> +	snprintf(ddat->name, sizeof(ddat->name), "xe");
> +
> +	hwm_get_preregistration_info(xe);
> +
> +	drm_dbg(&xe->drm, "Register HWMON interface\n");
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> +							 ddat,
> +							 &hwm_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
> +		xe->hwmon = NULL;
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> new file mode 100644
> index 000000000000..a078eeb0a68b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_HWMON_H__
> +#define __XE_HWMON_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_unregister(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +#endif
> +
> +#endif /* __XE_HWMON_H__ */
> -- 
> 2.25.1
> 
