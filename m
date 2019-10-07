Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5894ECE58C
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6F272084D
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="h4pS3YO4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbfJGUpo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 16:45:44 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:9122 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728273AbfJGUpo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Oct 2019 16:45:44 -0400
Received: from pps.filterd (m0118788.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97KfJlW019107
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Oct 2019 16:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=oDR7BLqdtDmpXZVb3ypKdk0dzeED76QK8tQeoET9OPk=;
 b=h4pS3YO4tT2+y2NRpQN7xc+ZQaFLJpYl0hRRGn5iKwidfIwKI6Jsk47p2IioQgs9wNP7
 BqPOyg0O6KKTimourOLjiY2FZvg1ckBmGMwJT+ov5PoniEF172JYi/eWCTmk/TqS7mEe
 76RHFlj4xGTHVbo8uJ72SpZz8+uoSraNapUV17mWGl/XiYpn5vtGDLihCVwfEbzKPy3R
 mX0g3TW4vgUyQqnkOteCkh08a2VsmbC6IMvd7DKWHv/J4Zk6h7tu8t3ATmNxGbeKfd1z
 7Lsn9HbCOtlpR/6AYzdylsMlWHmiH49yakfZoGJRWOklqfyto/Laj1zD8XmlVqJvUh// pw== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2058.outbound.protection.outlook.com [104.47.44.58])
        by mx0a-002ab301.pphosted.com with ESMTP id 2vf85thkqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Oct 2019 16:45:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHKcj2wsf0g5vXsLNk1OcZbyA+/BFYbwwvucuBairaYIfUwEyA6gQi8WEcmSdqa1/wakCEIUNVsuw6DqV3Rw6HmYmCfi4XPzdn7L/qO1a0+MTs038E+/AVT2mA7gNjW1fR/WCKmsLhBHIWtc+2H//u3jH71L45ng09wF+xjYIXyjpe3LJ65nAyJqvbAxx81nwV1QySoYadVRfvi6zcz4bbNm0o5skjEPhdLBGf9qcNGR8DeuPIC/kz4NOM+FZpeg3AN7GeRliwAOTTCldqHfNZvxBbtmkzJwSrrHNCIAW6U7RH3P03xoTe+18sb/KZkWAHd+quz8G0zt4HISaROFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDR7BLqdtDmpXZVb3ypKdk0dzeED76QK8tQeoET9OPk=;
 b=HvI0vfMsdvnI1C/5/cR05ERl4SKUenjs+yQTveVOOWPIDFS3QJqMxlAOeLsw7o+FW+/9EgXlajthXyLdwba33eYWYmZMr4VVHHwbTZcDFbwgIXGmxfRXdCcAzLoU6iIlVOQH92CHWpKRIuoCOi/lOIMXCSBWpVDefZsrEZPzYEgzzuc2qzmi3GEl7TZE4Xu15k1HDQ9Gey/FH7pQYk7/sauyDaLNRTIk7BtKIVV1C7htZ88Uly9pzIMfxMItZ0cbB1SiB6a9QjoJkXT6pZ6lB6SjTgNK+O9TBxPY/Q3qK5TlYh/+IFRhEvyhOBIv3QnvHMGMdEjqa9rhTZoa5jbLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4194.prod.exchangelabs.com (10.167.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Mon, 7 Oct 2019 20:45:39 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:45:39 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v4 0/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v4 0/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV9T/Xze9sji7woTrO04OGwEO4S+w==
Date:   Mon, 7 Oct 2019 20:45:39 +0000
Message-ID: <BL0PR01MB4835C9E9F358D7DDCEB15167959B0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035df235-5aab-4f01-89ec-08d74b67502c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4194:
x-microsoft-antispam-prvs: <BL0PR01MB4194FBA26B5C66FD174ED184959B0@BL0PR01MB4194.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(305945005)(6916009)(33656002)(7696005)(8936002)(99286004)(25786009)(478600001)(316002)(52536014)(71190400001)(14454004)(5660300002)(74316002)(8676002)(7736002)(2501003)(81156014)(2351001)(71200400001)(81166006)(14444005)(66556008)(3846002)(256004)(66476007)(102836004)(66946007)(76116006)(64756008)(476003)(66446008)(486006)(26005)(66066001)(186003)(6506007)(9686003)(55016002)(6436002)(86362001)(5640700003)(2906002)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4194;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POvsANw4lZQSxwjkOaxa3HPHYNfa1Rp+kH5x87HE90Gd4fZ6tWw3c8G+IA4rKYhsxztJBoyW9TCppV0FjdpHZhKJCbLGZIaMc47nJKyhA9BCSm3kBIr8+TNDhNPaLyBRdHVVjay2ZJYNW5Y5ZFNDrDnrEm9FI6XMSPtpkmNcm0I7xB9cc6CEV7aqb2INjfd+8CsMcvuaI4SXnKBLsHVsK9/q2NUbeK6KQKzQY7sogz/sTicsgdWf3KHi+rzJYFREINmbiU7mKkqGE8lsAM8zr1ODjsgTlwCbMvJRZujiTgofmWnCYN6i2h2wq8S3fMnPlT8nvsKrRNv20FAVxRxz9/v2IKLdOwjIPvs1tg28YMRc4i+NORdzou5hCcQwoy+b4IUHTe/aBr0NGSiLh4FVhMXdOgnCbieHmW1KPJ5ecyQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035df235-5aab-4f01-89ec-08d74b67502c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 20:45:39.3846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19gUjYzVda9LlYzXN5kZYAOyj2akLQCMguVx1/jWOl+34MQ4tZt4dF6brrk5cmhJNIL+2TRJNKlQiAEfJgElHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4194
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910070182
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Version four of the driver for Texas Instruments TMP512/513 sensors.

Thanks again for the review.

Main changes from version 3:
	- Remove tmp51x_config structure, there was no useful static
	  field in the structure. The data was moved to tmp51x_data.
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
  hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
  dt-bindings: Add TMP512/513 documentation

 .../devicetree/bindings/hwmon/tmp513.txt      |  32 +
 Documentation/hwmon/tmp513.rst                | 102 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 795 ++++++++++++++++++
 6 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

--=20
2.17.1

