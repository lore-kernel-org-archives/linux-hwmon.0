Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40297EB64D7
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jun 2023 00:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjF2ASy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jun 2023 20:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjF2ASv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 20:18:51 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB281BC8
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 17:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687997928; x=1719533928;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Re/NL8A/A2nT6xTqHIrR/B5qiTeDppL0yntQbOGK00Y=;
  b=Ao+J0+a/QRn4/o5VHNApmFV5tv+Cdd4ptxyfu/z4AxrRK8V2fL4qGUIt
   mkqiOVkffUjC4JmxmOZwNgunhL99MdcM1gEii83ct0LEwb7sa4Gs7C78l
   AANFCdftP5SC2f4ay3zMAEKAYyp4ion13o76u7g/q4hiuV0UmIkgzeuq2
   eHvgzMZ0qe6p2IpHCwMDtW8spHrQ1yPutCNM+N8yV45qdF3RL6v4ZR9mX
   76dzLeauJYlg9rECkHRc9jqVYlXer2ehzwtyZ7+V8VmVVBZRiA8KcsP6R
   ejtFhxBw9UhGD1EP9RoitiTc0yKA7IApB3nTAK4YTvR52UZ0N5/0E94Ui
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351788394"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="351788394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 17:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861722110"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="861722110"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 17:18:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 17:18:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 17:18:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 17:18:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 17:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PznN9HnJ0C5ftKjRmFul7jqr57ZPGAZsMy40WKjBHOA8gP7uOsTEYJt6xSKCbZIoyz5J8LuaNFnLFN++laJmCFykq+MeZAGRdj6iTESGQXqKaAQgEOK7DRo95OJAwBDsWzazhhJ5y2shOjpnWOBoBboGc99FVgxUD2yFmAskocDBNdOikuJzY2Fz1VN9U4DX6V9eRw2ZewMfGrKYhcklYQhsRn1QK1GFJzqp4cBDWwrglDkrolYiUOOZijDJ47m66Fa67VjXCBIN01DJNTLkQy5g4u+5MAOH1idIaX9EwxuAquCv730QhyddTdBmI54UpyEqOtOuvN/YS28z8N9iAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzM8COfrUaYlCmOtjZt7fVNYv6j6WTSXTSVeq7L7mcI=;
 b=a0CXvqn4hDPPqjwGrqT142j3TVYqP9Np7+HsGaxon8Go63MCnKR2g2Jn9iRq6kZRl3r6BqDVxgIW5CK8rrnmzRfFIITBm/2ncc9gqwAyBBsvTEDz7bslmL/eC5aeRHKU6442OXn10Q7ylcea1cF7XhQQQxyyljbNUtuMRFLN+jN3v9eHAWgAduq+oS0Jl7sqDa9j0/QJpuIroeXwa8Ky628mZ16SVSdFflrQprNbbGBO72ZAlTV2CkDnEFaBgHRcpefSeoxJiPAw6TP4SLpxnFAeTXOBkR/J+D+SOW70BeH9YNYcyVeUHOj9VC6qmeNoGnT+wPBIBYXzzDG61B9h3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Thu, 29 Jun
 2023 00:18:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 00:18:43 +0000
