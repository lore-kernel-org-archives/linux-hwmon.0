Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0379FC001B0
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Aug 2023 21:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjHHVbo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Aug 2023 17:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjHHVbo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2023 17:31:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1739C
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Aug 2023 14:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691530302; x=1723066302;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QMUFByC6cVOIFvdvIkQNsBjOtEwY8h3bwIZI9Au6z38=;
  b=PmZVQLPFbJgCuFLPtzX+lj4gmcpbI9PF2vqhlToOvMQOW3srMmtZDjPY
   UpLD5kwWR6kRMMIbjjFzFDv8l7djFKan1QiWveBiJtP+Qn0jEU00It62r
   6PNzkf74xc7r7dSfClFgjyeCcLhHrDPoGSIataxrwyAoBU7RtjOpyyUpK
   mNnOOm1mq4UceDhlyZfsXJ3SCW2cIUC43XEqtGYHi0FLgs8hr2LIEmvQo
   AQCNWFjrqZvIdWX9iDr2FnRK/LPgASVSkg1V+nZz078mP4iKhhQJv0Zem
   dV38GhRbbTgZUfvWIhtCGjOEX3ahcIaqCzxeMTsT0GLfe/sW+oHZd6GFH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361077865"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="361077865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708435273"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="708435273"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 14:31:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 14:31:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 14:31:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 14:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU5G4DnnDF467p9Uton/8ziFvGL+G2zVv8D+kKLLIls4RL6wPVk0R4nvl7CaRZ9ztikJqrz/ncc0r+ZgjxQg23uiWQ9M7xtBGwZMlGMfw1H7Wa3TypXpK1AgSUBNpy/u2CMGzCvVyx4dRScaTAWm8XismlxaFuLAu+9QDlvC+vWoA1xAcetzRn0Ed2s2LvhNkJP6JybrOs92iZElfZj+mtMO27zvhFQ9K6j1fWJglQPPBhdfGk+Fr0UeB7vN+MdzhBmANAwdZX+dT4UAFv1HH0jdoDrkHbR2axVBMoQi3E96DrQhkaffnyj4K6dDX9jO83j3bVPFPPtiDgLtFo/lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWB4a424rNHOY0MUPab2M3+Nwnk0mSMHwlD8mibfGZU=;
 b=d/PucQ1t/1OpoCPMmxhYUDQdkSAUU3UWI9RnnBB8mqZwq2ag9RAgriTJ8AXekXT6urdC9yZFvQMSvYKzCiCuzq3MnBdgby/GZQAYh2+8B96fabkWTgYoo5LTgIu2745jpNhfahuRyu/WZj523AtItlMvzNy7gWBjnmi8ZmMNsX26sGlOET5y7/L3ss+Ext4dlZWz68qFHucvx11xXL4+DDMpRoJK35mSUS8RXfpHdIdzTUgO+cgBDqsl9MtjT7j/enu9vlZq9nONRsB6dG5vTKbYzh97qmEfyHlHwWop/LjO5vHF3xCs9PL38n+8+rleYLr65vHkvLq/5EQ3D5OtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 21:31:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 21:31:39 +0000
