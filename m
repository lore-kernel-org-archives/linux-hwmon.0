Return-Path: <SRS0=tjBW=BB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36017C433E2
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Jul 2020 08:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E512065E
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Jul 2020 08:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="ixjPIJU+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgGVIQV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Jul 2020 04:16:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:40289 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGVIQV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Jul 2020 04:16:21 -0400
IronPort-SDR: 8YMdJHFfi1aI5MU9E4R/v16BnMrmDiMDfnU0H25RtY1hC/DY78G2pwGC+4QckhmCMf/p8OdwBP
 +H3zNrrSswTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="148224784"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="148224784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 01:16:19 -0700
IronPort-SDR: eJd2MfPPoEZefRYqG64U7eL7vAJps5u7aTlg/EzCjbWiZyFPZaP+AvKlIgO2GsCUQ8Td5/WXSE
 2085NQ3Y3DwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="270680972"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2020 01:16:19 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 22 Jul 2020 01:16:19 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 22 Jul 2020 01:16:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 22 Jul 2020 01:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jx4gxwCV6EYhj5n/hQcIpuCoZ5VCIr/cYjBovCB+fiwJWw4IRI1awCkCPkyCDjg3wY3U6PgHEqsOEHdeKdAugqM9zog9Iu6mg8MwimCch4oBKAHE5vqqZJY82Bt+rmA4SUXxExwurQAxh5795Mn4qv+awSXy5wwUNbGFM4qH3nnXKW4URL31bbstxj4CPB2+0l97d0ZJN+mVOEVB/hqQyqLqGWrOm7kY4E2iD+XyDLYVqoh3yiS/1Z6xMCkJiJNdxx6oYH+VOEkKl9BZ2aWcxVG7/brkdEERiClUGSkE3oGybkoKaW18YVup9U1cIuRUwPNPfxd6T5MsSBuRNYgiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWiAiTwDFVJ7oznO4ZcdIlNJ8QbCqO4siY2DMQIB5gE=;
 b=B1FS/FjQovMDAi/KjA6e+9IPAJBTn59Y39ywYWdhRnH2KLTHVf3iqcQHEY4jzgKmWqs3cgmFNPsxVvF+CTIFTwP9iyFaJlFTVvRL5zvWlH2D6enQmryVyQGkZhFDIDbbPa7AmrLkYumDd7aUXbtciubxPA+d02OYtIuoY7STmiCZg0gBUINdgtJ0S3XasDloPVYonEe5EWnyRsSfaC7azWP9FzKDKcCUmwdkOH1YujAcRYRqqQzCUZhiUE3hu7NOfeCpgyiN2HomG8VXeTxjY1eBPvXdY57QhLvTiwoGJwDzYKsv8VlACIQrNtGQ0QJ1VgVVUGARwCh/ZseySPolNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWiAiTwDFVJ7oznO4ZcdIlNJ8QbCqO4siY2DMQIB5gE=;
 b=ixjPIJU+lNysq8tjKhP/FEzPpJ+OcgL04xeAeONo14IVYI429daUW+doGTMvO0cUsSbLPY6AIJckXjWnpqIz+86w/w48QNOZR8mmuzT0I3bRMsUZA9EdU66q2Ne93SjM6btfylMBMYbBsj7Yi3Nq7a1lDr1hu7FflYODPIS/HcM=
