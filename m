Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5741C0015E
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 17:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjGSRB7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 13:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjGSRB6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 13:01:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5873AB6
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689786117; x=1721322117;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YvYe+3LOz0u4BFNX7F55wamirxkIe0iT9AeF5VZawok=;
  b=e4G58WFshXGmx1bOjGfBJujf84OkNaX+tPQYPj5tB+aj/YBFgG2vnhvN
   vtT4jwW3KFAw79TH+FG1FtJoZ9fma+gX8hB/XePpC8tn4knETerBRSUW8
   GuaC2kd2YbDAMI9xfqQpS9WEdBXZ4vONPgtAejBqPAfezB3q6HPSNTvyO
   UiNZXrVO3dCKDOUK5Rw9qzuPEm9O9pBoXE2fIoywwr8fu4mmXr/rgXNrd
   samMIvGjyZiukMzdW26xHoZUVaF8JcNXqV44/Kis5guiNqESOm1zO+BTk
   HDH+zesIGPlI1q3fTQnW/yvJ4v71ggFQwmCeoIt9rX9oIkqRqaIscGUjL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="452898104"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="452898104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727377686"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727377686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 10:01:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 10:01:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 10:01:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 10:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdQNRwHrkRs2YIxDVbzCUeZcMW0jRdbroHigjvkkysRHHZAFpbxOXesjKq+GFAJEP+jeSmIRM8E7JxbGlKj3k/yKN0zl/JvspkfRqhttc338bGD/NpXbzo1FpKMYRu8nkNLyDfavgq++qUBIw9nD6sYL26+CigKlwMnmZCWyHDUM4/BMghhcwpeYB3DMugQ+5dUsgDBqn+yZh/3lRgZL0r6PK9/oFIDuhve+7cuSE1+xru4K+GwBrVA3r4Jirxy/HRuC4yv5W4dUIYDraW494+1N3UgMdvnmv2dghNRJHNFaxSMXCAsOgfR2y1p1jeGadsRHi857eUlhV7zb7LBs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS6egv2M9PkECOvxnerR1Hryva+oCC9Domn4/kwXv6M=;
 b=Y2ODpSi36da5Vcfo/dh5b0FGX3rmvug9Czna9oVb1ztxhmTxoeZ6eOaXhKJjPqx0JAcXsc2nw/dE7krw6iHLvojr8EmvoaLaaqoXS1KyM90uYsBL2M3UZlVKShsJwLTGvNvGsHr9JaRjFFEk8zDiVB9d1/Wyn7QHMxKhNK2aqEms/LfU2UHWXzGeLQUL30eJ1qhOQ0KOxPlyUO1vYeS0FGaYRgtGkrr5js7PkQ8hVsigp7YPbrABPwvDTmwhv/D29zayQVXfqcExtjolJIfG3Yt1d7jEFbg/0lr16sVY3n4gbpXNuhE3J8CnTS5A9/KmNVURqPWMMCguDFKkPif5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Wed, 19 Jul 2023 17:01:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 17:01:46 +0000
