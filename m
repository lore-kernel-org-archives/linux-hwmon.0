Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940C9E7C4DD
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Oct 2023 16:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjJDQMd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243260AbjJDQMb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Oct 2023 12:12:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F9E1AB
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Oct 2023 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696435934; x=1727971934;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YSY0VrUQF5kkn85eNTpBAlin/Bs3dsiitGkhG7p4/a8=;
  b=e/edJFCnOxPhyfvUPMhE58tkBMjOewzJOiQdZGHMYmCl95MUEgFZzvZs
   VqoP/Bs2VWHlXTKbW3UbI+XsTb2RtgJIiWKdTH0N6CHwLp3S4Qoq0q4ce
   VtdxqNDAeMwMI8yOZsJ7bCDEgQ5EQA6TuhAcAOwl9S5SrtT3dorrTAUW4
   7JGFZJk0jAqUtFU7QHt4cU1SRbWznU7+L6ktwqBtoqFkPEPcORLCojUUC
   ruTQ8LgsAN86QMfuvzPfpHnqrfVWw3nsZpKeFBr/lmIreCje5d42kLnWV
   CdeVf5Q0MN+kYNja1cVYl8wasZR75kafJjVjgOFDfBVSfEDLlT48l0ki4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363490254"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="363490254"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 09:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701169335"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="701169335"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2023 09:11:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:11:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:11:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:11:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:11:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbHhnXlAq505lqKdSxagukJy8qOCNe0NHvn9OMPMXNrOPgUOtCIzf0FIdCNPTmQrlVaTt6b2KZ1RMYTikkuo+TLvXqwGn/awszl5J+rfpF/Z23Q2BP1X/6enbZELl1lkGn6sfEl0caU9yj959BP5YGkvUOfGUubE0UR15TR2be04s7YSpIZhaTJXJoWOm7/QgQAt4UNjr+IUmJ9Nxa6e9KvhL05v/i+bWaXuBrtQ6oxFvnSY/TS3uU9riWNjXdRFisYzOBxOiwCHAekCOR6/ggl750GR/4E0VpUJPVdKN/G5edvDI7zaT/qpXW3S5jkgAMYCjLUkJsif5j81uiNLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP4P1WBwXCpboYYGc9Sghixn7jHc2KxVUvE2J0dcsa4=;
 b=VV0Le3XFSELu8tJvZSYxHppdw9QZ3lnBR2Pi15YRHSLyoPGKd1BRdeZDhKTujjeGiLP+PK+X9ekTV9YQvjBNw0zJCT7lU5Vpqt6IxqT0hob6qwKRCGEPcaM4JOybnKWc+v34XbWJoL8n9s9miMkavy1h96gpVWyuhFC6GPVuT2DV2QRSW66hyYMJDt1/KmklfHqxQde8FiOtl9ku6b4VLg2/kzzl4s2Dw95Tf35XjInghOI9Sofn+nMEVc6vSiqsaXDuBy+bTpCcrslX7PdFovBhF5XCbsrQ6+P9kV9bDDrrni/lvNBcuNw5BUC/wfeTSzQJdKKXllhnL3H6bdMoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7248.namprd11.prod.outlook.com (2603:10b6:208:42c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 16:11:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:11:30 +0000
Date:   Wed, 4 Oct 2023 12:11:25 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>
CC:     <linux-hwmon@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
        <linux@roeck-us.net>
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
Message-ID: <ZR2OrT8uLFT1ZPpW@intel.com>
References: <20230925081842.3566834-2-badal.nilawar@intel.com>
 <874jjg1ak6.wl-ashutosh.dixit@intel.com>
 <84b5dc30-6b27-caf0-6535-c08f6b7e8cd0@intel.com>
 <87ttreucb0.wl-ashutosh.dixit@intel.com>
 <c366920b-ec67-f5be-4b17-ae1be82bdae9@intel.com>
 <87r0mhncwr.wl-ashutosh.dixit@intel.com>
 <87pm20odx9.wl-ashutosh.dixit@intel.com>
 <87jzs3ryxh.wl-ashutosh.dixit@intel.com>
 <fa566c3c-ea7b-967e-b7ee-868317431140@intel.com>
 <ZR2LMTjeZrOzlDiR@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZR2LMTjeZrOzlDiR@intel.com>
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: cfafa83b-516f-4d23-05fc-08dbc4f491c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gvGpTnCZb8zKDG74D0DiabkZipdhzM0cWXpiSS73Q6/Cz/NcprcbBfw5jmOLlU2jPyYoMz4eraam6PuDF5yzAOMVIziXcSbazREHKjsorf989uMNgPJRdufDqVkbDoKvJZN8+s0xNj8XdxqqL4IC3Mhl4UDl5LG7Z/IqDNUw+vUyQ1gA7b5OrcK5wr1pM6Nyg5owYfOhcxvserD7abxM6DkGvEWcgb3rjlOKO8RszzZaThA6ZTMlGDwesDU4ht8mjbzuazeqjJ7Wnhh93LSbX9BkunkzkFUckTxUfvSGC2tT9rPPz49KjE3Z/9wKfOzWFUVQpayDPE7QnP0PWBDebmuqI0K4D1WVTqHY71n2xl/ZhHF4r0GSziJRg/QMExm4k6Jk4+OyyeCC8QTJu4rQgtS49S/2XdAhu9ajAj0S6+N6O6p6d5jBPCaPuR51ITvqJidQsWXwBkma2uSChJIQSWIY032Tp2gJ791dLFzSZ3DXa3nrmGIrTTyCmZCPRU7C133wSZV7ICsuuIpvnMRlT9L9q43nJDHkBzLkkmjpVK66kvm2Woxb8prX1O4nmNGc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(2906002)(6636002)(37006003)(4326008)(44832011)(5660300002)(66946007)(8676002)(6862004)(41300700001)(66476007)(66556008)(8936002)(6486002)(478600001)(6666004)(6506007)(6512007)(53546011)(316002)(66899024)(2616005)(83380400001)(82960400001)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epwM2nSFeFXnE2ekwrY/B0ue3LXPbFJFvsGTybqloS4yCOd8w4xnskW6h9/Y?=
 =?us-ascii?Q?N9J6+8LV7KsnF5IfyV4t9ot7t38hXKZGaei+C2iV/XkxY9u7k3t/Bsrx034O?=
 =?us-ascii?Q?MhxwaSMhqIlIDJb8zmp0iVoA3DRfQZypYIYiK+97la+HvttMc3j4FBK9wdoG?=
 =?us-ascii?Q?aafYgHnTbBb7QKw+f8CLRzC2614YW8LjudVqa/1o9VGMGJwOWryCi4hFA6y5?=
 =?us-ascii?Q?rr9O5ZAFEL6h2hsB6ca981h3KFksu7rEwnWKDjV89J6E0VSIxmLE/z4QHXw7?=
 =?us-ascii?Q?O1DAcTuFKwIaCvyVNhpgsCfc05ZxTjJjP9l1z9pAU566uVvXdlj+zF9w23Yx?=
 =?us-ascii?Q?KB65s5JSS5uq4DCQgS0Tl2Bjfx3FcUJPn8mtnCfAP2FeLFmTdJVMujbSqZ32?=
 =?us-ascii?Q?FDu/GL86f+Q94VcmdNLt29h/Vyq8gzazW2HmUgBOHVp+J1Sug660zQg/Ha2P?=
 =?us-ascii?Q?LoA6y8SeeJe4HEwMESedZT/HT5Ki8SZdLvF0I68J0kzdRXkte22L7iF04nK+?=
 =?us-ascii?Q?44zTf6ScjgYYRhSqKTzBwl38riSKcL8W7BCYHKl8IVgzkEXIURXjeL/pKo7f?=
 =?us-ascii?Q?yS0TdMAq/15RGVhXa1HVAkZ5o7Nx1w+Eb2Yj4TAgxCCcd+jyE2hASSvNnD+o?=
 =?us-ascii?Q?DF2Q6OtrIRU7yCRLLlQKn2CEAeKYla41pGkirqaAZOb71OkVnawZuZ/UKfcO?=
 =?us-ascii?Q?kaCi3qSoWWzSrbPHerhKTApO8arpAdZ77xKXtAA90LC2ZTk7VZDTvzNUF5cc?=
 =?us-ascii?Q?ZGI+8ZxCFl4NsWFJ5tHvUq6vQEGsEe0CTMRCFY7Y3CICZmGz5WIpT3zIy4JI?=
 =?us-ascii?Q?kXmkOOIVsBs+F8LY8IucYO2JwB3YP4E/J20dOYXkE02pZYIQLfiHbhsAk3nx?=
 =?us-ascii?Q?XWMVj5oa+StWv8aMruDYPhu4qj/Ly6ePc1Ec67MWuRGl7bnhzLvZJgs/QTd+?=
 =?us-ascii?Q?eEKZaoNpSMcwLsnZsiQG2PtX+k+kq64/oVYrRxCMip5vvm7SKdocr8vJD1SY?=
 =?us-ascii?Q?HRv4/H/ju2VN5h5kQinFvFNb31sLIwbR8cz8IiToBA2tXQ9wMl+5TU+eUFUs?=
 =?us-ascii?Q?hZgfYdB9rC5aHfYIJl+EM3ZHlVowbe/rmzR56cA5aEweB5IXMzBpbrCJFBe6?=
 =?us-ascii?Q?DHA+2UiT117/3dV1gxggfipF7wVzelYvlRpdBMniRfXL+t5EqZMrh1urtJQJ?=
 =?us-ascii?Q?hMhgEdw9hf9Sl1RaxU9E1CMXKLwfIOze19jHV15fR20CFbqNqYsbn8jrbjxN?=
 =?us-ascii?Q?WdG5Ai093hqjZJw35c0H8CYyfR6aYMso6dUJbLDjvTyhUNg7RTEF0jrqmoBm?=
 =?us-ascii?Q?Q5iuwCQngcP74BbH8l22yhQPhrUijWcDzVz9/UBGcbGjxa+irGJro2lLxiUE?=
 =?us-ascii?Q?3KsiryRQxgjaLhNai00vzgxJo7SZSFqe2Z7Hzabp9s5UdKmrJ16DUCt3N8BN?=
 =?us-ascii?Q?qkghWDn5vYfESfpUnbeONnfTIe7qVD/zhk2g6gCJFloCW4PdUOBtSE8tleFw?=
 =?us-ascii?Q?eKIFDQiQ0h71aB+zk5KFy4UzDd2gR1lU+2K9gc9JCZMN2PPUGkITpF5II336?=
 =?us-ascii?Q?pH3ZbyVbRuPmBZVVs25vdh5vIjEPqSZRamhEf9NHnYrxDfqrYtV/3GaJtctO?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfafa83b-516f-4d23-05fc-08dbc4f491c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:11:30.2832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zAdsB8Dn34xX9Q7P3fjnmF5PFhcX3rX5VIIZZFdQwx3l/amdfVaLSIgJvEElQ+6agv9aFqXcryDfFJbtSqS0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7248
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 04, 2023 at 11:56:33AM -0400, Rodrigo Vivi wrote:
> On Wed, Oct 04, 2023 at 12:13:06PM +0530, Nilawar, Badal wrote:
> > Hi Anshutosh,
> > 
> > On 04-10-2023 06:22, Dixit, Ashutosh wrote:
> > > On Fri, 29 Sep 2023 14:41:22 -0700, Dixit, Ashutosh wrote:
> > > > 
> > > 
> > > Hi Badal,
> > > 
> > > Why did you merge the hwmon patches when there is still open discussion
> > > below on the patches? According to upstream rules (I'm not sure if you know
> > > about this) you should not merge patches, even if you have R-b's on the
> > > patches, till all review comments are resolved.
> > > 
> > > Generally you are expected to either address the comments or reply to the
> > > comments are at least inform that you are merging, disregarding the > comments. IMO you should at least have done one of these before merging.
> > 
> > I did selective merging. I haven't merged 5th patch yet as locking is still
> > in discussion. I am working on addressing locking and thought I will address
> > some of your comments with it.

There was still an open discussion going around the (merged) patch 1, regarding
the positioning of the the mem_access get/put. So, next time hold a bit before
pushing. But the positioning of those mem_access get/put are safe although maybe
not ideal... (needed?!). Anyway that can be a follow up fix or improvement and
I'm okay with the way it currently is in the code.

> 
> Just to ensure the split is clear to everyone and that we have CI running on
> the exact chunk that is getting merged, next time, please split the series,
> rebase and resend the ones that are ready. you might even use --subject-prefix=CI
> 
> and as always, let's not rush things in and be sure that all questions
> and concerns are addressed.
> 
> Thanks,
> Rodrigo.
> 
> > 
> > Thanks,
> > Badal
> > > 
> > > Cc: @Vivi, Rodrigo
> > > 
> > > Thanks.
> > > --
> > > Ashutosh
> > > 
> > > 
> > > > On Fri, 29 Sep 2023 09:48:36 -0700, Dixit, Ashutosh wrote:
> > > > > On Thu, 28 Sep 2023 23:37:35 -0700, Nilawar, Badal wrote:
> > > > > > 
> > > > > > On 28-09-2023 10:25, Dixit, Ashutosh wrote:
> > > > > > > On Wed, 27 Sep 2023 01:39:46 -0700, Nilawar, Badal wrote:
> > > > > > > 
> > > > > > > > On 27-09-2023 10:23, Dixit, Ashutosh wrote:
> > > > > > > > > On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
> > > > > > > > > > 
> > > > > > > > > > +static umode_t
> > > > > > > > > > +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> > > > > > > > > > +		    u32 attr, int channel)
> > > > > > > > > > +{
> > > > > > > > > > +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> > > > > > > > > > +	int ret;
> > > > > > > > > > +
> > > > > > > > > > +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> > > > > > > > > 
> > > > > > > > > Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
> > > > > > > > > is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
> > > > > > > > > doesn't read/write registers.
> > > > > > > > Agreed, but visible function is called only once while registering hwmon
> > > > > > > > interface, which happen during driver probe. During driver probe device
> > > > > > > > will be in resumed state. So no harm in keeping
> > > > > > > > xe_device_mem_access_get/put in visible function.
> > > > > > > 
> > > > > > > To me it doesn't make any sense to keep xe_device_mem_access_get/put
> > > > > > > anywhere except in xe_hwmon_process_reg where the HW access actually
> > > > > > > happens. We can eliminate xe_device_mem_access_get/put's all over the place
> > > > > > > if we do it. Isn't it?
> > > > > > Agreed, thought process here suggest that take rpm wakeref at lowest
> > > > > > possible level. I already tried this in rfc series and in some extent in
> > > > > > rev2. There is problem with this approach. See my comments below.
> > > > > > > 
> > > > > > > The only restriction I have heard of (though not sure why) is that
> > > > > > > xe_device_mem_access_get/put should not be called under lock>. Though I am
> > > > > > > not sure it is for spinlock or also mutex. So as we were saying the locking
> > > > > > > will also need to move to xe_hwmon_process_reg.
> > > > > > Yes from rev2 comments its dangerous to take mutex before
> > > > > > xe_device_mem_access_get/put. With code for "PL1 disable/restore during
> > > > > > resume" I saw deadlock. Scenario was power1_max write -> mutex lock -> rpm
> > > > > > resume -> disable pl1 -> mutex lock (dead lock here).
> > > > > 
> > > > > But this is already the wrong order as mentioned below. If we follow the
> > > > > below order do we still see deadlock?
> > > > > 
> > > > > > > 
> > > > > > > So:
> > > > > > > 
> > > > > > > xe_hwmon_process_reg()
> > > > > > > {
> > > > > > > 	xe_device_mem_access_get
> > > > > > > 	mutex_lock
> > > > > > > 	...
> > > > > > > 	mutex_unlock
> > > > > > > 	xe_device_mem_access_put
> > > > > > > }
> > > > > > > 
> > > > > > > So once again if this is not possible for some reason let's figure out why.
> > > > > > There are two problems with this approach.
> > > > > > 
> > > > > > Problem 1: If you see implementation of xe_hwmon_power_max_write, reg
> > > > > > access is happening 3 times, so there will be 3 rpm suspend/resume
> > > > > > cycles. I was observing the same with rfc implementation. So in subsequent
> > > > > > series xe_device_mem_access_put/get is moved to top level functions
> > > > > > i.e. hwmon hooks.
> > > > > 
> > > > > This is not exactly correct because there is also a 1 second autosuspend
> > > > > delay which will prevent such rpm suspend/resume cycles:
> > > > > 
> > > > > xe_pm_runtime_init:
> > > > > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > 
> > > > > 
> > > > > > 
> > > > > > Problem 2: If locking moved inside xe_hwmon_process_reg then between two
> > > > > > subsequent reg accesses it will open small window during which race can
> > > > > > happen.
> > > > > > As Anshuman suggested in other thread for read are sequential and protected
> > > > > > by sysfs layer. So lets apply locking only for RW attributes.
> > > > > 
> > > > > But what is the locking trying to protect? As far as I understand it is
> > > > > just the registers which have to be atomically modified/read. So it seems
> > > > > sufficient to just protect the register accesses with the lock.
> > > > > 
> > > > > So I am still not convinced.
> > > > 
> > > > Let's figure out the locking first depending on what needs to be protected
> > > > (just registers or other data too). And then we can see where to put the
> > > > xe_device_mem_access_get/put's (following the rule that
> > > > xe_device_mem_access_get/put's should not be called under lock).
