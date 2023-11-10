Return-Path: <linux-hwmon+bounces-5-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE3C4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:01 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EAB2280FA0
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4DC3D984;
	Fri, 10 Nov 2023 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE733D3BA
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 17:47:03 +0000 (UTC)
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0693A232;
	Fri, 10 Nov 2023 07:16:52 -0800 (PST)
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AABD1E9017094;
	Fri, 10 Nov 2023 10:16:28 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3u9kew0t7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 10:16:27 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 3AAFGQRW046167
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Nov 2023 10:16:26 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Nov
 2023 10:16:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Nov 2023 10:16:25 -0500
Received: from nsa.sphairon.box ([10.44.3.69])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3AAFGA0K029635;
	Fri, 10 Nov 2023 10:16:12 -0500
From: Nuno Sa <nuno.sa@analog.com>
To: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Nuno Sa
	<nuno.sa@analog.com>,
        Rob Herring <robh+dt@kernel.org>, Andy Shevchenko
	<andy@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Conor Dooley
	<conor+dt@kernel.org>
Subject: [PATCH 0/2] Add support for LTC4282
Date: Fri, 10 Nov 2023 16:18:44 +0100
Message-ID: <20231110151905.1659873-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.42.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: YWK30L_Ujfd5RueWvzDKxS2m6hl4EQ0b
X-Proofpoint-GUID: YWK30L_Ujfd5RueWvzDKxS2m6hl4EQ0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=812 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100126

Hi all,=0D
=0D
The LTC4282 hot swap controller allows a board to be safely inserted and=0D
removed from a live backplane. Using one or more external N-channel pass=0D
transistors, board supply voltage and inrush current are ramped up at an=0D
adjustable rate. An I2C interface and onboard ADC allows for monitoring=0D
of board current, voltage, power, energy and fault status.=0D
=0D
I'm aware that there are ABI in the driver that will surely raise questions=
.=0D
So, I'll try to add some comments about those:=0D
=0D
- For the fault_log stuff please see the comment in the code. There might b=
e=0D
some scenarios where one might really want to latch off the device until a=
=0D
fault is manually cleared.=0D
- I also see value in the FET interfaces as they are real faults but maybe=
=0D
the naming is poor.=0D
- I'm not so sure about the power1_good and the power1_fault_log. The=0D
power1_good is more of a real status bit. If the bit is 0, it does not=0D
necessarily means that there's something wrong. If someone removed=0D
(on purpose) the "load", then this will be 0 and there's nothing wrong.=0D
The fault_log is also not one of those bits that will keep the device to=0D
latch on again. However, they might really indicate some misbehave. But,=0D
OTOH (again :)), maybe the GPIO support for this is enough...=0D
- There's also the handling for the overflow bits. I don't think it makes=0D
much sense to export those so I tried to be clever and automatically handle=
=0D
it the driver. The power_average is the thing making the whole thing more=0D
complicated. If it was only the energy, we could defer it completely to=0D
userspace...=0D
- And there's also the rsense as a mandatory property. Designs like this=0D
completely depend on the calculated rsense so I have no idea (and if it=0D
makes sense) what default should I use if the property is not given.=0D
=0D
I'm also cc'ing the GPIO folks for the GPIO bits. And I'm also not so sure=
=0D
about it. I'm just treating the pins as if I can set value + direction. How=
ever,=0D
the only thing that we can do is to PULL_LOW and set the pins in HIGH_Z. So=
,=0D
I dunno I'm doing the right thing. I wonder if I should just give the abili=
ty=0D
to configure the pins through FW with the .set_config hook and then just=0D
allow to read the pin level? The GPIO1 is also odd since is only the one=0D
that directly allows you to control the direction but then, again, you=0D
can just pull it low or high-z.=0D
=0D
One last comment is about lines length. I know some maintainer still want=0D
the 80 col limit but since I'm not so sure on the policy in hwmon I just=0D
went for 100. I'm pretty sure I'll need more iterations to get the driver=0D
in, so I'm happy to change it to 80 if required.=0D
=0D
Nuno Sa (2):=0D
  dt-bindings: hwmon: Add LTC4282 bindings=0D
  hwmon: ltc4282: add support for the LTC4282 chip=0D
=0D
 .../bindings/hwmon/adi,ltc4282.yaml           |  228 +++=0D
 Documentation/hwmon/ltc4282.rst               |  101 ++=0D
 MAINTAINERS                                   |    8 +=0D
 drivers/hwmon/Kconfig                         |   11 +=0D
 drivers/hwmon/Makefile                        |    1 +=0D
 drivers/hwmon/ltc4282.c                       | 1518 +++++++++++++++++=0D
 6 files changed, 1867 insertions(+)=0D
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4282.yam=
l=0D
 create mode 100644 Documentation/hwmon/ltc4282.rst=0D
 create mode 100644 drivers/hwmon/ltc4282.c=0D
=0D
-- =0D
2.42.1=0D
=0D

