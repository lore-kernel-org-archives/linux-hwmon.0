Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E5BE7C4D8
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Oct 2023 15:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242958AbjJDP4q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbjJDP4p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Oct 2023 11:56:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF51B98
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Oct 2023 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696435001; x=1727971001;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RXs4CWlbfXPjMXuS2PjZUA0nkbFiIGH2U/RhQD4Et94=;
  b=h/hpMG5EWro7d43sVu6m/hO5C5Ks5m8rBPzu2xRrskKQGc45Xu7BWoMH
   sHeoSfKVyBCgOUJci3xzHBRo2RDbBvt3pH/SeMHi7usTZR3KeKnWfHtsd
   pKqWhGussB+v0tYOtyZF5CGzStrJ94yogEJ+SYtEQ5bL77ZbcEjslEqe0
   vfsvK+7tP3sCVVHG3+Id/9llTrSsf51FEtegeKcsisBOfqqCiZY8M0TA7
   I986uNdnwLwUHAU1KcEp+byClMsssdrcLcKlKtVnjH5EHePso0RhJyMUQ
   7BDOxksqH5mSST4HgpBGy3vKS3y3qHVmufZ7PYfM6wOiMFtXYRIOZkJZH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362566311"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="362566311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821711578"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="821711578"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2023 08:56:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 08:56:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 08:56:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 08:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6phgGnNEpyFqMx2ooNR3MH+EP138tiKrtwcxFvcpGuoih1zolxMDsafAaf6YWu5aYiZuZ/Vz8emixTWZMmba1QW9LmYxhEadQowWSradDU/7HPNnAOpWoGRiuzjcJ/MFp/brmL7KTgw0crBnHGDvXmAw6hn11FoN+tX0hhEbDZqDIWpgsBc23N/8kHvALrGXQ+nm4F8FO4qWhOKIM2L1sJPX3qAzOEX+k5WT2kC04td8kd5Tnl/5q8+EdUlhZwKD65qf/VKn7g9xF9JGjIX9+gieSLz4gk6fD++t0UQeUA/s43b2hjCUUBizvc8IHspMqbxFm43b3CYUCIYHAxW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhMeOzQhnMU2fTrNtG7DMpkDoqgTCKBAsO8vigfvL8A=;
 b=OHRIfKuF0Mgzm3f07mrMg8+Cnkm/MIISpcaJkKWE/QOz4AFIFaFJen92iSYKyUIxyj1hdDnPUgiL2z2dbbgfgz9bd74IPaIJxGVzsVjUgeexLVBQbUauNWDIZBr2tcZWEwOUNLYcRr+Rj+ZTa9YZ0fwrHm6Pe0lee/DLlprlbLAoAPOE5H7NiDvrk28/H5NdDN44xSMjTK8Xp6bSHKmL42DJq6pMTVCptaL3mBh12MR8bA7Gohp/BNo1hKHRJOhcCrET7E2bSlXdcX+xSR3GVeluuwqgjzJh9+8ZztSUhaD0DeAJelCJsSU65PHB4aYHx5NhBZXAoZ6cot71C3q5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 15:56:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 15:56:38 +0000
Date:   Wed, 4 Oct 2023 11:56:33 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>
CC:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        <linux-hwmon@vger.kernel.org>, <linux@roeck-us.net>,
        <intel-xe@lists.freedesktop.org>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
