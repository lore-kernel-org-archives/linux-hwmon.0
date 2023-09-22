Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1BFE6FE41
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 15:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbjIVPUN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 11:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232817AbjIVPUH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 11:20:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186CBE40
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695395998; x=1726931998;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xYTvTUkfTVEB3s2nVYwjkY0YXSitJYCdyeoSx3UoDyU=;
  b=i5Y24S6DF+19o+5IxRS1RWPbom0DZI0gr+ZFDsKAZrZeoNSdxA3QXRln
   lvrhUfRrusRPK+TAJ51Rm6SYTg8yo7vOdf1+Vn8FlDETUD9zQDXcguaJQ
   M3fqJ6gUb8NTJYHP5RM2fKAvxiB2ibGtjn+C075anDW1LHIZ/WB3SkwIQ
   95EOGF0MHGiHaa9kDzSjzYJDO99Ua/LuTeQvdCmYcbgmW1UEtaiz5+Iz9
   JHSLEnzJl9MwbSYK0VWtDDu7c9ol/d0nYEI5nZvaiMMOO01XqS8K4WD7A
   nDStnmekLL2juZTjSDoMuRHOhakBmmCG2dp8ki2OwGkOJdwp955Zv30Vo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380753556"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="380753556"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 08:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="862978967"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="862978967"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Sep 2023 08:19:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 08:19:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 08:19:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 08:19:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 08:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk+iVl6DibTyXE5xiQIebgl5/9gMTvB5I7kKSC36Z5DZVJG47G0XVjQo2fTBLWxPWxteeKDzs3gvp9aOATMy+Lu1ezB6HRl3P7RYjPbJCDIF67wZxUsWjM43x6G6SG1ULPfYqnrVU2SqPmKUyDSWhpbA9xJfpnTd7jawMw0Wc6gjNg504rGwDV+LqGw+q6Owj+WIbbdObaQWkVjeFiB05x0abJB2U3hfBIrP3LXUZ+h7+0761pGiygj8UdS1t6zLnKQOPb7M9iIIQOWJVfkyvQ+tOZIii1g74erswCDZfZ4Y17E6ABtJabovV8HJH2FZk7zntGTJ4Jctr/+N/qglIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN8e7MOdzh0kSKfdIAz6aFUDfcTDSj8o13oMYvi2Yf4=;
 b=B69cefPoVb/TOGpyQ9l6Mr91EjIeOJZnnlHH9LAFypzg+MacD9nN9wRLibX8cYb2slkQM/KA8fViq7sqX6zNolKVH1fbbrxj5vSOXxB67Tu9pQFhQXqkhKu/VNdGFIjLgVoB8/X/HYjbd/rTUFNhynfhz4tA9t2XRF/yOWOT9jCS1k3RBejktQs/NW/Y5/1RNiMI2RikmFvDrq9Eyu4VqR2HDLlSCkn+3pwnRbjaRN74naum4HANu4k3L56CIgFqCrrTWmw8DM3zr+Npl9oaj19w8LXIlRnf+jSI1Y9733JPRC4IDAheqNumpk9iYDvfO0YDQaM9BbWStfrr2Y5IBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 15:19:49 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 15:19:49 +0000
From:   "Gupta, Anshuman" <anshuman.gupta@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "Tauro, Riana" <riana.tauro@intel.com>,
        "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Thread-Topic: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Thread-Index: AQHZ7HTu4zy7scC2m0i7518EF+8Z6bAlcWUAgAGFL4CAAABc8A==
