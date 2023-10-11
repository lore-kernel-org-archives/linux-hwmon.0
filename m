Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E856CD98F3
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Oct 2023 06:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343606AbjJKGAH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Oct 2023 02:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344305AbjJKGAG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2023 02:00:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D4A8E
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Oct 2023 23:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697004003; x=1728540003;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SehtDGSE/lX1/In++Nb9QwwrZrBpevfBj6b1vJAARtA=;
  b=Nu2TLjjJw32ejmLwoa/YG/ueAaSwqXWarTgb1wMzLn5WKUNJhg2bLw9i
   Php1N5wekR6K4ndqYEyTjOzO9dLUhCMPh27FY0zadNx4RpGbFsV7PnzRs
   /99WIc1la0ON9m9I4Ld9LFY1j1oGZEgna0AvT58AnSi4OLFqrcbAcU3Zi
   yRQAZrgt+aaEwkDsOr+BIBWFseAHgFIkA2+4h2iRAZYF2rMfAgDto5UFp
   xkxrTVzuYdgyduAiVOCQe1+7oEzpFUq9ME3aVDBmYutYACvEzhQ5fbQEI
   fze9NBCh4EQDnaKZqf/1AwznqNSgX9AX3fdXXEUwY66psRg0CnhCK5Dil
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6146986"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6146986"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 23:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877543752"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="877543752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2023 23:00:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 23:00:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 23:00:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 23:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ook2xA97ssK+GtCZXryOG+Z8V1NdHfTNOFt9IdV/bZ7Cz+7XCXt33+3LuPyAlgG+Iro2uZSUd3wpq92AH9SOvPW3nytTa0TUciAyyK6iyEhcD/irFh9qHFAj5/+Xpm3AIou7k1Lq/zGN7egS/35H0Yubfk1mBO3/EPo1dOQAW5SpbibP1tWUcaid040mSb/zsnOU3XN3Me4gZDvwl5FAcSADEnwle/2WovojdIEm1FrYfYpHEROsSgnecSJjXr0FOnKRQOssgbvFQ0ejhhAeCtqFC6AlwAl+rNIQaWtRcCVVwCBi+FPrgVr5cGcuLcjAn3X6uXJJw2pprr+s4+niIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cPndw+0ESNrJx9tItABA+n/o/HbS2oQEJKBWYzfciA=;
 b=SSKzcgcvxjWIMkqh1ZMq39n81pbPYuFOFJmPPjN+xWNRSTsS3isTsXskrZxSABiQ6PLrZaQfMOFQsTESDlvXf3TNoG4fmMP1wCCC1UUKiG3pmFXqGYgzqf1i/wC1LTfZUJi9Azi6kZ4cfbIB5mAfPYRtr/leTLhXSrjaaF4/7m6p2jnBYHH1EG3l6FY0doKOV0v1TZHpylAtBQz7pfF9EKUIAx90mt1CFHwg0IyWHwqfJHmrECpzDEshNE/LVeATfjHcAlF3g8Vh2zW8KBfDhhjWGAfezs6lFUJysgsI8pV54vpztrsGtgLHPKVDm3iP5VO9qqrNZrHYFdET+5Mv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 05:59:58 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 05:59:58 +0000
From:   "Gupta, Anshuman" <anshuman.gupta@intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "Tauro, Riana" <riana.tauro@intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
Thread-Topic: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
Thread-Index: AQHZ+HXVjQVzGg/GVEerRoeKqTnxarBEHGuw
Date:   Wed, 11 Oct 2023 05:59:58 +0000
Message-ID: <CY5PR11MB6211773BF673F311E373FEF695CCA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
 <20231006170205.4136927-3-badal.nilawar@intel.com>
