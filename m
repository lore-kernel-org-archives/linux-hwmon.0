Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478CCCD4851
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 19:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjIVTEX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 15:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjIVTEX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 15:04:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E548692
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695409456; x=1726945456;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4a/SnW73ZwfG2/S+bCq+UG9nSVPaC/KBPOswR2mHSHQ=;
  b=g1NaDziz6/od2Fq9GsJ1ChQ09aHAulY0xKcJBFJE8oWNNeWSO3PttpGY
   U/4iwMxZFc5J6MpyWXqRaytFc6iVmi6EH3neoAR/xwpR4cVHPyk58Uw7Z
   ewoN/SkzknGioBizViDng9QeKJN4/cwC0/yuRwUCNRZ6frIg0oW2Flule
   xA4M38G8x1SoWoMfekSEh34nM8anuXeMmNvAYVKxKIyHRs5ehMnssE6gg
   llVnxFt3HWv9WB4hOUa5UAqvu8IFVjIgE5kBkgA2gLL8bIkIYumgAWrdP
   Rtqrj3p3yawrikFO7ZtcJbueK2W9IKyiMsyfovMebdhnpL0ZifzBtfwRn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380816688"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="380816688"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 12:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078487720"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="1078487720"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Sep 2023 12:04:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 12:04:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 12:04:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 12:04:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 12:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTzWxU104kYxEvYem6YlQ1JXt2kHQk5j3iTStwKThIiF3ktNSjafv18aqkD0KxFV1TiQhhxDt+fCT5taomsM5BwVEcsQW4o5TzCvDvUUBgLrEQiPz8f5sYfebk49QnUS29YjMhC9wV5TQ5wVP7Av4GEL7pu5m0Qq4HCJeImCVOxvyjSgsmDU3WLptwogZkqD1AA/jDDW0zlk0VhZFK3R8zhBoMk8iFV9IHNkszm6MkBRnqoW6me5iPrhkd9exPEemcqvb3xAT+DHU+4hLib4mFvA/QXQr298qqM0dnafWxhOGxQgul9Wc1FUM+e/9xsmLZ/RKq4F9afV3LHzLVK+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDYg9ZXnuEK4eD9UhIZEhLUR/B1XENP7iOUgsf4r9bA=;
 b=LIe3bffZ5YCT07B2F07XiWoHSsaC5qohhZX9+OBEIRt29a9Z/1ID9QufbxhFx6pJbt4uwKTUs41eZ/1YCf9/fNuio3XhfwIY8vPtzxn/BS+FnOahUQbNWJS+iWNh8x0kX0s1QWTwbE7WnlDUbkX1KEBxvbqBQCpnH9VstLF3pTeKwPPEGTsRSFXukocfBz6jQntMCECO6F/iNJyDsja0cUumo+jd+j4WlceAzpK0bedHht/Pvd/fBypB93GoqJHhMpo9pioHI1I0auWDnv0BArmAEeGUbsoifCTpgWuuxxZiCyo/z2dPL/DtMDsX5kT8w42EUJCqnANTiXmwsPyYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 19:03:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 19:03:57 +0000
