Return-Path: <SRS0=ibG4=X4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7368FC32792
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42F5F20865
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="nPgbADvA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388980AbfJCSf7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Oct 2019 14:35:59 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:39844 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388309AbfJCSf6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Oct 2019 14:35:58 -0400
Received: from pps.filterd (m0118797.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x93IFlgA011201
        for <linux-hwmon@vger.kernel.org>; Thu, 3 Oct 2019 14:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=YaaPy7zi4akcSOY742BtOQ/xLBfwvFudG7/sGTqhP60=;
 b=nPgbADvAY25C1cGfw893QyFRNqkDWZ+TbdoSB34plnSF4ke/bYUP29oO590bREVZsVtk
 VNh2E7tfV/K/BPAvGP0UoQc9VY+6fQmXKIUJVtWDrd9JAqR3rEo0KWAUEvyAUYRD2R2U
 /y2cPkRJVQ/UhJe5VFmHYYS19TbYROG1pNp33eMGTkjP6knNSofs2WrYbVHCLqNnTyV4
 uGnzMEfZE5TeM5bykVN7Hf47cGEsr1LsGzIxpIM8/UKgNziRNw1RF7jF4CccKQd2oSZ2
 s658E528P2b77yzzufIz7X8kROKxh7z2/RvIpmIM3nMlqeWD7s2ikSwRliS7qju8BD+5 cA== 
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2053.outbound.protection.outlook.com [104.47.40.53])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vd5s5gw6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Oct 2019 14:35:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hi62Zl4RYnJzZR00nH4bEVO0LNBJ9+Zcyun4bxkdpP34f5+cWE/jLPcEXDs89VDydqzKKMl9fa6lMxSgyEP4wIz770MPrvrGUysbCC7QX03hVWbbQ2JKanJYn5fw/6pFw2mxku06SPtLKHnhH3fvquD345ff5VpseuWq6uviDZJGJ7HmH6w5EUeGMTyCZRVV+AkqnkoDG46EdXNEt7b1KP38ob2wiM36XnHW4hYPWB5ro9UojnE15Gmc63X/lHEVdCOXj/djri60P5CKW82p4oAvx1UXC5SxyxRYoaILlIoza+fo+IaKtLHl7JwPFaw+VTLYBmShNyZ3d8r0gWLINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaaPy7zi4akcSOY742BtOQ/xLBfwvFudG7/sGTqhP60=;
 b=bCZG8F5DkfvRUld2f9LMQlU7nHf9+y9yu+xfc/Kfow9/p+TDG1FwiV6Y5aUTatKclbjoygpPHlCs0arQ7DQINo9paePMZ9IhPBmr60kEM59jg9sQqaZQP/yiai3+yWQGjyBubg8U8G5QY40qBRkr1FsAXNBPdr484ffk5j1xxKRlJZ9TKm1/yfNvCQDbrT8wsQ8tG6Khhjpyk9xODrefvW0p+8xX5GRww1jOfF0ZRalAikrk0bOBxkU2a/oplGdmG0Pnrb//zJK9xWUhRdNHSofrwVXrFokId2bsknBestBxkOJOVh7vmao25kfqLult4nKOkAGIXmuTwFSax01PgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4641.prod.exchangelabs.com (20.177.205.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 18:35:51 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 18:35:51 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV6F0hjy4+RpFt6R++XpWeNAWFJwgAAfbAA
Date:   Thu, 3 Oct 2019 18:35:51 +0000
Message-ID: <BL0PR01MB48354C0BF0D094921233611A959F0@BL0PR01MB4835.prod.exchangelabs.com>
References: <BL0PR01MB48359D174C7CE498D7367B42959F0@BL0PR01MB4835.prod.exchangelabs.com>
In-Reply-To: <BL0PR01MB48359D174C7CE498D7367B42959F0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b65cc18-6499-4a65-a9a4-08d7483084cb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4641:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR01MB464147994B8C47739351C4EB959F0@BL0PR01MB4641.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(189003)(199004)(186003)(14444005)(256004)(81166006)(478600001)(66066001)(71190400001)(8676002)(81156014)(14454004)(66446008)(66946007)(66476007)(66556008)(76116006)(8936002)(52536014)(64756008)(71200400001)(33656002)(5660300002)(2906002)(6436002)(9686003)(55016002)(99286004)(7696005)(6116002)(3846002)(86362001)(74316002)(229853002)(6246003)(2940100002)(486006)(316002)(25786009)(6200100001)(102836004)(6862004)(6506007)(76176011)(446003)(476003)(11346002)(26005)(4326008)(7736002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4641;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 119u7DgPb2PXOn+2RrHkVt3dP9YD97XpT2o6sJhzWk7/Ixpt8TOgYHZ0aYs4xc1PU6T70q7CBpPuzYjU4ergVp37d1y4RoGA9RRlK6cyWWnjOmrX61plx4NeP8niAZvYxbArQr8W4Uz00LKHU2A5e5685yghZp5gX+RHNF4NBGgCZLTkqRzTIM97Cvl6hVFnnUiV7U5dUCT/ZRyanA5QL36uKc1t8JQ2ZRtzdJ2JOenl2Jks6w6PmPpARBBZnAu1mJn/I1SXdStv9oU5kIyttc+oODLfUO0duLnbP29pQFlKOpWHuENmEULZg6y5YaE5jHMdIfjUaiveiz8BvmdWCxTTGymApGJTfzTh4iaSWb0iCjy5jXDa2bcja6z2wxKD5Qf+VdyDPS6AwtT/3/ja8zWkAaM70NGMDwPTCwkBJ4E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b65cc18-6499-4a65-a9a4-08d7483084cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 18:35:51.9374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ku//nwUd1nU5XNquko1JQRrpDpViKtqEvKKqcpnCri0VsEIBX/c63V2bJP904m0jz7a98bePv8tSgx8sjwXihQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4641
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910030152
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Version three of the driver for Texas Instruments TMP512/513 sensors.
>=20
> Thanks again for the review, I think we are getting close. I'm not in an =
easy position for now to test the driver without device tree. I
> can put the required effort to

Sorry, I mean that I'm not in a good position to test it, but I can put the=
 required effort to if needed.
>=20
> Main changes from version 2:
> 	- Remove the neccessity to provide a shunt-resistor value
> 	- Remove max-expected-current-ma configuration and always
> 	  use max possible current for calibration
> 	- Make sure calculation during calibration can't overflow
> 	- Add value clamping for DT value and runtime parameters
> 	- Support non DT system
> 	- Move hysteresis from DT to standard attribute
>=20
> Main changes from version 1:
> 	- Use the with_info API instead of sysfs attributes.
> 	- Remove non-standard attributes and raw value.
> 	- Move settings that were non-standard attributes to
> 	  device tree, update documentation as well.
> 	- Fix coding style issues
>=20
> Eric Tremblay (2):
>   Add driver for Texas Instruments TMP512/513 sensor chips.
>   Add DT bindings for TMP513 driver
>=20
>  .../devicetree/bindings/hwmon/tmp513.txt      |  33 +
>  Documentation/hwmon/tmp513.rst                | 102 ++
>  MAINTAINERS                                   |   7 +
>  drivers/hwmon/Kconfig                         |  10 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/tmp513.c                        | 901 ++++++++++++++++++
>  include/linux/platform_data/tmp513.h          |  28 +
>  7 files changed, 1082 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
>  create mode 100644 Documentation/hwmon/tmp513.rst  create mode 100644 dr=
ivers/hwmon/tmp513.c  create mode 100644
> include/linux/platform_data/tmp513.h
>=20
> --
> 2.17.1

