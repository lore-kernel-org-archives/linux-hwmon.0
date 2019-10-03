Return-Path: <SRS0=ibG4=X4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A63EC10F14
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19B0D20865
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 18:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="FWPocFi1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbfJCSdD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Oct 2019 14:33:03 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:23304 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729993AbfJCSdD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Oct 2019 14:33:03 -0400
Received: from pps.filterd (m0118793.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x93IFaTq021975
        for <linux-hwmon@vger.kernel.org>; Thu, 3 Oct 2019 14:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=4m2g38uW6CApmjGfB+g/9jRasuTwINZx6iXkUhDfVyY=;
 b=FWPocFi1uPfT1FRNuQiIw7hio8V6a0zeBM5HpCcszWDWLQ2vWRKEQGAcyoZzgHG3+XEh
 IllP6eq3ygivUx0o8PqzlpRVUQjQ4UC/WF1g1Jsl6463miHrtxAPnPXLmmWocpOXdIi3
 +VAG1ZiEHE0U6mpUj1BiTfojrV+oYd9JOycMZLPPKqxZnAIn+joTQ8g7rrGZpR6lokzk
 gzBrvbOkPEAiREc/HD7aRDUDzkvNQwxJTXKfhgKzj2zUoJIHjSTX2x5RKUmg+7lzwg3y
 1YgmNUVLBi3CsdsGPKmA1p0D9V5w9MivvaXTLfi20015N5GpXreXAi/E+tU3Y3Fju0g1 bw== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2050.outbound.protection.outlook.com [104.47.46.50])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vce5527f9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Oct 2019 14:33:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9Mcpeq5ZvnvL38AmkOP5vi0PEai/hxRObZWcwtJS4Jqb3Hh0AofXuM2OuKqFsAt9jilX5koUDItKZltMBoYkAIcJk5ZKLGpKErIGFhzDAn6XzjjstpLJZQG0dQmGjCfhtwJdHBMnLGFYqBY9WAjPxpNx6zICpmY+AWEM5GiX28NkvOxm/FMDcAYF46FJPsryMFDBR21YloN1ReQRSAnJYfeL9VztnsKTndhUKLIvdILQ4GjLrcrqBJZVb/TsFIgpTTXJc0s8SggajNE92ZpQct7/wMZVypjbod/Kh4uLIV7KTiAra/6rQIqod2gWYBfj6tWlb3HAgXN+uITZi0lBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m2g38uW6CApmjGfB+g/9jRasuTwINZx6iXkUhDfVyY=;
 b=b8Fb5V9HTtVGEOfwbaJbXKe9ZBCXpoOvKNKVuYYv3L6vTPS9icvMGWDSi9VFJHGQxXOoX2pMXu3JGTX4Ahk/eV3BGOPN6JcixLuOTgwyBn/+A4ddUsr0sNIjXREDdEU5QDKUC0u+Ql53XMy/ganxIaTLJLgS61TzglZPNdxFnEhWfuf1W2L7IK7vRi64RujkkDf+fNIp5MaeNx9sUARqjSbQFbyFgtFQdoyX0VnfGAS1dlafM29XTtEsq3biMJZX0zTvuUGGZy3l+IvhuCVbjJrc/8mjO9f8ZozFI9vBrfhwVvVyZtxye6IVSshY7ZCzs/C4lIaK35vSXIEcJ+xK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4116.prod.exchangelabs.com (10.167.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 18:32:45 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 18:32:45 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v3 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV6F0hjy4+RpFt6R++XpWeNAWFJwg==
Date:   Thu, 3 Oct 2019 18:32:45 +0000
Message-ID: <BL0PR01MB48359D174C7CE498D7367B42959F0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4c2f9e8-18fa-4254-cd79-08d74830157a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4116:
x-microsoft-antispam-prvs: <BL0PR01MB4116BB5AD7B40219A8E6CD02959F0@BL0PR01MB4116.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(189003)(199004)(8936002)(2351001)(316002)(81156014)(8676002)(81166006)(14454004)(25786009)(102836004)(7696005)(478600001)(186003)(71190400001)(71200400001)(14444005)(305945005)(33656002)(76116006)(7736002)(66946007)(66556008)(64756008)(66446008)(74316002)(66476007)(476003)(256004)(486006)(6916009)(66066001)(5640700003)(6506007)(55016002)(6116002)(3846002)(6436002)(2501003)(5660300002)(52536014)(2906002)(9686003)(86362001)(99286004)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4116;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6DiuNzQtgoo7qEqDy+G8Whsn3MxxYTEeYXVE/0j4um1G2xPp+/ch+VNy6EjCrX6TUWLMzWZ91nyM8hiviGrwzgcuGQEPgtvcz0q1ow5b+MvSvn2vKo4hR8atPJWPeLEDXeVkjf8OZdmvzY84hUIx5aH/jqUzeJmEc8qQKA+YsbUDq09cwGrYoU09kz7fTvJXYcqUOZCnyNb1iZGspjDku7uI6z429eGI5jZT7Ux9/iOQnWf+OzIvXQLN9BPtQjK1eLKGqitIHv8Q5Lor/xEilNFH+y5wtyzdP+djT1N+SoJkFb1hJvi2mT8FAlr2pGATLcrD/JV8Qn29d8nwM8iQatPUFlSJloToJKVXLzapuDqny+P6DWfazS7wkIAmPSQB/kU/docCkwYL5NIz+0BR/EeNwwqTB4tqRUPYWB+iiU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c2f9e8-18fa-4254-cd79-08d74830157a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 18:32:45.1014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIJhB5ScRzr0ZAAWldxeRYtfcSjYpwrz83ooa45O/ag3/ZNgoPOSwqhB4/sAmb3lQj9VZ73YLqTl/2SRPjJ0nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4116
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910030152
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Version three of the driver for Texas Instruments TMP512/513 sensors.

Thanks again for the review, I think we are getting close. I'm not in an ea=
sy
position for now to test the driver without device tree. I can put the requ=
ired
effort to

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
  Add driver for Texas Instruments TMP512/513 sensor chips.
  Add DT bindings for TMP513 driver

 .../devicetree/bindings/hwmon/tmp513.txt      |  33 +
 Documentation/hwmon/tmp513.rst                | 102 ++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 901 ++++++++++++++++++
 include/linux/platform_data/tmp513.h          |  28 +
 7 files changed, 1082 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c
 create mode 100644 include/linux/platform_data/tmp513.h

--=20
2.17.1

