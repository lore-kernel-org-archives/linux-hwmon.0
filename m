Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54722 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbeJaFUb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 01:20:31 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (adt7475) document mapping of sysfs entries to inputs
Date: Wed, 31 Oct 2018 09:25:27 +1300
Message-Id: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

As per the usual standard with hwmon drivers the mapping to sysfs
entries follows the register map of the device e.g. in0_input
corresponds to the register 0x20, in1_input corresponds to 0x21 etc.

Hardware designers tend to work with input pins instead of registers
which is where things start to get confusing. A hardware designer might
say "the 1.5V rail is connected to the VCCP pin" leaving the software
designer none the wiser as to which of the sysfs entries should be
associated with the label "1.5V".

Try to bridge the gap by documenting the mapping of sysfs entries to
the corresponding pins. This should allow someone to create a
configuration file or other mapping without needing to dive into the
code and ADT datasheets.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
After being given numerous hardware designs over the years using ADT chip=
s for
hardware monitoring I found myself always having to read the schematic, A=
DT
datasheet and the adt7475.c driver.

I was about to document this mapping on an internal wiki page but I figur=
ed
it's probably of interest to the wider community. Hence this patch.

I've only documented the voltage mapping as the pwm and temperature and
tachometer pins appear to have reasonably sensible naming.

=20Documentation/hwmon/adt7475 | 12 ++++++++++++
=201 file changed, 12 insertions(+)

diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475
index 09d73a10644c..01b46b290532 100644
--- a/Documentation/hwmon/adt7475
+++ b/Documentation/hwmon/adt7475
@@ -79,6 +79,18 @@ ADT7490:
=20  * 2 GPIO pins (not implemented)
=20  * system acoustics optimizations (not implemented)
=20
+Sysfs Mapping
+-------------
+
+     ADT7490     ADT7476     ADT7475   ADT7473
+     -------     -------     -------   -------
+in0  2.5VIN (22) 2.5VIN (22) -         -
+in1  VCCP   (23) VCCP   (23) VCCP (14) VCCP (14)
+in2  VCC    (4)  VCC    (4)  VCC  (4)  VCC  (3)
+in3  5VIN   (20) 5VIN   (20)
+in4  12VIN  (21) 12VIN  (21)
+in5  VTT    (8)
+
=20Special Features
=20----------------
=20
--=20
2.19.1