Date:   Wed, 19 Jul 2023 13:01:42 -0400
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Rodrigo Vivi <rodrigo.vivi@kernel.org>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        <linux-hwmon@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
Message-ID: <ZLgW9n4b0DAOC+Wb@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
 <168c418f-4805-4e89-c88c-f08d4157172b@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168c418f-4805-4e89-c88c-f08d4157172b@roeck-us.net>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f1d841-5e28-4f03-b270-08db8879d5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpmjtPVgXkQI1z1VOesptdplURZ7dnmUAiE4IRHDXsQQlxIB2nO1KqramgEK+KrRuIvBkalplIEBo1G1I6VTsXnVOiejpLDjeFffJ2DWsUsb5Hl88hl6DB4klK7x2tSXBELrgZnkmBTi7HU9tVcz4v8EHJTeRd+gUf7Vr7hCgDF4b9/qSZVqzRIpbjvUyAs96J2IMk5MTwh4+2clH+MW1ATexXgeny+OfLhWy6TgnK/RucBwbA2G9gLwdJGVxbpVTq5k0hOKF/7DLoKiVOMEa4SR7psYcdJoTZF6xfEZYhT6DbYnI3GYkRby5i+G2oyxBnEir8zFR529bRYitB1NObCuEShSOl2B6YGHjDcGPsBwccPIVJtyz4rWa61c2xhJigmTR40SPI2nsfb6UgP+8wW/NDPBpoJj61mDBhumjOW4BPhI3+XFBsml3ZEWzsl6+eOu6uz3INMTSoX3Rl9RDRvk5/RCVPOJts22R3mwVx4NE2gpMDrn0GyGmw9nq9BS0rxops6H+iV/E8lG0PZYNk1/Dq/ag3/qnvXkgONYyWi5EhlMhsMGQHFFz0nJFB8ZCRg1CNynPpjdb19GzwCir9piCn+cLgFBI3AEXDmFZ8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6053.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(66946007)(44832011)(6512007)(66556008)(6666004)(6486002)(66476007)(2906002)(316002)(53546011)(6916009)(8676002)(8936002)(4326008)(36756003)(5660300002)(82960400001)(6506007)(2616005)(38100700002)(186003)(26005)(41300700001)(86362001)(478600001)(83380400001)(54906003)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNXkfI0Q4aXSJ6SKxbSJglI5JGLs0WlRHveX/FXLGeXQOnzz5trW9NtN8s6D?=
 =?us-ascii?Q?D8UTp92IkHNknHwEtFNIJ+b8e7e9IQGp/jDbW9V8YbTDxV3JCpjHdBQku68K?=
 =?us-ascii?Q?67Drlm7q3AMy87seeKVPSOSysRjhw5f5VcQJEG6y7J3y8qXuWzYL98GHINTS?=
 =?us-ascii?Q?pbOuhCY1UTBJhCj48nvlH7b1CeU3qHMTxnx1iQl9O8vHpQJGRcLpmHNH/HrZ?=
 =?us-ascii?Q?Ev+buoIU2DmGloZXCoXsmRXpeZvHdoVPTi0P2cE8wKolaxzZSKKs9TKA30v8?=
 =?us-ascii?Q?jObfaofbW6l3uEIyI8JoV2MmRQbQt+nEOry1HbwhsldSfPFYOAiDBpouKR4q?=
 =?us-ascii?Q?7SUehHA3uWdqW39k+Z60lT75HHiLgI2BySb9NQEDrMZHAddk7XAlAm0XYhHI?=
 =?us-ascii?Q?Cp9w1VGG5cAynWbtaJ0zySW6sSH/MKY0VcWlV/rnkV9ZBtssqtXYEBM6Yi4T?=
 =?us-ascii?Q?Knb1M3jSJ1X1xp9aZPwIQMLw6sefp0Z8pNXUPIpkMWzLf99E+Q/2Zr9ZL6Jz?=
 =?us-ascii?Q?YzP3u2PsRj6M+YLp+W0njWm/LRL+c2l1jWny3hcK8VdSaQTUldWIMlaQnPOx?=
 =?us-ascii?Q?s8dr9boANxX8sOZb9BeHNUAl6fFqILTEmTMVwAapFcTjHirKyig8/QVs71DN?=
 =?us-ascii?Q?L9ZWr8b7KrVmvN6lErKqzJ/vR8OZh3LR8KZ4rYCovyxgENRbkcVeqe1P5rjH?=
 =?us-ascii?Q?RHf1E4TMn6Oj+peWELwT9nLMvO4qvI2SJzT54t5iqOTxvHX46Kufr4hBxXEs?=
 =?us-ascii?Q?WaVILdgUybetbBx1ecS58NgQTGckn2M092OHfilwh+0SQA5yHLrdT6KP52Es?=
 =?us-ascii?Q?UsqDO6Ivl99VugrtaTWVIkTshI1ARZKuvrlv5+i4QyNmvxftoOtYXvfwAHdS?=
 =?us-ascii?Q?QoeQtk0OsVEMtoSeQuOoxW5CM/6G+Zm9zwEBy71xqZVF9RNII+kve+IPrDog?=
 =?us-ascii?Q?q7u8X8u70CmEnrfqGxsJqfjtEDyvduGQnERMxC071HlEB9nBPwOVdz4NrP98?=
 =?us-ascii?Q?n1GRXtbAJVYhpbLlxFqUEddrh8HCU6VthAXtgDu4thUH+jUu9wxIgkMygMKt?=
 =?us-ascii?Q?QB40l+Rk2MI6hnreI6QZUkm/0XLrImIvQBto17Aq5AVuxrZVQt2+rZnSdFFt?=
 =?us-ascii?Q?8XPpixQ7rzNL7FuvKXscQbNj+9JsuZNCQ1ooTmxHRTIjBT/BA/z8E5y/hLe2?=
 =?us-ascii?Q?vmJNVfBYWvJLcJ2yRmKtckir877UXp1RnwS7RXWVL8GzO/pyUSCFKCdBuh2I?=
 =?us-ascii?Q?M30cucogfHuRt67rIV+jSHiFYd/Ld/yDRQ+hEGr0Lulx8bEWfV1AHtbBQHZT?=
 =?us-ascii?Q?2VdyDiygGMj0l8Hy/Tyh7L5mRjGjfIjID2ES9+F6raEN0dvBOdkM8TCxGTOb?=
 =?us-ascii?Q?OZKQMJXjgUNNgkypH/EMQhKFTA8IIPRaGoxDSOS4cGeVdQvROjQkfJEmr1kh?=
 =?us-ascii?Q?mHmZUqkKKXfxukHxY8eDHzAfklQKWaAWKr/wZDEztm+1m9MKjgu1cdiohnbl?=
 =?us-ascii?Q?hq25Iq5P4czZ6CHFrCxhlzIJ1e4ewEBwJzto46gEDlzJ68o9DA1WG9boDNmR?=
 =?us-ascii?Q?tY9jElbGRAx+Yc5Piu59wx1Jsjysj0ZYEl1LJQt2paK/5qmnT8RDv8kSAEKC?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f1d841-5e28-4f03-b270-08db8879d5f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 17:01:46.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZX5VSbUI6MnuIPHFcMsPmNItVx3kY24sbphT5MzWYJwunB2xFGdQ378JlBwcN96h+nDzCKy5bI6ji3PfhqI1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 14, 2023 at 03:26:49PM -0700, Guenter Roeck wrote:
