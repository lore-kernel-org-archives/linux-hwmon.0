Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62A3C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EAF1610CC
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJNNCh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:02:37 -0400
Received: from mail-eopbgr40091.outbound.protection.outlook.com ([40.107.4.91]:63838
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230373AbhJNNCh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:02:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjzvU84KpARBUsxqIlZ5NVdg+84QSP0Gg3hxKYr4zaxdKaDG8J4LW64rTXLwnjOZ58zdr66WGoyuG+FP9nF19u96qjRUdq4pO9t9tMX99u37/1ETnAUMStk3ZZ5kh+s040d/hdW4CygPuHGPuiMKkWrBrHqD5GYG+ciRx94IbzigP4sMBmlhpVMX4wmmLeyYFVE6XJQW9vIPhryW7/lq5E/pu/N4w2BYCh6QdPUYucVb89QAbiL/lso1aNpSSDnIhupDncK9KfdasKF7vzp353uvZ7ksOr40aIbSS0klapRkXhHFIyWETDPBs9g7o3XGsxxh9+3BJS1wRIkwpv++Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=je1W1uQI3rO/l14hrw4fuzO9Erna2KDNm4Hmy0CJxR1H7+UDnMA0JLveg5YFHdQl1Ujn0+5gFvBzgmADYFDwhjcqGDnnEwBD8M+CtA2oogHffDoB1/YaN7a229U1uecMJxVh2OhxWZmzJXb9aecblOoZtv8dZnoov7lQlQhFjEUIREepuEFBApN6G2+HD5lAaGh30+mctuK+WJfZVmxVzUdKGZ1YvoyIPfmPMNcxPqjyE3Oo6cA9o1U6XsWhDxEgjRfuImuerJB+0YRYZ30lps/Oin78IdjtG6rLNzWpoCq68j56hCmnUMlEQ/1x/GBf8jrl2fCIsqKkngYCPnFVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=rCvGnpV5y5TuiEdz+COwq2cLTLB+kXCK6TksLJ+2/Y6CKv6r1DaDZo/w1xdJv0IvXxhyufRGcsCD+6DQS5+2MYcQyo6iRzERrbh/XgP3k+C7baalezLX0x8IUzy94kAxyfBq17pT09tJ9CyH+OfOC+/HnOkQ4qhdYBcGJMAytBY=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8233.eurprd07.prod.outlook.com (2603:10a6:20b:378::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4; Thu, 14 Oct
 2021 13:00:30 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:00:30 +0000
Date:   Thu, 14 Oct 2021 15:00:25 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <84ac871e30a406a1613d140a084b4f3390753099.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: DB8PR03CA0027.eurprd03.prod.outlook.com
 (2603:10a6:10:be::40) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by DB8PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:10:be::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 13:00:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f2943e-69f3-4f69-72ec-08d98f1299fe
X-MS-TrafficTypeDiagnostic: AS8PR07MB8233:
X-Microsoft-Antispam-PRVS: <AS8PR07MB823324B8156061E787A39ACAEFB89@AS8PR07MB8233.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvfB4/lnGiPOsA+TdsXfgR3cvPYyZotytxYJ2Qa0B3OPM/TDGMTr/l66nGziZaPwS5Zf/pWYuMW3ILK7DQKNiyrBCfVuwkFKqZvv8VVfSp5If/Oxu+0fbBlfvc+r6eEIUjE4QgSR54hTb5RCS2idtIDRSGEboKMTE8jcy3MO/dHinzrfGQrOiOQP60QhIaYDryWf4wJWsL9Y/gQy2MGFO1auebVutbFnMQWu/FaX19m02PKndyYv6qE5j5jalYxHz17tXaVc4+6bH8q9MOMetrTIFsnUiTenbZ2aVe5cj3CmUKjVA1yYEa848FRhUWV24WlucA5HQPHmzFZy2lFUj13bdSlIYpBOQkAXPuHDFm3lTquEsG1eZ3jgCZ6ESZFw3R8HQtiJ0KPRSZ5Oeztu3e4j/KQC3ulZnwTN9j4Mm4d9Zjq9rBC1c6nC4T8bf/9NwxIBCCD0z5xPAr9FfeDXS+VPLIm+9NKoRbwGz6mGk6X0eEua+IKz0pJNbIwf53/9ZC7yU+XDyzssp+V+cjsPX3WQ2MqKN8CKMxmOs7bnanREBx3ix89X3lhqJZ7PiC8Kx3aMC3gnFYk4+CLsos/5/1xqnEbUMO0eplKRV8dCD5fGvxTdAIZHOu5HDPoOsGMVtpFLCXsc6HwJXxA1r7lV51xdGGxu6BIfxZCwE8Mm5Lx9szUH8F5lftseeWABlRQB36O0VcHK/+ZbTubZ8LauYEmQg6rufUYOQKeTbJcpRRAFXBoJwFEtbWuVlty87UYXbEH5e/YM/RZk40Po5/AQHy+jmDXGKGDtCLulkjPqNps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(38350700002)(6486002)(38100700002)(52116002)(8676002)(316002)(5660300002)(508600001)(6512007)(44832011)(2616005)(82960400001)(26005)(86362001)(6506007)(4326008)(6666004)(8936002)(186003)(66476007)(2906002)(36756003)(956004)(66556008)(966005)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WRRbexncg/x5jtGHwd7DO2nqpO4BAQgrW5GZSDKLGowRooYx0szl255R+/?=
 =?iso-8859-1?Q?At/vXaI/yS5O0POFhT+uQ0Z6pBCu2pnlvfg16A0f3XgzHXN8ijL8LnsYdh?=
 =?iso-8859-1?Q?FmFg9TkG3FoRAtj2BGb/fkckAmcEyNP4TuhUGto/cSzYyZ1sJzixhodEcy?=
 =?iso-8859-1?Q?SdMJcGgBo0b9o9qqB1HoFci+96E4V0OPY9C9p/E6QHKmRFAc1uF0+UJqQi?=
 =?iso-8859-1?Q?Bze6vK33za1ZT6RQWSDmy+zJ4zX3X7QqTA5IeFT//nzF+XmnGZQ2zT4B+r?=
 =?iso-8859-1?Q?Qnt3x5HoXrdReesuYqdKmb26dIuUo5JmvCbdkvnH3bgC/ZlNJuYUaj5JGe?=
 =?iso-8859-1?Q?iZWdyMUvXbCJailB+WwTtgEcZ4hvlbrDcTHpDvGJJpvNeKrh/Bx1+Hy/jE?=
 =?iso-8859-1?Q?oYtd92NTXoHDND4kIfUAD0zQ/MdQSVdEp2q1BUAjdztFwzYuiQLufnVOJm?=
 =?iso-8859-1?Q?J+q50FVGfVGDIXAO820icks4svJDCHoGdwQDWXZ/qphDER8reFpXPzCXEf?=
 =?iso-8859-1?Q?WduT7alU2ayCzx7Yj+lrvOArh8k0XBFN3K0SxxsE35LjwyjDZWRqrHQeWw?=
 =?iso-8859-1?Q?LojO2HxIibYSiLdXet0XiV9VVZeJk9+DOZ4jXb28vHkNaUk+un7cqazPz4?=
 =?iso-8859-1?Q?8aSNfPjmcckDZ2OT+Jm+mZKEsOZJ5JzYyEHaQuGdgBepTHaGpJk16NyMrO?=
 =?iso-8859-1?Q?HAuJGxdEJ6yeaGUOQNQCWVU5SJJBZ+9a9jXqE//jWrICyHr7xglBmmrXy0?=
 =?iso-8859-1?Q?dpsENTgdMryVYrSIaF9I/HsJS8w4vWR8Lrygkq1voUcQ2NayZE2sAMkkk+?=
 =?iso-8859-1?Q?c7YPzlwn1S1BaV3c1u+CNIevHx3Q5v9GMoceBAudoZ2IAI9pYVefh6/U61?=
 =?iso-8859-1?Q?ekV3Ya289K8Q7ffbyQmnRU6pfrA/JP5Na+G6EvDESC/Z9A+x4wHprPJrnl?=
 =?iso-8859-1?Q?Td3liTIfQbHyrRxmOmYqTRgZb71mZqOpFHhKWYkiawU+qwntRsDl5b5O0g?=
 =?iso-8859-1?Q?Rn91U4H5NEOLmtF5YREQKolU0TGkjipIc+Tv+GTZTtUjkrMRXhIMVxqntF?=
 =?iso-8859-1?Q?QFuSz+eD1Ss7QZz4kP/8xqTVJ3oX0lEiZ7SuS8ffYG13PNwxXlhYHRfNee?=
 =?iso-8859-1?Q?zjmqW8ItVunWUfMEmGoK/83MkCv0hlamCKkQReD4rm5c6iZSu5mLwSb3DD?=
 =?iso-8859-1?Q?1bKLKxM2oerkSAkntSfLmgnzfpfbvb6KWzCo5LnGoYwA0uNR7w0OLhOcSx?=
 =?iso-8859-1?Q?JxvSGIm/JiDikvgYRPM1mWxJ15dZ8Br4Qy1Ba8zh2NCnKDcysJafsRfXTx?=
 =?iso-8859-1?Q?dfzzs90Yes1dGH2FFrHVNDcT+XpbiNlhKkokNaPLJf3S4UTg9iE9zjXY/E?=
 =?iso-8859-1?Q?cM/zVDLR6o?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f2943e-69f3-4f69-72ec-08d98f1299fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:00:30.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eE7GiGTxuGPbQk3Z3SJO4qdlBWyfMwlWAfVU2siuVd3NFMuuHdLZIkj+HBq2iMH15yMnXJAHYoX8b8G+ZKrczjDPiwqSV5/AwSACpr/4nak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8233
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add basic description of the tmp421 driver DT bindings.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
  1 file changed, 43 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
new file mode 100644
index 000000000000..47040ace4f73
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tmp421.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP42x/TMP44x temperature sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  ±1°C Remote and Local temperature sensor
+  https://www.ti.com/lit/ds/symlink/tmp422.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp421
+      - ti,tmp422
+      - ti,tmp423
+      - ti,tmp441
+      - ti,tmp442
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4c {
+        compatible = "ti,tmp422";
+        reg = <0x4c>;
+      };
+    };
-- 
2.31.1