Message-ID: <ZR2LMTjeZrOzlDiR@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-2-badal.nilawar@intel.com>
 <874jjg1ak6.wl-ashutosh.dixit@intel.com>
 <84b5dc30-6b27-caf0-6535-c08f6b7e8cd0@intel.com>
 <87ttreucb0.wl-ashutosh.dixit@intel.com>
 <c366920b-ec67-f5be-4b17-ae1be82bdae9@intel.com>
 <87r0mhncwr.wl-ashutosh.dixit@intel.com>
 <87pm20odx9.wl-ashutosh.dixit@intel.com>
 <87jzs3ryxh.wl-ashutosh.dixit@intel.com>
 <fa566c3c-ea7b-967e-b7ee-868317431140@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fa566c3c-ea7b-967e-b7ee-868317431140@intel.com>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 104a4684-cf43-4a32-358a-08dbc4f27e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vR3HwaUst5MaqCYSOBiT+yLwr98+pRUWzRcP7tQ3mr9ho+LX9JUijxC5vw6nrYogs5li+cN8cRsRyG2A4HATnSstLtrFJGi+gcA09IttwVjcyi0R8joMNgecMr5Yhc6KWstX8gDzBVhZ4pQd/4+ZdT+QjVQXCP7pj0E0EV2b6HVfEnYacrvT2uKykIanwbHoCNeu9YXhSI2YGIbr9TMmzkIYTeT/heBPoJTDVTb3GD/SvlhdD4/r3CIRY4VjIEhYdbf7lRACE7eFVrIWDQfHFgeae1NG1ispAYPTmDc+KKd0XrAy03pCnZiXz1hMMCNlkaSExl7Ghd2Ov5z9ESzbM/QtxKEg7Hz57dsRjm7N4WiY0XOeX144tvaaCkUu34ypDsJteH8MKMzSeFqeslavdnjJZ+4Cl/+2ze72SGClnHHetSmnOzuw2iQeqxI+s+Xpwd7CKg7ujSo/wlgiTZzGjvRN4GZlEa2wxptGhXPcSzKvOYTu6Uh8fR5gTJsLQekW3GUDpYZVV3SvJp6IA95X0+If4qseh6sFJi5AU3GmPLhqdWv1sU6p+e3n2h6xtNF5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(376002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(44832011)(5660300002)(8936002)(2906002)(8676002)(6862004)(4326008)(41300700001)(37006003)(2616005)(316002)(6636002)(66556008)(66476007)(54906003)(66946007)(26005)(6666004)(36756003)(6506007)(107886003)(53546011)(6512007)(82960400001)(83380400001)(86362001)(38100700002)(478600001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4XQC3K2GwgExFkPdzOV7+s4LsQFYab53reK/ac3quGQU2Sl1Ak9RnUhW5TRk?=
 =?us-ascii?Q?Zch7sntIX/Bt3eEmVF+V5HRTzJK0BeoEyt8cIVUD1Y827de4od/6EG3x3mE8?=
 =?us-ascii?Q?6HqhgT8kc8nlv0OvNyQAy0A+4fqJDCcrVp4RmLcD9w+G8vhZkG7f8HP1hgjY?=
 =?us-ascii?Q?SDA5A58hroxv1UESwc8ld+yqZ5hbM0xLVLhrD0BVj5ALQGIDN+n/Of1Gt0fU?=
 =?us-ascii?Q?8wnWT8oWMVm/2wX2aBMwCdGXzem86zL0JHt36DWqAfoCUzzVkj52Yfvlaq2a?=
 =?us-ascii?Q?31PFgPx5/FvjC44DeUCLKoldc/q0FM2AWgXuZ/BtWYDyF5ey0QOZN+sF8uSy?=
 =?us-ascii?Q?jokDLgBMO2Ay4CH6/AZQXoTurHBRae5+d7QxfqmuH5l0XdUug3k2XOQIGh3J?=
 =?us-ascii?Q?j2zrjs16RE7amqxh52/nQ9ogAQ3vY70Sq9Bjn4MkkYyXjByN/Y+ZMLZXcy0D?=
 =?us-ascii?Q?dckTBrPLsBPvzVJmDgc2PWnB+XRjUVFgAUiGfhunFM3IwQ2cDeZhZXrJpiUD?=
 =?us-ascii?Q?X6RnRJOF0Yt8EMbnkHk+ac2xKMRpX5938/cqLu6HEPFmgZSALwfWnDan4fJW?=
 =?us-ascii?Q?qbenEsXADKKalmSo6rePPkkYrVjnF27qo4CuJ0zxcvFj0jCJ2IuNTPy+qjcJ?=
 =?us-ascii?Q?sGX/UhMb0dR15XgUH6hQSYCbsCWusduBcefW4LPOVAtSZ3ygs/fiMG2ctfBx?=
 =?us-ascii?Q?492KbI1eQU4PNhswNyf2MaTEiy9iQEXNOeow7yDPAuAGsV4G1LzUNFCrk5+q?=
 =?us-ascii?Q?tISleku2UYNxgcvOeYcI7nWvljWfqYoGHcbP5kRXL8a7qK+GN1AjbiSISpBy?=
 =?us-ascii?Q?0tEmTRQRr4M+DMKmhLR/T1uZOojbRfzedGrMzp0zgyb8jVNkddOabq4l5orc?=
 =?us-ascii?Q?sUy+9nruu3a36xmbXMVJUAwPMnDpUvln/qPKPvF4+qJ6RCCAx19VW9+Bcazl?=
 =?us-ascii?Q?fH5MrGKmzL4/LxnrU1+CNrQoXtBgDerOUuCPvdjLWfZ81k/kbGbl4z60jjk+?=
 =?us-ascii?Q?odcghULxvwyy9wVYkDiJAlnyp9rztoBIBpMGZ2IEWvCccVzY5zSSo4kevMfC?=
 =?us-ascii?Q?jP/ML7LmTiJ1nyJnlFIcatmcg06IG4qrZQ3HgkwLz4N6m6TZvVgetTpKFumy?=
 =?us-ascii?Q?RTN6gxLBWgHlwAUbPW1wwt5Hb95Fj4FSuL2GDcw95IUspjirI1HxOMNUKGU/?=
 =?us-ascii?Q?rkGanxOW4OE4vJ0/XLtDTdjTVw98bv9bIjIKwE17z69/2yhRXHIlfRroi0Uv?=
 =?us-ascii?Q?GGGMaMI9ZzBCrqdrjc95WpnMtmLifloQP+InR2aEaFKfwTcCoYmxbbHEXyFp?=
 =?us-ascii?Q?AbE+uKrdLfoLXLqhBZ4yatznMhlP/WQPqZGuLFJ46vt8ri95bebS4ZmZUmcM?=
 =?us-ascii?Q?y453HevI97i+fEliNfyV7RXf7FgKi82pOyWMfRlWvSZtT4jXoE9fvw4SMvCG?=
 =?us-ascii?Q?imVZrUEISiWBBp5AMCuFXdvC0dKKdagTE2jKShAPjlN9ZiKkbobv/M2MVgL3?=
 =?us-ascii?Q?sQbDDiTpgltA22sZ8EIsWDV1Apm4jiQNBpi+YcYiGF9g1O8/ed81ZeF1gqeX?=
 =?us-ascii?Q?y/PcqXWPKRKQlk56CtblsptJZODB1npcGE2pv5jrKlb7toR1fXwOkH9Xo3EV?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104a4684-cf43-4a32-358a-08dbc4f27e39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 15:56:38.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H8iCImmR5cRoYRy4/k0IKEZ+Kk3Z35n8OV8oo5WaQFIAC6yJHi8k/4MUIaG6tGF6/71xxg9t6+TmU2/q1ksaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 04, 2023 at 12:13:06PM +0530, Nilawar, Badal wrote:
> Hi Anshutosh,
> 
> On 04-10-2023 06:22, Dixit, Ashutosh wrote:
> > On Fri, 29 Sep 2023 14:41:22 -0700, Dixit, Ashutosh wrote:
> > > 
> > 
> > Hi Badal,
> > 
> > Why did you merge the hwmon patches when there is still open discussion
> > below on the patches? According to upstream rules (I'm not sure if you know
> > about this) you should not merge patches, even if you have R-b's on the
> > patches, till all review comments are resolved.
> > 
> > Generally you are expected to either address the comments or reply to the
> > comments are at least inform that you are merging, disregarding the > comments. IMO you should at least have done one of these before merging.
> 
> I did selective merging. I haven't merged 5th patch yet as locking is still
> in discussion. I am working on addressing locking and thought I will address
> some of your comments with it.

Just to ensure the split is clear to everyone and that we have CI running on
the exact chunk that is getting merged, next time, please split the series,
rebase and resend the ones that are ready. you might even use --subject-prefix=CI

and as always, let's not rush things in and be sure that all questions
and concerns are addressed.

Thanks,
Rodrigo.

> 
> Thanks,
> Badal
> > 
> > Cc: @Vivi, Rodrigo
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > 
> > > On Fri, 29 Sep 2023 09:48:36 -0700, Dixit, Ashutosh wrote:
> > > > On Thu, 28 Sep 2023 23:37:35 -0700, Nilawar, Badal wrote:
> > > > > 
> > > > > On 28-09-2023 10:25, Dixit, Ashutosh wrote:
> > > > > > On Wed, 27 Sep 2023 01:39:46 -0700, Nilawar, Badal wrote:
> > > > > > 
> > > > > > > On 27-09-2023 10:23, Dixit, Ashutosh wrote:
> > > > > > > > On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
> > > > > > > > > 
> > > > > > > > > +static umode_t
> > > > > > > > > +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> > > > > > > > > +		    u32 attr, int channel)
> > > > > > > > > +{
> > > > > > > > > +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> > > > > > > > > +	int ret;
> > > > > > > > > +
> > > > > > > > > +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> > > > > > > > 
> > > > > > > > Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
> > > > > > > > is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
> > > > > > > > doesn't read/write registers.
> > > > > > > Agreed, but visible function is called only once while registering hwmon
> > > > > > > interface, which happen during driver probe. During driver probe device
> > > > > > > will be in resumed state. So no harm in keeping
> > > > > > > xe_device_mem_access_get/put in visible function.
> > > > > > 
> > > > > > To me it doesn't make any sense to keep xe_device_mem_access_get/put
> > > > > > anywhere except in xe_hwmon_process_reg where the HW access actually
> > > > > > happens. We can eliminate xe_device_mem_access_get/put's all over the place
> > > > > > if we do it. Isn't it?
> > > > > Agreed, thought process here suggest that take rpm wakeref at lowest
> > > > > possible level. I already tried this in rfc series and in some extent in
> > > > > rev2. There is problem with this approach. See my comments below.
> > > > > > 
> > > > > > The only restriction I have heard of (though not sure why) is that
> > > > > > xe_device_mem_access_get/put should not be called under lock>. Though I am
> > > > > > not sure it is for spinlock or also mutex. So as we were saying the locking
> > > > > > will also need to move to xe_hwmon_process_reg.
> > > > > Yes from rev2 comments its dangerous to take mutex before
> > > > > xe_device_mem_access_get/put. With code for "PL1 disable/restore during
> > > > > resume" I saw deadlock. Scenario was power1_max write -> mutex lock -> rpm
> > > > > resume -> disable pl1 -> mutex lock (dead lock here).
> > > > 
> > > > But this is already the wrong order as mentioned below. If we follow the
> > > > below order do we still see deadlock?
> > > > 
> > > > > > 
> > > > > > So:
> > > > > > 
> > > > > > xe_hwmon_process_reg()
> > > > > > {
> > > > > > 	xe_device_mem_access_get
> > > > > > 	mutex_lock
> > > > > > 	...
> > > > > > 	mutex_unlock
> > > > > > 	xe_device_mem_access_put
> > > > > > }
> > > > > > 
> > > > > > So once again if this is not possible for some reason let's figure out why.
> > > > > There are two problems with this approach.
> > > > > 
> > > > > Problem 1: If you see implementation of xe_hwmon_power_max_write, reg
> > > > > access is happening 3 times, so there will be 3 rpm suspend/resume
> > > > > cycles. I was observing the same with rfc implementation. So in subsequent
> > > > > series xe_device_mem_access_put/get is moved to top level functions
> > > > > i.e. hwmon hooks.
> > > > 
> > > > This is not exactly correct because there is also a 1 second autosuspend
> > > > delay which will prevent such rpm suspend/resume cycles:
> > > > 
> > > > xe_pm_runtime_init:
> > > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > 
> > > > 
> > > > > 
> > > > > Problem 2: If locking moved inside xe_hwmon_process_reg then between two
> > > > > subsequent reg accesses it will open small window during which race can
> > > > > happen.
> > > > > As Anshuman suggested in other thread for read are sequential and protected
> > > > > by sysfs layer. So lets apply locking only for RW attributes.
> > > > 
> > > > But what is the locking trying to protect? As far as I understand it is
> > > > just the registers which have to be atomically modified/read. So it seems
> > > > sufficient to just protect the register accesses with the lock.
> > > > 
> > > > So I am still not convinced.
> > > 
> > > Let's figure out the locking first depending on what needs to be protected
> > > (just registers or other data too). And then we can see where to put the
> > > xe_device_mem_access_get/put's (following the rule that
> > > xe_device_mem_access_get/put's should not be called under lock).