Date:   Tue, 8 Aug 2023 17:31:35 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        <linux-hwmon@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZNK0NzoBlGt6chs2@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
 <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com>
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 9778a051-3644-4143-fcbc-08db9856d9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBUT5uXNk9vLaRt8zZES1xU8H5h/jlqOKp+G6tY7PI6HEEobjbBwLO+8cZG/HegB0Mriq3pWqd3laOGTFCwdcnWO4TLMZjvw54TW+RUQdy1yPGOkTc2nbGAvjabkwkX1HjZ7MODMOsdyhMLK43gJbo04/jTSsbJhNEe3EkIBfx/fRRxB4wbMYWmcdH8PivyrnPnB6P8BTfvVkmhNwZ9BIEtozdhKMsVdLuPoDGs/ttmQvVVPkger4IOvIjFjXVvHeIQo9f34WfyYvjo4nK8UDWIWvz8S5MimlmfbcXeXc5yBZteZq+TznKODl8IgBS8IWpInwngenEfIQz5cPHReKLIFPZPsnJg5do2/SB/IZ2JxT1KeNWOIdaXqbnspusqweODg5VG29nTZvmW1obfl40FLP69DLw5eJfuR3lEE5V1Q8K5mamcLQuNdNzbHgZBxuz7N9qG7W66TAo4rwp9bvvlUluDz5LY2Bh/GZU7FrZA3WGxd5LHSOyrhDDAQp1l2j+vnCpEE+NW5gUugZS40+SNmgGwEBxweCQ+z5URLIhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(1800799003)(186006)(2616005)(86362001)(6486002)(6666004)(82960400001)(966005)(478600001)(41300700001)(6512007)(26005)(53546011)(6506007)(36756003)(316002)(8936002)(5660300002)(6862004)(8676002)(38100700002)(54906003)(44832011)(37006003)(6636002)(2906002)(66476007)(66556008)(66946007)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wKOtSzw4r3V20AD9AiBdgYo7V6Aqxm26AERjQ/ZSUmZscczfA4mcKiXGMK?=
 =?iso-8859-1?Q?oxdDu895L8ryRmY6yjGEGItlJqFhbnGzmIPu4Hm76XEs9JuX7JqtkGWmje?=
 =?iso-8859-1?Q?nsD/K+RCvMhQluWkSMPv6+Ff5eFGojTASuZjFD9YhpKEqYe+WNw/t4VH3c?=
 =?iso-8859-1?Q?Oix5yht7rSc1k95ImGO+tA0369HlLNsEVuShQLe0b8F/VrDXnFSpU3X0Me?=
 =?iso-8859-1?Q?LHTV+nhsJvDDXQYxLtIY0BUe95uQ29GemB2NLlkkgpli69/vDitr538PBW?=
 =?iso-8859-1?Q?DwuPAHywWhYmJWInruZ8HgE/ADxsJi7zS7DUyUV0TMZ3R59Zx3Jmb+yytz?=
 =?iso-8859-1?Q?2LIOm9/v7Q+adl69V+t+AUoHavrxlvhF6NAmDh+Gb9paj33rtDsurXLkJS?=
 =?iso-8859-1?Q?+soMpZ6xjQTNwlxP4SZJlvQX66K4EAxn37blI6KLSpTnPA5pTt7b2UlwUJ?=
 =?iso-8859-1?Q?k1C+ChOLXGqlzXI9AbKMyEGnfO35DbgFClwCchMXZe5gYoUL2fiFp/czbP?=
 =?iso-8859-1?Q?r5rPr9Gn3agEsVn0EeaZpjJ58PMgUmI81zAMN0YWtBynu51V/NIovMNRKl?=
 =?iso-8859-1?Q?bbM8CsbW5QOtyIYbS1Z7s8tQMUtqKSnOoQFpP/frTM7qL3G/h436y7yev1?=
 =?iso-8859-1?Q?Tqqz8KLdkmnA3E9IhCAEcLVQxTBAO1/CNwAaUfsrZLj7/iw7it7puQO8Og?=
 =?iso-8859-1?Q?yCmoY+K434lwe/zCIlm8+hQFfuquwpsB6SO1xNxpYer51BhPYL6t+QFxhv?=
 =?iso-8859-1?Q?nrds5Usazs0f7ZU+uR/t6Ggzxc+eC1W81Gm38iMK2XTpMwNMrewUJApC04?=
 =?iso-8859-1?Q?Bi/8AffyWBe7sJ3CUSiyjbtzSaHTtkqYFVQuPEynA2EXyZM7Ss6ItVeJ1v?=
 =?iso-8859-1?Q?34NxgDz/NEH+Lx/422Q+exEt/Dnf7DkHYyj7MN8oqsAKnhpyPyUjJUSCga?=
 =?iso-8859-1?Q?esDOzLuFxt9KbtCUVmMTtnj4lF4xDCW0iPalc59t0kwTfE6QVsEGTSxd0K?=
 =?iso-8859-1?Q?z6otMxbCtSSvwj8GT42UWU+YyTeaHb4w03aaBuE2El7A/SWL2dtygRhl14?=
 =?iso-8859-1?Q?lrheU0B7iYOodeVBzk8BqTsqST9Csoq0PIAgiGheLlXjLAT9b695d0IkmP?=
 =?iso-8859-1?Q?lvlaUml3ZYJKqfZLSEJEBQXw9Bd3Vv0TGrkUde9s799JStxyVyxE//LPK3?=
 =?iso-8859-1?Q?P5s4w1WgUzJJuK/qoyK8b7IzDPvSIoOfZ1Qy0QPoPIEVQwszSpH0J+gfPb?=
 =?iso-8859-1?Q?kvmNVD14YwHFXOtoSnt8VkDlb0/jVmyKrTPTTtT3bpSGqpqi9cOCqblz94?=
 =?iso-8859-1?Q?VJH5tGplg1VEwt6osb+Z3CXB12YrK3UzM+7gAtxRTIJl6VACondD8/c72j?=
 =?iso-8859-1?Q?UpGhRP8+TpIVYH6iYKG1Wki2kLwG0eZyZxrp8AK8Dz0qB/RdTQKc9c3IDg?=
 =?iso-8859-1?Q?N3WoU4svEu8yA97hF+Tn+lR36/C8noHxOlLSiL1lPTXQcB10vENnDmyfRV?=
 =?iso-8859-1?Q?kT98Frh8yCzY6bJJnQKESN/w/CUlpok/B8dstL7spVacjlj4+CgAhbThsO?=
 =?iso-8859-1?Q?tTCQHUH6YnaCHas6X7M9ZIFyF58xOHcbBsfoADn8o1u2u0mtMWX+47jIDN?=
 =?iso-8859-1?Q?ZuwXRnaSZtIWOWyPBcte/YAdQXbPab+jXGLp9r372wGjZTz9M4dX/uUg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9778a051-3644-4143-fcbc-08db9856d9ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 21:31:39.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJS6KxEIhAc5lQBNw0mgoTnE2HmnH3HX7djPf3hj8MBOvGKTNVaPKmBUHBM2CC+7kmHqgi2bZrJuB+e8OqgQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Aug 04, 2023 at 08:06:22PM +0530, Nilawar, Badal wrote:
