Return-Path: <SRS0=fVv9=YW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62797CA9EAE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 15:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EC2820856
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 15:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="tJg5UNEj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389686AbfJ2PFB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Oct 2019 11:05:01 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:2857 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389387AbfJ2PFB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Oct 2019 11:05:01 -0400
Received: from pps.filterd (m0118789.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TEjSA8026000;
        Tue, 29 Oct 2019 11:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pps-02182019;
 bh=3zG4fVZSjDwWnP5OdW+qb6CpsyaL9dShru2QfhyHN5w=;
 b=tJg5UNEjYr/o+E140mGb1dpEXZKaKK3wGTMwUuSAafS06Tosh2WZ21MkOpt9epSBBNEh
 sYppmbGaY3imdMavc9zej/rhcXmMoJImMcS0mEjTOHwhMWQsLDh7M4akAIH/u1bw8Jbg
 fyn5qzsKLLALkDQqUw3cKQbguXxD/GK+H9gHsYXoAvZfK75x3eFUmFz6IjiZ0ovhZawz
 pHqrJPtBhmuE19lmBSNeb5tGO8fEmnW070E6rkRNCYg2j70gDQjcZCsi0tP/TfOpalJ8
 2uQIqCAAPHHXriIe1XeQnnmk1ikhFPG/IAHUW8m2lHmxro8bmqM+KhsUre4SIjXoLLoA PQ== 
Received: from nam01-sn1-obe.outbound.protection.outlook.com (mail-sn1nam01lp2055.outbound.protection.outlook.com [104.47.32.55])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vx3vu12p3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 29 Oct 2019 11:04:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrITuMJDtUyjRgYJOzDh2/RPFz9QZ+BzXatdz0gTfpjA5xlJEKinxHrsDIumGz+rG5fkDp6Sn5uTSXleBJefxywIHlo9tDlq7THvtj7Qc2vz2EotSKwA6+gVDKsTOvPjFiqeFSJA0+UmEGXuKouObhpeFptXWV6pVvm8Zli+xN7NHQ+yc4Ckq6N94pkKcdJPs0cGxU0WXe+Duiw1xyFj+7atwnJVAOx21SX1iHgVzFyJHn1nb6U5qVLA7kI8a6FdRQqCsVOqL2V9h4tS7KCR8jizLMurJNj9IuBDpgHcAIAtSdXd/pRrAzBmjQmK5vBifQbCEmIpQ0Rpn6ir+HximQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zG4fVZSjDwWnP5OdW+qb6CpsyaL9dShru2QfhyHN5w=;
 b=VeNfAyk0oFDQ2tkXZLIJh4mc2641rszsxYptEdVCozmV6oNR2JZDEG1lmHkTPSgfPQPJs+fDYgeQewM+Oj1Fv2k/0dHdwopKhaHbvH73ruK55hgaVsCD6R69a12a59mBufNTdn7rjXBKuOBiKW7GuyBQUlmXF2Dkwis/OiQs5Wygxnmk3fNEXj/sI8RYgW2FzPq4MIk8HF3bwWNAqyEb0lm5h1/RzEEaRxsZrgCJL8gbzthZUgzev83L2jy9DWEcYaRQSt+0iVRsiojgNgVvkfb8xzkSh9K71cRwG66J8wClp0Te2RMIiIebdiF6EDnHtbHW80YK4ZTq5pzLifmZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from DM6PR01MB4844.prod.exchangelabs.com (20.177.219.29) by
 DM6PR01MB3883.prod.exchangelabs.com (20.176.72.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 15:04:23 +0000
Received: from DM6PR01MB4844.prod.exchangelabs.com
 ([fe80::a05a:a956:3538:51a8]) by DM6PR01MB4844.prod.exchangelabs.com
 ([fe80::a05a:a956:3538:51a8%6]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 15:04:23 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v6 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v6 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdWOaZVTjHP79FTQQ9m5o2b29+XQjA==
Date:   Tue, 29 Oct 2019 15:04:23 +0000
Message-ID: <DM6PR01MB4844FAE9F161D08EDB128BE295610@DM6PR01MB4844.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50b887b2-3996-45b8-c21a-08d75c8148e0
x-ms-traffictypediagnostic: DM6PR01MB3883:
x-microsoft-antispam-prvs: <DM6PR01MB38834FE4719209EB4056A56095610@DM6PR01MB3883.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(376002)(396003)(346002)(136003)(199004)(189003)(14454004)(478600001)(71190400001)(74316002)(2201001)(66066001)(76116006)(64756008)(66556008)(6116002)(3846002)(54906003)(52536014)(86362001)(5660300002)(7696005)(71200400001)(66446008)(305945005)(81156014)(81166006)(7736002)(33656002)(8676002)(25786009)(8936002)(2501003)(186003)(256004)(2906002)(66476007)(4326008)(6506007)(102836004)(476003)(486006)(26005)(316002)(110136005)(6436002)(9686003)(14444005)(55016002)(66946007)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR01MB3883;H:DM6PR01MB4844.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VS04IGu5B+73mu9lLgOm1iaFSFT69gmovUePrM/hn53RhCJ+evwel08LY0a7Vvv5UiIDIpp5GItQwLZngP87vSdeScgQBMzQOGiBK1EVMmNJJw+33jSRIMVjMzgEuLxCKorbR/s0Hhg4yZYtT3v6THslMpRgHElAzdNOjd/lo9CuwHBCZJ+Xb0H5FaYs1TKTHltg9sJD4wHlt7cstXNQyXDOVfWau1UXxeso/1+OPieLDvm2vq27HdgR92VaPLnFrV9i4JvvQEawSJsdGBKdNBkPpCJJ7ql4AMqzd5n4iegJkqR9CUyniX/4R/tSW1hwbcTNBMh75r/XG+U+FEdiTaJ0tuXKtQW41jCXTyK/ieZ+2XfRIBMUEfHGeS6zvKR69bt+mxPFVds9g6Qs/aERIiy6LgRsH5vRIPvCAXtOzxiZsIWQqcLPq6HqGUkfr2Oa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b887b2-3996-45b8-c21a-08d75c8148e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 15:04:23.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+evjGk0+WRVfWBulCis/Kl8zJRGCfZ2UpiRggAgwboRAHto2SiTVM6uoX+BHaT4WYQw4DlgFIErgqGgcJshjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3883
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290141
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Version six of the driver for Texas Instruments TMP512/513 sensors.

Except for the renaming of the shunt-resistor-micro-ohms property,
the changes are only in the binding documentation.

Thanks

Main changes from version 5:
	- Use shunt-resistor-micro-ohms standard property
	- Fix alignment between 'enum' and 'default' in dt-bindings

Main changes from version 4:
	- Remove config_lock mutex
	- Rewrite dt-bindings in yaml

Main changes from version 3:
	- Remove tmp51x_config structure, there was no useful static
	  field in the structure. The data was moved to tmp51x_data
	  structure.
	- Remove platform data
	- use device_ API instead of of_device API
	- Use array for n-Factor values.
	- Set shunt default value to 1000 uOhms

Main changes from version 2:
	- Remove the neccessity to provide a shunt-resistor value
	- Remove max-expected-current-ma configuration and always
	  use max possible current for calibration
	- Make sure calculation during calibration can't overflow
	- Add value clamping for DT value and runtime parameters
	- Support non DT system
	- Move hysteresis from DT to standard attribute

Main changes from version 1:
	- Use the with_info API instead of sysfs attributes.
	- Remove non-standard attributes and raw value.
	- Move settings that were non-standard attributes to
	  device tree, update documentation as well.
	- Fix coding style issues

Eric Tremblay (2):
  dt-bindings: hwmon: Add TMP512/513
  hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.

 .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  88 ++
 Documentation/hwmon/tmp513.rst                | 102 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 785 ++++++++++++++++++
 6 files changed, 993 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

--=20
2.17.1