Date:   Fri, 22 Sep 2023 15:19:49 +0000
Message-ID: <CY5PR11MB6211E9C38F74EBB728448AFD95FFA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com> <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
In-Reply-To: <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA0PR11MB4591:EE_
x-ms-office365-filtering-correlation-id: 425cacaf-57cb-48d1-b90f-08dbbb7f5c93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3zVcFHRPn7wg1k2be2T+Hhkls+hkrhVd7yfcuRfQ8n8UFaUbEvYY1KQMkyfeRJgLkBPN8P7CKV6zTaSJqcA4RB/Ac/WvJHwnG+uDzw4E3zdquYvBIwuaUr+5UT1xhNlchJaJHgZ0GKhmCSMfeV3DCbwRURlLk6wx1voWObz3VEc872Z8xFy8zKOLO7v8BsunUOEGyEA8xd/Z8RoQlzoETFSN4CTeK+vc+Q9EnEIhPWSjdetnNsvB5qQwhxgrZpOOh9FBRn2HqM4Ye9+ZU99nwFFG5tpB+xgOPYYmURJ/yLDjrS4ZooyT4NtEudUxZNYip/WIiue3Ym8dKxMg98JjQN+34qxYJKepP5SanP2MgRH1zAx2/+Zts4NJ+Zvr7oJPhX3qL9Kl/UfWNXUckhl0mwOelhiBwcIQVv/L9T/6zh5d6cItfZVjmm7KcTccFfYx5yyvHwk5LNMVW2+CEi6Rgi7KU43b/251olUjIpslGAYzqSTrSGsVZ0LyUc5z+NFxCi6CMoe7Wi6vyCamy0f25c7h/7CDoEfsf39UvBzEpk19ccedfjn5TTyBJlAZ6bMpG7xMwmY97tJTTokWzXH8yxNK+25pDsgFMC8tb4QbVntqW89TFe4BU1NwrJgmjyOu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6211.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(186009)(1800799009)(451199024)(6506007)(7696005)(9686003)(71200400001)(26005)(82960400001)(53546011)(33656002)(76116006)(66946007)(86362001)(478600001)(122000001)(38100700002)(38070700005)(110136005)(66446008)(55016003)(64756008)(83380400001)(66556008)(66476007)(4326008)(8936002)(8676002)(316002)(52536014)(6636002)(54906003)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7O21NyBxfGCLeP3G4hlafwU5xxrRoZh4HpndwWsiU1Rji/8m8sbsz+3FwuvQ?=
 =?us-ascii?Q?pmLHboBaAPUPVwPQgl99GhuyonFMkhQlcbZoL/mhOsCTMmM6lIcSw1dXQaEt?=
 =?us-ascii?Q?RIL/MfPwO/FhvCT5ua7tZ73vfYHzsk0mtAwgkFvc5UuIP+h6OOVYHsMcWuEA?=
 =?us-ascii?Q?Hk+q82+Im2WYBm88O33b8jVZAbgrbKg5VRWj6f4GveCFAriQT6IGY9T2GBDm?=
 =?us-ascii?Q?xn4baW76gRrnWLUVQS5vDX6p0YgLxpdO0YwRzqCP9DjLOfOhUKt9kQGI7cLS?=
 =?us-ascii?Q?Hnt7HP6H4ZXiS3y4TRVhb1MYGurO6SMNUYFqK+Mj9NUwtRbUBh173OoRNb1u?=
 =?us-ascii?Q?vmIjPcAx1jOjjosAuD6hIKI8b0yAE75V4MVECJyQKBKmd9F1JfTiFRfJLgyX?=
 =?us-ascii?Q?hFHdcniTwNLVd9Wu2DTugxMjNLMk5yXTVvtPICh3RwUyDvdg7z4sVELXAIQ5?=
 =?us-ascii?Q?8ytmOet5yLu66+96iN0qkufDWZ0KXoELfrrqj9woBSfBA2nXKNWD+yFf/sio?=
 =?us-ascii?Q?60TM5en2ac6HEH7vXEMcrWe4L84iDrckdKmK7PQISibqfxN5VSh3W3/SSqYz?=
 =?us-ascii?Q?9tSVZj3eztxF/eqsBmQdWTgurNLM6v1mCtdYvgzM2ofI5n9gTEJr7eccFXZA?=
 =?us-ascii?Q?13n1qCjaVfZ5kQs3iU91nrbCgMxxGXJ+GW0oL2+UWaBOtdOW2BS3V+OMTOzS?=
 =?us-ascii?Q?aGhE93BdG9HtRMnVKRCDViL2dNNiAccxFK049yZ5NVluPG//tUTJUp6/a50D?=
 =?us-ascii?Q?+NUPsYZp0b/BCnku9HDGcgJXfhgkH9PMhC0qvI3aLF14TCl9XUYgxFhbPCF8?=
 =?us-ascii?Q?CA4vuEGvC9SSBSdw89Jtnw1vhuT9g/RmU58SWkwyoqlkDXKy1alItGwLIIeb?=
 =?us-ascii?Q?yP2DxzLvKIQIPOGo9zg36z/HRc1bsj/TPD1v5fmlTnoXPlT9lSJIu3lgaqmn?=
 =?us-ascii?Q?jDi1Q4kd0fqcfFsc7ohU587Yxogi2Fy6XuIqkA+uP4WHAEVLJATmgImmNN9m?=
 =?us-ascii?Q?yunY0QacVAFiRwN7qMKYto+xCBVfr3Ja7HX+6sigmUKWsr5dumDlR+nc2lGd?=
 =?us-ascii?Q?plEHoJAJmqsUOudneDJ0wgg4scF50nDsqyVevnQhpHODLNj0jgO8m3KmmDHK?=
 =?us-ascii?Q?QaTq5nDs+qGQjmNELXsy8Rzc/Jb0tptjP25tWnkcYJYG4mEAimtZXf65kbnP?=
 =?us-ascii?Q?LB0atZoQ3oYudr1Yl3L6ZgvFaXQcq6/dd9xSFJHkq1uPArWU/uEQq1om9jkh?=
 =?us-ascii?Q?xJdRIsQe16cIB5pL7RVHNhd0ItP5fuReyFS0wjwVuhdPWG11mFiN5m0LQ6WG?=
 =?us-ascii?Q?vNiZo8JTSrH4QYZu3RkcO0TcCoIIdJ01jN5PJx3G6+ir3B1xfMjiJDAJ/ZUX?=
 =?us-ascii?Q?Ft0BgXInXWucv5vVANJk5HpVCz1+LOeJDX1QKvcyamg7/t3IXL4E24Eeh+JT?=
 =?us-ascii?Q?2Gf8C9odGb31KeXfwBkm9Kv8Uw9GZXoOniZJQjSvpkqTna4U8Sw7xdUCA6g+?=
 =?us-ascii?Q?k52W2YNe4Hbonrtln7cv+qavtbbheaUvNqYg5WOyhBII3D/sXTzvrJk6Pxn5?=
 =?us-ascii?Q?72JF0aJu60mByYpbuvsqtRFeYe+tGGkKcMHCJoQv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425cacaf-57cb-48d1-b90f-08dbbb7f5c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 15:19:49.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgQfaYDv5zAHRNJgb4HDuDSkmUcPwhBpsluQgdgodr/V6S8HzT5jkuDvbFEE2KeRGiv1O+g1i8hBQELAgk7ObfdXoL1erU5bDNXVrlnYDDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Friday, September 22, 2023 8:46 PM
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-xe@lists.freedesktop.=
org;
> linux-hwmon@vger.kernel.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> linux@roeck-us.net; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
>=20
> Hi Rodrigo,
>=20
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
> > > diff --git a/drivers/gpu/drm/xe/xe_macros.h
> > > b/drivers/gpu/drm/xe/xe_macros.h index daf56c846d03..6c74c69920ed
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_macros.h
> > > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > > @@ -15,4 +15,8 @@
> > >  			    "Ioctl argument check failed at %s:%d: %s", \
> > >  			    __FILE__, __LINE__, #cond), 1))
> > >
> > > +/* Parameter to macro should be a variable name */ #define
> > > +XE_MISSING_CASE(x) WARN(1, "Missing case (%s =3D=3D %ld)\n", \
> > > +				__stringify(x), (long)(x))
> > > +
> >
> > No, please! Let's not add unnecessary macros.
>=20
> it's not a bad idea, actually... in i915 we have the MISSING_CASE for swi=
tch
> cases with a defined number of cases and print warnings in case none if t=
hem
> is the one inside the switch.
IMHO Our CI aborts the on MISSING_CASE, which is not recoverable, drm_warn =
would
Be better alternative here.
Thanks,
Anshuman Gupta.
>=20
> It's so widely used and actually nice to have that I thought many times t=
o
> move it to some core kernel libraries.
>=20
> Andi
