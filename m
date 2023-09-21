Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14277E7D0A6
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 20:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjIUURg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 16:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbjIUURW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 16:17:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B003B196
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695316330; x=1726852330;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cIr8WHLMEjeHjsLJfJDBTDxdLsYol2zEiWoCawTJwaY=;
  b=Ks+ZsxTXa1YNIn+J2wJwjfMFp9Wl2uf81Mfnf19NiKFR3XYRYGRJFE+A
   jZAR7ZrNuchP+dlNmkPIvDZj8mTSVSuAOHlKrqHuAGyXpP93zt9RVVtnG
   cqU/US3jVMAeR10q3kZUpwhs557BINbL6H93PmjBDCYNTLYW9szkxgHQj
   aAiaUG+KRiCIiveHsia06m3/nbs6fKTX8aInbLzpl3XxiFQLL5VS9Iswx
   hwgtE5XOpHCHa0v2P7HNbuonAQ+w/VoF8wWK7C2NnvfXxyg9/8jxvKvIH
   fyFd3NfTXNuxUZ8jZUErYBhFv+48pUs2zsHuK1yH/EeEmxgfckDlTCuX/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="370899300"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="370899300"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 09:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817466302"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="817466302"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2023 09:25:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:25:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:25:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 09:25:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 09:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVUuuYmZdDEPsUKtea2rC9XjKvLFr+LxaJIR70VnsY5GK8yOVpL0Zk0olpqn/Cv2sXrpa7GFIfw+x+uYL2OH99qJh4/NbAE3PxK54eW1TAK/+3RfVq5yUq7QfpdLBeh52y/0/KJVSjcFik2LJqpp7dIOnOPUbyrscWkJv6+5sBKVOm/b4yAJwlakXsirWQObiknN0f0DQNHP/O5Kv0OoumyZqjhlvtd/VCuHgrUalfrmXvgISk1MUFp1gQhhbPVVJF/0YJQfjAf3fESE+5JilBZh4XVZoKEH+b0FvFhwm/eEsg7Oek4Ls8KguAeoih77Fz+xpembn8OedgJtr1gkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHvjCl7/Btuvw+EP62BYE7sDIKMLOU2e8sMLr6LCb2E=;
 b=R531Q2pe/EWcuyiAQW6REgujwlyoOM9jAPL2QNirfwtSvhWVboiX5dExP1Zi7FPKvo095UFV+TZ6qN+hZIWKQs0W6WckngMuXU+WjpgMeIaJ9tdoqywQlSpFUa2Gw1YAMznAJQ+lWQE82sTSp5b8/0rWn03+AbeNJ0nj3zYjx4lVQ0JvKlgqvmWe+sO1dBYyYValsxqy7UuyPFCbjEZCr7TdiGtLzPP69jK2QeOvMW/fbb9PWUeqDHmItdXHnYstX9KNulq87YlhESuelqk/OuCXyU8XTgJUr4mgAonIMX3tNhy/MpkjoCI6ocfgiKd/yo0oru2cJ9FE34lmGFU0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 16:25:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 16:25:12 +0000