> On 7/14/23 13:21, Rodrigo Vivi wrote:
> [ ... ]
> 
> > Hi Guenter,
> > 
> > First of all sorry for jumping late here. I'm totally with you here and we should
> > definitely only use the new API. For standard entries that will definitely
> > reduce the code size.
> > 
> > So, since we are talking about reducing code here, and looking to other DRM
> > drivers, and thinking about the needs on this new Xe driver, I'm wondering
> > if you would consider accepting 'frequency' as a standard hwmon attribute.
> > 
> > We would need it to be RW so we could use to put freq requests as well,
> > and possibly different types/domains and even throttle reasons on top.
> > 
> > So we could then try to unify all the drm drivers in a common drm-hwmon
> > layer putting an end in all abuses and deprecated users.
> > 
> > But before moving fwd with any proposal I'd like to hear your thoughts on
> > this 'frequency' block as standard attribute.
> > 
> 
> I really don't see how this would fit under "hardware monitoring".
> Making it writable would be even worse - this is most definitely not a limit but
> an actual value. The notion of limit actually shows that it is not a good fit as
> a monitoring attribute: I can not conceive the notion of a "maximum" or "minimum"
> frequency limit, or an "under" or "over" frequency.

how's that different from the voltage/pwm/current/etc min, max, critical RW limits
already existent?

> 
> If this is about thermal control/management, you might want to consider registering
> with devfreq and the thermal subsystem (see devfreq_cooling_register() and
> friends for reference).

yeap, it looks like devfreq is a good candidate for the unification. It is just
sad that it is not as robust and flexible as hwmon infrastructure.

> 
> Thanks,
> Guenter
> 
