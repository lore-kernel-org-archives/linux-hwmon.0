Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34909 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1426000AbdEAIpU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 May 2017 04:45:20 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A930C8023A
        for <linux-hwmon@vger.kernel.org>; Mon,  1 May 2017 20:45:17 +1200 (NZST)
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Enabling enhanced acoustics on adt7475
Date: Mon, 1 May 2017 08:45:14 +0000
Message-ID: <5b96df9d2ea649daa5f5b8a3896280c4@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,=0A=
=0A=
I'm looking at adding code to configure the enhanced acoustics on the =0A=
ADT7475 and compatible devices.=0A=
=0A=
I'm wondering if I should be adding these as device-tree properties or =0A=
as sysfs attributes. And in either case how these properties/attributes =0A=
should behave. The main impact of this would be to provide a mechanism =0A=
for configuring how fast the pwm output will change.=0A=
=0A=
The fact that I wrote "configuring" above makes me lean towards sysfs =0A=
attributes. Nothing in Documentation/hwmon/sysfs-interface really covers =
=0A=
this. dme1737.c has a pwmN_ramp_rate which would seem close to what I =0A=
want. Is there any other precedent I should follow?=0A=
=0A=
Thanks in advance,=0A=
Chris=0A=