Date:   Fri, 22 Sep 2023 15:03:52 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Message-ID: <ZQ3lGKm+6bjBIskp@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com>
 <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 93894074-9476-46d5-0330-08dbbb9eac5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MawfCuTwlj3iRoz11BjcF+hsj/3F5fNILEYtYF4dLAhB4FBDwYOC5iyltTM/HKHD2FGXzuZqCPWw+JDfyuZVq/skUDviSpLSkeeLJxa/luwl0OirwkZBqTzCE94NidVBs3TBMHwEFGieh2W7XBLq4XXz2JA0HHPky8hVIEnxT3h39hs5mBrKGALeh4ZtlWCihoyEe4a2ApkoZUvSgnZ6523k2ID3gNbwZfyTPvvNb+mjwhHF0UZjr0BaKQ84Z3VSH9gny/X97nePtLibVzwhg/yimoy2pobhsjxTK7+1BKw8pN37YZNvQG6NGc+Eg6k3lLwpA4zBAkv6m/3j6Nrytq950g1yMhih7B4UGFatHx4q3IQ2OOQDkrlBzzcn98YeNk5nLl6mshcgSBcGl7LPzUTSoChTPtVJ1If6YH6tdHs9wniDne59/WU94T4WQI/aTgk02HuoFvevJxpCh6+1gS53HxdDRlOm4zlJFxtN8knkn7Tb4f8eq5sW2Pxhp+X6VNwqWUpBYI5JZJlu5NPtJcwL1+tMNv/cV6bpJD4ol0ft+BVGTnRBewvxVQZrNTIo956JIBYtW5uUIe7CMffkAXuYiI3VDG1MYiWrCVQh+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199024)(186009)(1800799009)(86362001)(8936002)(41300700001)(316002)(8676002)(5660300002)(44832011)(66556008)(4326008)(66476007)(6916009)(66946007)(38100700002)(478600001)(83380400001)(6506007)(82960400001)(6666004)(2906002)(2616005)(6486002)(6512007)(26005)(36756003)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ULai1qhHKH0Mo1AtOYV1OIKVcZXLwl9o0C2aAc2NSpgDmb1EP0ABZTZZm536?=
 =?us-ascii?Q?9Bec7FXmv0fyy1mQa8wAbosUBogBuO8w3xTlwg7EWXjbMSJjZI7xXMGl/XM1?=
 =?us-ascii?Q?gU5O36vKlhME+1lX8IfZdkZZGfoFPXDLMDomR5XQTD5Pph3nRynusRKhrd9I?=
 =?us-ascii?Q?gHKvBxhN+t2Xs1nHlFJzqsfyW8vBMRbnwXYmVxQnx01vCl3rLvvPOobJU6Oa?=
 =?us-ascii?Q?n+4qXY1GFqXAANqRcRvbF1RVoM/eGbUa10JNVflgzRl0qXro51/k0iI1fRsP?=
 =?us-ascii?Q?R0X3ea4tivl5cO+yWPFa+Fs01n6bXnfiD5tICx4LJw6SUDYA7ow3M7zS6Irc?=
 =?us-ascii?Q?3O83bDbZIKBJY+h04tUy28opfHpsUJfb668w68BeNJV9tubJNSIKqOlaF9lc?=
 =?us-ascii?Q?Z27c1TZRQ0Fw5e0sS4R+4IgJhRu2EpRkHn0zReiTcP2Hco3gf4hZFcDFCyEc?=
 =?us-ascii?Q?NBR+gN8QeRGjWULBFIqScrGc02vgHxpTn8aY+vEzGd+0VfzniCTmulsza/bH?=
 =?us-ascii?Q?UUxRqUI+Co7EhSImAWxw6sHMZlf2jREA1jB1jUrxOao7Iy9NS7ggv0GWD3uh?=
 =?us-ascii?Q?bBKIrTyqYIsRz2++BN5Q5VmkJakPCamTCDhfCUIk5w49QMsf9f5baX2iXTXB?=
 =?us-ascii?Q?1IP0hanZjvqvQFYVjiZpxU1I5x+ZyxHQKXegaF2HgsyyueDEcDSiwbj0h1KV?=
 =?us-ascii?Q?dAGsUQW2p8pSq3lRleXmOPx7xqEgQ2bwtqAsLRu3+KqmIYOSLzsG+xWpn8A5?=
 =?us-ascii?Q?rpidFNJk7gsDjs51LM4Kjy9QLk/nRwo8m83f9sSCYeHX73AlXS/uR6+u9GG5?=
 =?us-ascii?Q?iCgCwayoJxIU7E/M1lYn+lnfgd9zlCLoBrhcdbedTwGBnq63Z4EpjdzPHVga?=
 =?us-ascii?Q?3DOswFV3Mya4GAx1ZuNH8mpIzqTuvkFONGs0uKbra6vo4Jw/waqt245aYOPX?=
 =?us-ascii?Q?4G8D2nHvuPtDHbhnEeaPt3EYcWn4qa9gUgAnk5O5jNdWefzM5cw2LqSdlXwp?=
 =?us-ascii?Q?4BUeF0LPeeQVdPwcEEztTG7/M8d6/EuoraPuml3LS4ZiGwXLN00Psacg5LWC?=
 =?us-ascii?Q?iFQmgLSfIS5+MNxquwam1eP3Bs0vHEmHiqAyumBsxjHQu7ej+a4kT7LUX6JT?=
 =?us-ascii?Q?1pxeIhd/BroYfwqAwccVv7WzRhyphu/jKVJc4F1jlPOUVFSErVacKn4FDIFh?=
 =?us-ascii?Q?tluHWbMHm2zOhC02WSiem2JqvRrKP4eGGxQTzoZbNpD700kbhdOYowIb24MI?=
 =?us-ascii?Q?lbOtEDXdRhqcIu5R+KUHo+xj3e4Th1nTCzbo/PSxL8sCzaJDsV3yH5FXiOoH?=
 =?us-ascii?Q?6vTuBWrXNMPcfoTxBWIPleoF/yM9gyEAmLow79jyrxAlylhhv7bV8ddSDlCn?=
 =?us-ascii?Q?/CA0Jk2knL/mUXLXt2DAcXUUyJQiO6OeAhZnEQGJXgCE6w/nWc9rSROQg+7k?=
 =?us-ascii?Q?pQNqraQ6Ro/HKPgx18uENzFHbdXOO2fAcUY6ISJC6xBhUIo+/Fnsi0/Jd05E?=
 =?us-ascii?Q?Lx5KgmlLb00SCG6nqKwPB/crr+13Px7K9koRt9tMydksR+l7M9YAhMXxqmOu?=
 =?us-ascii?Q?zFA42fumBSx3yjhoOZcp7JgUUNz1b/PGZR03MPwhe3A/cw3QUeweaBLYMRUv?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93894074-9476-46d5-0330-08dbbb9eac5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 19:03:57.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39PFsopQuSlNbpxbBOvDbf+CCGi144qEgfbMI7NWEvyYyoOGllgl4eWXu/yt+8JXnmK/LYsDAiXWLIbb4jxCHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 22, 2023 at 05:16:23PM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Thu, Sep 21, 2023 at 12:03:26PM -0400, Rodrigo Vivi wrote:
> > On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
> > > Add XE_MISSING_CASE macro to handle missing switch case
> > > 
> > > v2: Add comment about macro usage (Himal)
> > > 
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_macros.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > > index daf56c846d03..6c74c69920ed 100644
> > > --- a/drivers/gpu/drm/xe/xe_macros.h
> > > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > > @@ -15,4 +15,8 @@
> > >  			    "Ioctl argument check failed at %s:%d: %s", \
> > >  			    __FILE__, __LINE__, #cond), 1))
> > >  
> > > +/* Parameter to macro should be a variable name */
> > > +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> > > +				__stringify(x), (long)(x))
> > > +
> > 
> > No, please! Let's not add unnecessary macros.
> 
> it's not a bad idea, actually... in i915 we have the MISSING_CASE
> for switch cases with a defined number of cases and print
> warnings in case none if them is the one inside the switch.
> 
> It's so widely used and actually nice to have that I thought many
> times to move it to some core kernel libraries.

to be really honest, I also liked the MISSING_CASE in many occasions.
It is useful for platform enabling so once we add a new hardware we
ensure to get some splats on the first power-on and can easily
identify the missing cases.

But even in i915 I have already seen some miss-usages of that.
And i915 is full of i915isms that we believe it is good but we
never tried to move to core kernel or when we tried we got some push
backs showing that that is not very common and desired way.

I know, just looking around Xe is also starting to get Xeisms,
but I'd like to avoid that as much as we can. in this case here
it is only 2 lines that could be a standard drm_warn or similar call.

I don't believe that it is worth adding a macro for this. So, maybe
if we really want this the right approach is to move the i915's one
to core kernel and then make Xe to start using it.

> 
> Andi