> 
> 
> On 04-08-2023 19:56, Guenter Roeck wrote:
> > On 8/4/23 06:19, Nilawar, Badal wrote:
> > > 
> > > Hi Guenter,
> > > On 03-08-2023 04:42, Guenter Roeck wrote:
> > > > On 8/2/23 15:40, Andi Shyti wrote:
> > > > > Hi Badal,
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > +struct xe_hwmon_data {
> > > > > > +    struct device *hwmon_dev;
> > > > > > +    struct xe_gt *gt;
> > > > > > +    char name[12];
> > > > > > +};
> > > > > > +
> > > > > > +struct xe_hwmon {
> > > > > > +    struct xe_hwmon_data ddat;
> > > > > > +    struct mutex hwmon_lock;
> > > > > > +};
> > > > > 
> > > > > why do we need two structures here? Can we merge them?
> > > > > 
> > > > 
> > > > A later patch adds multiple hwmon devices which makes use of it.
> > > > I think that is flawed, and I am not inclined to accept it.
> > > Is there any obvious reason that there shouldn't be multiple
> > > devices? In i915 we are doing the same.
> > > https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
> > > 
> > 
> > Technically you can do whatever you like as long as the code doesn't reside
> > in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
> > either. i915 shouldn't do it, but I didn't realize what they are doing
> > at the time. Other drivers doing it wrong is not an argument. You can't
> > argue that you may drive faster than the speed limit because others do it
> > or because police didn't stop you last time you did either.
> > 
> > One chip, one hwmon device. Do you have separate parent devices for
> > all your hwmon devices ? If yes, you can argue that having multiple hwmon
> > devices make sense. If not, you can't.
> Thanks for clarification. There is only one parent device. So will try to
> accommodate single hwmon device.

Well, it is one PCI device, but under 1 pci device we can have multiple "tiles"
that can duplicate many components. Inside each tile we can even have multiple
"gt"s.

But back to the tile, each tile has its own metrics. It's own power delivery,
own sensors and all. They can even be seen as independent devices from this
angle.

I'm afraid that the attempt to put everything as one device, but all the
entries duplicated per tile/gt we might end up with a messed api.

> 
> Regards,
> Badal
> > 
> > Guenter
> > 