In-Reply-To: <20231006170205.4136927-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH8PR11MB8063:EE_
x-ms-office365-filtering-correlation-id: bc4d2811-5df3-4143-89d2-08dbca1f4cf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zXcaa0CYh8QK6agpYb3N0me9+7MVm0jBdvAn5vyiijkhtsT7HecF12wCAvotjf5NrZnt2HtZpCODFmpJemhgUqtD9CPUCYez0pAALSobZsDSla/IAtp6wsIYgtw0UjzXXLflsk8+W7TAsHt5F8FbUgSdMauLlyxaCTPviWTL62lfKG1unzBtsnfYF9JDz3Bh3d4POWGj3MslnE9X5bl2tb3m7NLP+4DYl8ulN0f84oKiQ0AVzrhSlnME1fX3y+z9qf09oeHUufjGI5AAYdCw73EGbQ9R3vhmw0cKkuezY8Dp77VNVaNKATy8lLjFsrBMeIQsqBvu9pg+zR0gwxhM6RGYhcP8CXjdcijXyZOBXZYIIAMeS2/15v1i8FZ5c/FYmBACUIpf9JvIn+Cxd9mN5DS4++CnQfxUuLxKmj83k1PkrMFiJHyOIZAVeMRZdsiZnG6Hpue1auzIH8o8edbet+fSxRmsTIhPDjD0L5rjMAL1sdoTI4Xiab8ZbDUVwJTSo/QaWDSbsMBADiQphSejnhrCjVJZkbB/mXlA7Div6EV0TMfYsjFgXZtmrLrJv1cA+gDyhP8bCx7t84xJHhwUIwYH96pE7qmgyHj3pyeNKk3GM7+3oMuO7THveetrAHLC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6211.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(9686003)(53546011)(82960400001)(33656002)(38070700005)(38100700002)(86362001)(122000001)(55016003)(83380400001)(2906002)(6506007)(71200400001)(26005)(478600001)(7696005)(52536014)(4326008)(8676002)(8936002)(316002)(41300700001)(66446008)(66946007)(5660300002)(76116006)(110136005)(66476007)(64756008)(66556008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KPuLyKxov4WWbp6yq3KIH3jBMJzDE6XwF/DGuaWLTVT4j0e7tswLXgal+M8u?=
 =?us-ascii?Q?EvdNqcIZgZQqulNJoTeiKYiYp1qEJLhTnU2s3M9vsXi2OMveuevxmyDxYEcU?=
 =?us-ascii?Q?1YJEwCuzodSLljQKhEa8X5a86nFwg+vUdHJCdRuqgsTIuyBjQQ4IX1p9kjTF?=
 =?us-ascii?Q?S297q0mLbCd/2wZ/muSvfgy8wplVBAyDUR5r/DnsHLu6V4zVTtcbd/hVhU3a?=
 =?us-ascii?Q?HjykDmHKLlb6OWCtUGpQuOtXXWdPw6c6ShF76oFzcixv96BtBFuYYSvSkBqz?=
 =?us-ascii?Q?dwnxomoyIQNEMOs/m3cbL7yio5Tl4QE3o2DfCfNOF4xwkjfOoApYrx0HFQ0P?=
 =?us-ascii?Q?yeRnIBQ8Y59RHw7e3gEa2SAM9jS81cRd/WapmmTCPr1gBCuJoW2c7UvqeniC?=
 =?us-ascii?Q?6DvcgyCW/NOicc/ptvtDCqGmugF7s2ELMoJohFV2wrh3RBOn/KRpZ8DDyBDb?=
 =?us-ascii?Q?mWNBwm43k22jbKqc6DMC0IHAVv4YBWVtSR37/1910VCU45r2Ljiy4oxL2tz3?=
 =?us-ascii?Q?Py+OfIRvWNMyQqV5ce/48HJvPVfJVPx+W5vUczIwLUdJiJ1cx19z5zLrEte9?=
 =?us-ascii?Q?30iWtZ4rPPHTpFxm2SU2br1Pq3dVr4dEU3o+1S7/HxQL+WGfgXay5qRLLsMx?=
 =?us-ascii?Q?rEEBl9jGfcwOpZcTZsNu/mYynTTA88xeCy4mCYXqNxd3ZUa4b3MK7eevsuEG?=
 =?us-ascii?Q?0o9sx1ioO6dAi9e1dvt20rQnd3VjMp+RgsZJj6JGINPHxSa7hLyk/VVhMRL+?=
 =?us-ascii?Q?QV7TrkXZ9BJDtvl303sQRG5+nKFg7N9TpuWkI4kC8ZCGRyd9pDA1X1vFgnug?=
 =?us-ascii?Q?fRZnsInop6c5Z28kwhh0uvk7IqEsBFjNC6FzZBbehdyd4kiOJxZWersZCcs6?=
 =?us-ascii?Q?b46j59CNwo2iEZcq3JycvDY9sPaTjMcTXaMv6/F7Jkuvw18ZskAdjUqlgkXA?=
 =?us-ascii?Q?3fj3JifNILxxZRnCTsveQt69S/aQawm7T4bbMMFHtuvlnias4VYEqkegD4+I?=
 =?us-ascii?Q?kgkWWjdg7Laek02O4iwrngjZl2pbVXV1IJl8NZjoqPFjfbHJLCc9T58AfwyA?=
 =?us-ascii?Q?t9DFoX5cgp7CFGCD90brOYnbJ0uSqj51B/eSCAJrqTUENH1IFBPkOId7wmRE?=
 =?us-ascii?Q?iFA3g7a65m3gFhKUN2isBZDGyquBJnH+5E0BK5nP2ebD/vuLjipZF7XG+iQu?=
 =?us-ascii?Q?SiW3BbPL34SUHv6OyCqr7AsKSJSDnmE3mqenSraO9Cb2LpaJwJ9sGxIJi63p?=
 =?us-ascii?Q?R9t9Fdko/3KnLEJDNdfXzQaCEB9NPDvM5+vk8Eq4Do2IIzsIQObDyRQTwsqg?=
 =?us-ascii?Q?VVhUKEUBAiN3ZaQcD55iLycywhckKl9vtnMrjj2tDt87opMNUtXGIhOCWyQV?=
 =?us-ascii?Q?nmARKq+bfoN06cFAULbAZjarkzSGevO2nfV9JqXroSRZXX+Un2fJzsHjDSBd?=
 =?us-ascii?Q?eZiF7fgmzwKXLRWJKPA/Y3eUaNSIVVJtI0pFRYZgR2jj6cve5Dj/vn1YRYzN?=
 =?us-ascii?Q?o2N5Xedrmw3+ODSSoUqyBEymKXNAg9NJO5lcu1aCfJXWMoKFJkYZC1UyrRwk?=
 =?us-ascii?Q?kuiAsFXDLextLPeuUwri3FASssKo2InHyHmRWNIR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4d2811-5df3-4143-89d2-08dbca1f4cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 05:59:58.6421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yhCKH4QP73hDUqcwz8GRrR2hSPD8f+ldI1OBjLsyOlpb8yHm/a4s7qJb2B5XEln8N/FD/WqFGKIlPV8TDlGxh4yFtZEumzLy8KzsBQCv50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, October 6, 2023 10:32 PM
> To: intel-xe@lists.freedesktop.org; linux-hwmon@vger.kernel.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
>=20
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in PACKAGE_RAPL_LIMIT register (1.x *
> power(2,y))
>=20
> v2: Get rpm wake ref while accessing power1_max_interval
> v3: %s/hwmon/xe_hwmon/
> v4:
>  - As power1_max_interval is rw attr take lock in read function as well
>  - Refine comment about val to fix point conversion (Andi)
>  - Update kernel version and date in doc
>=20
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 ++
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 142 +++++++++++++++++-
>  3 files changed, 158 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 1a7a6c23e141..8c321bc9dc04 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -59,3 +59,12 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Energy input of device in microjoules.
>=20
>  		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index d8ecbe1858d1..519dd1067a19 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -22,15 +22,23 @@
>  #define   PKG_TDP				GENMASK_ULL(14, 0)
>  #define   PKG_MIN_PWR				GENMASK_ULL(30,
> 16)
>  #define   PKG_MAX_PWR				GENMASK_ULL(46,
> 32)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54,
> 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
> +
>=20
>  #define PCU_CR_PACKAGE_POWER_SKU_UNIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>  #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>  #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19,
> 16)
>=20
>  #define PCU_CR_PACKAGE_ENERGY_STATUS
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>=20
>  #define PCU_CR_PACKAGE_RAPL_LIMIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>  #define   PKG_PWR_LIM_1				REG_GENMASK(14,
> 0)
>  #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23,
> 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
> 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
> 17)
>=20
>  #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 391f9a8dd9d7..867481c91826
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
>  #define SF_CURR		1000		/* milliamperes */
>  #define SF_VOLTAGE	1000		/* millivolts */
>  #define SF_ENERGY	1000000		/* microjoules */
> +#define SF_TIME		1000		/* milliseconds */
>=20
>  struct xe_hwmon_energy_info {
>  	u32 reg_val_prev;
> @@ -50,6 +51,7 @@ struct xe_hwmon {
>  	struct mutex hwmon_lock;	/* For rw attributes */
>  	int scl_shift_power;
>  	int scl_shift_energy;
> +	int scl_shift_time;
>  	struct xe_hwmon_energy_info ei;	/*  Energy info for
> energy1_input */
>  };
>=20
> @@ -253,6 +255,142 @@ xe_hwmon_energy_get(struct xe_hwmon
> *hwmon, long *energy)
>  				  hwmon->scl_shift_energy);
>  }
>=20
> +static ssize_t
> +xe_hwmon_power1_max_interval_show(struct device *dev, struct
> device_attribute *attr,
> +				  char *buf)
> +{
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	u32 r, x, y, x_w =3D 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +			     REG_READ, &r, 0, 0);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	x =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
Need space here.
> +	/*
> +	 * tau =3D 1.x * power(2,y), x =3D bits(23:22), y =3D bits(21:17)
> +	 *     =3D (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 =3D (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
Please reformat the comment to make it readable.
> +	tau4 =3D ((1 << x_w) | x) << y;
Need space here.
> +	/* val in hwmon interface units (millisec) */
> +	out =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
> x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out); }
> +
> +static ssize_t
> +xe_hwmon_power1_max_interval_store(struct device *dev, struct
> device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	u32 x, y, rxy, x_w =3D 2; /* 2 bits */
> +	u64 tau4, r, max_win;
> +	unsigned long val;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Max HW supported tau in '1.x * power(2,y)' format, x =3D 0, y =3D 0x=
12
> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of
> 256 seconds
> +	 */
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
Is it universal truth that we are always going to use these default MAX_WIN=
 value ?
AFAIR from i915 review it was due to some h/w limitation on DG2, we were fo=
rced to use
these default values instead to read it from registers. If this is true pro=
bably  future
platforms will address such h/W limitation, it is worth to leave a code com=
ment here ?=20
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in xe_hwmon_power1_max_interval_show()
> +	 */
> +	r =3D FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	x =3D REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y =3D REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 =3D ((1 << x_w) | x) << y;
> +	max_win =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time
> + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val =3D DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time,
> SF_TIME);
Need Space here.
Please leave a line of space before a code comment.
Thanks,
Anshuman Gupta.
> +	/*
> +	 * Convert val to 1.x * power(2,y)
> +	 * y =3D ilog2(val)
> +	 * x =3D (val - (1 << y)) >> (y - 2)
> +	 */
> +	if (!val) {
> +		y =3D 0;
> +		x =3D 0;
> +	} else {
> +		y =3D ilog2(val);
> +		x =3D (val - (1ul << y)) << x_w >> y;
> +	}
> +
> +	rxy =3D REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) |
> +REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
> (u32 *)&r,
> +			     PKG_PWR_LIM_1_TIME, rxy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  xe_hwmon_power1_max_interval_show,
> +			  xe_hwmon_power1_max_interval_store, 0);
> +
> +static struct attribute *hwmon_attributes[] =3D {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index) {
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	if (attr =3D=3D &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		ret =3D xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ?
> attr->mode : 0;
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static const struct attribute_group hwmon_attrgroup =3D {
> +	.attrs =3D hwmon_attributes,
> +	.is_visible =3D xe_hwmon_attributes_visible, };
> +
> +static const struct attribute_group *hwmon_groups[] =3D {
> +	&hwmon_attrgroup,
> +	NULL
> +};
> +
>  static const struct hwmon_channel_info *hwmon_info[] =3D {
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX |
> HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT), @@ -574,6
> +712,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>  		xe_hwmon_process_reg(hwmon,
> REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
>  		hwmon->scl_shift_power =3D REG_FIELD_GET(PKG_PWR_UNIT,
> val_sku_unit);
>  		hwmon->scl_shift_energy =3D
> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +		hwmon->scl_shift_time =3D REG_FIELD_GET(PKG_TIME_UNIT,
> val_sku_unit);
>  	}
>=20
>  	/*
> @@ -620,7 +759,8 @@ void xe_hwmon_register(struct xe_device *xe)
>  	/*  hwmon_dev points to device hwmon<i> */
>  	hwmon->hwmon_dev =3D
> devm_hwmon_device_register_with_info(dev, "xe", hwmon,
>=20
> 	&hwmon_chip_info,
> -								NULL);
> +
> 	hwmon_groups);
> +
>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n",
> hwmon->hwmon_dev);
>  		xe->hwmon =3D NULL;
> --
> 2.25.1