Date:   Thu, 29 Jun 2023 00:18:02 +0000
From:   Matthew Brost <matthew.brost@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>
Subject: Re: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627183043.2024530-3-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: d20f0733-9ece-4d27-7930-08db783665a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEw45cTG3jyexIftcDv40mYt7tyP3X3yprnwG/kZPclp8D4EIxhY6x3p6lXL5At9mBHeQq/FJCtg9cPfgbEJhSHN6UO/xvbGS2QCKVJki7MeNXE6J7NCdBs/UK+p5BNc5VAA5yGS9qaoIK6TQc4BXa8gp8Un502kWnikJn3rxSEBKZNRc3ShdCxvei80CoEVO8X0MQThb9kMX1e4pba+Q2Qb6B0c3NwMp3dLFyVlaS1PvFJ28qQ/c+58tfHDLx3ddc6RqeNIKjktypUqCfiIxFk4u21UfJWnpljD5PG3qShT2NajY6Z0yX46cxbR0smrt29nBPEGJwIL7rkPVj8Ebb0JExAs31RtH4WMbyHau0m9+/JIm1L143usHd1s8PjVMjMqQmSaHQO668wLnlvIeLYuqoNxVX/6H0jytqFOgxDstYUH/A50k4y6Gj/RZXKeg8dHrtIHFEaZ5egYX+RhbgQUhFMVi487a7LGexnVTEWmHLpVTGHheFgOnauzu7md31s6F3WWjOGUDCNyY+YcbXMWEOjJ3eVCVtM5wxLHSOGVGRZd2wk15Zq31BWaGrIjgu02fh3+nHL3qnLdFUEf2FQkgXIBME/78JFJr2gTYNQs+x8EXsnz0thfvwfyAxfQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(82960400001)(38100700002)(86362001)(4326008)(6862004)(41300700001)(8676002)(6486002)(44832011)(6506007)(5660300002)(8936002)(6512007)(26005)(478600001)(30864003)(83380400001)(186003)(2906002)(6636002)(66946007)(66476007)(66556008)(6666004)(316002)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0NtGiQD2xldx+mSxHPEgCo0hPifupV+kf0zaftXEWLgnngGCinidLMj/Xx?=
 =?iso-8859-1?Q?M+mndiw0UWrBAZrCSy3bjW3Jd47SWwS0CJ0ERe91EYRSD/87PtCvI3VeOY?=
 =?iso-8859-1?Q?v78dncRIYnfjtmEJvvOsfqi0fHdMTUEaDdRRwj1KatXmeskg6JoCb86grD?=
 =?iso-8859-1?Q?8pMJr+ajggoHU7bRDNJoLOuTBuqg3L5Z0FtwzmQ5VewqNNc4qM1HapC5A8?=
 =?iso-8859-1?Q?OTFYBd1h+LeeGYJL/ZkFK3zVuvMqc08SNT2YTufmzfBh6I6rxqqiM3PyYH?=
 =?iso-8859-1?Q?z+WvqEVsXnCngVI8DFCJAs97tn3MIGP4oo3KL3s+89oVGoQmRMIaW48z7Q?=
 =?iso-8859-1?Q?4+pU1FUFFv5frSXI+fbv9uFZQPD1sCAOivBbh4aQpldlAGMQfcIfRY09MP?=
 =?iso-8859-1?Q?Bngw6tlTT/gddMaXrFXsGCJqtmeAwr38xed/B3iwc7BvFjVDqrR9/oKrwk?=
 =?iso-8859-1?Q?9a7tx5lxSzhdl96i1+dCfhp/4mYrguuy91rbpUdu4SeIdUi4e1xjihIFKc?=
 =?iso-8859-1?Q?LxznOk9HoYyJoCBK18qucogqLKD2ToaN9hp1ETw/CJ2zqmYEXthAJvb4Gg?=
 =?iso-8859-1?Q?ne85fC556eUlR7/Jy20CJAbre0w0pMgQM9q9rBlDATepUE3rfiCWhf7bF1?=
 =?iso-8859-1?Q?V3EbQ5Xbpf5hnU+Y3L1smZWDY80CvWvb+0ILl5cAwX6mk0h1m5+WvYsBBj?=
 =?iso-8859-1?Q?nAmxERkr/zNta47z13Z+2UVYLVr0hWQICBnlLp9KR33o5e9OvgADs5BpC+?=
 =?iso-8859-1?Q?FsV/XzRPqqB2ajZK86eN7O4fEWZ5QvABbWAmuGL3ILrWhz3MyHR0+0z1GQ?=
 =?iso-8859-1?Q?UIc30euaY0HMw0aoBpur7nlYGApC814dkoDHt3BPlP1CgQlDoK7X36aEZa?=
 =?iso-8859-1?Q?X9kjdlNKLjZJqtcq6yF55E1d/6WUgELH/GzjANvHZorXf8+XSgTnDeuGa1?=
 =?iso-8859-1?Q?IdzkouHNk8iAUSwEg4ZyT5KJiDRQr+yBlVRrWNYzB6eFsBH4v39ReTcRoa?=
 =?iso-8859-1?Q?jjhXWTSHeWPHZDxCj+gA3OkEUmTgK99aK5wdlqnVzwwdlr/CcD6+APgFHH?=
 =?iso-8859-1?Q?nCwTq9LhYe40uQdAZEcLLlAZB/1N4Jc9xekCp+vtRdXTYWJ/kJFf/wwIv9?=
 =?iso-8859-1?Q?u4N1SXSIYk8O9/btrTewjIDNRjnjbyEdwffnuQEcV8EhmXOF/41gs4Y7GK?=
 =?iso-8859-1?Q?dng6QVZyaS1tXy9ftM6sQ1iujn7zmwIsFpjZ1K0FBJ509lq/6xKE4svyN0?=
 =?iso-8859-1?Q?BaHl3XC4MCT+NhNc9ZbKf1Tsoh/WFX7wPc8Hu4u/+wrGquYkr8EC+4k1/R?=
 =?iso-8859-1?Q?8lOEswL82+BUFpqnWPOb+SBlug3zeQAsK3r8d1DIEsY3rdK5O5Z2CFKcKa?=
 =?iso-8859-1?Q?MhE1SU3mbEdpPRNPo/awcDSgW2OvLY/E+MYl9ulBe32Eqj7tg3WwxyRPpN?=
 =?iso-8859-1?Q?YgIPwD0L82ojcptmlHmpsya7PQcaE0+ioUkFz5vM1mX0M3Cli+h0sNnZPH?=
 =?iso-8859-1?Q?Cj1LASH8QKrEUivE6Z/NDf48HyLEWjv9MoWwWy8Suqr0shHtYMS3lDFc7G?=
 =?iso-8859-1?Q?4UpCghmpEYEeC1hl4q7b8laaCKysvmwaRvsSSHuHXVCXxzvU/L0p6sKzy+?=
 =?iso-8859-1?Q?Ha5KxHKdLBEqcZzkASU4G0CrWSzzy0cvWewaGRIY9bQdl01Ff2ex0h4g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d20f0733-9ece-4d27-7930-08db783665a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 00:18:43.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywW3dpQ0QKbPERzTyxnDmJgS+eKMQpnDPEsAa9VirWMXIcczT3MnhFbbyHD61G6HhdhKpoEq2iXD9xs3s1285g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 28, 2023 at 12:00:39AM +0530, Badal Nilawar wrote:
> Expose power_max (pl1) and power_rated_max (tdp) attributes.
> This is port from i915 hwmon.
> 

Not expert in this domain but this statement makes be nervous as
generally shouldn't just blindly port things from the i915. Doing an
initial review but will need a domain expert too.

> v2:
>   - Move rpm calls (xe_device_mem_access_get/put) to hwmon functions from
>     process_hwmon_reg to avoid multiple rpm entry exits during consecutive
>     reg accesses
>   - Fix review comments (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 372 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
>  drivers/gpu/drm/xe/xe_uc.c                    |   6 +
>  6 files changed, 435 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> new file mode 100644
> index 000000000000..ff3465195870
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -0,0 +1,22 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		July 2023

Future?

> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org

s/intel-gfx/intel-xe

> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		July 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d654f3311351..eb7210afbd2c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -397,4 +397,8 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> new file mode 100644
> index 000000000000..cb2d49b5c8a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H__
> +#define _XE_MCHBAR_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/*
> + * MCHBAR mirror.
> + *
> + * This mirrors the MCHBAR MMIO space whose location is determined by
> + * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
> + * every way.
> + */
> +
> +#define MCHBAR_MIRROR_BASE_SNB			0x140000
> +
> +#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
> +
> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +
> +#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8f653fdf4ad5..a4fba29d5d5a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -5,53 +5,394 @@
>  
>  #include <linux/hwmon.h>
>  
> +#include "regs/xe_mchbar_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_hwmon.h"
> +#include "xe_mmio.h"
> +#include "xe_gt.h"

Nit - includes should be in alphabetical order.

> +
> +enum hwm_reg_name {
> +	pkg_rapl_limit,
> +	pkg_power_sku,
> +	pkg_power_sku_unit,

Upper case? I guess hwmon_power_max is lower case so is that the
convention?

> +};
> +
> +enum hwm_reg_operation {
> +	reg_read,
> +	reg_write,
> +	reg_rmw,

Upper case?

> +};
> +

s/hwm_reg/xe_hwm_reg

> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - power  - microwatts
> + */
> +#define SF_POWER	1000000
>  
>  struct hwm_drvdata {
>  	struct xe_hwmon *hwmon;
>  	struct device *hwmon_dev;
> +	struct xe_gt *gt;
>  	char name[12];
> +	bool reset_in_progress;
> +	wait_queue_head_t waitq;
>  };
>  
>  struct xe_hwmon {
>  	struct hwm_drvdata ddat;
>  	struct mutex hwmon_lock;
> +	int scl_shift_power;
>  };
>

Same as previous patch, 1 struct seems like a better idea to me.

> +struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)