Received: from MN2PR11MB4064.namprd11.prod.outlook.com (2603:10b6:208:137::18)
 by MN2PR11MB3760.namprd11.prod.outlook.com (2603:10b6:208:fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 08:16:11 +0000
Received: from MN2PR11MB4064.namprd11.prod.outlook.com
 ([fe80::bd66:45b5:c0ae:b9d6]) by MN2PR11MB4064.namprd11.prod.outlook.com
 ([fe80::bd66:45b5:c0ae:b9d6%6]) with mapi id 15.20.3195.028; Wed, 22 Jul 2020
 08:16:11 +0000
From:   "Xia, Hui" <hui.xia@intel.com>
To:     jaap aarts <jaap.aarts1@gmail.com>, lkp <lkp@intel.com>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Subject: RE: [PATCH V2] hwmon: add fan/pwm driver for corsair h100i platinum
Thread-Topic: [PATCH V2] hwmon: add fan/pwm driver for corsair h100i platinum
Thread-Index: AQHWXbDfIyeew4xCw0OD5XhHSdiyhqkTRVOQ
Date:   Wed, 22 Jul 2020 08:16:10 +0000
Message-ID: <MN2PR11MB406430304153609D41BA6472E5790@MN2PR11MB4064.namprd11.prod.outlook.com>
References: <20200717121642.41022-1-jaap.aarts1@gmail.com>
 <202007190844.mNvV0B06%lkp@intel.com>
 <CACtzdJ183FF31S3J2ki7E1xkAOBsGiSAudc__Q578RUR9zC5XA@mail.gmail.com>
In-Reply-To: <CACtzdJ183FF31S3J2ki7E1xkAOBsGiSAudc__Q578RUR9zC5XA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7869598f-89c7-4fc0-c329-08d82e177e5d
x-ms-traffictypediagnostic: MN2PR11MB3760:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3760FA0A50B76F7766A7D809E5790@MN2PR11MB3760.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MPOcYNc9yhIe1cf2YFoMR8B9Nf9fEYP4hmc4n/NPT21WbV8FBwauGbo2aLBBRBzj+wmybGg1JtF9tnISfdG4JrtVvMe1UuNwHpcO/qKxqpHHXE97UAC3JF1eWmmSbcVRGRAcHhi3zxEkGRy8OJRS2fLHeb6ZYdKi7RPUTUBqFEBISdryhZ7waKYdEwM8hPG9lztD4WcHxPJOpPctGyXQIdJwgltexed9+JUediAHCPngEIHi0Mi+mvJ1E9QRz6JC23HrJQeiXZ/hhE7+EA+CQd7xE5jGN1DOqpOgvwPgXnViecbpa94X5+6AX/BI7n8DrwaJgaVV2PO1QHJNhrSidYfufe7r4Zun9h2VaOcAFOnilFTtK2Mwnibf4QCp70rPpOfXxOIgpA7k0ecY6X4DgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(33656002)(110136005)(83380400001)(5660300002)(55016002)(54906003)(26005)(66476007)(66946007)(66446008)(64756008)(66556008)(76116006)(71200400001)(186003)(83080400001)(86362001)(6506007)(7696005)(8936002)(52536014)(8676002)(478600001)(6636002)(9686003)(4326008)(2906002)(966005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QsCy7OrZ4aKsE+cF/cGlC+9+zL0YlqJZo7F6Pj4ecTUl4+Ndm/dLygfoffjsTaQmSlO/qOBhttHTVer+WheqLURf/emAIdXiVWu11tKd2x4gpOahSHECf27byVKk2V2u27Uj4+te2otztgp8NLkaTfbXfdOTIBqFkru6/QZgl7wXnOa0GjM8E5PabT48fVW8eZTmKc+9Q1ELrqIyucTU549fsc96OFu8cC7vnZvOGMh6jyi0eUj2OArtkWoe1ZIWpUE2Qg7DTeqLcHJEgpuMNSiW2w6i5a+YgmcX44BGxT945YiSpEttBy5IzOSu4/ecnHH/V+I8RtJHwtCmMOf5jSOjV4AA2ad1uDzAuxvBxy+lXDZYUAxKuvfomY2EWJ7IWz1lk7TuW6OuyPs84+RBCiXBsekaqkY5bJuWcVdSVJi6f15Lg2VZvCLXnOvxWy+RI/e25dsESbO4eabBwm8T4O5IjxU8TL3e5gWuxMpeKBoPICQPpZMRMi0QbMkIh4JR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7869598f-89c7-4fc0-c329-08d82e177e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 08:16:11.0215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhAtpNhMWQmsat5el1GN8ktd/KraCDmPTRIgu1vjCeC5iyzhEGA1IFgzNDoO5S0kI8u0x9iWIDaykPb4yjGa7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3760
X-OriginatorOrg: intel.com
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGphYXAgYWFydHMgPGphYXAu
YWFydHMxQGdtYWlsLmNvbT4NCj5TZW50OiAyMDIw5bm0N+aciDE55pelIDE3OjM4DQo+VG86IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPkNjOiBKZWFuIERlbHZhcmUgPGpkZWx2
YXJlQHN1c2UuY29tPjsgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsNCj5saW51
eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGtidWls
ZC0NCj5hbGxAbGlzdHMuMDEub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCBWMl0gaHdtb246IGFk
ZCBmYW4vcHdtIGRyaXZlciBmb3IgY29yc2FpciBoMTAwaSBwbGF0aW51bQ0KPg0KPkkgdHJpZWQg
dG8gcmVwcm9kdWNlIHRoaXMsIGJ1dCBJIGdvdCB0aGUgZXJyb3I6DQo+eHRlbnNhLWxpbnV4LWdj
YzogZXJyb3I6IG1pc3NpbmcgYXJndW1lbnQgdG8gJy1XZnJhbWUtbGFyZ2VyLXRoYW49Jw0KPmF0
IHRoZSBsYXN0IHN0ZXAgdXNpbmcgdGhlIHByb3ZpZGVkIGNvbmZpZy4NCkhpIEphYXAgQWFydHMs
DQoNClNvcnJ5IHRvIG5vdCByZXByb2R1Y2UgdGhlIGVycm9yIHlvdSBtZXQuIFlvdSBjYW4gdHJ5
IHRvIHJlcHJvZHVjZSB0aGUgbW9kcG9zdCBlcnJvcg0KV2l0aCBhbnkga2VybmVsIGNvbmZpZyB0
aGF0IGVuYWJsZSBTRU5TT1JTX0NPUlNBSVJfSFlEUk9fSV9QUk8gYW5kIGRpc2FibGUgVVNCLg0K
VGhlIGRyaXZlciBzdXBwb3NlZCB0byBuZWVkIGFkZCAiZGVwZW5kcyBvbiBVU0IiIGluIGtjb25m
aWcgc2luY2UgaXQgdXNlIHVzYiBBUEkuDQoNCi0tSHVpDQoNCj4NCj5KYWFwIEFhcnRzDQo+DQo+
T24gU3VuLCAxOSBKdWwgMjAyMCBhdCAwMjozMSwga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+IHdyb3RlOg0KPj4NCj4+IEhpIGphYXAsDQo+Pg0KPj4gVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToNCj4+DQo+PiBbYXV0byBidWlsZCB0ZXN0
IEVSUk9SIG9uIGh3bW9uL2h3bW9uLW5leHRdIFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24NCj4+
IHY1LjgtcmM1IG5leHQtMjAyMDA3MTddIFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhl
IHdyb25nIGdpdA0KPj4gdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLg0KPj4gQW5kIHdoZW4g
c3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRl
ZCBpbg0KPj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2hdDQo+Pg0K
Pj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL2phYXAt
YWFydHMvaHdtb24tYWRkLWZhbi0NCj5wd20tZHJpdmVyLWZvci1jb3JzYWlyLWgxMDBpLXBsYXRp
bnVtLzIwMjAwNzE3LTIwMTkyMw0KPj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9ncm9lY2svbGludXgtc3RhZ2luZy5naXQNCj5od21vbi1u
ZXh0DQo+PiBjb25maWc6IHh0ZW5zYS1yYW5kY29uZmlnLXIwMTEtMjAyMDA3MTkgKGF0dGFjaGVk
IGFzIC5jb25maWcpDQo+PiBjb21waWxlcjogeHRlbnNhLWxpbnV4LWdjYyAoR0NDKSA5LjMuMCBy
ZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTENCj4+IGJ1aWxkKToNCj4+ICAgICAgICAgd2dldCBodHRw
czovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLQ0KPnRlc3RzL21hc3Rlci9z
YmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcw0KPj4gICAgICAgICBjaG1vZCAreCB+
L2Jpbi9tYWtlLmNyb3NzDQo+PiAgICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0
byBsaW51eCBidWlsZCB0cmVlDQo+PiAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9N
RS8wZGF5IENPTVBJTEVSPWdjYy05LjMuMCBtYWtlLmNyb3NzDQo+PiBBUkNIPXh0ZW5zYQ0KPj4N
Cj4+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgYXMgYXBw
cm9wcmlhdGUNCj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4NCj4+DQo+PiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Piwgb2xkIG9uZXMg
cHJlZml4ZWQgYnkgPDwpOg0KPj4NCj4+ID4+IEVSUk9SOiBtb2Rwb3N0OiAidXNiX2RlcmVnaXN0
ZXIiIFtkcml2ZXJzL2h3bW9uL2NvcnNhaXJfaHlkcm9faV9wcm8ua29dDQo+dW5kZWZpbmVkIQ0K
Pj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfcmVnaXN0ZXJfZHJpdmVyIg0KPltkcml2ZXJzL2h3
bW9uL2NvcnNhaXJfaHlkcm9faV9wcm8ua29dIHVuZGVmaW5lZCENCj4+ID4+IEVSUk9SOiBtb2Rw
b3N0OiAidXNiX3B1dF9kZXYiIFtkcml2ZXJzL2h3bW9uL2NvcnNhaXJfaHlkcm9faV9wcm8ua29d
DQo+dW5kZWZpbmVkIQ0KPj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfcHV0X2ludGYiIFtkcml2
ZXJzL2h3bW9uL2NvcnNhaXJfaHlkcm9faV9wcm8ua29dDQo+dW5kZWZpbmVkIQ0KPj4gPj4gRVJS
T1I6IG1vZHBvc3Q6ICJ1c2JfZ2V0X2ludGYiIFtkcml2ZXJzL2h3bW9uL2NvcnNhaXJfaHlkcm9f
aV9wcm8ua29dDQo+dW5kZWZpbmVkIQ0KPj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfZ2V0X2Rl
diIgW2RyaXZlcnMvaHdtb24vY29yc2Fpcl9oeWRyb19pX3Byby5rb10NCj51bmRlZmluZWQhDQo+
PiA+PiBFUlJPUjogbW9kcG9zdDogInVzYl9maW5kX2NvbW1vbl9lbmRwb2ludHMiDQo+W2RyaXZl
cnMvaHdtb24vY29yc2Fpcl9oeWRyb19pX3Byby5rb10gdW5kZWZpbmVkIQ0KPj4gPj4gRVJST1I6
IG1vZHBvc3Q6ICJ1c2JfY29udHJvbF9tc2ciDQo+W2RyaXZlcnMvaHdtb24vY29yc2Fpcl9oeWRy
b19pX3Byby5rb10gdW5kZWZpbmVkIQ0KPj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfYXV0b3Bt
X3B1dF9pbnRlcmZhY2UiDQo+W2RyaXZlcnMvaHdtb24vY29yc2Fpcl9oeWRyb19pX3Byby5rb10g
dW5kZWZpbmVkIQ0KPj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfYXV0b3BtX2dldF9pbnRlcmZh
Y2UiDQo+W2RyaXZlcnMvaHdtb24vY29yc2Fpcl9oeWRyb19pX3Byby5rb10gdW5kZWZpbmVkIQ0K
Pj4gPj4gRVJST1I6IG1vZHBvc3Q6ICJ1c2JfYnVsa19tc2ciIFtkcml2ZXJzL2h3bW9uL2NvcnNh
aXJfaHlkcm9faV9wcm8ua29dDQo+dW5kZWZpbmVkIQ0KPj4NCj4+IC0tLQ0KPj4gMC1EQVkgQ0kg
S2VybmVsIFRlc3QgU2VydmljZSwgSW50ZWwgQ29ycG9yYXRpb24NCj4+IGh0dHBzOi8vbGlzdHMu
MDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZw0KDQo=
