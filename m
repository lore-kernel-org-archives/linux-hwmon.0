Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C86C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 02:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE7C7207CB
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 02:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="FsnAc2e3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgE0C2K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 May 2020 22:28:10 -0400
Received: from mail-dm6nam11on2048.outbound.protection.outlook.com ([40.107.223.48]:6161
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725905AbgE0C2K (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 22:28:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR44WtGqay9NKn1p6ftdKEqubDhR0XOWWbrYiFQLXk6AB4TCM5ojDPUNLfcWphQNlLHtfqnmicyfGEHcplYm/gZ39tz3gijqV6l34jBTTSqotr0gDJISXcDAvTx31rPeeddW67KgE3gRC7Zq+XorokDMhpIxPrm/EkyqOJikJEeRT+rUsh8PIlGcYvrjacSQbzleK/yYSNcKb69p8/XeewfGKUZVTYm9mUKXEA94neQx/cuGJxtfQUNXol2ph29byKysArLPHUtgNw5RLSmsdIBtT8qGtcfQgsKW49fvN6O+z0CkNUAiVqZAHOMflgXWpChTbSZS3b+yIhJxNK4WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpuZAdkADxDXw8Qbk5P6e1iYLzvzFFOTohG/QLonLX8=;
 b=Ivl34+6yAvlDePC4JHyM34DZ5Y8Yjlxew/dB2/4DAeqUpUTvKf1ojgcTKP7+6kV00AYG1nVECNur0SCokDr73FJ+O3snAhLS/u3QFC8LGn280V2/t093h6H4llN+tbb75BrCylpo/ODFaRAjcEDqYtexle1WNT0vTRlho8OpXKCpT4jD9wF3vhtDNoYOXfbFICS/966120EIdGSxDr4L7YvhAP8Ki0ZWd8TZVj93OFsl8ZONbASEJKlrG2/8QMayFTIbvQEr22FcR1UzgaGKsEc5Rp4eNWnr2TmgFT8PqHohxngZ1rxSDDYgG2pDZm9FiX/L+IXxwtjLtiaWqf1aCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpuZAdkADxDXw8Qbk5P6e1iYLzvzFFOTohG/QLonLX8=;
 b=FsnAc2e3v9o00uCk8BKxMTVyctwM6WCyhCr2WRiTP+C1CFXZTZv+QwkikzjstgnypXMrWNVofU5GaUt0OOPXrWxk9PmMRMvPRo12b/0WlFhGwn5MY1IlwFTg/XR8o+JNB/aZ38x+SDXrUMHRMYQY5bOuSoOVw/MTMprE2x+P1ks=
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Wed, 27 May
 2020 02:28:07 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%6]) with mapi id 15.20.3045.016; Wed, 27 May 2020
 02:28:06 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: RE: [PATCH -next] hwmon: amd_energy: Missing
 platform_driver_unregister() on error in amd_energy_init()
Thread-Topic: [PATCH -next] hwmon: amd_energy: Missing
 platform_driver_unregister() on error in amd_energy_init()
Thread-Index: AQHWM81L4eJaowPaPk63Mgcyy9e3oKi7NFxw
Date:   Wed, 27 May 2020 02:28:06 +0000
Message-ID: <BY5PR12MB42125FF6FEE5F146C428E295E8B10@BY5PR12MB4212.namprd12.prod.outlook.com>
References: <20200527022417.105620-1-weiyongjun1@huawei.com>
In-Reply-To: <20200527022417.105620-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-27T02:28:04Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=a10c7dab-6bf0-4e16-a5db-0000e1a62154;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-27T02:28:04Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 2f1dd1dc-a1d5-47c5-a296-000007ab737c
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [122.167.134.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 726bad1a-0066-49ce-2fef-08d801e59745
x-ms-traffictypediagnostic: BY5PR12MB4275:
x-microsoft-antispam-prvs: <BY5PR12MB42756751F52710DF1DA5FD09E8B10@BY5PR12MB4275.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozYfNbSbbl65yLHjGQq4inCccAMpn3bpDbsKCqcag0fWufizN0nk43JSZ+whLENmDuIOeopEKazqPGKlaZvioxOkj52RvwjPZE+yQFr9wSaZLSfroH7JIDTFIGrbq3S08NdFpXJGXE0GntQSvODgADD6f4s1Znsz/j2WXi1DAr+2FLsOBNQaCjNnDHrQa5kq+mMuDfaC1me+vflOrlS7M2Jut8weLjyTOFr+ZjzJ67mdyym6AU0eoDF/cak4ako3g+sAUKvjqnHxoHE1zq6VwanRncb/O+ZDjd1OtyQS9Z0LuwvScRCqIfYoC1gSUJYHjKsvYH1ykaeJwFxlO3FnuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39840400004)(55016002)(110136005)(186003)(54906003)(26005)(8676002)(4326008)(53546011)(316002)(71200400001)(2906002)(33656002)(7696005)(5660300002)(6506007)(86362001)(66476007)(9686003)(52536014)(66946007)(76116006)(66446008)(64756008)(66556008)(8936002)(478600001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9NxnDsXws0E+sE2jFWKbno9zzK40KbByn7PKId9z4nbIrpCZkz4K4uExKLPHiKV6t9fALxN4qLaYPb3pwmuKOrGcbwMMShjXf3mVFXJQMJQoZCYuX92HMxqJlKgViQOuSSbR5U30ySR5gLquKZMO9q7k+06TWjK8ydHgIEIfdBGgXKJtDVp7CkwyQB1pFlh4S2JcWvTlJg5EG0zBPQ19hH+e9fefhcU0FLSk7317cYQghVKJJYH1iCHoQ/FYXktetsqbZVoAR/oQfCvE+vElETm1fPH2C9uE2yrmcxPe6uumqWeU+AsoSW5iY36vtzfUC7PiaI+hQhZhNpSW0zvLbQMMmXSSvnHrfk0yWRG6ucnl9pxkbKUZfHLTKtl5RXyFtgQbHYmPjoe33i+28Y6YvfAxXdj6bnv0ln2QJakzbXKS9scgrw/+7tmf/NFmu5MwcrO0nv+zaFfb4V10NflwB3CtUKTs0O0JLq9e9aAltg2mQpYAf7bIF4adKl4Y3Dt9
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726bad1a-0066-49ce-2fef-08d801e59745
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 02:28:06.8902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RA8kWxweGzm0qlQ1XB1dVEIHdBS1HUjod615psFc7G/swHNH2JG773R0flDm9E4DMUYISZjsaN28hHIayhfnFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[AMD Official Use Only - Internal Distribution Only]

Hi Yongjun,

Thanks,
Acked-by: Naveen krishna Chatradhi <nchatrad@amd.com>

-----Original Message-----
From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org>=
 On Behalf Of Wei Yongjun
Sent: Wednesday, May 27, 2020 7:54 AM
To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; Jean Delva=
re <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-hwmon@vger.kernel.org; kern=
el-janitors@vger.kernel.org; Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregiste=
r() on error in amd_energy_init()

[CAUTION: External Email]

Add the missing platform_driver_unregister() before return from amd_energy_=
init() in the error handling case.

Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counter=
s")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/amd_energy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c index =
bc8b643a37d5..e95b7426106e 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
                return ret;

        amd_energy_platdev =3D platform_device_alloc(DRVNAME, 0);
-       if (!amd_energy_platdev)
+       if (!amd_energy_platdev) {
+               platform_driver_unregister(&amd_energy_driver);
                return -ENOMEM;
+       }

        ret =3D platform_device_add(amd_energy_platdev);
        if (ret) {