s/hwm_get_reg/xe_hwmon_get_reg

> +{
> +	struct xe_device *xe = gt_to_xe(ddat->gt);
> +
> +	switch (reg_name) {
> +	case pkg_rapl_limit:
> +		if (xe->info.platform == XE_DG2)
> +			return PCU_CR_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_PVC)
> +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		break;
> +	case pkg_power_sku:
> +		if (xe->info.platform == XE_DG2)
> +			return PCU_CR_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_PVC)
> +			return PVC_GT0_PACKAGE_POWER_SKU;
> +		break;
> +	case pkg_power_sku_unit:
> +		if (xe->info.platform == XE_DG2)
> +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_PVC)
> +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		break;
> +	default:

BUG_ON or WARN_ON saying not possible?

> +		break;
> +	}
> +
> +	return XE_REG(0);
> +}
> +
> +int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
> +		      enum hwm_reg_operation operation, u32 *value,
> +		      u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +	int ret = 0;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	switch (operation) {
> +	case reg_read:
> +		*value = xe_mmio_read32(ddat->gt, reg);
> +		break;
> +	case reg_write:
> +		xe_mmio_write32(ddat->gt, reg, *value);
> +		break;
> +	case reg_rmw:
> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
> +		break;
> +	default:

BUG_ON or WARN_ON saying not possible?

> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
> +{
> +	struct xe_reg reg;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));

Don't need this, the upper levels of the stack should have this. You
could just do a xe_device_assert_mem_access here. 

> +
> +	*value = xe_mmio_read64(ddat->gt, reg);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return 0;
> +}
> +
> +#define PL1_DISABLE 0
> +
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read.
> + */
> +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)

The return value is always 0, why not return value?

s/hwm_power_max_read/xe_hwmon_power_max_read

> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
> +	u64 r, min, max;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +

Same as above, use xe_device_assert_mem_access.

> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +	return 0;
> +}
> +
> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	DEFINE_WAIT(wait);
> +	int ret = 0;
> +	u32 nval;
> +
> +	/* Block waiting for GuC reset to complete when needed */
> +	for (;;) {
> +		mutex_lock(&hwmon->hwmon_lock);
> +
> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> +
> +		if (!hwmon->ddat.reset_in_progress)
> +			break;
> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		mutex_unlock(&hwmon->hwmon_lock);
> +
> +		schedule();
> +	}
> +	finish_wait(&ddat->waitq, &wait);
> +	if (ret)
> +		goto unlock;

Anyway to not open code this? We similar in with
xe_guc_submit_reset_wait, could we expose a global reset in progress in
function which we can expose at the gt level?

> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +

This certainly is an outer most thing, e.g. doing this under
hwmon->hwmon_lock seems dangerous. Again the upper levels of the stack
should do the xe_device_mem_access_get, which it does. Just pointing out
doing xe_device_mem_access_get/put under a lock isn't a good idea.

Also the the loop which acquires hwmon->hwmon_lock is confusing too.

> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			ret = -ENODEV;
> +		goto exit;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +exit:
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +

Again a clear lock / unlock is desirable.

> +	return 0;
> +}
> +
> +static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
> +{

s/hwm_power_rated_max_read/xe_hwmon_power_rated_max_read

> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
> +
> +	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;
> +}
> +
>  static const struct hwmon_channel_info *hwm_info[] = {

s/hwm_info/xe_hwmon_info

> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>  	NULL
>  };
>  
> +static umode_t
> +hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
> +{

s/hwm_power_is_visible/xe_hwmon_power_is_visible

> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return process_hwmon_reg(ddat, pkg_rapl_limit,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
> +	case hwmon_power_rated_max:
> +		return process_hwmon_reg(ddat, pkg_power_sku,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{

s/hwm_power_read/xe_hwmon_power_read

> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_read(ddat, val);
> +	case hwmon_power_rated_max:
> +		return hwm_power_rated_max_read(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{

s/hwm_power_write/xe_hwmon_power_write

> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_write(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +

Upper level should have, use an assert if anything.

> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	hwmon->ddat.reset_in_progress = true;
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, 0);
> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +}
> +
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));

Upper level should have, use an assert if anything.

> +
> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> +
> +	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.waitq);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +}
> +
>  static umode_t
>  hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  	       u32 attr, int channel)
>  {
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +

Nit, include the get / put in previous patch.

>  	switch (type) {
> +	case hwmon_power:
> +		ret = hwm_power_is_visible(ddat, attr, channel);
> +		break;
>  	default:
> -		return 0;
> +		ret = 0;
>  	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
>  }
>  
>  static int
>  hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  	 int channel, long *val)
>  {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));