Date:   Thu, 21 Sep 2023 12:25:08 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <linux@roeck-us.net>
Subject: Re: [Intel-xe] [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZQxuZLgY4r6Gtitx@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921102519.3355538-3-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b98c9b3-79a9-42a7-ce9c-08dbbabf5467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnerBxuZcLX6XI3bB/ZwQ2sa69lA0Oacmxz10gFTJeK82P4nS2t2H0+sFe0Cd7LtB0nH4yKTaXm/TCIuDUgA6rI8bsBtmFUxIM0JH2i9hZxtH5zyA8OtdgsDan0nOoTF1zNWt+Vu57uSINzUyf/EpMkuGTuTQ6eA6LeaucvfVWzhKa8IFFJvnOa7WKVaOWFWKhnTmiY7Lq/oUTZfPlBRrHMzWsQDflbNx2XjCNzKWWvPkvpGrRIVTnWYvBK2NK7nvyuBEOVE5O4D8Pwpm3Sr72EQ3RdDvq6Ca+/5O5xHqeAlBgrLPe6q0SAAEkwYYiJMt+9JoD0IIKr4P56f+XFNLyU8bWY+WGLpRoJry7NEp+ZE9LiOv5b/ajDINASfsgA6RbCxkXwcpEUw8jiIpmieaygLlcWRYEv1uCDCiW8ry0J/vI07UK26qQj1ut7oLknpe4pPmtZYkAqNkYIyaDW2bgPnz12TYAeQYX7Kr9ELn+Ngmv/jqdeY9UpeogJxAaRiCSmE5vxOztyRIDwCqcjJ4lmeYdNqcGdNroVE1gly04hmf2swj4vy9gFrZEbW1Hp6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(186009)(451199024)(1800799009)(83380400001)(6486002)(6666004)(6506007)(36756003)(82960400001)(6512007)(38100700002)(86362001)(2616005)(30864003)(26005)(2906002)(6862004)(478600001)(4326008)(5660300002)(8936002)(8676002)(41300700001)(66476007)(316002)(6636002)(37006003)(66556008)(66946007)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+PAOpcW5vPJrXtZZMI1v2z7z8huBNKt77PaYcxB74I2mnZqek6oWqnHlII?=
 =?iso-8859-1?Q?69lhoz+hx7oJwA/Pux4/MYvvn8fPHVdA6nlA2PrTw0FpJGmrilu0Ipwvn0?=
 =?iso-8859-1?Q?Wn9wX7n3D6Czhe796lzBdux06sGPFU1hHNB+F6/whan9TCae4LMZGj6gr5?=
 =?iso-8859-1?Q?+3rHX9cTDay9Tga0nC3ieB2I3SAM34e8zgxeHv4HwoCH/KqUlCJ7m86gSo?=
 =?iso-8859-1?Q?QLXk8bKFFHuHNGCWb8TWs4k3qAgOQE+qpl76ZjGvyij2p2geH3WwysCLNI?=
 =?iso-8859-1?Q?qZka8gE2MUDLSK/ogvJKw0HDzH7zJO+1sARxBwx9Zxkgx9SojwMNCaFS4T?=
 =?iso-8859-1?Q?bhSLJ2/ckTiyLGlz8LCdsUxMsw4KglvmxZHrrZ05j1fhHkBbrInrGNIe8Z?=
 =?iso-8859-1?Q?D1gq2ZycTRm+EyXYTD7QKmNNEECJlsVeIqBHoe4MwK6ZpGC8wsf9iubz2D?=
 =?iso-8859-1?Q?PV7ohN7FvruBCFTIoRmzlJcPujrjsDQN6nJp5q6TB3MfDKH0thCz3m/vT8?=
 =?iso-8859-1?Q?kY2hjTlVz4zK18GAuLQd36hJnhel9VWqXTSUrmwYOShNt3iaDNm6AKOO2K?=
 =?iso-8859-1?Q?TMa+mJGiMJGXszCAkPBbNPa6UlEEtlrhaDpH6Y/P1wnRnAQy2fxGy8tjAT?=
 =?iso-8859-1?Q?/ARlnG/M88qmHjaOfah5j9OQU/D6JFAF3T3FK9sSy5JLN1jT7fL6aeYkiO?=
 =?iso-8859-1?Q?/eI5cLzMVpSIWyeUpJrjUrURC7ER87C29YSiz3+bJCtFmaP4PY4e9EGPX3?=
 =?iso-8859-1?Q?YdYnOLYmG6dXm1jFqQfe8uDMa+Cugbn6/OxN2odZ5+lWQ9qBnsLk8w313r?=
 =?iso-8859-1?Q?vxfhW8wFLkg54co/DqTsu6cbpJGhyx2+ACx+nQifu3w/e3qnbiS8vlVfBX?=
 =?iso-8859-1?Q?/fYGmCsf/jb7WO4br1PD8LR/zB3a1euzCzXSD9QjvU3aaUR70kvKSxpKMF?=
 =?iso-8859-1?Q?Hrrq4N7M+kAmBNnGShTn2OKn0Ayb3IByQt7pBpoH7xgydyYeRIQ9Ro8cKv?=
 =?iso-8859-1?Q?7oRMBq9gvJAqEV438cu2OOO/gGyHMwMOGwtMl2pAXIn3yXgbucV3AH6RxA?=
 =?iso-8859-1?Q?TV2uM+fRrAZSAeQYBqmbnkVPyqYg8rDcprsWx/oRIv25uIMx3dIczdIJd0?=
 =?iso-8859-1?Q?3qLFfAG1xF4taj8XfeBy/MymJL4CA6tpjNezMigeYZNAsd0NIjTxGs3+0G?=
 =?iso-8859-1?Q?pJv481BnQvpwJfbGK4TCTM/PWJj4YaB/Pp8mI+m02oWtbpXLPss0lXdCYO?=
 =?iso-8859-1?Q?B0jM3GIO8hQTscbGfV1+gTE6IRwHs+7TL1QZs4gtm2mMpoTZTW2f1uqgP/?=
 =?iso-8859-1?Q?i5r7bVGhTjg3wdfsbTL/EN5zlJJEjJpnpmQt3Lld+3t/tzKQaaDtovhFZ4?=
 =?iso-8859-1?Q?Mg3/7uj02EC7bYWjZLVD0MEYMNvBxUdRNAs308jr7dTzjxQUsLMToEiCY3?=
 =?iso-8859-1?Q?tZASGnj1rL0MyteDpC9VHjIJATQcj7/sg9siP0Bz69mAM7U57AAd1KClw+?=
 =?iso-8859-1?Q?qqchDwVMSjL4OH5GenuWzFFunr8vSnpp6p0ZaRe4cJs2+i2NQtrOhsPdOj?=
 =?iso-8859-1?Q?/OEdc7tZb6J7jXNNpJhJemUn7KM4FYOup1zmatDLPaOgig+3PwYHclZsw7?=
 =?iso-8859-1?Q?TqtDpbWDesuXBEUa291lYOHpgzZzX5V+qwWTWO0/fRIhjhs+qLoFZNEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b98c9b3-79a9-42a7-ce9c-08dbbabf5467
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:25:12.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHB1nXnyuVmT+LifI4wYR65v3lr0GkCjrWG3r9dUjvXJCjGW/aW+l80gwTcurzbkH+zRfVBJtE7KyPdJlwrm1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 21, 2023 at 03:55:15PM +0530, Badal Nilawar wrote:
> Expose Card reactive sustained (pl1) power limit as power_max and
> card default power limit (tdp) as power_rated_max.
> 
> v2:
>   - Fix review comments (Riana)
> v3:
>   - Use drmm_mutex_init (Matt Brost)
>   - Print error value (Matt Brost)
>   - Convert enums to uppercase (Matt Brost)
>   - Avoid extra reg read in hwmon_is_visible function (Riana)
>   - Use xe_device_assert_mem_access when applicable (Matt Brost)
>   - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
> v4:
>   - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
>   - %s/hwmon_reg/xe_hwmon_reg (Andi)
>   - Fix review comments (Guenter/Andi)
> v5:
>   - Fix review comments (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>  drivers/gpu/drm/xe/Makefile                   |   3 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
>  drivers/gpu/drm/xe/xe_device.c                |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 358 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
>  8 files changed, 445 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> new file mode 100644
> index 000000000000..da0197a29fe4
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -0,0 +1,22 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 86c8bd4c05a3..ca77aff60d48 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,9 @@ xe-y += xe_bb.o \
>  	xe_wa.o \
>  	xe_wopcm.o
>  
> +# graphics hardware monitoring (HWMON) support
> +xe-$(CONFIG_HWMON) += xe_hwmon.o
> +
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929..679cdba9f383 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -410,4 +410,8 @@
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
> index 000000000000..27f1d42baf6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H_
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
> +#define   PKG_TDP				GENMASK_ULL(14, 0)
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
> +#endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6bcb6c3482e..2acdc22a6027 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_hwmon.h"
>  
>  #ifdef CONFIG_LOCKDEP
>  struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -337,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_pmu_register(&xe->pmu);
>  
> +	xe_hwmon_register(xe);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..d1e319f305ef 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -365,6 +365,8 @@ struct xe_device {
>  	/** @pmu: performance monitoring unit */
>  	struct xe_pmu pmu;
>  
> +	struct xe_hwmon *hwmon;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..7f4599d98541
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_mchbar_regs.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_hwmon.h"
> +#include "xe_mmio.h"
> +
> +enum xe_hwmon_reg {
> +	REG_PKG_RAPL_LIMIT,
> +	REG_PKG_POWER_SKU,
> +	REG_PKG_POWER_SKU_UNIT,
> +};
> +
> +enum xe_hwmon_reg_operation {
> +	REG_READ,
> +	REG_WRITE,
> +	REG_RMW,
> +};
> +
> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + */
> +#define SF_POWER	1000000		/* microwatts */
> +
> +struct xe_hwmon {
> +	struct device *hwmon_dev;
> +	struct xe_gt *gt;
> +	struct mutex hwmon_lock; /* rmw operations*/
> +	int scl_shift_power;
> +};
> +
> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> +{
> +	struct xe_device *xe = gt_to_xe(hwmon->gt);
> +	struct xe_reg reg = XE_REG(0);
> +
> +	switch (hwmon_reg) {
> +	case REG_PKG_RAPL_LIMIT:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		break;
> +	case REG_PKG_POWER_SKU:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_POWER_SKU;
> +		break;
> +	case REG_PKG_POWER_SKU_UNIT:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		break;
> +	default:
> +		XE_MISSING_CASE(hwmon_reg);
> +		break;
> +	}
> +
> +	return reg.raw;
> +}
> +
> +static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> +				enum xe_hwmon_reg_operation operation, u32 *value,
> +				u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	switch (operation) {
> +	case REG_READ:
> +		*value = xe_mmio_read32(hwmon->gt, reg);
> +		return 0;
> +	case REG_WRITE:
> +		xe_mmio_write32(hwmon->gt, reg, *value);
> +		return 0;
> +	case REG_RMW:
> +		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
> +		return 0;
> +	default:
> +		XE_MISSING_CASE(operation);
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
> +{
> +	struct xe_reg reg;
> +
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> +
> +	return 0;
> +}
> +
> +#define PL1_DISABLE 0
> +
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in REG_PKG_POWER_SKU. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read.
> + */
> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +	u64 reg_val64, min, max;
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +{
> +	u32 reg_val;
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +
> +		if (reg_val & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	NULL
> +};
> +
> +static umode_t
> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
> +	case hwmon_power_rated_max:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_power_max_read(hwmon, val);
> +	case hwmon_power_rated_max:
> +		return xe_hwmon_power_rated_max_read(hwmon, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_power_max_write(hwmon, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t
> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		    u32 attr, int channel)
> +{
> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long *val)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	       int channel, long val)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_ops hwmon_ops = {
> +	.is_visible = xe_hwmon_is_visible,
> +	.read = xe_hwmon_read,
> +	.write = xe_hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info hwmon_chip_info = {
> +	.ops = &hwmon_ops,
> +	.info = hwmon_info,
> +};
> +
> +static void
> +xe_hwmon_get_preregistration_info(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	u32 val_sku_unit = 0;
> +	int ret;
> +
> +	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
> +	/*
> +	 * The contents of register PKG_POWER_SKU_UNIT do not change,
> +	 * so read it once and store the shift values.
> +	 */
> +	if (!ret)
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +}
> +
> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
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
> +
> +	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
> +
> +	/* primary GT to access device level properties */
> +	hwmon->gt = xe->tiles[0].primary_gt;

So, what happens with the other tiles?
We should get them in since the beginning since that will impose
interface changes and bigger changes on IGT tests.

> +
> +	xe_hwmon_get_preregistration_info(xe);
> +
> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +								"xe",
> +								hwmon,
> +								&hwmon_chip_info,
> +								NULL);
> +	if (IS_ERR(hwmon->hwmon_dev)) {
> +		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe->hwmon = NULL;
> +		return;
> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> new file mode 100644
> index 000000000000..1ec45cf1d19b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_HWMON_H_
> +#define _XE_HWMON_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +#endif
> +
> +#endif /* _XE_HWMON_H_ */
> -- 
> 2.25.1
> 