Nit, include the get / put in previous patch.

> +
>  	switch (type) {
> +	case hwmon_power:
> +		ret = hwm_power_read(ddat, attr, channel, val);
> +		break;
>  	default:
> -		return -EOPNOTSUPP;
> +		ret = -EOPNOTSUPP;
> +		break;
>  	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
>  }
>  
>  static int
>  hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  	  int channel, long val)
>  {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));

Nit, include the get / put in previous patch.

> +
>  	switch (type) {
> +	case hwmon_power:
> +		ret = hwm_power_write(ddat, attr, channel, val);
> +		break;
>  	default:
> -		return -EOPNOTSUPP;
> +		ret = -EOPNOTSUPP;
> +		break;
>  	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
>  }
>  
>  static const struct hwmon_ops hwm_ops = {
> @@ -66,8 +407,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
>  };
>  
>  static void
> -hwm_get_preregistration_info(struct xe_device *xe)
> +hwm_get_preregistration_info(struct hwm_drvdata *ddat)

Why change the function argument?

>  {
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 val_sku_unit = 0;
> +	int ret;
> +
> +	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
> +	/*
> +	 * The contents of register pkg_power_sku_unit do not change,
> +	 * so read it once and store the shift values.
> +	 */
> +	if (!ret)
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>  }
>  
>  void xe_hwmon_register(struct xe_device *xe)
> @@ -89,18 +441,24 @@ void xe_hwmon_register(struct xe_device *xe)
>  	mutex_init(&hwmon->hwmon_lock);
>  	ddat = &hwmon->ddat;
>  
> +	/* primary GT to access device level properties */
> +	ddat->gt = xe->tiles[0].primary_gt;
> +
>  	ddat->hwmon = hwmon;
>  	snprintf(ddat->name, sizeof(ddat->name), "xe");
>  
> -	hwm_get_preregistration_info(xe);
> +	init_waitqueue_head(&ddat->waitq);
>  
> -	drm_dbg(&xe->drm, "Register HWMON interface\n");
> +	hwm_get_preregistration_info(ddat);
>  
> -	/*  hwmon_dev points to device hwmon<i> */
> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> +
> +	/* hwmon_dev points to device hwmon<i> */
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>  							 ddat,
>  							 &hwm_chip_info,
>  							 NULL);
> +

Unrelated, probably delete,

>  	if (IS_ERR(hwmon_dev)) {
>  		drm_warn(&xe->drm, "Fail to register xe hwmon\n");

Missed this the prior patch but include the error value in the print.

>  		xe->hwmon = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index a078eeb0a68b..a5dc693569c5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,9 +14,13 @@ struct xe_device;
>  #if IS_REACHABLE(CONFIG_HWMON)
>  void xe_hwmon_register(struct xe_device *xe);
>  void xe_hwmon_unregister(struct xe_device *xe);
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>  #else
>  static inline void xe_hwmon_register(struct xe_device *xe) { };
>  static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
>  #endif
>  
>  #endif /* __XE_HWMON_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..9df5a3a85dc3 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_huc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
> +#include "xe_hwmon.h"
>  
>  static struct xe_gt *
>  uc_to_gt(struct xe_uc *uc)
> @@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>  int xe_uc_init_hw(struct xe_uc *uc)
>  {
>  	int ret;
> +	bool pl1en;
>  
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
> +	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);

Don't love the pass by reference, how about 'pl1en =
xe_hwmon_power_max_disable(...'

Matt

> +
>  	ret = xe_uc_sanitize_reset(uc);
>  	if (ret)
>  		return ret;
> @@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (ret)
>  		return ret;
>  
> +	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);

Add line of white space.

Matt

>  	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>  	ret = xe_huc_auth(&uc->huc);
>  	XE_WARN_ON(ret);
> -- 
> 2.25.1
> 
